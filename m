Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6275E3EA788
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 17:28:17 +0200 (CEST)
Received: from localhost ([::1]:49016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mECcy-0006qz-F7
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 11:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mECcA-00069U-TT
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 11:27:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:50897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mECc8-0005ba-Fu
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 11:27:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id bo18so10307728pjb.0
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=+cxNzeDM6lY2wt9vEozKzD5DCD6rJAAHZ3kT7ovWWfE=;
 b=knBQV14csAQ4dCAQkgrZCQ6OuPa1Mbe9Y45QLxRioko9I91+mivt1sBzR7xMBVhMsZ
 LYNcDlRqZRg0iwVoEZC7VgCKEXIzPyjBz427oV+LpH5T2h/6MaohV9MiswJu3OwxBFrO
 vh3qKUGaNAEu4I9/lN0wq+aF888lCTrEavl7uK5J3lEh/UMBUTz4Z/68pzLYauVFVMTS
 pXnv9ObJL+AFZCkP5+sB52vXS0aWfv8RVnz/haEfU0Li+ZKDhNwER+UsQ9tYHv6u2zCD
 ZKrhHCWUYdJD+G9PBTC7Btgw2mkKYQQtLK+VGnotIo1uh5e1aFHtUM4uJJjIzTaWT8rS
 y1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=+cxNzeDM6lY2wt9vEozKzD5DCD6rJAAHZ3kT7ovWWfE=;
 b=m62GV9tIbV9wlww6B/YeKGzgkNbOwOLIofB62imUHx2c5h0hf33lfDGnMJTmuezmFF
 dfUDcPlPNZ8Ul/QYdwNuLlgPZOgHN0VSMWWWkpjCGsxTgLUVF9XXKKMJ+M+Q0HkYYZYw
 LqzBlB37hJqNiI3Iv7wXaZz8WpiNdEAT8nMwnOfhcpfcxFYiL/HJiaG07e1lK1axhHYz
 R4+zGDgMinqq3R4PeMfT2Act8K3C+LV8ji0AOBZeMZTHpgU0sV/PkFZ0aCLKBmOJmoZS
 yGeplkip6XalGzh8T1468j00JxUFon5OSFk0casLM1nCQE0WLsvyah6YOqsZ4t7hVH3I
 BsKA==
X-Gm-Message-State: AOAM533qpr5bMkc2cFFx8Iv4mIsCejUCOi+VOoIM4YWphOMSuU4R1oNB
 f6XJhOJ4MFkFPJocm0p6wvk/bw==
X-Google-Smtp-Source: ABdhPJya2aH/3Yr3BxfQV46n4ctLaEUNkiHw9/WawHynzId4mlwjuNQ2v64YQCt/uEmLS4MwlxVSTg==
X-Received: by 2002:a17:90a:6e07:: with SMTP id
 b7mr16761461pjk.1.1628782042029; 
 Thu, 12 Aug 2021 08:27:22 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.139.156])
 by smtp.googlemail.com with ESMTPSA id j25sm3778304pfe.198.2021.08.12.08.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 08:27:21 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 12 Aug 2021 20:57:15 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/acpi: refactor acpi hp modules so that targets can
 just use what they need
In-Reply-To: <3dfd4192-a992-f2e2-84cc-9c57220325df@amsat.org>
Message-ID: <alpine.DEB.2.22.394.2108122055500.1001527@anisinha-lenovo>
References: <20210812071409.492299-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2108121851040.528313@anisinha-lenovo>
 <3dfd4192-a992-f2e2-84cc-9c57220325df@amsat.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-988953761-1628782041=:1001527"
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 philmd@redhat.com, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-988953761-1628782041=:1001527
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 12 Aug 2021, Philippe Mathieu-Daudé wrote:

