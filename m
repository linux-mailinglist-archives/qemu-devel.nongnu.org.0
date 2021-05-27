Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E47A3928ED
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:52:30 +0200 (CEST)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAof-0005TG-Hv
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lmAn3-00041q-P3
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:50:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:60722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lmAn1-0000n1-Nc
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:50:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lmAmz-00015u-8l
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 07:50:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 410952E8010
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 07:50:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 May 2021 07:45:23 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1879672@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange jnsnow philmd ubuntu-weilnetz
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <158996968484.21371.12685815665992748631.malonedeb@wampee.canonical.com>
Message-Id: <162210152334.4331.2899341087253101294.malone@gac.canonical.com>
Subject: [Bug 1879672] Re: QEMU installer with WHPX support
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: b176be96c54ac9ea0df8305f24ced7a3b4d704db
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
Reply-To: Bug 1879672 <1879672@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

But looking at the latest pipeline:
https://gitlab.com/qemu-project/qemu/-/pipelines/310113928
in particular the cross-win64-system job:
https://gitlab.com/qemu-project/qemu/-/jobs/1296341064

WHPX isn't built anymore:

  Targets and accelerators
                      KVM support: NO
                      HAX support: YES
                      HVF support: NO
                     WHPX support: NO
                     NVMM support: NO
                      Xen support: NO
                      TCG support: YES
                      TCG backend: native (x86_64)

We likely lost the coverage with commit 93cc0506f6c
("tests/docker: Use Fedora containers for MinGW cross-builds in the gitlab-=
CI")

Should we open a new issue?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879672

Title:
  QEMU installer with WHPX support

Status in QEMU:
  Fix Released

Bug description:
  People often ask the community to add WHPX support to the QEMU installer =
for Windows,
  but it is impossible due to the license limitations of the WHPX SDK.

  The WinHvEmulation.h and WinHvPlatform.h header files needed are "All
  rights reserved".

  However these headers only contain struct definitions and integer constan=
ts,
  no functional code in macros or inline functions. See:
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg645815.html
  It is questionable whether the headers alone can be considered copyrighta=
ble material.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1879672/+subscriptions

