Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5752B7B98
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:47:14 +0100 (CET)
Received: from localhost ([::1]:40700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKzZ-00060n-7S
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfKyU-0005Dc-35
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:46:06 -0500
Received: from indium.canonical.com ([91.189.90.7]:37616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfKyR-0007aS-Vd
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:46:05 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfKyQ-0001sT-C4
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:46:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 49A7B2E80EA
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:46:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2020 10:26:34 -0000
From: Thomas Huth <1608802@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kwolf-redhat th-huth ubuntu-weilnetz
X-Launchpad-Bug-Reporter: Stefan Weil (ubuntu-weilnetz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160802061128.22869.50660.malonedeb@soybean.canonical.com>
Message-Id: <160569519447.13740.10096134850050760895.malone@soybean.canonical.com>
Subject: [Bug 1608802] Re: READ_DMA (0xC8) command does not work correctly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: f4ba5ed28aaddd5fb731ed5a2e4fea9809e5b86f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 04:01:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1608802 <1608802@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1608802

Title:
  READ_DMA (0xC8) command does not work correctly

Status in QEMU:
  Incomplete

Bug description:
  The QEMU PC emulation of DMA does not behave like real hardware or
  other virtualization software.

  From the original bug report (Benjamin David Lunt):

  =C2=A0=C2=A0=C2=A0=C2=A0Back to the READ_DMA command, it is my conclusion=
 that the
  =C2=A0=C2=A0=C2=A0=C2=A0READ_DMA command, more precisely, the BUS Master =
part of QEMU is
  =C2=A0=C2=A0=C2=A0=C2=A0in error.  The tests that people have done to see=
 if it works, is
  =C2=A0=C2=A0=C2=A0=C2=A0probably the guest finding out that DMA doesn't w=
ork and defaulting
  =C2=A0=C2=A0=C2=A0=C2=A0to PIO, but since the read was successful visuall=
y to the user, the
  =C2=A0=C2=A0=C2=A0=C2=A0user assumed the READ_DMA command works, where th=
e guest actually
  =C2=A0=C2=A0=C2=A0=C2=A0defaulted back to PIO transfers without notice.

  =C2=A0=C2=A0=C2=A0=C2=A0My code works on real hardware (numerous machines=
), Bochs, and Oracle's
  =C2=A0=C2=A0=C2=A0=C2=A0Virtual Box.

  =C2=A0=C2=A0=C2=A0=C2=A0...

  =C2=A0=C2=A0=C2=A0=C2=A0I have a small test suite, zipped and included at:
  =C2=A0=C2=A0=C2=A0=C2=A0www.fysnet.net/temp/c8bug.zip

  =C2=A0=C2=A0=C2=A0=C2=A0Within this zip file is a.img. This is a freeDOS =
bootable
  =C2=A0=C2=A0=C2=A0=C2=A0floppy.  Emulate it with QEMU and then at the DOS=
 prompt, run
  =C2=A0=C2=A0=C2=A0=C2=A0c8bug.exe.

  =C2=A0=C2=A0=C2=A0=C2=A0It will say that the drive is not ready.
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"Drive never became ready"
  =C2=A0=C2=A0=C2=A0=C2=A0(along with a few other lines of text)

  =C2=A0=C2=A0=C2=A0=C2=A0The source for this test suite is also included.
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c8bug.c is the c source code
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c8bug.h is the header file
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ctype.h is a quick way to get 'bit8u' type =
defines
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0timer.h is a delay routine from another pro=
ject I have
  =C2=A0=C2=A0=C2=A0=C2=A0(The base IO addresses are assumed and set at the=
 top of c8bug.c)
  =C2=A0=C2=A0=C2=A0=C2=A0(compiled with DJGPP for DPMI)

  =C2=A0=C2=A0=C2=A0=C2=A0q.bat is my command line for QEMU

  =C2=A0=C2=A0=C2=A0=C2=A0On all other machines and VirtualBox, the control=
ler is ready
  =C2=A0=C2=A0=C2=A0=C2=A0for me to receive the sector data.
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"Drive is ready to transmit data..."

  =C2=A0=C2=A0=C2=A0=C2=A0However, in QEMU, the controller never becomes re=
ady.
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"Drive never became ready"

  The bug was reported for QEMU for Windows, but I can confirm that QEMU
  for Linux also shows that behaviour, while VirtualBox works.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1608802/+subscriptions

