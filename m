Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F83296C6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:08:29 +0100 (CET)
Received: from localhost ([::1]:40010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH04z-00006g-16
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:08:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lH02a-0007PI-SD
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:06:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:56798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lH02X-0004M8-13
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:06:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lH02V-0006WQ-7K
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 08:05:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 350DF2E804A
 for <qemu-devel@nongnu.org>; Tue,  2 Mar 2021 08:05:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Mar 2021 07:59:18 -0000
From: sean kuo <1917394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: seannnnk
X-Launchpad-Bug-Reporter: sean kuo (seannnnk)
X-Launchpad-Bug-Modifier: sean kuo (seannnnk)
References: <161465544550.24578.14846009621606228644.malonedeb@wampee.canonical.com>
Message-Id: <CAFkVRJKbRqjEnF_K2RXYTb+ZF0KnFO+J05f1ETEaumxc=CVvaA@mail.gmail.com>
Subject: Re: [Bug 1917394] [NEW] command lspci does not show the IVSHMEM device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cd61f0bfc5208dd4b58a15e953892eaabba1e0b8"; Instance="production"
X-Launchpad-Hash: 174e94d3be22ecbda22d7f898719edda4b496466
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
Reply-To: Bug 1917394 <1917394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi ChangLimin,

Thanks for your reply. I checked again to find the device... I thought the
name was ivshmem.
I don't find any driver code for IVSHMEM in the linux and qemu repo. Can
you give me some help?

00:10.0 RAM memory: Red Hat, Inc. Inter-VM shared memory (rev 01)
Subsystem: Red Hat, Inc. QEMU Virtual Machine
Flags: fast devsel
Memory at fcc1c000 (32-bit, non-prefetchable) [size=3D256]
Memory at fdc00000 (64-bit, prefetchable) [size=3D4M]

Thanks,
Sean




On Tue, Mar 2, 2021 at 3:31 PM ChangLimin <changlm@chinatelecom.cn> wrote:

> Can you give the lspci messages? The below is my output.  There is a RAM
> memory device.
>
> $ lspci
> 00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev
> 02)
> 00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
> 00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton
> II]
> 00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton
> II] (rev 01)
> 00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
> 00:02.0 VGA compatible controller: Device 1234:1111 (rev 02)
> 00:03.0 PCI bridge: Red Hat, Inc. QEMU PCI-PCI bridge
> 00:04.0 Ethernet controller: Red Hat, Inc. Virtio network device
> 00:05.0 SCSI storage controller: Red Hat, Inc. Virtio SCSI
> 00:06.0 Communication controller: Red Hat, Inc. Virtio console
> 00:10.0 RAM memory: Red Hat, Inc. Inter-VM shared memory (rev 01)
> 01:07.0 PCI bridge: Red Hat, Inc. QEMU PCI-PCI bridge
>
>
> *From:* sean kuo <1917394@bugs.launchpad.net>
> *Date:* 2021-03-02 11:24
> *To:* qemu-devel <qemu-devel@nongnu.org>
> *Subject:* [Bug 1917394] [NEW] command lspci does not show the IVSHMEM
> device
> Public bug reported:
>
> qeum version:
> QEMU emulator version 4.2.1
>
> I met a problem when I tried to use IVSHMEM. Command lspci does not show
> the IVSHMEM device.
> Below is the configuration from my side:
>
> 1.  guest vm xml configuration.
>   <shmem name=3D'ivshmem'>
>       <model type=3D'ivshmem-plain'/>
>       <size unit=3D'M'>2</size>
>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x10'
> function=3D'0x0'/>
>     </shmem>
>
> 2. after the booting up and I found the qemu commandline ideedly  have the
> device option:
> ps aux | grep ivshmem
> /usr/bin/qemu-system-x86_64
>       .......(ignore other options)
> -object
> memory-backend-file,id=3Dshmmem-shmem0,mem-path=3D/dev/shm/hostmem,size=
=3D4194304,share=3Dyes
> -device ivshmem-plain,id=3Dshmem0,memdev=3Dshmmem-shmem0,bus=3Dpcie.0,add=
r=3D0x10
>
> 3. lspci command  not shown the device.
>
> 4. lshw command indeedly show the device:
>
> *-memory UNCLAIMED
>              description: RAM memory
>              product: Inter-VM shared memory
>              vendor: Red Hat, Inc.
>              physical id: 10
>              bus info: pci@0000:00:10.0
>              version: 01
>              width: 64 bits
>              clock: 33MHz (30.3ns)
>              configuration: latency=3D0
>              resources: memory:fcc1c000-fcc1c0ff memory:fdc00000-fdffffff
>
> My host and vm os is ubuntu 20.04 and version is:
> #49~20.04.1-Ubuntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64
> GNU/Linux
>
> ** Affects: qemu
>      Importance: Undecided
>          Status: New
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1917394
>
> Title:
>   command lspci does not show the IVSHMEM device
>
> Status in QEMU:
>   New
>
> Bug description:
>   qeum version:
>   QEMU emulator version 4.2.1
>
>   I met a problem when I tried to use IVSHMEM. Command lspci does not show
> the IVSHMEM device.
>   Below is the configuration from my side:
>
>   1.  guest vm xml configuration.
>     <shmem name=3D'ivshmem'>
>         <model type=3D'ivshmem-plain'/>
>         <size unit=3D'M'>2</size>
>         <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x10'
> function=3D'0x0'/>
>       </shmem>
>
>   2. after the booting up and I found the qemu commandline ideedly  have
> the device option:
>   ps aux | grep ivshmem
>    /usr/bin/qemu-system-x86_64
>         .......(ignore other options)
>   -object
> memory-backend-file,id=3Dshmmem-shmem0,mem-path=3D/dev/shm/hostmem,size=
=3D4194304,share=3Dyes
> -device ivshmem-plain,id=3Dshmem0,memdev=3Dshmmem-shmem0,bus=3Dpcie.0,add=
r=3D0x10
>
>   3. lspci command  not shown the device.
>
>   4. lshw command indeedly show the device:
>
>   *-memory UNCLAIMED
>                description: RAM memory
>                product: Inter-VM shared memory
>                vendor: Red Hat, Inc.
>                physical id: 10
>                bus info: pci@0000:00:10.0
>                version: 01
>                width: 64 bits
>                clock: 33MHz (30.3ns)
>                configuration: latency=3D0
>                resources: memory:fcc1c000-fcc1c0ff memory:fdc00000-fdffff=
ff
>
>   My host and vm os is ubuntu 20.04 and version is:
>   #49~20.04.1-Ubuntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64
> GNU/Linux
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1917394/+subscriptions
>
>
>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917394

Title:
  command lspci does not show the IVSHMEM device

Status in QEMU:
  New

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

