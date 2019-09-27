Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666B4C0C5D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 22:07:10 +0200 (CEST)
Received: from localhost ([::1]:57184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDwWD-0004OX-DQ
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 16:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50053)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iDwUl-0003Zo-Uo
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 16:05:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iDwUk-0002Ba-Hk
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 16:05:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:60468)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iDwUk-0002BQ-CM
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 16:05:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iDwUi-0008Dn-Ao
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 20:05:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 40F752E80C7
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 20:05:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Sep 2019 19:56:29 -0000
From: Thomas Huth <1845580@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell shift838 th-huth
X-Launchpad-Bug-Reporter: Chris Schneider (shift838)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156954986411.15692.14551657231977154875.malonedeb@gac.canonical.com>
Message-Id: <156961418950.6178.3071058106837614086.malone@chaenomeles.canonical.com>
Subject: [Bug 1845580] Re: issue with QEMU on Raspberry Pi failing to access
 CDROM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19056";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: fe2edb647f6894b3989705e6804a66ba962d7215
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
Reply-To: Bug 1845580 <1845580@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Which version of QEMU are you using? If it's anything older than 4.1,
please update to 4.1. There was a bug in QEMU somewhen between 2.12 and
4.0 which looks like the one you reported.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1845580

Title:
  issue with QEMU on Raspberry Pi failing to access CDROM

Status in QEMU:
  New

Bug description:
  I am trying to access the CDROM (iso) from QEMU using FreeDOS and I
  get an error when doing a directory for:

  i can boot from the iso but if i exit to access the files from the
  CDROM ISO i get the attached error.

  I believe there is an issue with the QEMU for the Raspberry Pi.

  I am using a Raspberry Pi3 with the latest full Raspbian Buster load

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1845580/+subscriptions

