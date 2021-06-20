Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B23ADFC3
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 20:06:43 +0200 (CEST)
Received: from localhost ([::1]:54732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv1qE-00085W-A8
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 14:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lv1pH-0007LG-8x
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 14:05:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:32926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lv1pE-0001Y0-Q7
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 14:05:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lv1pB-0001UY-PS
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:05:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BF2E82E8075
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:05:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Jun 2021 17:59:02 -0000
From: Thomas Huth <1868221@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gui usability
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange fbriere lockywolf mjt+launchpad-tls
 th-huth
X-Launchpad-Bug-Reporter: Lockywolf (lockywolf)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158469084688.19486.16271224237247905413.malonedeb@chaenomeles.canonical.com>
Message-Id: <162421194255.17261.10307273001204877438.malone@gac.canonical.com>
Subject: [Bug 1868221] Re: /usr/share/applications/qemu.desktop should have an
 "Exec=" key.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: b6c2539bec6ee0d9ddaf427d7a785eb76d9a855e
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
Reply-To: Bug 1868221 <1868221@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/440


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #440
   https://gitlab.com/qemu-project/qemu/-/issues/440

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1868221

Title:
  /usr/share/applications/qemu.desktop should have an "Exec=3D" key.

Status in QEMU:
  Expired

Bug description:
  According to the www.freedesktop.org .desktop-file specification, all
  "Application" desktop files should have an "Exec=3D" key. The one in
  qemu doesn't.

  This can be easily verified by running kbuildsycoca4 if KDE4 is
  present, but the issue is not DE-dependent.

  Which binary exactly should be assigned as the default one, I don't
  know.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1868221/+subscriptions

