Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39B92D7415
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 11:44:14 +0100 (CET)
Received: from localhost ([::1]:49996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knfuH-0006wc-Dh
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 05:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knfsf-0006TF-Id
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 05:42:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knfsT-0004hj-CG
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 05:42:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607683339;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=d4lTLPg8L29NRN05Zj3u/YIFvmsFDVjJEzoBR1HEoCw=;
 b=UMzfhFrntCnUaZAwH6AsqPUe4vgkJGvhX2c6N60qqlv3u8oC88Hwk7+uwUsVYYvLt00r18
 wHXxgmJijCp0e1rkVq2ZHZ92gjxh55sHTcrpwsEgBTgoJSWleENqB2AtPfrK/VOia0C6BC
 ck91YXaWTbHzyOlOudq+eOjDHeH3cec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-sv_EUuLQPrSZM7z4mPXm_Q-1; Fri, 11 Dec 2020 05:42:14 -0500
X-MC-Unique: sv_EUuLQPrSZM7z4mPXm_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61DB3801817;
 Fri, 11 Dec 2020 10:42:13 +0000 (UTC)
Received: from redhat.com (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E46710013C0;
 Fri, 11 Dec 2020 10:42:10 +0000 (UTC)
Date: Fri, 11 Dec 2020 10:42:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dan Streetman <ddstreet@canonical.com>
Subject: Re: [PATCH] configure: replace --enable/disable-git-update with
 --with-git-submodules
Message-ID: <20201211104207.GC75000@redhat.com>
References: <20201016203857.62572-1-ddstreet@canonical.com>
 <CAOZ2QJNorhPqkToAJsN6h6nS4vEOfcYrpAs2Cro4TyDWY1M_8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOZ2QJNorhPqkToAJsN6h6nS4vEOfcYrpAs2Cro4TyDWY1M_8g@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Rafael David Tinoco <rafael.tinoco@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 09, 2020 at 09:38:51AM -0500, Dan Streetman wrote:
> Hi, just a ping to try to keep this alive, does the patch look ok? I
> can rebase it on the latest git if so (and if needed)

Yes, I meant to ask for a rebase. The impl broadly looks fine to me.

> 
> On Fri, Oct 16, 2020 at 4:39 PM Dan Streetman <ddstreet@canonical.com> wrote:
> >
> > Replace the --enable-git-update and --disable-git-update configure params
> > with the param --with-git-submodules=(update|validate|ignore) to
> > allow 3 options for building from a git repo.
> >
> > This is needed because downstream packagers, e.g. Debian, Ubuntu, etc,
> > also keep the source code in git, but do not want to enable the
> > 'git_update' mode; with the current code, that's not possible even
> > if the downstream package specifies --disable-git-update.
> >
> > Signed-off-by: Dan Streetman <ddstreet@canonical.com>
> > ---
> >  Makefile                 | 26 ++-----------------
> >  configure                | 55 +++++++++++++++++++++++++---------------
> >  scripts/git-submodule.sh | 34 +++++++++++++++++++------
> >  3 files changed, 62 insertions(+), 53 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index c37e513431..033455dc8f 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -34,33 +34,11 @@ ifneq ($(wildcard config-host.mak),)
> >  all:
> >  include config-host.mak
> >
> > -git-submodule-update:
> > -
> >  .PHONY: git-submodule-update
> > -
> > -git_module_status := $(shell \
> > -  cd '$(SRC_PATH)' && \
> > -  GIT="$(GIT)" ./scripts/git-submodule.sh status $(GIT_SUBMODULES); \
> > -  echo $$?; \
> > -)
> > -
> > -ifeq (1,$(git_module_status))
> > -ifeq (no,$(GIT_UPDATE))
> >  git-submodule-update:
> >         $(call quiet-command, \
> > -            echo && \
> > -            echo "GIT submodule checkout is out of date. Please run" && \
> > -            echo "  scripts/git-submodule.sh update $(GIT_SUBMODULES)" && \
> > -            echo "from the source directory checkout $(SRC_PATH)" && \
> > -            echo && \
> > -            exit 1)
> > -else
> > -git-submodule-update:
> > -       $(call quiet-command, \
> > -          (cd $(SRC_PATH) && GIT="$(GIT)" ./scripts/git-submodule.sh update $(GIT_SUBMODULES)), \
> > -          "GIT","$(GIT_SUBMODULES)")
> > -endif
> > -endif
> > +               (GIT="$(GIT)" "$(SRC_PATH)/scripts/git-submodule.sh" $(GIT_SUBMODULES_ACTION) $(GIT_SUBMODULES)), \
> > +               "GIT","$(GIT_SUBMODULES)")
> >
> >  export NINJA=./ninjatool
> >
> > diff --git a/configure b/configure
> > index f839c2a557..c5df778790 100755
> > --- a/configure
> > +++ b/configure
> > @@ -249,12 +249,12 @@ gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
> >
> >  if test -e "$source_path/.git"
> >  then
> > -    git_update=yes
> > +    git_submodules_action="update"
> >      git_submodules="ui/keycodemapdb"
> >      git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
> >      git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
> >  else
> > -    git_update=no
> > +    git_submodules_action="ignore"
> >      git_submodules=""
> >
> >      if ! test -f "$source_path/ui/keycodemapdb/README"
> > @@ -1478,9 +1478,16 @@ for opt do
> >    ;;
> >    --with-git=*) git="$optarg"
> >    ;;
> > -  --enable-git-update) git_update=yes
> > +  --enable-git-update)
> > +      git_submodules_action="update"
> > +      echo "--enable-git-update deprecated, use --with-git-submodules=update"
> >    ;;
> > -  --disable-git-update) git_update=no
> > +  --disable-git-update)
> > +      git_submodules_action="validate"
> > +      echo "--disable-git-update deprecated, use --with-git-submodules=validate"
> > +  ;;
> > +  --with-git-submodules=*)
> > +      git_submodules_action="$optarg"
> >    ;;
> >    --enable-debug-mutex) debug_mutex=yes
> >    ;;
> > @@ -1528,6 +1535,20 @@ for opt do
> >    esac
> >  done
> >
> > +case $git_submodules_action in
> > +    update|validate)
> > +        if test ! -e "$source_path/.git"; then
> > +            echo "ERROR: cannot $git_submodules_action git submodules without .git"
> > +            exit 1
> > +        fi
> > +    ;;
> > +    ignore) ;;
> > +    *)
> > +        echo "ERROR: invalid --with-git-submodules= value '$git_submodules_action'"
> > +        exit 1
> > +    ;;
> > +esac
> > +
> >  firmwarepath="${firmwarepath:-$prefix/share/qemu-firmware}"
> >  libdir="${libdir:-$prefix/lib}"
> >  libexecdir="${libexecdir:-$prefix/libexec}"
> > @@ -1868,7 +1889,7 @@ python="$python -B"
> >  if test -z "$meson"; then
> >      if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.55.1; then
> >          meson=meson
> > -    elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
> > +    elif test $git_submodules_action != 'ignore' ; then
> >          meson=git
> >      elif test -e "${source_path}/meson/meson.py" ; then
> >          meson=internal
> > @@ -1936,7 +1957,7 @@ fi
> >  # Consult white-list to determine whether to enable werror
> >  # by default.  Only enable by default for git builds
> >  if test -z "$werror" ; then
> > -    if test -e "$source_path/.git" && \
> > +    if test "$git_submodules_action" != "ignore" && \
> >          { test "$linux" = "yes" || test "$mingw32" = "yes"; }; then
> >          werror="yes"
> >      else
> > @@ -3824,9 +3845,7 @@ fi
> >  case "$fdt" in
> >    auto | enabled | internal)
> >      # Simpler to always update submodule, even if not needed.
> > -    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
> > -      git_submodules="${git_submodules} dtc"
> > -    fi
> > +    git_submodules="${git_submodules} dtc"
> >      ;;
> >  esac
> >
> > @@ -4696,9 +4715,7 @@ fi
> >  case "$capstone" in
> >    auto | enabled | internal)
> >      # Simpler to always update submodule, even if not needed.
> > -    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
> > -      git_submodules="${git_submodules} capstone"
> > -    fi
> > +    git_submodules="${git_submodules} capstone"
> >      ;;
> >  esac
> >
> > @@ -5636,9 +5653,7 @@ fi
> >  case "$slirp" in
> >    auto | enabled | internal)
> >      # Simpler to always update submodule, even if not needed.
> > -    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
> > -      git_submodules="${git_submodules} slirp"
> > -    fi
> > +    git_submodules="${git_submodules} slirp"
> >      ;;
> >  esac
> >
> > @@ -5893,9 +5908,7 @@ if test "$cpu" = "s390x" ; then
> >      roms="$roms s390-ccw"
> >      # SLOF is required for building the s390-ccw firmware on s390x,
> >      # since it is using the libnet code from SLOF for network booting.
> > -    if test -e "${source_path}/.git" ; then
> > -      git_submodules="${git_submodules} roms/SLOF"
> > -    fi
> > +    git_submodules="${git_submodules} roms/SLOF"
> >    fi
> >  fi
> >
> > @@ -5931,8 +5944,8 @@ else
> >      cxx=
> >  fi
> >
> > -if test $git_update = 'yes' ; then
> > -    (cd "${source_path}" && GIT="$git" "./scripts/git-submodule.sh" update "$git_submodules")
> > +if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
> > +    exit 1
> >  fi
> >
> >  config_host_mak="config-host.mak"
> > @@ -5960,7 +5973,7 @@ echo "qemu_icondir=$qemu_icondir" >> $config_host_mak
> >  echo "qemu_desktopdir=$qemu_desktopdir" >> $config_host_mak
> >  echo "GIT=$git" >> $config_host_mak
> >  echo "GIT_SUBMODULES=$git_submodules" >> $config_host_mak
> > -echo "GIT_UPDATE=$git_update" >> $config_host_mak
> > +echo "GIT_SUBMODULES_ACTION=$git_submodules_action" >> $config_host_mak
> >
> >  echo "ARCH=$ARCH" >> $config_host_mak
> >
> > diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
> > index 65ed877aef..e225d3a963 100755
> > --- a/scripts/git-submodule.sh
> > +++ b/scripts/git-submodule.sh
> > @@ -9,9 +9,14 @@ command=$1
> >  shift
> >  maybe_modules="$@"
> >
> > +# if --with-git-submodules=ignore, do nothing
> > +test "$command" = "ignore" && exit 0
> > +
> >  test -z "$GIT" && GIT=git
> >
> > -error() {
> > +cd "$(dirname "$0")/.."
> > +
> > +update_error() {
> >      echo "$0: $*"
> >      echo
> >      echo "Unable to automatically checkout GIT submodules '$modules'."
> > @@ -24,7 +29,7 @@ error() {
> >      echo "Alternatively you may disable automatic GIT submodule checkout"
> >      echo "with:"
> >      echo
> > -    echo " $ ./configure --disable-git-update"
> > +    echo " $ ./configure --with-git-submodules=validate"
> >      echo
> >      echo "and then manually update submodules prior to running make, with:"
> >      echo
> > @@ -33,6 +38,19 @@ error() {
> >      exit 1
> >  }
> >
> > +validate_error() {
> > +    if test "$1" = "validate"; then
> > +        echo "GIT submodules checkout is out of date, and submodules"
> > +        echo "configured for validate only. Please run"
> > +        echo "  scripts/git-submodule.sh update $maybe_modules"
> > +        echo "from the source directory or call configure with"
> > +        echo "  --with-git-submodules=update"
> > +        echo "To disable GIT submodules validation, use"
> > +        echo "  --with-git-submodules=ignore"
> > +    fi
> > +    exit 1
> > +}
> > +
> >  modules=""
> >  for m in $maybe_modules
> >  do
> > @@ -52,18 +70,18 @@ then
> >  fi
> >
> >  case "$command" in
> > -status)
> > +status|validate)
> >      if test -z "$maybe_modules"
> >      then
> > -         test -s ${substat} && exit 1 || exit 0
> > +         test -s ${substat} && validate_error "$command" || exit 0
> >      fi
> >
> > -    test -f "$substat" || exit 1
> > +    test -f "$substat" || validate_error "$command"
> >      for module in $modules; do
> >          CURSTATUS=$($GIT submodule status $module)
> >          OLDSTATUS=$(cat $substat | grep $module)
> >          if test "$CURSTATUS" != "$OLDSTATUS"; then
> > -            exit 1
> > +            validate_error "$command"
> >          fi
> >      done
> >      exit 0
> > @@ -76,10 +94,10 @@ update)
> >      fi
> >
> >      $GIT submodule update --init $modules 1>/dev/null
> > -    test $? -ne 0 && error "failed to update modules"
> > +    test $? -ne 0 && update_error "failed to update modules"
> >
> >      $GIT submodule status $modules > "${substat}"
> > -    test $? -ne 0 && error "failed to save git submodule status" >&2
> > +    test $? -ne 0 && update_error "failed to save git submodule status" >&2
> >      ;;
> >  esac
> >
> > --
> > 2.25.1
> >
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


