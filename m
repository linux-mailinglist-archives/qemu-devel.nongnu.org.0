Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF09230C62
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 16:26:55 +0200 (CEST)
Received: from localhost ([::1]:57572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0QZC-0007fI-Iq
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 10:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k0QY5-0007CA-5O
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 10:25:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:37872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k0QY3-0000vC-9K
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 10:25:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k0QY1-00081e-H3
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 14:25:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5BCBE2E80D2
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 14:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2020 14:16:18 -0000
From: Max Reitz <1888467@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arrowfeng xanclic
X-Launchpad-Bug-Reporter: dunfeng zhang (arrowfeng)
X-Launchpad-Bug-Modifier: Max Reitz (xanclic)
References: <159540494097.10238.3390638369680947345.malonedeb@gac.canonical.com>
Message-Id: <159594577845.3099.16156744700849425786.malone@gac.canonical.com>
Subject: [Bug 1888467] Re: qemu-img http convert bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: afb54d690fe480dfd8dd2e07b7dc1d3fbd2120eb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:25:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1888467 <1888467@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because nobody has implemented it so far.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888467

Title:
  qemu-img http convert bug

Status in QEMU:
  New

Bug description:
  Hello, Why the file sizes of http conversion and local conversion are
  inconsistent?

  Use the http method of qemu-img for conversion. The size of some formats =
after conversion is different from the local method of qemu-img. Such as vh=
d, vdi. qcow2 and vmdk are normal=E3=80=82
  My image size is 40 G, raw format.

  The source is the same file, but the access method is different
  http method of qemu-img=EF=BC=9A qemu-img convert -f raw -O vdi http://xx=
x xxx.vdi=EF=BC=8819G=EF=BC=8Cafter conversion=EF=BC=89
  local method of qemu-img=EF=BC=9A qemu-img convert -f raw -O vdi xxx.raw =
xxx.vdi=EF=BC=883G=EF=BC=8Cafter conversion=EF=BC=89

  thank you

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888467/+subscriptions

