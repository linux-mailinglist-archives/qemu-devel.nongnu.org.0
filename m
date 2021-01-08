Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BDF2EEC7C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:28:28 +0100 (CET)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjO0-00036l-0N
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLl-0001Jc-Rd
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:11 -0500
Received: from indium.canonical.com ([91.189.90.7]:56012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLb-0003ea-JT
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:09 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxjLX-00045h-5k
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:25:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9393F2E814C
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 04:25:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1656711@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor joshtriplett th-huth
X-Launchpad-Bug-Reporter: Josh Triplett (joshtriplett)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170115231500.27272.80762.malonedeb@chaenomeles.canonical.com>
Message-Id: <161007944004.27824.10606564580461628911.malone@loganberry.canonical.com>
Subject: [Bug 1656711] Re: GTK3 interface doesn't zoom-to-fit by default
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: 78916c70a5d3932ca8aab9c6b6c58300c4c84152
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
Reply-To: Bug 1656711 <1656711@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1656711

Title:
  GTK3 interface doesn't zoom-to-fit by default

Status in QEMU:
  Expired

Bug description:
  The SDL interface automatically scales the video output to
  match the window size.  The GTK3 interface has an off-by-default option
  "Zoom To Fit" for that.  As far as I can tell, no command-line option
  exists to turn that option on.  That makes it harder to quickly zoom a
  freshly launched VM; instead of just hitting a maximize-window hotkey, I
  also have to navigate through the menu to select "Zoom To Fit".

  Given that VMs typically start out running in a much lower-resolution
  video mode than the host (and VMs not running a full graphical
  environment often stay that way), this seriously impacts the usability
  of qemu-system.

  (Observed in QEMU 2.8)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1656711/+subscriptions

