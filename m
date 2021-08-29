Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46BC3FAD77
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 19:36:01 +0200 (CEST)
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKOiu-0001bD-Us
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 13:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKOfY-0005hs-V2
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 13:32:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKOfW-0007eJ-1J
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 13:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630258349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1Bsykwl2wYCVn3Ry5+muRkAzVb59Z/hgF89Hmp7AtU=;
 b=LnODBx4JoMfzIDYyaikqAB8ME+oXCC6ArZVNIsLQ7O2zw7imUSKGu/T5pABrvZKaoXmKnF
 lDte0nZtLBwxiEbfIk9Z+xICEPc3WmeDIC7g24ED0rCD7WjXYEMK5KXWDAyGwfl2DuMIJP
 8y6OK/DKRZV5H6yS0Dheo1NurOrWjJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-fJVcjywtM0WJBDLY9ve8cA-1; Sun, 29 Aug 2021 13:32:27 -0400
X-MC-Unique: fJVcjywtM0WJBDLY9ve8cA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E087185302B
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 17:32:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC5F760939;
 Sun, 29 Aug 2021 17:32:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/3] configure: Remove options that can be handled via
 meson_options.txt instead
Date: Sun, 29 Aug 2021 19:32:09 +0200
Message-Id: <20210829173210.39562-3-thuth@redhat.com>
In-Reply-To: <20210829173210.39562-1-thuth@redhat.com>
References: <20210829173210.39562-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These trivial options can now be handled via the new generic code
that parses meson_options.txt

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure         | 316 +---------------------------------------------
 meson_options.txt |   2 +-
 2 files changed, 5 insertions(+), 313 deletions(-)

diff --git a/configure b/configure
index b3e6d51916..cb125c3f84 100755
--- a/configure
+++ b/configure
@@ -291,34 +291,14 @@ for opt do
   esac
 done
 
-brlapi="auto"
-curl="auto"
-iconv="auto"
-curses="auto"
-docs="auto"
 fdt="auto"
 netmap="no"
 sdl="auto"
-sdl_image="auto"
 coreaudio="auto"
-virtiofsd="auto"
-virtfs="auto"
-libudev="auto"
-mpath="auto"
-vnc="auto"
-sparse="auto"
 vde="$default_feature"
-vnc_sasl="auto"
-vnc_jpeg="auto"
-vnc_png="auto"
-xkbcommon="auto"
 xen=${default_feature:+disabled}
 xen_ctrl_version="$default_feature"
-xen_pci_passthrough="auto"
 linux_aio="$default_feature"
-linux_io_uring="auto"
-cap_ng="auto"
-attr="auto"
 xfs="$default_feature"
 tcg="enabled"
 membarrier="$default_feature"
@@ -328,15 +308,8 @@ vhost_crypto="$default_feature"
 vhost_scsi="$default_feature"
 vhost_vsock="$default_feature"
 vhost_user="no"
-vhost_user_blk_server="auto"
 vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
-bpf="auto"
-kvm="auto"
-hax="auto"
-hvf="auto"
-whpx="auto"
-nvmm="auto"
 rdma="$default_feature"
 pvrdma="$default_feature"
 gprof="no"
@@ -362,7 +335,6 @@ bsd="no"
 linux="no"
 solaris="no"
 profiler="no"
-cocoa="auto"
 softmmu="yes"
 linux_user="no"
 bsd_user="no"
@@ -374,45 +346,23 @@ trace_backends="log"
 trace_file="trace"
 spice="$default_feature"
 spice_protocol="auto"
-rbd="auto"
-smartcard="auto"
-u2f="auto"
-libusb="auto"
-usb_redir="auto"
 opengl="$default_feature"
 cpuid_h="no"
 avx2_opt="$default_feature"
 capstone="auto"
-lzo="auto"
-snappy="auto"
-bzip2="auto"
-lzfse="auto"
-zstd="auto"
 guest_agent="$default_feature"
 guest_agent_with_vss="no"
 guest_agent_ntddscsi="no"
