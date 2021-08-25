Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA1F3F75DB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:27:12 +0200 (CEST)
Received: from localhost ([::1]:48282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsvv-0004DB-V8
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIsZU-0002Hf-EN
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46668
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIsZP-0002n5-Eg
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:00 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIsYy-0009hD-3l; Wed, 25 Aug 2021 14:03:33 +0100
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <9293a19c-0787-eaed-d84b-f0c73a7e7c8e@ilande.co.uk>
Date: Wed, 25 Aug 2021 14:03:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825124309.223622-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.24,
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/08/2021 13:43, marcandre.lureau@redhat.com wrote:

> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> DTC is widely available, we could consider to stop bundling it.
> 
> curl -s 'https://repology.org/api/v1/project/dtc' |  \
>     jq -r 'group_by(.repo) | .[] | "\(.[0].repo): \(map(.version))"' | \
>     egrep -i 'ubuntu_18|debian_old|rhel|centos|bsd|suse_leap_15_2|sles|homebrew|pkgsrc'
> 
> centos_8: ["1.6.0","1.6.0"]
> debian_oldstable: ["1.4.7"]
> freebsd: ["1.6.0"]
> homebrew: ["1.6.1"]
> openbsd: ["1.6.0"]
> opensuse_leap_15_2: ["1.5.1","1.5.1"]
> pkgsrc_current: ["1.4.7"]
> ubuntu_18_04: ["1.4.5"]
> 
> MinGW package on Fedora pending review.
> (https://bugzilla.redhat.com/show_bug.cgi?id=1997511)
> 
> Debian is lacking the MinGW package.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   configure         | 22 +-------------------
>   meson.build       | 53 ++++++++---------------------------------------
>   .gitmodules       |  3 ---
>   dtc               |  1 -
>   meson_options.txt |  3 ---
>   5 files changed, 10 insertions(+), 72 deletions(-)
>   delete mode 160000 dtc
> 
> diff --git a/configure b/configure
> index 9a79a004d7..04050c0426 100755
> --- a/configure
> +++ b/configure
> @@ -296,7 +296,6 @@ curl="auto"
>   iconv="auto"
>   curses="auto"
>   docs="auto"
> -fdt="auto"
>   netmap="no"
>   sdl="auto"
>   sdl_image="auto"
> @@ -1212,14 +1211,6 @@ for opt do
>     ;;
>     --enable-curl) curl="enabled"
>     ;;
> -  --disable-fdt) fdt="disabled"
> -  ;;
> -  --enable-fdt) fdt="enabled"
> -  ;;
> -  --enable-fdt=git) fdt="internal"
> -  ;;
> -  --enable-fdt=system) fdt="system"
> -  ;;
>     --disable-linux-aio) linux_aio="no"
>     ;;
>     --enable-linux-aio) linux_aio="yes"
> @@ -1890,7 +1881,6 @@ disabled with --disable-FEATURE, default is enabled if available
>     brlapi          BrlAPI (Braile)
>     curl            curl connectivity
>     membarrier      membarrier system call (for Linux 4.14+ or Windows)
> -  fdt             fdt device tree
>     kvm             KVM acceleration support
>     hax             HAX acceleration support
>     hvf             Hypervisor.framework acceleration support
> @@ -3439,16 +3429,6 @@ if compile_prog "" "" ; then
>     iovec=yes
>   fi
>   
> -##########################################
> -# fdt probe
> -
> -case "$fdt" in
> -  auto | enabled | internal)
> -    # Simpler to always update submodule, even if not needed.
> -    git_submodules="${git_submodules} dtc"
> -    ;;
> -esac
> -
>   ##########################################
>   # opengl probe (for sdl2, gtk)
>   
> @@ -5199,7 +5179,7 @@ if test "$skip_meson" = no; then
>           -Dlibusb=$libusb -Dsmartcard=$smartcard -Dusb_redir=$usb_redir -Dvte=$vte \
>           -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
>           -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
> -        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
> +        -Dcapstone=$capstone -Dslirp=$slirp -Dbrlapi=$brlapi \
>           -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
>           -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
>           -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse -Dlibxml2=$libxml2 \
> diff --git a/meson.build b/meson.build
> index b3e7ec0e92..1b30dd7bdc 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1897,50 +1897,15 @@ if get_option('cfi') and slirp_opt == 'system'
>   endif
>   
>   fdt = not_found
> -fdt_opt = get_option('fdt')
> -if have_system
> -  if fdt_opt in ['enabled', 'auto', 'system']
> -    have_internal = fs.exists(meson.current_source_dir() / 'dtc/libfdt/Makefile.libfdt')
> -    fdt = cc.find_library('fdt', kwargs: static_kwargs,
> -                          required: fdt_opt == 'system' or
> -                                    fdt_opt == 'enabled' and not have_internal)
> -    if fdt.found() and cc.links('''
> -       #include <libfdt.h>
> -       #include <libfdt_env.h>
> -       int main(void) { fdt_check_full(NULL, 0); return 0; }''',
> -         dependencies: fdt)
> -      fdt_opt = 'system'
> -    elif have_internal
> -      fdt_opt = 'internal'
> -    else
> -      fdt_opt = 'disabled'
> +if fdt_required.length() > 0
> +    fdt = cc.find_library('fdt', kwargs: static_kwargs)
> +    if not fdt.found() or not cc.links('''
> +#include <libfdt.h>
> +#include <libfdt_env.h>
> +int main(void) { fdt_first_subnode(NULL, 0); return 0; }''',
> +                                       dependencies: fdt)
> +      error('fdt >= 1.4.2 required by targets ' + ', '.join(fdt_required))
>       endif
> -  endif
> -  if fdt_opt == 'internal'
> -    fdt_files = files(
> -      'dtc/libfdt/fdt.c',
> -      'dtc/libfdt/fdt_ro.c',
> -      'dtc/libfdt/fdt_wip.c',
> -      'dtc/libfdt/fdt_sw.c',
> -      'dtc/libfdt/fdt_rw.c',
> -      'dtc/libfdt/fdt_strerror.c',
> -      'dtc/libfdt/fdt_empty_tree.c',
> -      'dtc/libfdt/fdt_addresses.c',
> -      'dtc/libfdt/fdt_overlay.c',
> -      'dtc/libfdt/fdt_check.c',
> -    )
> -
> -    fdt_inc = include_directories('dtc/libfdt')
> -    libfdt = static_library('fdt',
> -                            build_by_default: false,
> -                            sources: fdt_files,
> -                            include_directories: fdt_inc)
> -    fdt = declare_dependency(link_with: libfdt,
> -                             include_directories: fdt_inc)
> -  endif
> -endif
> -if not fdt.found() and fdt_required.length() > 0
> -  error('fdt not available but required by targets ' + ', '.join(fdt_required))
>   endif
>   
>   config_host_data.set('CONFIG_CAPSTONE', capstone.found())
> @@ -3069,7 +3034,7 @@ summary_info += {'Linux io_uring support': linux_io_uring.found()}
>   summary_info += {'ATTR/XATTR support': libattr.found()}
>   summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
>   summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
> -summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
> +summary_info += {'fdt support':       fdt.found()}
>   summary_info += {'libcap-ng support': libcap_ng.found()}
>   summary_info += {'bpf support': libbpf.found()}
>   # TODO: add back protocol and server version
> diff --git a/.gitmodules b/.gitmodules
> index 08b1b48a09..582303698b 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -16,9 +16,6 @@
>   [submodule "roms/sgabios"]
>   	path = roms/sgabios
>   	url = https://gitlab.com/qemu-project/sgabios.git
> -[submodule "dtc"]
> -	path = dtc
> -	url = https://gitlab.com/qemu-project/dtc.git
>   [submodule "roms/u-boot"]
>   	path = roms/u-boot
>   	url = https://gitlab.com/qemu-project/u-boot.git
> diff --git a/dtc b/dtc
> deleted file mode 160000
> index 85e5d83984..0000000000
> --- a/dtc
> +++ /dev/null
> @@ -1 +0,0 @@
> -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
> diff --git a/meson_options.txt b/meson_options.txt
> index a9a9b8f4c6..8ba5433356 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -152,6 +152,3 @@ option('capstone', type: 'combo', value: 'auto',
>   option('slirp', type: 'combo', value: 'auto',
>          choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
>          description: 'Whether and how to find the slirp library')
> -option('fdt', type: 'combo', value: 'auto',
> -       choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
> -       description: 'Whether and how to find the libfdt library')

My initial concern here was whether dtc packages are available for native Windows 
builds, although it seems that MSYS2 does carry a dtc package: 
https://packages.msys2.org/search?q=dtc.

Presumably this would be the last part of a larger patchset to include the dtc 
package in the docker images used by the Gitlab CI builds?


ATB,

Mark.

