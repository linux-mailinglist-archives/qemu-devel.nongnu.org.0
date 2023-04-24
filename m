Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BFB6ED633
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:37:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2ux-0005Bw-Ol; Mon, 24 Apr 2023 16:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pr2uv-0005Ba-UY
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:36:09 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pr2us-0008IS-Kt
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:36:09 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-43f9c6767e8so3381340e0c.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 13:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20221208.gappssmtp.com; s=20221208; t=1682368564; x=1684960564;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GdgKROIAdouJcAUHozqkPUSC6zsTJBvHUFLrIU5pIw0=;
 b=Li0lxzmGKjART0Kq0fNAHtoO2lLbi+6iV2hW6VRQE2WkzCcdgtvRsdANET9k/vdU/6
 9J50MgnC5PVIj8LX9eapwRYhSbcv3n4u1q8/IjDG9e+PP2encHOPvYkzj7/xBjwZaOFo
 XhOgYmdANXar5WxJbxb7CYXIlo0bWXC14kPoBx+aDhihrOzx6/d4szFw90emAtvBVUjn
 p2ggFn2JFriqABuAfIFcmJqzw+WnnEwetdaD6KreYVYusjqhhIooPOmdCek8VqyvlWDA
 c10SWz1Dv8phZT3pcd/M09qJrAfvD/MZrpucInExuOzVkH/DQRoUT1iR6y0++a3U6oMD
 WCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682368564; x=1684960564;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GdgKROIAdouJcAUHozqkPUSC6zsTJBvHUFLrIU5pIw0=;
 b=FqyHce2+3hd2/ie2gjFuXSxjdRnLHOAOgUUam26KQOkyFxJgnlKNGzmDyY4Q0S33Az
 CX+lx+yCiCTzh+u0MSG1boMt57Y4TQIXKJLyFTkvAa6qC5jmCn1C4nIelLNlPgrk9OWU
 k93j7PNFBQ6PTXBAfRALsHVPiVvb3sqH63DBATC/JTNLScEPAW/P+WXCzaEgPGhUxBi7
 7aKBuV5bu0Qs7qe1SN3pnwMs2PjhO4mE6D+LMdGkAUlexATIjdPZ/fOjwbYlrDE9um/o
 D0IdTLQfRWS/R1FxzJLR110m/QqMmYvAu+7CCJCrEvRiP/MIQpQBL0W9B3PEO1fxFsVa
 Omew==
X-Gm-Message-State: AAQBX9fox1T366HnELapvrXM6dxBi/PGITO78AVVkyrHu224Omr/fb4w
 Xk0p3Ttul/cyR1rh+6ibYtzIocDUHeDXrifn/LCPwg==
X-Google-Smtp-Source: AKy350aH2LO4ZYlpNsfhSzWHjmn0V2Hmd+nM3fuoir00Kzml5p/6Rs+XWRsYTlhKEYPiFG7xZgKn1zu6mAlbnPRW4qA=
X-Received: by 2002:a1f:5f02:0:b0:43f:f4a3:7385 with SMTP id
 t2-20020a1f5f02000000b0043ff4a37385mr4882921vkb.7.1682368564270; Mon, 24 Apr
 2023 13:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <20230424200248.1183394-15-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-15-jsnow@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 24 Apr 2023 14:35:51 -0600
Message-ID: <CANCZdfrmJtZBCf55hvQ48k9jguEvhrntVCYiqkjDx2BwYJOa-Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 14/20] configure: use 'mkvenv ensure meson' to
 bootstrap meson
To: John Snow <jsnow@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a7aba005fa1af4cc"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000a7aba005fa1af4cc
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 24, 2023, 2:03 PM John Snow <jsnow@redhat.com> wrote:

