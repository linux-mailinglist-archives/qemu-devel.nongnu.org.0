Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141D7381819
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:03:29 +0200 (CEST)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhs4u-0004Ri-5m
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhs2Q-00022E-Ab
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:00:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:54726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhs2O-0000F9-Dj
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:00:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhs2M-0007bT-Ng
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:00:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B242A2E8186
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:00:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 10:53:15 -0000
From: Thomas Huth <1912934@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bruno-clisp th-huth
X-Launchpad-Bug-Reporter: Bruno Haible (bruno-clisp)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161147764119.28788.10484645020687886149.malonedeb@soybean.canonical.com>
Message-Id: <162107599548.21648.16713984551732373990.malone@soybean.canonical.com>
Subject: [Bug 1912934] Re: QEMU emulation of fmadds instruction on powerpc64le
 is buggy
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 8b3cd07d9649ecf8d6b618aaf33d8ecf52f4e54a
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
Reply-To: Bug 1912934 <1912934@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/312


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #312
   https://gitlab.com/qemu-project/qemu/-/issues/312

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912934

Title:
  QEMU emulation of fmadds instruction on powerpc64le is buggy

Status in QEMU:
  Expired

Bug description:
  The attached program test-fmadds.c tests the fmadds instruction on
  powerpc64le.

  Result on real hardware (POWER8E processor):
  $ ./a.out ; echo $?
  0

  Result in Alpine Linux 3.13/powerpcle, emulated by QEMU 5.0.0 on Ubuntu 1=
6.04:
  $ ./a.out ; echo $?
  32

  Result in Debian 8.6.0/ppc64el, emulated by QEMU 2.9.0 on Ubuntu 16.04:
  $ ./a.out ; echo $?
  32

  Through 'nm --dynamic qemu-system-ppc64 | grep fma' I can see that
  QEMU is NOT using the fmaf() or fma() function from the host system's
  libc; this function is working fine in glibc of the host system (see
  https://www.gnu.org/software/gnulib/manual/html_node/fmaf.html ).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912934/+subscriptions

