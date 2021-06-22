Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5513AFC03
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:35:57 +0200 (CEST)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvY8i-0003Af-Qt
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzX-0006mg-Jm
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:27 -0400
Received: from indium.canonical.com ([91.189.90.7]:55942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzS-0004vh-Sq
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzD-00013W-Nl
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AA52D2E81D1
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:39 -0000
From: Launchpad Bug Tracker <1850751@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor leoyzen th-huth
X-Launchpad-Bug-Reporter: Leoyzen Liu (leoyzen)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157250374407.2833.9906203607973467907.malonedeb@gac.canonical.com>
Message-Id: <162433552015.20423.2576773419445196416.malone@loganberry.canonical.com>
Subject: [Bug 1850751] Re: kvm flag is not exposed by default
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 45c35139959fb384c998be453f393d7c651135b3
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1850751 <1850751@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1850751

Title:
  kvm flag is not exposed by default

Status in QEMU:
  Expired

Bug description:
  Hi I found that the kvm flags is not exposed by default, but according
  to the source code, it should be exposed by default when the CPU Model
  is a X86CPU.

  we have to specifically add "kvm=3Don" in QEMU custom cpu args like this =
to make VMWare Timing and KVM-Clock work:
  <qemu:arg value=3D'host,kvm=3Don,+invtsc,+hypervisor'/>

  Also the libvirt can't expose kvm because of this (libvirt assumes the
  kvm flag is exposed by default in QEMU, so only "kvm hidden =3D 'true'"
  can be used to disable the kvm expose flag.

  I'm using QEMU 4.1.0 and libvirt 20190803.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1850751/+subscriptions

