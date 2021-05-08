Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E38376FF5
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:06:54 +0200 (CEST)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfG73-0005UW-Tl
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfG5w-0004AL-36
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:05:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:53960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfG5s-0005wz-3a
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:05:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfG5p-0006i2-Q8
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 06:05:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C26FF2E80F3
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 06:05:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 05:55:57 -0000
From: Thomas Huth <1890208@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adrianomarto th-huth
X-Launchpad-Bug-Reporter: Adriano Marto Reis (adrianomarto)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159649385359.2765.12928081922733657659.malonedeb@gac.canonical.com>
Message-Id: <162045335745.16505.12120467841472041704.malone@soybean.canonical.com>
Subject: [Bug 1890208] Re: Mouse pointer disappears when it is over console
 window
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 03254600b133bade1fd476686c5da82d3824f4b2
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1890208 <1890208@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Does your emulated machine have a graphics card (VGA or something
similar)? If so, you might need to remove it from the guest. Also, have
you tried to report this issue to the virt-manager project first?

** Changed in: qemu
       Status: New =3D> Incomplete

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

