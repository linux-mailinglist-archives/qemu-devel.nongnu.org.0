Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2933B2CF944
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 05:12:20 +0100 (CET)
Received: from localhost ([::1]:52012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klOvi-0002tj-NI
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 23:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1klOuK-0002SQ-Gd
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 23:10:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:44916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1klOuG-0003r0-SV
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 23:10:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1klOuE-0003xF-VI
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 04:10:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EA7172E8085
 for <qemu-devel@nongnu.org>; Sat,  5 Dec 2020 04:10:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Dec 2020 04:01:15 -0000
From: yapkv <1906905@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: yapkv
X-Launchpad-Bug-Reporter: yapkv (yapkv)
X-Launchpad-Bug-Modifier: yapkv (yapkv)
Message-Id: <160714087524.10652.4920404623701840898.malonedeb@soybean.canonical.com>
Subject: [Bug 1906905] [NEW] qemu-system-sparc stucked while booting using
 ss20_v2.25_rom 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="15cd58601e77a273f7390fc4f4fcd16efe814a43"; Instance="production"
X-Launchpad-Hash: 6ba361a49e912b9676e00db59be9525db4600698
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
Reply-To: Bug 1906905 <1906905@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I cannot boot up OBP using the current (5.1) version of qemu with
ss20_v2.25_rom. It just stuck at "Power-ON reset" and hanged.  However
using the previous version from 2015 I can successfully both up the OBP.

qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25.rom -nographic

Power-ON Reset

(*hang)

regards
Yap KV

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906905

Title:
  qemu-system-sparc stucked while booting using ss20_v2.25_rom

Status in QEMU:
  New

Bug description:
  I cannot boot up OBP using the current (5.1) version of qemu with
  ss20_v2.25_rom. It just stuck at "Power-ON reset" and hanged.  However
  using the previous version from 2015 I can successfully both up the
  OBP.

  qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25.rom -nographic

  Power-ON Reset

  (*hang)

  regards
  Yap KV

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906905/+subscriptions

