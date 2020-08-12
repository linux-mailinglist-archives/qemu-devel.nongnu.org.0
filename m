Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DC92428E2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 13:47:11 +0200 (CEST)
Received: from localhost ([::1]:56212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5pDq-0004J1-Et
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 07:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k5pCk-0003FL-BQ
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 07:46:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:55292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k5pCi-0005rb-L3
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 07:46:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k5pCh-000786-0G
 for <qemu-devel@nongnu.org>; Wed, 12 Aug 2020 11:45:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E2FE52E809C
 for <qemu-devel@nongnu.org>; Wed, 12 Aug 2020 11:45:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2020 11:38:18 -0000
From: "Laszlo Ersek \(Red Hat\)" <1886602@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: circuitsoft lersek
X-Launchpad-Bug-Reporter: Alex Austin (circuitsoft)
X-Launchpad-Bug-Modifier: Laszlo Ersek (Red Hat) (lersek)
References: <159408874500.32011.1427435858163411654.malonedeb@gac.canonical.com>
Message-Id: <159723229878.6313.16578583700046608396.malone@soybean.canonical.com>
Subject: [Bug 1886602] Re: Windows 10 very slow with OVMF
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5170832016d8df0f5332d94d6c7dcff1e52317b1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 06:10:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1886602 <1886602@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inactive for more than a month, significant amount of info was not
provided. Closing.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886602

Title:
  Windows 10 very slow with OVMF

Status in QEMU:
  Incomplete

Bug description:
  Debian Buster

  Kernel 4.19.0-9-amd64
  qemu-kvm 1:3.1+dfsg-8+deb10u5
  ovmf 0~20181115.85588389-3+deb10u1

  Machine: Thinkpad T470, i7-7500u, 20GB RAM
  VM: 4 CPUs, 8GB RAM, Broadwell-noTSX CPU Model

  Windows 10, under this VM, seems to be exceedingly slow with all
  operations. This is a clean install with very few services running.
  Task Manager can take 30% CPU looking at an idle system.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1886602/+subscriptions

