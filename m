Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AAA37F806
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:35:01 +0200 (CEST)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAYO-0002pE-N9
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAKa-0006Je-Ey
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:43544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAKY-0001dX-Fw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhAKW-0006CN-Ke
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:20:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5800F2E8187
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:20:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 12:10:39 -0000
From: Thomas Huth <1898011@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user mmap tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ksserebr rth th-huth ubuntu-weilnetz
X-Launchpad-Bug-Reporter: Kostya Serebryany (ksserebr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160153380394.6201.10648910301442382269.malonedeb@soybean.canonical.com>
Message-Id: <162090783979.16690.9188430876143246075.malone@soybean.canonical.com>
Subject: [Bug 1898011] Re: mmap MAP_NORESERVE of 2^42 bytes consumes 16Gb of
 actual RAM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 34eac46446653faa683182abd53db4e8886ba1bc
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
Reply-To: Bug 1898011 <1898011@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1898011

Title:
  mmap MAP_NORESERVE of 2^42 bytes consumes 16Gb of actual RAM

Status in QEMU:
  Incomplete

Bug description:
  Run this program:

  #include <sys/mman.h>
  #include <stdio.h>
  int main() {
          for (int i =3D 30; i <=3D 44; i++) {
                  fprintf(stderr, "trying 2**%d\n", i);
                  mmap((void*)0x600000000000,1ULL << i,
                          PROT_NONE,
                          MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED|MAP_NORESERVE=
,-1,0);
          }
  }

  (tried qemu-x86_64 and qemu-aarch64, 4.2.1 and trunk/5.1.50)

  On each iteration qemu will consume 2x more physical RAM, =

  e.g. when mapping 2^42 it will have RSS of 16Gb.

  On normal linux it works w/o consuming much RAM, due to MAP_NORESERVE.

  Also: qemu -strace prints 0 instead of the correct size starting from siz=
e=3D2^32
  and prints -2147483648 for size=3D2^31. =


  mmap(0x0000600000000000,1073741824,PROT_NONE,MAP_PRIVATE|MAP_ANONYMOUS|MA=
P_FIXED|MAP_NORESERVE,-1,0)
  =3D 0x0000600000000000

  mmap(0x0000600000000000,-2147483648,PROT_NONE,MAP_PRIVATE|MAP_ANONYMOUS|M=
AP_FIXED|MAP_NORESERVE,-1,0)
  =3D 0x0000600000000000

  mmap(0x0000600000000000,0,PROT_NONE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED|M=
AP_NORESERVE,-1,0)
  =3D 0x0000600000000000

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1898011/+subscriptions

