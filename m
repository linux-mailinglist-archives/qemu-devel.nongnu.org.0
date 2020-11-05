Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616CE2A7C98
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 12:07:03 +0100 (CET)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kad6c-0001To-Fo
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 06:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kad5Z-00013h-TL
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 06:05:57 -0500
Received: from indium.canonical.com ([91.189.90.7]:40236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kad5X-0000Bd-Qg
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 06:05:57 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kad5U-0007Yj-Qe
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 11:05:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C61D82E80AB
 for <qemu-devel@nongnu.org>; Thu,  5 Nov 2020 11:05:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2020 10:55:22 -0000
From: Peter Maydell <741115@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: arm debug gdb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anton-kochkov pmaydell
X-Launchpad-Bug-Reporter: Anton Kochkov (anton-kochkov)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20110323164949.17887.98157.malonedeb@soybean.canonical.com>
Message-Id: <160457372326.17771.7365236000147075378.launchpad@soybean.canonical.com>
Subject: [Bug 741115] Re: Add support of coprocessor cp15,
 cp14 registers exposion in the embedded gdb server
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 26a327a77bca22859c8f1f627f02e430d0ae5287
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 04:11:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
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
Reply-To: Bug 741115 <741115@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/741115

Title:
  Add support of coprocessor cp15, cp14 registers exposion in the
  embedded gdb server

Status in QEMU:
  Fix Released

Bug description:
  Please add support of exposion of ARM coprocesor registers/logic at the e=
mbedded gdb server,
   for example of cp15, cp14, etc registers.

  Related project http://jtagarmgdbsrvr.sourceforge.net/index.html

  Also filled bug in the GDB
  http://sourceware.org/bugzilla/show_bug.cgi?id=3D12602

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/741115/+subscriptions

