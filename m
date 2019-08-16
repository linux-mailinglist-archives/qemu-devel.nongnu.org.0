Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC7C8FA1C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 06:58:55 +0200 (CEST)
Received: from localhost ([::1]:49252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyUKE-00026F-T7
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 00:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hyUH8-0006nn-L7
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 00:55:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hyUH7-0006wf-Fx
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 00:55:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:51058)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hyUH7-0006vn-9e
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 00:55:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hyUH6-0002cJ-4J
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 04:55:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1F25D2E80C8
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 04:55:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Aug 2019 04:48:47 -0000
From: Thomas Huth <1821884@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=lersek@redhat.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: imammedo lersek
X-Launchpad-Bug-Reporter: Igor (imammedo)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155368089372.19244.12131435230778764037.malonedeb@chaenomeles.canonical.com>
Message-Id: <156593092946.26669.12299350990831669557.launchpad@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 4cf8c5d0d9a23d6959897786a2436ca043773dcf
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1821884] Re: Extend uefi-test-tools to report
 SMBIOS location
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
Reply-To: Bug 1821884 <1821884@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1821884

Title:
  Extend uefi-test-tools to report SMBIOS location

Status in QEMU:
  Fix Released

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

