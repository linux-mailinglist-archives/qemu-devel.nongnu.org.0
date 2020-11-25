Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268682C44D2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 17:23:20 +0100 (CET)
Received: from localhost ([::1]:54478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khxZf-0006YI-7s
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 11:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khxXC-0004UW-VY
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:20:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:35308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khxXA-0005TB-Tr
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:20:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khxX9-00072K-9r
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 16:20:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3D9D32E813B
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 16:20:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2020 16:09:21 -0000
From: Thomas Huth <1826568@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: axelheider kbastian pmaydell th-huth
X-Launchpad-Bug-Reporter: Floyd42 (axelheider)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155629222212.6615.9281610848583512798.malonedeb@chaenomeles.canonical.com>
Message-Id: <160632056185.27098.2289784949738987464.malone@chaenomeles.canonical.com>
Subject: [Bug 1826568] Re: RISC-V Disassembler/translator instruction decoding
 disagreement
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 7e87a611ece415f326176643399fb6b1812d397b
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
Reply-To: Bug 1826568 <1826568@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1826568

Title:
  RISC-V Disassembler/translator instruction decoding disagreement

Status in QEMU:
  Incomplete

Bug description:
  =

  When running QEMU V3.1.0 for platform  RISC-V, 64bit, Spike V1.10 with "-=
d in_asm -singlestep -D qemu_log.txt", my (faulty) test code brought up thi=
s message in the logs:

    0x000000008002cade:  051300009517e2bf  illegal         =

    Disassembler disagrees with translator over instruction decoding
    Please report this to qemu-devel@nongnu.org

  =

  You may want to resolve the disagreement.

  Axel

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1826568/+subscriptions

