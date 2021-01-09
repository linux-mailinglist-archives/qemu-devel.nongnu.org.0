Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987CD2EFDB6
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:31:35 +0100 (CET)
Received: from localhost ([::1]:39028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky5uY-00057y-HY
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5q1-0000CX-5V
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:47438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pz-00072B-DM
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pm-0006xv-FB
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 979612E81B3
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:46 -0000
From: Launchpad Bug Tracker <1689245@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: greencacti janitor th-huth
X-Launchpad-Bug-Reporter: Benjamin Wang (greencacti)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170508082429.4330.4394.malonedeb@soybean.canonical.com>
Message-Id: <161016586655.8490.7413613041402770143.malone@loganberry.canonical.com>
Subject: [Bug 1689245] Re: qcow2 image converted from Photon OS can't be
 started
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: e32dc42bd6c2d43bf50807560e564dbdec0622d3
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
Reply-To: Bug 1689245 <1689245@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1689245

Title:
  qcow2 image converted from Photon OS can't be started

Status in QEMU:
  Expired

Bug description:
  Steps to reproduce the issue:
  1. Download the ovf from this place:
  https://bintray.com/vmware/photon/download_file?file_path=3Dphoton-custom=
-hw10-1.0-62c543d.ova
  2. Extract vmdk from ova file.
  3. Convert from vmdk fromat to qcow2 via qeum-img
  4. Launch the qcow2 image. The VM is started. But there is no any output.=
 CPU usage is 100%

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1689245/+subscriptions

