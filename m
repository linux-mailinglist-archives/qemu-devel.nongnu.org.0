Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7F2373565
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:12:49 +0200 (CEST)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBiC-00044L-Os
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leBbv-00068G-Gl
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:06:19 -0400
Received: from indium.canonical.com ([91.189.90.7]:53326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leBbt-0000i2-LY
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:06:19 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leBbs-0004DP-HD
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 07:06:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7B91E2E805D
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 07:06:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 06:55:28 -0000
From: Thomas Huth <1634069@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: configuration feature-request keys shortcuts
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hi-angel-z th-huth
X-Launchpad-Bug-Reporter: Konstantin (hi-angel-z)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20161017092825.7185.16355.malonedeb@gac.canonical.com>
Message-Id: <162019772887.3475.13380847274136252357.malone@gac.canonical.com>
Subject: [Bug 1634069] Re: Exclude keys from grab
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: e440b4bc8ef927ec0e6b1f5d62571ffde4b26928
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
Reply-To: Bug 1634069 <1634069@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/138


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #138
   https://gitlab.com/qemu-project/qemu/-/issues/138

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1634069

Title:
  Exclude keys from grab

Status in QEMU:
  Expired

Bug description:
  Feature request: pressing every time a shortcut to release grab for
  switching windows/desktops is pretty annoying, especially for users of
  tiling WMs.

  QEMU have to have a way to specify keys or shortcuts (possibly
  something like "everything with the specified modifier key"), which
  would not be intercepted.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1634069/+subscriptions

