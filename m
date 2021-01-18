Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0C2F98AF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 05:33:42 +0100 (CET)
Received: from localhost ([::1]:36052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1MEX-0000an-OB
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 23:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1MC0-0007Ox-QO
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 23:31:04 -0500
Received: from indium.canonical.com ([91.189.90.7]:51332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1MBy-00064w-VX
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 23:31:04 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1MBw-0003mm-PD
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 04:31:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ADC212E8138
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 04:31:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Jan 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1608802@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor kwolf-redhat th-huth ubuntu-weilnetz
X-Launchpad-Bug-Reporter: Stefan Weil (ubuntu-weilnetz)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160802061128.22869.50660.malonedeb@soybean.canonical.com>
Message-Id: <161094343739.15998.10650732967095022109.malone@loganberry.canonical.com>
Subject: [Bug 1608802] Re: READ_DMA (0xC8) command does not work correctly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 292efe83ab67c053ec1c2895e313394d489f4c61
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1608802

Title:
  READ_DMA (0xC8) command does not work correctly

Status in QEMU:
  Expired

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

