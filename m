Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3452F0515
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:29:53 +0100 (CET)
Received: from localhost ([::1]:53052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySMS-0004PC-MR
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIl-0007my-Vg
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:03 -0500
Received: from indium.canonical.com ([91.189.90.7]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIi-0000gR-Ly
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySIg-0000E8-Jo
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 575D92E8144
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:39 -0000
From: Launchpad Bug Tracker <1759492@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth yushb
X-Launchpad-Bug-Reporter: Spencer Yu (yushb)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152222016058.20812.16076175479601945611.malonedeb@chaenomeles.canonical.com>
Message-Id: <161025225937.18863.15561049224249163205.malone@loganberry.canonical.com>
Subject: [Bug 1759492] Re: suspend/resume is not supported for vm with tpm
 device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 106c9af64723b3daa65eff15c1f8f6cc4aa0b8b1
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
Reply-To: Bug 1759492 <1759492@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1759492

Title:
  suspend/resume is not supported for vm with tpm device

Status in QEMU:
  Expired

Bug description:
  I have used libvirt with qemu to create a vm with tpm device, when I susp=
end the vm and resume it, libvirt will
  raise error:
  libvirtError: internal error: process exited while connecting to monitor:=
 Enter char_pty_open
  I find some materials:
  https://wiki.qemu.org/Features/TPM
  https://lists.gnu.org/archive/html/qemu-devel/2015-05/msg05355.html
  They present qemu haven't supported tpm suspend/resume, Does someone have=
 any advice on how to resolve the problem?

  qemu version: 2.10.2
  vm image version: centos 7.2

  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1759492/+subscriptions