> This commit changes how we detect and install meson. It notably removes
> '--meson='.
>
> The previous patch creates a lightweight Python virtual environment
> unconditionally using the user's configured $python that inherits system
> packages. If Meson is installed there and meets our minimum version
> requirements, we will use that Meson.
>
> In the event that Meson is installed but *not for the chosen Python
> interpreter*, not found, or of insufficient version, we will attempt to
> install Meson from vendored source into the newly created Python virtual
> environment. This vendored installation is considered to replace the
> mechanism from prior tarball distributions.
>
> This commit restores the ability to use a system meson, but in turn
> temporarily removes the ability to use a meson as obtained from the
> internet at configure-time (git submodules, as it stood prior to this
> patch); that ability will be restored in the next commit.
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
>  configure                           | 72 ++++++++---------------------
>  .gitlab-ci.d/buildtest-template.yml |  4 +-
>  2 files changed, 21 insertions(+), 55 deletions(-)
>
> diff --git a/configure b/configure
> index 462fe604d6..e9947369b2 100755
> --- a/configure
> +++ b/configure
> @@ -731,8 +731,6 @@ for opt do
>    ;;
>    --skip-meson) skip_meson=yes
>    ;;
> -  --meson=*) meson="$optarg"
> -  ;;
>    --ninja=*) ninja="$optarg"
>    ;;
>    --smbd=*) smbd="$optarg"
> @@ -1016,7 +1014,6 @@ Advanced options (experts only):
>    --cross-prefix-ARCH=PREFIX cross compiler prefix when building ARCH
> guest test cases
>    --make=MAKE              use specified make [$make]
>    --python=PYTHON          use specified python [$python]
> -  --meson=MESON            use specified meson [$meson]
>    --ninja=NINJA            use specified ninja [$ninja]
>    --smbd=SMBD              use specified smbd [$smbd]
>    --with-git=GIT           use specified git [$git]
> @@ -1089,7 +1086,8 @@ fi
>
>  # Resolve PATH
>  python="$(command -v "$python")"
> -explicit_python=yes
> +# This variable is intended to be used only for error messages:
> +target_python=$python
>
>  # Create a Python virtual environment using our configured python.
>  # The stdout of this script will be the location of a symlink that
> @@ -1101,7 +1099,6 @@ explicit_python=yes
>  # - venv is cleared if it exists already;
>  # - venv is allowed to use system packages;
>  # - all setup is performed **offline**;
> -# - No packages are installed by default;
>  # - pip is not installed into the venv when possible,
>  #   but ensurepip is called as a fallback when necessary.
>
> @@ -1116,58 +1113,27 @@ fi
>  # Suppress writing compiled files
>  python="$python -B"
>
> -has_meson() {
> -  local python_dir=$(dirname "$python")
> -  # PEP405: pyvenv.cfg is either adjacent to the Python executable
> -  # or one directory above
> -  if test -f $python_dir/pyvenv.cfg || test -f $python_dir/../pyvenv.cfg;
> then
> -    # Ensure that Meson and Python come from the same virtual environment
> -    test -x "$python_dir/meson" &&
> -      test "$(command -v meson)" -ef "$python_dir/meson"
> -  else
> -    has meson
> -  fi
> -}
>
> -if test -z "$meson"; then
> -    if test "$explicit_python" = no && has_meson && version_ge "$(meson
> --version)" 0.61.5; then
> -        meson=meson
> -    elif test "$git_submodules_action" != 'ignore' ; then
> -        meson=git
> -    elif test -e "${source_path}/meson/meson.py" ; then
> -        meson=internal
> -    else
> -        if test "$explicit_python" = yes; then
> -            error_exit "--python requires using QEMU's embedded Meson
> distribution, but it was not found."
> -        else
> -            error_exit "Meson not found.  Use --meson=/path/to/meson"
> -        fi
> +if ! $python "${source_path}/python/scripts/mkvenv.py" ensure \
> +     --dir "${source_path}/python/wheels" \
> +     "meson>=0.61.5" ;
> +then
> +    # We're very out of luck. Try to give a good diagnostic.
> +    if test -e pyvenv/bin/meson; then
> +        echo "Meson is too old:


Does a minimum version still get printed? I've needed to know that in the
past when I got the error...

Warner
 $(pyvenv/bin/meson --version)"

