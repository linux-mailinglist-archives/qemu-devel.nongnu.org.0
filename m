Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2584DD0D6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 23:37:43 +0100 (CET)
Received: from localhost ([::1]:42426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUykY-0002Rj-CI
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 18:37:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1nUyhr-0000l6-1w
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 18:34:55 -0400
Received: from speedy.comstyle.com ([206.51.28.2]:28846 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1nUyho-0002ts-Dt
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 18:34:54 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4KKMQW6rFcz8PbN;
 Thu, 17 Mar 2022 18:34:43 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=MOoCZvpcL
 wLZMCM8OYRRGmesITU=; b=ebj/sYLuHPt4j8cnYA4Y00kq2tFxxqSIP5LI1lFle
 ixPh707xlA0O750cnM43ojLAeBBkrC5+r5J5Zg01K/GeILOv1Pv57PHvTJ4ldKMM
 HEcn6KC4hACLIedSR/DQ+lY9Dqotq9EAVBu2DsH95syzbHCv3cz+OzLU3QSZXk16
 tM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=JKN
 CAgUpXY0XAPRL+DdfgyQ4hRf4n03s24ysJXIzM/LuInIokFjnZ+9cP58LJK8NOq0
 93aiROtOhmFSjZGyalhlh3SqujH8VEls++Jr3Xb7gAxP2SNFHoOzXFJ2xg3Yttj5
 /p10AGKJ9GfuISWavvZsZwlFX9m58UyGuIGFz6x4=
Received: from [IPV6:2001:470:b050:6:802:2c5a:b29e:f254] (unknown
 [IPv6:2001:470:b050:6:802:2c5a:b29e:f254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4KKMQW2FC0z8PbK;
 Thu, 17 Mar 2022 18:34:43 -0400 (EDT)
Message-ID: <1c23e903-b766-e496-9a50-8d76d59fb414@comstyle.com>
Date: Thu, 17 Mar 2022 18:34:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101
 Thunderbird/99.0
Subject: Re: [PULL 18/30] configure, meson: move guest-agent, tools to meson
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220215093223.110827-1-pbonzini@redhat.com>
 <20220215093223.110827-19-pbonzini@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <20220215093223.110827-19-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=206.51.28.2; envelope-from=brad@comstyle.com;
 helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trying out 7.0.0-rc0 I noticed after this commit that the guest agent
does not build on the BSD's and macOS.

 From the configure scrip it went from..

 =C2=A0 elif [ "$linux" =3D "yes" -o "$bsd" =3D "yes" -o "$solaris" =3D "=
yes" -o=20
"$mingw32" =3D "yes" ] ; then
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guest_agent=3Dyes

to this in meson.build..

have_ga =3D get_option('guest_agent') \
 =C2=A0 .disable_auto_if(not have_system and not have_tools) \
 =C2=A0 .require(targetos in ['sunos', 'linux', 'windows'],

So Linux, Solaris and Windows are listed but not the BSD's and macOS.


On 2/15/2022 4:32 AM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure                          | 48 ++--------------------------
>   contrib/vhost-user-gpu/meson.build |  2 +-
>   docs/meson.build                   |  2 --
>   meson.build                        | 50 ++++++++++++++++-------------=
-
>   meson_options.txt                  |  4 +++
>   qga/meson.build                    |  7 +++++
>   scripts/meson-buildoptions.sh      |  6 ++++
>   tests/Makefile.include             |  2 +-
>   tests/unit/meson.build             |  4 +--
>   9 files changed, 50 insertions(+), 75 deletions(-)
>
> diff --git a/configure b/configure
> index 9230ebd4a8..a66e2c0d71 100755
> --- a/configure
> +++ b/configure
> @@ -317,10 +317,8 @@ pie=3D""
>   trace_backends=3D"log"
>   trace_file=3D"trace"
>   opengl=3D"$default_feature"
> -guest_agent=3D"$default_feature"
>   vss_win32_sdk=3D"$default_feature"
>   win_sdk=3D"no"
> -want_tools=3D"$default_feature"
>   coroutine=3D""
>   tls_priority=3D"NORMAL"
>   plugins=3D"$default_feature"
> @@ -960,10 +958,6 @@ for opt do
>     ;;
>     --disable-zlib-test)
>     ;;
> -  --enable-guest-agent) guest_agent=3D"yes"
> -  ;;
> -  --disable-guest-agent) guest_agent=3D"no"
> -  ;;
>     --with-vss-sdk) vss_win32_sdk=3D""
>     ;;
>     --with-vss-sdk=3D*) vss_win32_sdk=3D"$optarg"
> @@ -976,10 +970,6 @@ for opt do
>     ;;
>     --without-win-sdk) win_sdk=3D"no"
>     ;;
> -  --enable-tools) want_tools=3D"yes"
> -  ;;
> -  --disable-tools) want_tools=3D"no"
> -  ;;
>     --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
>         echo "$0: $opt is obsolete, virtio-blk data-plane is always on"=
 >&2
