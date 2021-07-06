Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9E83BC577
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:28:11 +0200 (CEST)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cgs-0002zw-Lz
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfW-00008o-2T
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:52048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfU-0003JR-68
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfG-0004wu-J9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1AFE52E83B4
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:34 -0000
From: Launchpad Bug Tracker <1877052@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Expired; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: qemu-20.10
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor paelzer weller-andreas-weller
X-Launchpad-Bug-Reporter: Andreas Weller (weller-andreas-weller)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158875190128.5304.17617014708809905297.malonedeb@soybean.canonical.com>
Message-Id: <162554505427.7821.4198145641179009080.malone@loganberry.canonical.com>
Subject: [Bug 1877052] Re: KVM Win 10 guest pauses after kernel upgrade
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: ebaed6f4d5ba21eeabc7a07e4ebcee748ff3aa4a
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
Reply-To: Bug 1877052 <1877052@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for qemu (Ubuntu) because there has been no activity for 60
days.]

** Changed in: qemu (Ubuntu)
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877052

Title:
  KVM Win 10 guest pauses after kernel upgrade

Status in QEMU:
  Expired
Status in qemu package in Ubuntu:
  Expired

Bug description:
  Hello!
  Unfortunately the bug has apparently reappeared. I have a Windows 10 runn=
ing in a VM, which after my today's "apt upgrade" goes into pause mode afte=
r a few seconds of running time.

  Until yesterday it used to work and I was able to boot the VM. During
  the kernel update (from 5.4.0-28.33 to 5.4.0-29.34) the VM was active
  and then went into pause mode. Even after a reboot of my host system
  the problem still persists: the VM boots for a few seconds and then
  switches to pause mode.

  Current Kernel: Linux andreas-laptop 5.4.0-29-generic #33-Ubuntu SMP
  Wed Apr 29 14:32:27 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

  Maybe relevant logfile lines:
  2020-05-06T07:46:42.857574Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
  2020-05-06T07:46:42.857718Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
  2020-05-06T07:46:42.860567Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
  2020-05-06T07:46:42.860582Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
  2020-05-06T07:47:22.901057Z qemu-system-x86_64: terminating on signal 15 =
from pid 1593 (/usr/sbin/libvirtd)
  2020-05-06 07:47:23.101+0000: shutting down, reason=3Ddestroyed


  Kind regards,
  =C2=A0=C2=A0=C2=A0Andreas

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877052/+subscriptions

