Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5E02C2DC7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:07:12 +0100 (CET)
Received: from localhost ([::1]:46192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbmZ-0004rA-4p
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbgm-000058-Vd
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:01:14 -0500
Received: from indium.canonical.com ([91.189.90.7]:40852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbgc-0007Si-9p
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:01:08 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khbga-00020O-4S
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 17:01:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0C1002E8140
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 17:01:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2020 16:47:33 -0000
From: Thomas Huth <1745354@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: cdos mouse ps2
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: farjon-florian th-huth
X-Launchpad-Bug-Reporter: FARJON (farjon-florian)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151687805035.4532.9757970758658595284.malonedeb@wampee.canonical.com>
Message-Id: <160623645357.5784.3991856042995646438.malone@soybean.canonical.com>
Subject: [Bug 1745354] Re: CDOS ps/2 mouse problem
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 9bec5599e07aace73c2a9113d3049f34ff4c29c4
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
Reply-To: Bug 1745354 <1745354@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1745354

Title:
  CDOS ps/2 mouse problem

Status in QEMU:
  Incomplete

Bug description:
  Qemu v2.10.2 (also tested with 2.11.0)
  Host OS : CentOS 7 x86_64 (1708)
  Guest OS : Concurrent DOS 386 3.0 (with GEM)

  There is my launch command : =

  /usr/local/bin/qemu-system-i386 -m 4m -cpu 486 -hda /home/my_user/HDD.img=
 -vga std

  When I'm launching the guest, it is not responding after focusing in
  the viewer. I think this is due to the ps/2 emulation because when I
  add "-usb -device usb-mouse" in my command I don't have this issue
  (but in this case, mouse is not supported by CDOS).

  I tested with an older version of Qemu (0.11) which uses the Bochs
  bios (instead of SeaBios in newer versions), and I don't have this
  issue either.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1745354/+subscriptions

