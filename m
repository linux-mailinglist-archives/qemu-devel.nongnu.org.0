Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDF72AD9C7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:11:27 +0100 (CET)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVIs-0003p5-P2
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcVDU-0006n4-SP
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:05:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:35170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcVDN-0000WO-SL
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:05:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcVDM-0005mF-6G
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 15:05:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 204602E8075
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 15:05:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 14:54:16 -0000
From: Thomas Huth <1616706@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: amitchandak jnsnow
X-Launchpad-Bug-Reporter: Amit Chandak (amitchandak)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160825015607.4670.37314.malonedeb@wampee.canonical.com>
Message-Id: <160502005722.28892.3185160099239629943.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1616706] Re: watchdog doesn't bring down the VM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: d34e16e9e9e5638a42ccb0d936d148d7b96a080c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1616706 <1616706@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1616706

Title:
  watchdog doesn't bring down the VM

Status in QEMU:
  Invalid

Bug description:
  Qemu-kvm version : QEMU emulator version 1.5.3 (qemu-
  kvm-1.5.3-105.el7), Copyright (c) 2003-2008 Fabrice Billard

  Qemu version: Virsh command line tool of libvirt 1.2.17

  I have the VM stuck in bios (efi shell), but i don't see the watchdog
  in the host bringing it down?

  Couple of questions:

  1. Does the watchdog functionality requires the driver in adminvm to
  trigger the reload? or qemu detects it in the host and causes the
  reload.

  2. Does this work reliably? I have seen cases where in i have the
  watchdog daemon in the VM shut, still don't see the VM going down (I
  put the action in the XML file as power off)

  Thanks
  Amit

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1616706/+subscriptions