> +    elif has meson ; then
> +        echo "Meson was found installed on your system," \
> +             "but not for the configured Python interpreter
> ($target_python)."
> +        echo "(Hint: check '$(which meson)' to see which interpreter its
> shebang uses.)"
>      fi
> -else
> -    # Meson uses its own Python interpreter to invoke other Python
> scripts,
> -    # but the user wants to use the one they specified with --python.
> -    #
> -    # We do not want to override the distro Python interpreter (and
> sometimes
> -    # cannot: for example in Homebrew /usr/bin/meson is a bash script), so
> -    # just require --meson=git|internal together with --python.
> -    if test "$explicit_python" = yes; then
> -        case "$meson" in
> -            git | internal) ;;
> -            *) error_exit "--python requires using QEMU's embedded Meson
> distribution." ;;
> -        esac
> -    fi
> -fi
> -
> -if test "$meson" = git; then
> -    git_submodules="${git_submodules} meson"
> +    exit 1
>  fi
>
> -case "$meson" in
> -    git | internal)
> -        meson="$python ${source_path}/meson/meson.py"
> -        ;;
> -    *) meson=$(command -v "$meson") ;;
> -esac
> +# At this point, we expect Meson to be installed and available.
> +# We expect mkvenv or pip to have created pyvenv/bin/meson for us.
> +# We ignore PATH completely here: we want to use the venv's Meson
> +# *exclusively*.
> +meson="$(cd pyvenv/bin; pwd)/meson"
>
>  echo "MKVENV ok!"
>
> diff --git a/.gitlab-ci.d/buildtest-template.yml
> b/.gitlab-ci.d/buildtest-template.yml
> index a6cfe9be97..7edb50b760 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -12,12 +12,12 @@
>      - mkdir build
>      - cd build
>      - ../configure --enable-werror --disable-docs --enable-fdt=system
> -          ${LD_JOBS:+--meson=git} ${TARGETS:+--target-list="$TARGETS"}
> +          ${TARGETS:+--target-list="$TARGETS"}
>            $CONFIGURE_ARGS ||
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

--000000000000a7aba005fa1af4cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 24, 2023, 2:03 PM John Snow &lt;<a href=3D=
"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">This commit changes how we detect and install meson.=
 It notably removes<br>
