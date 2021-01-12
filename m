Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E672F271A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:33:31 +0100 (CET)
Received: from localhost ([::1]:43126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBN4-00005r-NR
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFy-0008LK-1r
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:26:10 -0500
Received: from indium.canonical.com ([91.189.90.7]:52500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFt-0000uC-Ot
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:26:09 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFh-0004Tz-44
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 169FF2E8139
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:29 -0000
From: Launchpad Bug Tracker <1779649@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bastien.orivel janitor th-huth
X-Launchpad-Bug-Reporter: Bastien Orivel (bastien.orivel)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153052850673.18330.5658352940583128817.malonedeb@chaenomeles.canonical.com>
Message-Id: <161042504925.10246.11163473104802546384.malone@loganberry.canonical.com>
Subject: [Bug 1779649] Re: Suspending a domain works with a 3.16 gues kernel
 but not with a 4.16 one
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: 66361260ab3a5869430d710ccb16467fae2da65f
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
Reply-To: Bug 1779649 <1779649@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1779649

Title:
  Suspending a domain works with a 3.16 gues kernel but not with a 4.16
  one

Status in QEMU:
  Expired

Bug description:
  Suspending a domain with `systemctl suspend` works with a guest 3.16 kern=
el (jessie), the domain goes into `pmsuspend` in libvirt but doesn't work a=
nymore with a 4.16 one (sid) where:
   - With a QXL card: the spice display just goes black and the domain stay=
s `running` in libvirt but is "dead"
   - With a VGA card: the screen goes black and comes back immediately, the=
 domain stays fine

  Qemu: Master, 281bd281222776229d5dbf84d1a5c6d8d9d2a34b

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1779649/+subscriptions

