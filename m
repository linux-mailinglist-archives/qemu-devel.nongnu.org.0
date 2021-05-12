Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B7037D38A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:27:12 +0200 (CEST)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtZf-0006vU-9G
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtOY-0001fF-9A
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:15:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:34512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtOW-0001Fy-0f
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:15:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgtOU-0001ig-0F
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:15:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 003B42E813A
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 18:09:34 -0000
From: Thomas Huth <1913315@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth vt-alt
X-Launchpad-Bug-Reporter: Vitaly Chikunov (vt-alt)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161167497358.4863.17291791719671024899.malonedeb@soybean.canonical.com>
Message-Id: <162084297473.1987.10684930727573515276.malone@wampee.canonical.com>
Subject: [Bug 1913315] Re: qemu-system-x86_64 crash: in
 memory_region_access_valid+0x13
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 195889fc78e4e6abe8c8a4842942ebff85b758b5
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
Reply-To: Bug 1913315 <1913315@bugs.launchpad.net>
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
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913315

Title:
  qemu-system-x86_64 crash: in memory_region_access_valid+0x13

Status in QEMU:
  Incomplete

Bug description:
  Recently we started to get intermittent qemu crashes. There is
  catchsegv report:

  ```
  + qemu-system-x86_64 -m 77766M -smp 8 -nodefaults -nographic -no-reboot -=
fsdev local,id=3Droot,path=3D/,security_model=3Dnone,multidevs=3Dremap -dev=
ice virtio-9p-pci,fsdev=3Droot,mount_tag=3D/dev/root -device virtio-rng-pci=
 -serial mon:stdio -kernel /usr/src/tmp/kernel-image-rt-buildroot/boot/vmli=
nuz-4.19.165-rt-alt1.rt70 -initrd /usr/src/tmp/initramfs-4.19.165-rt-alt1.r=
t70.img -bios bios.bin -append 'console=3DttyS0 mitigations=3Doff nokaslr q=
uiet panic=3D-1 no_timer_check'
  *** signal 11
  Register dump:

   RAX: 0000000000000000   RBX: 0000034000000340   RCX: 0000000000000001
   RDX: 0000000000000004   RSI: 0000000000000300   RDI: 0000034000000340
   RBP: 0000000000000300   R8 : 0000000000000000   R9 : 0000034000000340
   R10: 0000000000000370   R11: 0000000000000002   R12: 0000000000000004
   R13: 0000000000000004   R14: 000055b473fef5e0   R15: 0000000000000002
   RSP: 00007fd7edffae90

   RIP: 000055b4717ef653   EFLAGS: 00010206

   CS: 0033   FS: 0000   GS: 0000

   Trap: 0000000e   Error: 00000004   OldMask: 7ffbfa77   CR2: 00000388

   FPUCW: 0000037f   FPUSW: 00000000   TAG: 00000000
   RIP: 00000000   RDP: 00000000

   ST(0) 0000 0000000000000000   ST(1) 0000 0000000000000000
   ST(2) 0000 0000000000000000   ST(3) 0000 0000000000000000
   ST(4) 0000 0000000000000000   ST(5) 0000 0000000000000000
   ST(6) 0000 0000000000000000   ST(7) 0000 0000000000000000
   mxcsr: 1fa0
   XMM0:  00000000000000000000000000000000 XMM1:  0000000000000000000000000=
0000000
   XMM2:  00000000000000000000000000000000 XMM3:  0000000000000000000000000=
0000000
   XMM4:  00000000000000000000000000000000 XMM5:  0000000000000000000000000=
0000000
   XMM6:  00000000000000000000000000000000 XMM7:  0000000000000000000000000=
0000000
   XMM8:  00000000000000000000000000000000 XMM9:  0000000000000000000000000=
0000000
   XMM10: 00000000000000000000000000000000 XMM11: 0000000000000000000000000=
0000000
   XMM12: 00000000000000000000000000000000 XMM13: 0000000000000000000000000=
0000000
   XMM14: 00000000000000000000000000000000 XMM15: 0000000000000000000000000=
0000000

  Backtrace:
  qemu-system-x86_64(memory_region_access_valid+0x13)[0x55b4717ef653]
  qemu-system-x86_64(memory_region_dispatch_write+0x48)[0x55b4717ef8c8]
  qemu-system-x86_64(+0x69fdfc)[0x55b471851dfc]
  qemu-system-x86_64(helper_le_stl_mmu+0x2c5)[0x55b471858995]
  [0x7feaed070925]

  ```
  QEMU release 5.2.0.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913315/+subscriptions