&#39;--meson=3D&#39;.<br>
<br>
The previous patch creates a lightweight Python virtual environment<br>
unconditionally using the user&#39;s configured $python that inherits syste=
m<br>
packages. If Meson is installed there and meets our minimum version<br>
requirements, we will use that Meson.<br>
<br>
In the event that Meson is installed but *not for the chosen Python<br>
interpreter*, not found, or of insufficient version, we will attempt to<br>
install Meson from vendored source into the newly created Python virtual<br=
>
environment. This vendored installation is considered to replace the<br>
mechanism from prior tarball distributions.<br>
<br>
This commit restores the ability to use a system meson, but in turn<br>
temporarily removes the ability to use a meson as obtained from the<br>
internet at configure-time (git submodules, as it stood prior to this<br>
patch); that ability will be restored in the next commit.<br>
<br>
As a result of this patch, the Python interpreter we use for both our<br>
own build scripts *and* Meson extensions are always known to be the<br>
exact same Python. As a further benefit, there will also be a symlink<br>
available in the build directory that points to the correct, configured<br>
python and can be used by e.g. manual tests to invoke the correct,<br>
configured Python unambiguously.<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 72 ++++++++---------------------<br=
>
=C2=A0.gitlab-ci.d/buildtest-template.yml |=C2=A0 4 +-<br>
=C2=A02 files changed, 21 insertions(+), 55 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 462fe604d6..e9947369b2 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -731,8 +731,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--skip-meson) skip_meson=3Dyes<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --meson=3D*) meson=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--ninja=3D*) ninja=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--smbd=3D*) smbd=3D&quot;$optarg&quot;<br>
@@ -1016,7 +1014,6 @@ Advanced options (experts only):<br>
=C2=A0 =C2=A0--cross-prefix-ARCH=3DPREFIX cross compiler prefix when buildi=
ng ARCH guest test cases<br>
=C2=A0 =C2=A0--make=3DMAKE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
use specified make [$make]<br>
=C2=A0 =C2=A0--python=3DPYTHON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use specif=
ied python [$python]<br>
-=C2=A0 --meson=3DMESON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use specif=
ied meson [$meson]<br>
=C2=A0 =C2=A0--ninja=3DNINJA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use s=
pecified ninja [$ninja]<br>
=C2=A0 =C2=A0--smbd=3DSMBD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
use specified smbd [$smbd]<br>
=C2=A0 =C2=A0--with-git=3DGIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use s=
pecified git [$git]<br>
@@ -1089,7 +1086,8 @@ fi<br>
<br>
=C2=A0# Resolve PATH<br>
=C2=A0python=3D&quot;$(command -v &quot;$python&quot;)&quot;<br>
-explicit_python=3Dyes<br>
+# This variable is intended to be used only for error messages:<br>
+target_python=3D$python<br>
<br>
=C2=A0# Create a Python virtual environment using our configured python.<br=
>
=C2=A0# The stdout of this script will be the location of a symlink that<br=
>
@@ -1101,7 +1099,6 @@ explicit_python=3Dyes<br>
=C2=A0# - venv is cleared if it exists already;<br>
=C2=A0# - venv is allowed to use system packages;<br>
=C2=A0# - all setup is performed **offline**;<br>
-# - No packages are installed by default;<br>
=C2=A0# - pip is not installed into the venv when possible,<br>
=C2=A0#=C2=A0 =C2=A0but ensurepip is called as a fallback when necessary.<b=
r>
<br>
@@ -1116,58 +1113,27 @@ fi<br>
=C2=A0# Suppress writing compiled files<br>
=C2=A0python=3D&quot;$python -B&quot;<br>
<br>
-has_meson() {<br>
-=C2=A0 local python_dir=3D$(dirname &quot;$python&quot;)<br>
-=C2=A0 # PEP405: pyvenv.cfg is either adjacent to the Python executable<br=
>
-=C2=A0 # or one directory above<br>
-=C2=A0 if test -f $python_dir/pyvenv.cfg || test -f $python_dir/../pyvenv.=
cfg; then<br>
-=C2=A0 =C2=A0 # Ensure that Meson and Python come from the same virtual en=
vironment<br>
-=C2=A0 =C2=A0 test -x &quot;$python_dir/meson&quot; &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 test &quot;$(command -v meson)&quot; -ef &quot;$pytho=
n_dir/meson&quot;<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 has meson<br>
-=C2=A0 fi<br>
-}<br>
<br>
-if test -z &quot;$meson&quot;; then<br>
-=C2=A0 =C2=A0 if test &quot;$explicit_python&quot; =3D no &amp;&amp; has_m=
eson &amp;&amp; version_ge &quot;$(meson --version)&quot; 0.61.5; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 meson=3Dmeson<br>
-=C2=A0 =C2=A0 elif test &quot;$git_submodules_action&quot; !=3D &#39;ignor=
e&#39; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 meson=3Dgit<br>
-=C2=A0 =C2=A0 elif test -e &quot;${source_path}/meson/meson.py&quot; ; the=
n<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 meson=3Dinternal<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$explicit_python&quot; =3D yes; =
then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;--python requir=
es using QEMU&#39;s embedded Meson distribution, but it was not found.&quot=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;Meson not found=
.=C2=A0 Use --meson=3D/path/to/meson&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+if ! $python &quot;${source_path}/python/scripts/mkvenv.py&quot; ensure \<=
br>
+=C2=A0 =C2=A0 =C2=A0--dir &quot;${source_path}/python/wheels&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0&quot;meson&gt;=3D0.61.5&quot; ;<br>
+then<br>
+=C2=A0 =C2=A0 # We&#39;re very out of luck. Try to give a good diagnostic.=
<br>
+=C2=A0 =C2=A0 if test -e pyvenv/bin/meson; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Meson is too old:</blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Does a minimum version=
 still get printed? I&#39;ve needed to know that in the past when I got the=
 error...</div><div dir=3D"auto"><br></div><div dir=3D"auto">Warner</div><d=
