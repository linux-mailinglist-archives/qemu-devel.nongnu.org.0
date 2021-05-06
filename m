Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F086837503D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:37:17 +0200 (CEST)
Received: from localhost ([::1]:48238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYZR-0007Py-16
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYXu-0006Kc-Gs
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:35:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:57182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYXs-0004dl-3k
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:35:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leYXq-0002dC-Nj
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:35:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A7DB62E8135
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 07:35:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 07:24:23 -0000
From: Thomas Huth <1873032@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mikegav post-factum stefanha th-huth
X-Launchpad-Bug-Reporter: Mikhail Gavrilov (mikegav)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158696794416.12296.17436515324844466583.malonedeb@soybean.canonical.com>
Message-Id: <162028586352.3420.2046252283797152181.malone@gac.canonical.com>
Subject: [Bug 1873032] Re: After upgrade qemu to 5.0.0-0.3.rc2.fc33 the
 virtual machine with Windows 10 after a while starts to work very slowly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 7203a48d02a791dc48d488ad98988e479b0566e5
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
Reply-To: Bug 1873032 <1873032@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patches mentioned in the previous comments have been released with
QEMU v5.1, so I'm marking this bug as fixed now. If you still have
problems, please open a new ticket.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873032

Title:
  After upgrade qemu to 5.0.0-0.3.rc2.fc33 the virtual machine with
  Windows 10 after a while starts to work very slowly

Status in QEMU:
  Fix Released

Bug description:
  Description of problem:

  After upgrade qemu to 5.0.0-0.3.rc2.fc33 the virtual machine with
  Windows 10 after a while starts to work very slowly

  I created the virtual machine with Windows 10 with the following config:
  - 1 CPU
  - 2GB RAM
  - With network access

  I launch there a web browser there with flash content. =

  And usually, the system (Windows 10) does not work there for more than an=
 hour.
  When the system starts to work very slowly it doesn't respond to "Reboot"=
 and "Shut Down" commands. Only works "Force Reset" and "Force Off". But wh=
en I reboot the system with "Force Reset" it usually stuck at boot at the W=
indows splash screen. https://imgur.com/yGyacDG

  The last version of qemu which not contain this issue is
  5.0.0-0.2.rc0.fc33

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873032/+subscriptions

