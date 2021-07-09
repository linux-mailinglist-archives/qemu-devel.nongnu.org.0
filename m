Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270233C1E40
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:27:55 +0200 (CEST)
Received: from localhost ([::1]:42780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1i7F-0008Ea-NS
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5H-0005MQ-0i
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:25:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:60112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5E-00018c-LG
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:25:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i59-0005E8-Bc
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:25:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2C8A42E817F
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:27 -0000
From: Launchpad Bug Tracker <1902777@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: vmx whpx
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor rcprior th-huth
X-Launchpad-Bug-Reporter: Rui Prior (rcprior)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160443143159.15248.310211538041972922.malonedeb@wampee.canonical.com>
Message-Id: <162580424770.19936.10782260330379164556.malone@loganberry.canonical.com>
Subject: [Bug 1902777] Re: qemu with whpx acceleration crashes with vmx=on
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: ea08a36bd9944d52ee23c932bd674534573bd25d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1902777 <1902777@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1902777

Title:
  qemu with whpx acceleration crashes with vmx=3Don

Status in QEMU:
  Expired

Bug description:
  Under Windows 10, qemu crashes when using whpx acceleration and the vmx=
=3Don option.  The reported error is
    qemu-system-x86_64.exe: WHPX: Unexpected VP exit code 4
  Before the error, it reports
    Windows Hypervisor Platform accelerator is operational

  The command line is the following:
    "C:\Program Files\qemu\qemu-system-x86_64.exe" -accel whpx -cpu qemu64,=
vmx=3Don
  It crashes with any model of CPU as long as the "vmx=3Don" option is adde=
d.  Without this option it runs fine (but no nested virtualization).

  My processor is an Intel i7-10510U, and I am running Windows 10 2004
  (build 19041.572).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1902777/+subscriptions