> On 8/12/21 3:22 PM, Ani Sinha wrote:
> > On Thu, 12 Aug 2021, Ani Sinha wrote:
> >
> >> Currently various acpi hotplug modules like cpu hotplug, memory hotplug, pci
> >> hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is turned on.
> >> This brings in support for whole lot of subsystems that some targets like
> >> mips does not need. They are added just to satisfy symbol dependencies. This
> >> is ugly and should be avoided. Targets should be able to pull in just what they
> >> need and no more. For example, mips only needs support for PIIX4 and does not
> >> need acpi pci hotplug support or cpu hotplug support or memory hotplug support
> >> etc. This change is an effort to clean this up.
> >> In this change, new config variables are added for various acpi hotplug
> >> subsystems. Targets like mips can only enable PIIX4 support and not the rest
> >> of all the other modules which were being previously pulled in as a part of
> >> CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 needs but
> >> are not required by mips (for example, symbols specific to pci hotplug etc)
> >> are available to satisfy the dependencies.
> >>
> >> Currently, this change only addresses issues with mips malta targets. In future
> >> we might be able to clean up other targets which are similarly pulling in lot
> >> of unnecessary hotplug modules by enabling ACPI_X86.
> >>
> >> This change should also address issues such as the following:
> >> https://gitlab.com/qemu-project/qemu/-/issues/221
> >> https://gitlab.com/qemu-project/qemu/-/issues/193
> >
> > I do not have a cross compiled mips64 vmlinux handy, so can't verify that
> > issue #193 was indeed resolved.
>
> The functional tests use some pre-built:
>
> $ git grep I6400 tests/acceptance/
>

Cool! Fantastic! Tested #193 as well, no crashes:

$ ./qemu-system-mips64el -cpu I6400 -nographic -append "clocksource=GIC console=ttyS1" -smp 8 -kernel ../vmlinux
Linux version 4.7.0-rc1-dirty (root@2e66df87a9ff) (gcc version 6.3.0
20170516 (Debian 6.3.0-18) ) #1 SMP Sat Feb 1 18:38:13 UTC 2020
earlycon: uart8250 at I/O port 0x3f8 (options '38400n8')
bootconsole [uart8250] enabled
CPU0 revision is: 0001a900 (MIPS I6400)
FPU revision is: 20f30300
MSA revision is: 00000300
MIPS: machine is mti,malta
Software DMA cache coherency enabled
Determined physical RAM map:
 memory: 0000000008000000 @ 0000000000000000 (usable)
Zone ranges:
  DMA      [mem 0x0000000000000000-0x0000000000ffffff]
  DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
  Normal   empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x0000000007ffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
VP topology {8} total 8
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 64 bytes
percpu: Embedded 5 pages/cpu @980000000107c000 s29664 r8192 d44064 u81920
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 8163
Kernel command line: clocksource=GIC console=ttyS1
log_buf_len individual max cpu contribution: 4096 bytes
log_buf_len total cpu_extra contributions: 28672 bytes
log_buf_len min size: 32768 bytes
log_buf_len: 65536 bytes
early log buf free: 30424(92%)
PID hash table entries: 512 (order: -2, 4096 bytes)
Dentry cache hash table entries: 16384 (order: 3, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 2, 65536 bytes)
Writing ErrCtl register=00000000
Readback ErrCtl register=00000000
MAAR configuration:
  [0]: 0x0000000000010000-0x0000000007ffffff speculate
  [1]: disabled
  [2]: disabled
  [3]: disabled
  [4]: disabled
  [5]: disabled
  [6]: disabled
  [7]: disabled
Memory: 121104K/131072K available (5253K kernel code, 380K rwdata, 1276K
rodata, 304K init, 278K bss, 9968K reserved, 0K cma-reserved)
Hierarchical RCU implementation.
	Build-time adjustment of leaf fanout to 64.
