Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE5EB7745
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 12:23:07 +0200 (CEST)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAtac-000392-I1
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 06:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51052)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iAtTV-00062z-EA
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:15:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iAtTT-0004gm-HS
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:15:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:46720)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iAtTS-0004g5-VN
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:15:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iAtTR-0002Jm-Eq
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 10:15:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4C7682E80D3
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 10:15:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Sep 2019 10:06:54 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: patrickvl pmaydell
X-Launchpad-Bug-Reporter: Patrick van Logchem (patrickvl)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156888568548.4915.345807497840369560.malonedeb@chaenomeles.canonical.com>
Message-Id: <156888761506.4877.11494281799690018117.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: ffd7fa5c78c08eb1b431f538ae5bce626f81fe33
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1844644] Re: Compiler warnings using MSVC
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
Reply-To: Bug 1844644 <1844644@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; MSVC is not a supported compiler for QEMU. We expect it to be built
with either gcc or llvm.


** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1844644

Title:
  Compiler warnings using MSVC

Status in QEMU:
  Invalid

Bug description:
  The following line of code results in an implicit truncation of an uint16=
_t value to an uint8_t variable, which triggers a compiler warning in MSVC =
: https://github.com/qemu/qemu/blob/f8c3db33a5e863291182f8862ddf81618a7c619=
4/hw/usb/dev-hub.c#L387
  (Two lines down, the same thing happens.)

  This warning can be silenced by doing an explicit truncation, for
  example by a casting the value explicitly to uint8_t type, or by
  anding the value with 0xFF.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1844644/+subscriptions

