Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB106AAE7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 16:51:24 +0200 (CEST)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnOna-0002uo-Vj
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 10:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48810)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hnOnG-0002A1-8u
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hnOnB-0007ef-Pb
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:50:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:52464)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hnOn9-0007bS-7b
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:50:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hnOn5-00032O-ET
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 14:50:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3AF2B2E80DA
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 14:50:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jul 2019 14:36:30 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: question
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mintriago pmaydell
X-Launchpad-Bug-Reporter: Matthew Intriago (mintriago)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <156259768655.23216.11898576300198780398.malonedeb@chaenomeles.canonical.com>
Message-Id: <156328779203.15306.15682486189322743394.launchpad@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: e781a087d2ec5710dd021dda8fb3b8e681eeb03c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1835793] Re: Running an edk2 based bios
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
Reply-To: Bug 1835793 <1835793@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Invalid

** Tags added: question

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835793

Title:
  Running an edk2 based bios

Status in QEMU:
  Invalid

Bug description:
  This is not necessarily a bug, however I wasn't sure were to get help.

  I am currently working on using QEMU  to run a BIOS my company has
  developed. In order to see if the software was working correctly, I
  was able to successfully run the edk2 bios using the following
  command:

  qemu-system-x86_64.exe -bios
  "C:\Users\matthew.intriago\Desktop\ovmf.fd" -net none

  However, when running the same command using  our personalized bios,
  QEMU launches stating that =E2=80=9Cguest has not initialized display=E2=
=80=9D.
  Theoretically, QEMU should be able to run the bios since it is edk2
  based, the only difference between the two is that our bios has more
  features.

  If anyone has any insight on what the issue might be I would greatly
  appreciate any help.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1835793/+subscriptions

