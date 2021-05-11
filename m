Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD6D379F1C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:23:20 +0200 (CEST)
Received: from localhost ([::1]:41990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgKrS-0004Aa-Dg
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKpQ-00029b-82
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:21:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:58506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKpN-0000ow-P6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:21:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgKpJ-00018x-VD
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:21:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 059592E819B
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:21:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:13:33 -0000
From: Thomas Huth <1785734@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fahe rth th-huth
X-Launchpad-Bug-Reporter: Fabian (fahe)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153360624183.17489.10217918293787091045.malonedeb@soybean.canonical.com>
Message-Id: <162071001355.9997.16294961182881617825.malone@chaenomeles.canonical.com>
Subject: [Bug 1785734] Re: movdqu partial write at page boundary
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 91164111ef1c0895f46c15e4848131097b7a5d6b
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
Reply-To: Bug 1785734 <1785734@bugs.launchpad.net>
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
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1785734

Title:
  movdqu partial write at page boundary

Status in QEMU:
  Incomplete

Bug description:
  In TCG mode, when a 16-byte write instruction (such as movdqu) is
  executed at a page boundary and causes a page fault, a partial write
  is executed in the first page. See the attached code for an example.

  Tested on the qemu-3.0.0-rc1 release.

  % gcc -m32 qemu-bug2.c && ./a.out && echo && qemu-i386 ./a.out
  [snip]
  page fault: addr=3D0x70001000 err=3D0x7
  *(0x70000ff8+ 0) =3D aa
  *(0x70000ff8+ 1) =3D aa
  *(0x70000ff8+ 2) =3D aa
  *(0x70000ff8+ 3) =3D aa
  *(0x70000ff8+ 4) =3D aa
  *(0x70000ff8+ 5) =3D aa
  *(0x70000ff8+ 6) =3D aa
  *(0x70000ff8+ 7) =3D aa
  *(0x70000ff8+ 8) =3D 55
  *(0x70000ff8+ 9) =3D 55
  *(0x70000ff8+10) =3D 55
  *(0x70000ff8+11) =3D 55
  *(0x70000ff8+12) =3D 55
  *(0x70000ff8+13) =3D 55
  *(0x70000ff8+14) =3D 55
  *(0x70000ff8+15) =3D 55

  [snip]
  page fault: addr=3D0x70001000 err=3D0x6
  *(0x70000ff8+ 0) =3D 77
  *(0x70000ff8+ 1) =3D 66
  *(0x70000ff8+ 2) =3D 55
  *(0x70000ff8+ 3) =3D 44
  *(0x70000ff8+ 4) =3D 33
  *(0x70000ff8+ 5) =3D 22
  *(0x70000ff8+ 6) =3D 11
  *(0x70000ff8+ 7) =3D 0
  *(0x70000ff8+ 8) =3D 55
  *(0x70000ff8+ 9) =3D 55
  *(0x70000ff8+10) =3D 55
  *(0x70000ff8+11) =3D 55
  *(0x70000ff8+12) =3D 55
  *(0x70000ff8+13) =3D 55
  *(0x70000ff8+14) =3D 55
  *(0x70000ff8+15) =3D 55

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1785734/+subscriptions

