Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17BA1E421
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 23:50:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQfJY-00043Z-C2
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 17:50:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hQfEz-0001wl-Us
	for qemu-devel@nongnu.org; Tue, 14 May 2019 17:45:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hQfEy-0001Zv-66
	for qemu-devel@nongnu.org; Tue, 14 May 2019 17:45:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:45546)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hQfEw-0001X6-U8
	for qemu-devel@nongnu.org; Tue, 14 May 2019 17:45:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hQfEu-00087v-U5
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 21:45:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id E29CB2E80C8
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 21:45:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 May 2019 21:39:11 -0000
From: Chris Sharp <1746394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chrissharp123 jambon
X-Launchpad-Bug-Reporter: Jeff (jambon)
X-Launchpad-Bug-Modifier: Chris Sharp (chrissharp123)
References: <151736593434.17105.9572043390189121151.malonedeb@chaenomeles.canonical.com>
Message-Id: <155786995172.14518.5361571937841369651.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: de2c443f893163a9b2adb56882229d30f5add6e5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1746394] Re: No provider of
 glEGLImageTargetTexture2DOES found with NVIDIA proprietary driver
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
Reply-To: Bug 1746394 <1746394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm hitting this issue on Fedora 30 after an in-place upgrade.  Using
gnome-boxes, I click on a virtual machine to open the console viewer and
it crashes after a hang.  Terminal output looks like this:

[chris@gereon ~]$ gnome-boxes

(gnome-boxes:15640): Gtk-WARNING **: 17:21:17.105: GtkFlowBox with a
model will ignore sort and filter functions

(gnome-boxes:15640): Gtk-WARNING **: 17:21:17.107: GtkListBox with a model =
will ignore sort and filter functions
Memory pressure relief: Total: res =3D 11759616/11722752/-36864, res+swap =
=3D 7540736/7540736/0
No provider of glEGLImageTargetTexture2DOES found.  Requires one of:
    GL extension "GL_OES_EGL_image"
Aborted (core dumped)

nvidia driver version: 418.56

01:00.0 VGA compatible controller: NVIDIA Corporation GM206 [GeForce GTX
960] (rev a1)

Web searches lead me to the closed libepoxy bug posted by the OP.  I'm
happy to provide more details about my system.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1746394

Title:
  No provider of glEGLImageTargetTexture2DOES found with NVIDIA
  proprietary driver

Status in QEMU:
  New

Bug description:
  https://github.com/anholt/libepoxy/issues/148

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1746394/+subscriptions

