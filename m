Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34AB37159C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:02:59 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYDy-0007u2-OT
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldYAP-0005Lo-He
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:59:17 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldYAN-0008Ge-8V
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:59:17 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 t11-20020a05600c198bb02901476e13296aso3463171wmq.0
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=gJX2Dk+Sr2O69ktUgwB0h5TfqYi0r0y3GePgFCj289w=;
 b=AYmub5FFP60biHdll9VRLlnHw/ul8NhYfy2j0Je532wJLAhIThXFBUkDqHQRDa6BFP
 BWT1SVkfCqMvwNVKhA1pMO5PaJKG5svijotfiMK6JcCz/XuGdrjionXkJDBamWXSuzYu
 1QGcRzguViXbFW+XTqEWHJeBN7LfTb/OzA2Mu3Gp64YKqdRjIaFxu7uVew6KUC2nHrAD
 IOKCVruI4Hjxtezxifp3T2v092Rm4Zz1L3+ko81NQMBd2eDNtyNgTOWyjxEuHIZa7Mht
 G1ttrBidJNT7qr8uHPNMl+fXqvgYgSSb1LSkh++20wAQUFs06zlHGv3qXVKhsgtG69Jp
 vj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
 :user-agent:mime-version:content-language;
 bh=gJX2Dk+Sr2O69ktUgwB0h5TfqYi0r0y3GePgFCj289w=;
 b=CSwYHrp/VLMN8DyTRVksqTANnHcSPlytfLS3nZArsH0djPnzaOmIzAj+qf/tIjaoD5
 vUB32RTAGaRDw/PZbMehLmybjcPG21rf42p0fNVxxmFdn2ylAkO0spBy4OIB4Yusw9vF
 OhF0R2EqCfVX49mVtBjYlYML9qVGNkffu7S/FEfFlDrFULE0lsyE7EsnjPgdqKy7Tjvq
 v4j0LP5bv4bh99EjJALmyLoiibzJsWGsO3LxpMIanTf+YZKEMH6gu+nholAi8trpE95f
 n2vFP3vgcAG8qTxKBsf9A1sTB/kGSwP9gPlNUbjSZmrRjUSuCrsjH8laHfi2vKXnqYxR
 9f5Q==
X-Gm-Message-State: AOAM531b8bLBRG/MHTbfPvjDEmDojKTC/GrJkQjIMtRW8HaGD5I5DdS9
 vvZvx0t+yYFXk7KF+WvigBM=
X-Google-Smtp-Source: ABdhPJxSk/BinDdsfIf8qmizDjrisYhkge6g+quT8G2067H2obTSMy87BzWMKmMnL30VAHUDIcmDFQ==
X-Received: by 2002:a1c:f618:: with SMTP id w24mr21471423wmc.93.1620046753731; 
 Mon, 03 May 2021 05:59:13 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id 6sm26051115wmg.9.2021.05.03.05.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 05:59:13 -0700 (PDT)
To: qemu-devel <qemu-devel@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: Problem with Avocado and QEMU console
Message-ID: <ac0e8d46-6e57-b454-9162-17dc2f3b6534@amsat.org>
Date: Mon, 3 May 2021 14:59:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------9F494D8A004F0C75B5F08CA9"
Content-Language: en-US
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------9F494D8A004F0C75B5F08CA9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Cleber, Willian,

Avocado marked the test_mips64el_fuloong2e as failed while
it succeeded:
https://gitlab.com/qemu-project/qemu/-/jobs/1231363571

Apparently the first part of the console output is missing.
(Normal console output attached).

Any idea what could be the cause?

Thanks,

Phil.

--------------9F494D8A004F0C75B5F08CA9
Content-Type: text/x-log; charset=UTF-8;
 name="test_mips64el_fuloong2e-console.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="test_mips64el_fuloong2e-console.log"

