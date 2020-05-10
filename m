Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0C01CC9AB
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 11:21:31 +0200 (CEST)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXi9K-0000bj-Tw
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 05:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXi8b-00005c-T0
 for qemu-devel@nongnu.org; Sun, 10 May 2020 05:20:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:36996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXi8a-0005CG-7A
 for qemu-devel@nongnu.org; Sun, 10 May 2020 05:20:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jXi8Y-0007lI-GO
 for <qemu-devel@nongnu.org>; Sun, 10 May 2020 09:20:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7AECF2E8106
 for <qemu-devel@nongnu.org>; Sun, 10 May 2020 09:20:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2020 09:06:23 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user ppc64 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier mptcultist
X-Launchpad-Bug-Reporter: Catherine A. Frederick (mptcultist)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <158906134520.4878.9001427424029475940.malonedeb@chaenomeles.canonical.com>
Message-Id: <158910158324.5113.16918601659106236949.malone@soybean.canonical.com>
Subject: [Bug 1877794] Re: Constant Folding on 64-bit Subtraction causes
 SIGILL on linux-user glxgears ppc64le to x86_64 by way of generating bad
 shift instruction with c=-1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c896d2da5858d5e2f6720c6dddd8b92c9f694a4d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 04:45:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1877794 <1877794@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Which version of qemu and glxgears do you use?

Tested with qemu-4.2 and qemu-5.0 and debian/sid mesa-utils-8.4.0-1+b1
and it works fine.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877794

Title:
  Constant Folding on 64-bit Subtraction causes SIGILL on linux-user
  glxgears ppc64le to x86_64 by way of generating bad shift instruction
  with c=3D-1

Status in QEMU:
  New

Bug description:
  Hello, I've been recently working on my own little branch of QEMU
  implementing the drm IOCTLs, when I discovered that glxgears seems to
  crash in GLXSwapBuffers(); with a SIGILL. I investigated this for
  about 2 weeks, manually trying to trace the call stack, only to find
  that we seemingly crash in a bad shift instruction. Originally
  intended to be an shr_i64 generated to an RLDICL, we end up with an
  all ones(-1) c value, which gets thrown to the macro for generating
  the MB, and replaces the instruction with mostly ones. This new
  instruction, FFFFFFE0 is invalid on ppc64le, and crashes in a host
  SIGILL in codegen_buffer. I tried to see if the output of translate.c
  had this bad instruction, but all I got were two (shr eax, cl)
  instructions, and upon creating a test program with shr (eax, cl) in
  it, nothing happened. Then figuring that there was nothing actually
  wrong with the instruction in the first place, I turned my eye to the
  optimizer, and completely disabled constant folding for arithmetic
  instructions.  This seemed to actually resolve the issue, and then I
  slowly enabled constant folding again on various instructions only to
  find that enabling not on the shifts, but on subtraction seemed to
  cause the bug to reappear. I am bewildered and frankly at this point
  I'm not sure I have a chance in hell of figuring out what causes it,
  so I'm throwing it here.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877794/+subscriptions

