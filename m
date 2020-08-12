Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4D1242597
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 08:46:17 +0200 (CEST)
Received: from localhost ([::1]:52826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5kWe-0000oS-3b
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 02:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k5kVS-0000Hj-EP
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 02:45:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:48264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k5kVQ-0002nX-7Y
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 02:45:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k5kVO-0003NM-Nz
 for <qemu-devel@nongnu.org>; Wed, 12 Aug 2020 06:44:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A7C2B2E8074
 for <qemu-devel@nongnu.org>; Wed, 12 Aug 2020 06:44:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2020 06:32:55 -0000
From: Thomas Huth <1366363@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Triaged; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: highcheng pandan th-huth
X-Launchpad-Bug-Reporter: Winston Wu (highcheng)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140906165232.5566.76013.malonedeb@wampee.canonical.com>
Message-Id: <159721397622.5421.16268476536811340780.launchpad@soybean.canonical.com>
Subject: [Bug 1366363] Re: qemu-git gravis ultrasound not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5569a8ec3678320fdb6487b88aef91cccd942969
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 02:20:55
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
Reply-To: Bug 1366363 <1366363@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> Triaged

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1366363

Title:
  qemu-git gravis ultrasound not working

Status in QEMU:
  Triaged

Bug description:
  Qemu git 2.1.50 with dos622 and windows 3.11.

  Parameter:

  For build: default-configs/sound.mak CONFIG_GUS=3Dy

  Starting parameter: qemu-system-i386 -cpu 486 -m 32M -vga cirrus -hda
  disk1.img -soundhw gus,pcspk -parallel none -net nic,model=3Dne2k_isa
  -net user

  The installer of GUS driver 4.11 does not recognize the card. And
  conscan tells me that ioport 220-240 and not safe for synth base. It
  seems that there is a port conflict.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1366363/+subscriptions