-guest_agent_msi="auto"
 vss_win32_sdk="$default_feature"
 win_sdk="no"
 want_tools="$default_feature"
-libiscsi="auto"
-libnfs="auto"
 coroutine=""
 coroutine_pool="$default_feature"
 debug_stack_usage="no"
 crypto_afalg="no"
 cfi="false"
 cfi_debug="false"
-seccomp="auto"
-glusterfs="auto"
-gtk="auto"
 tls_priority="NORMAL"
-gnutls="auto"
-nettle="auto"
-gcrypt="auto"
-auth_pam="auto"
-vte="auto"
-virglrenderer="auto"
 tpm="$default_feature"
 libssh="$default_feature"
 live_block_migration=${default_feature:-yes}
@@ -428,25 +378,17 @@ vdi=${default_feature:-yes}
 vvfat=${default_feature:-yes}
 qed=${default_feature:-yes}
 parallels=${default_feature:-yes}
-libxml2="auto"
 debug_mutex="no"
-libpmem="auto"
 default_devices="true"
 plugins="$default_feature"
 fuzzing="no"
 rng_none="no"
 secret_keyring="$default_feature"
-libdaxctl="auto"
 meson=""
 ninja=""
 skip_meson=no
-gettext="auto"
-fuse="auto"
-fuse_lseek="auto"
-multiprocess="auto"
 slirp_smbd="$default_feature"
 
-malloc_trim="auto"
 gio="$default_feature"
 
 # parse CC options second
@@ -982,38 +924,10 @@ for opt do
   ;;
   --enable-sdl) sdl="enabled"
   ;;
-  --disable-sdl-image) sdl_image="disabled"
-  ;;
-  --enable-sdl-image) sdl_image="enabled"
-  ;;
   --disable-qom-cast-debug) qom_cast_debug="no"
   ;;
   --enable-qom-cast-debug) qom_cast_debug="yes"
   ;;
-  --disable-virtfs) virtfs="disabled"
-  ;;
-  --enable-virtfs) virtfs="enabled"
-  ;;
-  --disable-libudev) libudev="disabled"
-  ;;
-  --enable-libudev) libudev="enabled"
-  ;;
-  --disable-virtiofsd) virtiofsd="disabled"
-  ;;
-  --enable-virtiofsd) virtiofsd="enabled"
-  ;;
-  --disable-mpath) mpath="disabled"
-  ;;
-  --enable-mpath) mpath="enabled"
-  ;;
-  --disable-vnc) vnc="disabled"
-  ;;
-  --enable-vnc) vnc="enabled"
-  ;;
-  --disable-gettext) gettext="disabled"
-  ;;
-  --enable-gettext) gettext="enabled"
-  ;;
   --oss-lib=*) oss_lib="$optarg"
   ;;
   --audio-drv-list=*) audio_drv_list="$optarg"
@@ -1046,24 +960,8 @@ for opt do
   ;;
   --disable-tsan) tsan="no"
   ;;
-  --enable-sparse) sparse="enabled"
-  ;;
-  --disable-sparse) sparse="disabled"
-  ;;
   --disable-strip) strip_opt="no"
   ;;
-  --disable-vnc-sasl) vnc_sasl="disabled"
-  ;;
-  --enable-vnc-sasl) vnc_sasl="enabled"
-  ;;
-  --disable-vnc-jpeg) vnc_jpeg="disabled"
-  ;;
-  --enable-vnc-jpeg) vnc_jpeg="enabled"
-  ;;
-  --disable-vnc-png) vnc_png="disabled"
-  ;;
-  --enable-vnc-png) vnc_png="enabled"
-  ;;
   --disable-slirp) slirp="disabled"
   ;;
   --enable-slirp) slirp="enabled"
@@ -1084,51 +982,15 @@ for opt do
   ;;
   --enable-xen) xen="enabled"
   ;;
