Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3E732D569
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:37:25 +0100 (CET)
Received: from localhost ([::1]:47406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHp6S-0004Mv-Kk
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lHp4q-0003O1-84
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:35:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:56990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lHp4m-00024f-DE
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:35:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lHp4i-0002gX-Mh
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 14:35:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AAD012E8166
 for <qemu-devel@nongnu.org>; Thu,  4 Mar 2021 14:35:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Mar 2021 14:26:49 -0000
From: briancain <1916394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=brian.cain@gmail.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: brian-cain fredb74
X-Launchpad-Bug-Reporter: Frederic Bezies (fredb74)
X-Launchpad-Bug-Modifier: briancain (brian-cain)
References: <161392715224.29500.2044106040123688461.malonedeb@soybean.canonical.com>
Message-Id: <161486801062.12805.7330951596787727506.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1916394] Re: [git] Cannot build qemu: FAILED:
 target/hexagon/semantics_generated.pyinc 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cc773b502c7eaaa848fbc2be1565e01aee62f701"; Instance="production"
X-Launchpad-Hash: f89fc281570cf362519cabf662d0417b27eafff7
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
Reply-To: Bug 1916394 <1916394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916394

Title:
  [git] Cannot build qemu: FAILED:
  target/hexagon/semantics_generated.pyinc

Status in QEMU:
  Invalid

Bug description:
  Hello.

  I'm using Archlinux and I maintain qemu-git AUR package.

  I tried to build Qemu at commit
  4115aec9af2a3de5fa89a0b1daa12debcd7741ff but it stops with this error
  message:

  Found ninja-1.10.2 at /usr/bin/ninja
  [632/9068] Generating semantics_generated.pyinc with a custom command
  FAILED: target/hexagon/semantics_generated.pyinc
  @INPUT@ target/hexagon/semantics_generated.pyinc
  /bin/sh: line 1: @INPUT@: command not found
  [637/9068] Compiling C object fsdev/vi...proxy-helper.p/virtfs-proxy-help=
er.c.o
  ninja: build stopped: subcommand failed.

  ninja version: 1.10.2
  meson version: 0.57.1

  Downgrading meson doesn't change anything.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916394/+subscriptions

