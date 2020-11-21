Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541502BBFA8
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 15:16:37 +0100 (CET)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgTgq-0002Sc-ES
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 09:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTg0-0001r1-JO
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:15:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:55070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTfy-00016J-OJ
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:15:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgTfu-0003F4-8O
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:15:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E31BC2E8149
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:15:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 14:08:56 -0000
From: Thomas Huth <1843590@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: block nbd
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156821007592.6835.16511682649180201953.malonedeb@soybean.canonical.com>
Message-Id: <160596773612.25856.1077100533404379096.malone@wampee.canonical.com>
Subject: [Bug 1843590] Re: NBD tests  use hardcoded port 10810
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 9e8f6cd0408d588bd00bade99b8035aeb5788aef
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
Reply-To: Bug 1843590 <1843590@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should have been fixed by this commit here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Df3923a72f199b2c63747a7

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843590

Title:
  NBD tests  use hardcoded port 10810

Status in QEMU:
  Fix Released

Bug description:
  QEMU v3.1.0

  $ ./configure --block-drv-rw-
  whitelist=3Dqcow2,raw,file,host_device,nbd,iscsi,rbd,blkdebug,luks,null-
  co,nvme,copy-on-read,throttle,vxhs,gluster [...]

  $ ./check -v -nbd 001 002 003 004 005 008 009 010 011 021 032 033 045 077=
 094 104 119 123 132 143 145 147 151 152 162 181 184 194 205 208 218 222
  [...]
  104         - output mismatch (see 104.out.bad)
  --- tests/qemu-iotests/104.out	2018-12-11 17:44:35.000000000 +0000
  +++ tests/qemu-iotests/104.out.bad	2019-09-11 11:59:11.822058653 +0000
  @@ -6,7 +6,7 @@
   file format: IMGFMT
   virtual size: 1.0K (1024 bytes)
   Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1234
  -image: TEST_DIR/t.IMGFMT
  -file format: IMGFMT
  -virtual size: 1.5K (1536 bytes)
  +Failed to find an available port: Address already in use
  +qemu-img: Could not open 'nbd:127.0.0.1:10810': Failed to connect socket=
: Connection refused
  +./common.rc: line 203: kill: (28391) - No such process
   ***done
  Failed 1 of 32 tests

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843590/+subscriptions

