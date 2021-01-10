Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE092F0524
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:36:46 +0100 (CET)
Received: from localhost ([::1]:49570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyST7-0006UV-Fm
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySN2-0005nQ-Nh
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:30:29 -0500
Received: from indium.canonical.com ([91.189.90.7]:41250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySN0-0002ai-4M
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:30:28 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySMy-000122-HS
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:30:24 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 82C642E8137
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:30:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:43 -0000
From: Launchpad Bug Tracker <1174654@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=High; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Invalid; importance=High; assignee=None; 
X-Launchpad-Bug-Tags: windows windows-xp
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bonzini denc716 fgouget hexmode j1n-po5ias-xqt
 janitor jbasila jyrgen katmeef laplandersan serge-hallyn th-huth varacanero
X-Launchpad-Bug-Reporter: Maxim Loparev (laplandersan)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20130430080722.32341.54160.malonedeb@gac.canonical.com>
Message-Id: <161025226398.18863.3907953309828541344.malone@loganberry.canonical.com>
Subject: [Bug 1174654] Re: qemu-system-x86_64 takes 100% CPU after host
 machine resumed from suspend to ram
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: f6ed88f298207104f5a8ece81e470a4f6dadf01e
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
Reply-To: Bug 1174654 <1174654@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1174654

Title:
  qemu-system-x86_64 takes 100% CPU after host machine resumed from
  suspend to ram

Status in QEMU:
  Expired
Status in qemu package in Ubuntu:
  Invalid

Bug description:
  I have Windows XP SP3  inside qemu VM. All works fine in 12.10. But
  after upgraiding to 13.04 i have to restart the VM each time i
  resuming my host machine, because qemu process starts to take CPU
  cycles and OS inside VM is very slow and sluggish. However it's still
  controllable and could be shutdown by itself.

  According to the taskmgr any active process takes 99% CPU. It's not
  stuck on some single process.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1174654/+subscriptions

