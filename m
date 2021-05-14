Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A8F381039
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:03:20 +0200 (CEST)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhd5j-0007M3-Ol
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhd3V-0005uU-E1
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:01:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:35278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhd3Q-0004qw-UA
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:01:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhd3M-0005CY-QN
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:00:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 885EE2E8187
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:00:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 18:53:36 -0000
From: Thomas Huth <1920211@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: colaflash th-huth
X-Launchpad-Bug-Reporter: kolAflash (colaflash)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161616435594.712.2426714645893097472.malonedeb@soybean.canonical.com>
Message-Id: <162101841667.7316.730883337027241955.malone@gac.canonical.com>
Subject: [Bug 1920211] Re: shrink option for discard (for bad host-filesystems
 and -backup solutions)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 527e5c06d10a7b0084c0bab4eec030d2e0c2158a
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
Reply-To: Bug 1920211 <1920211@bugs.launchpad.net>
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


** Tags added: feature-request

** Changed in: qemu
       Status: New =3D> Incomplete

** Changed in: qemu
   Importance: Undecided =3D> Wishlist

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920211

Title:
  shrink option for discard (for bad host-filesystems and -backup
  solutions)

Status in QEMU:
  Incomplete

Bug description:
  When using discard=3Dunmap for virtio or scsi devices with QCOW2 images,
  space discarded by the guest will be unmaped on the host, which is
  basically great!

  This will turn the QCOW2 image into a sparse file which is efficient
  for most scenarios. But it may be that you need to avoid big sparse
  files on your host. For example because you need to use a backup
  solution which doesn't support sparse files well. Or maybe the QCOW2
  image is on a filesystem mount which doesn't support sparse files at
  all.

  For those scenarios an alternative option for the discard setting (discar=
d=3Dshrink) would be great, so that the QCOW2 file itself gets shrunken aga=
in.
  I'm not sure about how the initial growing* of QCOW2 images is implemente=
d and if there are maybe limitations. But I hope it may be possible do the =
inverse and actually shrink (not sparse) an QCOW2 image with internally dis=
carded blocks.

  =

  I'm using Qemu-5.2.0 and Linux >=3D 5.3 (host and guest).

  *If you use "qemu-img create -f qcow2 ..." withOUT the "preallocation"
  option.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920211/+subscriptions

