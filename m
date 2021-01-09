Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13942EFDB1
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:29:01 +0100 (CET)
Received: from localhost ([::1]:58782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky5s4-0001ev-MO
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pm-0008Kq-VL
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:38 -0500
Received: from indium.canonical.com ([91.189.90.7]:47092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pl-0006yI-7N
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5ph-0007Hc-Jv
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B3B182E8194
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:50 -0000
From: Launchpad Bug Tracker <1707587@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dean.yu janitor th-huth
X-Launchpad-Bug-Reporter: Dean Yu (dean.yu)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150148647956.21168.8991936268778990991.malonedeb@wampee.canonical.com>
Message-Id: <161016587086.8490.13177805047818984080.malone@loganberry.canonical.com>
Subject: [Bug 1707587] Re: Read certificate from USB key failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: b288c0c4474a9d3a3673006887406b2dae13e3d3
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
Reply-To: Bug 1707587 <1707587@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1707587

Title:
  Read certificate from USB key failed

Status in QEMU:
  Expired

Bug description:
  QEMU release version: qemu-2.9.0
  VM operation system: win7 32bit

  I have an usb key which can be redirected and recognized in VM.
  However, it is failed to get the certificate when using the official
  application for this usb key. What's more, the whole app is stalled
  untill this usb key detached from VM.

  As I researched, this usb key uses interrupt transfers when
  application trying to read certificate from it. Problem is that some
  certificate data abandoned by "usbredir_stop_interrupt_receiving" and
  "usbredir_stop_ep". The two functions use "usbredir_free_bufpq" to
  clear the buffered usb packets, even the certificate remain in the
  bufpq.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1707587/+subscriptions

