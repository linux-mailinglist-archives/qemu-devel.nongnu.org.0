Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2177221BD21
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 20:42:13 +0200 (CEST)
Received: from localhost ([::1]:58942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtxyO-0008Bq-70
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 14:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jtxxd-0007mp-Dp
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 14:41:25 -0400
Received: from indium.canonical.com ([91.189.90.7]:48862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jtxxb-0007hA-BP
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 14:41:25 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jtxxZ-0007GT-Np
 for <qemu-devel@nongnu.org>; Fri, 10 Jul 2020 18:41:21 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7F2CB2E80F0
 for <qemu-devel@nongnu.org>; Fri, 10 Jul 2020 18:41:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2020 18:28:56 -0000
From: Langston <1885332@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: langston0 xeioexception
X-Launchpad-Bug-Reporter: Langston (langston0)
X-Launchpad-Bug-Modifier: Langston (langston0)
References: <159320263008.26082.15752081078008046631.malonedeb@gac.canonical.com>
Message-Id: <159440573695.12635.1713540599801417260.malone@soybean.canonical.com>
Subject: [Bug 1885332] Re: Error in user-mode calculation of ELF aux vector's
 AT_PHDR
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4809fcb62f445aaa3ae919f7f6c3cc7d156ea57a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8facbbabec94f8037738148406712d4e39918472
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 14:25:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1885332 <1885332@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

@Dimitry To confirm that this is really the same issue (and not an
unrelated crash in the same function), could you post:

 1. the ELF headers ("readelf -h"),
 2. the program headers ("readelf -l"), and
 3. the output (the AUX VECTOR section) from this GDB script (suitably modi=
fied for your program), when connecting to QEMU's GDB server? https://gist.=
github.com/langston-barrett/5573d64ae0c9953e2fa0fe26847a5e1e

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885332

Title:
  Error in user-mode calculation of ELF aux vector's AT_PHDR

Status in QEMU:
  New

Bug description:
  =

  I have an (admittedly strange) statically-linked ELF binary for Linux tha=
t runs just fine on top of the Linux kernel in QEMU full-system emulation, =
but crashes before main in user-mode emulation. Specifically, it crashes wh=
en initializing thread-local storage in glibc's _dl_aux_init, because it re=
ads out a strange value from the AT_PHDR entry of the ELF aux vector.

  The binary has these program headers:

    Program Headers:
      Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Ali=
gn
      EXIDX          0x065874 0x00075874 0x00075874 0x00570 0x00570 R   0x4
      PHDR           0x0a3000 0x00900000 0x00900000 0x00160 0x00160 R   0x1=
000
      LOAD           0x0a3000 0x00900000 0x00900000 0x00160 0x00160 R   0x1=
000
      LOAD           0x000000 0x00010000 0x00010000 0x65de8 0x65de8 R E 0x1=
0000
      LOAD           0x066b7c 0x00086b7c 0x00086b7c 0x02384 0x02384 RW  0x1=
0000
      NOTE           0x000114 0x00010114 0x00010114 0x00044 0x00044 R   0x4
      TLS            0x066b7c 0x00086b7c 0x00086b7c 0x00010 0x00030 R   0x4
      GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x8
      GNU_RELRO      0x066b7c 0x00086b7c 0x00086b7c 0x00484 0x00484 R   0x1
      LOAD           0x07e000 0x00089000 0x00089000 0x03f44 0x03f44 R E 0x1=
000
      LOAD           0x098000 0x00030000 0x00030000 0x01000 0x01000 RW  0x1=
000

  If I build the Linux kernel with the following patch to the very end
  of create_elf_tables in fs/binfmt_elf.c

    /* Put the elf_info on the stack in the right place.  */
    elf_addr_t *my_auxv =3D (elf_addr_t *) mm->saved_auxv;
    int i;
    for (i =3D 0; i < 15; i++) {
      printk("0x%x =3D 0x%x", my_auxv[2*i], my_auxv[(2*i)+ 1]);
    }
    if (copy_to_user(sp, mm->saved_auxv, ei_index * sizeof(elf_addr_t)))
        return -EFAULT;
    return 0;

  and run it like this:

    qemu-system-arm \
      -M versatilepb \
      -nographic \
      -dtb ./dts/versatile-pb.dtb \
      -kernel zImage \
      -M versatilepb \
      -m 128M \
      -append "earlyprintk=3Dvga,keep" \
      -initrd initramfs

  after I've built the kernel initramfs like this (where "init" is the
  binary in question):

    make ARCH=3Darm versatile_defconfig
    make ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- all -j10
    cp "$1" arch/arm/boot/init
    cd arch/arm/boot
    echo init | cpio -o --format=3Dnewc > initramfs

  then I get the following output. This is the kernel's view of the aux
  vector for this binary:

    0x10 =3D 0x1d7
    0x6 =3D 0x1000
    0x11 =3D 0x64
    0x3 =3D 0x900000
    0x4 =3D 0x20
    0x5 =3D 0xb
    0x7 =3D 0x0
    0x8 =3D 0x0
    0x9 =3D 0x101b8
    0xb =3D 0x0
    0xc =3D 0x0
    0xd =3D 0x0
    0xe =3D 0x0
    0x17 =3D 0x0
    0x19 =3D 0xbec62fb5

  However, if I run "qemu-arm -g 12345 binary" and use GDB to peek at
  the aux vector at the beginning of __libc_start_init (for example,
  using this Python GDB API script: https://gist.github.com/langston-
  barrett/5573d64ae0c9953e2fa0fe26847a5e1e), then I see the following
  values:

    AT_PHDR =3D 0xae000
    AT_PHENT =3D 0x20
    AT_PHNUM =3D 0xb
    AT_PAGESZ =3D 0x1000
    AT_BASE =3D 0x0
    AT_FLAGS =3D 0x0
    AT_ENTRY =3D 0x10230
    AT_UID =3D 0x3e9
    AT_EUID =3D 0x3e9
    AT_GID =3D 0x3e9
    AT_EGID =3D 0x3e9
    AT_HWCAP =3D 0x1fb8d7
    AT_CLKTCK =3D 0x64
    AT_RANDOM =3D -0x103c0
    AT_HWCAP2 =3D 0x1f
    AT_NULL =3D 0x0

  The crucial difference is in AT_PHDR (0x3), which is indeed the
  virtual address of the PHDR segment when the kernel calculates it, but
  is not when QEMU calculates it.

  qemu-arm --version
  qemu-arm version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.26)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1885332/+subscriptions