>     ;;
> @@ -1256,7 +1246,6 @@ cat << EOF
>     user            supported user emulation targets
>     linux-user      all linux usermode emulation targets
>     bsd-user        all BSD usermode emulation targets
> -  guest-agent     build the QEMU Guest Agent
>     pie             Position Independent Executables
>     modules         modules support (non-Windows)
>     module-upgrades try to load modules from alternate paths for upgrad=
es
> @@ -1275,7 +1264,6 @@ cat << EOF
>     vhost-user      vhost-user backend support
>     vhost-vdpa      vhost-vdpa kernel backend support
>     opengl          opengl support
> -  tools           build qemu-io, qemu-nbd and qemu-img tools
>     gio             libgio support
>  =20
>   NOTE: The object files are built at the place where configure is laun=
ched
> @@ -1678,16 +1666,6 @@ else
>       exit 1
>   fi
>  =20
> -##########################################
> -# system tools
> -if test -z "$want_tools"; then
> -    if test "$softmmu" =3D "no"; then
> -        want_tools=3Dno
> -    else
> -        want_tools=3Dyes
> -    fi
> -fi
> -
>   #########################################
>   # vhost interdependencies and host support
>  =20
> @@ -2344,7 +2322,7 @@ fi
>   # check if we have VSS SDK headers for win
>  =20
>   guest_agent_with_vss=3D"no"
> -if test "$mingw32" =3D "yes" && test "$guest_agent" !=3D "no" && \
> +if test "$mingw32" =3D "yes" && \
>           test "$vss_win32_sdk" !=3D "no" ; then
>     case "$vss_win32_sdk" in
>       "")   vss_win32_include=3D"-isystem $source_path" ;;
> @@ -2381,7 +2359,7 @@ fi
>   # VSS provider from the source. It is usually unnecessary because the
>   # pre-compiled .tlb file is included.
>  =20
> -if test "$mingw32" =3D "yes" && test "$guest_agent" !=3D "no" && \
> +if test "$mingw32" =3D "yes" && \
>           test "$guest_agent_with_vss" =3D "yes" ; then
>     if test -z "$win_sdk"; then
>       programfiles=3D"$PROGRAMFILES"
> @@ -2399,7 +2377,7 @@ fi
>   ##########################################
>   # check if mingw environment provides a recent ntddscsi.h
>   guest_agent_ntddscsi=3D"no"
> -if test "$mingw32" =3D "yes" && test "$guest_agent" !=3D "no"; then
> +if test "$mingw32" =3D "yes"; then
>     cat > $TMPC << EOF
>   #include <windows.h>
>   #include <ntddscsi.h>
> @@ -2825,20 +2803,6 @@ if test "$mingw32" =3D "yes" ; then
>       done
>   fi
>  =20
> -# Probe for guest agent support/options
> -
> -if [ "$guest_agent" !=3D "no" ]; then
> -  if [ "$softmmu" =3D no -a "$want_tools" =3D no ] ; then
> -      guest_agent=3Dno
> -  elif [ "$linux" =3D "yes" -o "$bsd" =3D "yes" -o "$solaris" =3D "yes=
" -o "$mingw32" =3D "yes" ] ; then
> -      guest_agent=3Dyes
> -  elif [ "$guest_agent" !=3D yes ]; then
> -      guest_agent=3Dno
> -  else
> -      error_exit "Guest agent is not supported on this platform"
> -  fi
> -fi
> -
>   # Guest agent Windows MSI package
>  =20
>   if test "$QEMU_GA_MANUFACTURER" =3D ""; then
> @@ -2968,12 +2932,6 @@ fi
>   if test "$static" =3D "yes" ; then
>     echo "CONFIG_STATIC=3Dy" >> $config_host_mak
>   fi
> -if test "$want_tools" =3D "yes" ; then
> -  echo "CONFIG_TOOLS=3Dy" >> $config_host_mak
> -fi
> -if test "$guest_agent" =3D "yes" ; then
> -  echo "CONFIG_GUEST_AGENT=3Dy" >> $config_host_mak
> -fi
>   echo "CONFIG_BDRV_RW_WHITELIST=3D$block_drv_rw_whitelist" >> $config_=
host_mak
>   echo "CONFIG_BDRV_RO_WHITELIST=3D$block_drv_ro_whitelist" >> $config_=
host_mak
>   qemu_version=3D$(head $source_path/VERSION)
> diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gp=
u/meson.build
> index 92c8f3a86a..b4e26045da 100644
> --- a/contrib/vhost-user-gpu/meson.build
> +++ b/contrib/vhost-user-gpu/meson.build
> @@ -1,4 +1,4 @@
> -if 'CONFIG_TOOLS' in config_host and virgl.found() and gbm.found() \
> +if have_tools and virgl.found() and gbm.found() \
>       and 'CONFIG_LINUX' in config_host and pixman.found()
>     executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', '=
vugbm.c'),
>                dependencies: [qemuutil, pixman, gbm, virgl, vhost_user,=
 opengl],
> diff --git a/docs/meson.build b/docs/meson.build
> index 57b28a3146..831d4aea2b 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -37,8 +37,6 @@ endif
>   if build_docs
>     SPHINX_ARGS +=3D ['-Dversion=3D' + meson.project_version(), '-Drele=
ase=3D' + config_host['PKGVERSION']]
>  =20
> -  have_ga =3D have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
> -
>     man_pages =3D {
>           'qemu-ga.8': (have_ga ? 'man8' : ''),
>           'qemu-ga-ref.7': (have_ga ? 'man7' : ''),
> diff --git a/meson.build b/meson.build
> index 7b3cfb6316..b9bedf928a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -44,21 +44,7 @@ config_host_data =3D configuration_data()
>   genh =3D []
>   qapi_trace_events =3D []
>  =20
> -target_dirs =3D config_host['TARGET_DIRS'].split()
> -have_linux_user =3D false
> -have_bsd_user =3D false
> -have_system =3D false
> -foreach target : target_dirs
> -  have_linux_user =3D have_linux_user or target.endswith('linux-user')
> -  have_bsd_user =3D have_bsd_user or target.endswith('bsd-user')
> -  have_system =3D have_system or target.endswith('-softmmu')
> -endforeach
> -have_user =3D have_linux_user or have_bsd_user
> -have_tools =3D 'CONFIG_TOOLS' in config_host
> -have_block =3D have_system or have_tools
> -
> -python =3D import('python').find_installation()
> -
> +bsd_oses =3D ['gnu/kfreebsd', 'freebsd', 'netbsd', 'openbsd', 'dragonf=
ly', 'darwin']
>   supported_oses =3D ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwi=
n', 'sunos', 'linux']
>   supported_cpus =3D ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64'=
,
>     'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 'sparc6=
4']
> @@ -72,6 +58,28 @@ endif
>  =20
>   targetos =3D host_machine.system()
>  =20
> +target_dirs =3D config_host['TARGET_DIRS'].split()
> +have_linux_user =3D false
> +have_bsd_user =3D false
> +have_system =3D false
> +foreach target : target_dirs
> +  have_linux_user =3D have_linux_user or target.endswith('linux-user')
> +  have_bsd_user =3D have_bsd_user or target.endswith('bsd-user')
> +  have_system =3D have_system or target.endswith('-softmmu')
> +endforeach
> +have_user =3D have_linux_user or have_bsd_user
> +have_tools =3D get_option('tools') \
> +  .disable_auto_if(not have_system) \
> +  .allowed()
> +have_ga =3D get_option('guest_agent') \
> +  .disable_auto_if(not have_system and not have_tools) \
> +  .require(targetos in ['sunos', 'linux', 'windows'],
> +           error_message: 'unsupported OS for QEMU guest agent') \
> +  .allowed()
> +have_block =3D have_system or have_tools
> +
> +python =3D import('python').find_installation()
> +
>   if cpu not in supported_cpus
>     host_arch =3D 'unknown'
>   elif cpu =3D=3D 'x86'
> @@ -3214,11 +3222,7 @@ if 'CONFIG_PLUGIN' in config_host
>     install_headers('include/qemu/qemu-plugin.h')
>   endif
>  =20
> -if 'CONFIG_GUEST_AGENT' in config_host
> -  subdir('qga')
> -elif get_option('guest_agent_msi').enabled()
> -  error('Guest agent MSI requested, but the guest agent is not being b=
uilt')
> -endif
> +subdir('qga')
>  =20
>   # Don't build qemu-keymap if xkbcommon is not explicitly enabled
>   # when we don't build tools or system
> @@ -3341,7 +3345,7 @@ if config_host.has_key('HAVE_GDB_BIN')
>     summary_info +=3D {'gdb':             config_host['HAVE_GDB_BIN']}
>   endif
>   summary_info +=3D {'genisoimage':       config_host['GENISOIMAGE']}
> -if targetos =3D=3D 'windows' and config_host.has_key('CONFIG_GUEST_AGE=
NT')
> +if targetos =3D=3D 'windows' and have_ga
>     summary_info +=3D {'wixl':            wixl}
>   endif
>   if slirp_opt !=3D 'disabled' and have_system
> @@ -3379,7 +3383,7 @@ summary_info +=3D {'vhost-user support': config_h=
ost.has_key('CONFIG_VHOST_USER')}
>   summary_info +=3D {'vhost-user-blk server support': have_vhost_user_b=
lk_server}
>   summary_info +=3D {'vhost-user-fs support': config_host.has_key('CONF=
IG_VHOST_USER_FS')}
>   summary_info +=3D {'vhost-vdpa support': config_host.has_key('CONFIG_=
VHOST_VDPA')}
> -summary_info +=3D {'build guest agent': config_host.has_key('CONFIG_GU=
EST_AGENT')}
> +summary_info +=3D {'build guest agent': have_ga}
>   summary(summary_info, bool_yn: true, section: 'Configurable features'=
)
>  =20
>   # Compilation information
> @@ -3589,7 +3593,7 @@ summary_info +=3D {'GBM':               gbm}
>   summary_info +=3D {'libiscsi support':  libiscsi}
>   summary_info +=3D {'libnfs support':    libnfs}
>   if targetos =3D=3D 'windows'
> -  if config_host.has_key('CONFIG_GUEST_AGENT')
> +  if have_ga
>       summary_info +=3D {'QGA VSS support':   config_host.has_key('CONF=
IG_QGA_VSS')}
>       summary_info +=3D {'QGA w32 disk info': config_host.has_key('CONF=
IG_QGA_NTDDSCSI')}
>     endif
> diff --git a/meson_options.txt b/meson_options.txt
> index 59220b52c8..589d242439 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -36,8 +36,12 @@ option('install_blobs', type : 'boolean', value : tr=
ue,
>          description: 'install provided firmware blobs')
>   option('sparse', type : 'feature', value : 'auto',
>          description: 'sparse checker')
> +option('guest_agent', type : 'feature', value : 'auto',
> +       description: 'Build QEMU Guest Agent')
>   option('guest_agent_msi', type : 'feature', value : 'auto',
>          description: 'Build MSI package for the QEMU Guest Agent')
> +option('tools', type : 'feature', value : 'auto',
> +       description: 'build support utilities that come with QEMU')
>  =20
>   option('malloc_trim', type : 'feature', value : 'auto',
>          description: 'enable libc malloc_trim() for memory optimizatio=
n')
> diff --git a/qga/meson.build b/qga/meson.build
> index 56fb6539e5..97cc391fe1 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -1,3 +1,10 @@
> +if not have_ga
> +  if get_option('guest_agent_msi').enabled()
> +    error('Guest agent MSI requested, but the guest agent is not being=
 built')
> +  endif
> +  subdir_done()
> +endif
> +
>   all_qga =3D []
>  =20
>   qga_qapi_outputs =3D [
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions=
.sh
> index fb8812693c..4edc611273 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -62,6 +62,7 @@ meson_options_help() {
>     printf "%s\n" '  glusterfs       Glusterfs block device driver'
>     printf "%s\n" '  gnutls          GNUTLS cryptography support'
>     printf "%s\n" '  gtk             GTK+ user interface'
> +  printf "%s\n" '  guest-agent     Build QEMU Guest Agent'
>     printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Gue=
st Agent'
>     printf "%s\n" '  hax             HAX acceleration support'
>     printf "%s\n" '  hvf             HVF acceleration support'
> @@ -108,6 +109,7 @@ meson_options_help() {
>     printf "%s\n" '  spice           Spice server support'
>     printf "%s\n" '  spice-protocol  Spice protocol support'
>     printf "%s\n" '  tcg             TCG support'
> +  printf "%s\n" '  tools           build support utilities that come w=
ith QEMU'
>     printf "%s\n" '  tpm             TPM support'
>     printf "%s\n" '  u2f             U2F emulation support'
>     printf "%s\n" '  usb-redir       libusbredir support'
> @@ -209,6 +211,8 @@ _meson_option_parse() {
>       --disable-gprof) printf "%s" -Dgprof=3Dfalse ;;
>       --enable-gtk) printf "%s" -Dgtk=3Denabled ;;
>       --disable-gtk) printf "%s" -Dgtk=3Ddisabled ;;
> +    --enable-guest-agent) printf "%s" -Dguest_agent=3Denabled ;;
> +    --disable-guest-agent) printf "%s" -Dguest_agent=3Ddisabled ;;
>       --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=3Denabled=
 ;;
>       --disable-guest-agent-msi) printf "%s" -Dguest_agent_msi=3Ddisabl=
ed ;;
>       --enable-hax) printf "%s" -Dhax=3Denabled ;;
> @@ -315,6 +319,8 @@ _meson_option_parse() {
>       --disable-tcg) printf "%s" -Dtcg=3Ddisabled ;;
>       --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=3Dtrue ;;
>       --disable-tcg-interpreter) printf "%s" -Dtcg_interpreter=3Dfalse =
;;
> +    --enable-tools) printf "%s" -Dtools=3Denabled ;;
> +    --disable-tools) printf "%s" -Dtools=3Ddisabled ;;
>       --enable-tpm) printf "%s" -Dtpm=3Denabled ;;
>       --disable-tpm) printf "%s" -Dtpm=3Ddisabled ;;
>       --enable-trace-backends=3D*) quote_sh "-Dtrace_backends=3D$2" ;;
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 646c8b1334..e7153c8e91 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -150,7 +150,7 @@ check-acceptance: check-acceptance-deprecated-warni=
ng | check-avocado
>   .PHONY: check-block check check-clean get-vm-images
>   check:
>  =20
> -ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
> +ifneq ($(.check-block.deps),)
>   check: check-block
>   check-block: run-ninja
>   	$(if $(MAKE.n),,+)$(MESON) test $(MTESTARGS) $(.mtestargs) --verbose=
 \
> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index 0959061faf..3a51759ebc 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -149,9 +149,7 @@ if have_system
>     endif
>   endif
>  =20
> -if 'CONFIG_TSAN' not in config_host and \
> -   'CONFIG_GUEST_AGENT' in config_host and \
> -   'CONFIG_LINUX' in config_host
> +if have_ga and targetos =3D=3D 'linux' and 'CONFIG_TSAN' not in config=
_host
>     tests +=3D {'test-qga': ['../qtest/libqtest.c']}
>     test_deps +=3D {'test-qga': qga}
>   endif

