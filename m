Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B68437F73B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:57:55 +0200 (CEST)
Received: from localhost ([::1]:50790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9yU-0005id-I5
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lh9x4-00034a-4j
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:56:26 -0400
Received: from indium.canonical.com ([91.189.90.7]:38996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lh9x0-0004Dt-05
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:56:25 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lh9wx-00011K-E0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 11:56:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D904D2E823F
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 11:56:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 11:47:02 -0000
From: Thomas Huth <1916269@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arichardson th-huth
X-Launchpad-Bug-Reporter: Alexander Richardson (arichardson)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161375459275.29060.15778429539023668893.malonedeb@soybean.canonical.com>
Message-Id: <162090642223.16933.12841846987748781475.malone@soybean.canonical.com>
Subject: [Bug 1916269] Re: TCG: QEMU incorrectly raises exception on SSE4.2
 CRC32 instruction
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 49ee5cdaf91411f5dbad4f08a9f3028bdaaffc29
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
Reply-To: Bug 1916269 <1916269@bugs.launchpad.net>
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


** Tags added: i386 tcg

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916269

Title:
  TCG: QEMU incorrectly raises exception on SSE4.2 CRC32 instruction

Status in QEMU:
  Incomplete

Bug description:
  If I run FreeBSD on QEMU 5.2 with TCG acceleration -cpu Nehalem, I get
  a FPU exception when executing crc32
  (https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=3D253617). This is
  not a problem with the default CPU (or KVM) since that does not
  support SSE 4.2.

  Attaching GDB shows this is triggered in
  target/i386/tcg/translate.c:3067

      /* simple MMX/SSE operation */
      if (s->flags & HF_TS_MASK) {
          gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
          return;
      }

  However, according to
  https://software.intel.com/sites/default/files/m/8/b/8/D9156103.pdf,
  page 61 the CRC32 instruction works no matter what the value of the TS
  bit.

  The code sequence in question is:
  0xffffffff8105a4de <+126>:	f2 48 0f 38 f1 de	crc32q %rsi,%rbx
  0xffffffff8105a4e4 <+132>:	f2 48 0f 38 f1 ca	crc32q %rdx,%rcx.

  This should work even with the FPU disabled.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916269/+subscriptions

