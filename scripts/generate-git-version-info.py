#!/usr/bin/env python3

import json
import os
import re
from subprocess import Popen, PIPE
from urllib.parse import urlparse

script_dir = os.path.dirname(os.path.abspath(__file__))
repo_dir = os.path.dirname(script_dir)
jsword_dir = os.path.join(repo_dir, "submodules/jsword")
step_dir = os.path.join(repo_dir, "submodules/step")

def get_origin(path):
    os.chdir(path)
    gitremote = Popen(["git", "remote", "get-url", "origin"], stdout=PIPE, text=True)
    stdout, _ = gitremote.communicate()
    remote = stdout.strip()
    https_url = re.match("^https:", remote)
    if https_url:
        url = urlparse(remote)
        return url.netloc + re.sub(r"\.git$", "", url.path)
    ssh_url = re.match(
        r"^(?P<user>[^@]+)@?(?P<host>[^:]+):(?P<path>.+?)(?:\.git)?$", remote
    )
    if ssh_url:
        return f"{ssh_url['host']}/{ssh_url['path']}"
    return remote

def get_sha(path):
    os.chdir(path)
    gitlog = Popen(["git", "log", "-1", "--format=%h"], stdout=PIPE, text=True)
    stdout, _ = gitlog.communicate()
    return stdout.strip()

step_selfhosted_origin = get_origin(repo_dir)
step_selfhosted_sha = get_sha(repo_dir)

jsword_origin = get_origin(jsword_dir)
jsword_sha = get_sha(jsword_dir)

step_origin = get_origin(step_dir)
step_sha = get_sha(step_dir)

data = {}
data[step_selfhosted_origin] = step_selfhosted_sha
data[jsword_origin] = jsword_sha
data[step_origin] = step_sha

print(json.dumps(data, indent=2))
