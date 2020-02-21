Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E31167DBE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 13:51:44 +0100 (CET)
Received: from localhost ([::1]:56422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j57mR-0008OG-5T
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 07:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j57lj-0007w7-51
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 07:51:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j57li-0003TU-0C
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 07:50:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:60492)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j57lh-0003Sl-QW
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 07:50:57 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j57lf-0004Dz-HR
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 12:50:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 829182E80C8
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 12:50:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Feb 2020 12:42:35 -0000
From: Aditya prakash <1863601@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adioracle berrange
X-Launchpad-Bug-Reporter: Aditya prakash (adioracle)
X-Launchpad-Bug-Modifier: Aditya prakash (adioracle)
References: <158193843490.28688.11268116902795457320.malonedeb@chaenomeles.canonical.com>
Message-Id: <158228895538.30932.2873081633004069255.malone@wampee.canonical.com>
Subject: [Bug 1863601] Re: unable to type "|" character in french keyboard.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: bd71b368cad755f92eed553ef371c89ea9ed7eb2
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
Reply-To: Bug 1863601 <1863601@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel, Thanks for your response. I am using virt-manager to start
with to connect with VNC.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863601

Title:
  unable to type "|" character in french keyboard.

Status in QEMU:
  New

Bug description:
  Unable to type "|" character when using french keyboard. It is
  displaying "<" instead of "|" while pressing AltGr+6 from my keyboard.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863601/+subscriptions

