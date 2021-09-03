Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34EA3FFBB4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:19:17 +0200 (CEST)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4Ps-0002mU-VB
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mM4L5-0002ha-9X
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:14:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mM4L3-0005Rc-EF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630656856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yIsC2uzMGuS8SOATBGCWosoZF/UQGvCdYSMl43uOw9A=;
 b=IuY3brMszGzEGJblikvAABc+0xf3Ws0QM3mmhJNJdmhI1BHFTXJdd5gvGjm41bTNVzdyy3
 9gVUL0mJm76bxfXurBBEG/9/8ArShZBu24rKc1aGXLUD2UmLM06ltmCyz6bn1hwRm2E+Ki
 Snn6gaHwGKtEttgpCDHjinq4ieU8iQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-McccNNDRM1WLBdGodDZgjg-1; Fri, 03 Sep 2021 04:14:15 -0400
X-MC-Unique: McccNNDRM1WLBdGodDZgjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EC82835DE1
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 08:14:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D61725FC23;
 Fri,  3 Sep 2021 08:14:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 4/5] configure: Get help text from meson_options.txt
Date: Fri,  3 Sep 2021 10:13:57 +0200
Message-Id: <20210903081358.956267-5-thuth@redhat.com>
In-Reply-To: <20210903081358.956267-1-thuth@redhat.com>
References: <20210903081358.956267-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's cumbersome to maintain the option help texts twice, once in the
"configure" script and once in meson_options.txt. So let's add some logic to
the configure script to read most of the help texts from meson_options.txt.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 95 ++++++++++++++++++-------------------------------------
 1 file changed, 31 insertions(+), 64 deletions(-)

diff --git a/configure b/configure
index 5a3c6ae2ba..a92d11a491 100755
--- a/configure
+++ b/configure
@@ -1549,7 +1549,6 @@ Advanced options (experts only):
                            Default:trace-<pid>
   --disable-slirp          disable SLIRP userspace network connectivity
   --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
-  --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
@@ -1576,16 +1575,13 @@ disabled with --disable-FEATURE, default is enabled if available
   user            supported user emulation targets
   linux-user      all linux usermode emulation targets
   bsd-user        all BSD usermode emulation targets
-  docs            build documentation
   guest-agent     build the QEMU Guest Agent
-  guest-agent-msi build guest agent Windows MSI installation package
   pie             Position Independent Executables
   modules         modules support (non-Windows)
   module-upgrades try to load modules from alternate paths for upgrades
   debug-tcg       TCG debugging (default is disabled)
   debug-info      debugging information
   lto             Enable Link-Time Optimization.
-  sparse          sparse checker
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
   cfi             Enable Control-Flow Integrity for indirect function calls.
@@ -1595,85 +1591,33 @@ disabled with --disable-FEATURE, default is enabled if available
   cfi-debug       In case of a cfi violation, a message containing the line that
                   triggered the error is written to stderr. After the error,
                   QEMU is still terminated with SIGILL
-  gnutls          GNUTLS cryptography support
-  nettle          nettle cryptography support
-  gcrypt          libgcrypt cryptography support
-  auth-pam        PAM access control
-  sdl             SDL UI
-  sdl-image       SDL Image support for icons
-  gtk             gtk UI
-  vte             vte support for the gtk UI
-  curses          curses UI
-  iconv           font glyph conversion support
-  vnc             VNC UI support
-  vnc-sasl        SASL encryption for VNC server
-  vnc-jpeg        JPEG lossy compression for VNC server
-  vnc-png         PNG compression for VNC server
-  cocoa           Cocoa UI (Mac OS X only)
-  virtfs          VirtFS
-  virtiofsd       build virtiofs daemon (virtiofsd)
-  libudev         Use libudev to enumerate host devices
-  mpath           Multipath persistent reservation passthrough
-  xen             xen backend driver support
-  xen-pci-passthrough    PCI passthrough support for Xen
-  brlapi          BrlAPI (Braile)
-  curl            curl connectivity
   membarrier      membarrier system call (for Linux 4.14+ or Windows)
   fdt             fdt device tree
