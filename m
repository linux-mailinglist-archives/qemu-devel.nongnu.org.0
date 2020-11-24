Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C722C2D05
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:37:04 +0100 (CET)
Received: from localhost ([::1]:44074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbJP-00041v-Bu
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khb94-0002KD-NO
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:26:23 -0500
Received: from indium.canonical.com ([91.189.90.7]:34040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khb91-0002Cv-Gg
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:26:22 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khb8y-0006Fy-G2
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:26:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 649622E8141
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:26:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2020 16:10:44 -0000
From: Thomas Huth <1752646@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: framebuffer uefi vga
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bsdasm th-huth
X-Launchpad-Bug-Reporter: Leonid Myravjev (bsdasm)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151992150884.16342.3804061030016543.malonedeb@wampee.canonical.com>
Message-Id: <160623424518.29248.12674131527394115659.malone@wampee.canonical.com>
Subject: [Bug 1752646] Re: Freezing VNC screen on some the UEFI framebuffer
 applications
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 282148a0fd101e2460bcad287424c50bc26e7e44
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
Reply-To: Bug 1752646 <1752646@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1752646

Title:
  Freezing VNC screen on some the UEFI framebuffer applications

Status in QEMU:
  Incomplete

Bug description:
  Hi folks!

  I use TianCore (UEFI) formware on the qemu (master version last commit a6=
e0344).
  When kernel/linux is start, it using UEFI Framebuffer. Then I run UEFI ap=
plication (which writes directly to the framebuffer) my VNS screen is freez=
ing. Then I restart vnclient I see only one frame.

  When I run application, I getting in the file hw/display/vga.c on
  function 'vga_ioport_write' some commands, it change "s->ar_index"
  from 0x20 -> 0x10

  In the function vga_update_display:
  1751         if (!(s->ar_index & 0x20)) {
  1752             graphic_mode =3D GMODE_BLANK;
  1753         } else {

  And I got GMODE_BLANK mode. If I patch it:
  1751         if (0) {

  my VNC not freezing.

  From "Hardware Level VGA and SVGA Video Programming Information Page"
  I saw, what ar_index is 0x3C0 (Attribute Controller Data Write
  Register), 0x20(5-bit) is PAS -- Palette Address Source

  If there is a output via the UEFI framebuffer, does the difference
  have a PAS or not? Why do we need to pause the output if the PAS is
  exposed? Especially when the application outputs via framebuffer.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1752646/+subscriptions

