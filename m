Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C5E10FAA4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 10:20:00 +0100 (CET)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic4Lf-0006pM-Bn
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 04:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34287)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ic4HZ-0004Sl-75
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 04:15:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ic4HW-0008SF-UM
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 04:15:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:48964)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ic4HU-0008OR-Vp
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 04:15:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ic4HT-0005Sq-7d
 for <qemu-devel@nongnu.org>; Tue, 03 Dec 2019 09:15:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2F8E82E8073
 for <qemu-devel@nongnu.org>; Tue,  3 Dec 2019 09:15:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Dec 2019 09:08:34 -0000
From: Mark Zealey <1854910@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mark.zealey
X-Launchpad-Bug-Reporter: Mark Zealey (mark.zealey)
X-Launchpad-Bug-Modifier: Mark Zealey (mark.zealey)
Message-Id: <157536411466.21582.6322448957009703198.malonedeb@soybean.canonical.com>
Subject: [Bug 1854910] [NEW] Support VHDX differencing images (ie images with
 backing)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: b7d7f179d8d4236d4208e55a6fecfa57fef6815e
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
Reply-To: Bug 1854910 <1854910@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

The qemu vhdx driver does not support type 2 (differencing) vhdx images
(usually stored with file extension .avhdx). This means that any hyperv
images with snapshots are not supported by qemu-img. It would be great
to be able to convert to a new qcow image from a backing + set of
differencing images from hyperv, and/or convert an individual
differencing vhdx image to a qcow2 image with a backing file specified.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1854910

Title:
  Support VHDX differencing images (ie images with backing)

Status in QEMU:
  New

Bug description:
  The qemu vhdx driver does not support type 2 (differencing) vhdx
  images (usually stored with file extension .avhdx). This means that
  any hyperv images with snapshots are not supported by qemu-img. It
  would be great to be able to convert to a new qcow image from a
  backing + set of differencing images from hyperv, and/or convert an
  individual differencing vhdx image to a qcow2 image with a backing
  file specified.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1854910/+subscriptions

