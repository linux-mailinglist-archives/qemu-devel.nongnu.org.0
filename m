Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29CB6CB1CD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 00:28:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgvJG-0008Rq-5n; Mon, 27 Mar 2023 18:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1pgvJE-0008Ri-CW
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:27:24 -0400
Received: from mailgw.felk.cvut.cz ([147.32.82.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1pgvJA-0007tN-AQ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:27:24 -0400
Received: from mailgw.felk.cvut.cz (localhost.localdomain [127.0.0.1])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTP id 5E4D630DF69E;
 Tue, 28 Mar 2023 00:26:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 cmp.felk.cvut.cz; h=cc:cc:content-transfer-encoding:content-type
 :content-type:date:from:from:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=felkmail; bh=22HEy
 pFl3C8hX9ye2RMiWEIMnvbT+XsH6kWDFSfGX5s=; b=kKn0LveAmKLFJJnVAkQqF
 d2Vs8GvSQ1IBtIDa6mqwm8Z8ULf9k3H1HThcUby2pMSiYv7k8TD5N4CeX6eUBPTU
 rGZIUcQYQ8ar3dd7LRj+EGk3IKoO34Jwlis2eW1Y8oPbl2rhcJvZYEIx+dcR9go+
 4vfYyZ01k4FVRsRgLB6l0KVcEKpYCYjES0CGzcN4B/4/znEo0AtP9s9U0eVS5oiw
 Akg4yEdRPARCUQ4ekXwSo74AHVj88qVf+HMHETCUDDLX044ta4FxG5WMnLLc6z+T
 xRDZ75etrWgs6ePOhLHy56APNr6t0CnDHemFv+hMt6g4bbw/GRJ04d+zlTqdzFyd
 Q==
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTPS id 920CF30B296A;
 Tue, 28 Mar 2023 00:26:37 +0200 (CEST)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 32RMQbGh013283; Tue, 28 Mar 2023 00:26:37 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 32RMQaEL013281;
 Tue, 28 Mar 2023 00:26:36 +0200
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v2] hw/net/can: Add mcp25625 model
Date: Tue, 28 Mar 2023 00:26:09 +0200
User-Agent: KMail/1.9.10
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, fnu.vikram@xilinx.com,
 nazar.kazakov@codethink.co.uk, lawrence.hunter@codethink.co.uk,
 frank.chang@sifive.com, paul.walmsley@sifive.com,
 Ben Dooks <ben.dooks@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230316124113.148463-1-ben.dooks@codethink.co.uk>
 <202303171511.00937.pisa@cmp.felk.cvut.cz>
 <e37a42ad-dcb9-05f1-7541-8fe861bfcc79@codethink.co.uk>
In-Reply-To: <e37a42ad-dcb9-05f1-7541-8fe861bfcc79@codethink.co.uk>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202303280026.09873.pisa@cmp.felk.cvut.cz>
Received-SPF: none client-ip=147.32.82.15; envelope-from=pisa@cmp.felk.cvut.cz;
 helo=mailgw.felk.cvut.cz
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Ben,

On Thursday 16 of March 2023 13:41:13 Ben Dooks wrote:
> From: Ben Dooks <ben.dooks@sifive.com>
>
> Add support for Microchip MCP25625 SPI based CAN controller which is
> very similar to the MCP2515 (and covered by the same Linux driver).
>
> This can be added to any machine with SPI support in the machine
> model file.
>
> Example for using this when configured into a machine:
>
> 	-object can-bus,id=canbus0 \
> 	-object can-host-socketcan,id=canhost0,if=vcan0,canbus=canbus0 \
> 	-global driver=mcp25625,property=canbus,value=canbus0
>
> There is tracing support with --trace "*mcp25*"
>
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
> Co-developed-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Co-developed-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Tested-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>

I have used your test branch

https://gitlab.com/CodethinkLabs/qemu/-/commits/mcp25625_test

I confirm that it contains unmodified mcp25625 model patch
applied directly to QEMU master and then additional patches
for actual integration with qemu/hw/riscv/sifive_u.c

I have used stripped down initramfs system build from
debootstraped Debian Bookworm - GLIBC, busybox, ip route,
can-utils and Linux kernel have been used. Kernel version

  Linux (none) 6.1.0-7-riscv64 #1 SMP Debian 6.1.20-1 (2023-03-19)
  riscv64 GNU/Linux  

QEMU invocation command

  qemu-system-riscv64 -m 1G -M sifive_u -smp 2 \
      -initrd ramdisk.cpio \
      -kernel vmlinux-6.1.0-7-riscv64 \
      -nographic \
      -object can-bus,id=canbus0 \
      -object can-host-socketcan,id=canhost0,if=can0,canbus=canbus0 \
      -global driver=mcp25625,property=canbus,value=canbus0

The virtual SocketCAN interface has been used on the host
side and mutual CAN dump/CAN gen has been used and worked
in the both directons.

I support inclusion of your patch in QEMU mainline
to allow keep it in sync with the rest of the projects.

But I would be happy if some integration is included as well.
Do you plan to submit your integration to qemu/hw/riscv/sifive_u.c
as well? If so, is there some plan to make mapping to SPI
configurable? May be some other developer could help with
suggestion what are the plans in SPI peripherals mapping
in QEMU.

The mapping of IRQ over SIFIVE_U_MISC_IRQ in your followup
testing patches seems to me quite ad-hock solution.
It should go through some GPIO pin on a real board
probably.

I would like to see at least one more system and
architecture to provide option to map and test
the mcp25625 model. Raspberry Pi or some other
ARM would be nice.

Anyway, I would suggest to think about integration
of CAN/CAN FD controller to SiFive SoC directly
on the CPU bus because access over SPI causes
latencies as I have already pointed to Martin Prudek's
thesis prepared for Honeywell when we tried to enhance
their choice of Raspberry Pi Matlab Simulink target
used with SPI based Microchip CAN controller

  https://dspace.cvut.cz/bitstream/handle/10467/68605/F3-DP-2017-Prudek-Martin-Dp_2017_prudek_martin.pdf

See Figure 6.27. Cumulative latency histogram of CAN messages
on page 43...

We have lot more data and tools now from our CAN latency
tester project based on our CTU CAN FD IP core.
There is some documentation in Matej Vasilevski's
thesis

  https://dspace.cvut.cz/bitstream/handle/10467/101450/F3-DP-2022-Vasilevski-Matej-vasilmat.pdf

and the followup project with continuous latency
testing on actual Linux kernel mainline and preemp-rt
will be submitted by this June.

Best wishes,

                Pavel Pisa
    phone:      +420 603531357
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://control.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/
    RISC-V education: https://comparch.edu.cvut.cz/
    Open Technologies Research Education and Exchange Services
    https://gitlab.fel.cvut.cz/otrees/org/-/wikis/home



On Tuesday 21 of March 2023 11:49:15 Ben Dooks wrote:
> On 17/03/2023 14:11, Pavel Pisa wrote:
> > Hello Ben,
> >
> > thanks for update.
> >
> > On Thursday 16 of March 2023 13:41:13 Ben Dooks wrote:
> >> From: Ben Dooks <ben.dooks@sifive.com>
> >>
> >> Add support for Microchip MCP25625 SPI based CAN controller which is
> >> very similar to the MCP2515 (and covered by the same Linux driver).
> >>
> >> This can be added to any machine with SPI support in the machine
> >> model file.
> >>
> >> Example for using this when configured into a machine:
> >>
> >> 	-object can-bus,id=canbus0 \
> >> 	-object can-host-socketcan,id=canhost0,if=vcan0,canbus=canbus0 \
> >> 	-global driver=mcp25625,property=canbus,value=canbus0
> >>
> >> There is tracing support with --trace "*mcp25*"
> >
> > Code looks good, I have patched actual QEMU sources and build
> > it successfully with your change.
> >
> > I have not seen any warning.
> >
> > I would like to test the mcp25625 CAN functionality.
> >
> > I would prefer against some target which is already available
> > in QEMU and Linux kernel mainlines, so if somebody can suggest
> > some ARM which can connect SPI/SSI device it would be great.
> >
> > I have setup /srv/nfs/debian-riscv64 chroot and used
> > it to prepare minimal 3 MB ramdisk.cpio with busybox
> > and full GLIBC and ip package.
> >
> > I can run it with Debian provided RISC-V kernel
> > under QEMU compiled with your mcp25625 chip emulation
> >
> > qemu-system-riscv64 -m 1G -M sifive_u -smp 2 \
> >        -initrd ramdisk.cpio \
> >        -kernel vmlinux-6.1.0-6-riscv64 \
> >        -nographic \
> >        -object can-bus,id=canbus0 \
> >        -object can-host-socketcan,id=canhost0,if=can0,canbus=canbus0 \
> >        -global driver=mcp25625,property=canbus,value=canbus0
> >
> > I can see
> >
> > /sys/bus/platform/devices/10040000.spi
> > /sys/bus/platform/devices/10050000.spi
> >
> > I can run
> >
> >    modprobe spi-sifive.ko
> >
> > [   41.524160] sifive_spi 10040000.spi: mapped; irq=21, cs=1
> > [   41.529305] sifive_spi 10050000.spi: mapped; irq=22, cs=1
> >
> >    modprobe mcp251x.ko
> >
> > I can imagine to build device tree overlay and setup it from within
> > kernel if the device is already mapped
> >
> >    cd /sys/kernel/config/device-tree/overlays
> >    [ -d  sifive_u-mcp25625 ] && rmdir sifive_u-mcp25625
> >    mkdir sifive_u-mcp25625
> >    cd sifive_u-mcp25625
> >    cat sifive_u-mcp25625.dtbo >dtbo
> >    echo 1 >status
> >
> > which is what we do with CTU CAN FD ip on Zynq system
> > to run PL/FPGA update.
> >
> > But from QEMU info qtree, I see that device is not mapped in QEMU...
> > Which is logic...
> >
> > So please, can you send instruction how to proceed forward.
> >
> > Do you have DTB prepared for testing or something similar?
> >
> > In a longer term perspective, it would be ideal to provide
> > some update for documentation, how to use mcp25625 emulation
> >
> >    https://www.qemu.org/docs/master/system/devices/can.html
> >
> > By the way, if the Raspberry Pi emulation does not provide
> > right SPI emulation as you have noticed, what about BeagleBoneBlack?
>
> At the moment it seems that the as a whole qemu doesn't have a good
> way of adding a generic spi device to a bus.
>
> > Does it support SPI? It could be good target to test that mcp25625
> > chip emulation is portable..
>
> I've pushed our test branch out to:
> https://gitlab.com/CodethinkLabs/qemu/-/commits/mcp25625_test
>
> That adds an spi channel to the sifive_u machine and puts the
> right dtb entry in there.



