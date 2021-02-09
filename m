Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C1A31478A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 05:31:52 +0100 (CET)
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Kgp-0000YO-7b
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 23:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9Kev-00081K-Un
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 23:29:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:59428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9Keu-0003uL-8r
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 23:29:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l9Kes-0002yI-8s
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 04:29:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 386E62E8138
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 04:29:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Feb 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1598612@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jschwart th-huth
X-Launchpad-Bug-Reporter: Julius Schwartzenberg (jschwart)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160703192444.23593.70037.malonedeb@gac.canonical.com>
Message-Id: <161284424008.15411.2587810104494698139.malone@loganberry.canonical.com>
Subject: [Bug 1598612] Re: Windows for Workgroups 3.11 installer crashes with
 a general protection fault
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: dc6fa4e01961600797dcd2f0c3967eab13e8eab2
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
Reply-To: Bug 1598612 <1598612@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1598612

Title:
  Windows for Workgroups 3.11 installer crashes with a general
  protection fault

Status in QEMU:
  Expired

Bug description:
  I used only disk images from here:
  http://ia801606.us.archive.org/zipview.php?zip=3D/22/items/IBM_PC_Compati=
bles_TOSEC_2012_04_23/IBM_PC_Compatibles_TOSEC_2012_04_23.zip

  When I try to install Windows for Workgroups 3.11 on either PC DOS
  2000 or MS-DOS 6.22, the installer crashes after entering the
  graphical part with two dialogs containing:

  Application Error
  WINSETUP caused a General Protection Fault in module <unknown>0EDF:7011WI=
NSETUP will close.

  Application Error
  WINSETUP caused a General Protection Fault in module USER.EXE at 0001:40B=
6.

  And then:
  Standard Mode: Bad Fault in MS-DOS Extender.
  Fault: 000D Stack Dump: 0000 0000 0070
  Raw fault frame: EC=3D0000 IP=3D5EF7 CS=3D037F FL=3D3087 SP=3DFFEE SS=3D0=
2DF

  This happens both with and without KVM. I tested with QEMU from Ubuntu
  14.04 and 16.04 and recent GIT
  (ef8757f1fe8095a256ee617e4dbac69d3b33ae94).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1598612/+subscriptions

