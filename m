Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E08E6CD9B5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 14:54:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVJW-00012d-3Y; Wed, 29 Mar 2023 08:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phVJD-00011r-KS
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:53:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phVJA-0003PU-SK
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680094420;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vuiPfDCONe2rqbi1k+nAyx4xEusD6dX0wFqWPQ5Sb90=;
 b=N9eDe9UDzOyVJ7OdLLkokddniHIv2m8L/1Eu8AhH+mBjSlU4zqdaEwGxFrANqrtuQzYkdF
 EH8K7l8NLsEHSQQIwkZEppRLA489PaUvpqoAhor8TIkVjXUnedl0oGPbF2CiS6c1OkhNC6
 c3bCxhZsDQ3n69uKLEsSJf5q53pBZ+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-GFD750_NO7awqioPBVe7oQ-1; Wed, 29 Mar 2023 08:53:37 -0400
X-MC-Unique: GFD750_NO7awqioPBVe7oQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A6D2802D1A;
 Wed, 29 Mar 2023 12:53:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52281492B03;
 Wed, 29 Mar 2023 12:53:30 +0000 (UTC)
Date: Wed, 29 Mar 2023 13:53:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: [RFC PATCH 3/3] configure: install meson to a python virtual
 environment
Message-ID: <ZCQ0x3cDXOUsSX76@redhat.com>
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <20230328211119.2748442-4-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230328211119.2748442-4-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

On Tue, Mar 28, 2023 at 05:11:19PM -0400, John Snow wrote:
> This patch changes how we detect and install meson.
> 
> This patch creates a lightweight Python virtual environment using the
> user's configured $python that inherits system packages. If Meson is
> installed there and meets our minimum version requirements, we will use
> that Meson.
> 
> In the event that Meson is installed but *not for the chosen Python
> interpreter*, not found, or of insufficient version, we will attempt to
> install Meson from source into the newly created Python virtual
> environment.
> 
> At present, the source is obtained in the same manner as it has been;
> preferring git submodules first and relying on vendored source as a
> backup.
> 
> This patch does *not* connect to PyPI and will work offline for all
> supported build platforms. Future improvements to this patch may add
> optional PyPI support as a replacement for git submodules.
> 
> As a result of this patch, the Python interpreter we use for both our
> own build scripts *and* Meson extensions are always known to be the
> exact same Python. As a further benefit, there will also be a symlink
> available in the build directory that points to the correct, configured
> python and can be used by e.g. manual tests to invoke the correct,
> configured Python unambiguously.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  configure                           | 155 +++++++++++++++++++---------

I would love to see a day where configure isn't involved in the
build process. Obviously we can't put this new logic into
meson as its a chicken & egg problem. Could we potentially
have your new  python/scripts/mkvenv.py script be responsible
for setting up meson in the venv though, so we can avoid
adding more shell code to configure ?

