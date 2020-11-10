Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3702ADDEB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 19:13:58 +0100 (CET)
Received: from localhost ([::1]:52726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcY9V-00032A-Lh
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 13:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcY6z-0001Nm-Vy
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:11:22 -0500
Received: from indium.canonical.com ([91.189.90.7]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcY6s-0004Y8-KK
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:11:21 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcY6n-0002AI-Vs
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 18:11:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EC8B72E8133
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 18:11:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 18:01:33 -0000
From: Thomas Huth <1738434@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: boleg th-huth
X-Launchpad-Bug-Reporter: Oleg Boyarchuk (boleg)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151335284270.18775.11956593413249795656.malonedeb@chaenomeles.canonical.com>
Message-Id: <160503129371.27879.14624664508786354446.malone@chaenomeles.canonical.com>
Subject: [Bug 1738434] Re: CALL FWORD PTR [ESP] handled incorrectly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: b1c7881501bad6b6a64f2a2aaf8042b92f69dff8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1738434 <1738434@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1738434

Title:
  CALL FWORD PTR [ESP] handled incorrectly

Status in QEMU:
  Incomplete

Bug description:
  To keep the story short, this 32-bit code crashes on 64-bit Windows
  whereas it works fine on real system and VMware:

      push 33h
      push offset _far_call
      call fword ptr[esp]
      jmp _ret
  _far_call:
      retf
  _ret:

  32-bit code running under WoW64 on 64-bit Windows has the ability to
  switch to the 64-bit mode via so called "Heaven's gate". In order to
  do that you have to make a far call/jmp by 0x33 selector how the code
  snippet above shows. QEMU throws an access violation exception whereas
  the code snippet runs with no problems on real CPU and VMware. By the
  way, this code works fine under QEMU, I hope it gives you a hint where
  to look:

      push 23h
      push offset _far_call
      call fword ptr[esp]
      jmp _ret
  _far_call:
      retf
  _ret:

  0x23 is a default 32-bit selector for 32-bit processes running under
  WoW64.

  Environment:
  QEMU: 2.10.93, command line: qemu-system-x86_64.exe -m 2G -snapshot -cdro=
m full_path_to_iso fullP_path_to_img
  Guest OS: Windows 7 x64 SP1 build 7601 or Windows 10 version 1709 build 1=
6299.19
  Host OS: Windows 10 x64 version 1703 build 15063.786

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1738434/+subscriptions

