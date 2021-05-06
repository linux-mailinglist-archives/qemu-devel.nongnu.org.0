Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1F3755FC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:56:35 +0200 (CEST)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefQY-0004Qq-AX
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lefNt-0002bX-7m
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:53:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:47180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lefNr-0002iK-CX
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:53:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lefNo-0007P3-Ie
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 14:53:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8542B2E8271
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 14:53:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 14:44:31 -0000
From: Thomas Huth <1888492@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: haxm windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth zhaosq
X-Launchpad-Bug-Reporter: ZhaoSQ-CH (zhaosq)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159541364991.32738.5508954702379988107.malonedeb@chaenomeles.canonical.com>
Message-Id: <162031227192.6519.11473846367159810637.malone@wampee.canonical.com>
Subject: [Bug 1888492] Re: After installing Ubuntu,
 restart and pop up the CMD command prompt
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 9275583e605a85d8a7ea86f696b52bb94b04cd2a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1888492 <1888492@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.

** Changed in: qemu
       Status: New =3D> Incomplete

** Tags added: haxm

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888492

Title:
  After installing Ubuntu, restart and pop up the CMD command prompt

Status in QEMU:
  Incomplete

Bug description:
  QEMU release version=EF=BC=9A V5.1.0
  time=EF=BC=9A2020=E5=B9=B47=E6=9C=8822=E6=97=A510:34:40
  Operation: =E5=AE=89=E8=A3=85=E5=AE=8CUbuntu=E5=90=8E=E9=87=8D=E6=96=B0=
=E5=90=AF=E5=8A=A8=EF=BC=8C=E5=B9=B6=E5=BC=B9=E5=87=BACMD=E5=91=BD=E4=BB=A4=
=E6=8F=90=E7=A4=BA=E7=AC=A6
  use Ubuntu release version =EF=BC=9AV20.04-desktop.
  use windows release version: windows 10.
  Question:
  Command used=EF=BC=9Aqemu-system-x86_64.exe -name test -m 4096 -machine a=
ccel=3Dhax -cdrom .\workspace\ubuntu\ubuntu-20.04-desktop-amd64.iso .\works=
pace\img\ubuntu.img
  HAX is working and emulator runs in fast virt mode.
  *** BUG ***
  In pixman_region32_init_rect: Invalid rectangle passed
  Set a breakpoint on '_pixman_log_error' to debug

  *** BUG ***
  In pixman_region32_init_rect: Invalid rectangle passed
  Set a breakpoint on '_pixman_log_error' to debug

  *** BUG ***
  In pixman_region32_init_rect: Invalid rectangle passed
  Set a breakpoint on '_pixman_log_error' to debug

  *** BUG ***
  In pixman_region32_init_rect: Invalid rectangle passed
  Set a breakpoint on '_pixman_log_error' to debug

  *** BUG ***
  In pixman_region32_init_rect: Invalid rectangle passed
  Set a breakpoint on '_pixman_log_error' to debug

  *** BUG ***
  In pixman_region32_init_rect: Invalid rectangle passed
  Set a breakpoint on '_pixman_log_error' to debug

  *** BUG ***
  In pixman_region32_init_rect: Invalid rectangle passed
  Set a breakpoint on '_pixman_log_error' to debug

  *** BUG ***
  In pixman_region32_init_rect: Invalid rectangle passed
  Set a breakpoint on '_pixman_log_error' to debug

  *** BUG ***
  In pixman_region32_init_rect: Invalid rectangle passed
  Set a breakpoint on '_pixman_log_error' to debug

  *** BUG ***
  In pixman_region32_init_rect: Invalid rectangle passed
  Set a breakpoint on '_pixman_log_error' to debug

  (qemu:660): Gtk-WARNING **: Negative content width -7 (allocation 1,
  extents 4x4) while allocating gadget (node headerbar, owner
  GtkHeaderBar)

  (qemu:660): Gtk-WARNING **: gtk_widget_size_allocate(): attempt to
  allocate widget with width -102 and height 16

  (qemu:660): Gtk-WARNING **: Negative content width -23 (allocation 1, ext=
ents 12x12) while allocating gadget (node label, owner GtkLabel)
  qemu-system-x86_64.exe: Gtk: gtk_distribute_natural_allocation: assertion=
 'extra_space >=3D 0' failed

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888492/+subscriptions

