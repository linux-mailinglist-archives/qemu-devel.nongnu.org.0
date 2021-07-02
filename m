Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923403B9BA1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:46:17 +0200 (CEST)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzB4C-0000Zv-MQ
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkz-0000pI-42
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:26 -0400
Received: from indium.canonical.com ([91.189.90.7]:43628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAks-0002c3-1D
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:24 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzAke-00050t-Bs
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:26:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D35972E8262
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1785902@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor metux-its schoenebeck th-huth
X-Launchpad-Bug-Reporter: Enrico Weigelt, metux IT consult (metux-its)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153367731299.17920.17499928996818370996.malonedeb@soybean.canonical.com>
Message-Id: <162519944137.31921.8059170502607228057.malone@loganberry.canonical.com>
Subject: [Bug 1785902] Re: local/9pfs: Too many levels of symbolic links
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 89f2b8a2ae07264e0b3dec8fb7ea78585e296a08
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
Reply-To: Bug 1785902 <1785902@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1785902

Title:
  local/9pfs: Too many levels of symbolic links

Status in QEMU:
  Expired

Bug description:
  Version: 2.9.1

  The primary symptom is resolving symlink fails w/ error "too many
  levels of symbolic links".

  My analysis showed that local_readlink() uses local_open_nofollow() to
  open the file and then tries to read it. local_open_nofollow() then
  tries to open the file w/ O_NOFOLLOW, which obviously fails if the
  requested file is a symlink.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1785902/+subscriptions

