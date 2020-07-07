Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78D21641A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 04:42:05 +0200 (CEST)
Received: from localhost ([::1]:37234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsdYa-00023z-5v
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 22:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jsdXT-0000jm-FZ
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 22:40:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:56722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jsdXM-0001vq-Ir
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 22:40:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jsdXJ-0002hO-SZ
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 02:40:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8638C2E810D
 for <qemu-devel@nongnu.org>; Tue,  7 Jul 2020 02:40:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2020 02:25:44 -0000
From: Alex Austin <1886602@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: circuitsoft
X-Launchpad-Bug-Reporter: Alex Austin (circuitsoft)
X-Launchpad-Bug-Modifier: Alex Austin (circuitsoft)
Message-Id: <159408874500.32011.1427435858163411654.malonedeb@gac.canonical.com>
Subject: [Bug 1886602] [NEW] Windows 10 very slow with OVMF
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ffd32ad7291fe66b5578d7c1407aaae58d1e0170";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 501d747457a2cfc10c2dddec9c7d8084ced7b115
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 22:40:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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

Public bug reported:

Debian Buster

Kernel 4.19.0-9-amd64
qemu-kvm 1:3.1+dfsg-8+deb10u5
ovmf 0~20181115.85588389-3+deb10u1

Machine: Thinkpad T470, i7-7500u, 20GB RAM
VM: 4 CPUs, 8GB RAM, Broadwell-noTSX CPU Model

Windows 10, under this VM, seems to be exceedingly slow with all
operations. This is a clean install with very few services running. Task
Manager can take 30% CPU looking at an idle system.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886602

Title:
  Windows 10 very slow with OVMF

Status in QEMU:
  New

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

