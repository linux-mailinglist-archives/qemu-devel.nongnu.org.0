Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A329A27105A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 21:47:13 +0200 (CEST)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJipE-0002AH-8x
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 15:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kJink-0001cl-9s
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 15:45:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:39768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kJini-0008Az-0y
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 15:45:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kJinf-0004bs-LT
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 19:45:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9078F2E80E7
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 19:45:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2020 19:38:01 -0000
From: Benjamin David Lunt <1896342@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fysnet
X-Launchpad-Bug-Reporter: Benjamin David Lunt (fysnet)
X-Launchpad-Bug-Modifier: Benjamin David Lunt (fysnet)
References: <160054207000.14948.11107647546582134186.malonedeb@gac.canonical.com>
Message-Id: <160054428139.14798.14925272531331087384.malone@gac.canonical.com>
Subject: [Bug 1896342] Re: IDE ATA IDENTIFY WORD 106
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83bdf6c8a3a5f87722c8927e54838522f3e57504"; Instance="production"
X-Launchpad-Hash: 45214963f857204ad419d8aee5a1d555a6cf4165
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 15:10:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1896342 <1896342@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For more information, Annex-E of the ACS-2 explains this as well.

http://www.t13.org/Documents/UploadedDocuments/docs2009/d2015r2
-ATAATAPI_Command_set_-_2_ACS-2.pdf

See the statement on the top of page 165 as well.  "If bit 13 is set,
then bits 3:0 are valid".

Page 119 of that same document states:
  "13  1 =3D Device has multiple logical sectors per physical sector."

In my opinion, if bit 13 is set and bits 3:0 are valid, then bits 3:0
should be non-zero.

Therefore, I gather that in QEMU (assuming that get_physical_block_exp()
returns the same value shown in the example listing above):

1) if get_physical_block_exp() return a non-zero value, bit 13 must be set =
and bits 3:0 will be non-zero.
2) if get_physical_block_exp() return a zero value, bit 13 must be clear an=
d bits 3:0 must be ignored.

Please correct me if I am wrong in these assumptions.

Thanks,
Ben

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1896342

Title:
  IDE ATA IDENTIFY WORD 106

Status in QEMU:
  New

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

