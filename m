Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D88B3C4309
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 06:28:18 +0200 (CEST)
Received: from localhost ([::1]:59834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2nYH-0001pB-3q
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 00:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWQ-0007X6-2n
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:22 -0400
Received: from indium.canonical.com ([91.189.90.7]:38220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWM-0006G8-Ma
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:21 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2nWF-0005KZ-CN
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 186402E819C
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2021 04:17:54 -0000
From: Launchpad Bug Tracker <1914667@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor programmingkidx th-huth
X-Launchpad-Bug-Reporter: John Arbuckle (programmingkidx)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161248158218.12871.10682279346002918371.malonedeb@soybean.canonical.com>
Message-Id: <162606347426.2726.7919712289581748356.malone@loganberry.canonical.com>
Subject: [Bug 1914667] Re: High cpu usage when guest is idle on
 qemu-system-i386
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 36b4d8d2fc2408dba98fabca558db57d8db0d2d7
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
Reply-To: Bug 1914667 <1914667@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914667

Title:
  High cpu usage when guest is idle on qemu-system-i386

Status in QEMU:
  Expired

Bug description:
  When running Windows XP in qemu-system-i386, the cpu usage of QEMU is
  about 100% even when the guest CPU usage is close to 2%. The host cpu
  usage should be low when the guest cpu usage is low.

  Command: qemu-system-i386 -hda <Windows XP HD image>

  Using this command also shows around 100% host CPU usage:
  qemu-system-i386 -m 700 -hda <Windows XP HD image> -usb -device usb-audio=
 -net nic,model=3Drtl8139 -net user -hdb mountable.img -soundhw pcspk

  Using the Penryn CPU option also saw this problem:
  qemu-system-i386 -hda <Windows XP HD image> -m 700 -cpu Penryn-v1

  Using "-cpu pentium2" saw the same high host cpu usage.

  =

  My Info:
  M1 MacBook Air
  Mac OS 11.1
  qemu-system-i386 version 5.2 (1ba089f2255bfdb071be3ce6ac6c3069e8012179)
  Windows XP SP3 Build 2600

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914667/+subscriptions

