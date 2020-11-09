Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F042AC3FE
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 19:39:08 +0100 (CET)
Received: from localhost ([::1]:39368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcC4J-00087C-I1
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 13:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcC0u-0004wp-Cj
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 13:35:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:57202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcC0r-0000yZ-NK
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 13:35:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcC0q-0005Xi-AO
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 18:35:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 49F4B2E811E
 for <qemu-devel@nongnu.org>; Mon,  9 Nov 2020 18:35:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2020 18:29:09 -0000
From: Thomas Huth <1707587@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dean.yu th-huth
X-Launchpad-Bug-Reporter: Dean Yu (dean.yu)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <150148647956.21168.8991936268778990991.malonedeb@wampee.canonical.com>
Message-Id: <160494654949.17957.10799122850508808018.malone@soybean.canonical.com>
Subject: [Bug 1707587] Re: Read certificate from USB key failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: a12e4e1aa0c2caca2b935e82222c24ecbed98db4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 11:16:03
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1707587 <1707587@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Thank you and sorry for the inconvenience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1707587

Title:
  Read certificate from USB key failed

Status in QEMU:
  Incomplete

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