iv dir=3D"auto">=C2=A0$(pyvenv/bin/meson --version)&quot;</div><div dir=3D"=
auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 elif has meson ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Meson was found installed on your s=
ystem,&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;but not for the conf=
igured Python interpreter ($target_python).&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;(Hint: check &#39;$(which meson)&#3=
9; to see which interpreter its shebang uses.)&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
-else<br>
-=C2=A0 =C2=A0 # Meson uses its own Python interpreter to invoke other Pyth=
on scripts,<br>
-=C2=A0 =C2=A0 # but the user wants to use the one they specified with --py=
thon.<br>
-=C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 # We do not want to override the distro Python interpreter (=
and sometimes<br>
-=C2=A0 =C2=A0 # cannot: for example in Homebrew /usr/bin/meson is a bash s=
cript), so<br>
-=C2=A0 =C2=A0 # just require --meson=3Dgit|internal together with --python=
.<br>
-=C2=A0 =C2=A0 if test &quot;$explicit_python&quot; =3D yes; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$meson&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git | internal) ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) error_exit &quot;--python req=
uires using QEMU&#39;s embedded Meson distribution.&quot; ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-<br>
-if test &quot;$meson&quot; =3D git; then<br>
-=C2=A0 =C2=A0 git_submodules=3D&quot;${git_submodules} meson&quot;<br>
+=C2=A0 =C2=A0 exit 1<br>
=C2=A0fi<br>
<br>
-case &quot;$meson&quot; in<br>
-=C2=A0 =C2=A0 git | internal)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 meson=3D&quot;$python ${source_path}/meson/mes=
on.py&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 *) meson=3D$(command -v &quot;$meson&quot;) ;;<br>
-esac<br>
+# At this point, we expect Meson to be installed and available.<br>
+# We expect mkvenv or pip to have created pyvenv/bin/meson for us.<br>
+# We ignore PATH completely here: we want to use the venv&#39;s Meson<br>
+# *exclusively*.<br>
+meson=3D&quot;$(cd pyvenv/bin; pwd)/meson&quot;<br>
<br>
=C2=A0echo &quot;MKVENV ok!&quot;<br>
<br>
diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-t=
emplate.yml<br>
index a6cfe9be97..7edb50b760 100644<br>
--- a/.gitlab-ci.d/buildtest-template.yml<br>
+++ b/.gitlab-ci.d/buildtest-template.yml<br>
@@ -12,12 +12,12 @@<br>
=C2=A0 =C2=A0 =C2=A0- mkdir build<br>
=C2=A0 =C2=A0 =C2=A0- cd build<br>
=C2=A0 =C2=A0 =C2=A0- ../configure --enable-werror --disable-docs --enable-=
fdt=3Dsystem<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${LD_JOBS:+--meson=3Dgit} ${TARGETS:+--=
target-list=3D&quot;$TARGETS&quot;}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${TARGETS:+--target-list=3D&quot;$TARGE=
TS&quot;}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$CONFIGURE_ARGS ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0{ cat config.log meson-logs/meson-log.txt &amp;&=
amp; exit 1; }<br>
=C2=A0 =C2=A0 =C2=A0- if test -n &quot;$LD_JOBS&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ../meson/meson.py configure . -Dbackend_max_li=
nks=3D&quot;$LD_JOBS&quot; ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pyvenv/bin/meson configure . -Dbackend_max_lin=
ks=3D&quot;$LD_JOBS&quot; ;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fi || exit 1;<br>
=C2=A0 =C2=A0 =C2=A0- make -j&quot;$JOBS&quot;<br>
=C2=A0 =C2=A0 =C2=A0- if test -n &quot;$MAKE_CHECK_ARGS&quot;;<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div></div>

--000000000000a7aba005fa1af4cc--

