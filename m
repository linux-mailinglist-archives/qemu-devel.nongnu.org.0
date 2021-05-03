Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA4371C2E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:51:18 +0200 (CEST)
Received: from localhost ([::1]:54344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbmv-0005dV-DT
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbhH-0000cb-SQ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:45:29 -0400
Received: from indium.canonical.com ([91.189.90.7]:34846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbh9-0007Nt-Fp
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:45:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldbh7-00045N-UC
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 16:45:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E35182E8135
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 16:45:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 16:33:59 -0000
From: Thomas Huth <1307225@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: brebs gc5 ilya-almametov m-ans-n nbensa oyvinds
 sander-brandenburg th-huth thomas-lindroth tobias-leupold
X-Launchpad-Bug-Reporter: Tobias-leupold (tobias-leupold)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140413204536.17279.23843.malonedeb@chaenomeles.canonical.com>
Message-Id: <162005964010.4503.18437532334780772961.malone@chaenomeles.canonical.com>
Subject: [Bug 1307225] Re: Running a virtual machine on a Haswell system
 produces machine check events
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: e568d1b3cd329d483ef76d5c3532cc7a84224814
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1307225 <1307225@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/101


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #101
   https://gitlab.com/qemu-project/qemu/-/issues/101

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1307225

Title:
  Running a virtual machine on a Haswell system produces machine check
  events

Status in QEMU:
  Expired

Bug description:
  I'm running a virtual Windows SBS 2003 installation on a Xeon E3
  Haswell system running Gentoo Linux. First, I used Qemu 1.5.3 (the
  latest stable version on Gentoo). I got a lot of machine check events
  ("mce: [Hardware Error]: Machine check events logged") in dmesg that
  always looked like (using mcelog):

  Hardware event. This is not a software error.
  MCE 0
  CPU 3 BANK 0
  TIME 1397455091 Mon Apr 14 07:58:11 2014
  MCG status:
  MCi status:
  Corrected error
  Error enabled
  MCA: Internal parity error
  STATUS 90000040000f0005 MCGSTATUS 0
  MCGCAP c09 APICID 6 SOCKETID 0
  CPUID Vendor Intel Family 6 Model 60

  I found this discussion on the vmware community:
  https://communities.vmware.com/thread/452344

  It seems that this is (at least partly) caused by the Qemu machine. I
  switched to Qemu 1.7.0, the first version to use "pc-i440fx-1.7". With
  this version, the errors almost disappeared, but from time to time, I
  still get machine check events. Anyways, they so not seem to affect
  neither the vm, nor the host.

  The Haswell machine has been set up and running for several days
  without a single error message. They only appear when the VM is
  running. so I think this is actually some problem with the Haswell
  architecture (and not a real hardware error).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1307225/+subscriptions

