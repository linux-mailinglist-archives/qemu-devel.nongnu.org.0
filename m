Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600FB3C5FCE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:52:59 +0200 (CEST)
Received: from localhost ([::1]:35850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2yEs-0000pn-9p
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2yCu-0007Ir-1Z
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:50:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:37908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2yCr-0000pB-M6
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:50:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2yCn-0007Ky-FI
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 15:50:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E3F412E8187
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 15:50:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2021 15:45:12 -0000
From: Thomas Huth <1859106@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: graphics x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chungy elvstone janitor philmd th-huth
X-Launchpad-Bug-Reporter: Mike Swanson (chungy)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157861943690.5587.1150668522953222724.malonedeb@gac.canonical.com>
Message-Id: <162610471275.12022.9192615722556642794.malone@wampee.canonical.com>
Subject: [Bug 1859106] Re: 4.2 regression: ReactOS crashes on boot
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 4ee854964cdda11d336c1147f7099b5a2d400d12
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
Reply-To: Bug 1859106 <1859106@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/475


** Tags added: graphics x86

** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #475
   https://gitlab.com/qemu-project/qemu/-/issues/475

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859106

Title:
  4.2 regression: ReactOS crashes on boot

Status in QEMU:
  Expired

Bug description:
  In QEMU 4.1.x and earlier, ReactOS can successfully boot, but starting
  with 4.2, it fails, instead coming up with an error "The video driver
  failed to initialize."

  This happens regardless of VM configuration (even -M pc-i440fx-4.1)
  and it works well with older versions of QEMU. bisecting QEMU to find
  the first bad commit reveals 0221d73ce6a8e075adaa0a35a6ef853d2652b855
  as the culprit, which is updating the seabios version; perhaps this
  bug belongs there, but I don't know the appropriate avenue (it seems
  seabios is a subproject of QEMU anyway?).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859106/+subscriptions

