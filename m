Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C1F2B0057
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 08:28:57 +0100 (CET)
Received: from localhost ([::1]:49012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd72O-0007Kb-90
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 02:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd6uc-0007ex-Pj
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:20:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:54904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd6uY-0006Is-V0
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:20:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kd6uW-0005bQ-KQ
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:20:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 998692E80EA
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:20:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 07:15:24 -0000
From: Thomas Huth <1798057@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awalende dgilbert-h th-huth
X-Launchpad-Bug-Reporter: Alex Walender (awalende)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153968292598.9512.8127269016874180318.malonedeb@chaenomeles.canonical.com>
Message-Id: <160516532501.29026.928291577277635842.malone@chaenomeles.canonical.com>
Subject: [Bug 1798057] Re: Not able to start instances larger than 1 TB
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: 0cfee20026b2193ff4a01bfa0427d1a26a14402d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 01:35:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1798057 <1798057@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm assuming that the right physbits setting fixed the bug? ... so I'm
marking this ticket as "Invalid". If the problem still persists, then
please open again.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1798057

Title:
  Not able to start instances larger than 1 TB

Status in QEMU:
  Invalid

Bug description:
  Specs:

  CPU: Intel(R) Xeon(R) Gold 6132 CPU @ 2.60GHz
  OS: Ubuntu 18.04 AMD64
  QEMU: 1:2.11+dfsg-1ubuntu7.6 (Ubuntu Bionic Package)
  Openstack: Openstack Queens (Ubuntu Bionic Package)
  Libvirt-daemon: 4.0.0-1ubuntu8.5
  Seabios: 1.10.2-1ubuntu1

  =

  The Problem:
  We are not able to start instances, which have a memory size over 1 TB.
  After starting the instance, they shortly lock up. Starting guests with a=
 lower amount of RAM works
  perfectly. We dealt with the same problem in the past with an older Qemu =
Version (2.5) by patching some source files according to this patch:

  https://git.centos.org/blob/rpms!!qemu-
  kvm.git/34b32196890e2c41b0aee042e600ba422f29db17/SOURCES!kvm-fix-
  guest-physical-bits-to-match-host-to-go-beyond-1.patch

  =

  I think we now have somewhat the same problem here, however the source ba=
se changed and I'am not able to find the corresponding snippet to patch thi=
s.

  Also, guests show a wrong physical address size which is probably the cau=
se of the lock ups on high memory guests:
  root@debug:~# grep physical /proc/cpuinfo =

  physical id	: 0
  address sizes	: 40 bits physical, 48 bits virtual =


  Any way to fix this?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1798057/+subscriptions

