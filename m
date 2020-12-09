Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0382D44C3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:50:17 +0100 (CET)
Received: from localhost ([::1]:44778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0nH-0005Vi-2r
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.streetman@canonical.com>)
 id 1kn0d2-0005qU-Cc
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:39:45 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <dan.streetman@canonical.com>)
 id 1kn0cv-0007Xf-2L
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:39:38 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <dan.streetman@canonical.com>) id 1kn0cq-0003zm-SF
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 14:39:29 +0000
Received: by mail-io1-f72.google.com with SMTP id c7so1365251iob.10
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mwEfW97G5dIkBmOnOBzhYMBLUw5TSKWVpip9+czHrFk=;
 b=tPkf1yE01D/nsq/wkhM+bQyWzdAPCfl7kuhXuW8WtpruMrIxQYQERb0a6la+gbW86w
 febGpM5HXWs+++3ZD6mdhec2CPnxXi7zxCPH5GjwcERm6ExOPfDiMbAZcoNu/13a8AZf
 lO1RM2FmmXu83Ek4aASxikDEbeMc9+OKPl5L6j5/gTVSS+qlqNpqpz3/rNlqhdcBSneZ
 VCToyxl61cGdZeoczhVvTfTWkazKpY+5zJ/SH3miPNi4VtfqzuPRBT3OfWKqP+arzEKq
 ttVdRMpMGxMiU/UiIYSxCzdgbr/NSxlyk2U5UJ2NN0qCbfYsr7cfkctOmH/H9GQX+aHy
 al2A==
X-Gm-Message-State: AOAM5312zWEMCT9I/CavlB8/8J9c51eW/gXhMV0EiAHxd0t0fqe8113u
 QuqSXCrhfNJWiS5Sh2CGwk6hh4uavIFTj2q2tA4QhYXlVoZizoAWugMsAnu8hu/XdwogrpYJxWk
 KmDMq89W4Z7Ovp0CvlJVCVrKokTrwAmhMrE4s2gwJYOaCeg/t
X-Received: by 2002:a92:d4c4:: with SMTP id o4mr3299204ilm.28.1607524767596;
 Wed, 09 Dec 2020 06:39:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjw6LfltNmAqpR4BtyE01WLYqbaYlDpYDCvzw4zRPxBUpltwoPo/tu6K3Sj16OK5OFKYZiQcgmKkIS1BXAKC0=
X-Received: by 2002:a92:d4c4:: with SMTP id o4mr3299152ilm.28.1607524767087;
 Wed, 09 Dec 2020 06:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20201016203857.62572-1-ddstreet@canonical.com>
In-Reply-To: <20201016203857.62572-1-ddstreet@canonical.com>
From: Dan Streetman <ddstreet@canonical.com>
Date: Wed, 9 Dec 2020 09:38:51 -0500
Message-ID: <CAOZ2QJNorhPqkToAJsN6h6nS4vEOfcYrpAs2Cro4TyDWY1M_8g@mail.gmail.com>
Subject: Re: [PATCH] configure: replace --enable/disable-git-update with
 --with-git-submodules
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=dan.streetman@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Rafael David Tinoco <rafael.tinoco@canonical.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, just a ping to try to keep this alive, does the patch look ok? I
can rebase it on the latest git if so (and if needed)

