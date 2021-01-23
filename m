Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98EA30130D
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 05:27:44 +0100 (CET)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3AWV-0003yW-7y
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 23:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3AUt-000391-FS
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:26:06 -0500
Received: from indium.canonical.com ([91.189.90.7]:42536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3AUq-0000AF-US
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:26:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l3AUm-0007mm-Uc
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 04:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 98CD62E8149
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 04:25:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 Jan 2021 04:18:31 -0000
From: Launchpad Bug Tracker <1800156@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor nightshades th-huth
X-Launchpad-Bug-Reporter: Valentin Fort (nightshades)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154056168206.13498.14454826046231558494.malonedeb@chaenomeles.canonical.com>
Message-Id: <161137551146.11899.5183490372538257409.malone@loganberry.canonical.com>
Subject: [Bug 1800156] Re: windows 8.1 loose grab/leave window on windowed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: b872f6c028f1248fe0e2c945e99a257afec79308
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
Reply-To: Bug 1800156 <1800156@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1800156

Title:
  windows 8.1 loose grab/leave window on windowed

Status in QEMU:
  Expired

Bug description:
  Hello, i am new to QEMU and i encounter that annoying issue (windowed)
  when i move the mouse a bit too much then it leave the window.

  Windows 8.1, Latest QEMU (Windows binaries).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1800156/+subscriptions

