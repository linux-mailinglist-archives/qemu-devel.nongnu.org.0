Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD08025B8B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 03:10:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33701 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTFm1-0004is-3F
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 21:10:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hTFN4-0003RF-BS
	for qemu-devel@nongnu.org; Tue, 21 May 2019 20:44:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hTFEB-0005Oz-6y
	for qemu-devel@nongnu.org; Tue, 21 May 2019 20:35:32 -0400
Received: from indium.canonical.com ([91.189.90.7]:39256)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hTFEB-0005OS-1g
	for qemu-devel@nongnu.org; Tue, 21 May 2019 20:35:31 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hTFE9-00043D-I5
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 00:35:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 8757D2E80C7
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 00:35:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 May 2019 00:27:21 -0000
From: Lee Trager <lee.trager@canonical.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ltrager
X-Launchpad-Bug-Reporter: Lee Trager (ltrager)
X-Launchpad-Bug-Modifier: Lee Trager (ltrager)
Message-Id: <155848484199.26378.8902441571189785539.malonedeb@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 255b92904069cf5004d2e2799b07be2a8ec7267a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Tue, 21 May 2019 21:07:49 -0400
Subject: [Qemu-devel] [Bug 1829945] [NEW] SDL support missing from
 qemu-1:3.1+dfsg-2ubuntu3.1
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
Reply-To: Bug 1829945 <1829945@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

qemu support is missing from qemu-1:3.1+dfsg-2ubuntu3.1 on Disco. This
is dispite qemu --help saying its available. SDL support is needed to
use Packer(https://www.packer.io/) in graphical mode.

# qemu-system-x86_64 -cpu host -smp 2,sockets=3D2,cores=3D1,threads=3D1 -ma=
chine type=3Dpc,accel=3Dkvm -display sdl -cdrom ubuntu.iso
qemu-system-x86_64: Display 'sdl' is not available.

# qemu-system-x86_64 --help | grep sdl
-display sdl[,frame=3Don|off][,alt_grab=3Don|off][,ctrl_grab=3Don|off]
-sdl            shorthand for -display sdl

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1829945

Title:
  SDL support missing from qemu-1:3.1+dfsg-2ubuntu3.1

Status in QEMU:
  New

Bug description:
  qemu support is missing from qemu-1:3.1+dfsg-2ubuntu3.1 on Disco. This
  is dispite qemu --help saying its available. SDL support is needed to
  use Packer(https://www.packer.io/) in graphical mode.

  # qemu-system-x86_64 -cpu host -smp 2,sockets=3D2,cores=3D1,threads=3D1 -=
machine type=3Dpc,accel=3Dkvm -display sdl -cdrom ubuntu.iso
  qemu-system-x86_64: Display 'sdl' is not available.

  # qemu-system-x86_64 --help | grep sdl
  -display sdl[,frame=3Don|off][,alt_grab=3Don|off][,ctrl_grab=3Don|off]
  -sdl            shorthand for -display sdl

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1829945/+subscriptions

