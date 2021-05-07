Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFA2375F09
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:12:59 +0200 (CEST)
Received: from localhost ([::1]:47410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leqvC-0003FQ-3X
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqtC-0001YZ-LM
 for qemu-devel@nongnu.org; Thu, 06 May 2021 23:10:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:59418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqtA-0002xM-LF
 for qemu-devel@nongnu.org; Thu, 06 May 2021 23:10:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leqt9-0003rn-AN
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 03:10:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 481D72E8135
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 03:10:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 03:03:56 -0000
From: Thomas Huth <1885332@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: langston0 th-huth xeioexception
X-Launchpad-Bug-Reporter: Langston (langston0)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159320263008.26082.15752081078008046631.malonedeb@gac.canonical.com>
Message-Id: <162035663635.15365.158424584535122244.malone@soybean.canonical.com>
Subject: [Bug 1885332] Re: Error in user-mode calculation of ELF aux vector's
 AT_PHDR
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 48a077cccd6f8be1bdd9dff78e22a73449d45735
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1885332 <1885332@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885332

Title:
  Error in user-mode calculation of ELF aux vector's AT_PHDR

Status in QEMU:
  Incomplete

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