-  --disable-xen-pci-passthrough) xen_pci_passthrough="disabled"
-  ;;
-  --enable-xen-pci-passthrough) xen_pci_passthrough="enabled"
-  ;;
-  --disable-brlapi) brlapi="disabled"
-  ;;
-  --enable-brlapi) brlapi="enabled"
-  ;;
-  --disable-kvm) kvm="disabled"
-  ;;
-  --enable-kvm) kvm="enabled"
-  ;;
-  --disable-hax) hax="disabled"
-  ;;
-  --enable-hax) hax="enabled"
-  ;;
-  --disable-hvf) hvf="disabled"
-  ;;
-  --enable-hvf) hvf="enabled"
-  ;;
-  --disable-nvmm) nvmm="disabled"
-  ;;
-  --enable-nvmm) nvmm="enabled"
-  ;;
-  --disable-whpx) whpx="disabled"
-  ;;
-  --enable-whpx) whpx="enabled"
-  ;;
   --disable-tcg-interpreter) tcg_interpreter="false"
   ;;
   --enable-tcg-interpreter) tcg_interpreter="true"
   ;;
-  --disable-cap-ng)  cap_ng="disabled"
-  ;;
-  --enable-cap-ng) cap_ng="enabled"
-  ;;
   --disable-tcg) tcg="disabled"
                  plugins="no"
   ;;
   --enable-tcg) tcg="enabled"
   ;;
-  --disable-malloc-trim) malloc_trim="disabled"
-  ;;
-  --enable-malloc-trim) malloc_trim="enabled"
-  ;;
   --disable-spice) spice="no"
   ;;
   --enable-spice)
@@ -1141,20 +1003,8 @@ for opt do
   ;;
   --enable-spice-protocol) spice_protocol="yes"
   ;;
-  --disable-libiscsi) libiscsi="disabled"
-  ;;
-  --enable-libiscsi) libiscsi="enabled"
-  ;;
-  --disable-libnfs) libnfs="disabled"
-  ;;
-  --enable-libnfs) libnfs="enabled"
-  ;;
   --enable-profiler) profiler="yes"
   ;;
-  --disable-cocoa) cocoa="disabled"
-  ;;
-  --enable-cocoa) cocoa="enabled"
-  ;;
   --disable-system) softmmu="no"
   ;;
   --enable-system) softmmu="yes"
@@ -1202,18 +1052,6 @@ for opt do
   ;;
   --disable-cfi-debug) cfi_debug="false"
   ;;
-  --disable-curses) curses="disabled"
-  ;;
-  --enable-curses) curses="enabled"
-  ;;
-  --disable-iconv) iconv="disabled"
-  ;;
-  --enable-iconv) iconv="enabled"
-  ;;
-  --disable-curl) curl="disabled"
-  ;;
-  --enable-curl) curl="enabled"
-  ;;
   --disable-fdt) fdt="disabled"
   ;;
   --enable-fdt) fdt="enabled"
@@ -1226,22 +1064,10 @@ for opt do
   ;;
   --enable-linux-aio) linux_aio="yes"
   ;;
-  --disable-linux-io-uring) linux_io_uring="disabled"
-  ;;
-  --enable-linux-io-uring) linux_io_uring="enabled"
-  ;;
-  --disable-attr) attr="disabled"
-  ;;
-  --enable-attr) attr="enabled"
-  ;;
   --disable-membarrier) membarrier="no"
   ;;
   --enable-membarrier) membarrier="yes"
   ;;
-  --disable-bpf) bpf="disabled"
-  ;;
-  --enable-bpf) bpf="enabled"
-  ;;
   --disable-blobs) blobs="false"
   ;;
   --with-pkgversion=*) pkgversion="$optarg"
@@ -1258,10 +1084,6 @@ for opt do
   ;;
   --disable-crypto-afalg) crypto_afalg="no"
   ;;
-  --disable-docs) docs="disabled"
-  ;;
-  --enable-docs) docs="enabled"
-  ;;
   --disable-vhost-net) vhost_net="no"
   ;;
   --enable-vhost-net) vhost_net="yes"
