Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C9377B48
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 06:37:17 +0200 (CEST)
Received: from localhost ([::1]:58844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfxfQ-0002YI-DU
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 00:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxdn-0000SG-Ba
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:35:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:50456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxdk-0001jX-Gc
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:35:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfxdi-0007lx-DR
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:35:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 326AE2E8187
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:35:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 04:29:08 -0000
From: Thomas Huth <1904490@bugs.launchpad.net>
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
References: <160558234310.29971.12864468607339587807.malonedeb@gac.canonical.com>
Message-Id: <162062094892.17197.12807216127710998191.malone@soybean.canonical.com>
Subject: [Bug 1904490] Re: intel-hda: valid registers are unknown
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 50da40c87b6dd126b0e37bbda798f33537e129bc
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
Reply-To: Bug 1904490 <1904490@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1904490

Title:
  intel-hda: valid registers are unknown

Status in QEMU:
  Incomplete

Bug description:
  According to HDA specification, "3.1.2 General Register Behaviors and
  Access Requirements":

  "All controller registers must be addressable as byte, Word, and Dword
  quantities."

  But e.g. if you try the following to reset and enable the CORB,
  assuming es:esi contains the base MMIO address of the controller,

   es or [esi+4bh], byte 80h   ; reset CORB
  corbresetloop:
   es test [esi+4bh], byte 80h ; is HW done resetting yet?
   jnz corbreset1ok            ; yes, bit is now 1
   hlt                         ; wait a little bit
   jmp corbresetloop           ; and check again
  corbreset1ok:
   es and [esi+4bh], byte 7fh  ; clear the bit

  It will hang indefinitely because the bit never gets set, and if you
  enable debug output of the controller with "-device intel-
  hda,debug=3D1", you will see infinitely the line "unknown register, addr
  0x4b" output. The same code on a real hardware (I tried with ICH7M)
  works fine, as it should according to the spec.

  Host/guest/version does not matter (I am writing own drivers) --- as
  of right now, latest version still has this code:

  https://github.com/qemu/qemu/blob/master/hw/audio/intel-hda.c

  which seems to emit "unknown register" message in
  intel_hda_reg_find(), and this function does not take into account
  range of addresses that each register occupies.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904490/+subscriptions

