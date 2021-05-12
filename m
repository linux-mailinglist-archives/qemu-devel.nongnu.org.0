Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E637BC00
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:42:03 +0200 (CEST)
Received: from localhost ([::1]:45000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgnFb-000534-1E
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnEc-0004NE-SC
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:41:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:38544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnEa-0000Ti-KN
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:41:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgnEV-0006I2-R2
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:40:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 83B562E8194
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:40:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 11:31:40 -0000
From: Thomas Huth <1909921@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user vcpu
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee pmaydell snoobz th-huth
X-Launchpad-Bug-Reporter: Snoobz (snoobz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160969474752.18413.12452840655391947769.malonedeb@gac.canonical.com>
Message-Id: <162081910073.31027.12775901495826694640.malone@gac.canonical.com>
Subject: [Bug 1909921] Re: Raspberry Pi 4 qemu:handle_cpu_signal received
 signal outside vCPU context @ pc=0xffff87709b0e
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: aa436bac5ebf8afb8202e54388105d5b4750ca42
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
Reply-To: Bug 1909921 <1909921@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, apparently nobody got a clue what might have gone wrong here (or
simply not enough spare time to look at this issue), but since it's
working for you now with a different distro, I'm closing this ticket
now.

** Changed in: qemu
       Status: New =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909921

Title:
   Raspberry Pi 4 qemu:handle_cpu_signal received signal outside vCPU
  context @ pc=3D0xffff87709b0e

Status in QEMU:
  Won't Fix

Bug description:
  Hello,

  I have a Raspberry Pi 4 with an ESXi hypervisor installed on it (ESXi ARM=
 Edition).
  I created a CentOS 7 VM on it and I'm using a Docker container which is r=
unning qemu inside it.

  This container is a Debian Bullseye OS and I'm using qemu-i386 to start m=
y application inside it.
  The error given by qemu is the following :

  qemu:handle_cpu_signal received signal outside vCPU context @ pc=3D0xffff=
9d5f9b0e
  qemu:handle_cpu_signal received signal outside vCPU context @ pc=3D0xffff=
82f29b0e

  (The pc=3D value is always different, I guess it is randomly generated).

  My qemu version is : qemu-i386 version 5.1.0 (Debian 1:5.1+dfsg-4+b1)

  Could you please help me? Why am I facing this error?

  Feel free to ask any questions regarding this matter in order to find
  a solution to it!

  Regards

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909921/+subscriptions

