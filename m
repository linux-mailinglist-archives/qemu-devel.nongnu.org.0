Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF9D36FE44
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:08:57 +0200 (CEST)
Received: from localhost ([::1]:59814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVhI-0002tT-C9
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcVZq-0006zp-NR
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:01:18 -0400
Received: from indium.canonical.com ([91.189.90.7]:36856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcVZl-0004x4-Kr
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:01:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcVZh-00078s-Jq
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 16:01:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A8E1C2E8193
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 16:01:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 15:47:13 -0000
From: Anisse Astier <1926782@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anisse
X-Launchpad-Bug-Reporter: Anisse Astier (anisse)
X-Launchpad-Bug-Modifier: Anisse Astier (anisse)
References: <161979514177.9618.12499713444538330547.malonedeb@gac.canonical.com>
Message-Id: <161979763369.10894.2197839419345059622.malone@gac.canonical.com>
Subject: [Bug 1926782] Re: configure script --extra-cflags not passed to
 config-meson.cross
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: c7de629a37cb873944a95a659c7289adf1206344
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1926782 <1926782@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is my full invocation of the configure script:

CFLAGS=3D" -isystem /home/anisse/dev/qemu-cross/build/usr/include" \
LDFLAGS=3D"-Wl,--gc-sections -Wl,-Y/home/anisse/dev/qemu-cross/build/lib -W=
l,-Y/home/anisse/dev/qemu-cross/build/usr/lib -Wl,-rpath-link,/home/anisse/=
dev/qemu-cross/build/lib -Wl,-rpath-link,/home/anisse/dev/qemu-cross/build/=
usr/lib" \
PKG_CONFIG=3Dpkg-config \
PKG_CONFIG_LIBDIR=3D"/home/anisse/dev/qemu-cross/build/usr/lib/pkgconfig" \
PKG_CONFIG_SYSROOT_DIR=3D"/home/anisse/dev/qemu-cross/build" \
./configure $(cat ../features) --enable-vnc --enable-vnc-sasl --enable-vnc-=
jpeg --enable-vnc-png --target-list=3Daarch64-softmmu --cross-prefix=3D/opt=
/toolchains/aarch64-musl-1.2.2-gcc-10.2.0-binutils-2.36-gdb-7.12.1-1/bin/aa=
rch64-linux-musl-

And the content of the ./features file:

--enable-system --disable-user --disable-linux-user --disable-bsd-user
--disable-docs --disable-guest-agent --disable-guest-agent-msi --enable-
pie --disable-modules --disable-module-upgrades --disable-debug-tcg
--disable-debug-info --disable-sparse --disable-safe-stack --disable-
gnutls --disable-nettle --disable-gcrypt --disable-auth-pam --disable-
sdl --disable-sdl-image --disable-gtk --disable-vte --disable-curses
--disable-iconv --enable-vnc --enable-vnc-sasl --enable-vnc-jpeg
--enable-vnc-png --disable-cocoa --disable-virtfs --disable-virtiofsd
--disable-libudev --disable-mpath --disable-xen --disable-xen-pci-
passthrough --disable-brlapi --disable-curl --enable-membarrier
--enable-fdt --enable-kvm --disable-hax --disable-hvf --disable-whpx
--disable-rdma --disable-pvrdma --disable-vde --disable-netmap
--disable-linux-aio --disable-linux-io-uring --disable-cap-ng --disable-
attr --enable-vhost-net --enable-vhost-vsock --enable-vhost-scsi
--enable-vhost-crypto --enable-vhost-kernel --enable-vhost-user
--disable-vhost-user-blk-server --disable-vhost-vdpa --disable-spice
--disable-rbd --disable-libiscsi --disable-libnfs --disable-smartcard
--disable-u2f --enable-libusb --disable-live-block-migration --disable-
usb-redir --disable-lzo --disable-snappy --disable-bzip2 --disable-lzfse
--disable-zstd --disable-seccomp --disable-coroutine-pool --disable-
glusterfs --disable-tpm --disable-libssh --disable-numa --disable-
libxml2 --disable-tcmalloc --disable-jemalloc --disable-avx2 --disable-
avx512f --disable-replication --disable-opengl --disable-virglrenderer
--disable-xfsctl --disable-qom-cast-debug --enable-tools --disable-bochs
--disable-cloop --disable-dmg --enable-qcow1 --enable-vdi --disable-
vvfat --disable-qed --disable-parallels --disable-sheepdog --enable-
crypto-afalg --disable-capstone --disable-debug-mutex --disable-libpmem
--disable-xkbcommon --disable-rng-none --disable-libdaxctl

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926782

Title:
  configure script --extra-cflags not passed to config-meson.cross

Status in QEMU:
  New

Bug description:
  Since qemu 5.2, when building, the configure would not finish, but
  would return this error instead:

     qemu ../meson.build:852:2: ERROR: C header 'sasl/sasl.h' not found

  This is for a cross build, and I invoke qemu with the --extra-cflags
  and --extra-ldflags containing all the proper paths to the headers,
  libraries etc. It worked properly with qemu 3.1 to 5.1.

  After looking into the configure script, it seems that meson is passed
  the CFLAGS environment variable instead of QEMU_CFLAGS, and only the
  latter contains the --extra-cflags argument:

      echo "c_args =3D [${CFLAGS:+$(meson_quote $CFLAGS)}]" >> $cross

  Using the CFLAGS and LDFLAGS environment variable instead of --extra-
  cflags and --extra-ldflags fixes the issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926782/+subscriptions