console: [    0.000000] Initializing cgroup subsys cpuset
console: [    0.000000] Initializing cgroup subsys cpu
console: [    0.000000] Initializing cgroup subsys cpuacct
console: [    0.000000] Linux version 3.16.0-6-loongson-2e (debian-kernel@lists.debian.org) (gcc version 4.8.4 (Debian 4.8.4-1) ) #1 Debian 3.16.56-1+deb8u1 (2018-05-08)
console: [    0.000000] memsize=256, highmemsize=0
console: [    0.000000] CpuClock = 533080000
console: [    0.000000] bootconsole [early0] enabled
console: [    0.000000] CPU0 revision is: 00006302 (ICT Loongson-2)
console: [    0.000000] FPU revision is: 00000501
console: [    0.000000] Checking for the multiply/shift bug... no.
console: [    0.000000] Checking for the daddiu bug... no.
console: [    0.000000] Determined physical RAM map:
console: [    0.000000]  memory: 0000000010000000 @ 0000000000000000 (usable)
console: [    0.000000]  memory: 0000000004000000 @ 0000000010000000 (reserved)
console: [    0.000000]  memory: 0000000003ffffff @ 000000001c000001 (reserved)
console: [    0.000000] Initrd not found or empty - disabling initrd
console: [    0.000000] Zone ranges:
console: [    0.000000]   DMA      [mem 0x00000000-0x00ffffff]
console: [    0.000000]   Normal   [mem 0x01000000-0x0fffffff]
console: [    0.000000] Movable zone start for each node
console: [    0.000000] Early memory node ranges
console: [    0.000000]   node   0: [mem 0x00000000-0x0fffffff]
console: [    0.000000] Reserving 0MB of memory at 0MB for crashkernel
console: [    0.000000] Primary instruction cache 64kB, VIPT, direct mapped, linesize 32 bytes.
console: [    0.000000] Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 32 bytes
console: [    0.000000] Unified secondary cache 512kB 4-way, linesize 32 bytes.
console: [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16327
console: [    0.000000] Kernel command line: printk.time=0 console=ttyS0
console: PID hash table entries: 1024 (order: -1, 8192 bytes)
console: Dentry cache hash table entries: 32768 (order: 4, 262144 bytes)
console: Inode-cache hash table entries: 16384 (order: 3, 131072 bytes)
console: Memory: 250752K/262144K available (5597K kernel code, 716K rwdata, 1548K rodata, 480K init, 581K bss, 11392K reserved)
console: NR_IRQS:128
console: Console: colour dummy device 80x25
console: Calibrating delay loop... 1253.37 BogoMIPS (lpj=2506752)
console: pid_max: default: 32768 minimum: 301
console: Security Framework initialized
console: AppArmor: AppArmor disabled by boot time parameter
console: Yama: disabled by default; enable with sysctl kernel.yama.*
console: Mount-cache hash table entries: 2048 (order: 0, 16384 bytes)
console: Mountpoint-cache hash table entries: 2048 (order: 0, 16384 bytes)
console: Initializing cgroup subsys memory
console: Initializing cgroup subsys devices
console: Initializing cgroup subsys freezer
console: Initializing cgroup subsys net_cls
console: Initializing cgroup subsys blkio
console: Initializing cgroup subsys perf_event
console: Initializing cgroup subsys net_prio
console: Checking for the daddi bug... no.
console: ftrace: allocating 17617 entries in 18 pages
console: devtmpfs: initialized
console: futex hash table entries: 256 (order: -2, 6144 bytes)
console: NET: Registered protocol family 16
console: vgaarb: loaded
console: SCSI subsystem initialized
console: PCI host bridge to bus 0000:00
console: pci_bus 0000:00: root bus resource [mem 0x14000000-0x1c000000]
console: pci_bus 0000:00: root bus resource [io  0x4000-0xffff]
console: pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
console: via686b fix: ISA bridge
console: via686b fix: ISA bridge done
console: pci 0000:00:05.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
console: pci 0000:00:05.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
console: pci 0000:00:05.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
console: pci 0000:00:05.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
console: via686b fix: IDE
console: via686b fix: IDE done
console: pci 0000:00:07.0: BAR 6: assigned [mem 0x14000000-0x1403ffff pref]
console: pci 0000:00:07.0: BAR 0: assigned [io  0x4000-0x40ff]
console: pci 0000:00:07.0: BAR 1: assigned [mem 0x14040000-0x140400ff]
console: pci 0000:00:05.2: BAR 4: assigned [io  0x4400-0x441f]
console: pci 0000:00:05.3: BAR 4: assigned [io  0x4420-0x443f]
console: pci 0000:00:05.1: BAR 4: assigned [io  0x4440-0x444f]
|console: Switched to clocksource MIPS
console: NET: Registered protocol family 2
console: TCP established hash table entries: 2048 (order: 0, 16384 bytes)
console: TCP bind hash table entries: 2048 (order: 0, 16384 bytes)
console: TCP: Hash tables configured (established 2048 bind 2048)
console: TCP: reno registered
console: UDP hash table entries: 512 (order: 0, 16384 bytes)
console: UDP-Lite hash table entries: 512 (order: 0, 16384 bytes)
console: NET: Registered protocol family 1
console: PCI: Enabling device 0000:00:05.2 (0000 -> 0001)
console: PCI: Enabling device 0000:00:05.3 (0000 -> 0001)
console: audit: initializing netlink subsys (disabled)
console: audit: type=2000 audit(1620046479.132:1): initialized
console: HugeTLB registered 32 MB page size, pre-allocated 0 pages
console: zbud: loaded
console: VFS: Disk quotas dquot_6.5.2
console: Dquot-cache hash table entries: 2048 (order 0, 16384 bytes)
console: msgmni has been set to 489
console: alg: No test for stdrng (krng)
console: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
console: io scheduler noop registered
console: io scheduler deadline registered
console: io scheduler cfq registered (default)
console: Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
console: console [ttyS0] disabled
console: serial8250.0: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
console: console [ttyS0] enabled
console: console [ttyS0] enabled
console: bootconsole [early0] disabled
console: bootconsole [early0] disabled
console: scsi0 : pata_via
console: scsi1 : pata_via
console: ata1: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x4440 irq 14
console: ata2: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x4448 irq 15
console: serio: i8042 KBD port at 0x60,0x64 irq 1
console: serio: i8042 AUX port at 0x60,0x64 irq 12
console: mousedev: PS/2 mouse device common for all mice
console: rtc_cmos rtc_cmos: rtc core: registered rtc_cmos as rtc0
console: rtc_cmos rtc_cmos: alarms up to one day, 114 bytes nvram
console: ledtrig-cpu: registered to indicate activity on CPUs
console: TCP: cubic registered
console: NET: Registered protocol family 10
console: mip6: Mobile IPv6
console: NET: Registered protocol family 17
console: mpls_gso: MPLS GSO support
console: registered taskstats version 1
console: rtc_cmos rtc_cmos: setting system clock to 2021-05-03 12:54:39 UTC (1620046479)
console: input: AT Raw Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
console: VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
console: Please append a correct "root=" boot option; here are the available partitions:
console: Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

--------------9F494D8A004F0C75B5F08CA9--

