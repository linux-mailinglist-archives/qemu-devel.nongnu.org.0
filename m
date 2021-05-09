Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4853776F0
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:15:10 +0200 (CEST)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfkD7-0002T9-IG
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfk44-0003w4-SC
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:05:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:52086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfk3u-0005k1-4G
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:05:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfk3s-0003MY-Hy
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:05:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7A4B52E8026
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:05:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 13:59:44 -0000
From: Thomas Huth <1896342@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fysnet jnsnow th-huth
X-Launchpad-Bug-Reporter: Benjamin David Lunt (fysnet)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160054207000.14948.11107647546582134186.malonedeb@gac.canonical.com>
Message-Id: <162056878428.10903.6118280645854749086.malone@chaenomeles.canonical.com>
Subject: [Bug 1896342] Re: IDE ATA IDENTIFY WORD 106
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 453200e9cd2523b8b4d7338cd8f96431bbe34c85
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1896342

Title:
  IDE ATA IDENTIFY WORD 106

Status in QEMU:
  Incomplete

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

