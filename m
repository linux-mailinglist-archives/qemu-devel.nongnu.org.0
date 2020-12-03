Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2ED2CD8E5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 15:21:38 +0100 (CET)
Received: from localhost ([::1]:38692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkpUH-0006Gb-HG
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 09:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kkpTX-0005lb-PL
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 09:20:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:45030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kkpTV-0004X9-Ms
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 09:20:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kkpTT-0006Es-QC
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 14:20:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C2A852E80DE
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 14:20:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Dec 2020 14:09:43 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1903752@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: avr
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: grimmfrank philmd
X-Launchpad-Bug-Reporter: Frank Grimm (grimmfrank)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <160502888185.27687.6551858213088684132.malonedeb@chaenomeles.canonical.com>
Message-Id: <160700458372.17125.2900079909201616380.malone@wampee.canonical.com>
Subject: [Bug 1903752] Re: qemu-system-avr error: qemu-system-avr: execution
 left flash memory
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="15cd58601e77a273f7390fc4f4fcd16efe814a43"; Instance="production"
X-Launchpad-Hash: 76ec681078b3bde82927f69d68b86842221f3e56
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
Reply-To: Bug 1903752 <1903752@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I can not reproduce.

** Tags added: avr

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1903752

Title:
  qemu-system-avr error: qemu-system-avr: execution left flash memory

Status in QEMU:
  Incomplete

Bug description:
  I compiled QEMU 5.1 from source with target avr-softmmu. Running
  demo.elf from https://github.com/seharris/qemu-avr-tests/blob/master
  /free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf (linked from
  https://www.qemu.org/docs/master/system/target-avr.html) yields the
  following error:

  $ ./qemu-5.1.0/avr-softmmu/qemu-system-avr -machine mega2560 -bios demo.e=
lf
  VNC server running on 127.0.0.1:5900
  qemu-system-avr: execution left flash memory
  Aborted (core dumped)

  I compiled QEMU on Ubuntu Server 20.10 with gcc (Ubuntu
  10.2.0-13ubuntu1) 10.2.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1903752/+subscriptions