NR_IRQS:256
CPU frequency 333.33 MHz
GIC frequency 100.00 MHz
clocksource: GIC: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:
19113018267 ns
clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:
11467565337 ns
sched_clock: 32 bits at 166MHz, resolution 6ns, wraps every 12884904956ns
Console: colour dummy device 80x25
Calibrating delay loop... 1561.39 BogoMIPS (lpj=7806976)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 2048 (order: 0, 16384 bytes)
Mountpoint-cache hash table entries: 2048 (order: 0, 16384 bytes)
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 64 bytes
CPU1 revision is: 0001a900 (MIPS I6400)
FPU revision is: 20f30300
MSA revision is: 00000300
Synchronize counters for CPU 1: done.
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 64 bytes
CPU2 revision is: 0001a900 (MIPS I6400)
FPU revision is: 20f30300
MSA revision is: 00000300
Synchronize counters for CPU 2: done.
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 64 bytes
CPU3 revision is: 0001a900 (MIPS I6400)
FPU revision is: 20f30300
MSA revision is: 00000300
Synchronize counters for CPU 3: done.
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 64 bytes
CPU4 revision is: 0001a900 (MIPS I6400)
FPU revision is: 20f30300
MSA revision is: 00000300
Synchronize counters for CPU 4: done.
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 64 bytes
CPU5 revision is: 0001a900 (MIPS I6400)
FPU revision is: 20f30300
MSA revision is: 00000300
Synchronize counters for CPU 5: done.
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 64 bytes
CPU6 revision is: 0001a900 (MIPS I6400)
FPU revision is: 20f30300
MSA revision is: 00000300
Synchronize counters for CPU 6: done.
Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 64 bytes
CPU7 revision is: 0001a900 (MIPS I6400)
FPU revision is: 20f30300
MSA revision is: 00000300
Synchronize counters for CPU 7: done.
Brought up 8 CPUs
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 19112604462750000 ns
NET: Registered protocol family 16
pm-cps: CPC does not support clock gating
vgaarb: loaded
SCSI subsystem initialized
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [mem 0x10000000-0x17ffffff]
pci_bus 0000:00: root bus resource [io  0x1000-0x1fffff]
pci_bus 0000:00: root bus resource [??? 0x00000000 flags 0x0]
pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
pci 0000:00:00.0: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
pci 0000:00:00.0: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
pci 0000:00:00.0: [Firmware Bug]: reg 0x1c: invalid BAR (can't size)
pci 0000:00:00.0: [Firmware Bug]: reg 0x20: invalid BAR (can't size)
pci 0000:00:00.0: [Firmware Bug]: reg 0x24: invalid BAR (can't size)
pci 0000:00:0a.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
pci 0000:00:0a.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
pci 0000:00:0a.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
pci 0000:00:0a.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
pci 0000:00:0a.3: quirk: [io  0x1000-0x103f] claimed by PIIX4 ACPI
pci 0000:00:0a.3: quirk: [io  0x1100-0x110f] claimed by PIIX4 SMB
vgaarb: device added: PCI:0000:00:12.0,decodes=io+mem,owns=none,locks=none
pci 0000:00:12.0: BAR 0: assigned [mem 0x10000000-0x11ffffff pref]
pci 0000:00:0b.0: BAR 6: assigned [mem 0x12000000-0x1203ffff pref]
pci 0000:00:12.0: BAR 6: assigned [mem 0x12040000-0x1204ffff pref]
pci 0000:00:12.0: BAR 1: assigned [mem 0x12050000-0x12050fff]
pci 0000:00:0a.2: BAR 4: assigned [io  0x1040-0x105f]
pci 0000:00:0b.0: BAR 0: assigned [io  0x1060-0x107f]
pci 0000:00:0b.0: BAR 1: assigned [mem 0x12051000-0x1205101f]
pci 0000:00:0a.1: BAR 4: assigned [io  0x1080-0x108f]
clocksource: Switched to clocksource GIC
VFS: Disk quotas dquot_6.6.0
VFS: Dquot-cache hash table entries: 2048 (order 0, 16384 bytes)
NET: Registered protocol family 2
TCP established hash table entries: 2048 (order: 0, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 32768 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
UDP hash table entries: 512 (order: 0, 16384 bytes)
UDP-Lite hash table entries: 512 (order: 0, 16384 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
futex hash table entries: 2048 (order: 3, 131072 bytes)
workingset: timestamp_bits=60 max_order=13 bucket_order=0
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
PCI: Enabling device 0000:00:12.0 (0000 -> 0002)
cirrusfb 0000:00:12.0: Cirrus Logic chipset on PCI bus, RAM (4096 kB) at
0x10000000
Console: switching to colour frame buffer device 80x30
hrtimer: interrupt took 159860621 ns
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250.0: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
serial8250.0: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
console [ttyS1] enabled
bootconsole [uart8250] disabled



--2088271309-988953761-1628782041=:1001527--

