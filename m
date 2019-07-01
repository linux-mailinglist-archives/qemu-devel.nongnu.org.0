Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF6812AD1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 11:42:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMUi9-0004ZT-3R
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 05:42:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hMUgo-00045D-Ot
	for qemu-devel@nongnu.org; Fri, 03 May 2019 05:41:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hMUgn-00060O-Qp
	for qemu-devel@nongnu.org; Fri, 03 May 2019 05:41:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:47558)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hMUgn-0005zw-Ld
	for qemu-devel@nongnu.org; Fri, 03 May 2019 05:41:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hMUgl-0002SE-8c
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 09:41:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 404172E80D0
	for <qemu-devel@nongnu.org>; Fri,  3 May 2019 09:41:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 May 2019 09:32:39 -0000
From: "Laszlo Ersek \(Red Hat\)" <lersek@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
	assignee=lersek@redhat.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: imammedo lersek
X-Launchpad-Bug-Reporter: Igor (imammedo)
X-Launchpad-Bug-Modifier: Laszlo Ersek (Red Hat) (lersek)
References: <155368089372.19244.12131435230778764037.malonedeb@chaenomeles.canonical.com>
Message-Id: <155687595930.32028.16710785024156013698.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18953";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 549f70f87150a1c2d8c5783c24b7b64c07b18ccc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1821884] Re: Extend uefi-test-tools to report
 SMBIOS location
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1821884 <1821884@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Posted
[PULL 0/2] tests/uefi-test-tools: report the SMBIOS entry point structures
http://mid.mail-archive.com/20190503093118.15700-1-lersek@redhat.com

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1821884

Title:
  Extend uefi-test-tools to report SMBIOS location

Status in QEMU:
  In Progress

Bug description:
  UEFI helper app exposes the pointer to RSDP ACPI table that firmware allo=
cates in guest's RAM
  but it doesn't do so for SMBIOS tables. Hence bios table test would skip =
testing SMBIOS tables
  to workaround shortcoming. This bug is a request to expose two new entry =
point fields (one for SMBIOS 2 and another for SMBIOS 3) so test could chec=
k SMBIOS tables when guest is started a with  UEFI firmware.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1821884/+subscriptions

