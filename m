Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0947F2AAA60
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Nov 2020 10:32:26 +0100 (CET)
Received: from localhost ([::1]:58652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbh3h-00049L-4A
	for lists+qemu-devel@lfdr.de; Sun, 08 Nov 2020 04:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kbh2G-0002sL-RF
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 04:30:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:56430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kbh2C-0004nn-2p
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 04:30:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kbh29-0007tm-Fl
 for <qemu-devel@nongnu.org>; Sun, 08 Nov 2020 09:30:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7368A2E8132
 for <qemu-devel@nongnu.org>; Sun,  8 Nov 2020 09:30:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2020 09:23:56 -0000
From: Thomas Huth <1630723@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell skintigh th-huth
X-Launchpad-Bug-Reporter: Seth (skintigh)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20161005185604.6432.79423.malonedeb@chaenomeles.canonical.com>
Message-Id: <160482743612.18790.2141884017029525337.malone@wampee.canonical.com>
Subject: [Bug 1630723] Re: UART writes to netduino2/stm32f205-soc disappear
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 16b46968af10f209287f573b4df7c7ecbaa7bd67
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 04:10:58
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
Reply-To: Bug 1630723 <1630723@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting all older bugs to
"Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1630723

Title:
  UART writes to netduino2/stm32f205-soc disappear

Status in QEMU:
  Incomplete

Bug description:
  Writes to UART 2 and 3 disappear. As a sanity check I put printf
  statements in the function stm32f2xx_usart_write in
  qemu/hw/char/stm32f2xx_usart.c and recompiled qemu. The result
  confirmed text sent to UART1 and UART4 are sent to that function while
  text sent to UART 2 and 3 are not. I assume writes to all 4 need to
  make it to that function for emulations to operate correctly.

  Example code that writes to all 4 UARTs/USARTs (does not contain the prin=
tf statements mention above):
  https://github.com/skintigh/baremetal_netduino2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1630723/+subscriptions