@@ -1278,10 +1100,6 @@ for opt do
   ;;
   --enable-vhost-vsock) vhost_vsock="yes"
   ;;
-  --disable-vhost-user-blk-server) vhost_user_blk_server="disabled"
-  ;;
-  --enable-vhost-user-blk-server) vhost_user_blk_server="enabled"
-  ;;
   --disable-vhost-user-fs) vhost_user_fs="no"
   ;;
   --enable-vhost-user-fs) vhost_user_fs="yes"
@@ -1290,60 +1108,14 @@ for opt do
   ;;
   --enable-opengl) opengl="yes"
   ;;
-  --disable-rbd) rbd="disabled"
-  ;;
-  --enable-rbd) rbd="enabled"
-  ;;
   --disable-xfsctl) xfs="no"
   ;;
   --enable-xfsctl) xfs="yes"
   ;;
-  --disable-smartcard) smartcard="disabled"
-  ;;
-  --enable-smartcard) smartcard="enabled"
-  ;;
-  --disable-u2f) u2f="disabled"
-  ;;
-  --enable-u2f) u2f="enabled"
-  ;;
-  --disable-libusb) libusb="disabled"
-  ;;
-  --enable-libusb) libusb="enabled"
-  ;;
-  --disable-usb-redir) usb_redir="disabled"
-  ;;
-  --enable-usb-redir) usb_redir="enabled"
-  ;;
-  --disable-zlib-test)
-  ;;
-  --disable-lzo) lzo="disabled"
-  ;;
-  --enable-lzo) lzo="enabled"
-  ;;
-  --disable-snappy) snappy="disabled"
-  ;;
-  --enable-snappy) snappy="enabled"
-  ;;
-  --disable-bzip2) bzip2="disabled"
-  ;;
-  --enable-bzip2) bzip2="enabled"
-  ;;
-  --enable-lzfse) lzfse="enabled"
-  ;;
-  --disable-lzfse) lzfse="disabled"
-  ;;
-  --disable-zstd) zstd="disabled"
-  ;;
-  --enable-zstd) zstd="enabled"
-  ;;
   --enable-guest-agent) guest_agent="yes"
   ;;
   --disable-guest-agent) guest_agent="no"
   ;;
-  --enable-guest-agent-msi) guest_agent_msi="enabled"
-  ;;
-  --disable-guest-agent-msi) guest_agent_msi="disabled"
-  ;;
   --with-vss-sdk) vss_win32_sdk=""
   ;;
   --with-vss-sdk=*) vss_win32_sdk="$optarg"
@@ -1360,12 +1132,6 @@ for opt do
   ;;
   --disable-tools) want_tools="no"
   ;;
-  --enable-seccomp) seccomp="enabled"
-  ;;
-  --disable-seccomp) seccomp="disabled"
-  ;;
-  --disable-glusterfs) glusterfs="disabled"
-  ;;
   --disable-avx2) avx2_opt="no"
   ;;
   --enable-avx2) avx2_opt="yes"
@@ -1374,9 +1140,6 @@ for opt do
   ;;
   --enable-avx512f) avx512f_opt="yes"
   ;;
-
-  --enable-glusterfs) glusterfs="enabled"
-  ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
       echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&2
   ;;
@@ -1386,28 +1149,8 @@ for opt do
   --enable-uuid|--disable-uuid)
       echo "$0: $opt is obsolete, UUID support is always built" >&2
   ;;
-  --disable-gtk) gtk="disabled"
-  ;;
-  --enable-gtk) gtk="enabled"
-  ;;
   --tls-priority=*) tls_priority="$optarg"
   ;;
-  --disable-gnutls) gnutls="disabled"
-  ;;
-  --enable-gnutls) gnutls="enabled"
-  ;;
-  --disable-nettle) nettle="disabled"
-  ;;
-  --enable-nettle) nettle="enabled"
-  ;;
-  --disable-gcrypt) gcrypt="disabled"
-  ;;
-  --enable-gcrypt) gcrypt="enabled"
-  ;;
-  --disable-auth-pam) auth_pam="disabled"
-  ;;
-  --enable-auth-pam) auth_pam="enabled"
-  ;;
   --enable-rdma) rdma="yes"
   ;;
   --disable-rdma) rdma="no"
