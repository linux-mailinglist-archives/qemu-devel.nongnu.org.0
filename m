Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81251D02DC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 01:06:35 +0200 (CEST)
Received: from localhost ([::1]:54616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYdys-0004V8-AI
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 19:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jYdy9-00043s-9G
 for qemu-devel@nongnu.org; Tue, 12 May 2020 19:05:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:50472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jYdy6-00008V-5a
 for qemu-devel@nongnu.org; Tue, 12 May 2020 19:05:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jYdy3-0004ek-Rl
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 23:05:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CC5C42E8109
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 23:05:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2020 22:57:56 -0000
From: "Catherine A. Frederick" <1877794@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user ppc64 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier mptcultist
X-Launchpad-Bug-Reporter: Catherine A. Frederick (mptcultist)
X-Launchpad-Bug-Modifier: Catherine A. Frederick (mptcultist)
References: <158906134520.4878.9001427424029475940.malonedeb@chaenomeles.canonical.com>
Message-Id: <158932427700.2469.14075045252725089747.malone@gac.canonical.com>
Subject: [Bug 1877794] Re: Constant Folding on 64-bit Subtraction causes
 SIGILL on linux-user glxgears ppc64le to x86_64 by way of generating bad
 shift instruction with c=-1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="013b6f2a3f3ba130b50b9eee1a89957ee38a5c15";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: ca586d7441c136fdfea56167d51f4e0476d59030
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 18:06:09
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

I'm marking this invalid and moving on because it isn't replicable on
upstream due to the lack of DRM support and because I'll probably just
figure it out myself. (if anyone has somewhere better than tcg/README.md
to learn TCG implementation details, I would appreciate it.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877794

Title:
  Constant Folding on 64-bit Subtraction causes SIGILL on linux-user
  glxgears ppc64le to x86_64 by way of generating bad shift instruction
  with c=3D-1

Status in QEMU:
  Invalid

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

