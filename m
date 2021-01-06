Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59312EBDDB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:51:33 +0100 (CET)
Received: from localhost ([::1]:39964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx8Hk-0003tA-N2
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kx8GP-0003N4-EW
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:50:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kx8GN-0005W0-1I
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609937406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iN6UZn4c5K4pB7+a0srKJRScNMljuT+AO4e1St8OMR0=;
 b=fIy2/USCjuLDZCFfccq2dMYc2YjTPMipEyzHH6IqGTxKf4bGE4GR756AwJEJud3YYcbOA7
 grvHgEMJDLnrRo869SISEcuChJiEaSpR4NsQBf47XqBnEXlANWrj6Wz9wz2ABtjq38pWtT
 vJEZQ5wCu9goEyhZc/oe69IlRfXClo4=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-fIN_xLDPNDusLc6ddsJtXg-1; Wed, 06 Jan 2021 07:50:04 -0500
X-MC-Unique: fIN_xLDPNDusLc6ddsJtXg-1
Received: by mail-vs1-f69.google.com with SMTP id x16so507923vsx.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 04:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iN6UZn4c5K4pB7+a0srKJRScNMljuT+AO4e1St8OMR0=;
 b=BBpfIvR/wI+BKlVXKGKE/x9ccvQV0937ev7/L1YiJC2F4K9FcBmeudnP8r/pskE+/m
 ET6pF59Sqa7ZCbb0Vk4NN2vqggWQSaEyoSYdCF3MMpYRLmCqIPpiScjdVl/QJ2qiaa6g
 Rw+CXHKTA0XP2yPveGtIgGicxSg0yss2S/fxwnvxz+MgpQKTSzGzbYQRHxMqn7fHKmBM
 2Tn4Ml8N+t0AYtqcI5ek0S1O1IFLWtbDJohng10hzyda5LGYYxyBuz/Jm1udXYgoMnTI
 BzhWRcFQzSubg3unftcj7TlHhqQa5ULFCOSuoSXLGKLoQpptH0M2o0HssJl6vSZIB5vF
 /1QA==
X-Gm-Message-State: AOAM5304GJ9hEoVjYMfITD7hxffscx96Q7XOzn7qUJ6fBoG1PzRvo/gy
 MN+uTFXznXo5WmttCh4KG/fsWOk08Ea4pDXNAlv3JhtIc01FyY0LVfLhJnPvOk9rF/XWdUUs0pY
 HjbdHP5Azj2aDVlBnqrKEa0/nBG95wLU=
X-Received: by 2002:a1f:9301:: with SMTP id v1mr3286079vkd.7.1609937402596;
 Wed, 06 Jan 2021 04:50:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHsrELnmPpuGcQWPzUWds6/NAChFk7KR0JOg5jIPDuzGlWSS94cATgi+aEf8jOGlyzUlzPy9C1q1pHffXP5co=
X-Received: by 2002:a1f:9301:: with SMTP id v1mr3286054vkd.7.1609937402305;
 Wed, 06 Jan 2021 04:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20210101231215.1870611-1-f4bug@amsat.org>
 <20210101231215.1870611-6-f4bug@amsat.org>
In-Reply-To: <20210101231215.1870611-6-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 6 Jan 2021 09:49:51 -0300
Message-ID: <CAKJDGDav50equFPwZNiMo2Bn=cPN8y9zN7Tct3oFefuDPttovQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/5] tests/integration: Test Fuloong2E IDE drive, run
 userspace commands
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 1, 2021 at 8:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Boot rootfs build by Guenter Roeck [*].
>
> Full test output:
>
>   $ avocado --show=3Dapp,console run -t machine:fuloong2e tests/acceptanc=
e/
>   Fetching asset from tests/acceptance/boot_linux_console.py:BootLinuxCon=
sole.test_mips64el_fuloong2e
>   Fetching asset from tests/acceptance/boot_linux_console.py:BootLinuxCon=
sole.test_mips64el_fuloong2e
>   JOB ID     : 4a89d17bd6fa596220113ea9b974412c37c6cf9a
>   JOB LOG    : /home/phil/avocado/job-results/job-2021-01-01T23.54-4a89d1=
7/job.log
>    (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mip=
s64el_fuloong2e:
>   console: [    0.000000] Initializing cgroup subsys cpuset
>   console: [    0.000000] Initializing cgroup subsys cpu
>   console: [    0.000000] Initializing cgroup subsys cpuacct
>   console: [    0.000000] Linux version 3.16.0-6-loongson-2e (debian-kern=
el@lists.debian.org) (gcc version 4.8.4 (Debian 4.8.4-1) ) #1 Debian 3.16.5=
6-1+deb8u1 (2018-05-08)
>   console: [    0.000000] memsize=3D256, highmemsize=3D0
>   console: [    0.000000] CpuClock =3D 100000000
>   console: [    0.000000] bootconsole [early0] enabled
>   console: [    0.000000] CPU0 revision is: 00006302 (ICT Loongson-2)
>   console: [    0.000000] FPU revision is: 00000501
>   console: [    0.000000] Checking for the multiply/shift bug... no.
>   console: [    0.000000] Checking for the daddiu bug... no.
>   console: [    0.000000] Determined physical RAM map:
>   console: [    0.000000]  memory: 0000000010000000 @ 0000000000000000 (u=
sable)
>   console: [    0.000000]  memory: 0000000004000000 @ 0000000010000000 (r=
eserved)
>   console: [    0.000000]  memory: 0000000003ffffff @ 000000001c000001 (r=
eserved)
>   console: [    0.000000] Initrd not found or empty - disabling initrd
>   console: [    0.000000] Zone ranges:
>   console: [    0.000000]   DMA      [mem 0x00000000-0x00ffffff]
>   console: [    0.000000]   Normal   [mem 0x01000000-0x0fffffff]
>   console: [    0.000000] Movable zone start for each node
>   console: [    0.000000] Early memory node ranges
>   console: [    0.000000]   node   0: [mem 0x00000000-0x0fffffff]
>   console: [    0.000000] Reserving 0MB of memory at 0MB for crashkernel
>   console: [    0.000000] Primary instruction cache 64kB, VIPT, direct ma=
pped, linesize 32 bytes.
>   console: [    0.000000] Primary data cache 64kB, 4-way, VIPT, no aliase=
s, linesize 32 bytes
>   console: [    0.000000] Unified secondary cache 512kB 4-way, linesize 3=
2 bytes.
>   console: [    0.000000] Built 1 zonelists in Zone order, mobility group=
ing on.  Total pages: 16327
>   console: [    0.000000] Kernel command line: printk.time=3D0 console=3D=
ttyS0 root=3D/dev/sda ro panic=3D-1 noreboot
>   console: PID hash table entries: 1024 (order: -1, 8192 bytes)
>   console: Dentry cache hash table entries: 32768 (order: 4, 262144 bytes=
)
>   console: Inode-cache hash table entries: 16384 (order: 3, 131072 bytes)
>   console: Memory: 250752K/262144K available (5597K kernel code, 716K rwd=
ata, 1548K rodata, 480K init, 581K bss, 11392K reserved)
>   console: NR_IRQS:128
>   console: Console: colour dummy device 80x25
>   console: Calibrating delay loop... 118.60 BogoMIPS (lpj=3D237216)
>   console: pid_max: default: 32768 minimum: 301
>   console: Security Framework initialized
>   console: AppArmor: AppArmor disabled by boot time parameter
>   console: Yama: disabled by default; enable with sysctl kernel.yama.*
>   console: Mount-cache hash table entries: 2048 (order: 0, 16384 bytes)
>   console: Mountpoint-cache hash table entries: 2048 (order: 0, 16384 byt=
es)
>   console: Initializing cgroup subsys memory
>   console: Initializing cgroup subsys devices
>   console: Initializing cgroup subsys freezer
>   console: Initializing cgroup subsys net_cls
>   console: Initializing cgroup subsys blkio
>   console: Initializing cgroup subsys perf_event
>   console: Initializing cgroup subsys net_prio
>   console: Checking for the daddi bug... no.
>   console: ftrace: allocating 17617 entries in 18 pages
>   console: devtmpfs: initialized
>   console: futex hash table entries: 256 (order: -2, 6144 bytes)
>   console: NET: Registered protocol family 16
>   console: vgaarb: loaded
>   console: SCSI subsystem initialized
>   console: PCI host bridge to bus 0000:00
>   console: pci_bus 0000:00: root bus resource [mem 0x14000000-0x1c000000]
>   console: pci_bus 0000:00: root bus resource [io  0x4000-0xffff]
>   console: pci_bus 0000:00: No busn resource found for root bus, will use=
 [bus 00-ff]
>   console: via686b fix: ISA bridge
>   console: via686b fix: ISA bridge done
>   console: pci 0000:00:05.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01=
f7]
>   console: pci 0000:00:05.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
>   console: pci 0000:00:05.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x01=
77]
>   console: pci 0000:00:05.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
>   console: via686b fix: IDE
>   console: via686b fix: IDE done
>   console: pci 0000:00:05.4: quirk: [io  0xeee0-0xeeef] claimed by vt82c6=
86 SMB
>   console: pci 0000:00:07.0: BAR 6: assigned [mem 0x14000000-0x1403ffff p=
ref]
>   console: pci 0000:00:07.0: BAR 0: assigned [io  0x4000-0x40ff]
>   console: pci 0000:00:07.0: BAR 1: assigned [mem 0x14040000-0x140400ff]
>   console: pci 0000:00:05.2: BAR 4: assigned [io  0x4400-0x441f]
>   console: pci 0000:00:05.3: BAR 4: assigned [io  0x4420-0x443f]
>   console: Switched to clocksource MIPS
>   console: NET: Registered protocol family 2
>   console: TCP established hash table entries: 2048 (order: 0, 16384 byte=
s)
>   console: TCP bind hash table entries: 2048 (order: 0, 16384 bytes)
>   console: TCP: Hash tables configured (established 2048 bind 2048)
>   console: TCP: reno registered
>   console: UDP hash table entries: 512 (order: 0, 16384 bytes)
>   console: UDP-Lite hash table entries: 512 (order: 0, 16384 bytes)
>   console: NET: Registered protocol family 1
>   console: PCI: Enabling device 0000:00:05.2 (0000 -> 0001)
>   console: PCI: Enabling device 0000:00:05.3 (0000 -> 0001)
>   console: audit: initializing netlink subsys (disabled)
>   console: audit: type=3D2000 audit(1609541667.424:1): initialized
>   console: HugeTLB registered 32 MB page size, pre-allocated 0 pages
>   console: zbud: loaded
>   console: VFS: Disk quotas dquot_6.5.2
>   console: Dquot-cache hash table entries: 2048 (order 0, 16384 bytes)
>   console: msgmni has been set to 489
>   console: alg: No test for stdrng (krng)
>   console: Block layer SCSI generic (bsg) driver version 0.4 loaded (majo=
r 252)
>   console: io scheduler noop registered
>   console: io scheduler deadline registered
>   console: io scheduler cfq registered (default)
>   console: Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
>   console: console [ttyS0] disabled
>   console: serial8250.0: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115=
200) is a 16550A
>   console: console [ttyS0] enabled
>   console: console [ttyS0] enabled
>   console: bootconsole [early0] disabled
>   console: bootconsole [early0] disabled
>   console: pata_via 0000:00:05.1: BMDMA: BAR4 is zero, falling back to PI=
O
>   console: scsi0 : pata_via
>   console: scsi1 : pata_via
>   console: ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
>   console: ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
>   console: serio: i8042 KBD port at 0x60,0x64 irq 1
>   console: serio: i8042 AUX port at 0x60,0x64 irq 12
>   console: mousedev: PS/2 mouse device common for all mice
>   console: rtc_cmos rtc_cmos: rtc core: registered rtc_cmos as rtc0
>   console: rtc_cmos rtc_cmos: alarms up to one day, 114 bytes nvram
>   console: ata1.00: ATA-7: QEMU HARDDISK, 2.5+, max UDMA/100
>   console: ata1.00: 15320 sectors, multi 16: LBA48
>   console: ledtrig-cpu: registered to indicate activity on CPUs
>   console: TCP: cubic registered
>   console: NET: Registered protocol family 10
>   console: input: AT Raw Set 2 keyboard as /devices/platform/i8042/serio0=
/input/input0
>   console: ata1.00: configured for PIO4
>   console: mip6: Mobile IPv6
>   console: NET: Registered protocol family 17
>   console: mpls_gso: MPLS GSO support
>   console: registered taskstats version 1
>   console: rtc_cmos rtc_cmos: setting system clock to 2021-01-01 22:54:20=
 UTC (1609541660)
