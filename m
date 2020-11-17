Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E936A2B5C5D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:57:48 +0100 (CET)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexkB-0002C9-VJ
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kexiB-0000sb-B5
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:55:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:52472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kexi6-0002iW-DB
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:55:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kexi3-0006VU-OR
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:55:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B57162E80E8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:55:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2020 09:40:53 -0000
From: Thomas Huth <1022023@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pluto-pld-linux th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Pawe=C5=82_Sikora_=28pluto-pld-linux=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20120707081203.6181.33768.malonedeb@gac.canonical.com>
Message-Id: <160560605355.14393.11916227400246435518.malone@soybean.canonical.com>
Subject: [Bug 1022023] Re: vga/std lacks few wide screen modes.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 99a81168c18e999b62dbf6ee102dcac08e46bb5c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 04:35:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1022023 <1022023@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are more requests in other bug tickets:

- 1366x768 (from https://bugs.launchpad.net/qemu/+bug/1054558)

- 1080 wide x 1920 high (from
https://bugs.launchpad.net/qemu/+bug/1665789)

... so these should be considered, too, I think.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1022023

Title:
  vga/std lacks few wide screen modes.

Status in QEMU:
  New

Bug description:
  hi,
  i have noticed that qemu-1.0.1 doesn't support few widescreen modes on -v=
ga std, e.g. 1680x1050, 1600x1000, 1440x900.
  i have a few laptops with kvm and i would like to work with qemu windows =
guest native full wide screen mode.
  could you please add these modes?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1022023/+subscriptions

