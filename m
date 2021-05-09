Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA92377753
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:29:35 +0200 (CEST)
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflN8-0004tY-I6
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflEf-0006MZ-Jm
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:20:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:56284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflEV-0007dR-VZ
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:20:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lflET-0001bN-LW
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:20:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A0C872E8058
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:11:43 -0000
From: Thomas Huth <1839367@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell techsavvy8989 th-huth
X-Launchpad-Bug-Reporter: Aaron Hill (techsavvy8989)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156519998798.13922.14288436816599615545.malonedeb@wampee.canonical.com>
Message-Id: <162057310367.2325.1289397019871656882.malone@wampee.canonical.com>
Subject: [Bug 1839367] Re: Wrong interrupts generated for I.MX6 FEC controller
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 67bf0276ab1bd7786fbb5ff5221e8e73b4024d1a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1839367 <1839367@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/224


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #224
   https://gitlab.com/qemu-project/qemu/-/issues/224

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1839367

Title:
  Wrong interrupts generated for I.MX6 FEC controller

Status in QEMU:
  Expired

Bug description:
  The imx_eth_update function in hw/net/imx_fec.c has the following
  comment
  (https://github.com/qemu/qemu/blob/864ab314f1d924129d06ac7b571f105a2b76a4=
b2/hw/net/imx_fec.c#L421-L445):

      /*
       * Previous versions of qemu had the ENET_INT_MAC and ENET_INT_MAC
       * interrupts swapped. This worked with older versions of Linux (4.14
       * and older) since Linux associated both interrupt lines with Ethern=
et
       * MAC interrupts. Specifically,
       * - Linux 4.15 and later have separate interrupt handlers for the MA=
C and
       *   timer interrupts. Those versions of Linux fail with versions of =
QEMU
       *   with swapped interrupt assignments.
       * - In linux 4.14, both interrupt lines were registered with the Eth=
ernet
       *   MAC interrupt handler. As a result, all versions of qemu happen =
to
       *   work, though that is accidental.
       * - In Linux 4.9 and older, the timer interrupt was registered direc=
tly
       *   with the Ethernet MAC interrupt handler. The MAC interrupt was
       *   redirected to a GPIO interrupt to work around erratum ERR006687.
       *   This was implemented using the SOC's IOMUX block. In qemu, this =
GPIO
       *   interrupt never fired since IOMUX is currently not supported in =
qemu.
       *   Linux instead received MAC interrupts on the timer interrupt.
       *   As a result, qemu versions with the swapped interrupt assignment=
 work,
       *   albeit accidentally, but qemu versions with the correct interrupt
       *   assignment fail.
       *
       * To ensure that all versions of Linux work, generate ENET_INT_MAC
       * interrrupts on both interrupt lines. This should be changed if and=
 when
       * qemu supports IOMUX.
       */

  Unfortunately, this behavior causes the QNX Sabrelite BSP
  (http://blackberry.qnx.com/en/developers/bsp) to hang on ethernet
  initialization. This is caused by the fact that QEMU is firing the
  ENET_INT_TS_TIMER timer interrupt unexpectedly (when the ENET_INT_MAC
  flag is set). The BSP functions correctly on the actual hardware, but
  it is unable to handle the deliberately incorrect interrupt firing by
  QEMU.

  From reading the comment, it appears that this behavior is necessary
  to support certain versions of Linux. However, it would be very useful
  to be able to restore the correct interrupt behavior (possibly via a
  command-line flag).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1839367/+subscriptions

