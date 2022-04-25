Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DF650DE10
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:39:57 +0200 (CEST)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niw8J-0001im-RM
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niw68-0000Cc-CB
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niw65-0006gE-M4
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650883057;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0qIupDGWk/gdvCs6ZSnT15fZiBt7eYS0PJBgRIrzP6Q=;
 b=FkOCg5hACkQEs6z2n5ajbUb3cajCcgvNS1WR3LLzk24IOQBuVLueD8TRW0UnJSVgU8X54+
 YKZQwiuolw4Tyi6qubY/HF6QOe/yvBwePdm0nDf6iemGa8QlQURvTFd5NOTVXSBxHrHGIZ
 lRc/RAe0I+YG+P6o8owQwkZL/qzLcdU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-ixe3ZlU3PuSk7ahAe7neDA-1; Mon, 25 Apr 2022 06:37:35 -0400
X-MC-Unique: ixe3ZlU3PuSk7ahAe7neDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FBEB1C05AFA
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 10:37:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B42B111F3C7;
 Mon, 25 Apr 2022 10:37:33 +0000 (UTC)
Date: Mon, 25 Apr 2022 11:37:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 01/12] fork qemu.qmp from qemu.git
Message-ID: <YmZ567xK3o7kWBjE@redhat.com>
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-2-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220422184940.1763958-2-jsnow@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 02:49:29PM -0400, John Snow wrote:
> Split python/ from qemu.git, using these commands:
> 
> > git subtree split -P python/ -b python-split-v3
> > mkdir ~/src/tmp
> > cd ~/src/tmp
> > git clone --no-local --branch python-split-v3 --single-branch ~/src/qemu
> > cd qemu
> > git filter-repo --path qemu/machine/           \
>                   --path qemu/utils/             \
>                   --path tests/iotests-mypy.sh   \
>                   --path tests/iotests-pylint.sh \
>                   --invert-paths

So you're saying the repository is initialized with the output from
the above commands, and then this commit is the first one on top
of that.

> This commit, however, only performs some minimum cleanup to reflect the
> deletion of the other subpackages. It is not intended to be exhaustive,
> and further edits are made in forthcoming commits.
> 
> These fixes are broken apart into micro-changes to facilitate mailing
> list review subject-by-subject. They *could* be squashed into a single
> larger commit on merge if desired, but due to the nature of the fork,
> bisectability across the fork boundary is going to be challenging
> anyway. It may be better value to just leave these initial commits
> as-is.

Yep, I think bisectability is impractical to achieve across this kind
of split. I think the filtered git history is simply there as a  way
to give credit to the original authors, for historical research and
to make 'git blame' work. 

