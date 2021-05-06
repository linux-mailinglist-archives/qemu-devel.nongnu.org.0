Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC59537517E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:26:38 +0200 (CEST)
Received: from localhost ([::1]:34728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaHF-0003Id-VW
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZyd-0002f5-Lt
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:07:25 -0400
Received: from indium.canonical.com ([91.189.90.7]:58868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZyZ-0003C8-BC
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:07:23 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leZyT-0001Iw-P3
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:07:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 261982E81DD
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 09:07:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 08:58:40 -0000
From: Thomas Huth <1857226@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: exploide th-huth
X-Launchpad-Bug-Reporter: Jannik (exploide)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157700964058.28040.6250427039167117245.malonedeb@chaenomeles.canonical.com>
Message-Id: <162029152014.32131.17049520381321953784.malone@chaenomeles.canonical.com>
Subject: [Bug 1857226] Re: 'set_link net0 off' not working with e1000e driver
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 42a4cbc9bdda4149d077a61c3fd9f6c4e2f416ca
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
Reply-To: Bug 1857226 <1857226@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/190


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #190
   https://gitlab.com/qemu-project/qemu/-/issues/190

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1857226

Title:
  'set_link net0 off' not working with e1000e driver

Status in QEMU:
  Expired

Bug description:
  I'm encountering a bug with the e1000e network driver, that appears to
  got previously reported at rhbz. Steps to reproduce are provided in
  detail there:

  https://bugzilla.redhat.com/show_bug.cgi?id=3D1707646

  It is about switching off network link state (set_link net0 off)
  having no effect when using the e1000e driver.

  Version details:
  QEMU emulator version 4.1.1 (qemu-4.1.1-1.fc31)
  Fedora 31

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1857226/+subscriptions

