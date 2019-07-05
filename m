Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFA76085A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 16:51:42 +0200 (CEST)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjPYp-0001PI-UA
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 10:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hjPXo-0000y1-Lo
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 10:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hjPXn-0001VB-J5
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 10:50:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:55436)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hjPXn-0001Jn-Cs
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 10:50:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hjPXk-0001IG-Tp
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 14:50:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DFA832E80C9
 for <qemu-devel@nongnu.org>; Fri,  5 Jul 2019 14:50:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jul 2019 14:42:01 -0000
From: Moshe Immerman <1835477@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: moshloop
X-Launchpad-Bug-Reporter: Moshe Immerman (moshloop)
X-Launchpad-Bug-Modifier: Moshe Immerman (moshloop)
References: <156230276883.25246.16130789765520855631.malonedeb@soybean.canonical.com>
Message-Id: <156233772141.22911.17573135422599416222.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: aa5324219dd86c4a9c7e846ee49fbf204cd6dc2b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1835477] Re: Converting qcow2 to vmdk on MacOSX
 results in a non-bootable image
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
Reply-To: Bug 1835477 <1835477@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Try the solutions in 1828508 ( -o
adapter_type=3Dlsilogic,subformat=3DmonolithicFlat)  1776920 ( -S 0 ) do not
work either

What other steps can I take to troubleshoot?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835477

Title:
  Converting qcow2 to vmdk on MacOSX results in a non-bootable image

Status in QEMU:
  New

Bug description:
  When using qemu-img convert -O vmdk  with version 3.1.0 or 4.0.0 on
  OSX (10.14.3) with a qcow2 image  (https://cloud-
  images.ubuntu.com/bionic/20190703/bionic-server-cloudimg-amd64.img),
  the resulting image is not bootable.

  Running the same command on Ubuntu 18.04 results in a bootable image
  as expected

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1835477/+subscriptions

