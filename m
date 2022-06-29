Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B855F345
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 04:12:41 +0200 (CEST)
Received: from localhost ([::1]:52200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6NC4-0008Os-Ew
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 22:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6N98-0006Xg-4R
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 22:09:38 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:39484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6N95-00020x-IT
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 22:09:37 -0400
Received: by mail-pg1-x536.google.com with SMTP id q140so13908772pgq.6
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 19:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZUbfZ3h9759D85Rhtlz1h02xJtCxey7DUNfPCoeNtKQ=;
 b=nAFrRAoGjGJTqt8L90zs4KyZeQJBx4p37uDn2YqbI9JymFj9x53cZZ1yNabRYN2Hjk
 GJV8//U0MzvzRSEVvD7w4hSTc7eI3RI5wWsDs0vMNa+Pys9CU/X72kZoIg/+rjjKT5pG
 mrf9RmyC38StvlNP4vtRXQkgOZtoKUAU8QykVA0DThhSdo1Lw6K1tTiCe6wLn1JZGnh7
 xtCH5VxuLmftdi5DjkgeRDUzcUYW7mOzD4tOopCybrqI84wc358G68qY4rcIqPKGiJr7
 WVpAUlzxx5ZVyzzOSU+RUaFiKn6keeBHNSLQn7RMtIX1dLH3ZvS7u/RJOjp0liXwNmLm
 IcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZUbfZ3h9759D85Rhtlz1h02xJtCxey7DUNfPCoeNtKQ=;
 b=7mWzkMWng5K3O3n4bGfQe+H36h5mj5wKYzhjAkJroAr54oj9Ick2diva/HZcx2avyl
 52fWSMVlHpMT2AB8MfAgnCOnhe7A9XyfqlTGsU8WljfWQ2YI6gQuLzfMVmVDt05/i3cc
 BGeU6mxiuaDQyyiMIYyBvsQAph5C5Zx2pWtiuFllps6bPbsQeUAQJc8gM9JAGvlc7kuF
 ZZJB/Zi46ZI0ux3EddcYq75Rebys7UsyI7/qK4Ypi+WcZV2V09KbuQqLDn1ft4sT/xa7
 GQDWphdYnxlcBH8H1YjrMwpk4da52m2NgxvR3CXb+61a3bJeQQ4XNIFjvpgG/fKh+2rS
 TQbw==
X-Gm-Message-State: AJIora9vV3Y2hECdPJ9GrHdFh7bZgX99j6ZxT/2+kcaMCXyccME6EumT
 VKJp6DrtmVe7nbPna1qNiYfecx6rwZax/lLbKenfyXrS0Sds/V1N
X-Google-Smtp-Source: AGRyM1sOmJlo+o3dq4WKigBVA3d3JukBBV/VWa8ZEwdm4/YDvrEO6WLciAg2WlMvvWnYN9E+aRELEgGxxxdkyHghoKI=
X-Received: by 2002:a05:6a00:1307:b0:50d:b02e:11df with SMTP id
 j7-20020a056a00130700b0050db02e11dfmr6735367pfu.4.1656468574012; Tue, 28 Jun
 2022 19:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220613115810.178210-1-Jason@zx2c4.com>
In-Reply-To: <20220613115810.178210-1-Jason@zx2c4.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Jun 2022 12:09:07 +1000
Message-ID: <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 13, 2022 at 10:10 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> initialize early. Set this using the usual guest random number
> generation function. This is confirmed to successfully initialize the
> RNG on Linux 5.19-rc2.

I have a Linux 5.8 test case that is failing due to this patch.

The command line is:

qemu-system-riscv64 \
-machine virt -m 64M \
-cpu rv64,mmu=false \
-serial mon:stdio -serial null -nographic \
-append "root=/dev/vda rw highres=off  console=ttyS0 mem=1G ip=dhcp
earlycon=sbi" \
-device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02 \
-netdev user,id=net0 \
-object rng-random,filename=/dev/urandom,id=rng0 \
-device virtio-rng-device,rng=rng0 \
-smp 1  \
-d guest_errors \
-kernel ./images/qemuriscv64/nommu-Image \
-drive id=disk0,file=./images/qemuriscv64/nommu-rootfs.ext2,if=none,format=raw \
-device virtio -blk-device,drive=disk0 \
-bios none

The working log (before this commit) is:

[    0.000000] Linux version 5.8.0 (alistair@risc6-mainframe)
(riscv64-elf-gcc (Arch Linux Repositories) 10.1.0, GNU ld (GNU
Binutils) 2.34) #2 SMP Wed Sep
30 12:02:11 PDT 2020
[    0.000000] earlycon: uart8250 at MMIO 0x0000000010000000 (options
'115200n8')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x0000000083ffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x0000000083ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x0000000083ffffff]
[    0.000000] riscv: ISA extensions abcdefhimnrs
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: max_distance=0xc000 too large for vmalloc space 0x0
[    0.000000] percpu: Embedded 12 pages/cpu s18528 r0 d30624 u49152
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16160
[    0.000000] Kernel command line: root=/dev/vda rw
earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0
[    0.000000] Dentry cache hash table entries: 8192 (order: 4, 65536
bytes, linear)
[    0.000000] Inode-cache hash table entries: 4096 (order: 3, 32768
bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 62472K/65536K available (1369K kernel code,
144K rwdata, 238K rodata, 106K init, 134K bss, 3064K reserved, 0K
cma-reserved)
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
sifive_plic_read: Invalid register read 0x200c
sifive_plic_write: Invalid enable write 0x200c
[    0.000000] plic: plic@c000000: mapped 96 interrupts with 1
handlers for 2 contexts.
[    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [0]
[    0.000000] clocksource: riscv_clocksource: mask:
0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120
ns
[    0.000106] sched_clock: 64 bits at 10MHz, resolution 100ns, wraps
every 4398046511100ns
[    0.002649] Console: colour dummy device 80x25
[    0.003599] Calibrating delay loop (skipped), value calculated
using timer frequency.. 20.00 BogoMIPS (lpj=40000)
[    0.003960] pid_max: default: 4096 minimum: 301
[    0.004718] Mount-cache hash table entries: 512 (order: 0, 4096
bytes, linear)
[    0.004922] Mountpoint-cache hash table entries: 512 (order: 0,
4096 bytes, linear)
[    0.022781] rcu: Hierarchical SRCU implementation.
[    0.024374] smp: Bringing up secondary CPUs ...
[    0.024583] smp: Brought up 1 node, 1 CPU
[    0.030450] devtmpfs: initialized
[    0.035183] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.035600] futex hash table entries: 16 (order: -2, 1024 bytes, linear)
[    0.055175] clocksource: Switched to clocksource riscv_clocksource
[    0.073226] workingset: timestamp_bits=62 max_order=14 bucket_order=0
[    0.078326] Serial: 8250/16550 driver, 1 ports, IRQ sharing disabled
[    0.082509] printk: console [ttyS0] disabled
[    0.083408] 10000000.uart: ttyS0 at MMIO 0x10000000 (irq = 2,
base_baud = 230400) is a 16550A
[    0.084805] printk: console [ttyS0] enabled
[    0.084805] printk: console [ttyS0] enabled
[    0.085242] printk: bootconsole [uart8250] disabled
[    0.085242] printk: bootconsole [uart8250] disabled
virtio_mmio_write: attempt to write guest features with
guest_features_sel > 0 in legacy mode
[    0.095810] virtio_blk virtio2: [vda] 122880 512-byte logical
blocks (62.9 MB/60.0 MiB)
[    0.096155] vda: detected capacity change from 0 to 62914560
[    0.099882] random: get_random_bytes called from 0x0000000080020c8c
with crng_init=0
[    0.120690] EXT4-fs (vda): warning: mounting unchecked fs, running
e2fsck is recommended
[    0.160540] EXT4-fs (vda): mounted filesystem without journal. Opts: (null)
[    0.160910] VFS: Mounted root (ext4 filesystem) on device 254:0.
[    0.162645] devtmpfs: mounted
[    0.171902] Freeing unused kernel memory: 104K
[    0.172061] This architecture does not have kernel memory protection.
[    0.172387] Run /sbin/init as init process
[    0.174104] Run /etc/init as init process
[    0.174534] Run /bin/init as init process
[    0.174964] Run /bin/sh as init process


BusyBox v1.32.0 (2020-09-24 13:17:53 PDT) hush - the humble shell
Enter 'help' for a list of built-in commands.

After applying this commit all I see is:

Invalid read at addr 0x0, size 8, region '(null)', reason: rejected

It looks like the rng-seed property is causing failures on older kernels.

Alistair

>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/riscv/virt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index bc424dd2f5..368a723bf6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -21,6 +21,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
> +#include "qemu/guest-random.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> @@ -998,6 +999,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>      MachineState *mc = MACHINE(s);
>      uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
>      uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
> +    uint8_t rng_seed[32];
>
>      if (mc->dtb) {
>          mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
> @@ -1046,6 +1048,10 @@ update_bootargs:
>      if (cmdline && *cmdline) {
>          qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
>      }
> +
> +    /* Pass seed to RNG. */
> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
>  }
>
>  static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
> --
> 2.35.1
>
>

