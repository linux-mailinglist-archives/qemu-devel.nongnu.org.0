Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4F379F45
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:44:00 +0200 (CEST)
Received: from localhost ([::1]:38692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLBW-0004bo-L6
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgL8b-0002ip-93
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:40:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:60594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgL8X-00040f-2W
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:40:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgL8V-0003ic-78
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:40:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2A4C12E8190
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:40:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:35:32 -0000
From: Thomas Huth <1799792@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dos-d ernstp lilydjwg th-huth
X-Launchpad-Bug-Reporter: Sebastian Krzyszkowiak (dos-d)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154041310239.24736.3249552536528955636.malonedeb@wampee.canonical.com>
Message-Id: <162071133219.7447.2043308331339068412.malone@gac.canonical.com>
Subject: [Bug 1799792] Re: Broken scaling with gtk,gl=on on a hidpi display
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: dd25ec8f4c8707ff52a49eb4a9d78eeff1a7e99a
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
Reply-To: Bug 1799792 <1799792@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/262


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #262
   https://gitlab.com/qemu-project/qemu/-/issues/262

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1799792

Title:
  Broken scaling with gtk,gl=3Don on a hidpi display

Status in QEMU:
  Expired

Bug description:
  Tested on QEMU 3.0.0 on Arch Linux.

  I'm using a hidpi screen, and therefore use those environment
  variables in order to have GTK+ apps properly scaled:

  GDK_SCALE=3D2
  GDK_DPI_SCALE=3D0.5

  However, QEMU, when launched with "-display gtk,gl=3Don" option, doesn't
  scale the window content properly, as seen on the attached screenshot.

  Switching to "-display gtk,gl=3Doff" and "-display sdl,gl=3Don" makes it
  work fine.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1799792/+subscriptions

