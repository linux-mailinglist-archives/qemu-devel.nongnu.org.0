Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E756B7EB8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 18:05:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pblbq-00069Q-8N; Mon, 13 Mar 2023 13:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pblbn-000698-EM
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:05:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pblbl-0002GD-3n
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678727112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Gvk/fUw6JQpK/pQGTesGBzy3rpnM3Ul+CQUKwq4DZbg=;
 b=BJdm49jcRGVVX0lUz+bb2C/wlu7EYzMRGpo9laUpAazzRK2SL04X+VFFmKyJFIxaHI+jbJ
 ET6R8p0d31BGQE95OdacB9vYPFA0ca7eOqsoH7hxzuRS5U1190drcwRrf23OfJkMERzBVV
 C3QaopWLz8gnd+qCyIyYBc+68K1R8wk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-2MgtRP6iPoGg0YK_PY_kAA-1; Mon, 13 Mar 2023 13:05:10 -0400
X-MC-Unique: 2MgtRP6iPoGg0YK_PY_kAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E90680352D;
 Mon, 13 Mar 2023 17:05:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F5C940C6E67;
 Mon, 13 Mar 2023 17:05:07 +0000 (UTC)
Date: Mon, 13 Mar 2023 17:05:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, peter.maydell@linaro.org,
 thuth@redhat.com, alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH 09/10] Python: Drop support for Python 3.6
Message-ID: <ZA9Xv0Mt2b39lVmS@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-10-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230222143752.466090-10-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 22, 2023 at 03:37:51PM +0100, Paolo Bonzini wrote:
> Python 3.6 was EOL 2021-12-31. Newer versions of upstream libraries have
> begun dropping support for this version and it is becoming more
> cumbersome to support. Avocado-framework and qemu.qmp each have their
> own reasons for wanting to drop Python 3.6, but won't until QEMU does.
> 
> Versions of Python available in our supported build platforms as of today,
> with optional versions available in parentheses:
> 
> openSUSE Leap 15.4: 3.6.15 (3.9.10, 3.10.2)
> CentOS Stream 8:    3.6.8  (3.8.13, 3.9.16)
> CentOS Stream 9:    3.9.13
> Fedora 36:          3.10
> Fedora 37:          3.11
> Debian 11:          3.9.2
> Alpine 3.14, 3.15:  3.9.16
> Alpine 3.16, 3.17:  3.10.10
> Ubuntu 20.04 LTS:   3.8.10
> Ubuntu 22.04 LTS:   3.10.4
> NetBSD 9.3:         3.9.13*
> FreeBSD 12.4:       3.9.16
> FreeBSD 13.1:       3.9.16
> OpenBSD 7.2:        3.9.16
> 
> Note: Our VM tests install 3.7 specifically for freebsd and netbsd; the
> default for "python" or "python3" in FreeBSD is 3.9.16. NetBSD does not
> appear to have a default meta-package, but offers several options, the
> lowest of which is 3.7.15. "python39" appears to be a pre-requisite to
> one of the other packages we request in tests/vm/netbsd.
> 
> Since it is safe to under our supported platform policy, bump our
> minimum supported version of Python to 3.7.

In the above list of versions, there's no platform which actually
has 3.7 as a limiting factor. THe only mention of 3.7 comes from
our own VM scripts, which for freebsd is outdated compared to
their default, and for netbsd the 3.7 choice appears arbitrary
on our side given their lack of default.

Ubuntu 20.04 on 3.8 would be the hard constraint out of the above
list of distros.

