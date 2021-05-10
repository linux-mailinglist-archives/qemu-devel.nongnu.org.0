Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CE2377B4D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 06:41:58 +0200 (CEST)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfxjx-0008Du-IO
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 00:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxit-0006rJ-8o
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:40:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:50684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxir-000554-E1
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:40:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfxip-0008Aw-8k
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:40:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3FD1E2E8136
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 04:30:38 -0000
From: Thomas Huth <1905226@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: intel-hda
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jacob11 th-huth
X-Launchpad-Bug-Reporter: Jacob (jacob11)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160610307277.21225.14284199677830070930.malonedeb@gac.canonical.com>
Message-Id: <162062103860.17197.12132270185201427626.malone@soybean.canonical.com>
Subject: [Bug 1905226] Re: intel-hda: stream reset bits are broken
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 0788199006f08ba91b78917004190f707708ad8f
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
Reply-To: Bug 1905226 <1905226@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1905226

Title:
  intel-hda: stream reset bits are broken

Status in QEMU:
  Incomplete

Bug description:
  From HD audio spec, section 3.3.35:

  "Stream Reset (SRST): Writing a 1 causes the corresponding stream to
  be reset. [...] After the stream hardware has completed sequencing
  into the reset state, it will report a 1 in this bit. Software must
  read a 1 from this bit to verify that the stream is in reset. Writing
  a 0 causes the corresponding stream to exit reset. When the stream
  hardware is ready to begin operation, it will report a 0 in this bit.
  Software must read a 0 from this bit before accessing any of the
  stream registers."

  So to reset a stream I set the bit, but it never reads back as 1 so
  the driver either times out or will hang forever waiting for it to
  become 1. I looked into why this happens and found that as of the
  latest version (8110fa1), in function intel_hda_set_st_ctl() of the
  https://github.com/qemu/qemu/blob/master/hw/audio/intel-hda.c,

      if (st->ctl & 0x01) {
          /* reset */
          dprint(d, 1, "st #%d: reset\n", reg->stream);
          st->ctl =3D SD_STS_FIFO_READY << 24;
      }

  This causes the bit to immediately become set to 0 even if I write a
  1, and clearly does not meet the spec. I checked behaviour of real
  hardware and it works as expected, i.e. I see the bit will become 1
  and 0 when I write to it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905226/+subscriptions

