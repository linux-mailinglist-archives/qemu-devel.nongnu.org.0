Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E54B31CCF9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:33:39 +0100 (CET)
Received: from localhost ([::1]:51928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2M6-0003le-0i
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lC2JN-0002ff-4y
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:30:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:43664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lC2JI-00019p-0R
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:30:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lC2JF-00083A-Uo
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 15:30:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E3B922E80FB
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 15:30:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Feb 2021 15:23:32 -0000
From: Philipp Oppermann <1915794@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: phil-opp ubuntu-weilnetz
X-Launchpad-Bug-Reporter: Philipp Oppermann (phil-opp)
X-Launchpad-Bug-Modifier: Philipp Oppermann (phil-opp)
References: <161346747703.23365.3708625175581048243.malonedeb@chaenomeles.canonical.com>
Message-Id: <161348901277.4907.9976105188620705687.malone@gac.canonical.com>
Subject: [Bug 1915794] Re: could not load PC BIOS 'bios-256k.bin' on latest
 Windows exe (*-20210203.exe)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b3a93345a124168b715ec9ae0945884caa15f58f"; Instance="production"
X-Launchpad-Hash: 57878ff4d9505231cf8069b563889ae6f51654b4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1915794 <1915794@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks a lot!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915794

Title:
  could not load PC BIOS 'bios-256k.bin' on latest Windows exe
  (*-20210203.exe)

Status in QEMU:
  Confirmed

Bug description:
  I'm using https://scoop.sh/ to install QEMU on a Windows CI job, which
  is run daily. Since today, the job is failing with an `could not load
  PC BIOS 'bios-256k.bin'` error thrown by QEMU.

  The version that causes this error is: https://qemu.weilnetz.de/w64/2021/=
qemu-w64-setup-20210203.exe#/dl.7z
  The previous version, which worked fine, was: https://qemu.weilnetz.de/w6=
4/2020/qemu-w64-setup-20201124.exe#/dl.7z

  Both CI runs build the exact same code. You can find the full logs at
  https://github.com/rust-
  osdev/x86_64/runs/1908137213?check_suite_focus=3Dtrue (failing) and
  https://github.com/rust-
  osdev/x86_64/runs/1900698412?check_suite_focus=3Dtrue (previous).

  (I hope this is the right place to report this issue.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915794/+subscriptions

