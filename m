Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7721206E2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 14:18:16 +0100 (CET)
Received: from localhost ([::1]:53613 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igqGN-0007Xy-D1
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 08:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1igqDt-000666-QY
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:15:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1igqDs-0003oh-Dz
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:15:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:49100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1igqDs-0003lb-7m
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:15:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1igqDq-0007dP-Eq
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 13:15:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6D11B2E80C0
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 13:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Dec 2019 13:03:55 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1856549@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dcb314 philmd
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <157649490094.7480.17075229014510714852.malonedeb@soybean.canonical.com>
 <157649752475.4226.12810383033052233683.malone@chaenomeles.canonical.com>
Message-Id: <47476c59-c7a1-b65e-bb20-79dad784cdde@redhat.com>
Subject: Re: [Bug 1856549] Re: qemu-4.2.0/hw/misc/mac_via.c: 2 * bad test ?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6f249a26f52057315fc22640b81018f36d7d5094
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
Reply-To: Bug 1856549 <1856549@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/19 12:58 PM, dcb wrote:
> gcc compiler flag -Wduplicated-cond will catch this kind of problem.

Interesting, thanks for sharing!

> =

> You might want to switch it on in your builds. It has been available for
> over a year.
>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856549

Title:
  qemu-4.2.0/hw/misc/mac_via.c: 2 * bad test ?

Status in QEMU:
  New

Bug description:
  1.

  qemu-4.2.0/hw/misc/mac_via.c:417:27: style: Expression is always false
  because 'else if' condition matches previous condition at line 412.
  [multiCondition]

                  } else if ((m->data_out & 0xf3) =3D=3D 0xa1) {
  ...
                  } else if ((m->data_out & 0xf3) =3D=3D 0xa1) {

  2.

  qemu-4.2.0/hw/misc/mac_via.c:467:27: style: Expression is always false
  because 'else if' condition matches previous condition at line 463.
  [multiCondition]

  Duplicate.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856549/+subscriptions

