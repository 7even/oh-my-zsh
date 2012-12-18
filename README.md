# Description

This cookbook installs zsh and configures oh-my-zsh framework for the specified users. A rewrite of https://github.com/shingara/oh-my-zsh-chef.

# Requirements

This cookbook depends on opscode [zsh](https://github.com/opscode-cookbooks/zsh) and fnichol's [git](https://github.com/fnichol/chef-git) cookbooks.

# Attributes

* `node['oh-my-zsh']['users']` - users and their settings overrides, e.g.

```json
[
  {
    "login": "vaskas",
    "theme": "sorin"
  },
  {
    "login": "root",
    "plugins": ["rvm", "git"]
  },
  {
    "login": "jenkins",
    "home": "/var/lib/jenkins"
  }
]
```

* `node['oh-my-zsh']['theme']` - theme to use for all users unless overridden. Default value is `alanpeabody`.
* `node['oh-my-zsh']['plugins']` - plugins to use for all users unless overridden. Default value is `["git", "ruby", "gem"]`.
* `node['oh-my-zsh']['case_sensitive']` - whether zsh autocompletion should be case-sensitive. Default value is `false`.

# Usage

Include `recipe[oh-my-zsh]` in your run\_list and specify `node['oh-my-zsh']['users']`.

# License and Author

Copyright (c) 2012, Vasily Mikhaylichenko

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
