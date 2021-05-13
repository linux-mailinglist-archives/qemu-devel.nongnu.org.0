Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9431737F778
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:08:16 +0200 (CEST)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhA8V-00027R-Kb
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhA6c-0000AV-5y
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:06:19 -0400
Received: from indium.canonical.com ([91.189.90.7]:41024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhA6Y-0001qR-0L
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:06:17 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhA6V-00040m-Ha
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:06:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7F2AD2E8060
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:06:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 11:57:54 -0000
From: Thomas Huth <1917394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: seannnnk th-huth
X-Launchpad-Bug-Reporter: sean kuo (seannnnk)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161465544550.24578.14846009621606228644.malonedeb@wampee.canonical.com>
Message-Id: <162090707411.924.5278676442465875587.malone@wampee.canonical.com>
Subject: [Bug 1917394] Re: command lspci does not show the IVSHMEM device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: a0f416c4123646de16671d4fe5b23749f395a279
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
Reply-To: Bug 1917394 <1917394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sounds like this question has been solved, thus I'm closing this ticket
now.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917394

Title:
  command lspci does not show the IVSHMEM device

Status in QEMU:
  Invalid

Bug description:
  qeum version:
  QEMU emulator version 4.2.1

  I met a problem when I tried to use IVSHMEM. Command lspci does not show =
the IVSHMEM device.
  Below is the configuration from my side:

  1.  guest vm xml configuration.
    <shmem name=3D'ivshmem'>
        <model type=3D'ivshmem-plain'/>
        <size unit=3D'M'>2</size>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x10' =
function=3D'0x0'/>
      </shmem>

  2. after the booting up and I found the qemu commandline ideedly  have th=
e device option:
  ps aux | grep ivshmem
   /usr/bin/qemu-system-x86_64 =

        .......(ignore other options)
  -object memory-backend-file,id=3Dshmmem-shmem0,mem-path=3D/dev/shm/hostme=
m,size=3D4194304,share=3Dyes -device ivshmem-plain,id=3Dshmem0,memdev=3Dshm=
mem-shmem0,bus=3Dpcie.0,addr=3D0x10

  3. lspci command  not shown the device.

  4. lshw command indeedly show the device:

  *-memory UNCLAIMED
               description: RAM memory
               product: Inter-VM shared memory
               vendor: Red Hat, Inc.
               physical id: 10
               bus info: pci@0000:00:10.0
               version: 01
               width: 64 bits
               clock: 33MHz (30.3ns)
               configuration: latency=3D0
               resources: memory:fcc1c000-fcc1c0ff memory:fdc00000-fdffffff

  My host and vm os is ubuntu 20.04 and version is:
  #49~20.04.1-Ubuntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64 G=
NU/Linux

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917394/+subscriptions

