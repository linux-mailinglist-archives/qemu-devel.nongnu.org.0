Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C08D2FAF8E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:44:23 +0100 (CET)
Received: from localhost ([::1]:38770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1isQ-0007LD-Dg
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ig6-00014C-AD
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:58052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ig3-000511-Ds
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1ifr-000486-7w
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:23 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3ADBD2E8145
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 04:17:54 -0000
From: Launchpad Bug Tracker <1391942@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: lttng trace ust
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fdeslaur janitor stefanha th-huth
X-Launchpad-Bug-Reporter: Francis Deslauriers (fdeslaur)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20141112160138.19244.98743.malonedeb@gac.canonical.com>
Message-Id: <161102987493.12094.8977380722787116108.malone@loganberry.canonical.com>
Subject: [Bug 1391942] Re: Unnecessary events option of the trace argument
 with UST backend
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 7f0b3d1b688413655d7a6f581024cfd576ee6901
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
Reply-To: Bug 1391942 <1391942@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1391942

Title:
  Unnecessary events option of the trace argument with UST backend

Status in QEMU:
  Expired

Bug description:
  When running configure with the --enable-trace-backends=3Dust option and =
compiling. =

  The user should not have to specify a the "events" and "file" options bec=
ause they are not used with that tracing framework.

  Right now, in order the use this option the need to specify a dummy
  events file.

  This fails:
  $> qemu-system-x86_64 -hda debian_wheezy_amd64_standard.qcow2 -trace -m 5=
12
  qemu-system-x86_64: -trace -m: Invalid parameter '-m'

  This works:
  $> qemu-system-x86_64 -hda debian_wheezy_amd64_standard.qcow2 -trace even=
ts=3Ddummy-events.txt -m 512
  VNC server running on `127.0.0.1:5900'

  I am using version:
  $> qemu-system-x86_64 --version
  QEMU emulator version 2.1.90, Copyright (c) 2003-2008 Fabrice Bellard

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1391942/+subscriptions