IOW, I'd declare bitsectability starts at the end of this patch
series, as a goal.

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  .gitignore |  2 +-
>  Makefile   | 16 ++++++++--------
>  setup.cfg  | 24 +-----------------------
>  setup.py   |  2 +-
>  4 files changed, 11 insertions(+), 33 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 904f324..b071f02 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -5,7 +5,7 @@
>  # python packaging
>  build/
>  dist/
> -qemu.egg-info/
> +qemu.qmp.egg-info/
>  
>  # editor config
>  .idea/
> diff --git a/Makefile b/Makefile
> index 3334311..a2d2f2c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -30,7 +30,7 @@ help:
>  	@echo ""
>  	@echo "make develop:"
>  	@echo "    Install deps needed for for 'make check',"
> -	@echo "    and install the qemu package in editable mode."
> +	@echo "    and install the qemu.qmp package in editable mode."
>  	@echo "    (Can be used in or outside of a venv.)"
>  	@echo ""
>  	@echo "make pipenv"
> @@ -43,7 +43,7 @@ help:
>  	@echo "    Remove package build output."
>  	@echo ""
>  	@echo "make distclean:"
> -	@echo "    remove pipenv/venv files, qemu package forwarder,"
> +	@echo "    remove pipenv/venv files, qemu.qmp package forwarder,"
>  	@echo "    built distribution files, and everything from 'make clean'."
>  	@echo ""
>  	@echo -e "Have a nice day ^_^\n"
> @@ -64,11 +64,11 @@ dev-venv: $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate
>  $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
>  	@echo "VENV $(QEMU_VENV_DIR)"
>  	@python3 -m venv $(QEMU_VENV_DIR)
> -	@(							\
> -		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
> -		. $(QEMU_VENV_DIR)/bin/activate;		\
> -		echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";	\
> -		make develop 1>/dev/null;			\
> +	@(								\
> +		echo "ACTIVATE $(QEMU_VENV_DIR)";			\
> +		. $(QEMU_VENV_DIR)/bin/activate;			\
> +		echo "INSTALL qemu.qmp[devel] $(QEMU_VENV_DIR)";	\
> +		make develop 1>/dev/null;				\
>  	)
>  	@touch $(QEMU_VENV_DIR)
>  
> @@ -106,6 +106,6 @@ clean:
>  
>  .PHONY: distclean
>  distclean: clean
> -	rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> +	rm -rf qemu.qmp.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
>  	rm -f .coverage .coverage.*
>  	rm -rf htmlcov/
> diff --git a/setup.cfg b/setup.cfg
> index e877ea5..4ffab73 100644
> --- a/setup.cfg
> +++ b/setup.cfg
> @@ -1,5 +1,5 @@
>  [metadata]
> -name = qemu
> +name = qemu.qmp
>  version = file:VERSION
>  maintainer = QEMU Developer Team
>  maintainer_email = qemu-devel@nongnu.org
> @@ -25,8 +25,6 @@ classifiers =
>  python_requires = >= 3.6
>  packages =
>      qemu.qmp
> -    qemu.machine
> -    qemu.utils
>  
>  [options.package_data]
>  * = py.typed
> @@ -38,7 +36,6 @@ packages =
>  devel =
>      avocado-framework >= 90.0
>      flake8 >= 3.6.0
> -    fusepy >= 2.0.4
>      isort >= 5.1.2
>      mypy >= 0.780
>      pylint >= 2.8.0
> @@ -47,10 +44,6 @@ devel =
>      urwid-readline >= 0.13
>      Pygments >= 2.9.0
>  
> -# Provides qom-fuse functionality
> -fuse =
> -    fusepy >= 2.0.4
> -
>  # QMP TUI dependencies
>  tui =
>      urwid >= 2.1.2
> @@ -59,13 +52,6 @@ tui =
>  
>  [options.entry_points]
>  console_scripts =
> -    qom = qemu.utils.qom:main
> -    qom-set = qemu.utils.qom:QOMSet.entry_point
> -    qom-get = qemu.utils.qom:QOMGet.entry_point
> -    qom-list = qemu.utils.qom:QOMList.entry_point
> -    qom-tree = qemu.utils.qom:QOMTree.entry_point
> -    qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
> -    qemu-ga-client = qemu.utils.qemu_ga_client:main
>      qmp-shell = qemu.qmp.qmp_shell:main
>      qmp-shell-wrap = qemu.qmp.qmp_shell:main_wrap
>      qmp-tui = qemu.qmp.qmp_tui:main [tui]
> @@ -80,19 +66,12 @@ python_version = 3.6
>  warn_unused_configs = True
>  namespace_packages = True
>  
> -[mypy-qemu.utils.qom_fuse]
> -# fusepy has no type stubs:
> -allow_subclassing_any = True
> -
>  [mypy-qemu.qmp.qmp_tui]
>  # urwid and urwid_readline have no type stubs:
>  allow_subclassing_any = True
>  
>  # The following missing import directives are because these libraries do not
>  # provide type stubs. Allow them on an as-needed basis for mypy.
> -[mypy-fuse]
> -ignore_missing_imports = True
> -
>  [mypy-urwid]
>  ignore_missing_imports = True
>  
> @@ -164,7 +143,6 @@ skip_missing_interpreters = true
>  allowlist_externals = make
>  deps =
>      .[devel]
> -    .[fuse]  # Workaround to trigger tox venv rebuild
>      .[tui]   # Workaround to trigger tox venv rebuild
>  commands =
>      make check
> diff --git a/setup.py b/setup.py
> index c5bc459..aba951a 100755
> --- a/setup.py
> +++ b/setup.py
> @@ -1,6 +1,6 @@
>  #!/usr/bin/env python3
>  """
> -QEMU tooling installer script
> +QEMU QMP library installer script
>  Copyright (c) 2020-2021 John Snow for Red Hat, Inc.
>  """
>  
> -- 
> 2.34.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


