Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBC42D8D12
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 13:17:52 +0100 (CET)
Received: from localhost ([::1]:60862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koQJz-0005a4-Bx
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 07:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1koQHw-00057r-8K
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 07:15:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:36712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1koQHt-0002To-Ee
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 07:15:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1koQHs-0005Bw-0K
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:15:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DFB742E8137
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:15:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Dec 2020 12:09:37 -0000
From: Daniel Almeida Moreira <1907953@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bboydanyel27
X-Launchpad-Bug-Reporter: Daniel Almeida Moreira (bboydanyel27)
X-Launchpad-Bug-Modifier: Daniel Almeida Moreira (bboydanyel27)
Message-Id: <160786137737.10666.4821083762716127429.malonedeb@wampee.canonical.com>
Subject: =?utf-8?q?=5BBug_1907953=5D_=5BNEW=5D_pkg_install_qemu-system-x86?=
 =?utf-8?q?=5F64__n=C3=A3o_funciona_qemu_5=2E2=2E0?=
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 8e91f777436b40b58597155f57479675a083d491
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1907953 <1907953@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

A qemu funcionava mais quando atualizei para 5.2.0 n=C3=A3o iniciar o Windo=
ws
s=C3=B3 fica tela preta quero voltar para anterior mais n=C3=A3o consigo

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907953

Title:
  pkg install qemu-system-x86_64  n=C3=A3o funciona qemu 5.2.0

Status in QEMU:
  New

Bug description:
  A qemu funcionava mais quando atualizei para 5.2.0 n=C3=A3o iniciar o
  Windows s=C3=B3 fica tela preta quero voltar para anterior mais n=C3=A3o =
consigo

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907953/+subscriptions

