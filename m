Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D663A102150
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 10:56:43 +0100 (CET)
Received: from localhost ([::1]:43350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX0FW-00084Y-MN
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 04:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34775)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iX0Ed-0007OR-Bo
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 04:55:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iX0EZ-00007j-Pv
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 04:55:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:58748)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iX0EZ-00007T-KJ
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 04:55:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iX0EY-0007I8-4q
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 09:55:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 15CC42E80C8
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 09:55:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Nov 2019 09:41:17 -0000
From: wzis <wzis@hotmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth wzis
X-Launchpad-Bug-Reporter: wzis (wzis)
X-Launchpad-Bug-Modifier: wzis (wzis)
References: <157413352600.6824.7282626865462030571.malonedeb@gac.canonical.com>
Message-Id: <157415647710.22364.18289540129864084510.malone@chaenomeles.canonical.com>
Subject: [Bug 1853083] Re: qemu ppc64 4.0 boot AIX5.1 hung
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 19f68624bf0046ca912732930f94eb2b409d77d5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1853083 <1853083@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

What I don't understand is ppc64 for IBM machine emulation, but qemu
ppc64 can't support AIX most of the time, but can support Linux on power
very well.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1853083

Title:
  qemu ppc64 4.0 boot AIX5.1 hung

Status in QEMU:
  Incomplete

Bug description:
  When boot AIX5.1 from cdrom device, qemu hung there, no further info
  is displayed and cpu consumption is high.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1853083/+subscriptions

