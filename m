Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBCF2A2E2
	for <lists+qemu-devel@lfdr.de>; Sat, 25 May 2019 06:27:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUOHS-00052B-Rb
	for lists+qemu-devel@lfdr.de; Sat, 25 May 2019 00:27:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hUOFw-0004S6-8s
	for qemu-devel@nongnu.org; Sat, 25 May 2019 00:26:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hUOFv-0005zs-8C
	for qemu-devel@nongnu.org; Sat, 25 May 2019 00:26:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:55368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hUOFv-0005yd-2N
	for qemu-devel@nongnu.org; Sat, 25 May 2019 00:26:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hUOFr-0002xO-L8
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 04:25:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 8DD392E81C0
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 04:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 May 2019 04:17:28 -0000
From: Launchpad Bug Tracker <1730099@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
	assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor michalrus th-huth
X-Launchpad-Bug-Reporter: Michal Rus (michalrus)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150982188718.19907.10916894947386280270.malonedeb@soybean.canonical.com>
Message-Id: <155875784815.26936.8917844573771121358.malone@loganberry.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 8b57945def4091cbcc08a9ef40037d3f38473156
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1730099] Re: Sometimes,
 when not touching the SDL window, the guest freezes
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
Reply-To: Bug 1730099 <1730099@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1730099

Title:
  Sometimes, when not touching the SDL window, the guest freezes

Status in QEMU:
  Expired

Bug description:
  I often just run some development guest machine, and leave its SDL
  window on a workspace I don=E2=80=99t touch, and only interact with it via
  TCP.

  And sometimes, the guest just freezes.

  After it gets the focus back, it comes back to life (starts responding
  via network).

  QEMU release version: 2.8.1.1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1730099/+subscriptions