>  .gitlab-ci.d/buildtest-template.yml |   2 +-
>  2 files changed, 108 insertions(+), 49 deletions(-)
> 
> diff --git a/configure b/configure
> index 05bed4f4a11..1ec054775f6 100755
> --- a/configure
> +++ b/configure
> @@ -607,7 +607,6 @@ check_py_version() {
>  python=
>  first_python=
>  if test -z "${PYTHON}"; then
> -    explicit_python=no
>      # A bare 'python' is traditionally python 2.x, but some distros
>      # have it as python 3.x, so check in both places.
>      for binary in python3 python python3.11 python3.10 python3.9 python3.8 python3.7 python3.6; do
> @@ -626,7 +625,6 @@ else
>      # Same as above, but only check the environment variable.
>      has "${PYTHON}" || error_exit "The PYTHON environment variable does not point to an executable"
>      python=$(command -v "$PYTHON")
> -    explicit_python=yes
>      if check_py_version "$python"; then
>          # This one is good.
>          first_python=
> @@ -718,7 +716,7 @@ for opt do
>    ;;
>    --install=*)
>    ;;
> -  --python=*) python="$optarg" ; explicit_python=yes
> +  --python=*) python="$optarg"
>    ;;
>    --skip-meson) skip_meson=yes
>    ;;
> @@ -1078,61 +1076,122 @@ if ! check_py_version "$python"; then
>        "Use --python=/path/to/python to specify a supported Python."
>  fi
>  
> -# Resolve PATH + suppress writing compiled files
> -python="$(command -v "$python") -B"
> -
> -has_meson() {
> -  local python_dir=$(dirname "$python")
> -  # PEP405: pyvenv.cfg is either adjacent to the Python executable
> -  # or one directory above
> -  if test -f $python_dir/pyvenv.cfg || test -f $python_dir/../pyvenv.cfg; then
> -    # Ensure that Meson and Python come from the same virtual environment
> -    test -x "$python_dir/meson" &&
> -      test "$(command -v meson)" -ef "$python_dir/meson"
> -  else
> -    has meson
> -  fi
> +# Resolve PATH
> +python="$(command -v "$python")"
> +# This variable is intended to be used only for error messages:
> +target_python=$python
> +
> +# Create a Python virtual environment using our configured python.
> +# The stdout of this script will be the location of a symlink that
> +# points to the configured Python.
> +# Entry point scripts for pip, meson, and sphinx are generated if those
> +# packages are present.
> +
> +# Defaults assumed for now:
> +# - venv is cleared if it exists already;
> +# - venv is allowed to use system packages;
> +# - all setup is performed **offline**;
> +# - No packages are installed by default;
> +# - pip is not installed into the venv when possible,
> +#   but ensurepip is called as a fallback when necessary.
> +
> +echo "python determined to be '$python'"
> +echo "python version: $($python --version)"
> +
> +echo " === pip list (host) === "
> +$python -m pip list --disable-pip-version-check
> +echo " ======================= "
> +echo ""
> +
> +python="$($python -B "${source_path}/python/scripts/mkvenv.py" create --gen pip,meson,sphinx pyvenv)"
> +if test "$?" -ne 0 ; then
> +    error_exit "python venv creation failed"
> +fi
> +
> +# Suppress writing compiled files
> +python="$python -B"
> +echo "Configured python as '$python'"
> +
> +echo " === pip list (venv) === "
> +$python -m pip list --disable-pip-version-check
> +echo " ======================= "
> +echo ""
> +
> +pip_install() {
> +    $python -m pip install -v \
> +            --disable-pip-version-check \
> +            --no-index \
> +            "$@"
>  }
>  
> -if test -z "$meson"; then
> -    if test "$explicit_python" = no && has_meson && version_ge "$(meson --version)" 0.61.5; then
> -        meson=meson
> -    elif test "$git_submodules_action" != 'ignore' ; then
> -        meson=git
> -    elif test -e "${source_path}/meson/meson.py" ; then
> -        meson=internal
> +# OK, let's have some fun!
> +
> +# This install command is intended to either fail or be a NOP;
> +# because we're offline, it's just a convenient version check.
> +if ! pip_install 'meson>=0.61.5'; then
> +    # Either we don't have Meson, or our Meson is too old.
> +    # (Future revisions of this patchset can be less chatty.)
> +    if test -e pyvenv/bin/meson; then
> +        echo "Meson in pyvenv is too old: $(pyvenv/bin/meson --version)"
> +    elif has meson ; then
> +        echo "Meson was found installed on your system," \
> +             "but not for the configured Python interpreter ($target_python)."
> +        echo "(Hint: check '$(which meson)' to see which interpreter its shebang uses.)"
>      else
> -        if test "$explicit_python" = yes; then
> -            error_exit "--python requires using QEMU's embedded Meson distribution, but it was not found."
> -        else
> -            error_exit "Meson not found.  Use --meson=/path/to/meson"
> +        echo "Meson was not found."
> +    fi
> +
> +    # OK, but can we fix it, though? :~)
> +    if test "$git_submodules_action" != 'ignore' ; then
> +        git_submodules="${git_submodules} meson"
> +        echo "Attempting to install meson from git submodule ..."
> +        # Stolen from later in the configure file.
> +        # Is it a problem if we front-load this now and run it again later?
> +        if ! (GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
> +            exit 1
>          fi
> +    elif test -e "${source_path}/meson/setup.cfg" ; then
> +        echo "Attempting to install meson from vendored source ..."
> +    else
> +        # In the future, we could use PyPI as a source if the user allows it.
> +        # For now, you're outta luck!
> +        error_exit "A suitable version of Meson was not found."
>      fi
> -else
> -    # Meson uses its own Python interpreter to invoke other Python scripts,
> -    # but the user wants to use the one they specified with --python.
> +
> +    # If we're here, we have the meson source and we can attempt to
> +    # install it into our venv.
> +
> +    # We want to install meson with --no-use-pep517 if possible,
> +    # because it avoids needing a 'wheel' dependency. Old versions
> +    # of pip do this by default, so test for the behavior.
>      #
> -    # We do not want to override the distro Python interpreter (and sometimes
> -    # cannot: for example in Homebrew /usr/bin/meson is a bash script), so
> -    # just require --meson=git|internal together with --python.
> -    if test "$explicit_python" = yes; then
> -        case "$meson" in
> -            git | internal) ;;
> -            *) error_exit "--python requires using QEMU's embedded Meson distribution." ;;
> -        esac
> +    # --no-build-isolation was added to pip 10.0.
> +    # --no-use-pep517 was added ... sometime after 18.1?
> +    pip_flags='--no-build-isolation'
> +    if $python -m pip install --help | grep 'no-use-pep517' > /dev/null 2>&1 ; then
> +        pip_flags="${pip_flags} --no-use-pep517"
> +    fi
> +    if ! pip_install $pip_flags "${source_path}/meson" ; then
> +        exit 1
>      fi
>  fi
>  
> -if test "$meson" = git; then
> -    git_submodules="${git_submodules} meson"
> -fi
> +# At this point, we expect Meson to be installed and available.
> +# We expect mkvenv or pip to have created pyvenv/bin/meson for us.
> +# We ignore PATH completely here: we want to use the venv's Meson
> +# *exclusively*.
> +meson="$(cd pyvenv/bin; pwd)/meson"
>  
> -case "$meson" in
> -    git | internal)
> -        meson="$python ${source_path}/meson/meson.py"
> -        ;;
> -    *) meson=$(command -v "$meson") ;;
> -esac
> +# Smoke tests: these shouldn't fail, but I have little faith in esoteric
> +# platforms I've never used to not do something Deep Strange when I am
> +# not looking.
> +if ! test -e "$meson" ; then
> +    error_exit "??? pyvenv/bin/meson not found, somehow ???"
> +fi
> +echo "Meson $($meson --version) found: $meson"
> +if ! version_ge "$($meson --version)" 0.61.5; then
> +    error_exit "??? Meson version is too old ???"
> +fi
>  
>  # Probe for ninja
>  
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index a6cfe9be970..6cfe644d8fe 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -17,7 +17,7 @@
>        { cat config.log meson-logs/meson-log.txt && exit 1; }
>      - if test -n "$LD_JOBS";
>        then
> -        ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
> +        pyvenv/bin/meson configure . -Dbackend_max_links="$LD_JOBS" ;
>        fi || exit 1;
>      - make -j"$JOBS"
>      - if test -n "$MAKE_CHECK_ARGS";
> -- 
> 2.39.2
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


