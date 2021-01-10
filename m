Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9DB2F0525
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:37:45 +0100 (CET)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySU4-0007mU-S6
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySN2-0005mq-21
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:30:28 -0500
Received: from indium.canonical.com ([91.189.90.7]:41142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySMv-0002Yv-Us
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:30:27 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySMt-0000z5-VD
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:30:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EB3282E8135
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:30:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:25 -0000
From: Launchpad Bug Tracker <1604303@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth z-j
X-Launchpad-Bug-Reporter: Jan Vlug (z-j)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160719090202.9299.92930.malonedeb@soybean.canonical.com>
Message-Id: <161025224564.18863.12203391908481637894.malone@loganberry.canonical.com>
Subject: [Bug 1604303] Re: Solaris on KVM/QEMU: WARNING rtls0: Failure
 resetting PHY
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: dd6d884c31bb7d6c7d78591cc4e333bc5408fc9e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1604303 <1604303@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1604303

Title:
  Solaris on KVM/QEMU: WARNING rtls0: Failure resetting PHY

Status in QEMU:
  Expired

Bug description:
  When running Solaris (both version 10 and 11) on a QEMU/KVM virtual host,=
 the Solaris guest displays this warning just after starting the system:
  WARNING rtls0: Failure resetting PHY.

  Although the networking seems to work fine.

  I have this network device model selected for the Solaris guest:
  rtl8139

  See also:
  http://www.linux-kvm.org/page/Guest_Support_Status#UNIX_Family:_Solaris.2=
FOpenSolaris

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1604303/+subscriptions