-  kvm             KVM acceleration support
-  hax             HAX acceleration support
-  hvf             Hypervisor.framework acceleration support
-  nvmm            NVMM acceleration support
-  whpx            Windows Hypervisor Platform acceleration support
   rdma            Enable RDMA-based migration
   pvrdma          Enable PVRDMA support
   vde             support for vde network
   netmap          support for netmap network
   linux-aio       Linux AIO support
-  linux-io-uring  Linux io_uring support
-  cap-ng          libcap-ng support
-  attr            attr and xattr support
   vhost-net       vhost-net kernel acceleration support
   vhost-vsock     virtio sockets device support
   vhost-scsi      vhost-scsi kernel target support
   vhost-crypto    vhost-user-crypto backend support
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
-  vhost-user-blk-server    vhost-user-blk server support
   vhost-vdpa      vhost-vdpa kernel backend support
-  bpf             BPF kernel support
   spice           spice
   spice-protocol  spice-protocol
-  rbd             rados block device (rbd)
-  libiscsi        iscsi support
-  libnfs          nfs support
-  smartcard       smartcard support (libcacard)
-  u2f             U2F support (u2f-emu)
-  libusb          libusb (for usb passthrough)
   live-block-migration   Block migration in the main migration stream
-  usb-redir       usb network redirection support
-  lzo             support of lzo compression library
-  snappy          support of snappy compression library
-  bzip2           support of bzip2 compression library
-                  (for reading bzip2-compressed dmg images)
-  lzfse           support of lzfse compression library
-                  (for reading lzfse-compressed dmg images)
-  zstd            support for zstd compression library
-                  (for migration compression and qcow2 cluster compression)
-  seccomp         seccomp support
   coroutine-pool  coroutine freelist (better performance)
-  glusterfs       GlusterFS backend
   tpm             TPM support
   libssh          ssh block device support
   numa            libnuma support
-  libxml2         for Parallels image format
   tcmalloc        tcmalloc support
   jemalloc        jemalloc support
   avx2            AVX2 optimization support
   avx512f         AVX512F optimization support
   replication     replication support
   opengl          opengl support
-  virglrenderer   virgl rendering support
   xfsctl          xfsctl support
   qom-cast-debug  cast debugging support
   tools           build qemu-io, qemu-nbd and qemu-img tools
@@ -1688,18 +1632,41 @@ disabled with --disable-FEATURE, default is enabled if available
   crypto-afalg    Linux AF_ALG crypto backend driver
   capstone        capstone disassembler support
   debug-mutex     mutex debugging support
-  libpmem         libpmem support
-  xkbcommon       xkbcommon support
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
-  libdaxctl       libdaxctl support
-  fuse            FUSE block device export
-  fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
-  multiprocess    Out of process device emulation support
   gio             libgio support
   slirp-smbd      use smbd (at path --smbd=*) in slirp networking
-
-NOTE: The object files are built at the place where configure is launched
 EOF
+
+# Read remaining options and help text from meson_options.txt:
+current_feature=""
+while read first rest ; do
+    case "$first" in
+    option*)
+        case "$rest" in
+        *type*:*"'feature'"*)
+            current_feature=${first%\'*}
+            current_feature=${current_feature#*\'}
+        ;;
+        *)
+            current_feature=""
+        ;;
+        esac
+    ;;
+    description:)
+        if [ -n "$current_feature" ]; then
+            rest=${rest%\'*}
+            printf "  %-15s %s\n" "$current_feature" "${rest#\'}"
+        fi
+    ;;
+    *)
+        current_feature=""
+    ;;
+    esac
+done < "$source_path/meson_options.txt" | sort
+
+echo
+echo "NOTE: The object files are built at the place where configure is launched"
+
 exit 0
 fi
 
-- 
2.27.0


