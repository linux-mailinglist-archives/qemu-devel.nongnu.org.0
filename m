Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39443ACF51
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:39:59 +0200 (CEST)
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGb9-0006Se-0I
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luGXA-0006kw-L9
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:35:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:60222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luGX8-0004nF-7q
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:35:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1luGX2-0004zr-F8
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:35:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2E1182E8206
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:35:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Jun 2021 15:30:02 -0000
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
Message-Id: <162403020269.14016.8160556248013478365.launchpad@wampee.canonical.com>
Subject: [Bug 1793859] Re: GTK display and mouse input area scaling fails when
 using vfio-pci device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 187ddac0824c109ae7cd368df794761519cf5a84
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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

** Bug watch removed: github.com/intel/gvt-linux/issues #71
   https://github.com/intel/gvt-linux/issues/71

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

