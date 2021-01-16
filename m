Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454712F8B35
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 05:33:15 +0100 (CET)
Received: from localhost ([::1]:43078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0dH0-0005J9-Bg
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 23:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dF9-0004Fj-Nb
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:31:19 -0500
Received: from indium.canonical.com ([91.189.90.7]:49344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dF4-00086u-Nv
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:31:19 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0dF1-0002wI-Jq
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:31:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 78EE22E815D
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:31:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 Jan 2021 04:17:25 -0000
From: Launchpad Bug Tracker <1492649@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andrewjamescollett custin empire glemsom janitor
 jjrcop th-huth
X-Launchpad-Bug-Reporter: Nek (empire)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20150905230202.8521.4531.malonedeb@wampee.canonical.com>
Message-Id: <161077064558.27726.10523966452604121540.malone@loganberry.canonical.com>
Subject: [Bug 1492649] Re: QEMU soundhw HDA huge microphone lag
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 2886910b6d5bdf44e69ea3776b293652c6edb41b
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
Reply-To: Bug 1492649 <1492649@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1492649

Title:
  QEMU soundhw HDA huge microphone lag

Status in QEMU:
  Expired

Bug description:
  I use a Windows 7 x86_64 guest with VGA passthrough and -soundhw hda.
  The audio plays fine, but the microphone input is delayed by more than
  20 seconds.

  -soundhw ac97 does not have this delay but it has choppy sound
  playback and input.

  System:
  Arch linux
  Kernel: 4.1.6-1-ARCH
  Audio hardware: 00:1b.0 Audio device: Intel Corporation 82801JI (ICH10 Fa=
mily) HD Audio Controller
  Audio system: Pulseaudio 6.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1492649/+subscriptions

