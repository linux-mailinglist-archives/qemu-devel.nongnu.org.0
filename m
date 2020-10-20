Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D6A28C8A7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 08:33:28 +0200 (CEST)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSDsF-00082H-79
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 02:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kSDph-00071U-M7
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 02:30:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:58800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kSDpd-0006AR-6r
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 02:30:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kSDpb-0004RO-3R
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 06:30:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 16E472E80DF
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 06:30:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2020 06:20:46 -0000
From: Thomas Huth <1775702@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: windows10
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aderumier-odiso costinel giox069 h-sieger ken20001
 lemosov th-huth
X-Launchpad-Bug-Reporter: Giovanni Panozzo (giox069)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152840439622.3676.18260529468873821664.malonedeb@chaenomeles.canonical.com>
Message-Id: <160257004641.3087.2330161343565280681.malone@soybean.canonical.com>
Subject: [Bug 1775702] Re: High host CPU load and slower guest after upgrade
 guest OS Windows 10 to ver 1803
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="781851f4dc11c93bc506eb54e6a0d35c919a1ce6"; Instance="production"
X-Launchpad-Hash: d2a9c0b2b5e0ddfdd55fa4b0813a0e71dca6c733
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:30:43
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1775702 <1775702@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gannet, SPICE Guest Tools is certainly a different problem, you should
report that to the spice project instead. And since the original problem
was apparently fixed via hv_synic / hv_stimer (if I got the comments
right), I'm closing this ticket now.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1775702

Title:
  High host CPU load and slower guest after upgrade guest OS Windows 10
  to ver 1803

Status in QEMU:
  Fix Released

Bug description:
  After upgrading Windows 10 guest to version 1803, guests VM runs
  slower and there is high host CPU load even when guest is almost idle.
  Did not happened with windows 10 up to version 1709.

  See my 1st report here:
  https://askubuntu.com/questions/1033985/kvm-high-host-cpu-load-after-upgr=
ading-vm-to-windows-10-1803

  Another user report is here:
  https://lime-technology.com/forums/topic/71479-windows-10-vm-cpu-usage/

  Tested on: Ubuntu 16.04 with qemu 2.5.0 and i3-3217U, Arch with qemu
  2.12 i5-7200U, Ubuntu 18.04 qemu 2.11.1 AMD FX-4300. All three
  platform showing the same slowdown and higher host cpu load with
  windows 10 1803 VM compared to windows 10 1709 VM.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1775702/+subscriptions

