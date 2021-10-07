Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85848425DFD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:48:21 +0200 (CEST)
Received: from localhost ([::1]:41368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaJQ-0005Xn-Ht
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaCk-0003iO-CM
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:26 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaCc-0005MZ-06
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:26 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r7so22828462wrc.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a+mhCM0sN/U8/CXoXxAobObQhQqplVOd/IUD0mQ9Ig4=;
 b=cvknoKYocEy/pkLQn4lb/OfLi1b0Hiqa+ZOSAWlclxM+CVaVRVxq+mtBwixWiY8TxF
 foXkdxSAuySEbE9syfqqpj6qKmvh4pCURhWiCBFzm8lZ4h2DOfSJZxxXuvq35AU9WTrN
 5pl/pMJ246qb0eH40b5Bv0Wv27N3+7qgg1eYb5VxOKPGhf5kiKkQZoh19WDFWATFBMgU
 XbPbs5760HjDjl3hUId30Q94jhQ0cz5FoXHrvmCHEXzdxD0qht3BuNSmrzUMMYN61KA3
 jnDNXPi/mXQMXuQ0t4fPCIzDnx3cMwdRJsA6ueDxzwcoo5yUjgLt/c03ODaOrK3tfTBZ
 6AUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a+mhCM0sN/U8/CXoXxAobObQhQqplVOd/IUD0mQ9Ig4=;
 b=6Ljxl1mblsvAnZJfuzaMvv8aOlNoNvsc3Lx+3RUQ8Rhcb79U83cG87q/sINevhgzlh
 p+DPExL5oGGiZsNlhQpuwI6JJVRbtMmb1bKRxZdquEbbsZzs5LWz2CLbOad7eKZOMPaU
 yhIcYBCZwZMyQOFVXRdU9Guau/I/nSQUAXUQ8HW9+KoY3EqXuYbTLUFhayom0eCVHqMz
 zBolxx/Fx1EwrHlm1isPRvb8JACrv4vdAb8/nDyQCsVaXjiYNeki3JYGRxv5pv7pJUaj
 YoIYEqrqQJNEb47WrkloApxipiIjdWVrVJe+0enUaGef+Z0vtwH0ejLgWHuEKQCA6Wt7
 9rTQ==
X-Gm-Message-State: AOAM532sMiMiPWCRl7UscMyVJuHwyJ5b/Tg8SqkV3CfwdWm+gVh2NIIT
 iWnxvvwNlu3PinHlSD5h9DSZ/IFkoGsZkUy9gIg=
X-Google-Smtp-Source: ABdhPJySVRkqQW/YoHm+JL4bYKruXHT0TAGKAmOgpb8wt/wYaKioC7Ynoi0ymCSvK5pBOpFlkBhKCiBIdtY5ImfhMCc=
X-Received: by 2002:a1c:a5cd:: with SMTP id o196mr7228681wme.96.1633639276041; 
 Thu, 07 Oct 2021 13:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-19-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-19-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:03 +0400
Message-ID: <CAJ+F1C+YriVhkYRtiHe=US3MmhEyLkVPnfwuAJqYvSOCR-uGEg@mail.gmail.com>
Subject: Re: [PATCH 24/24] configure: automatically parse command line for
 meson -D options
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bd5aae05cdc9489f"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bd5aae05cdc9489f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Oct 7, 2021 at 5:28 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Right now meson_options.txt lists about 90 options.  Each option
> needs code in configure to parse it and pass the option down to Meson as
> a -D command-line argument; in addition the default must be duplicated
> between configure and meson_options.txt.  This series tries to remove
> the code duplication by generating the case statement for those --enable
> and --disable options, as well as the corresponding help text.
>
> About 80% of the options can be handled completely by the new mechanism.
> Eight meson options are not of the --enable/--disable kind.  Six more nee=
d
> to be parsed in configure for various reasons documented in the patch,
> but they still have their help automatically generated.
>
> The advantages are:
>
> - less code in configure
>
> - parsing and help is more consistent (for example --enable-blobs was
>   not supported)
>
> - options are described entirely in one place, meson_options.txt.
>   This make it more attractive to use Meson options instead of
>   hand-crafted configure options and config-host.mak
>
> A few options change name: --enable-tcmalloc and --enable-jemalloc
> become --enable-malloc=3D{tcmalloc,jemalloc}; --disable-blobs becomes
> --disable-install-blobs; --enable-trace-backend becomes
> --enable-trace-backends.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

I have not investigated why, but this broke at least
--enable-trace-backend=3Dlog for me:
ERROR: unknown option --enable-trace-backend=3Dlog

---
>  configure                     | 540 ++--------------------------------
>  docs/devel/build-system.rst   | 133 +++++----
>  meson_options.txt             |   8 +
>  scripts/meson-buildoptions.py |  92 ++++++
>  scripts/meson-buildoptions.sh | 256 ++++++++++++++++
>  5 files changed, 449 insertions(+), 580 deletions(-)
>
> diff --git a/configure b/configure
> index d979476e03..4e1dfbea14 100755
> --- a/configure
> +++ b/configure
> @@ -286,41 +286,8 @@ for opt do
>    esac
>  done
>
> -brlapi=3D"auto"
> -curl=3D"auto"
> -iconv=3D"auto"
> -curses=3D"auto"
> -docs=3D"auto"
> -fdt=3D"auto"
> -netmap=3D"auto"
> -sdl=3D"auto"
> -sdl_image=3D"auto"
> -virtiofsd=3D"auto"
> -virtfs=3D"auto"
> -libudev=3D"auto"
> -mpath=3D"auto"
> -vnc=3D"auto"
> -sparse=3D"auto"
> -vde=3D"auto"
> -vnc_sasl=3D"auto"
> -vnc_jpeg=3D"auto"
> -vnc_png=3D"auto"
> -xkbcommon=3D"auto"
> -alsa=3D"auto"
> -coreaudio=3D"auto"
> -dsound=3D"auto"
> -jack=3D"auto"
> -oss=3D"auto"
> -pa=3D"auto"
> -xen=3D${default_feature:+disabled}
>  xen_ctrl_version=3D"$default_feature"
> -xen_pci_passthrough=3D"auto"
> -linux_aio=3D"auto"
> -linux_io_uring=3D"auto"
> -cap_ng=3D"auto"
> -attr=3D"auto"
>  xfs=3D"$default_feature"
> -tcg=3D"enabled"
>  membarrier=3D"$default_feature"
>  vhost_kernel=3D"$default_feature"
>  vhost_net=3D"$default_feature"
> @@ -328,15 +295,8 @@ vhost_crypto=3D"$default_feature"
>  vhost_scsi=3D"$default_feature"
>  vhost_vsock=3D"$default_feature"
>  vhost_user=3D"no"
> -vhost_user_blk_server=3D"auto"
>  vhost_user_fs=3D"$default_feature"
>  vhost_vdpa=3D"$default_feature"
> -bpf=3D"auto"
> -kvm=3D"auto"
> -hax=3D"auto"
> -hvf=3D"auto"
> -whpx=3D"auto"
> -nvmm=3D"auto"
>  rdma=3D"$default_feature"
>  pvrdma=3D"$default_feature"
>  gprof=3D"no"
> @@ -346,7 +306,6 @@ sanitizers=3D"no"
>  tsan=3D"no"
>  fortify_source=3D"$default_feature"
>  strip_opt=3D"yes"
> -tcg_interpreter=3D"false"
>  mingw32=3D"no"
>  gcov=3D"no"
>  EXESUF=3D""
> @@ -354,62 +313,32 @@ modules=3D"no"
>  module_upgrades=3D"no"
>  prefix=3D"/usr/local"
>  qemu_suffix=3D"qemu"
> -slirp=3D"auto"
>  bsd=3D"no"
>  linux=3D"no"
>  solaris=3D"no"
>  profiler=3D"no"
> -cocoa=3D"auto"
>  softmmu=3D"yes"
>  linux_user=3D"no"
>  bsd_user=3D"no"
> -blobs=3D"true"
>  pkgversion=3D""
>  pie=3D""
>  qom_cast_debug=3D"yes"
>  trace_backends=3D"log"
>  trace_file=3D"trace"
> -spice=3D"auto"
> -spice_protocol=3D"auto"
> -rbd=3D"auto"
> -smartcard=3D"auto"
> -u2f=3D"auto"
> -libusb=3D"auto"
> -usb_redir=3D"auto"
>  opengl=3D"$default_feature"
>  cpuid_h=3D"no"
>  avx2_opt=3D"$default_feature"
> -capstone=3D"auto"
> -lzo=3D"auto"
> -snappy=3D"auto"
> -bzip2=3D"auto"
> -lzfse=3D"auto"
> -zstd=3D"auto"
>  guest_agent=3D"$default_feature"
>  guest_agent_with_vss=3D"no"
>  guest_agent_ntddscsi=3D"no"
> -guest_agent_msi=3D"auto"
>  vss_win32_sdk=3D"$default_feature"
>  win_sdk=3D"no"
>  want_tools=3D"$default_feature"
> -libiscsi=3D"auto"
> -libnfs=3D"auto"
>  coroutine=3D""
>  coroutine_pool=3D"$default_feature"
>  debug_stack_usage=3D"no"
>  crypto_afalg=3D"no"
> -cfi=3D"false"
> -cfi_debug=3D"false"
> -seccomp=3D"auto"
> -glusterfs=3D"auto"
> -gtk=3D"auto"
>  tls_priority=3D"NORMAL"
> -gnutls=3D"auto"
> -nettle=3D"auto"
> -gcrypt=3D"auto"
> -auth_pam=3D"auto"
> -vte=3D"auto"
> -virglrenderer=3D"auto"
>  tpm=3D"$default_feature"
>  libssh=3D"$default_feature"
>  live_block_migration=3D${default_feature:-yes}
> @@ -427,24 +356,34 @@ qed=3D${default_feature:-yes}
>  parallels=3D${default_feature:-yes}
>  libxml2=3D"auto"
>  debug_mutex=3D"no"
> -libpmem=3D"auto"
> -default_devices=3D"true"
>  plugins=3D"$default_feature"
> -fuzzing=3D"false"
>  rng_none=3D"no"
>  secret_keyring=3D"$default_feature"
>  libdaxctl=3D"auto"
>  meson=3D""
> +meson_args=3D""
>  ninja=3D""
> +gio=3D"$default_feature"
>  skip_meson=3Dno
> -gettext=3D"auto"
> -fuse=3D"auto"
> -fuse_lseek=3D"auto"
> -multiprocess=3D"auto"
>  slirp_smbd=3D"$default_feature"
>
> -malloc_trim=3D"auto"
> -gio=3D"$default_feature"
> +# The following Meson options are handled manually (still they
> +# are included in the automatically generated help message)
> +
> +# 1. Track which submodules are needed
> +capstone=3D"auto"
> +fdt=3D"auto"
> +slirp=3D"auto"
> +
> +# 2. Support --with/--without option
> +default_devices=3D"true"
> +
> +# 3. Automatically enable/disable other options
> +tcg=3D"enabled"
> +cfi=3D"false"
> +
> +# 4. Detection partly done in configure
> +xen=3D${default_feature:+disabled}
>
>  # parse CC options second
>  for opt do
> @@ -874,11 +813,6 @@ for opt do
>                         error_exit "Can't mix --target-list-exclude with
> --target-list"
>                     fi
>    ;;
> -  --enable-trace-backends=3D*) trace_backends=3D"$optarg"
> -  ;;
> -  # XXX: backwards compatibility
> -  --enable-trace-backend=3D*) trace_backends=3D"$optarg"
> -  ;;
>    --with-trace-file=3D*) trace_file=3D"$optarg"
>    ;;
>    --with-default-devices) default_devices=3D"true"
> @@ -941,42 +875,10 @@ for opt do
>      # configure to be used by RPM and similar macros that set
>      # lots of directory switches by default.
>    ;;
> -  --disable-sdl) sdl=3D"disabled"
> -  ;;
> -  --enable-sdl) sdl=3D"enabled"
> -  ;;
> -  --disable-sdl-image) sdl_image=3D"disabled"
> -  ;;
> -  --enable-sdl-image) sdl_image=3D"enabled"
> -  ;;
>    --disable-qom-cast-debug) qom_cast_debug=3D"no"
>    ;;
>    --enable-qom-cast-debug) qom_cast_debug=3D"yes"
>    ;;
> -  --disable-virtfs) virtfs=3D"disabled"
> -  ;;
> -  --enable-virtfs) virtfs=3D"enabled"
> -  ;;
> -  --disable-libudev) libudev=3D"disabled"
> -  ;;
> -  --enable-libudev) libudev=3D"enabled"
> -  ;;
> -  --disable-virtiofsd) virtiofsd=3D"disabled"
> -  ;;
> -  --enable-virtiofsd) virtiofsd=3D"enabled"
> -  ;;
> -  --disable-mpath) mpath=3D"disabled"
> -  ;;
> -  --enable-mpath) mpath=3D"enabled"
> -  ;;
> -  --disable-vnc) vnc=3D"disabled"
> -  ;;
> -  --enable-vnc) vnc=3D"enabled"
> -  ;;
> -  --disable-gettext) gettext=3D"disabled"
> -  ;;
> -  --enable-gettext) gettext=3D"enabled"
> -  ;;
>    --audio-drv-list=3D*) audio_drv_list=3D"$optarg"
>    ;;
>    --block-drv-rw-whitelist=3D*|--block-drv-whitelist=3D*)
> block_drv_rw_whitelist=3D$(echo "$optarg" | sed -e 's/,/ /g')
> @@ -1007,24 +909,8 @@ for opt do
>    ;;
>    --disable-tsan) tsan=3D"no"
>    ;;
> -  --enable-sparse) sparse=3D"enabled"
> -  ;;
> -  --disable-sparse) sparse=3D"disabled"
> -  ;;
>    --disable-strip) strip_opt=3D"no"
>    ;;
> -  --disable-vnc-sasl) vnc_sasl=3D"disabled"
> -  ;;
> -  --enable-vnc-sasl) vnc_sasl=3D"enabled"
> -  ;;
> -  --disable-vnc-jpeg) vnc_jpeg=3D"disabled"
> -  ;;
> -  --enable-vnc-jpeg) vnc_jpeg=3D"enabled"
> -  ;;
> -  --disable-vnc-png) vnc_png=3D"disabled"
> -  ;;
> -  --enable-vnc-png) vnc_png=3D"enabled"
> -  ;;
>    --disable-slirp) slirp=3D"disabled"
>    ;;
>    --enable-slirp) slirp=3D"enabled"
> @@ -1033,113 +919,17 @@ for opt do
>    ;;
>    --enable-slirp=3D*) slirp=3D"$optarg"
>    ;;
> -  --disable-vde) vde=3D"disabled"
> -  ;;
> -  --enable-vde) vde=3D"enabled"
> -  ;;
> -  --disable-netmap) netmap=3D"disabled"
> -  ;;
> -  --enable-netmap) netmap=3D"enabled"
> -  ;;
>    --disable-xen) xen=3D"disabled"
>    ;;
>    --enable-xen) xen=3D"enabled"
>    ;;
> -  --disable-xen-pci-passthrough) xen_pci_passthrough=3D"disabled"
> -  ;;
> -  --enable-xen-pci-passthrough) xen_pci_passthrough=3D"enabled"
> -  ;;
> -  --disable-alsa) alsa=3D"disabled"
> -  ;;
> -  --enable-alsa) alsa=3D"enabled"
> -  ;;
> -  --disable-coreaudio) coreaudio=3D"disabled"
> -  ;;
> -  --enable-coreaudio) coreaudio=3D"enabled"
> -  ;;
> -  --disable-dsound) dsound=3D"disabled"
> -  ;;
> -  --enable-dsound) dsound=3D"enabled"
> -  ;;
> -  --disable-jack) jack=3D"disabled"
> -  ;;
> -  --enable-jack) jack=3D"enabled"
> -  ;;
> -  --disable-oss) oss=3D"disabled"
> -  ;;
> -  --enable-oss) oss=3D"enabled"
> -  ;;
> -  --disable-pa) pa=3D"disabled"
> -  ;;
> -  --enable-pa) pa=3D"enabled"
> -  ;;
> -  --disable-brlapi) brlapi=3D"disabled"
> -  ;;
> -  --enable-brlapi) brlapi=3D"enabled"
> -  ;;
> -  --disable-kvm) kvm=3D"disabled"
> -  ;;
> -  --enable-kvm) kvm=3D"enabled"
> -  ;;
> -  --disable-hax) hax=3D"disabled"
> -  ;;
> -  --enable-hax) hax=3D"enabled"
> -  ;;
> -  --disable-hvf) hvf=3D"disabled"
> -  ;;
> -  --enable-hvf) hvf=3D"enabled"
> -  ;;
> -  --disable-nvmm) nvmm=3D"disabled"
> -  ;;
> -  --enable-nvmm) nvmm=3D"enabled"
> -  ;;
> -  --disable-whpx) whpx=3D"disabled"
> -  ;;
> -  --enable-whpx) whpx=3D"enabled"
> -  ;;
> -  --disable-tcg-interpreter) tcg_interpreter=3D"false"
> -  ;;
> -  --enable-tcg-interpreter) tcg_interpreter=3D"true"
> -  ;;
> -  --disable-cap-ng)  cap_ng=3D"disabled"
> -  ;;
> -  --enable-cap-ng) cap_ng=3D"enabled"
> -  ;;
>    --disable-tcg) tcg=3D"disabled"
>                   plugins=3D"no"
>    ;;
>    --enable-tcg) tcg=3D"enabled"
>    ;;
> -  --disable-malloc-trim) malloc_trim=3D"disabled"
> -  ;;
> -  --enable-malloc-trim) malloc_trim=3D"enabled"
> -  ;;
> -  --disable-spice) spice=3D"no"
> -  ;;
> -  --enable-spice)
> -      spice_protocol=3D"yes"
> -      spice=3D"yes"
> -  ;;
> -  --disable-spice-protocol)
> -      spice_protocol=3D"no"
> -      spice=3D"no"
> -  ;;
> -  --enable-spice-protocol) spice_protocol=3D"yes"
> -  ;;
> -  --disable-libiscsi) libiscsi=3D"disabled"
> -  ;;
> -  --enable-libiscsi) libiscsi=3D"enabled"
> -  ;;
> -  --disable-libnfs) libnfs=3D"disabled"
> -  ;;
> -  --enable-libnfs) libnfs=3D"enabled"
> -  ;;
>    --enable-profiler) profiler=3D"yes"
>    ;;
> -  --disable-cocoa) cocoa=3D"disabled"
> -  ;;
> -  --enable-cocoa) cocoa=3D"enabled"
> -  ;;
>    --disable-system) softmmu=3D"no"
>    ;;
>    --enable-system) softmmu=3D"yes"
> @@ -1183,22 +973,6 @@ for opt do
>    ;;
>    --disable-cfi) cfi=3D"false"
>    ;;
> -  --enable-cfi-debug) cfi_debug=3D"true"
> -  ;;
> -  --disable-cfi-debug) cfi_debug=3D"false"
> -  ;;
> -  --disable-curses) curses=3D"disabled"
> -  ;;
> -  --enable-curses) curses=3D"enabled"
> -  ;;
> -  --disable-iconv) iconv=3D"disabled"
> -  ;;
> -  --enable-iconv) iconv=3D"enabled"
> -  ;;
> -  --disable-curl) curl=3D"disabled"
> -  ;;
> -  --enable-curl) curl=3D"enabled"
> -  ;;
>    --disable-fdt) fdt=3D"disabled"
>    ;;
>    --enable-fdt) fdt=3D"enabled"
> @@ -1207,28 +981,10 @@ for opt do
>    ;;
>    --enable-fdt=3D*) fdt=3D"$optarg"
>    ;;
> -  --disable-linux-aio) linux_aio=3D"disabled"
> -  ;;
> -  --enable-linux-aio) linux_aio=3D"enabled"
> -  ;;
> -  --disable-linux-io-uring) linux_io_uring=3D"disabled"
> -  ;;
> -  --enable-linux-io-uring) linux_io_uring=3D"enabled"
> -  ;;
> -  --disable-attr) attr=3D"disabled"
> -  ;;
> -  --enable-attr) attr=3D"enabled"
> -  ;;
>    --disable-membarrier) membarrier=3D"no"
>    ;;
>    --enable-membarrier) membarrier=3D"yes"
>    ;;
> -  --disable-bpf) bpf=3D"disabled"
> -  ;;
> -  --enable-bpf) bpf=3D"enabled"
> -  ;;
> -  --disable-blobs) blobs=3D"false"
> -  ;;
>    --with-pkgversion=3D*) pkgversion=3D"$optarg"
>    ;;
>    --with-coroutine=3D*) coroutine=3D"$optarg"
> @@ -1243,10 +999,6 @@ for opt do
>    ;;
>    --disable-crypto-afalg) crypto_afalg=3D"no"
>    ;;
> -  --disable-docs) docs=3D"disabled"
> -  ;;
> -  --enable-docs) docs=3D"enabled"
> -  ;;
>    --disable-vhost-net) vhost_net=3D"no"
>    ;;
>    --enable-vhost-net) vhost_net=3D"yes"
> @@ -1263,10 +1015,6 @@ for opt do
>    ;;
>    --enable-vhost-vsock) vhost_vsock=3D"yes"
>    ;;
> -  --disable-vhost-user-blk-server) vhost_user_blk_server=3D"disabled"
> -  ;;
> -  --enable-vhost-user-blk-server) vhost_user_blk_server=3D"enabled"
> -  ;;
>    --disable-vhost-user-fs) vhost_user_fs=3D"no"
>    ;;
>    --enable-vhost-user-fs) vhost_user_fs=3D"yes"
> @@ -1275,60 +1023,16 @@ for opt do
>    ;;
>    --enable-opengl) opengl=3D"yes"
>    ;;
> -  --disable-rbd) rbd=3D"disabled"
> -  ;;
> -  --enable-rbd) rbd=3D"enabled"
> -  ;;
>    --disable-xfsctl) xfs=3D"no"
>    ;;
>    --enable-xfsctl) xfs=3D"yes"
>    ;;
> -  --disable-smartcard) smartcard=3D"disabled"
> -  ;;
> -  --enable-smartcard) smartcard=3D"enabled"
> -  ;;
> -  --disable-u2f) u2f=3D"disabled"
> -  ;;
> -  --enable-u2f) u2f=3D"enabled"
> -  ;;
> -  --disable-libusb) libusb=3D"disabled"
> -  ;;
> -  --enable-libusb) libusb=3D"enabled"
> -  ;;
> -  --disable-usb-redir) usb_redir=3D"disabled"
> -  ;;
> -  --enable-usb-redir) usb_redir=3D"enabled"
> -  ;;
>    --disable-zlib-test)
>    ;;
> -  --disable-lzo) lzo=3D"disabled"
> -  ;;
> -  --enable-lzo) lzo=3D"enabled"
> -  ;;
> -  --disable-snappy) snappy=3D"disabled"
> -  ;;
> -  --enable-snappy) snappy=3D"enabled"
> -  ;;
> -  --disable-bzip2) bzip2=3D"disabled"
> -  ;;
> -  --enable-bzip2) bzip2=3D"enabled"
> -  ;;
> -  --enable-lzfse) lzfse=3D"enabled"
> -  ;;
> -  --disable-lzfse) lzfse=3D"disabled"
> -  ;;
> -  --disable-zstd) zstd=3D"disabled"
> -  ;;
> -  --enable-zstd) zstd=3D"enabled"
> -  ;;
>    --enable-guest-agent) guest_agent=3D"yes"
>    ;;
>    --disable-guest-agent) guest_agent=3D"no"
>    ;;
> -  --enable-guest-agent-msi) guest_agent_msi=3D"enabled"
> -  ;;
> -  --disable-guest-agent-msi) guest_agent_msi=3D"disabled"
> -  ;;
>    --with-vss-sdk) vss_win32_sdk=3D""
>    ;;
>    --with-vss-sdk=3D*) vss_win32_sdk=3D"$optarg"
> @@ -1345,12 +1049,6 @@ for opt do
>    ;;
>    --disable-tools) want_tools=3D"no"
>    ;;
> -  --enable-seccomp) seccomp=3D"enabled"
> -  ;;
> -  --disable-seccomp) seccomp=3D"disabled"
> -  ;;
> -  --disable-glusterfs) glusterfs=3D"disabled"
> -  ;;
>    --disable-avx2) avx2_opt=3D"no"
>    ;;
>    --enable-avx2) avx2_opt=3D"yes"
> @@ -1359,9 +1057,6 @@ for opt do
>    ;;
>    --enable-avx512f) avx512f_opt=3D"yes"
>    ;;
> -
> -  --enable-glusterfs) glusterfs=3D"enabled"
> -  ;;
>    --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
>        echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&=
2
>    ;;
> @@ -1371,28 +1066,8 @@ for opt do
>    --enable-uuid|--disable-uuid)
>        echo "$0: $opt is obsolete, UUID support is always built" >&2
>    ;;
> -  --disable-gtk) gtk=3D"disabled"
> -  ;;
> -  --enable-gtk) gtk=3D"enabled"
> -  ;;
>    --tls-priority=3D*) tls_priority=3D"$optarg"
>    ;;
> -  --disable-gnutls) gnutls=3D"disabled"
> -  ;;
> -  --enable-gnutls) gnutls=3D"enabled"
> -  ;;
> -  --disable-nettle) nettle=3D"disabled"
> -  ;;
> -  --enable-nettle) nettle=3D"enabled"
> -  ;;
> -  --disable-gcrypt) gcrypt=3D"disabled"
> -  ;;
> -  --enable-gcrypt) gcrypt=3D"enabled"
> -  ;;
> -  --disable-auth-pam) auth_pam=3D"disabled"
> -  ;;
> -  --enable-auth-pam) auth_pam=3D"enabled"
> -  ;;
>    --enable-rdma) rdma=3D"yes"
>    ;;
>    --disable-rdma) rdma=3D"no"
> @@ -1401,14 +1076,6 @@ for opt do
>    ;;
>    --disable-pvrdma) pvrdma=3D"no"
>    ;;
> -  --disable-vte) vte=3D"disabled"
> -  ;;
> -  --enable-vte) vte=3D"enabled"
> -  ;;
> -  --disable-virglrenderer) virglrenderer=3D"disabled"
> -  ;;
> -  --enable-virglrenderer) virglrenderer=3D"enabled"
> -  ;;
>    --disable-tpm) tpm=3D"no"
>    ;;
>    --enable-tpm) tpm=3D"yes"
> @@ -1425,18 +1092,6 @@ for opt do
>    ;;
>    --enable-numa) numa=3D"yes"
>    ;;
> -  --disable-libxml2) libxml2=3D"disabled"
> -  ;;
> -  --enable-libxml2) libxml2=3D"enabled"
> -  ;;
> -  --disable-tcmalloc) tcmalloc=3D"no"
> -  ;;
> -  --enable-tcmalloc) tcmalloc=3D"yes"
> -  ;;
> -  --disable-jemalloc) jemalloc=3D"no"
> -  ;;
> -  --enable-jemalloc) jemalloc=3D"yes"
> -  ;;
>    --disable-replication) replication=3D"no"
>    ;;
>    --enable-replication) replication=3D"yes"
> @@ -1502,14 +1157,6 @@ for opt do
>    ;;
>    --disable-debug-mutex) debug_mutex=3Dno
>    ;;
> -  --enable-libpmem) libpmem=3D"enabled"
> -  ;;
> -  --disable-libpmem) libpmem=3D"disabled"
> -  ;;
> -  --enable-xkbcommon) xkbcommon=3D"enabled"
> -  ;;
> -  --disable-xkbcommon) xkbcommon=3D"disabled"
> -  ;;
>    --enable-plugins) if test "$mingw32" =3D "yes"; then
>                          error_exit "TCG plugins not currently supported
> on Windows platforms"
>                      else
> @@ -1522,10 +1169,6 @@ for opt do
>    ;;
>    --disable-containers) use_containers=3D"no"
>    ;;
> -  --enable-fuzzing) fuzzing=3Dtrue
> -  ;;
> -  --disable-fuzzing) fuzzing=3Dfalse
> -  ;;
>    --gdb=3D*) gdb_bin=3D"$optarg"
>    ;;
>    --enable-rng-none) rng_none=3Dyes
> @@ -1536,22 +1179,6 @@ for opt do
>    ;;
>    --disable-keyring) secret_keyring=3D"no"
>    ;;
> -  --enable-libdaxctl) libdaxctl=3D"enabled"
> -  ;;
> -  --disable-libdaxctl) libdaxctl=3D"disabled"
> -  ;;
> -  --enable-fuse) fuse=3D"enabled"
> -  ;;
> -  --disable-fuse) fuse=3D"disabled"
> -  ;;
> -  --enable-fuse-lseek) fuse_lseek=3D"enabled"
> -  ;;
> -  --disable-fuse-lseek) fuse_lseek=3D"disabled"
> -  ;;
> -  --enable-multiprocess) multiprocess=3D"enabled"
> -  ;;
> -  --disable-multiprocess) multiprocess=3D"disabled"
> -  ;;
>    --enable-gio) gio=3Dyes
>    ;;
>    --disable-gio) gio=3Dno
> @@ -1714,9 +1341,6 @@ for config in $mak_wilds; do
>      fi
>  done
>
> -# Enumerate public trace backends for --help output
> -trace_backend_list=3D$(echo $(grep -le '^PUBLIC =3D True$'
> "$source_path"/scripts/tracetool/backend/*.py | sed -e
> 's/^.*\/\(.*\)\.py$/\1/'))
> -
>  if test x"$show_help" =3D x"yes" ; then
>  cat << EOF
>
> @@ -1793,18 +1417,12 @@ Advanced options (experts only):
>                             (by default affects only QEMU, not tools like
> qemu-img)
>    --enable-block-drv-whitelist-in-tools
>                             use block whitelist also in tools instead of
> only QEMU
> -  --enable-trace-backends=3DB Set trace backend
> -                           Available backends: $trace_backend_list
>    --with-trace-file=3DNAME   Full PATH,NAME of file to store traces
>                             Default:trace-<pid>
> -  --disable-slirp          disable SLIRP userspace network connectivity
> -  --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter,
> experimental and slow)
> -  --enable-malloc-trim     enable libc malloc_trim() for memory
> optimization
>    --cpu=3DCPU                Build for host CPU [$cpu]
>    --with-coroutine=3DBACKEND coroutine backend. Supported options:
>                             ucontext, sigaltstack, windows
>    --enable-gcov            enable test coverage analysis with gcov
> -  --disable-blobs          disable installing provided firmware blobs
>    --with-vss-sdk=3DSDK-path  enable Windows VSS support in QEMU Guest Ag=
ent
>    --with-win-sdk=3DSDK-path  path to Windows Platform SDK (to build VSS
> .tlb)
>    --tls-priority           default TLS protocol/cipher priority string
> @@ -1823,9 +1441,7 @@ cat << EOF
>    user            supported user emulation targets
>    linux-user      all linux usermode emulation targets
>    bsd-user        all BSD usermode emulation targets
> -  docs            build documentation
>    guest-agent     build the QEMU Guest Agent
> -  guest-agent-msi build guest agent Windows MSI installation package
>    pie             Position Independent Executables
>    modules         modules support (non-Windows)
>    module-upgrades try to load modules from alternate paths for upgrades
> @@ -1835,98 +1451,26 @@ cat << EOF
>    sparse          sparse checker
>    safe-stack      SafeStack Stack Smash Protection. Depends on
>                    clang/llvm >=3D 3.7 and requires coroutine backend
> ucontext.
> -  cfi             Enable Control-Flow Integrity for indirect function
> calls.
> -                  In case of a cfi violation, QEMU is terminated with
> SIGILL
> -                  Depends on lto and is incompatible with modules
> -                  Automatically enables Link-Time Optimization (lto)
> -  cfi-debug       In case of a cfi violation, a message containing the
> line that
> -                  triggered the error is written to stderr. After the
> error,
> -                  QEMU is still terminated with SIGILL
> -  gnutls          GNUTLS cryptography support
> -  nettle          nettle cryptography support
> -  gcrypt          libgcrypt cryptography support
> -  auth-pam        PAM access control
> -  sdl             SDL UI
> -  sdl-image       SDL Image support for icons
> -  gtk             gtk UI
> -  vte             vte support for the gtk UI
> -  curses          curses UI
> -  iconv           font glyph conversion support
> -  vnc             VNC UI support
> -  vnc-sasl        SASL encryption for VNC server
> -  vnc-jpeg        JPEG lossy compression for VNC server
> -  vnc-png         PNG compression for VNC server
> -  cocoa           Cocoa UI (Mac OS X only)
> -  virtfs          VirtFS
> -  virtiofsd       build virtiofs daemon (virtiofsd)
> -  libudev         Use libudev to enumerate host devices
> -  mpath           Multipath persistent reservation passthrough
> -  xen             xen backend driver support
> -  xen-pci-passthrough    PCI passthrough support for Xen
> -  alsa            ALSA sound support
> -  coreaudio       CoreAudio sound support
> -  dsound          DirectSound sound support
> -  jack            JACK sound support
> -  oss             OSS sound support
> -  pa              PulseAudio sound support
> -  brlapi          BrlAPI (Braile)
> -  curl            curl connectivity
>    membarrier      membarrier system call (for Linux 4.14+ or Windows)
> -  fdt             fdt device tree
> -  kvm             KVM acceleration support
> -  hax             HAX acceleration support
> -  hvf             Hypervisor.framework acceleration support
> -  nvmm            NVMM acceleration support
> -  whpx            Windows Hypervisor Platform acceleration support
>    rdma            Enable RDMA-based migration
>    pvrdma          Enable PVRDMA support
> -  vde             support for vde network
> -  netmap          support for netmap network
> -  linux-aio       Linux AIO support
> -  linux-io-uring  Linux io_uring support
> -  cap-ng          libcap-ng support
> -  attr            attr and xattr support
>    vhost-net       vhost-net kernel acceleration support
>    vhost-vsock     virtio sockets device support
>    vhost-scsi      vhost-scsi kernel target support
>    vhost-crypto    vhost-user-crypto backend support
>    vhost-kernel    vhost kernel backend support
>    vhost-user      vhost-user backend support
> -  vhost-user-blk-server    vhost-user-blk server support
>    vhost-vdpa      vhost-vdpa kernel backend support
> -  bpf             BPF kernel support
> -  spice           spice
> -  spice-protocol  spice-protocol
> -  rbd             rados block device (rbd)
> -  libiscsi        iscsi support
> -  libnfs          nfs support
> -  smartcard       smartcard support (libcacard)
> -  u2f             U2F support (u2f-emu)
> -  libusb          libusb (for usb passthrough)
>    live-block-migration   Block migration in the main migration stream
> -  usb-redir       usb network redirection support
> -  lzo             support of lzo compression library
> -  snappy          support of snappy compression library
> -  bzip2           support of bzip2 compression library
> -                  (for reading bzip2-compressed dmg images)
> -  lzfse           support of lzfse compression library
> -                  (for reading lzfse-compressed dmg images)
> -  zstd            support for zstd compression library
> -                  (for migration compression and qcow2 cluster
> compression)
> -  seccomp         seccomp support
>    coroutine-pool  coroutine freelist (better performance)
> -  glusterfs       GlusterFS backend
>    tpm             TPM support
>    libssh          ssh block device support
>    numa            libnuma support
>    libxml2         for Parallels image format
> -  tcmalloc        tcmalloc support
> -  jemalloc        jemalloc support
>    avx2            AVX2 optimization support
>    avx512f         AVX512F optimization support
>    replication     replication support
>    opengl          opengl support
> -  virglrenderer   virgl rendering support
>    xfsctl          xfsctl support
>    qom-cast-debug  cast debugging support
>    tools           build qemu-io, qemu-nbd and qemu-img tools
> @@ -1939,15 +1483,8 @@ cat << EOF
>    qed             qed image format support
>    parallels       parallels image format support
>    crypto-afalg    Linux AF_ALG crypto backend driver
> -  capstone        capstone disassembler support
>    debug-mutex     mutex debugging support
> -  libpmem         libpmem support
> -  xkbcommon       xkbcommon support
>    rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
> -  libdaxctl       libdaxctl support
> -  fuse            FUSE block device export
> -  fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
> -  multiprocess    Out of process device emulation support
>    gio             libgio support
>    slirp-smbd      use smbd (at path --smbd=3D*) in slirp networking
>
> @@ -3171,16 +2708,6 @@ EOF
>    fi
>  fi
>
> -malloc=3Dsystem
> -if test "$tcmalloc" =3D "yes" && test "$jemalloc" =3D "yes" ; then
> -    echo "ERROR: tcmalloc && jemalloc can't be used at the same time"
> -    exit 1
> -elif test "$tcmalloc" =3D "yes" ; then
> -    malloc=3Dtcmalloc
> -elif test "$jemalloc" =3D "yes" ; then
> -    malloc=3Djemalloc
> -fi
> -
>  # check for usbfs
>  have_usbfs=3Dno
>  if test "$linux_user" =3D "yes"; then
> @@ -4511,40 +4038,23 @@ if test "$skip_meson" =3D no; then
>          --sysconfdir "$sysconfdir" \
>          --localedir "$localedir" \
>          --localstatedir "$local_statedir" \
> +        -Daudio_drv_list=3D$audio_drv_list \
> +        -Ddefault_devices=3D$default_devices \
>          -Ddocdir=3D"$docdir" \
>          -Dqemu_firmwarepath=3D"$firmwarepath" \
>          -Dqemu_suffix=3D"$qemu_suffix" \
> +        -Dsphinx_build=3D"$sphinx_build" \
> +        -Dtrace_file=3D"$trace_file" \
>          -Doptimization=3D$(if test "$debug" =3D yes; then echo 0; else e=
cho
> 2; fi) \
>          -Ddebug=3D$(if test "$debug_info" =3D yes; then echo true; else =
echo
> false; fi) \
>          -Dwerror=3D$(if test "$werror" =3D yes; then echo true; else ech=
o
> false; fi) \
>          -Dstrip=3D$(if test "$strip_opt" =3D yes; then echo true; else e=
cho
> false; fi) \
>          -Db_pie=3D$(if test "$pie" =3D yes; then echo true; else echo fa=
lse;
> fi) \
>          -Db_coverage=3D$(if test "$gcov" =3D yes; then echo true; else e=
cho
> false; fi) \
> -        -Db_lto=3D$lto -Dcfi=3D$cfi -Dcfi_debug=3D$cfi_debug -Dfuzzing=
=3D$fuzzing
> \
> +        -Db_lto=3D$lto -Dcfi=3D$cfi -Dtcg=3D$tcg -Dxen=3D$xen \
> +        -Dcapstone=3D$capstone -Dfdt=3D$fdt -Dslirp=3D$slirp \
>          $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo
> "-Dfuzzing_engine=3D$LIB_FUZZING_ENGINE") \
> -        -Dmalloc=3D$malloc -Dmalloc_trim=3D$malloc_trim -Dsparse=3D$spar=
se \
> -        -Dkvm=3D$kvm -Dhax=3D$hax -Dwhpx=3D$whpx -Dhvf=3D$hvf -Dnvmm=3D$=
nvmm \
> -        -Dxen=3D$xen -Dxen_pci_passthrough=3D$xen_pci_passthrough -Dtcg=
=3D$tcg \
> -        -Dcocoa=3D$cocoa -Dgtk=3D$gtk -Dmpath=3D$mpath -Dsdl=3D$sdl
> -Dsdl_image=3D$sdl_image \
> -        -Dlibusb=3D$libusb -Dsmartcard=3D$smartcard -Dusb_redir=3D$usb_r=
edir
> -Dvte=3D$vte \
> -        -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=3D$vnc_jpeg
> -Dvnc_png=3D$vnc_png \
> -        -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon -Du2f=3D$u2f
> -Dvirtiofsd=3D$virtiofsd \
> -        -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=3D$fdt -Dbrlapi=3D=
$brlapi \
> -        -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip2=3D$bzip2
> -Dlibiscsi=3D$libiscsi \
> -        -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=3D$curses
> -Dlibudev=3D$libudev\
> -        -Drbd=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy -Dlzfse=3D$lzfse
> -Dlibxml2=3D$libxml2 \
> -        -Dlibdaxctl=3D$libdaxctl -Dlibpmem=3D$libpmem
> -Dlinux_io_uring=3D$linux_io_uring \
> -        -Dgnutls=3D$gnutls -Dnettle=3D$nettle -Dgcrypt=3D$gcrypt
> -Dauth_pam=3D$auth_pam \
> -        -Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvirtfs=3D$virtfs -Dcap_ng=
=3D$cap_ng
> \
> -        -Dattr=3D$attr -Ddefault_devices=3D$default_devices
> -Dvirglrenderer=3D$virglrenderer \
> -        -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=3D=
$blobs \
> -        -Dvhost_user_blk_server=3D$vhost_user_blk_server
> -Dmultiprocess=3D$multiprocess \
> -        -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek
> -Dguest_agent_msi=3D$guest_agent_msi -Dbpf=3D$bpf\
>          $(if test "$default_feature" =3D no; then echo
> "-Dauto_features=3Ddisabled"; fi) \
> -        -Dalsa=3D$alsa -Dcoreaudio=3D$coreaudio -Ddsound=3D$dsound -Djac=
k=3D$jack
> -Doss=3D$oss \
> -        -Dpa=3D$pa -Daudio_drv_list=3D$audio_drv_list
> -Dtcg_interpreter=3D$tcg_interpreter \
> -        -Dtrace_backends=3D$trace_backends -Dtrace_file=3D$trace_file
> -Dlinux_aio=3D$linux_aio \
> -        -Dnetmap=3D$netmap -Dvde=3D$vde \
>          "$@" $cross_arg "$PWD" "$source_path"
>    }
>    eval run_meson $meson_options
> diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
> index 0f636d620e..b79012b965 100644
> --- a/docs/devel/build-system.rst
> +++ b/docs/devel/build-system.rst
> @@ -42,73 +42,21 @@ perform a build:
>       ../configure
>       make
>
> -For now, checks on the compilation environment are found in configure
> -rather than meson.build, though this is expected to change.  The command
> -line is parsed in the configure script and, whenever needed, converted
> -into the appropriate options to Meson.
> -
> -New checks should be added to Meson, which usually comprises the
> -following tasks:
> -
> - - Add a Meson build option to meson_options.txt.
> -
> - - Add support to the command line arg parser to handle any new
> -   ``--enable-XXX``/``--disable-XXX`` flags required by the feature.
> -
> - - Add information to the help output message to report on the new
> -   feature flag.
> -
> - - Add code to perform the actual feature check.
> -
> - - Add code to include the feature status in ``config-host.h``
> -
> - - Add code to print out the feature status in the configure summary
> -   upon completion.
> -
> -
> -Taking the probe for SDL2_Image as an example, we have the following
> pieces
> -in configure::
> -
> -  # Initial variable state
> -  sdl_image=3Dauto
> -
> -  ..snip..
> -
> -  # Configure flag processing
> -  --disable-sdl-image) sdl_image=3Ddisabled
> -  ;;
> -  --enable-sdl-image) sdl_image=3Denabled
> -  ;;
> -
> -  ..snip..
> -
> -  # Help output feature message
> -  sdl-image         SDL Image support for icons
> -
> -  ..snip..
> -
> -  # Meson invocation
> -  -Dsdl_image=3D$sdl_image
> -
> -In meson_options.txt::
> -
> -  option('sdl', type : 'feature', value : 'auto',
> -         description: 'SDL Image support for icons')
> -
> -In meson.build::
> -
> -  # Detect dependency
> -  sdl_image =3D dependency('SDL2_image', required: get_option('sdl_image=
'),
> -                         method: 'pkg-config',
> -                         kwargs: static_kwargs)
> -
> -  # Create config-host.h (if applicable)
> -  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
> -
> -  # Summary
> -  summary_info +=3D {'SDL image support': sdl_image.found()}
> +The configure script automatically recognizes
> +command line options for which a same-named Meson option exists;
> +dashes in the command line are replaced with underscores.
>
> +Many checks on the compilation environment are still found in configure
> +rather than `meson.build`, but new checks should be added directly to
> +`meson.build`.
>
> +Patches are also welcome to move existing checks from the configure
> +phase to `meson.build`.  When doing so, ensure that `meson.build` does
> +not use anymore the keys that you have removed from `config-host.mak`.
> +Typically these will be replaced in `meson.build` by boolean variables,
> +``get_option('optname')`` invocations, or `dep.found()` expressions.
> +In general, the remaining checks have little or no interdependencies,
> +so they can be moved one by one.
>
>  Helper functions
>  ----------------
> @@ -335,6 +283,61 @@ new target, or enabling new devices or hardware for =
a
> particular
>  system/userspace emulation target
>
>
> +Adding checks
> +-------------
> +
> +New checks should be added to Meson.  Compiler checks can be as simple a=
s
> +the following::
> +
> +  config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
> +
> +A more complex task such as adding a new dependency usually
> +comprises the following tasks:
> +
> + - Add a Meson build option to meson_options.txt.
> +
> + - Add code to perform the actual feature check.
> +
> + - Add code to include the feature status in `config-host.h`
> +
> + - Add code to print out the feature status in the configure summary
> +   upon completion.
> +
> +Taking the probe for SDL2_Image as an example, we have the following
> +in ``meson_options.txt``::
> +
> +  option('sdl_image', type : 'feature', value : 'auto',
> +         description: 'SDL Image support for icons')
> +
> +Unless the option was given a non-``auto`` value (on the configure
> +command line), the detection code must be performed only if the
> +dependency will be used::
> +
> +  sdl_image =3D not_found
> +  if not get_option('sdl_image').auto() or have_system
> +    sdl_image =3D dependency('SDL2_image', required:
> get_option('sdl_image'),
> +                           method: 'pkg-config',
> +                           static: enable_static)
> +  endif
> +
> +This avoids warnings on static builds of user-mode emulators, for exampl=
e.
> +Most of the libraries used by system-mode emulators are not available fo=
r
> +static linking.
> +
> +The other supporting code is generally simple::
> +
> +  # Create config-host.h (if applicable)
> +  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
> +
> +  # Summary
> +  summary_info +=3D {'SDL image support': sdl_image.found()}
> +
> +For the configure script to parse the new option, the
> +``scripts/meson-buildoptions.sh`` file must be up-to-date; ``make
> +For the configure script to parse the new option, the
> ``meson-buildoptions.json``
> +update-buildoptions`` (or just `make`) will take care of updating it.
> +
> +
>  Support scripts
>  ---------------
>
> diff --git a/meson_options.txt b/meson_options.txt
> index 5a140af7f7..4ab4570125 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -1,3 +1,7 @@
> +# These options do not correspond to a --enable/--disable-* option
> +# on the configure script command line.  If you add more, list them in
> +# scripts/meson-buildoptions.py's SKIP_OPTIONS constant too.
> +
>  option('qemu_suffix', type : 'string', value: 'qemu',
>         description: 'Suffix for QEMU data/modules/config directories (ca=
n
> be empty)')
>  option('docdir', type : 'string', value : 'doc',
> @@ -16,6 +20,10 @@ option('fuzzing_engine', type : 'string', value : '',
>  option('trace_file', type: 'string', value: 'trace',
>         description: 'Trace file prefix for simple backend')
>
> +# Everything else can be set via --enable/--disable-* option
> +# on the configure script command line.  After adding an option
> +# here make sure to run "make update-buildoptions".
> +
>  option('docs', type : 'feature', value : 'auto',
>         description: 'Documentations build support')
>  option('fuzzing', type : 'boolean', value: false,
> diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.p=
y
> index 8948c296b7..9132e86efb 100755
> --- a/scripts/meson-buildoptions.py
> +++ b/scripts/meson-buildoptions.py
> @@ -25,10 +25,71 @@
>  import shlex
>  import sys
>
> +SKIP_OPTIONS =3D {
> +    "audio_drv_list",
> +    "default_devices",
> +    "docdir",
> +    "fuzzing_engine",
> +    "qemu_firmwarepath",
> +    "qemu_suffix",
> +    "sphinx_build",
> +    "trace_file",
> +}
> +
> +LINE_WIDTH =3D 76
> +
> +# Convert the default value of an option to the string used in
> +# the help message
> +def value_to_help(value):
> +    if isinstance(value, list):
> +        return ",".join(value)
> +    if isinstance(value, bool):
> +        return "enabled" if value else "disabled"
> +    return str(value)
> +
> +
> +def wrap(left, text, indent):
> +    length =3D LINE_WIDTH - indent
> +    if len(left) >=3D indent:
> +        yield left
> +        yield from wrap("", text, indent)
> +    else:
> +        spaces =3D " " * indent
> +        left =3D (left + spaces)[0:indent]
> +        yield from textwrap.wrap(
> +            text, width=3DLINE_WIDTH, initial_indent=3Dleft,
> subsequent_indent=3Dspaces
> +        )
> +
> +
>  def sh_print(line=3D""):
>      print('  printf "%s\\n"', shlex.quote(line))
>
>
> +def help_line(left, opt, indent, long):
> +    right =3D f"{opt['description']}"
> +    if long:
> +        value =3D value_to_help(opt["value"])
> +        if value !=3D "auto":
> +            right +=3D f" [{value}]"
> +    if "choices" in opt and long:
> +        choices =3D "/".join(sorted(opt["choices"]))
> +        right +=3D f" (choices: {choices})"
> +    for x in wrap("  " + left, right, indent):
> +        sh_print(x)
> +
> +
> +# Return whether the option (a dictionary) can be used with
> +# arguments.  Booleans can never be used with arguments;
> +# combos allow an argument only if they accept other values
> +# than "auto", "enabled", and "disabled".
> +def allow_arg(opt):
> +    if opt["type"] =3D=3D "boolean":
> +        return False
> +    if opt["type"] !=3D "combo":
> +        return True
> +    return not (set(opt["choices"]) <=3D {"auto", "disabled", "enabled"}=
)
> +
> +
>  def load_options(json):
>      json =3D [
>          x
> @@ -42,17 +103,48 @@ def load_options(json):
>
>  def print_help(options):
>      print("meson_options_help() {")
> +    for opt in options:
> +        key =3D opt["name"].replace("_", "-")
> +        # The first section includes options that have an arguments,
> +        # and booleans (i.e., only one of enable/disable makes sense)
> +        if opt["type"] =3D=3D "boolean":
> +            left =3D f"--disable-{key}" if opt["value"] else
> f"--enable-{key}"
> +            help_line(left, opt, 27, False)
> +        elif allow_arg(opt):
> +            if opt["type"] =3D=3D "combo" and "enabled" in opt["choices"=
]:
> +                left =3D f"--enable-{key}[=3DCHOICE]"
> +            else:
> +                left =3D f"--enable-{key}=3DCHOICE"
> +            help_line(left, opt, 27, True)
> +
>      sh_print()
>      sh_print("Optional features, enabled with --enable-FEATURE and")
>      sh_print("disabled with --disable-FEATURE, default is enabled if
> available")
>      sh_print("(unless built with --without-default-features):")
>      sh_print()
> +    for opt in options:
> +        key =3D opt["name"].replace("_", "-")
> +        if opt["type"] !=3D "boolean" and not allow_arg(opt):
> +            help_line(key, opt, 18, False)
>      print("}")
>
>
>  def print_parse(options):
>      print("_meson_option_parse() {")
>      print("  case $1 in")
> +    for opt in options:
> +        key =3D opt["name"].replace("_", "-")
> +        name =3D opt["name"]
> +        if opt["type"] =3D=3D "boolean":
> +            print(f'    --enable-{key}) printf "%s" -D{name}=3Dtrue ;;')
> +            print(f'    --disable-{key}) printf "%s" -D{name}=3Dfalse ;;=
')
> +        else:
> +            if opt["type"] =3D=3D "combo" and "enabled" in opt["choices"=
]:
> +                print(f'    --enable-{key}) printf "%s" -D{name}=3Denabl=
ed
> ;;')
> +            if opt["type"] =3D=3D "combo" and "disabled" in opt["choices=
"]:
> +                print(f'    --disable-{key}) printf "%s"
> -D{name}=3Ddisabled ;;')
> +            if allow_arg(opt):
> +                print(f'    --enable-{key}=3D*) quote_sh "-D{name}=3D$2"=
 ;;')
>      print("    *) return 1 ;;")
>      print("  esac")
>      print("}")
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 3be3058a6c..b81e99644f 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -1,12 +1,268 @@
>  meson_options_help() {
> +  printf "%s\n" '  --enable-capstone[=3DCHOICE]'
> +  printf "%s\n" '                           Whether and how to find the
> capstone library'
> +  printf "%s\n" '                           (choices:
> auto/disabled/enabled/internal/system)'
> +  printf "%s\n" '  --enable-cfi             Control-Flow Integrity (CFI)=
'
> +  printf "%s\n" '  --enable-cfi-debug       Verbose errors in case of CF=
I
> violation'
> +  printf "%s\n" '  --enable-fdt[=3DCHOICE]    Whether and how to find th=
e
> libfdt library'
> +  printf "%s\n" '                           (choices:
> auto/disabled/enabled/internal/system)'
> +  printf "%s\n" '  --enable-fuzzing         build fuzzing targets'
> +  printf "%s\n" '  --disable-install-blobs  install provided firmware
> blobs'
> +  printf "%s\n" '  --enable-malloc=3DCHOICE   choose memory allocator to
> use [system] (choices:'
> +  printf "%s\n" '                           jemalloc/system/tcmalloc)'
> +  printf "%s\n" '  --enable-slirp[=3DCHOICE]  Whether and how to find th=
e
> slirp library'
> +  printf "%s\n" '                           (choices:
> auto/disabled/enabled/internal/system)'
> +  printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interprete=
r
> (experimental and'
> +  printf "%s\n" '                           slow)'
> +  printf "%s\n" '  --enable-trace-backends=3DCHOICE'
> +  printf "%s\n" '                           Set available tracing
> backends [log]'
>    printf "%s\n" ''
>    printf "%s\n" 'Optional features, enabled with --enable-FEATURE and'
>    printf "%s\n" 'disabled with --disable-FEATURE, default is enabled if
> available'
>    printf "%s\n" '(unless built with --without-default-features):'
>    printf "%s\n" ''
> +  printf "%s\n" '  alsa            ALSA sound support'
> +  printf "%s\n" '  attr            attr/xattr support'
> +  printf "%s\n" '  auth-pam        PAM access control'
> +  printf "%s\n" '  bpf             eBPF support'
> +  printf "%s\n" '  brlapi          brlapi character device driver'
> +  printf "%s\n" '  bzip2           bzip2 support for DMG images'
> +  printf "%s\n" '  cap-ng          cap_ng support'
> +  printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
> +  printf "%s\n" '  coreaudio       CoreAudio sound support'
> +  printf "%s\n" '  curl            CURL block device driver'
> +  printf "%s\n" '  curses          curses UI'
> +  printf "%s\n" '  docs            Documentations build support'
> +  printf "%s\n" '  dsound          DirectSound sound support'
> +  printf "%s\n" '  fuse            FUSE block device export'
> +  printf "%s\n" '  fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE
> exports'
> +  printf "%s\n" '  gcrypt          libgcrypt cryptography support'
> +  printf "%s\n" '  gettext         Localization of the GTK+ user
> interface'
> +  printf "%s\n" '  glusterfs       Glusterfs block device driver'
> +  printf "%s\n" '  gnutls          GNUTLS cryptography support'
> +  printf "%s\n" '  gtk             GTK+ user interface'
> +  printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Guest
> Agent'
> +  printf "%s\n" '  hax             HAX acceleration support'
> +  printf "%s\n" '  hvf             HVF acceleration support'
> +  printf "%s\n" '  iconv           Font glyph conversion support'
> +  printf "%s\n" '  jack            JACK sound support'
> +  printf "%s\n" '  kvm             KVM acceleration support'
> +  printf "%s\n" '  libdaxctl       libdaxctl support'
> +  printf "%s\n" '  libiscsi        libiscsi userspace initiator'
> +  printf "%s\n" '  libnfs          libnfs block device driver'
> +  printf "%s\n" '  libpmem         libpmem support'
> +  printf "%s\n" '  libudev         Use libudev to enumerate host devices=
'
> +  printf "%s\n" '  libusb          libusb support for USB passthrough'
> +  printf "%s\n" '  libxml2         libxml2 support for Parallels image
> format'
> +  printf "%s\n" '  linux-aio       Linux AIO support'
> +  printf "%s\n" '  linux-io-uring  Linux io_uring support'
> +  printf "%s\n" '  lzfse           lzfse support for DMG images'
> +  printf "%s\n" '  lzo             lzo compression support'
> +  printf "%s\n" '  malloc-trim     enable libc malloc_trim() for memory
> optimization'
> +  printf "%s\n" '  mpath           Multipath persistent reservation
> passthrough'
> +  printf "%s\n" '  multiprocess    Out of process device emulation
> support'
> +  printf "%s\n" '  netmap          netmap network backend support'
> +  printf "%s\n" '  nettle          nettle cryptography support'
> +  printf "%s\n" '  nvmm            NVMM acceleration support'
> +  printf "%s\n" '  oss             OSS sound support'
> +  printf "%s\n" '  pa              PulseAudio sound support'
> +  printf "%s\n" '  rbd             Ceph block device driver'
> +  printf "%s\n" '  sdl             SDL user interface'
> +  printf "%s\n" '  sdl-image       SDL Image support for icons'
> +  printf "%s\n" '  seccomp         seccomp support'
> +  printf "%s\n" '  smartcard       CA smartcard emulation support'
> +  printf "%s\n" '  snappy          snappy compression support'
> +  printf "%s\n" '  sparse          sparse checker'
> +  printf "%s\n" '  spice           Spice server support'
> +  printf "%s\n" '  spice-protocol  Spice protocol support'
> +  printf "%s\n" '  tcg             TCG support'
> +  printf "%s\n" '  u2f             U2F emulation support'
> +  printf "%s\n" '  usb-redir       libusbredir support'
> +  printf "%s\n" '  vde             vde network backend support'
> +  printf "%s\n" '  vhost-user-blk-server'
> +  printf "%s\n" '                  build vhost-user-blk server'
> +  printf "%s\n" '  virglrenderer   virgl rendering support'
> +  printf "%s\n" '  virtfs          virtio-9p support'
> +  printf "%s\n" '  virtiofsd       build virtiofs daemon (virtiofsd)'
> +  printf "%s\n" '  vnc             VNC server'
> +  printf "%s\n" '  vnc-jpeg        JPEG lossy compression for VNC server=
'
> +  printf "%s\n" '  vnc-png         PNG compression for VNC server'
> +  printf "%s\n" '  vnc-sasl        SASL authentication for VNC server'
> +  printf "%s\n" '  vte             vte support for the gtk UI'
> +  printf "%s\n" '  whpx            WHPX acceleration support'
> +  printf "%s\n" '  xen             Xen backend support'
> +  printf "%s\n" '  xen-pci-passthrough'
> +  printf "%s\n" '                  Xen PCI passthrough support'
> +  printf "%s\n" '  xkbcommon       xkbcommon support'
> +  printf "%s\n" '  zstd            zstd compression support'
>  }
>  _meson_option_parse() {
>    case $1 in
> +    --enable-alsa) printf "%s" -Dalsa=3Denabled ;;
> +    --disable-alsa) printf "%s" -Dalsa=3Ddisabled ;;
> +    --enable-attr) printf "%s" -Dattr=3Denabled ;;
> +    --disable-attr) printf "%s" -Dattr=3Ddisabled ;;
> +    --enable-auth-pam) printf "%s" -Dauth_pam=3Denabled ;;
> +    --disable-auth-pam) printf "%s" -Dauth_pam=3Ddisabled ;;
> +    --enable-bpf) printf "%s" -Dbpf=3Denabled ;;
> +    --disable-bpf) printf "%s" -Dbpf=3Ddisabled ;;
> +    --enable-brlapi) printf "%s" -Dbrlapi=3Denabled ;;
> +    --disable-brlapi) printf "%s" -Dbrlapi=3Ddisabled ;;
> +    --enable-bzip2) printf "%s" -Dbzip2=3Denabled ;;
> +    --disable-bzip2) printf "%s" -Dbzip2=3Ddisabled ;;
> +    --enable-cap-ng) printf "%s" -Dcap_ng=3Denabled ;;
> +    --disable-cap-ng) printf "%s" -Dcap_ng=3Ddisabled ;;
> +    --enable-capstone) printf "%s" -Dcapstone=3Denabled ;;
> +    --disable-capstone) printf "%s" -Dcapstone=3Ddisabled ;;
> +    --enable-capstone=3D*) quote_sh "-Dcapstone=3D$2" ;;
> +    --enable-cfi) printf "%s" -Dcfi=3Dtrue ;;
> +    --disable-cfi) printf "%s" -Dcfi=3Dfalse ;;
> +    --enable-cfi-debug) printf "%s" -Dcfi_debug=3Dtrue ;;
> +    --disable-cfi-debug) printf "%s" -Dcfi_debug=3Dfalse ;;
> +    --enable-cocoa) printf "%s" -Dcocoa=3Denabled ;;
> +    --disable-cocoa) printf "%s" -Dcocoa=3Ddisabled ;;
> +    --enable-coreaudio) printf "%s" -Dcoreaudio=3Denabled ;;
> +    --disable-coreaudio) printf "%s" -Dcoreaudio=3Ddisabled ;;
> +    --enable-curl) printf "%s" -Dcurl=3Denabled ;;
> +    --disable-curl) printf "%s" -Dcurl=3Ddisabled ;;
> +    --enable-curses) printf "%s" -Dcurses=3Denabled ;;
> +    --disable-curses) printf "%s" -Dcurses=3Ddisabled ;;
> +    --enable-docs) printf "%s" -Ddocs=3Denabled ;;
> +    --disable-docs) printf "%s" -Ddocs=3Ddisabled ;;
> +    --enable-dsound) printf "%s" -Ddsound=3Denabled ;;
> +    --disable-dsound) printf "%s" -Ddsound=3Ddisabled ;;
> +    --enable-fdt) printf "%s" -Dfdt=3Denabled ;;
> +    --disable-fdt) printf "%s" -Dfdt=3Ddisabled ;;
> +    --enable-fdt=3D*) quote_sh "-Dfdt=3D$2" ;;
> +    --enable-fuse) printf "%s" -Dfuse=3Denabled ;;
> +    --disable-fuse) printf "%s" -Dfuse=3Ddisabled ;;
> +    --enable-fuse-lseek) printf "%s" -Dfuse_lseek=3Denabled ;;
> +    --disable-fuse-lseek) printf "%s" -Dfuse_lseek=3Ddisabled ;;
> +    --enable-fuzzing) printf "%s" -Dfuzzing=3Dtrue ;;
> +    --disable-fuzzing) printf "%s" -Dfuzzing=3Dfalse ;;
> +    --enable-gcrypt) printf "%s" -Dgcrypt=3Denabled ;;
> +    --disable-gcrypt) printf "%s" -Dgcrypt=3Ddisabled ;;
> +    --enable-gettext) printf "%s" -Dgettext=3Denabled ;;
> +    --disable-gettext) printf "%s" -Dgettext=3Ddisabled ;;
> +    --enable-glusterfs) printf "%s" -Dglusterfs=3Denabled ;;
> +    --disable-glusterfs) printf "%s" -Dglusterfs=3Ddisabled ;;
> +    --enable-gnutls) printf "%s" -Dgnutls=3Denabled ;;
> +    --disable-gnutls) printf "%s" -Dgnutls=3Ddisabled ;;
> +    --enable-gtk) printf "%s" -Dgtk=3Denabled ;;
> +    --disable-gtk) printf "%s" -Dgtk=3Ddisabled ;;
> +    --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=3Denabled ;;
> +    --disable-guest-agent-msi) printf "%s" -Dguest_agent_msi=3Ddisabled =
;;
> +    --enable-hax) printf "%s" -Dhax=3Denabled ;;
> +    --disable-hax) printf "%s" -Dhax=3Ddisabled ;;
> +    --enable-hvf) printf "%s" -Dhvf=3Denabled ;;
> +    --disable-hvf) printf "%s" -Dhvf=3Ddisabled ;;
> +    --enable-iconv) printf "%s" -Diconv=3Denabled ;;
> +    --disable-iconv) printf "%s" -Diconv=3Ddisabled ;;
> +    --enable-install-blobs) printf "%s" -Dinstall_blobs=3Dtrue ;;
> +    --disable-install-blobs) printf "%s" -Dinstall_blobs=3Dfalse ;;
> +    --enable-jack) printf "%s" -Djack=3Denabled ;;
> +    --disable-jack) printf "%s" -Djack=3Ddisabled ;;
> +    --enable-kvm) printf "%s" -Dkvm=3Denabled ;;
> +    --disable-kvm) printf "%s" -Dkvm=3Ddisabled ;;
> +    --enable-libdaxctl) printf "%s" -Dlibdaxctl=3Denabled ;;
> +    --disable-libdaxctl) printf "%s" -Dlibdaxctl=3Ddisabled ;;
> +    --enable-libiscsi) printf "%s" -Dlibiscsi=3Denabled ;;
> +    --disable-libiscsi) printf "%s" -Dlibiscsi=3Ddisabled ;;
> +    --enable-libnfs) printf "%s" -Dlibnfs=3Denabled ;;
> +    --disable-libnfs) printf "%s" -Dlibnfs=3Ddisabled ;;
> +    --enable-libpmem) printf "%s" -Dlibpmem=3Denabled ;;
> +    --disable-libpmem) printf "%s" -Dlibpmem=3Ddisabled ;;
> +    --enable-libudev) printf "%s" -Dlibudev=3Denabled ;;
> +    --disable-libudev) printf "%s" -Dlibudev=3Ddisabled ;;
> +    --enable-libusb) printf "%s" -Dlibusb=3Denabled ;;
> +    --disable-libusb) printf "%s" -Dlibusb=3Ddisabled ;;
> +    --enable-libxml2) printf "%s" -Dlibxml2=3Denabled ;;
> +    --disable-libxml2) printf "%s" -Dlibxml2=3Ddisabled ;;
> +    --enable-linux-aio) printf "%s" -Dlinux_aio=3Denabled ;;
> +    --disable-linux-aio) printf "%s" -Dlinux_aio=3Ddisabled ;;
> +    --enable-linux-io-uring) printf "%s" -Dlinux_io_uring=3Denabled ;;
> +    --disable-linux-io-uring) printf "%s" -Dlinux_io_uring=3Ddisabled ;;
> +    --enable-lzfse) printf "%s" -Dlzfse=3Denabled ;;
> +    --disable-lzfse) printf "%s" -Dlzfse=3Ddisabled ;;
> +    --enable-lzo) printf "%s" -Dlzo=3Denabled ;;
> +    --disable-lzo) printf "%s" -Dlzo=3Ddisabled ;;
> +    --enable-malloc=3D*) quote_sh "-Dmalloc=3D$2" ;;
> +    --enable-malloc-trim) printf "%s" -Dmalloc_trim=3Denabled ;;
> +    --disable-malloc-trim) printf "%s" -Dmalloc_trim=3Ddisabled ;;
> +    --enable-mpath) printf "%s" -Dmpath=3Denabled ;;
> +    --disable-mpath) printf "%s" -Dmpath=3Ddisabled ;;
> +    --enable-multiprocess) printf "%s" -Dmultiprocess=3Denabled ;;
> +    --disable-multiprocess) printf "%s" -Dmultiprocess=3Ddisabled ;;
> +    --enable-netmap) printf "%s" -Dnetmap=3Denabled ;;
> +    --disable-netmap) printf "%s" -Dnetmap=3Ddisabled ;;
> +    --enable-nettle) printf "%s" -Dnettle=3Denabled ;;
> +    --disable-nettle) printf "%s" -Dnettle=3Ddisabled ;;
> +    --enable-nvmm) printf "%s" -Dnvmm=3Denabled ;;
> +    --disable-nvmm) printf "%s" -Dnvmm=3Ddisabled ;;
> +    --enable-oss) printf "%s" -Doss=3Denabled ;;
> +    --disable-oss) printf "%s" -Doss=3Ddisabled ;;
> +    --enable-pa) printf "%s" -Dpa=3Denabled ;;
> +    --disable-pa) printf "%s" -Dpa=3Ddisabled ;;
> +    --enable-rbd) printf "%s" -Drbd=3Denabled ;;
> +    --disable-rbd) printf "%s" -Drbd=3Ddisabled ;;
> +    --enable-sdl) printf "%s" -Dsdl=3Denabled ;;
> +    --disable-sdl) printf "%s" -Dsdl=3Ddisabled ;;
> +    --enable-sdl-image) printf "%s" -Dsdl_image=3Denabled ;;
> +    --disable-sdl-image) printf "%s" -Dsdl_image=3Ddisabled ;;
> +    --enable-seccomp) printf "%s" -Dseccomp=3Denabled ;;
> +    --disable-seccomp) printf "%s" -Dseccomp=3Ddisabled ;;
> +    --enable-slirp) printf "%s" -Dslirp=3Denabled ;;
> +    --disable-slirp) printf "%s" -Dslirp=3Ddisabled ;;
> +    --enable-slirp=3D*) quote_sh "-Dslirp=3D$2" ;;
> +    --enable-smartcard) printf "%s" -Dsmartcard=3Denabled ;;
> +    --disable-smartcard) printf "%s" -Dsmartcard=3Ddisabled ;;
> +    --enable-snappy) printf "%s" -Dsnappy=3Denabled ;;
> +    --disable-snappy) printf "%s" -Dsnappy=3Ddisabled ;;
> +    --enable-sparse) printf "%s" -Dsparse=3Denabled ;;
> +    --disable-sparse) printf "%s" -Dsparse=3Ddisabled ;;
> +    --enable-spice) printf "%s" -Dspice=3Denabled ;;
> +    --disable-spice) printf "%s" -Dspice=3Ddisabled ;;
> +    --enable-spice-protocol) printf "%s" -Dspice_protocol=3Denabled ;;
> +    --disable-spice-protocol) printf "%s" -Dspice_protocol=3Ddisabled ;;
> +    --enable-tcg) printf "%s" -Dtcg=3Denabled ;;
> +    --disable-tcg) printf "%s" -Dtcg=3Ddisabled ;;
> +    --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=3Dtrue ;;
> +    --disable-tcg-interpreter) printf "%s" -Dtcg_interpreter=3Dfalse ;;
> +    --enable-trace-backends=3D*) quote_sh "-Dtrace_backends=3D$2" ;;
> +    --enable-u2f) printf "%s" -Du2f=3Denabled ;;
> +    --disable-u2f) printf "%s" -Du2f=3Ddisabled ;;
> +    --enable-usb-redir) printf "%s" -Dusb_redir=3Denabled ;;
> +    --disable-usb-redir) printf "%s" -Dusb_redir=3Ddisabled ;;
> +    --enable-vde) printf "%s" -Dvde=3Denabled ;;
> +    --disable-vde) printf "%s" -Dvde=3Ddisabled ;;
> +    --enable-vhost-user-blk-server) printf "%s"
> -Dvhost_user_blk_server=3Denabled ;;
> +    --disable-vhost-user-blk-server) printf "%s"
> -Dvhost_user_blk_server=3Ddisabled ;;
> +    --enable-virglrenderer) printf "%s" -Dvirglrenderer=3Denabled ;;
> +    --disable-virglrenderer) printf "%s" -Dvirglrenderer=3Ddisabled ;;
> +    --enable-virtfs) printf "%s" -Dvirtfs=3Denabled ;;
> +    --disable-virtfs) printf "%s" -Dvirtfs=3Ddisabled ;;
> +    --enable-virtiofsd) printf "%s" -Dvirtiofsd=3Denabled ;;
> +    --disable-virtiofsd) printf "%s" -Dvirtiofsd=3Ddisabled ;;
> +    --enable-vnc) printf "%s" -Dvnc=3Denabled ;;
> +    --disable-vnc) printf "%s" -Dvnc=3Ddisabled ;;
> +    --enable-vnc-jpeg) printf "%s" -Dvnc_jpeg=3Denabled ;;
> +    --disable-vnc-jpeg) printf "%s" -Dvnc_jpeg=3Ddisabled ;;
> +    --enable-vnc-png) printf "%s" -Dvnc_png=3Denabled ;;
> +    --disable-vnc-png) printf "%s" -Dvnc_png=3Ddisabled ;;
> +    --enable-vnc-sasl) printf "%s" -Dvnc_sasl=3Denabled ;;
> +    --disable-vnc-sasl) printf "%s" -Dvnc_sasl=3Ddisabled ;;
> +    --enable-vte) printf "%s" -Dvte=3Denabled ;;
> +    --disable-vte) printf "%s" -Dvte=3Ddisabled ;;
> +    --enable-whpx) printf "%s" -Dwhpx=3Denabled ;;
> +    --disable-whpx) printf "%s" -Dwhpx=3Ddisabled ;;
> +    --enable-xen) printf "%s" -Dxen=3Denabled ;;
> +    --disable-xen) printf "%s" -Dxen=3Ddisabled ;;
> +    --enable-xen-pci-passthrough) printf "%s"
> -Dxen_pci_passthrough=3Denabled ;;
> +    --disable-xen-pci-passthrough) printf "%s"
> -Dxen_pci_passthrough=3Ddisabled ;;
> +    --enable-xkbcommon) printf "%s" -Dxkbcommon=3Denabled ;;
> +    --disable-xkbcommon) printf "%s" -Dxkbcommon=3Ddisabled ;;
> +    --enable-zstd) printf "%s" -Dzstd=3Denabled ;;
> +    --disable-zstd) printf "%s" -Dzstd=3Ddisabled ;;
>      *) return 1 ;;
>    esac
>  }
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bd5aae05cdc9489f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:28 PM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Rig=
ht now meson_options.txt lists about 90 options.=C2=A0 Each option<br>
needs code in configure to parse it and pass the option down to Meson as<br=
>
a -D command-line argument; in addition the default must be duplicated<br>
between configure and meson_options.txt.=C2=A0 This series tries to remove<=
br>
the code duplication by generating the case statement for those --enable<br=
>
and --disable options, as well as the corresponding help text.<br>
<br>
About 80% of the options can be handled completely by the new mechanism.<br=
>
Eight meson options are not of the --enable/--disable kind.=C2=A0 Six more =
need<br>
to be parsed in configure for various reasons documented in the patch,<br>
but they still have their help automatically generated.<br>
<br>
The advantages are:<br>
<br>
- less code in configure<br>
<br>
- parsing and help is more consistent (for example --enable-blobs was<br>
=C2=A0 not supported)<br>
<br>
- options are described entirely in one place, meson_options.txt.<br>
=C2=A0 This make it more attractive to use Meson options instead of<br>
=C2=A0 hand-crafted configure options and config-host.mak<br>
<br>
A few options change name: --enable-tcmalloc and --enable-jemalloc<br>
become --enable-malloc=3D{tcmalloc,jemalloc}; --disable-blobs becomes<br>
--disable-install-blobs; --enable-trace-backend becomes<br>
--enable-trace-backends.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>I have not investigated why, but this broke at least --enable-trace-bac=
kend=3Dlog for me:<br></div><div>ERROR: unknown option --enable-trace-backe=
nd=3Dlog</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 540 ++--------------------------------<br>
=C2=A0docs/devel/build-system.rst=C2=A0 =C2=A0| 133 +++++----<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A08 +<br>
=C2=A0scripts/meson-buildoptions.py |=C2=A0 92 ++++++<br>
=C2=A0scripts/meson-buildoptions.sh | 256 ++++++++++++++++<br>
=C2=A05 files changed, 449 insertions(+), 580 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index d979476e03..4e1dfbea14 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -286,41 +286,8 @@ for opt do<br>
=C2=A0 =C2=A0esac<br>
=C2=A0done<br>
<br>
-brlapi=3D&quot;auto&quot;<br>
-curl=3D&quot;auto&quot;<br>
-iconv=3D&quot;auto&quot;<br>
-curses=3D&quot;auto&quot;<br>
-docs=3D&quot;auto&quot;<br>
-fdt=3D&quot;auto&quot;<br>
-netmap=3D&quot;auto&quot;<br>
-sdl=3D&quot;auto&quot;<br>
-sdl_image=3D&quot;auto&quot;<br>
-virtiofsd=3D&quot;auto&quot;<br>
-virtfs=3D&quot;auto&quot;<br>
-libudev=3D&quot;auto&quot;<br>
-mpath=3D&quot;auto&quot;<br>
-vnc=3D&quot;auto&quot;<br>
-sparse=3D&quot;auto&quot;<br>
-vde=3D&quot;auto&quot;<br>
-vnc_sasl=3D&quot;auto&quot;<br>
-vnc_jpeg=3D&quot;auto&quot;<br>
-vnc_png=3D&quot;auto&quot;<br>
-xkbcommon=3D&quot;auto&quot;<br>
-alsa=3D&quot;auto&quot;<br>
-coreaudio=3D&quot;auto&quot;<br>
-dsound=3D&quot;auto&quot;<br>
-jack=3D&quot;auto&quot;<br>
-oss=3D&quot;auto&quot;<br>
-pa=3D&quot;auto&quot;<br>
-xen=3D${default_feature:+disabled}<br>
=C2=A0xen_ctrl_version=3D&quot;$default_feature&quot;<br>
-xen_pci_passthrough=3D&quot;auto&quot;<br>
-linux_aio=3D&quot;auto&quot;<br>
-linux_io_uring=3D&quot;auto&quot;<br>
-cap_ng=3D&quot;auto&quot;<br>
-attr=3D&quot;auto&quot;<br>
=C2=A0xfs=3D&quot;$default_feature&quot;<br>
-tcg=3D&quot;enabled&quot;<br>
=C2=A0membarrier=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_kernel=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_net=3D&quot;$default_feature&quot;<br>
@@ -328,15 +295,8 @@ vhost_crypto=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_scsi=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_vsock=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_user=3D&quot;no&quot;<br>
-vhost_user_blk_server=3D&quot;auto&quot;<br>
=C2=A0vhost_user_fs=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_vdpa=3D&quot;$default_feature&quot;<br>
-bpf=3D&quot;auto&quot;<br>
-kvm=3D&quot;auto&quot;<br>
-hax=3D&quot;auto&quot;<br>
-hvf=3D&quot;auto&quot;<br>
-whpx=3D&quot;auto&quot;<br>
-nvmm=3D&quot;auto&quot;<br>
=C2=A0rdma=3D&quot;$default_feature&quot;<br>
=C2=A0pvrdma=3D&quot;$default_feature&quot;<br>
=C2=A0gprof=3D&quot;no&quot;<br>
@@ -346,7 +306,6 @@ sanitizers=3D&quot;no&quot;<br>
=C2=A0tsan=3D&quot;no&quot;<br>
=C2=A0fortify_source=3D&quot;$default_feature&quot;<br>
=C2=A0strip_opt=3D&quot;yes&quot;<br>
-tcg_interpreter=3D&quot;false&quot;<br>
=C2=A0mingw32=3D&quot;no&quot;<br>
=C2=A0gcov=3D&quot;no&quot;<br>
=C2=A0EXESUF=3D&quot;&quot;<br>
@@ -354,62 +313,32 @@ modules=3D&quot;no&quot;<br>
=C2=A0module_upgrades=3D&quot;no&quot;<br>
=C2=A0prefix=3D&quot;/usr/local&quot;<br>
=C2=A0qemu_suffix=3D&quot;qemu&quot;<br>
-slirp=3D&quot;auto&quot;<br>
=C2=A0bsd=3D&quot;no&quot;<br>
=C2=A0linux=3D&quot;no&quot;<br>
=C2=A0solaris=3D&quot;no&quot;<br>
=C2=A0profiler=3D&quot;no&quot;<br>
-cocoa=3D&quot;auto&quot;<br>
=C2=A0softmmu=3D&quot;yes&quot;<br>
=C2=A0linux_user=3D&quot;no&quot;<br>
=C2=A0bsd_user=3D&quot;no&quot;<br>
-blobs=3D&quot;true&quot;<br>
=C2=A0pkgversion=3D&quot;&quot;<br>
=C2=A0pie=3D&quot;&quot;<br>
=C2=A0qom_cast_debug=3D&quot;yes&quot;<br>
=C2=A0trace_backends=3D&quot;log&quot;<br>
=C2=A0trace_file=3D&quot;trace&quot;<br>
-spice=3D&quot;auto&quot;<br>
-spice_protocol=3D&quot;auto&quot;<br>
-rbd=3D&quot;auto&quot;<br>
-smartcard=3D&quot;auto&quot;<br>
-u2f=3D&quot;auto&quot;<br>
-libusb=3D&quot;auto&quot;<br>
-usb_redir=3D&quot;auto&quot;<br>
=C2=A0opengl=3D&quot;$default_feature&quot;<br>
=C2=A0cpuid_h=3D&quot;no&quot;<br>
=C2=A0avx2_opt=3D&quot;$default_feature&quot;<br>
-capstone=3D&quot;auto&quot;<br>
-lzo=3D&quot;auto&quot;<br>
-snappy=3D&quot;auto&quot;<br>
-bzip2=3D&quot;auto&quot;<br>
-lzfse=3D&quot;auto&quot;<br>
-zstd=3D&quot;auto&quot;<br>
=C2=A0guest_agent=3D&quot;$default_feature&quot;<br>
=C2=A0guest_agent_with_vss=3D&quot;no&quot;<br>
=C2=A0guest_agent_ntddscsi=3D&quot;no&quot;<br>
-guest_agent_msi=3D&quot;auto&quot;<br>
=C2=A0vss_win32_sdk=3D&quot;$default_feature&quot;<br>
=C2=A0win_sdk=3D&quot;no&quot;<br>
=C2=A0want_tools=3D&quot;$default_feature&quot;<br>
-libiscsi=3D&quot;auto&quot;<br>
-libnfs=3D&quot;auto&quot;<br>
=C2=A0coroutine=3D&quot;&quot;<br>
=C2=A0coroutine_pool=3D&quot;$default_feature&quot;<br>
=C2=A0debug_stack_usage=3D&quot;no&quot;<br>
=C2=A0crypto_afalg=3D&quot;no&quot;<br>
-cfi=3D&quot;false&quot;<br>
-cfi_debug=3D&quot;false&quot;<br>
-seccomp=3D&quot;auto&quot;<br>
-glusterfs=3D&quot;auto&quot;<br>
-gtk=3D&quot;auto&quot;<br>
=C2=A0tls_priority=3D&quot;NORMAL&quot;<br>
-gnutls=3D&quot;auto&quot;<br>
-nettle=3D&quot;auto&quot;<br>
-gcrypt=3D&quot;auto&quot;<br>
-auth_pam=3D&quot;auto&quot;<br>
-vte=3D&quot;auto&quot;<br>
-virglrenderer=3D&quot;auto&quot;<br>
=C2=A0tpm=3D&quot;$default_feature&quot;<br>
=C2=A0libssh=3D&quot;$default_feature&quot;<br>
=C2=A0live_block_migration=3D${default_feature:-yes}<br>
@@ -427,24 +356,34 @@ qed=3D${default_feature:-yes}<br>
=C2=A0parallels=3D${default_feature:-yes}<br>
=C2=A0libxml2=3D&quot;auto&quot;<br>
=C2=A0debug_mutex=3D&quot;no&quot;<br>
-libpmem=3D&quot;auto&quot;<br>
-default_devices=3D&quot;true&quot;<br>
=C2=A0plugins=3D&quot;$default_feature&quot;<br>
-fuzzing=3D&quot;false&quot;<br>
=C2=A0rng_none=3D&quot;no&quot;<br>
=C2=A0secret_keyring=3D&quot;$default_feature&quot;<br>
=C2=A0libdaxctl=3D&quot;auto&quot;<br>
=C2=A0meson=3D&quot;&quot;<br>
+meson_args=3D&quot;&quot;<br>
=C2=A0ninja=3D&quot;&quot;<br>
+gio=3D&quot;$default_feature&quot;<br>
=C2=A0skip_meson=3Dno<br>
-gettext=3D&quot;auto&quot;<br>
-fuse=3D&quot;auto&quot;<br>
-fuse_lseek=3D&quot;auto&quot;<br>
-multiprocess=3D&quot;auto&quot;<br>
=C2=A0slirp_smbd=3D&quot;$default_feature&quot;<br>
<br>
-malloc_trim=3D&quot;auto&quot;<br>
-gio=3D&quot;$default_feature&quot;<br>
+# The following Meson options are handled manually (still they<br>
+# are included in the automatically generated help message)<br>
+<br>
+# 1. Track which submodules are needed<br>
+capstone=3D&quot;auto&quot;<br>
+fdt=3D&quot;auto&quot;<br>
+slirp=3D&quot;auto&quot;<br>
+<br>
+# 2. Support --with/--without option<br>
+default_devices=3D&quot;true&quot;<br>
+<br>
+# 3. Automatically enable/disable other options<br>
+tcg=3D&quot;enabled&quot;<br>
+cfi=3D&quot;false&quot;<br>
+<br>
+# 4. Detection partly done in configure<br>
+xen=3D${default_feature:+disabled}<br>
<br>
=C2=A0# parse CC options second<br>
=C2=A0for opt do<br>
@@ -874,11 +813,6 @@ for opt do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 error_exit &quot;Can&#39;t mix --target-list-exclude with --targ=
et-list&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br=
>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-trace-backends=3D*) trace_backends=3D&quot;$optarg&quot;<b=
r>
-=C2=A0 ;;<br>
-=C2=A0 # XXX: backwards compatibility<br>
-=C2=A0 --enable-trace-backend=3D*) trace_backends=3D&quot;$optarg&quot;<br=
>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--with-trace-file=3D*) trace_file=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--with-default-devices) default_devices=3D&quot;true&quot;<br>
@@ -941,42 +875,10 @@ for opt do<br>
=C2=A0 =C2=A0 =C2=A0# configure to be used by RPM and similar macros that s=
et<br>
=C2=A0 =C2=A0 =C2=A0# lots of directory switches by default.<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-sdl) sdl=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-sdl) sdl=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-sdl-image) sdl_image=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-sdl-image) sdl_image=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-qom-cast-debug) qom_cast_debug=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-qom-cast-debug) qom_cast_debug=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-virtfs) virtfs=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-virtfs) virtfs=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-libudev) libudev=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-libudev) libudev=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-virtiofsd) virtiofsd=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-virtiofsd) virtiofsd=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-mpath) mpath=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-mpath) mpath=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-vnc) vnc=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vnc) vnc=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-gettext) gettext=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-gettext) gettext=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--audio-drv-list=3D*) audio_drv_list=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--block-drv-rw-whitelist=3D*|--block-drv-whitelist=3D*) block_=
drv_rw_whitelist=3D$(echo &quot;$optarg&quot; | sed -e &#39;s/,/ /g&#39;)<b=
r>
@@ -1007,24 +909,8 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-tsan) tsan=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-sparse) sparse=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-sparse) sparse=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-strip) strip_opt=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-vnc-sasl) vnc_sasl=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vnc-sasl) vnc_sasl=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-vnc-jpeg) vnc_jpeg=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vnc-jpeg) vnc_jpeg=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-vnc-png) vnc_png=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vnc-png) vnc_png=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-slirp) slirp=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-slirp) slirp=3D&quot;enabled&quot;<br>
@@ -1033,113 +919,17 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-slirp=3D*) slirp=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-vde) vde=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vde) vde=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-netmap) netmap=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-netmap) netmap=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-xen) xen=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-xen) xen=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-xen-pci-passthrough) xen_pci_passthrough=3D&quot;disabled=
&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-xen-pci-passthrough) xen_pci_passthrough=3D&quot;enabled&q=
uot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-alsa) alsa=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-alsa) alsa=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-coreaudio) coreaudio=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-coreaudio) coreaudio=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-dsound) dsound=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-dsound) dsound=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-jack) jack=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-jack) jack=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-oss) oss=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-oss) oss=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-pa) pa=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-pa) pa=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-brlapi) brlapi=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-brlapi) brlapi=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-kvm) kvm=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-kvm) kvm=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-hax) hax=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-hax) hax=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-hvf) hvf=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-hvf) hvf=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-nvmm) nvmm=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-nvmm) nvmm=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-whpx) whpx=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-whpx) whpx=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-tcg-interpreter) tcg_interpreter=3D&quot;false&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-tcg-interpreter) tcg_interpreter=3D&quot;true&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-cap-ng)=C2=A0 cap_ng=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-cap-ng) cap_ng=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-tcg) tcg=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 plugins=3D&q=
uot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-tcg) tcg=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-malloc-trim) malloc_trim=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-malloc-trim) malloc_trim=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-spice) spice=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-spice)<br>
-=C2=A0 =C2=A0 =C2=A0 spice_protocol=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 spice=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-spice-protocol)<br>
-=C2=A0 =C2=A0 =C2=A0 spice_protocol=3D&quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 spice=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-spice-protocol) spice_protocol=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-libiscsi) libiscsi=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-libiscsi) libiscsi=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-libnfs) libnfs=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-libnfs) libnfs=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--enable-profiler) profiler=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-cocoa) cocoa=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-cocoa) cocoa=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-system) softmmu=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-system) softmmu=3D&quot;yes&quot;<br>
@@ -1183,22 +973,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-cfi) cfi=3D&quot;false&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-cfi-debug) cfi_debug=3D&quot;true&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-cfi-debug) cfi_debug=3D&quot;false&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-curses) curses=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-curses) curses=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-iconv) iconv=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-iconv) iconv=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-curl) curl=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-curl) curl=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-fdt) fdt=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-fdt) fdt=3D&quot;enabled&quot;<br>
@@ -1207,28 +981,10 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-fdt=3D*) fdt=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-linux-aio) linux_aio=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-linux-aio) linux_aio=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-linux-io-uring) linux_io_uring=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-linux-io-uring) linux_io_uring=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-attr) attr=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-attr) attr=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-membarrier) membarrier=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-membarrier) membarrier=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-bpf) bpf=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-bpf) bpf=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-blobs) blobs=3D&quot;false&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--with-pkgversion=3D*) pkgversion=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--with-coroutine=3D*) coroutine=3D&quot;$optarg&quot;<br>
@@ -1243,10 +999,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-crypto-afalg) crypto_afalg=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-docs) docs=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-docs) docs=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-vhost-net) vhost_net=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-vhost-net) vhost_net=3D&quot;yes&quot;<br>
@@ -1263,10 +1015,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-vhost-vsock) vhost_vsock=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-vhost-user-blk-server) vhost_user_blk_server=3D&quot;disa=
bled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vhost-user-blk-server) vhost_user_blk_server=3D&quot;enabl=
ed&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-vhost-user-fs) vhost_user_fs=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-vhost-user-fs) vhost_user_fs=3D&quot;yes&quot;<br>
@@ -1275,60 +1023,16 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-opengl) opengl=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-rbd) rbd=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-rbd) rbd=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-xfsctl) xfs=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-xfsctl) xfs=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-smartcard) smartcard=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-smartcard) smartcard=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-u2f) u2f=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-u2f) u2f=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-libusb) libusb=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-libusb) libusb=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-usb-redir) usb_redir=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-usb-redir) usb_redir=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-zlib-test)<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-lzo) lzo=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-lzo) lzo=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-snappy) snappy=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-snappy) snappy=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-bzip2) bzip2=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-bzip2) bzip2=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-lzfse) lzfse=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-lzfse) lzfse=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-zstd) zstd=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-zstd) zstd=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--enable-guest-agent) guest_agent=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-guest-agent) guest_agent=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-guest-agent-msi) guest_agent_msi=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-guest-agent-msi) guest_agent_msi=3D&quot;disabled&quot;<b=
r>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--with-vss-sdk) vss_win32_sdk=3D&quot;&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--with-vss-sdk=3D*) vss_win32_sdk=3D&quot;$optarg&quot;<br>
@@ -1345,12 +1049,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-tools) want_tools=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-seccomp) seccomp=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-seccomp) seccomp=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-glusterfs) glusterfs=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-avx2) avx2_opt=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-avx2) avx2_opt=3D&quot;yes&quot;<br>
@@ -1359,9 +1057,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-avx512f) avx512f_opt=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-<br>
-=C2=A0 --enable-glusterfs) glusterfs=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$0: $opt is obsolete, virtio-blk data=
-plane is always on&quot; &gt;&amp;2<br>
=C2=A0 =C2=A0;;<br>
@@ -1371,28 +1066,8 @@ for opt do<br>
=C2=A0 =C2=A0--enable-uuid|--disable-uuid)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$0: $opt is obsolete, UUID support is=
 always built&quot; &gt;&amp;2<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-gtk) gtk=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-gtk) gtk=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--tls-priority=3D*) tls_priority=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-gnutls) gnutls=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-gnutls) gnutls=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-nettle) nettle=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-nettle) nettle=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-gcrypt) gcrypt=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-gcrypt) gcrypt=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-auth-pam) auth_pam=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-auth-pam) auth_pam=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--enable-rdma) rdma=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-rdma) rdma=3D&quot;no&quot;<br>
@@ -1401,14 +1076,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-pvrdma) pvrdma=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-vte) vte=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vte) vte=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-virglrenderer) virglrenderer=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-virglrenderer) virglrenderer=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-tpm) tpm=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-tpm) tpm=3D&quot;yes&quot;<br>
@@ -1425,18 +1092,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-numa) numa=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-libxml2) libxml2=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-libxml2) libxml2=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-tcmalloc) tcmalloc=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-tcmalloc) tcmalloc=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-jemalloc) jemalloc=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-jemalloc) jemalloc=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-replication) replication=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-replication) replication=3D&quot;yes&quot;<br>
@@ -1502,14 +1157,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-debug-mutex) debug_mutex=3Dno<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-libpmem) libpmem=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-libpmem) libpmem=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-xkbcommon) xkbcommon=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-xkbcommon) xkbcommon=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--enable-plugins) if test &quot;$mingw32&quot; =3D &quot;yes&q=
uot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0error_exit &quot;TCG plugins not currently supported on Wi=
ndows platforms&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else<br>
@@ -1522,10 +1169,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-containers) use_containers=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-fuzzing) fuzzing=3Dtrue<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-fuzzing) fuzzing=3Dfalse<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--gdb=3D*) gdb_bin=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-rng-none) rng_none=3Dyes<br>
@@ -1536,22 +1179,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-keyring) secret_keyring=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-libdaxctl) libdaxctl=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-libdaxctl) libdaxctl=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-fuse) fuse=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-fuse) fuse=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-fuse-lseek) fuse_lseek=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-fuse-lseek) fuse_lseek=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-multiprocess) multiprocess=3D&quot;enabled&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-multiprocess) multiprocess=3D&quot;disabled&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--enable-gio) gio=3Dyes<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-gio) gio=3Dno<br>
@@ -1714,9 +1341,6 @@ for config in $mak_wilds; do<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0done<br>
<br>
-# Enumerate public trace backends for --help output<br>
-trace_backend_list=3D$(echo $(grep -le &#39;^PUBLIC =3D True$&#39; &quot;$=
source_path&quot;/scripts/tracetool/backend/*.py | sed -e &#39;s/^.*\/\(.*\=
)\.py$/\1/&#39;))<br>
-<br>
=C2=A0if test x&quot;$show_help&quot; =3D x&quot;yes&quot; ; then<br>
=C2=A0cat &lt;&lt; EOF<br>
<br>
@@ -1793,18 +1417,12 @@ Advanced options (experts only):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (by default affects only QEMU, not tools like qemu=
-img)<br>
=C2=A0 =C2=A0--enable-block-drv-whitelist-in-tools<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 use block whitelist also in tools instead of only =
QEMU<br>
-=C2=A0 --enable-trace-backends=3DB Set trace backend<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Available backends: $trace_backend_list<br>
=C2=A0 =C2=A0--with-trace-file=3DNAME=C2=A0 =C2=A0Full PATH,NAME of file to=
 store traces<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Default:trace-&lt;pid&gt;<br>
-=C2=A0 --disable-slirp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disable SLIRP use=
rspace network connectivity<br>
-=C2=A0 --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter,=
 experimental and slow)<br>
-=C2=A0 --enable-malloc-trim=C2=A0 =C2=A0 =C2=A0enable libc malloc_trim() f=
or memory optimization<br>
=C2=A0 =C2=A0--cpu=3DCPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Build for host CPU [$cpu]<br>
=C2=A0 =C2=A0--with-coroutine=3DBACKEND coroutine backend. Supported option=
s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ucontext, sigaltstack, windows<br>
=C2=A0 =C2=A0--enable-gcov=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable =
test coverage analysis with gcov<br>
-=C2=A0 --disable-blobs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disable installin=
g provided firmware blobs<br>
=C2=A0 =C2=A0--with-vss-sdk=3DSDK-path=C2=A0 enable Windows VSS support in =
QEMU Guest Agent<br>
=C2=A0 =C2=A0--with-win-sdk=3DSDK-path=C2=A0 path to Windows Platform SDK (=
to build VSS .tlb)<br>
=C2=A0 =C2=A0--tls-priority=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default=
 TLS protocol/cipher priority string<br>
@@ -1823,9 +1441,7 @@ cat &lt;&lt; EOF<br>
=C2=A0 =C2=A0user=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 supported user e=
mulation targets<br>
=C2=A0 =C2=A0linux-user=C2=A0 =C2=A0 =C2=A0 all linux usermode emulation ta=
rgets<br>
=C2=A0 =C2=A0bsd-user=C2=A0 =C2=A0 =C2=A0 =C2=A0 all BSD usermode emulation=
 targets<br>
-=C2=A0 docs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build documentation<b=
r>
=C2=A0 =C2=A0guest-agent=C2=A0 =C2=A0 =C2=A0build the QEMU Guest Agent<br>
-=C2=A0 guest-agent-msi build guest agent Windows MSI installation package<=
br>
=C2=A0 =C2=A0pie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Position In=
dependent Executables<br>
=C2=A0 =C2=A0modules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modules support (non-=
Windows)<br>
=C2=A0 =C2=A0module-upgrades try to load modules from alternate paths for u=
pgrades<br>
@@ -1835,98 +1451,26 @@ cat &lt;&lt; EOF<br>
=C2=A0 =C2=A0sparse=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sparse checker<br>
=C2=A0 =C2=A0safe-stack=C2=A0 =C2=A0 =C2=A0 SafeStack Stack Smash Protectio=
n. Depends on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clang/=
llvm &gt;=3D 3.7 and requires coroutine backend ucontext.<br>
-=C2=A0 cfi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable Control-F=
low Integrity for indirect function calls.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 In case of =
a cfi violation, QEMU is terminated with SIGILL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Depends on =
lto and is incompatible with modules<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Automatical=
ly enables Link-Time Optimization (lto)<br>
-=C2=A0 cfi-debug=C2=A0 =C2=A0 =C2=A0 =C2=A0In case of a cfi violation, a m=
essage containing the line that<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 triggered t=
he error is written to stderr. After the error,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU is sti=
ll terminated with SIGILL<br>
-=C2=A0 gnutls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GNUTLS cryptography suppor=
t<br>
-=C2=A0 nettle=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nettle cryptography suppor=
t<br>
-=C2=A0 gcrypt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcrypt cryptography sup=
port<br>
-=C2=A0 auth-pam=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAM access control<br>
-=C2=A0 sdl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDL UI<br>
-=C2=A0 sdl-image=C2=A0 =C2=A0 =C2=A0 =C2=A0SDL Image support for icons<br>
-=C2=A0 gtk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk UI<br>
-=C2=A0 vte=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vte support for =
the gtk UI<br>
-=C2=A0 curses=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curses UI<br>
-=C2=A0 iconv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0font glyph conversion=
 support<br>
-=C2=A0 vnc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VNC UI support<b=
r>
-=C2=A0 vnc-sasl=C2=A0 =C2=A0 =C2=A0 =C2=A0 SASL encryption for VNC server<=
br>
-=C2=A0 vnc-jpeg=C2=A0 =C2=A0 =C2=A0 =C2=A0 JPEG lossy compression for VNC =
server<br>
-=C2=A0 vnc-png=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PNG compression for VNC se=
rver<br>
-=C2=A0 cocoa=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Cocoa UI (Mac OS X on=
ly)<br>
-=C2=A0 virtfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VirtFS<br>
-=C2=A0 virtiofsd=C2=A0 =C2=A0 =C2=A0 =C2=A0build virtiofs daemon (virtiofs=
d)<br>
-=C2=A0 libudev=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Use libudev to enumerate h=
ost devices<br>
-=C2=A0 mpath=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Multipath persistent =
reservation passthrough<br>
-=C2=A0 xen=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen backend driv=
er support<br>
-=C2=A0 xen-pci-passthrough=C2=A0 =C2=A0 PCI passthrough support for Xen<br=
>
-=C2=A0 alsa=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ALSA sound support<br=
>
-=C2=A0 coreaudio=C2=A0 =C2=A0 =C2=A0 =C2=A0CoreAudio sound support<br>
-=C2=A0 dsound=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DirectSound sound support<=
br>
-=C2=A0 jack=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JACK sound support<br=
>
-=C2=A0 oss=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OSS sound suppor=
t<br>
-=C2=A0 pa=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PulseAudio sound=
 support<br>
-=C2=A0 brlapi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BrlAPI (Braile)<br>
-=C2=A0 curl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curl connectivity<br>
=C2=A0 =C2=A0membarrier=C2=A0 =C2=A0 =C2=A0 membarrier system call (for Lin=
ux 4.14+ or Windows)<br>
-=C2=A0 fdt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdt device tree<=
br>
-=C2=A0 kvm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KVM acceleration=
 support<br>
-=C2=A0 hax=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HAX acceleration=
 support<br>
-=C2=A0 hvf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hypervisor.frame=
work acceleration support<br>
-=C2=A0 nvmm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NVMM acceleration sup=
port<br>
-=C2=A0 whpx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Windows Hypervisor Pl=
atform acceleration support<br>
=C2=A0 =C2=A0rdma=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable RDMA-base=
d migration<br>
=C2=A0 =C2=A0pvrdma=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable PVRDMA support=
<br>
-=C2=A0 vde=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0support for vde =
network<br>
-=C2=A0 netmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 support for netmap network=
<br>
-=C2=A0 linux-aio=C2=A0 =C2=A0 =C2=A0 =C2=A0Linux AIO support<br>
-=C2=A0 linux-io-uring=C2=A0 Linux io_uring support<br>
-=C2=A0 cap-ng=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libcap-ng support<br>
-=C2=A0 attr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr and xattr suppor=
t<br>
=C2=A0 =C2=A0vhost-net=C2=A0 =C2=A0 =C2=A0 =C2=A0vhost-net kernel accelerat=
ion support<br>
=C2=A0 =C2=A0vhost-vsock=C2=A0 =C2=A0 =C2=A0virtio sockets device support<b=
r>
=C2=A0 =C2=A0vhost-scsi=C2=A0 =C2=A0 =C2=A0 vhost-scsi kernel target suppor=
t<br>
=C2=A0 =C2=A0vhost-crypto=C2=A0 =C2=A0 vhost-user-crypto backend support<br=
>
=C2=A0 =C2=A0vhost-kernel=C2=A0 =C2=A0 vhost kernel backend support<br>
=C2=A0 =C2=A0vhost-user=C2=A0 =C2=A0 =C2=A0 vhost-user backend support<br>
-=C2=A0 vhost-user-blk-server=C2=A0 =C2=A0 vhost-user-blk server support<br=
>
=C2=A0 =C2=A0vhost-vdpa=C2=A0 =C2=A0 =C2=A0 vhost-vdpa kernel backend suppo=
rt<br>
-=C2=A0 bpf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BPF kernel suppo=
rt<br>
-=C2=A0 spice=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spice<br>
-=C2=A0 spice-protocol=C2=A0 spice-protocol<br>
-=C2=A0 rbd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rados block devi=
ce (rbd)<br>
-=C2=A0 libiscsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 iscsi support<br>
-=C2=A0 libnfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nfs support<br>
-=C2=A0 smartcard=C2=A0 =C2=A0 =C2=A0 =C2=A0smartcard support (libcacard)<b=
r>
-=C2=A0 u2f=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0U2F support (u2f=
-emu)<br>
-=C2=A0 libusb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libusb (for usb passthroug=
h)<br>
=C2=A0 =C2=A0live-block-migration=C2=A0 =C2=A0Block migration in the main m=
igration stream<br>
-=C2=A0 usb-redir=C2=A0 =C2=A0 =C2=A0 =C2=A0usb network redirection support=
<br>
-=C2=A0 lzo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0support of lzo c=
ompression library<br>
-=C2=A0 snappy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 support of snappy compress=
ion library<br>
-=C2=A0 bzip2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0support of bzip2 comp=
ression library<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (for readin=
g bzip2-compressed dmg images)<br>
-=C2=A0 lzfse=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0support of lzfse comp=
ression library<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (for readin=
g lzfse-compressed dmg images)<br>
-=C2=A0 zstd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 support for zstd comp=
ression library<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (for migrat=
ion compression and qcow2 cluster compression)<br>
-=C2=A0 seccomp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seccomp support<br>
=C2=A0 =C2=A0coroutine-pool=C2=A0 coroutine freelist (better performance)<b=
r>
-=C2=A0 glusterfs=C2=A0 =C2=A0 =C2=A0 =C2=A0GlusterFS backend<br>
=C2=A0 =C2=A0tpm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TPM support=
<br>
=C2=A0 =C2=A0libssh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh block device supp=
ort<br>
=C2=A0 =C2=A0numa=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libnuma support<=
br>
=C2=A0 =C2=A0libxml2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for Parallels image f=
ormat<br>
-=C2=A0 tcmalloc=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcmalloc support<br>
-=C2=A0 jemalloc=C2=A0 =C2=A0 =C2=A0 =C2=A0 jemalloc support<br>
=C2=A0 =C2=A0avx2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AVX2 optimizatio=
n support<br>
=C2=A0 =C2=A0avx512f=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AVX512F optimization =
support<br>
=C2=A0 =C2=A0replication=C2=A0 =C2=A0 =C2=A0replication support<br>
=C2=A0 =C2=A0opengl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opengl support<br>
-=C2=A0 virglrenderer=C2=A0 =C2=A0virgl rendering support<br>
=C2=A0 =C2=A0xfsctl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xfsctl support<br>
=C2=A0 =C2=A0qom-cast-debug=C2=A0 cast debugging support<br>
=C2=A0 =C2=A0tools=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build qemu-io, q=
emu-nbd and qemu-img tools<br>
@@ -1939,15 +1483,8 @@ cat &lt;&lt; EOF<br>
=C2=A0 =C2=A0qed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qed image f=
ormat support<br>
=C2=A0 =C2=A0parallels=C2=A0 =C2=A0 =C2=A0 =C2=A0parallels image format sup=
port<br>
=C2=A0 =C2=A0crypto-afalg=C2=A0 =C2=A0 Linux AF_ALG crypto backend driver<b=
r>
-=C2=A0 capstone=C2=A0 =C2=A0 =C2=A0 =C2=A0 capstone disassembler support<b=
r>
=C2=A0 =C2=A0debug-mutex=C2=A0 =C2=A0 =C2=A0mutex debugging support<br>
-=C2=A0 libpmem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libpmem support<br>
-=C2=A0 xkbcommon=C2=A0 =C2=A0 =C2=A0 =C2=A0xkbcommon support<br>
=C2=A0 =C2=A0rng-none=C2=A0 =C2=A0 =C2=A0 =C2=A0 dummy RNG, avoid using /de=
v/(u)random and getrandom()<br>
-=C2=A0 libdaxctl=C2=A0 =C2=A0 =C2=A0 =C2=A0libdaxctl support<br>
-=C2=A0 fuse=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FUSE block device exp=
ort<br>
-=C2=A0 fuse-lseek=C2=A0 =C2=A0 =C2=A0 SEEK_HOLE/SEEK_DATA support for FUSE=
 exports<br>
-=C2=A0 multiprocess=C2=A0 =C2=A0 Out of process device emulation support<b=
r>
=C2=A0 =C2=A0gio=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libgio supp=
ort<br>
=C2=A0 =C2=A0slirp-smbd=C2=A0 =C2=A0 =C2=A0 use smbd (at path --smbd=3D*) i=
n slirp networking<br>
<br>
@@ -3171,16 +2708,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-malloc=3Dsystem<br>
-if test &quot;$tcmalloc&quot; =3D &quot;yes&quot; &amp;&amp; test &quot;$j=
emalloc&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 echo &quot;ERROR: tcmalloc &amp;&amp; jemalloc can&#39;t be =
used at the same time&quot;<br>
-=C2=A0 =C2=A0 exit 1<br>
-elif test &quot;$tcmalloc&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 malloc=3Dtcmalloc<br>
-elif test &quot;$jemalloc&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 malloc=3Djemalloc<br>
-fi<br>
-<br>
=C2=A0# check for usbfs<br>
=C2=A0have_usbfs=3Dno<br>
=C2=A0if test &quot;$linux_user&quot; =3D &quot;yes&quot;; then<br>
@@ -4511,40 +4038,23 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--sysconfdir &quot;$sysconfdir&quot; \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--localedir &quot;$localedir&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--localstatedir &quot;$local_statedir&quo=
t; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Daudio_drv_list=3D$audio_drv_list \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ddefault_devices=3D$default_devices \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocdir=3D&quot;$docdir&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dqemu_firmwarepath=3D&quot;$firmwarepath=
&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dqemu_suffix=3D&quot;$qemu_suffix&quot; =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dsphinx_build=3D&quot;$sphinx_build&quot; \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dtrace_file=3D&quot;$trace_file&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Doptimization=3D$(if test &quot;$debug&q=
uot; =3D yes; then echo 0; else echo 2; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddebug=3D$(if test &quot;$debug_info&quo=
t; =3D yes; then echo true; else echo false; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dwerror=3D$(if test &quot;$werror&quot; =
=3D yes; then echo true; else echo false; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dstrip=3D$(if test &quot;$strip_opt&quot=
; =3D yes; then echo true; else echo false; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Db_pie=3D$(if test &quot;$pie&quot; =3D =
yes; then echo true; else echo false; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Db_coverage=3D$(if test &quot;$gcov&quot=
; =3D yes; then echo true; else echo false; fi) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Db_lto=3D$lto -Dcfi=3D$cfi -Dcfi_debug=3D$cfi=
_debug -Dfuzzing=3D$fuzzing \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Db_lto=3D$lto -Dcfi=3D$cfi -Dtcg=3D$tcg -Dxen=
=3D$xen \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcapstone=3D$capstone -Dfdt=3D$fdt -Dslirp=3D=
$slirp \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(test -n &quot;${LIB_FUZZING_ENGINE+xxx}=
&quot; &amp;&amp; echo &quot;-Dfuzzing_engine=3D$LIB_FUZZING_ENGINE&quot;) =
\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dmalloc=3D$malloc -Dmalloc_trim=3D$malloc_tri=
m -Dsparse=3D$sparse \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dkvm=3D$kvm -Dhax=3D$hax -Dwhpx=3D$whpx -Dhvf=
=3D$hvf -Dnvmm=3D$nvmm \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dxen=3D$xen -Dxen_pci_passthrough=3D$xen_pci_=
passthrough -Dtcg=3D$tcg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcocoa=3D$cocoa -Dgtk=3D$gtk -Dmpath=3D$mpath=
 -Dsdl=3D$sdl -Dsdl_image=3D$sdl_image \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibusb=3D$libusb -Dsmartcard=3D$smartcard -D=
usb_redir=3D$usb_redir -Dvte=3D$vte \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dvnc=3D$vnc -Dvnc_sasl=3D$vnc_sasl -Dvnc_jpeg=
=3D$vnc_jpeg -Dvnc_png=3D$vnc_png \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dgettext=3D$gettext -Dxkbcommon=3D$xkbcommon =
-Du2f=3D$u2f -Dvirtiofsd=3D$virtiofsd \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcapstone=3D$capstone -Dslirp=3D$slirp -Dfdt=
=3D$fdt -Dbrlapi=3D$brlapi \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcurl=3D$curl -Dglusterfs=3D$glusterfs -Dbzip=
2=3D$bzip2 -Dlibiscsi=3D$libiscsi \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibnfs=3D$libnfs -Diconv=3D$iconv -Dcurses=
=3D$curses -Dlibudev=3D$libudev\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Drbd=3D$rbd -Dlzo=3D$lzo -Dsnappy=3D$snappy -=
Dlzfse=3D$lzfse -Dlibxml2=3D$libxml2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlibdaxctl=3D$libdaxctl -Dlibpmem=3D$libpmem =
-Dlinux_io_uring=3D$linux_io_uring \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dgnutls=3D$gnutls -Dnettle=3D$nettle -Dgcrypt=
=3D$gcrypt -Dauth_pam=3D$auth_pam \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dzstd=3D$zstd -Dseccomp=3D$seccomp -Dvirtfs=
=3D$virtfs -Dcap_ng=3D$cap_ng \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dattr=3D$attr -Ddefault_devices=3D$default_de=
vices -Dvirglrenderer=3D$virglrenderer \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build =
-Dinstall_blobs=3D$blobs \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dvhost_user_blk_server=3D$vhost_user_blk_serv=
er -Dmultiprocess=3D$multiprocess \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek -Dgu=
est_agent_msi=3D$guest_agent_msi -Dbpf=3D$bpf\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(if test &quot;$default_feature&quot; =
=3D no; then echo &quot;-Dauto_features=3Ddisabled&quot;; fi) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dalsa=3D$alsa -Dcoreaudio=3D$coreaudio -Ddsou=
nd=3D$dsound -Djack=3D$jack -Doss=3D$oss \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dpa=3D$pa -Daudio_drv_list=3D$audio_drv_list =
-Dtcg_interpreter=3D$tcg_interpreter \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dtrace_backends=3D$trace_backends -Dtrace_fil=
e=3D$trace_file -Dlinux_aio=3D$linux_aio \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dnetmap=3D$netmap -Dvde=3D$vde \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$@&quot; $cross_arg &quot;$PWD&quot=
; &quot;$source_path&quot;<br>
=C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0eval run_meson $meson_options<br>
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst<br>
index 0f636d620e..b79012b965 100644<br>
--- a/docs/devel/build-system.rst<br>
+++ b/docs/devel/build-system.rst<br>
@@ -42,73 +42,21 @@ perform a build:<br>
=C2=A0 =C2=A0 =C2=A0 ../configure<br>
=C2=A0 =C2=A0 =C2=A0 make<br>
<br>
-For now, checks on the compilation environment are found in configure<br>
-rather than meson.build, though this is expected to change.=C2=A0 The comm=
and<br>
-line is parsed in the configure script and, whenever needed, converted<br>
-into the appropriate options to Meson.<br>
-<br>
-New checks should be added to Meson, which usually comprises the<br>
-following tasks:<br>
-<br>
- - Add a Meson build option to meson_options.txt.<br>
-<br>
- - Add support to the command line arg parser to handle any new<br>
-=C2=A0 =C2=A0``--enable-XXX``/``--disable-XXX`` flags required by the feat=
ure.<br>
-<br>
- - Add information to the help output message to report on the new<br>
-=C2=A0 =C2=A0feature flag.<br>
-<br>
- - Add code to perform the actual feature check.<br>
-<br>
- - Add code to include the feature status in ``config-host.h``<br>
-<br>
- - Add code to print out the feature status in the configure summary<br>
-=C2=A0 =C2=A0upon completion.<br>
-<br>
-<br>
-Taking the probe for SDL2_Image as an example, we have the following piece=
s<br>
-in configure::<br>
-<br>
-=C2=A0 # Initial variable state<br>
-=C2=A0 sdl_image=3Dauto<br>
-<br>
-=C2=A0 ..snip..<br>
-<br>
-=C2=A0 # Configure flag processing<br>
-=C2=A0 --disable-sdl-image) sdl_image=3Ddisabled<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-sdl-image) sdl_image=3Denabled<br>
-=C2=A0 ;;<br>
-<br>
-=C2=A0 ..snip..<br>
-<br>
-=C2=A0 # Help output feature message<br>
-=C2=A0 sdl-image=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDL Image support for ic=
ons<br>
-<br>
-=C2=A0 ..snip..<br>
-<br>
-=C2=A0 # Meson invocation<br>
-=C2=A0 -Dsdl_image=3D$sdl_image<br>
-<br>
-In meson_options.txt::<br>
-<br>
-=C2=A0 option(&#39;sdl&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;SDL Image support for =
icons&#39;)<br>
-<br>
-In meson.build::<br>
-<br>
-=C2=A0 # Detect dependency<br>
-=C2=A0 sdl_image =3D dependency(&#39;SDL2_image&#39;, required: get_option=
(&#39;sdl_image&#39;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0method: &#39;pkg-config&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0kwargs: static_kwargs)<br>
-<br>
-=C2=A0 # Create config-host.h (if applicable)<br>
-=C2=A0 config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())=
<br>
-<br>
-=C2=A0 # Summary<br>
-=C2=A0 summary_info +=3D {&#39;SDL image support&#39;: sdl_image.found()}<=
br>
+The configure script automatically recognizes<br>
+command line options for which a same-named Meson option exists;<br>
+dashes in the command line are replaced with underscores.<br>
<br>
+Many checks on the compilation environment are still found in configure<br=
>
+rather than `meson.build`, but new checks should be added directly to<br>
+`meson.build`.<br>
<br>
+Patches are also welcome to move existing checks from the configure<br>
+phase to `meson.build`.=C2=A0 When doing so, ensure that `meson.build` doe=
s<br>
+not use anymore the keys that you have removed from `config-host.mak`.<br>
+Typically these will be replaced in `meson.build` by boolean variables,<br=
>
+``get_option(&#39;optname&#39;)`` invocations, or `dep.found()` expression=
s.<br>
+In general, the remaining checks have little or no interdependencies,<br>
+so they can be moved one by one.<br>
<br>
=C2=A0Helper functions<br>
=C2=A0----------------<br>
@@ -335,6 +283,61 @@ new target, or enabling new devices or hardware for a =
particular<br>
=C2=A0system/userspace emulation target<br>
<br>
<br>
+Adding checks<br>
+-------------<br>
+<br>
+New checks should be added to Meson.=C2=A0 Compiler checks can be as simpl=
e as<br>
+the following::<br>
+<br>
+=C2=A0 config_host_data.set(&#39;HAVE_BTRFS_H&#39;, cc.has_header(&#39;lin=
ux/btrfs.h&#39;))<br>
+<br>
+A more complex task such as adding a new dependency usually<br>
+comprises the following tasks:<br>
+<br>
+ - Add a Meson build option to meson_options.txt.<br>
+<br>
+ - Add code to perform the actual feature check.<br>
+<br>
+ - Add code to include the feature status in `config-host.h`<br>
+<br>
+ - Add code to print out the feature status in the configure summary<br>
+=C2=A0 =C2=A0upon completion.<br>
+<br>
+Taking the probe for SDL2_Image as an example, we have the following<br>
+in ``meson_options.txt``::<br>
+<br>
+=C2=A0 option(&#39;sdl_image&#39;, type : &#39;feature&#39;, value : &#39;=
auto&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;SDL Image support for =
icons&#39;)<br>
+<br>
+Unless the option was given a non-``auto`` value (on the configure<br>
+command line), the detection code must be performed only if the<br>
+dependency will be used::<br>
+<br>
+=C2=A0 sdl_image =3D not_found<br>
+=C2=A0 if not get_option(&#39;sdl_image&#39;).auto() or have_system<br>
+=C2=A0 =C2=A0 sdl_image =3D dependency(&#39;SDL2_image&#39;, required: get=
_option(&#39;sdl_image&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0method: &#39;pkg-config&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0static: enable_static)<br>
+=C2=A0 endif<br>
+<br>
+This avoids warnings on static builds of user-mode emulators, for example.=
<br>
+Most of the libraries used by system-mode emulators are not available for<=
br>
+static linking.<br>
+<br>
+The other supporting code is generally simple::<br>
+<br>
+=C2=A0 # Create config-host.h (if applicable)<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())=
<br>
+<br>
+=C2=A0 # Summary<br>
+=C2=A0 summary_info +=3D {&#39;SDL image support&#39;: sdl_image.found()}<=
br>
+<br>
+For the configure script to parse the new option, the<br>
+``scripts/meson-buildoptions.sh`` file must be up-to-date; ``make<br>
+For the configure script to parse the new option, the ``meson-buildoptions=
.json``<br>
+update-buildoptions`` (or just `make`) will take care of updating it.<br>
+<br>
+<br>
=C2=A0Support scripts<br>
=C2=A0---------------<br>
<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 5a140af7f7..4ab4570125 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -1,3 +1,7 @@<br>
+# These options do not correspond to a --enable/--disable-* option<br>
+# on the configure script command line.=C2=A0 If you add more, list them i=
n<br>
+# scripts/meson-buildoptions.py&#39;s SKIP_OPTIONS constant too.<br>
+<br>
=C2=A0option(&#39;qemu_suffix&#39;, type : &#39;string&#39;, value: &#39;qe=
mu&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Suffix for QEMU data/modules/=
config directories (can be empty)&#39;)<br>
=C2=A0option(&#39;docdir&#39;, type : &#39;string&#39;, value : &#39;doc&#3=
9;,<br>
@@ -16,6 +20,10 @@ option(&#39;fuzzing_engine&#39;, type : &#39;string&#39;=
, value : &#39;&#39;,<br>
=C2=A0option(&#39;trace_file&#39;, type: &#39;string&#39;, value: &#39;trac=
e&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Trace file prefix for simple =
backend&#39;)<br>
<br>
+# Everything else can be set via --enable/--disable-* option<br>
+# on the configure script command line.=C2=A0 After adding an option<br>
+# here make sure to run &quot;make update-buildoptions&quot;.<br>
+<br>
=C2=A0option(&#39;docs&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Documentations build support&=
#39;)<br>
=C2=A0option(&#39;fuzzing&#39;, type : &#39;boolean&#39;, value: false,<br>
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py<=
br>
index 8948c296b7..9132e86efb 100755<br>
--- a/scripts/meson-buildoptions.py<br>
+++ b/scripts/meson-buildoptions.py<br>
@@ -25,10 +25,71 @@<br>
=C2=A0import shlex<br>
=C2=A0import sys<br>
<br>
+SKIP_OPTIONS =3D {<br>
+=C2=A0 =C2=A0 &quot;audio_drv_list&quot;,<br>
+=C2=A0 =C2=A0 &quot;default_devices&quot;,<br>
+=C2=A0 =C2=A0 &quot;docdir&quot;,<br>
+=C2=A0 =C2=A0 &quot;fuzzing_engine&quot;,<br>
+=C2=A0 =C2=A0 &quot;qemu_firmwarepath&quot;,<br>
+=C2=A0 =C2=A0 &quot;qemu_suffix&quot;,<br>
+=C2=A0 =C2=A0 &quot;sphinx_build&quot;,<br>
+=C2=A0 =C2=A0 &quot;trace_file&quot;,<br>
+}<br>
+<br>
+LINE_WIDTH =3D 76<br>
+<br>
+# Convert the default value of an option to the string used in<br>
+# the help message<br>
+def value_to_help(value):<br>
+=C2=A0 =C2=A0 if isinstance(value, list):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;,&quot;.join(value)<br>
+=C2=A0 =C2=A0 if isinstance(value, bool):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;enabled&quot; if value else &quot=
;disabled&quot;<br>
+=C2=A0 =C2=A0 return str(value)<br>
+<br>
+<br>
+def wrap(left, text, indent):<br>
+=C2=A0 =C2=A0 length =3D LINE_WIDTH - indent<br>
+=C2=A0 =C2=A0 if len(left) &gt;=3D indent:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yield left<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yield from wrap(&quot;&quot;, text, indent)<br=
>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spaces =3D &quot; &quot; * indent<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 left =3D (left + spaces)[0:indent]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yield from textwrap.wrap(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 text, width=3DLINE_WIDTH, initia=
l_indent=3Dleft, subsequent_indent=3Dspaces<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+<br>
=C2=A0def sh_print(line=3D&quot;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0print(&#39;=C2=A0 printf &quot;%s\\n&quot;&#39;, shlex.=
quote(line))<br>
<br>
<br>
+def help_line(left, opt, indent, long):<br>
+=C2=A0 =C2=A0 right =3D f&quot;{opt[&#39;description&#39;]}&quot;<br>
+=C2=A0 =C2=A0 if long:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D value_to_help(opt[&quot;value&quot;]=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if value !=3D &quot;auto&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 right +=3D f&quot; [{value}]&quo=
t;<br>
+=C2=A0 =C2=A0 if &quot;choices&quot; in opt and long:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 choices =3D &quot;/&quot;.join(sorted(opt[&quo=
t;choices&quot;]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 right +=3D f&quot; (choices: {choices})&quot;<=
br>
+=C2=A0 =C2=A0 for x in wrap(&quot;=C2=A0 &quot; + left, right, indent):<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sh_print(x)<br>
+<br>
+<br>
+# Return whether the option (a dictionary) can be used with<br>
+# arguments.=C2=A0 Booleans can never be used with arguments;<br>
+# combos allow an argument only if they accept other values<br>
+# than &quot;auto&quot;, &quot;enabled&quot;, and &quot;disabled&quot;.<br=
>
+def allow_arg(opt):<br>
+=C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D &quot;boolean&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
+=C2=A0 =C2=A0 if opt[&quot;type&quot;] !=3D &quot;combo&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
+=C2=A0 =C2=A0 return not (set(opt[&quot;choices&quot;]) &lt;=3D {&quot;aut=
o&quot;, &quot;disabled&quot;, &quot;enabled&quot;})<br>
+<br>
+<br>
=C2=A0def load_options(json):<br>
=C2=A0 =C2=A0 =C2=A0json =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x<br>
@@ -42,17 +103,48 @@ def load_options(json):<br>
<br>
=C2=A0def print_help(options):<br>
=C2=A0 =C2=A0 =C2=A0print(&quot;meson_options_help() {&quot;)<br>
+=C2=A0 =C2=A0 for opt in options:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D opt[&quot;name&quot;].replace(&quot;_&=
quot;, &quot;-&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The first section includes options that have=
 an arguments,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # and booleans (i.e., only one of enable/disab=
le makes sense)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D &quot;boolean&=
quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 left =3D f&quot;--disable-{key}&=
quot; if opt[&quot;value&quot;] else f&quot;--enable-{key}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help_line(left, opt, 27, False)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif allow_arg(opt):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D =
&quot;combo&quot; and &quot;enabled&quot; in opt[&quot;choices&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 left =3D f&quot;--=
enable-{key}[=3DCHOICE]&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 left =3D f&quot;--=
enable-{key}=3DCHOICE&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help_line(left, opt, 27, True)<b=
r>
+<br>
=C2=A0 =C2=A0 =C2=A0sh_print()<br>
=C2=A0 =C2=A0 =C2=A0sh_print(&quot;Optional features, enabled with --enable=
-FEATURE and&quot;)<br>
=C2=A0 =C2=A0 =C2=A0sh_print(&quot;disabled with --disable-FEATURE, default=
 is enabled if available&quot;)<br>
=C2=A0 =C2=A0 =C2=A0sh_print(&quot;(unless built with --without-default-fea=
tures):&quot;)<br>
=C2=A0 =C2=A0 =C2=A0sh_print()<br>
+=C2=A0 =C2=A0 for opt in options:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D opt[&quot;name&quot;].replace(&quot;_&=
quot;, &quot;-&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt[&quot;type&quot;] !=3D &quot;boolean&qu=
ot; and not allow_arg(opt):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help_line(key, opt, 18, False)<b=
r>
=C2=A0 =C2=A0 =C2=A0print(&quot;}&quot;)<br>
<br>
<br>
=C2=A0def print_parse(options):<br>
=C2=A0 =C2=A0 =C2=A0print(&quot;_meson_option_parse() {&quot;)<br>
=C2=A0 =C2=A0 =C2=A0print(&quot;=C2=A0 case $1 in&quot;)<br>
+=C2=A0 =C2=A0 for opt in options:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D opt[&quot;name&quot;].replace(&quot;_&=
quot;, &quot;-&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D opt[&quot;name&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D &quot;boolean&=
quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(f&#39;=C2=A0 =C2=A0 --enab=
le-{key}) printf &quot;%s&quot; -D{name}=3Dtrue ;;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(f&#39;=C2=A0 =C2=A0 --disa=
ble-{key}) printf &quot;%s&quot; -D{name}=3Dfalse ;;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D =
&quot;combo&quot; and &quot;enabled&quot; in opt[&quot;choices&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(f&#39;=C2=A0=
 =C2=A0 --enable-{key}) printf &quot;%s&quot; -D{name}=3Denabled ;;&#39;)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D =
&quot;combo&quot; and &quot;disabled&quot; in opt[&quot;choices&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(f&#39;=C2=A0=
 =C2=A0 --disable-{key}) printf &quot;%s&quot; -D{name}=3Ddisabled ;;&#39;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if allow_arg(opt):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(f&#39;=C2=A0=
 =C2=A0 --enable-{key}=3D*) quote_sh &quot;-D{name}=3D$2&quot; ;;&#39;)<br>
=C2=A0 =C2=A0 =C2=A0print(&quot;=C2=A0 =C2=A0 *) return 1 ;;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0print(&quot;=C2=A0 esac&quot;)<br>
=C2=A0 =C2=A0 =C2=A0print(&quot;}&quot;)<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index 3be3058a6c..b81e99644f 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -1,12 +1,268 @@<br>
=C2=A0meson_options_help() {<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-capstone[=3DCHOICE]&#3=
9;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Whether and how =
to find the capstone library&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(choices: auto/d=
isabled/enabled/internal/system)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-cfi=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Control-Flow Integrity (CFI)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-cfi-debug=C2=A0 =C2=A0=
 =C2=A0 =C2=A0Verbose errors in case of CFI violation&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-fdt[=3DCHOICE]=C2=A0 =
=C2=A0 Whether and how to find the libfdt library&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(choices: auto/d=
isabled/enabled/internal/system)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-fuzzing=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0build fuzzing targets&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --disable-install-blobs=C2=A0 i=
nstall provided firmware blobs&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-malloc=3DCHOICE=C2=A0 =
=C2=A0choose memory allocator to use [system] (choices:&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jemalloc/system/=
tcmalloc)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-slirp[=3DCHOICE]=C2=A0=
 Whether and how to find the slirp library&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(choices: auto/d=
isabled/enabled/internal/system)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-tcg-interpreter TCG wi=
th bytecode interpreter (experimental and&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slow)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-trace-backends=3DCHOIC=
E&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Set available tr=
acing backends [log]&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;Optional features, enabled with -=
-enable-FEATURE and&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;disabled with --disable-FEATURE, =
default is enabled if available&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;(unless built with --without-defa=
ult-features):&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 alsa=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ALSA sound support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 attr=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 attr/xattr support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 auth-pam=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PAM access control&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 bpf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0eBPF support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 brlapi=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 brlapi character device driver&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 bzip2=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bzip2 support for DMG images&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 cap-ng=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cap_ng support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 cocoa=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Cocoa user interface (macOS only)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 coreaudio=C2=A0 =C2=A0 =C2=A0 =
=C2=A0CoreAudio sound support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 curl=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 CURL block device driver&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 curses=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 curses UI&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 docs=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Documentations build support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 dsound=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DirectSound sound support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 fuse=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 FUSE block device export&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 fuse-lseek=C2=A0 =C2=A0 =C2=A0 =
SEEK_HOLE/SEEK_DATA support for FUSE exports&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 gcrypt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 libgcrypt cryptography support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 gettext=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Localization of the GTK+ user interface&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 glusterfs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Glusterfs block device driver&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 gnutls=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 GNUTLS cryptography support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 gtk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0GTK+ user interface&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 guest-agent-msi Build MSI packa=
ge for the QEMU Guest Agent&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 hax=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0HAX acceleration support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 hvf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0HVF acceleration support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 iconv=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Font glyph conversion support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 jack=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 JACK sound support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 kvm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0KVM acceleration support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 libdaxctl=C2=A0 =C2=A0 =C2=A0 =
=C2=A0libdaxctl support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 libiscsi=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 libiscsi userspace initiator&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 libnfs=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 libnfs block device driver&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 libpmem=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0libpmem support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 libudev=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Use libudev to enumerate host devices&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 libusb=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 libusb support for USB passthrough&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 libxml2=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0libxml2 support for Parallels image format&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 linux-aio=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Linux AIO support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 linux-io-uring=C2=A0 Linux io_u=
ring support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 lzfse=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0lzfse support for DMG images&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 lzo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0lzo compression support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 malloc-trim=C2=A0 =C2=A0 =C2=A0=
enable libc malloc_trim() for memory optimization&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 mpath=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Multipath persistent reservation passthrough&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 multiprocess=C2=A0 =C2=A0 Out o=
f process device emulation support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 netmap=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 netmap network backend support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 nettle=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 nettle cryptography support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 nvmm=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NVMM acceleration support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 oss=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0OSS sound support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 pa=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 PulseAudio sound support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 rbd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Ceph block device driver&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 sdl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0SDL user interface&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 sdl-image=C2=A0 =C2=A0 =C2=A0 =
=C2=A0SDL Image support for icons&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 seccomp=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0seccomp support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 smartcard=C2=A0 =C2=A0 =C2=A0 =
=C2=A0CA smartcard emulation support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 snappy=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 snappy compression support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 sparse=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sparse checker&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 spice=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Spice server support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 spice-protocol=C2=A0 Spice prot=
ocol support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 tcg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0TCG support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 u2f=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0U2F emulation support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 usb-redir=C2=A0 =C2=A0 =C2=A0 =
=C2=A0libusbredir support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vde=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0vde network backend support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vhost-user-blk-server&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 build vhost-user-blk server&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 virglrenderer=C2=A0 =C2=A0virgl=
 rendering support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 virtfs=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 virtio-9p support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 virtiofsd=C2=A0 =C2=A0 =C2=A0 =
=C2=A0build virtiofs daemon (virtiofsd)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vnc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0VNC server&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vnc-jpeg=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 JPEG lossy compression for VNC server&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vnc-png=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0PNG compression for VNC server&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vnc-sasl=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 SASL authentication for VNC server&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vte=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0vte support for the gtk UI&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 whpx=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 WHPX acceleration support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 xen=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Xen backend support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 xen-pci-passthrough&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Xen PCI passthrough support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 xkbcommon=C2=A0 =C2=A0 =C2=A0 =
=C2=A0xkbcommon support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 zstd=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 zstd compression support&#39;<br>
=C2=A0}<br>
=C2=A0_meson_option_parse() {<br>
=C2=A0 =C2=A0case $1 in<br>
+=C2=A0 =C2=A0 --enable-alsa) printf &quot;%s&quot; -Dalsa=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-alsa) printf &quot;%s&quot; -Dalsa=3Ddisabled ;;<b=
r>
+=C2=A0 =C2=A0 --enable-attr) printf &quot;%s&quot; -Dattr=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-attr) printf &quot;%s&quot; -Dattr=3Ddisabled ;;<b=
r>
+=C2=A0 =C2=A0 --enable-auth-pam) printf &quot;%s&quot; -Dauth_pam=3Denable=
d ;;<br>
+=C2=A0 =C2=A0 --disable-auth-pam) printf &quot;%s&quot; -Dauth_pam=3Ddisab=
led ;;<br>
+=C2=A0 =C2=A0 --enable-bpf) printf &quot;%s&quot; -Dbpf=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-bpf) printf &quot;%s&quot; -Dbpf=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-brlapi) printf &quot;%s&quot; -Dbrlapi=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-brlapi) printf &quot;%s&quot; -Dbrlapi=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-bzip2) printf &quot;%s&quot; -Dbzip2=3Denabled ;;<b=
r>
+=C2=A0 =C2=A0 --disable-bzip2) printf &quot;%s&quot; -Dbzip2=3Ddisabled ;;=
<br>
+=C2=A0 =C2=A0 --enable-cap-ng) printf &quot;%s&quot; -Dcap_ng=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-cap-ng) printf &quot;%s&quot; -Dcap_ng=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-capstone) printf &quot;%s&quot; -Dcapstone=3Denable=
d ;;<br>
+=C2=A0 =C2=A0 --disable-capstone) printf &quot;%s&quot; -Dcapstone=3Ddisab=
led ;;<br>
+=C2=A0 =C2=A0 --enable-capstone=3D*) quote_sh &quot;-Dcapstone=3D$2&quot; =
;;<br>
+=C2=A0 =C2=A0 --enable-cfi) printf &quot;%s&quot; -Dcfi=3Dtrue ;;<br>
+=C2=A0 =C2=A0 --disable-cfi) printf &quot;%s&quot; -Dcfi=3Dfalse ;;<br>
+=C2=A0 =C2=A0 --enable-cfi-debug) printf &quot;%s&quot; -Dcfi_debug=3Dtrue=
 ;;<br>
+=C2=A0 =C2=A0 --disable-cfi-debug) printf &quot;%s&quot; -Dcfi_debug=3Dfal=
se ;;<br>
+=C2=A0 =C2=A0 --enable-cocoa) printf &quot;%s&quot; -Dcocoa=3Denabled ;;<b=
r>
+=C2=A0 =C2=A0 --disable-cocoa) printf &quot;%s&quot; -Dcocoa=3Ddisabled ;;=
<br>
+=C2=A0 =C2=A0 --enable-coreaudio) printf &quot;%s&quot; -Dcoreaudio=3Denab=
led ;;<br>
+=C2=A0 =C2=A0 --disable-coreaudio) printf &quot;%s&quot; -Dcoreaudio=3Ddis=
abled ;;<br>
+=C2=A0 =C2=A0 --enable-curl) printf &quot;%s&quot; -Dcurl=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-curl) printf &quot;%s&quot; -Dcurl=3Ddisabled ;;<b=
r>
+=C2=A0 =C2=A0 --enable-curses) printf &quot;%s&quot; -Dcurses=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-curses) printf &quot;%s&quot; -Dcurses=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-docs) printf &quot;%s&quot; -Ddocs=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-docs) printf &quot;%s&quot; -Ddocs=3Ddisabled ;;<b=
r>
+=C2=A0 =C2=A0 --enable-dsound) printf &quot;%s&quot; -Ddsound=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-dsound) printf &quot;%s&quot; -Ddsound=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-fdt) printf &quot;%s&quot; -Dfdt=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-fdt) printf &quot;%s&quot; -Dfdt=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-fdt=3D*) quote_sh &quot;-Dfdt=3D$2&quot; ;;<br>
+=C2=A0 =C2=A0 --enable-fuse) printf &quot;%s&quot; -Dfuse=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-fuse) printf &quot;%s&quot; -Dfuse=3Ddisabled ;;<b=
r>
+=C2=A0 =C2=A0 --enable-fuse-lseek) printf &quot;%s&quot; -Dfuse_lseek=3Den=
abled ;;<br>
+=C2=A0 =C2=A0 --disable-fuse-lseek) printf &quot;%s&quot; -Dfuse_lseek=3Dd=
isabled ;;<br>
+=C2=A0 =C2=A0 --enable-fuzzing) printf &quot;%s&quot; -Dfuzzing=3Dtrue ;;<=
br>
+=C2=A0 =C2=A0 --disable-fuzzing) printf &quot;%s&quot; -Dfuzzing=3Dfalse ;=
;<br>
+=C2=A0 =C2=A0 --enable-gcrypt) printf &quot;%s&quot; -Dgcrypt=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-gcrypt) printf &quot;%s&quot; -Dgcrypt=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-gettext) printf &quot;%s&quot; -Dgettext=3Denabled =
;;<br>
+=C2=A0 =C2=A0 --disable-gettext) printf &quot;%s&quot; -Dgettext=3Ddisable=
d ;;<br>
+=C2=A0 =C2=A0 --enable-glusterfs) printf &quot;%s&quot; -Dglusterfs=3Denab=
led ;;<br>
+=C2=A0 =C2=A0 --disable-glusterfs) printf &quot;%s&quot; -Dglusterfs=3Ddis=
abled ;;<br>
+=C2=A0 =C2=A0 --enable-gnutls) printf &quot;%s&quot; -Dgnutls=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-gnutls) printf &quot;%s&quot; -Dgnutls=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-gtk) printf &quot;%s&quot; -Dgtk=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-gtk) printf &quot;%s&quot; -Dgtk=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-guest-agent-msi) printf &quot;%s&quot; -Dguest_agen=
t_msi=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-guest-agent-msi) printf &quot;%s&quot; -Dguest_age=
nt_msi=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-hax) printf &quot;%s&quot; -Dhax=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-hax) printf &quot;%s&quot; -Dhax=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-hvf) printf &quot;%s&quot; -Dhvf=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-hvf) printf &quot;%s&quot; -Dhvf=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-iconv) printf &quot;%s&quot; -Diconv=3Denabled ;;<b=
r>
+=C2=A0 =C2=A0 --disable-iconv) printf &quot;%s&quot; -Diconv=3Ddisabled ;;=
<br>
+=C2=A0 =C2=A0 --enable-install-blobs) printf &quot;%s&quot; -Dinstall_blob=
s=3Dtrue ;;<br>
+=C2=A0 =C2=A0 --disable-install-blobs) printf &quot;%s&quot; -Dinstall_blo=
bs=3Dfalse ;;<br>
+=C2=A0 =C2=A0 --enable-jack) printf &quot;%s&quot; -Djack=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-jack) printf &quot;%s&quot; -Djack=3Ddisabled ;;<b=
r>
+=C2=A0 =C2=A0 --enable-kvm) printf &quot;%s&quot; -Dkvm=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-kvm) printf &quot;%s&quot; -Dkvm=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-libdaxctl) printf &quot;%s&quot; -Dlibdaxctl=3Denab=
led ;;<br>
+=C2=A0 =C2=A0 --disable-libdaxctl) printf &quot;%s&quot; -Dlibdaxctl=3Ddis=
abled ;;<br>
+=C2=A0 =C2=A0 --enable-libiscsi) printf &quot;%s&quot; -Dlibiscsi=3Denable=
d ;;<br>
+=C2=A0 =C2=A0 --disable-libiscsi) printf &quot;%s&quot; -Dlibiscsi=3Ddisab=
led ;;<br>
+=C2=A0 =C2=A0 --enable-libnfs) printf &quot;%s&quot; -Dlibnfs=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-libnfs) printf &quot;%s&quot; -Dlibnfs=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-libpmem) printf &quot;%s&quot; -Dlibpmem=3Denabled =
;;<br>
+=C2=A0 =C2=A0 --disable-libpmem) printf &quot;%s&quot; -Dlibpmem=3Ddisable=
d ;;<br>
+=C2=A0 =C2=A0 --enable-libudev) printf &quot;%s&quot; -Dlibudev=3Denabled =
;;<br>
+=C2=A0 =C2=A0 --disable-libudev) printf &quot;%s&quot; -Dlibudev=3Ddisable=
d ;;<br>
+=C2=A0 =C2=A0 --enable-libusb) printf &quot;%s&quot; -Dlibusb=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-libusb) printf &quot;%s&quot; -Dlibusb=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-libxml2) printf &quot;%s&quot; -Dlibxml2=3Denabled =
;;<br>
+=C2=A0 =C2=A0 --disable-libxml2) printf &quot;%s&quot; -Dlibxml2=3Ddisable=
d ;;<br>
+=C2=A0 =C2=A0 --enable-linux-aio) printf &quot;%s&quot; -Dlinux_aio=3Denab=
led ;;<br>
+=C2=A0 =C2=A0 --disable-linux-aio) printf &quot;%s&quot; -Dlinux_aio=3Ddis=
abled ;;<br>
+=C2=A0 =C2=A0 --enable-linux-io-uring) printf &quot;%s&quot; -Dlinux_io_ur=
ing=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-linux-io-uring) printf &quot;%s&quot; -Dlinux_io_u=
ring=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-lzfse) printf &quot;%s&quot; -Dlzfse=3Denabled ;;<b=
r>
+=C2=A0 =C2=A0 --disable-lzfse) printf &quot;%s&quot; -Dlzfse=3Ddisabled ;;=
<br>
+=C2=A0 =C2=A0 --enable-lzo) printf &quot;%s&quot; -Dlzo=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-lzo) printf &quot;%s&quot; -Dlzo=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-malloc=3D*) quote_sh &quot;-Dmalloc=3D$2&quot; ;;<b=
r>
+=C2=A0 =C2=A0 --enable-malloc-trim) printf &quot;%s&quot; -Dmalloc_trim=3D=
enabled ;;<br>
+=C2=A0 =C2=A0 --disable-malloc-trim) printf &quot;%s&quot; -Dmalloc_trim=
=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-mpath) printf &quot;%s&quot; -Dmpath=3Denabled ;;<b=
r>
+=C2=A0 =C2=A0 --disable-mpath) printf &quot;%s&quot; -Dmpath=3Ddisabled ;;=
<br>
+=C2=A0 =C2=A0 --enable-multiprocess) printf &quot;%s&quot; -Dmultiprocess=
=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-multiprocess) printf &quot;%s&quot; -Dmultiprocess=
=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-netmap) printf &quot;%s&quot; -Dnetmap=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-netmap) printf &quot;%s&quot; -Dnetmap=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-nettle) printf &quot;%s&quot; -Dnettle=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-nettle) printf &quot;%s&quot; -Dnettle=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-nvmm) printf &quot;%s&quot; -Dnvmm=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-nvmm) printf &quot;%s&quot; -Dnvmm=3Ddisabled ;;<b=
r>
+=C2=A0 =C2=A0 --enable-oss) printf &quot;%s&quot; -Doss=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-oss) printf &quot;%s&quot; -Doss=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-pa) printf &quot;%s&quot; -Dpa=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-pa) printf &quot;%s&quot; -Dpa=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-rbd) printf &quot;%s&quot; -Drbd=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-rbd) printf &quot;%s&quot; -Drbd=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-sdl) printf &quot;%s&quot; -Dsdl=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-sdl) printf &quot;%s&quot; -Dsdl=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-sdl-image) printf &quot;%s&quot; -Dsdl_image=3Denab=
led ;;<br>
+=C2=A0 =C2=A0 --disable-sdl-image) printf &quot;%s&quot; -Dsdl_image=3Ddis=
abled ;;<br>
+=C2=A0 =C2=A0 --enable-seccomp) printf &quot;%s&quot; -Dseccomp=3Denabled =
;;<br>
+=C2=A0 =C2=A0 --disable-seccomp) printf &quot;%s&quot; -Dseccomp=3Ddisable=
d ;;<br>
+=C2=A0 =C2=A0 --enable-slirp) printf &quot;%s&quot; -Dslirp=3Denabled ;;<b=
r>
+=C2=A0 =C2=A0 --disable-slirp) printf &quot;%s&quot; -Dslirp=3Ddisabled ;;=
<br>
+=C2=A0 =C2=A0 --enable-slirp=3D*) quote_sh &quot;-Dslirp=3D$2&quot; ;;<br>
+=C2=A0 =C2=A0 --enable-smartcard) printf &quot;%s&quot; -Dsmartcard=3Denab=
led ;;<br>
+=C2=A0 =C2=A0 --disable-smartcard) printf &quot;%s&quot; -Dsmartcard=3Ddis=
abled ;;<br>
+=C2=A0 =C2=A0 --enable-snappy) printf &quot;%s&quot; -Dsnappy=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-snappy) printf &quot;%s&quot; -Dsnappy=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-sparse) printf &quot;%s&quot; -Dsparse=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-sparse) printf &quot;%s&quot; -Dsparse=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-spice) printf &quot;%s&quot; -Dspice=3Denabled ;;<b=
r>
+=C2=A0 =C2=A0 --disable-spice) printf &quot;%s&quot; -Dspice=3Ddisabled ;;=
<br>
+=C2=A0 =C2=A0 --enable-spice-protocol) printf &quot;%s&quot; -Dspice_proto=
col=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-spice-protocol) printf &quot;%s&quot; -Dspice_prot=
ocol=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-tcg) printf &quot;%s&quot; -Dtcg=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-tcg) printf &quot;%s&quot; -Dtcg=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-tcg-interpreter) printf &quot;%s&quot; -Dtcg_interp=
reter=3Dtrue ;;<br>
+=C2=A0 =C2=A0 --disable-tcg-interpreter) printf &quot;%s&quot; -Dtcg_inter=
preter=3Dfalse ;;<br>
+=C2=A0 =C2=A0 --enable-trace-backends=3D*) quote_sh &quot;-Dtrace_backends=
=3D$2&quot; ;;<br>
+=C2=A0 =C2=A0 --enable-u2f) printf &quot;%s&quot; -Du2f=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-u2f) printf &quot;%s&quot; -Du2f=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-usb-redir) printf &quot;%s&quot; -Dusb_redir=3Denab=
led ;;<br>
+=C2=A0 =C2=A0 --disable-usb-redir) printf &quot;%s&quot; -Dusb_redir=3Ddis=
abled ;;<br>
+=C2=A0 =C2=A0 --enable-vde) printf &quot;%s&quot; -Dvde=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-vde) printf &quot;%s&quot; -Dvde=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-vhost-user-blk-server) printf &quot;%s&quot; -Dvhos=
t_user_blk_server=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-vhost-user-blk-server) printf &quot;%s&quot; -Dvho=
st_user_blk_server=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-virglrenderer) printf &quot;%s&quot; -Dvirglrendere=
r=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-virglrenderer) printf &quot;%s&quot; -Dvirglrender=
er=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-virtfs) printf &quot;%s&quot; -Dvirtfs=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-virtfs) printf &quot;%s&quot; -Dvirtfs=3Ddisabled =
;;<br>
+=C2=A0 =C2=A0 --enable-virtiofsd) printf &quot;%s&quot; -Dvirtiofsd=3Denab=
led ;;<br>
+=C2=A0 =C2=A0 --disable-virtiofsd) printf &quot;%s&quot; -Dvirtiofsd=3Ddis=
abled ;;<br>
+=C2=A0 =C2=A0 --enable-vnc) printf &quot;%s&quot; -Dvnc=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-vnc) printf &quot;%s&quot; -Dvnc=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-vnc-jpeg) printf &quot;%s&quot; -Dvnc_jpeg=3Denable=
d ;;<br>
+=C2=A0 =C2=A0 --disable-vnc-jpeg) printf &quot;%s&quot; -Dvnc_jpeg=3Ddisab=
led ;;<br>
+=C2=A0 =C2=A0 --enable-vnc-png) printf &quot;%s&quot; -Dvnc_png=3Denabled =
;;<br>
+=C2=A0 =C2=A0 --disable-vnc-png) printf &quot;%s&quot; -Dvnc_png=3Ddisable=
d ;;<br>
+=C2=A0 =C2=A0 --enable-vnc-sasl) printf &quot;%s&quot; -Dvnc_sasl=3Denable=
d ;;<br>
+=C2=A0 =C2=A0 --disable-vnc-sasl) printf &quot;%s&quot; -Dvnc_sasl=3Ddisab=
led ;;<br>
+=C2=A0 =C2=A0 --enable-vte) printf &quot;%s&quot; -Dvte=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-vte) printf &quot;%s&quot; -Dvte=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-whpx) printf &quot;%s&quot; -Dwhpx=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-whpx) printf &quot;%s&quot; -Dwhpx=3Ddisabled ;;<b=
r>
+=C2=A0 =C2=A0 --enable-xen) printf &quot;%s&quot; -Dxen=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-xen) printf &quot;%s&quot; -Dxen=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-xen-pci-passthrough) printf &quot;%s&quot; -Dxen_pc=
i_passthrough=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-xen-pci-passthrough) printf &quot;%s&quot; -Dxen_p=
ci_passthrough=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-xkbcommon) printf &quot;%s&quot; -Dxkbcommon=3Denab=
led ;;<br>
+=C2=A0 =C2=A0 --disable-xkbcommon) printf &quot;%s&quot; -Dxkbcommon=3Ddis=
abled ;;<br>
+=C2=A0 =C2=A0 --enable-zstd) printf &quot;%s&quot; -Dzstd=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-zstd) printf &quot;%s&quot; -Dzstd=3Ddisabled ;;<b=
r>
=C2=A0 =C2=A0 =C2=A0*) return 1 ;;<br>
=C2=A0 =C2=A0esac<br>
=C2=A0}<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bd5aae05cdc9489f--

