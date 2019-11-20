Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321151034A6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 07:57:27 +0100 (CET)
Received: from localhost ([::1]:54042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXJvZ-0004FX-Tg
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 01:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iXJtr-0003Ib-VB
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 01:55:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iXJtq-0007TK-Ru
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 01:55:39 -0500
Received: from indium.canonical.com ([91.189.90.7]:57296)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iXJtq-0007SK-M3
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 01:55:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iXJtp-0007E0-9s
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 06:55:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 494672E80C3
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 06:55:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 Nov 2019 06:46:54 -0000
From: Thomas Huth <1853083@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth wzis
X-Launchpad-Bug-Reporter: wzis (wzis)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157413352600.6824.7282626865462030571.malonedeb@gac.canonical.com>
Message-Id: <157423241431.22400.12571488631413867685.malone@chaenomeles.canonical.com>
Subject: [Bug 1853083] Re: qemu ppc64 4.0 boot AIX5.1 hung
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 46eafc8cdd0a323dbf114bc9258a2666ba53701d
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

AIX 5.1 is quite a bit older than POWER8, so I don't think that it will
run with this processor anymore. You could try "power5" or "970fx" as
CPU (maybe even the "40p" machine instead of "pseries"), but I guess it
won't make a big difference - the QEMU pseries machine has been written
for later operating systems in mind, there was never a big effort to get
older operating systems running with it.

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