>   console: scsi 0:0:0:0: Direct-Access     ATA      QEMU HARDDISK    2.5+=
 PQ: 0 ANSI: 5
>   console: input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8=
042/serio1/input/input2
>   console: sd 0:0:0:0: [sda] 15320 512-byte logical blocks: (7.84 MB/7.48=
 MiB)
>   console: sd 0:0:0:0: [sda] Write Protect is off
>   console: sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, d=
oesn't support DPO or FUA
>   console: sda: unknown partition table
>   console: sd 0:0:0:0: [sda] Attached SCSI disk
>   console: EXT4-fs (sda): mounting ext3 file system using the ext4 subsys=
tem
>   console: EXT4-fs (sda): mounted filesystem with ordered data mode. Opts=
: (null)
>   console: VFS: Mounted root (ext3 filesystem) readonly on device 8:0.
>   console: Freeing unused kernel memory: 480K (ffffffff808b8000 - fffffff=
f80930000)
>   console: random: nonblocking pool is initialized
>   console: EXT4-fs (sda): re-mounted. Opts: errors=3Dremount-ro,data=3Dor=
dered
>   console: Boot successful.
>   console: cat /proc/cpuinfo
>   console: / # cat /proc/cpuinfo
>   console: system type            : lemote-fuloong-2e-box
>   console: machine                        : Unknown
>   console: processor              : 0
>   console: cpu model              : ICT Loongson-2 V0.2  FPU V0.1
>   console: BogoMIPS               : 118.60
>   console: wait instruction       : nouname -a
>   console: microsecond timers     : yes
>   console: tlb_entries            : 64
>   console: extra interrupt vector : no
>   console: hardware watchpoint    : yes, count: 0, address/irw mask: []
>   console: isa                    : mips1 mips2 mips3
>   console: ASEs implemented       :
>   console: shadow register sets   : 1
>   console: kscratch registers     : 0
>   console: package                        : 0
>   console: core                   : 0
>   console: VCED exceptions                : not available
>   console: VCEI exceptions                : not available
>   console: / # uname -a
>   console: Linux (none) 3.16.0-6-loongson-2e #1 Debian 3.16.56-1+deb8u1 (=
2018-05-08) mips64 GNU/Linux
>   console: reboot
>   console: / # reboot
>   console: / # umount: devtmpfs busy - remounted read-only
>   console: EXT4-fs (sda): re-mounted. Opts: (null)
>   console: The system is going down NOW!
>   console: Sent SIGTERM to all processes
>   console: Sent SIGKILL to all processes
>   console: Requesting system reboot
>   console: sd 0:0:0:0: [sda] Synchronizing SCSI cache
>   console: reboot: Restarting system
>   PASS (8.44 s)
>   RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
>   JOB TIME   : 8.85 s
>
> [*] https://github.com/groeck/linux-build-test/
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Guenter Roeck <linux@roeck-us.net>
> ---
>  tests/acceptance/boot_linux_console.py | 30 ++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


