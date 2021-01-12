Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E62F2732
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:40:24 +0100 (CET)
Received: from localhost ([::1]:35402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBTj-0000L7-EU
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:40:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFw-0008GY-GE
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:26:08 -0500
Received: from indium.canonical.com ([91.189.90.7]:52370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFs-0000u0-MK
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:26:08 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFf-0004Tp-B0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4C0D02E8140
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:31 -0000
From: Launchpad Bug Tracker <1782107@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: dh error
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor nadavr pmaydell th-huth
X-Launchpad-Bug-Reporter: Nadav Ruskin (nadavr)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153181978967.32137.15387354948382398538.malonedeb@chaenomeles.canonical.com>
Message-Id: <161042505136.10246.1558629790485906441.malone@loganberry.canonical.com>
Subject: [Bug 1782107] Re: Random errors when emulating armv7 and using dh
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: 4ffa0bc74b620d32d67d3dfc256acbe85d7333b4
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
Reply-To: Bug 1782107 <1782107@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1782107

Title:
  Random errors when emulating armv7 and using dh

Status in QEMU:
  Expired

Bug description:
  Howdy,
  I'm encountering random errors when using qemu to cross-package my projec=
t using dh. In previous iterations of my project it would only fail once ev=
ery two attempts. Now it fails every time.

  Example error included.


  If you'd like to try and replicate this error, a version of my project is=
 publicly available with simple instructions on how to package it (using qe=
mu) here:
  https://github.com/Nadav-Ruskin/configsite

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1782107/+subscriptions

