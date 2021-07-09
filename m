Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77E83C1E7B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:36:55 +0200 (CEST)
Received: from localhost ([::1]:50362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iFy-0006qy-S4
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5s-0006Fk-E0
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:28 -0400
Received: from indium.canonical.com ([91.189.90.7]:32904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5e-0001I4-GX
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:28 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i5O-0005El-PK
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:25:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 214142E81F9
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1896342@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fysnet janitor jnsnow th-huth
X-Launchpad-Bug-Reporter: Benjamin David Lunt (fysnet)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160054207000.14948.11107647546582134186.malonedeb@gac.canonical.com>
Message-Id: <162580423852.19936.607132912600554579.malone@loganberry.canonical.com>
Subject: [Bug 1896342] Re: IDE ATA IDENTIFY WORD 106
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: ae1d02d865ceb96e4f816a5c27cb500bfd31d89e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1896342 <1896342@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1896342

Title:
  IDE ATA IDENTIFY WORD 106

Status in QEMU:
  Expired

Bug description:
  The code at line 202 in hw/ide/core.c
   (https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/ide/core.c;#l201)
  hard codes bit 13 set.  However, get_physical_block_exp() can and may ret=
urn 0, which is a valid response. If get_physical_block_exp() does return z=
ero, bit 13 should not be set.

  ATAPI8 states (Section 7.17.7.73):
   "Bit 13 of word 106 shall be set to one to indicate that the device has =
more than one logical sector per physical sector"

  and gives the examples:
    Bits (3:0): 0 =3D 2^0 =3D 1 logical sector per physical sector
    Bits (3:0): 1 =3D 2^1 =3D 2 logical sector per physical sector
    Bits (3:0): 2 =3D 2^2 =3D 4 logical sector per physical sector
    Bits (3:0): 3 =3D 2^3 =3D 8 logical sector per physical sector

  Therefore, if bit 13 is set, bits 3:0 must be greater than zero.

  If get_physical_block_exp() returns zero then there is a 1:1 ratio and
  bit 13 must be 0.

  Just my opinion.

  Thanks,
  Ben

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1896342/+subscriptions

