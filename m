Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B70377989
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 02:38:34 +0200 (CEST)
Received: from localhost ([::1]:50106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lftwP-00009R-GW
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 20:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfttc-0007tX-T8
 for qemu-devel@nongnu.org; Sun, 09 May 2021 20:35:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:59694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lftta-0002ea-Mf
 for qemu-devel@nongnu.org; Sun, 09 May 2021 20:35:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfttW-0002Lt-Po
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 00:35:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8FC3C2E8186
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 00:35:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 00:27:54 -0000
From: Adriano Marto Reis <1890208@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adrianomarto th-huth
X-Launchpad-Bug-Reporter: Adriano Marto Reis (adrianomarto)
X-Launchpad-Bug-Modifier: Adriano Marto Reis (adrianomarto)
References: <159649385359.2765.12928081922733657659.malonedeb@gac.canonical.com>
Message-Id: <162060647499.9822.9407379629947811877.malone@chaenomeles.canonical.com>
Subject: [Bug 1890208] Re: Mouse pointer disappears when it is over console
 window
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: dbb0f3df789dd04d14789996c7700feb4661f9e3
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
Reply-To: Bug 1890208 <1890208@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I also reported this issue in:
https://github.com/virt-manager/virt-manager/issues/251

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890208

Title:
  Mouse pointer disappears when it is over console window

Status in QEMU:
  Incomplete

Bug description:
  The host mouse pointer disappears when it is over a console window.

  I am emulating quite simple hardware: just text console and no mouse.
  I don't expect the mouse to have any effect on the emulated computers,
  but I need to know where the mouse pointer is. That is  important
  because I need to use the mouse to switch between applications and to
  switch between virtual machines (QEMU grabs Alt+Tab events). Also, it
  is quite tricky to work with multiple screens when we don't know where
  the mouse pointer is.

  I am using:
  * Virtual Machine Manager 2.2.1
  * QEMU 4.2.0
  * Fedora 32
  * KDE Plasma 5.18.5

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890208/+subscriptions

