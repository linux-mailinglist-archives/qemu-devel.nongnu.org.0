Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F412058C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 13:26:43 +0100 (CET)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igpSU-0007hu-LR
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 07:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1igpRY-0006qI-7a
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:25:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1igpRW-0001QJ-RS
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:25:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:43550)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1igpRW-0001P8-LX
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:25:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1igpRV-0003WH-4l
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 12:25:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 211AC2E80C0
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 12:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Dec 2019 12:20:21 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1844817@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: trace
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <156899449679.4991.3377250373042418918.malonedeb@chaenomeles.canonical.com>
Message-Id: <157649882191.18558.3184836534200429447.malone@wampee.canonical.com>
Subject: [Bug 1844817] Re: trace: dynamic width format syntax not validated
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f8bb398e0becfd0533841b6cfb176ac284b39e17
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
Reply-To: Bug 1844817 <1844817@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed in v4.2.0 (commits abc7cf3655 & 10f9f1fbed).

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1844817

Title:
  trace: dynamic width format syntax not validated

Status in QEMU:
  Fix Released

Bug description:
  The dtrace via stap backend cannot support the dynamic '*' width
  format.

  Eric noted in https://lists.gnu.org/archive/html/qemu-
  devel/2019-09/msg04720.html:

    https://sourceware.org/systemtap/langref.pdf

    section 9.2 printf, states:

    "The printf formatting directives are similar to those of C, except that
    they are fully checked for type by the translator."

    and does NOT list handling for '*' under precision or width.

  Some trace events have been merged without checking this:

  $ git ls-files|fgrep trace-event|xargs git grep '*\("\|x\)'
  hw/block/trace-events:11:pflash_io_read(uint64_t offset, int width, int f=
mt_width, uint32_t value, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64=
" width:%d value:0x%0*x cmd:0x%02x wcycle:%u"
  hw/block/trace-events:12:pflash_io_write(uint64_t offset, int width, int =
fmt_width, uint32_t value, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d v=
alue:0x%0*x wcycle:%u"
  hw/block/trace-events:13:pflash_data_read(uint64_t offset, int width, uin=
t32_t value) "data offset:0x%04"PRIx64" value:0x%0*x"
  hw/block/trace-events:14:pflash_data_write(uint64_t offset, int width, ui=
nt32_t value, uint64_t counter) "data offset:0x%04"PRIx64" value:0x%0*x cou=
nter:0x%016"PRIx64
  hw/mips/trace-events:2:gt64120_read(const char *regname, int width, uint6=
4_t value) "gt64120 read %s value:0x%0*" PRIx64
  hw/mips/trace-events:3:gt64120_write(const char *regname, int width, uint=
64_t value) "gt64120 write %s value:0x%0*" PRIx64

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1844817/+subscriptions

