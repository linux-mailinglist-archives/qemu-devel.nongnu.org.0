Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D196C370D67
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:27:10 +0200 (CEST)
Received: from localhost ([::1]:39466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldD3t-0005jm-E3
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldD2W-0005JC-Lf
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:25:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:55654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldD2U-0001zL-IO
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:25:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldD2S-00028s-1Z
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 14:25:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 04BE22E8157
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 14:25:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 14:19:21 -0000
From: John Arbuckle <1785485@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: programmingkidx th-huth
X-Launchpad-Bug-Reporter: John Arbuckle (programmingkidx)
X-Launchpad-Bug-Modifier: John Arbuckle (programmingkidx)
References: <153348122541.17257.2126697988098618689.malonedeb@soybean.canonical.com>
Message-Id: <161996516147.13763.18280235573748391813.malone@wampee.canonical.com>
Subject: [Bug 1785485] Re: Mouse moves erratically when using scroll wheel on
 Windows NT 4, Windows 95, and Windows 3.1 guests
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 5fb7bc4ba5ae661d6e559cd492d716992039aff0
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
Reply-To: Bug 1785485 <1785485@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After doing tests with Windows 95, 3,1, NT 4.0, and 2000 I can say this
bug appears to be fixed.

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1785485

Title:
  Mouse moves erratically when using scroll wheel on Windows NT 4,
  Windows 95, and Windows 3.1 guests

Status in QEMU:
  Fix Released

Bug description:
  QEMU version: 3.0.0 RC3
  Guests: Windows NT 4.0, Windows 95, Windows 3.1

  Program: When the user uses the scroll wheel, the mouse's movement
  becomes erratic.

  This is noticed immediately when the scroll wheel is used. Sometimes
  the problem can be fixed by moving the scroll wheel some more.

  My theory is this problem is because of the lack of support for the
  Microsoft Intellimouse in these guest operating systems.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1785485/+subscriptions

