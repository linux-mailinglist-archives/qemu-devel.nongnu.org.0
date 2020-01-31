Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB3014F141
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 18:26:50 +0100 (CET)
Received: from localhost ([::1]:56928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixa49-0002k0-Bw
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 12:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ixa39-0002GQ-4Z
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:25:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ixa38-0005yq-3x
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:25:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:40072)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ixa37-0005xS-Ui
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:25:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ixa36-0004Sl-Gl
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 17:25:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 75D5F2E80C9
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 17:25:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jan 2020 17:17:18 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided;
 assignee=alex.bennee@linaro.org; 
X-Launchpad-Bug-Tags: plugin tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee mhodog
X-Launchpad-Bug-Reporter: Robert Henry (mhodog)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <157973034496.4473.7342941286220324914.malonedeb@soybean.canonical.com>
Message-Id: <158049103885.8324.4901881910919671140.malone@chaenomeles.canonical.com>
Subject: [Bug 1860610] Re: cap_disas_plugin leaks memory
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: eb2b32f792a365a75ec702960de3310a8b9f23bd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1860610 <1860610@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It looks like this will fail on all the other capstone cases as well. Is
this an API change across versions?

** Tags added: plugin tcg

** Changed in: qemu
     Assignee: (unassigned) =3D> Alex Benn=C3=A9e (ajbennee)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860610

Title:
  cap_disas_plugin leaks memory

Status in QEMU:
  New

Bug description:
  Looking at origin/master head, the function cap_disas_plugin leaks
  memory.

  per capstone's examples using their ABI, cs_free(insn, count); needs
  to called just before cs_close.

  I discovered this running qemu under valgrind.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860610/+subscriptions

