Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28015249E4C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 14:42:18 +0200 (CEST)
Received: from localhost ([::1]:43228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8NQ1-0003AC-77
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 08:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8NP7-0002fs-Ie
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 08:41:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:58808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8NP4-0002da-DE
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 08:41:21 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k8NP2-0007Bp-2L
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 12:41:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1036F2E80DC
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 12:41:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2020 12:28:43 -0000
From: Launchpad Bug Tracker <1883984@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Fix Released; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu; 
 component=main; status=Triaged; importance=Medium;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bruno-clisp janitor nhfbeebe paelzer rth
X-Launchpad-Bug-Reporter: Nelson H F Beebe (nhfbeebe)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159243063748.16697.11009205973276249282.malonedeb@chaenomeles.canonical.com>
Message-Id: <159784012796.3953.12958861668337523963.launchpad@ackee.canonical.com>
Subject: [Bug 1883984] Re: QEMU S/390x sqxbr (128-bit IEEE 754 square root)
 crashes qemu-system-s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: 7bbd1ac29a699ecb99793fda5f1582b8281158b1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:50:59
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
Reply-To: Bug 1883984 <1883984@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Merge proposal linked:
   https://code.launchpad.net/~paelzer/ubuntu/+source/qemu/+git/qemu/+merge=
/389527

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883984

Title:
  QEMU S/390x sqxbr (128-bit IEEE 754 square root) crashes qemu-system-
  s390x

Status in QEMU:
  Fix Committed
Status in qemu package in Ubuntu:
  Fix Released
Status in qemu source package in Focal:
  Triaged

Bug description:
  [Impact]

   * An instruction was described wrong so that on usage the program would =

     crash.

  [Test Case]

   * Run s390x in emulation and there use this program:
     For simplicity and speed you can use KVM guest as usual on s390x, that =

     after prep&install&compile of the test you run in qemu-tcg like:

     $ sudo qemu-system-s390x -machine s390-ccw-virtio,accel=3Dtcg -cpu max=
,zpci=3Don -serial mon:stdio -display none -m 4096 -nic user,model=3Dvirtio=
,hostfwd=3Dtcp::2222-:22 -drive file=3D/var/lib/uvtool/libvirt/images/focal=
-sqxbr.qcow,if=3Dnone,id=3Ddrive-virtio-disk0,format=3Dqcow2,cache=3Dnone -=
device virtio-blk-ccw,devno=3Dfe.0.0001,drive=3Ddrive-virtio-disk0,id=3Dvir=
tio-disk0,bootindex=3D1,scsi=3Doff
     Obviously is you have no s390x access you need to use emulation right =

     away.

   * Build and run failing program
     $ sudo apt install clang
     $ cat > bug-sqrtl-one-line.c << EOF
  int main(void) { volatile long double x, r; x =3D 4.0L; __asm__ =

  __volatile__("sqxbr %0, %1" : "=3Df" (r) : "f" (x)); return (0);}
  EOF
     $ cc bug-sqrtl-one-line.c
     $ ./a.out
     Segmentation fault (core dumped)

     qemu is dead by now as long as the bug is present

  [Regression Potential]

   * The change only modifies 128 bit square root on s390x so regressions
     should be limited to exactly that - which formerly before this fix was =

     a broken instruction.

  [Other Info]
   =

   * n/a

  ---

  In porting software to guest Ubuntu 18.04 and 20.04 VMs for S/390x, I dis=
covered
  that some of my own numerical programs, and also a GNU configure script f=
or at
  least one package with CC=3Dclang, would cause an instant crash of the VM=
, sometimes
  also destroying recently opened files, and producing long strings of NUL =
characters
  in /var/log/syslog in the S/390 guest O/S.

  Further detective work narrowed the cause of the crash down to a single I=
BM S/390
  instruction: sqxbr (128-bit IEEE 754 square root).  Here is a one-line pr=
ogram
  that when compiled and run on a VM hosted on QEMUcc emulator version 4.2.0
  (Debian 1:4.2-3ubuntu6.1) [hosted on Ubuntu 20.04 on a Dell Precision 7920
  workstation with an Intel Xeon Platinum 8253 CPU],  and also on QEMU emul=
ator
  version 5.0.0, reproducibly produces a VM crash under qemu-system-s390x.

  % cat bug-sqrtl-one-line.c
  int main(void) { volatile long double x, r; x =3D 4.0L; __asm__ __volatil=
e__("sqxbr %0, %1" : "=3Df" (r) : "f" (x)); return (0);}

  % cc bug-sqrtl-one-line.c && ./a.out
  Segmentation fault (core dumped)

  The problem code may be the function float128_sqrt() defined in qemu-5.0.=
0/fpu/softfloat.c
  starting at line 7619.  I have NOT attempted to run the qemu-system-s390x=
 executable
  under a debugger.  However, I observe that S/390 is the only CPU family t=
hat I know of,
  except possibly for a Fujitsu SPARC-64, that has a 128-bit square root in=
 hardware.
  Thus, this instruction bug may not have been seen before.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883984/+subscriptions

