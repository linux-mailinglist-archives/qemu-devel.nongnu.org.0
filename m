Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36C22EEC92
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:39:56 +0100 (CET)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjZ5-0005H6-LA
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLu-0001Ug-Pl
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:18 -0500
Received: from indium.canonical.com ([91.189.90.7]:56500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLr-0003iq-B3
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:18 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxjLe-00045C-Ej
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:26:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6732B2E8145
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 04:26:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 04:17:24 -0000
From: Launchpad Bug Tracker <1639791@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hramrach janitor th-huth
X-Launchpad-Bug-Reporter: Michal Suchanek (hramrach)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20161107132438.29321.64918.malonedeb@wampee.canonical.com>
Message-Id: <161007944493.27824.1391894373249109309.malone@loganberry.canonical.com>
Subject: [Bug 1639791] Re: early virtio console output is lost
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: 793ad318b87ed646d3641df6039aa247f9b38162
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1639791 <1639791@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1639791

Title:
  early virtio console output is lost

Status in QEMU:
  Expired

Bug description:
  This is broken in git and reportedly in 2.5 through 2.7.

  Running a Linux kernel which includes a testsuite in initrd sometimes
  produces no output.

  Reportedly the console is sometimes not open when the early userspace
  tries to log output resulting in either the testsuite terminating
  early or not writing the output.

  Workaround patch is here:

  https://git.zx2c4.com/WireGuard/commit/?id=3Dd2de8b0862a7fbb51a7f2f958d58=
f0efe4648259

  reportedly you would get -EBADF there when no output is generated.

  Also this reportedly happens with virtio console only, not virtio
  serial port.

  It seems that the author of said testsuite did not report the problem
  so I write it down so it does not get lost.

  test (in bash):

  n=3D0 ; while [ $n -lt 100 ] && grep -m 1 -F "WireGuard Test Suite on
  Linux 4.8.6" <( /opt/qemu/bin/qemu-system-x86_64         -nodefaults
  -nographic         -machine q35,accel=3Dkvm         -cpu host
  -smp 2         -m 64M         -object rng-
  random,id=3Drng0,filename=3D/dev/urandom         -device virtio-rng-
  pci,rng=3Drng0         -device virtio-serial,max_ports=3D2
  -chardev stdio,id=3Dstdio         -device virtconsole,chardev=3Dstdio
  -chardev file,id=3Dstatus,path=3Dresult.txt         -device
  virtserialport,chardev=3Dstatus         -monitor none         -kernel
  wireguard-testing-harness-bzImage-e87cb2a7-145c-4985-907f-17e81fae329b
  -append "console=3Dhvc0 initcall_debug=3D1 loglevel=3D7" ) ; do echo $n ;
  n=3D$(expr $n + 1) ; pkill -f wireguard ; done

  This typically does 10-20 iterations but sometimes tens of iterations
  run without issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1639791/+subscriptions

