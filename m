Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C858215FB41
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Feb 2020 01:01:53 +0100 (CET)
Received: from localhost ([::1]:46818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2ku8-0003EA-EJ
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 19:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j2ktG-0002NK-EH
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 19:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j2ktF-00033N-1N
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 19:00:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:43354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j2ktE-00030m-8c
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 19:00:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j2ktC-0000BT-Gd
 for <qemu-devel@nongnu.org>; Sat, 15 Feb 2020 00:00:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 739202E80C0
 for <qemu-devel@nongnu.org>; Sat, 15 Feb 2020 00:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Feb 2020 23:54:04 -0000
From: UserPC2021 <1793859@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: gtk gvt-g
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cuser2 s0liddi tinywrkb unknown-again
X-Launchpad-Bug-Reporter: Ilpo Kaartinen (s0liddi)
X-Launchpad-Bug-Modifier: UserPC2021 (unknown-again)
References: <153760092554.29759.17075669747500120723.malonedeb@soybean.canonical.com>
Message-Id: <158172444483.24426.14579062414692281369.malone@gac.canonical.com>
Subject: [Bug 1793859] Re: GTK display and mouse input area scaling fails when
 using vfio-pci device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 140e27badb6d7fc4760dd58b6ab7eec2c1753f37
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
Reply-To: Bug 1793859 <1793859@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perhaps this is due to this issue https://github.com/intel/gvt-
linux/issues/71

https://yadi.sk/i/Ejg_6JJEBIc-Zw

** Bug watch added: github.com/intel/gvt-linux/issues #71
   https://github.com/intel/gvt-linux/issues/71

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1793859

Title:
  GTK display and mouse input area scaling fails when using vfio-pci
  device

Status in QEMU:
  New

Bug description:
  Version qemu 3.0.0-1 running on Arch. Found on Windows 8.1 and Windows
  10 VM's when using Intel gvt-g device.

  While in fullscreen the GTK display is scaled larger than the x11
  screen or virtual machine resolution. Without choosing zoom-to-fit
  portions of the VM display are not shown on x11 screen regardless of
  the VM resolution. When zoom-to-fit is done the mouse that's shown on
  screen and actual input are off sync. The mouse can wander off screen
  when going left and down.

  This message is shown when changing from gxl-vga to vfio-pci in view menu=
. =

  (qemu-system-x86_64:6472): Gtk-WARNING **: 09:50:06.663: drawing failure =
for widget 'GtkDrawingArea': NULL pointer
  (qemu-system-x86_64:6472): Gtk-WARNING **: 09:50:06.664: drawing failure =
for widget 'GtkNotebook': NULL pointer
  (qemu-system-x86_64:6472): Gtk-WARNING **: 09:50:06.664: drawing failure =
for widget 'GtkBox': NULL pointer
  (qemu-system-x86_64:6472): Gtk-WARNING **: 09:50:06.664: drawing failure =
for widget 'GtkWindow': NULL pointer

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1793859/+subscriptions

