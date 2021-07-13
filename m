Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F0D3C6CD1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:03:08 +0200 (CEST)
Received: from localhost ([::1]:39920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3EJn-0005OQ-Ni
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3EHr-00030v-KE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:01:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:38970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3EHp-0004sS-3F
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:01:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3EHk-00012J-7d
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:01:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 350772E8167
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:01:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Jul 2021 08:51:32 -0000
From: Alexander Richardson <1916269@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arichardson janitor th-huth
X-Launchpad-Bug-Reporter: Alexander Richardson (arichardson)
X-Launchpad-Bug-Modifier: Alexander Richardson (arichardson)
References: <161375459275.29060.15778429539023668893.malonedeb@soybean.canonical.com>
Message-Id: <162616629280.24709.9078223427806292512.malone@soybean.canonical.com>
Subject: [Bug 1916269] Re: TCG: QEMU incorrectly raises exception on SSE4.2
 CRC32 instruction
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 6fd369874073ec0f4346d746bbad8916180979c1
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

Reported on GitLab as https://gitlab.com/qemu-project/qemu/-/issues/427

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #427
   https://gitlab.com/qemu-project/qemu/-/issues/427

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916269

Title:
  TCG: QEMU incorrectly raises exception on SSE4.2 CRC32 instruction

Status in QEMU:
  Expired

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