On Fri, Oct 16, 2020 at 4:39 PM Dan Streetman <ddstreet@canonical.com> wrote:
>
> Replace the --enable-git-update and --disable-git-update configure params
> with the param --with-git-submodules=(update|validate|ignore) to
> allow 3 options for building from a git repo.
>
> This is needed because downstream packagers, e.g. Debian, Ubuntu, etc,
> also keep the source code in git, but do not want to enable the
> 'git_update' mode; with the current code, that's not possible even
> if the downstream package specifies --disable-git-update.
>
> Signed-off-by: Dan Streetman <ddstreet@canonical.com>
> ---
>  Makefile                 | 26 ++-----------------
>  configure                | 55 +++++++++++++++++++++++++---------------
>  scripts/git-submodule.sh | 34 +++++++++++++++++++------
>  3 files changed, 62 insertions(+), 53 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index c37e513431..033455dc8f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -34,33 +34,11 @@ ifneq ($(wildcard config-host.mak),)
>  all:
>  include config-host.mak
>
> -git-submodule-update:
> -
>  .PHONY: git-submodule-update
> -
> -git_module_status := $(shell \
> -  cd '$(SRC_PATH)' && \
> -  GIT="$(GIT)" ./scripts/git-submodule.sh status $(GIT_SUBMODULES); \
> -  echo $$?; \
> -)
> -
> -ifeq (1,$(git_module_status))
> -ifeq (no,$(GIT_UPDATE))
>  git-submodule-update:
>         $(call quiet-command, \
> -            echo && \
> -            echo "GIT submodule checkout is out of date. Please run" && \
> -            echo "  scripts/git-submodule.sh update $(GIT_SUBMODULES)" && \
> -            echo "from the source directory checkout $(SRC_PATH)" && \
> -            echo && \
> -            exit 1)
> -else
> -git-submodule-update:
> -       $(call quiet-command, \
> -          (cd $(SRC_PATH) && GIT="$(GIT)" ./scripts/git-submodule.sh update $(GIT_SUBMODULES)), \
> -          "GIT","$(GIT_SUBMODULES)")
> -endif
> -endif
> +               (GIT="$(GIT)" "$(SRC_PATH)/scripts/git-submodule.sh" $(GIT_SUBMODULES_ACTION) $(GIT_SUBMODULES)), \
> +               "GIT","$(GIT_SUBMODULES)")
>
>  export NINJA=./ninjatool
>
> diff --git a/configure b/configure
> index f839c2a557..c5df778790 100755
> --- a/configure
> +++ b/configure
> @@ -249,12 +249,12 @@ gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
>
>  if test -e "$source_path/.git"
>  then
> -    git_update=yes
> +    git_submodules_action="update"
>      git_submodules="ui/keycodemapdb"
>      git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
>      git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
>  else
> -    git_update=no
> +    git_submodules_action="ignore"
>      git_submodules=""
>
>      if ! test -f "$source_path/ui/keycodemapdb/README"
> @@ -1478,9 +1478,16 @@ for opt do
>    ;;
>    --with-git=*) git="$optarg"
>    ;;
> -  --enable-git-update) git_update=yes
> +  --enable-git-update)
> +      git_submodules_action="update"
> +      echo "--enable-git-update deprecated, use --with-git-submodules=update"
>    ;;
> -  --disable-git-update) git_update=no
> +  --disable-git-update)
> +      git_submodules_action="validate"
> +      echo "--disable-git-update deprecated, use --with-git-submodules=validate"
> +  ;;
> +  --with-git-submodules=*)
> +      git_submodules_action="$optarg"
>    ;;
>    --enable-debug-mutex) debug_mutex=yes
>    ;;
> @@ -1528,6 +1535,20 @@ for opt do
>    esac
>  done
>
> +case $git_submodules_action in
> +    update|validate)
> +        if test ! -e "$source_path/.git"; then
> +            echo "ERROR: cannot $git_submodules_action git submodules without .git"
> +            exit 1
> +        fi
> +    ;;
> +    ignore) ;;
> +    *)
> +        echo "ERROR: invalid --with-git-submodules= value '$git_submodules_action'"
> +        exit 1
> +    ;;
> +esac
> +
>  firmwarepath="${firmwarepath:-$prefix/share/qemu-firmware}"
>  libdir="${libdir:-$prefix/lib}"
>  libexecdir="${libexecdir:-$prefix/libexec}"
> @@ -1868,7 +1889,7 @@ python="$python -B"
>  if test -z "$meson"; then
>      if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.55.1; then
>          meson=meson
> -    elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
> +    elif test $git_submodules_action != 'ignore' ; then
>          meson=git
>      elif test -e "${source_path}/meson/meson.py" ; then
>          meson=internal
> @@ -1936,7 +1957,7 @@ fi
>  # Consult white-list to determine whether to enable werror
>  # by default.  Only enable by default for git builds
>  if test -z "$werror" ; then
> -    if test -e "$source_path/.git" && \
> +    if test "$git_submodules_action" != "ignore" && \
>          { test "$linux" = "yes" || test "$mingw32" = "yes"; }; then
>          werror="yes"
>      else
> @@ -3824,9 +3845,7 @@ fi
>  case "$fdt" in
>    auto | enabled | internal)
>      # Simpler to always update submodule, even if not needed.
> -    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
> -      git_submodules="${git_submodules} dtc"
> -    fi
> +    git_submodules="${git_submodules} dtc"
>      ;;
>  esac
>
> @@ -4696,9 +4715,7 @@ fi
>  case "$capstone" in
>    auto | enabled | internal)
>      # Simpler to always update submodule, even if not needed.
> -    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
> -      git_submodules="${git_submodules} capstone"
> -    fi
> +    git_submodules="${git_submodules} capstone"
>      ;;
>  esac
>
> @@ -5636,9 +5653,7 @@ fi
>  case "$slirp" in
>    auto | enabled | internal)
>      # Simpler to always update submodule, even if not needed.
> -    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
> -      git_submodules="${git_submodules} slirp"
> -    fi
> +    git_submodules="${git_submodules} slirp"
>      ;;
>  esac
>
> @@ -5893,9 +5908,7 @@ if test "$cpu" = "s390x" ; then
>      roms="$roms s390-ccw"
>      # SLOF is required for building the s390-ccw firmware on s390x,
>      # since it is using the libnet code from SLOF for network booting.
> -    if test -e "${source_path}/.git" ; then
> -      git_submodules="${git_submodules} roms/SLOF"
> -    fi
> +    git_submodules="${git_submodules} roms/SLOF"
>    fi
>  fi
>
> @@ -5931,8 +5944,8 @@ else
>      cxx=
>  fi
>
> -if test $git_update = 'yes' ; then
> -    (cd "${source_path}" && GIT="$git" "./scripts/git-submodule.sh" update "$git_submodules")
> +if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
> +    exit 1
>  fi
>
>  config_host_mak="config-host.mak"
> @@ -5960,7 +5973,7 @@ echo "qemu_icondir=$qemu_icondir" >> $config_host_mak
>  echo "qemu_desktopdir=$qemu_desktopdir" >> $config_host_mak
>  echo "GIT=$git" >> $config_host_mak
>  echo "GIT_SUBMODULES=$git_submodules" >> $config_host_mak
> -echo "GIT_UPDATE=$git_update" >> $config_host_mak
> +echo "GIT_SUBMODULES_ACTION=$git_submodules_action" >> $config_host_mak
>
>  echo "ARCH=$ARCH" >> $config_host_mak
>
> diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
> index 65ed877aef..e225d3a963 100755
> --- a/scripts/git-submodule.sh
> +++ b/scripts/git-submodule.sh
> @@ -9,9 +9,14 @@ command=$1
>  shift
>  maybe_modules="$@"
>
> +# if --with-git-submodules=ignore, do nothing
> +test "$command" = "ignore" && exit 0
> +
>  test -z "$GIT" && GIT=git
>
> -error() {
> +cd "$(dirname "$0")/.."
> +
> +update_error() {
>      echo "$0: $*"
>      echo
>      echo "Unable to automatically checkout GIT submodules '$modules'."
> @@ -24,7 +29,7 @@ error() {
>      echo "Alternatively you may disable automatic GIT submodule checkout"
>      echo "with:"
>      echo
> -    echo " $ ./configure --disable-git-update"
> +    echo " $ ./configure --with-git-submodules=validate"
>      echo
>      echo "and then manually update submodules prior to running make, with:"
>      echo
> @@ -33,6 +38,19 @@ error() {
>      exit 1
>  }
>
> +validate_error() {
> +    if test "$1" = "validate"; then
> +        echo "GIT submodules checkout is out of date, and submodules"
> +        echo "configured for validate only. Please run"
> +        echo "  scripts/git-submodule.sh update $maybe_modules"
> +        echo "from the source directory or call configure with"
> +        echo "  --with-git-submodules=update"
> +        echo "To disable GIT submodules validation, use"
> +        echo "  --with-git-submodules=ignore"
> +    fi
> +    exit 1
> +}
> +
>  modules=""
>  for m in $maybe_modules
>  do
> @@ -52,18 +70,18 @@ then
>  fi
>
>  case "$command" in
> -status)
> +status|validate)
>      if test -z "$maybe_modules"
>      then
> -         test -s ${substat} && exit 1 || exit 0
> +         test -s ${substat} && validate_error "$command" || exit 0
>      fi
>
> -    test -f "$substat" || exit 1
> +    test -f "$substat" || validate_error "$command"
>      for module in $modules; do
>          CURSTATUS=$($GIT submodule status $module)
>          OLDSTATUS=$(cat $substat | grep $module)
>          if test "$CURSTATUS" != "$OLDSTATUS"; then
> -            exit 1
> +            validate_error "$command"
>          fi
>      done
>      exit 0
> @@ -76,10 +94,10 @@ update)
>      fi
>
>      $GIT submodule update --init $modules 1>/dev/null
> -    test $? -ne 0 && error "failed to update modules"
> +    test $? -ne 0 && update_error "failed to update modules"
>
>      $GIT submodule status $modules > "${substat}"
> -    test $? -ne 0 && error "failed to save git submodule status" >&2
> +    test $? -ne 0 && update_error "failed to save git submodule status" >&2
>      ;;
>  esac
>
> --
> 2.25.1
>

