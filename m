Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B76BEACD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdAor-0004hQ-8Z; Fri, 17 Mar 2023 10:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1pdAom-0004gz-GU
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:12:29 -0400
Received: from mailgw.felk.cvut.cz ([147.32.82.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1pdAoj-0003OY-WC
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:12:28 -0400
Received: from mailgw.felk.cvut.cz (localhost.localdomain [127.0.0.1])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTP id CFF6430DF6B9;
 Fri, 17 Mar 2023 15:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 cmp.felk.cvut.cz; h=cc:cc:content-transfer-encoding:content-type
 :content-type:date:from:from:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=felkmail; bh=aXWl+
 Fw1UnXRrkJt/zKu1dsNgf05EiYXIRAWwRtLEJE=; b=PPQ7AXwwAy3V3k81xq+T2
 CXVmsQJyj4T5M5WsBrHhgHrY9Xr0LxWWds94tnjAH+ACQlHmnpD11EI+Oe7wU531
 6MaZLTbOFRsLctbFBJ59uazkaFPPJj9kehvqyA+hNFY9bGCkv43dETNBGoiIhziX
 0PLrYUTTsHjGliEnm3AA0IU3QJHb8OjEQUKjW+AWmY2MYODv54WvoeQBfIPC1VQQ
 tz4ElmPbaTuPjfeu4837Wj00jMlzcvy09wWiT3u8iQortofHgMA+T1pSkK6iYLwM
 xMtcBP1zeOkrt3wrLvzNEIJoISSNyEyGKu+bJIklz0Pk0H9VvVAM2zEFt89rFTRH
 w==
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTPS id A5F0630DF6A9;
 Fri, 17 Mar 2023 15:11:40 +0100 (CET)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 32HEBeKm003935; Fri, 17 Mar 2023 15:11:40 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 32HEBdiV003933;
 Fri, 17 Mar 2023 15:11:39 +0100
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v2] hw/net/can: Add mcp25625 model
Date: Fri, 17 Mar 2023 15:11:00 +0100
User-Agent: KMail/1.9.10
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, fnu.vikram@xilinx.com,
 nazar.kazakov@codethink.co.uk, lawrence.hunter@codethink.co.uk,
 frank.chang@sifive.com, paul.walmsley@sifive.com,
 Ben Dooks <ben.dooks@sifive.com>
References: <20230316124113.148463-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20230316124113.148463-1-ben.dooks@codethink.co.uk>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202303171511.00937.pisa@cmp.felk.cvut.cz>
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

thanks for update.

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

Code looks good, I have patched actual QEMU sources and build
it successfully with your change.

I have not seen any warning.

I would like to test the mcp25625 CAN functionality.

I would prefer against some target which is already available
in QEMU and Linux kernel mainlines, so if somebody can suggest
some ARM which can connect SPI/SSI device it would be great.

I have setup /srv/nfs/debian-riscv64 chroot and used
it to prepare minimal 3 MB ramdisk.cpio with busybox
and full GLIBC and ip package.

I can run it with Debian provided RISC-V kernel
under QEMU compiled with your mcp25625 chip emulation

qemu-system-riscv64 -m 1G -M sifive_u -smp 2 \
      -initrd ramdisk.cpio \
      -kernel vmlinux-6.1.0-6-riscv64 \
      -nographic \
      -object can-bus,id=canbus0 \
      -object can-host-socketcan,id=canhost0,if=can0,canbus=canbus0 \
      -global driver=mcp25625,property=canbus,value=canbus0

I can see

/sys/bus/platform/devices/10040000.spi
/sys/bus/platform/devices/10050000.spi

I can run

  modprobe spi-sifive.ko

[   41.524160] sifive_spi 10040000.spi: mapped; irq=21, cs=1
[   41.529305] sifive_spi 10050000.spi: mapped; irq=22, cs=1

  modprobe mcp251x.ko

I can imagine to build device tree overlay and setup it from within
kernel if the device is already mapped

  cd /sys/kernel/config/device-tree/overlays
  [ -d  sifive_u-mcp25625 ] && rmdir sifive_u-mcp25625
  mkdir sifive_u-mcp25625
  cd sifive_u-mcp25625
  cat sifive_u-mcp25625.dtbo >dtbo
  echo 1 >status

which is what we do with CTU CAN FD ip on Zynq system
to run PL/FPGA update.

But from QEMU info qtree, I see that device is not mapped in QEMU...
Which is logic...

So please, can you send instruction how to proceed forward.

Do you have DTB prepared for testing or something similar?

In a longer term perspective, it would be ideal to provide
some update for documentation, how to use mcp25625 emulation

  https://www.qemu.org/docs/master/system/devices/can.html

By the way, if the Raspberry Pi emulation does not provide
right SPI emulation as you have noticed, what about BeagleBoneBlack?

Does it support SPI? It could be good target to test that mcp25625
chip emulation is portable..

Best wishes,
                Pavel
--
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


