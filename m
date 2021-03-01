Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EA43277B1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 07:42:08 +0100 (CET)
Received: from localhost ([::1]:51628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGcFr-0004xd-Iq
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 01:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGcEm-0004Xs-SS
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 01:41:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:35578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGcEk-0003au-NE
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 01:41:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lGcEh-0005AY-T9
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 06:40:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C0AA62E80F3
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 06:40:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Mar 2021 06:29:16 -0000
From: Thomas Huth <1917161@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: programmingkidx th-huth
X-Launchpad-Bug-Reporter: John Arbuckle (programmingkidx)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161444687583.24678.13238506356231835061.malonedeb@wampee.canonical.com>
Message-Id: <161458015701.24619.13829281628104078291.malone@gac.canonical.com>
Subject: [Bug 1917161] Re: Parameter 'type' expects a netdev backend type
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cd61f0bfc5208dd4b58a15e953892eaabba1e0b8"; Instance="production"
X-Launchpad-Hash: bbf518ecc4932d58eafc0adec5b6e3f7e88299a7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1917161 <1917161@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

What output do you get when you run:

 qemu-system-i386 -netdev help

It's likely that your binary has been compiled without "user" networking
(aka. "slirp") support. If so, please use a binary that has "slirp"
enabled instead.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917161

Title:
  Parameter 'type' expects a netdev backend type

Status in QEMU:
  Incomplete

Bug description:
  When using QEMU on an M1 Mac with Mac OS 11.1, I see this error
  message when trying to enable networking for a guest:

  Parameter 'type' expects a netdev backend type

  Example command:
  qemu-system-i386 -m 700 -hda <Windows XP HD file> -netdev user,id=3Dn0 -d=
evice rtl8139,netdev=3Dn0

  What should happen is networking should work when issuing the above
  command. What actually happens is QEMU exits immediately.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917161/+subscriptions

