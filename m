Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2BD36FFD8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:44:01 +0200 (CEST)
Received: from localhost ([::1]:58382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXBI-00057c-7R
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcWju-0005ES-2P
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:15:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:52262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcWjp-00070J-NR
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:15:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcWjn-0000hN-KX
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 17:15:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 990A92E8144
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 17:15:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 17:05:40 -0000
From: Thomas Huth <1908450@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ata atapi ide identify x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gourryinverse jnsnow th-huth
X-Launchpad-Bug-Reporter: Gregory Price (gourryinverse)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160815666653.31417.1447357912774624366.malonedeb@chaenomeles.canonical.com>
Message-Id: <161980234041.10149.9015495118413121968.malone@gac.canonical.com>
Subject: [Bug 1908450] Re: ide/core.c ATA Major Version reporting incorrect
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: bc165af3e21ab06d0d724e8b1a1a09bc3e444197
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
Reply-To: Bug 1908450 <1908450@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/59


** Changed in: qemu
       Status: New =3D> Expired

** Changed in: qemu
     Assignee: John Snow (jnsnow) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #59
   https://gitlab.com/qemu-project/qemu/-/issues/59

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908450

Title:
  ide/core.c ATA Major Version reporting incorrect

Status in QEMU:
  Expired

Bug description:
  @@ -165,7 +165,7 @@ static void ide_identify(IDEState *s)
          put_le16(p + 76, (1 << 8));
      }

      put_le16(p + 80, 0xf0); /* ata3 -> ata6 supported */
  -   put_le16(p + 80, 0xf0); /* ata3 -> ata6 supported */
  +   put_le16(p + 80, ((1 << 6) | (1 << 5) (1 << 4) (1 << 3)); /* ata3 -> =
ata6 supported */
      put_le16(p + 81, 0x16); /* conforms to ata5 */
      /* 14=3DNOP supported, 5=3DWCACHE supported, 0=3DSMART supported */
      put_le16(p + 82, (1 << 14) | (1 << 5) | 1);

  =

  This field Major Version Number field is presently reporting support for =
ATA-4 through ATA-7.
  Bitfield[80] is defined in the ATA-6 specification below.

  0xF0 =3D (1<<7) | (1<<6) | (1 << 5) | (1 << 4) // 4-7 - current settings
  0x78 =3D (1<<6) | (1<<5) | (1 << 4) | (1 << 3) // 3-6 - new settings

  Either the comment is wrong, or the field is wrong. If the field is
  wrong it can cause errors in drivers that check support vs conformity.
  This will not break most guests, since the conformity field is set to
  ATA-5.

  I'm not sure whether this component supports ATA-7, but since it's
  commented as if it supports up through 6, correcting the field
  assignment seems more correct.

  ATA/ATAPI-6 Specification
  https://web.archive.org/web/20200124094822/https://www.t13.org/Documents/=
UploadedDocuments/project/d1410r3b-ATA-ATAPI-6.pdf

  Page 116
  80 - M Major version number
  0000h or FFFFh =3D device does not report version
  F 15 Reserved
  F 14 Reserved for ATA/ATAPI-14
  F 13 Reserved for ATA/ATAPI-13
  F 12 Reserved for ATA/ATAPI-12
  F 11 Reserved for ATA/ATAPI-11
  F 10 Reserved for ATA/ATAPI-10
  F 9 Reserved for ATA/ATAPI-9
  F 8 Reserved for ATA/ATAPI-8
  F 7 Reserved for ATA/ATAPI-7
  F 6 1 =3D supports ATA/ATAPI-6
  F 5 1 =3D supports ATA/ATAPI-5
  F 4 1 =3D supports ATA/ATAPI-4
  F 3 1 =3D supports ATA-3
  X 2 Obsolete
  X 1 Obsolete
  F 0 Reserved

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908450/+subscriptions

