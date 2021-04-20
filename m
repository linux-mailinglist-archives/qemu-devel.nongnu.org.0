Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C436592A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:43:32 +0200 (CEST)
Received: from localhost ([::1]:59364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYpj1-0001Mt-DE
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYphN-0000bY-A8
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:41:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:54188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYphH-0000xC-Ts
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:41:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYphE-0007XE-Uy
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:41:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CFCFB2E8162
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:41:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 12:26:54 -0000
From: Thomas Huth <1819908@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahasenack th-huth
X-Launchpad-Bug-Reporter: Andreas Hasenack (ahasenack)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155248066265.30093.16981724484173262651.malonedeb@gac.canonical.com>
Message-Id: <161892161485.32560.18332372781159345838.launchpad@soybean.canonical.com>
Subject: [Bug 1819908] Re: slight screen corruption when maximizing window
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 893fd8defb8beab3c5a1cafed39fbd7bd16bfa23
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
Reply-To: Bug 1819908 <1819908@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1819908

Title:
  slight screen corruption when maximizing window

Status in QEMU:
  Incomplete

Bug description:
  Host: Ubuntu disco
  qemu-kvm: 1:3.1+dfsg-2ubuntu2
  libvirt: 5.0.0-1ubuntu2

  Guest: ubuntu bionic
  guest is using cirrus video, with the extra modules kernel package instal=
led and the cirrus kernel module loaded. I also tried QXL, but got the same=
 problem.

  A non-maximized terminal window works just fine. As an example, I run
  "lsmod". It fills the screen, which then scrolls a bit.

  The moment I maximize that window, though, the rendering breaks. I can
  see the commands I type, but not their output. See attached video.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1819908/+subscriptions

