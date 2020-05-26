Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394711D01BA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 00:16:58 +0200 (CEST)
Received: from localhost ([::1]:60286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYdCq-0001jD-Q3
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 18:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jYdBs-0001Ez-Io
 for qemu-devel@nongnu.org; Tue, 12 May 2020 18:15:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:34626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jYdBr-0004H0-Gd
 for qemu-devel@nongnu.org; Tue, 12 May 2020 18:15:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jYdBo-0005WJ-Tc
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 22:15:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DF4C92E810B
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 22:15:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2020 22:08:45 -0000
From: Roman Bolshakov <1823831@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=roolebo@gmail.com; 
X-Launchpad-Bug-Tags: hvf osx
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cuser2 roolebo
X-Launchpad-Bug-Reporter: Chen Zhang (cuser2)
X-Launchpad-Bug-Modifier: Roman Bolshakov (roolebo)
References: <155478160922.20745.7830680070590942423.malonedeb@chaenomeles.canonical.com>
Message-Id: <158932132559.2888.16547642841467520846.launchpad@gac.canonical.com>
Subject: [Bug 1823831] Re: BSD bootloader halts with hypervisor.framework
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="013b6f2a3f3ba130b50b9eee1a89957ee38a5c15";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7c67f3f53dce7291b44db873be26e17b7417899b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 18:06:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1823831 <1823831@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
     Assignee: (unassigned) =3D> Roman Bolshakov (roolebo)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1823831

Title:
  BSD bootloader halts with hypervisor.framework

Status in QEMU:
  Fix Released

Bug description:
  Guest: FreeBSD 12.0 Install CD
  Host: MacOS 11.14.3 qemu master at 90fb864a7df0a9af677352e94f8225f7b03de9=
22

  Command arguments:

  qemu-system-x86_64 -m 4000m -cdrom Downloads/FreeBSD-12.0-RELEASE-
  amd64-bootonly.iso

  When qemu was run with -accel hvf, the bootloader would halt after
  showing the menu. The bootloader would not respond to any keyboard
  events.

  Without acceleration option, the bootloader would count down to zero
  and proceed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1823831/+subscriptions