@@ -1416,14 +1159,6 @@ for opt do
   ;;
   --disable-pvrdma) pvrdma="no"
   ;;
-  --disable-vte) vte="disabled"
-  ;;
-  --enable-vte) vte="enabled"
-  ;;
-  --disable-virglrenderer) virglrenderer="disabled"
-  ;;
-  --enable-virglrenderer) virglrenderer="enabled"
-  ;;
   --disable-tpm) tpm="no"
   ;;
   --enable-tpm) tpm="yes"
@@ -1440,10 +1175,6 @@ for opt do
   ;;
   --enable-numa) numa="yes"
   ;;
-  --disable-libxml2) libxml2="disabled"
-  ;;
-  --enable-libxml2) libxml2="enabled"
-  ;;
   --disable-tcmalloc) tcmalloc="no"
   ;;
   --enable-tcmalloc) tcmalloc="yes"
@@ -1525,14 +1256,6 @@ for opt do
   ;;
   --disable-debug-mutex) debug_mutex=no
   ;;
-  --enable-libpmem) libpmem="enabled"
-  ;;
-  --disable-libpmem) libpmem="disabled"
-  ;;
-  --enable-xkbcommon) xkbcommon="enabled"
-  ;;
-  --disable-xkbcommon) xkbcommon="disabled"
-  ;;
   --enable-plugins) if test "$mingw32" = "yes"; then
                         error_exit "TCG plugins not currently supported on Windows platforms"
                     else
@@ -1559,22 +1282,6 @@ for opt do
   ;;
   --disable-keyring) secret_keyring="no"
   ;;
-  --enable-libdaxctl) libdaxctl="enabled"
-  ;;
-  --disable-libdaxctl) libdaxctl="disabled"
-  ;;
-  --enable-fuse) fuse="enabled"
-  ;;
-  --disable-fuse) fuse="disabled"
-  ;;
-  --enable-fuse-lseek) fuse_lseek="enabled"
-  ;;
-  --disable-fuse-lseek) fuse_lseek="disabled"
-  ;;
-  --enable-multiprocess) multiprocess="enabled"
-  ;;
-  --disable-multiprocess) multiprocess="disabled"
-  ;;
   --enable-gio) gio=yes
   ;;
   --disable-gio) gio=no
@@ -5213,25 +4920,10 @@ if test "$skip_meson" = no; then
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         ${staticpic:+-Db_staticpic=$staticpic} \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
-        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
-        -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
-        -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
-        -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
-        -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
-        -Dlibusb=$libusb -Dsmartcard=$smartcard -Dusb_redir=$usb_redir -Dvte=$vte \
-        -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
-        -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
-        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
-        -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
-        -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse -Dlibxml2=$libxml2 \
-        -Dlibdaxctl=$libdaxctl -Dlibpmem=$libpmem -Dlinux_io_uring=$linux_io_uring \
-        -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
-        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
-        -Dattr=$attr -Ddefault_devices=$default_devices -Dvirglrenderer=$virglrenderer \
-        -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
-        -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
-        -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
+        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug -Dmalloc=$malloc \
+        -Ddefault_devices=$default_devices -Dxen=$xen -Dtcg=$tcg -Dsdl=$sdl \
+        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
+        -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
         -Dtcg_interpreter=$tcg_interpreter $meson_options \
         $cross_arg \
diff --git a/meson_options.txt b/meson_options.txt
index a9a9b8f4c6..2c89e79e8b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -120,7 +120,7 @@ option('usb_redir', type : 'feature', value : 'auto',
        description: 'libusbredir support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
-option('vnc', type : 'feature', value : 'enabled',
+option('vnc', type : 'feature', value : 'auto',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
        description: 'JPEG lossy compression for VNC server')
-- 
2.27.0