Our normal practice wrt the support policy would be to go to the
baseline from the above distro list. IOW, if we're dropping 3.6,
then going to 3.8 would be the normal course of action, rather
than stopping at 3.7 which doesn't appear needed by our targetted
distros.

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure                |  8 ++++----
>  python/Makefile          | 10 +++++-----
>  python/setup.cfg         |  7 +++----
>  python/tests/minreqs.txt |  2 +-
>  scripts/qapi/mypy.ini    |  2 +-
>  5 files changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/configure b/configure
> index 762b8397a7b7..476d8a38b900 100755
> --- a/configure
> +++ b/configure
> @@ -594,9 +594,9 @@ esac
>  
>  
>  check_py_version() {
> -    # We require python >= 3.6.
> +    # We require python >= 3.7.
>      # NB: a True python conditional creates a non-zero return code (Failure)
> -    "$1" -c 'import sys; sys.exit(sys.version_info < (3,6))'
> +    "$1" -c 'import sys; sys.exit(sys.version_info < (3,7))'
>  }
>  
>  python=
> @@ -605,7 +605,7 @@ if test -z "${PYTHON}"; then
>      explicit_python=no
>      # A bare 'python' is traditionally python 2.x, but some distros
>      # have it as python 3.x, so check in both places.
> -    for binary in python3 python python3.11 python3.10 python3.9 python3.8 python3.7 python3.6; do
> +    for binary in python3 python python3.11 python3.10 python3.9 python3.8 python3.7; do
>          if has "$binary"; then
>              python=$(command -v "$binary")
>              if check_py_version "$python"; then
> @@ -1069,7 +1069,7 @@ then
>  fi
>  
>  if ! check_py_version "$python"; then
> -  error_exit "Cannot use '$python', Python >= 3.6 is required." \
> +  error_exit "Cannot use '$python', Python >= 3.7 is required." \
>        "Use --python=/path/to/python to specify a supported Python."
>  fi
>  
> diff --git a/python/Makefile b/python/Makefile
> index c5bd6ff83ac9..f660d9991437 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -9,14 +9,14 @@ help:
>  	@echo "make check-minreqs:"
>  	@echo "    Run tests in the minreqs virtual environment."
>  	@echo "    These tests use the oldest dependencies."
> -	@echo "    Requires: Python 3.6"
> -	@echo "    Hint (Fedora): 'sudo dnf install python3.6'"
> +	@echo "    Requires: Python 3.7"
> +	@echo "    Hint (Fedora): 'sudo dnf install python3.7'"
>  	@echo ""
>  	@echo "make check-tox:"
>  	@echo "    Run tests against multiple python versions."
>  	@echo "    These tests use the newest dependencies."
> -	@echo "    Requires: Python 3.6 - 3.10, and tox."
> -	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
> +	@echo "    Requires: Python 3.7 - 3.11, and tox."
> +	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.11'"
>  	@echo "    The variable QEMU_TOX_EXTRA_ARGS can be use to pass extra"
>  	@echo "    arguments to tox".
>  	@echo ""
> @@ -58,7 +58,7 @@ pipenv check-pipenv:
>  min-venv: $(QEMU_MINVENV_DIR) $(QEMU_MINVENV_DIR)/bin/activate
>  $(QEMU_MINVENV_DIR) $(QEMU_MINVENV_DIR)/bin/activate: setup.cfg tests/minreqs.txt
>  	@echo "VENV $(QEMU_MINVENV_DIR)"
> -	@python3.6 -m venv $(QEMU_MINVENV_DIR)
> +	@python3.7 -m venv $(QEMU_MINVENV_DIR)
>  	@(								\
>  		echo "ACTIVATE $(QEMU_MINVENV_DIR)";			\
>  		. $(QEMU_MINVENV_DIR)/bin/activate;			\
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 9e923d97628f..1e8392a045c3 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -14,7 +14,6 @@ classifiers =
>      Natural Language :: English
>      Operating System :: OS Independent
>      Programming Language :: Python :: 3 :: Only
> -    Programming Language :: Python :: 3.6
>      Programming Language :: Python :: 3.7
>      Programming Language :: Python :: 3.8
>      Programming Language :: Python :: 3.9
> @@ -23,7 +22,7 @@ classifiers =
>      Typing :: Typed
>  
>  [options]
> -python_requires = >= 3.6
> +python_requires = >= 3.7
>  packages =
>      qemu.qmp
>      qemu.machine
> @@ -76,7 +75,7 @@ exclude = __pycache__,
>  
>  [mypy]
>  strict = True
> -python_version = 3.6
> +python_version = 3.7
>  warn_unused_configs = True
>  namespace_packages = True
>  warn_unused_ignores = False
> @@ -158,7 +157,7 @@ multi_line_output=3
>  # of python available on your system to run this test.
>  
>  [tox:tox]
> -envlist = py36, py37, py38, py39, py310, py311
> +envlist = py37, py38, py39, py310, py311
>  skip_missing_interpreters = true
>  
>  [testenv]
> diff --git a/python/tests/minreqs.txt b/python/tests/minreqs.txt
> index dfb8abb155f4..55cc6b41d85b 100644
> --- a/python/tests/minreqs.txt
> +++ b/python/tests/minreqs.txt
> @@ -1,5 +1,5 @@
>  # This file lists the ***oldest possible dependencies*** needed to run
> -# "make check" successfully under ***Python 3.6***. It is used primarily
> +# "make check" successfully under ***Python 3.7***. It is used primarily
>  # by GitLab CI to ensure that our stated minimum versions in setup.cfg
>  # are truthful and regularly validated.
>  #
> diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
> index 662535642974..3463307ddc72 100644
> --- a/scripts/qapi/mypy.ini
> +++ b/scripts/qapi/mypy.ini
> @@ -1,7 +1,7 @@
>  [mypy]
>  strict = True
>  disallow_untyped_calls = False
> -python_version = 3.6
> +python_version = 3.7
>  
>  [mypy-qapi.schema]
>  disallow_untyped_defs = False
> -- 
> 2.39.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


