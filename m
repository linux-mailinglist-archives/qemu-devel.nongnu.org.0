Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D621A370A62
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 07:57:53 +0200 (CEST)
Received: from localhost ([::1]:46628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld572-0002sG-TL
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 01:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld54v-0001Bg-Oz
 for qemu-devel@nongnu.org; Sun, 02 May 2021 01:55:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:35142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld54q-0004cp-Hs
 for qemu-devel@nongnu.org; Sun, 02 May 2021 01:55:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ld54p-0004Oa-4k
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 05:55:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 17ED42E8144
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 05:55:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 05:49:16 -0000
From: Thomas Huth <1793859@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gtk gvt-g
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cuser2 s0liddi th-huth tinywrkb unknown-again
X-Launchpad-Bug-Reporter: Ilpo Kaartinen (s0liddi)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153760092554.29759.17075669747500120723.malonedeb@soybean.canonical.com>
Message-Id: <161993455662.14413.14256679079655515011.malone@wampee.canonical.com>
Subject: [Bug 1793859] Re: GTK display and mouse input area scaling fails when
 using vfio-pci device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 0fa926caf71b1af59a95175dfaf55f786db022da
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1793859

Title:
  GTK display and mouse input area scaling fails when using vfio-pci
  device

Status in QEMU:
  Incomplete

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

