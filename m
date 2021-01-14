Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3272F693A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:18:52 +0100 (CET)
Received: from localhost ([::1]:54330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07Ct-0004FL-BX
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l077N-0008GY-34; Thu, 14 Jan 2021 13:13:09 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:33494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l077K-0007lE-Gf; Thu, 14 Jan 2021 13:13:08 -0500
Received: by mail-lj1-x232.google.com with SMTP id u21so7553076lja.0;
 Thu, 14 Jan 2021 10:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yGs2ETkcarv3wjydbJzBfNoeJ9RIOo/NS00PvXo94ZI=;
 b=aBevwnU1IR9YWcz08fAgDO5lbltWsSEsCKEPCxKc/l694QfPfk+RWkd0vSG/zInL3j
 ct/GShsgo37AfkCrkFOfv7+GfHh0eDurSZ1Avte7wAyrx4LmknyHJ1QoarISdK4MhFAI
 hrNyYky0A9kqtcE8ppnY6XcwtP95Uubm5nRJna0xkwGLHH7ZyxTirULqC3fbr4xC41s4
 CXdFPFK9fEallZX/g2b31NhD6+A1xbh1wPhLAwxi7QKB+j26N99hAIpdkAY6HymcXgID
 m5ETNrzsvJpFfWoeQknDHN62pjl84NYQd8jbnv9MjTFy8tc3EyN4u0gknMll7RBa6VvU
 VCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yGs2ETkcarv3wjydbJzBfNoeJ9RIOo/NS00PvXo94ZI=;
 b=SGj/ekOwkn8RYIXiqZsGXHfhZaJxPc9O7BJRVAbWdxbr+h70CiCQjdGt6msoiyy+Hn
 bqM0RN76eQrE6krhrq5Agpg7hHHk6kgwpWqiIXWsgxbbuIvics7e693oI/ea/DmgRs5Q
 GXe29rr6DMT7wRlIVwIp2FIc+yBd149arqMIa4l4b7pFtAuBVHUt4Vuqp015Wgkf7kvH
 HjfRv6MUmN1l96/7Xf7TeWVhECYEkQ9CRg5WQ61FE2F32SyTkBZBUB2M1xtkRaUen8ub
 I0L5a8yVy4BHOjU6x7sgS07ViGa6PK1grhLFUlSykmMxBS22EA9DYbTv4va1MiWBf/93
 ztDw==
X-Gm-Message-State: AOAM530MSZv23kGdspLq/hZjGQAZbeSp0uKlzDEo2cP5eSZ4YpULtFeV
 cAl5cslFjcXQWNz+vjCyeGs=
X-Google-Smtp-Source: ABdhPJw3uPB+af3jSYF2Ag66OcE32sgWcF1gFJ5Yr+7GgvxucoHZ2xp52EiCN4sunES+koUR1pBMmg==
X-Received: by 2002:a2e:8113:: with SMTP id d19mr3409578ljg.303.1610647983211; 
 Thu, 14 Jan 2021 10:13:03 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 m83sm617881lfa.113.2021.01.14.10.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 10:13:02 -0800 (PST)
Date: Thu, 14 Jan 2021 19:13:00 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
Message-ID: <20210114181300.GA29923@fralle-msi>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Marcin Krzeminski <marcin.krzeminski@nokia.com>,
 Andrew Jeffery <andrew@aj.id.au>, Bin Meng <bin.meng@windriver.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin,

On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The m25p80 model uses s->needed_bytes to indicate how many follow-up
> bytes are expected to be received after it receives a command. For
> example, depending on the address mode, either 3-byte address or
> 4-byte address is needed.
> 
> For fast read family commands, some dummy cycles are required after
> sending the address bytes, and the dummy cycles need to be counted
> in s->needed_bytes. This is where the mess began.
> 
> As the variable name (needed_bytes) indicates, the unit is in byte.
> It is not in bit, or cycle. However for some reason the model has
> been using the number of dummy cycles for s->needed_bytes. The right
> approach is to convert the number of dummy cycles to bytes based on
> the SPI protocol, for example, 6 dummy cycles for the Fast Read Quad
> I/O (EBh) should be converted to 3 bytes per the formula (6 * 4 / 8).

While not being the original implementor I must assume that above solution was
considered but not chosen by the developers due to it is inaccuracy (it
wouldn't be possible to model exacly 6 dummy cycles, only a multiple of 8,
meaning that if the controller is wrongly programmed to generate 7 the error
wouldn't be caught and the controller will still be considered "correct"). Now
that we have this detail in the implementation I'm in favor of keeping it, this
also because the detail is already in use for catching exactly above error.

> 
> Things get complicated when interacting with different SPI or QSPI
> flash controllers. There are major two cases:
> 
> - Dummy bytes prepared by drivers, and wrote to the controller fifo.
>   For such case, driver will calculate the correct number of dummy
>   bytes and write them into the tx fifo. Fixing the m25p80 model will
>   fix flashes working with such controllers.

Above can be fixed while still keeping the detailed dummy cycle implementation
inside m25p80. Perhaps one of the following could be looked into: configurating
the amount, letting the spi ctrl fetch the amount from m25p80 or by inheriting
some functionality handling this in the SPI controller. Or a mixture of above.

> - Dummy bytes not prepared by drivers. Drivers just tell the hardware
>   the dummy cycle configuration via some registers, and hardware will
>   automatically generate dummy cycles for us. Fixing the m25p80 model
>   is not enough, and we will need to fix the SPI/QSPI models for such
>   controllers.
> 
> This series fixes the mess in the m25p80 from the flash side first,

Considering the problems solved by the solution in tree I find m25p80 pretty
clean, at least I don't see any clearly better way for accurately modeling the
dummy clock cycles. Counting bits instead of bytes would for example still
force the controllers to mark which bits to count (when transmitting one dummy
byte from a txfifo on four lines (Quad command) it generates 2 dummy clock
cycles since it takes two cycles to transfer 8 bits).

Best regards,
Francisco Iglesias


> followed by fixes to 3 known SPI controller models that fall into
> the 2nd case above.
> 
> Please note, I have no way to verify patch 7/8/9 because:
> 
> * There is no public datasheet available for the SoC / SPI controller
> * There is no QEMU docs, or details that tell people how to boot either
>   U-Boot or Linux kernel to verify the functionality
> 
> These 3 patches are very likely to be wrong. Hence I would like to ask
> help from the original author who wrote these SPI controller models
> to help testing, or completely rewrite these 3 patches to fix things.
> Thanks!
> 
> Patch 6 is unvalidated with QEMU, mainly because there is no doc to
> tell people how to boot anything to test. But I have some confidence
> based on my read of the ZynqMP manual, as well as some experimental
> testing on a real ZCU102 board.
> 
> Other flash patches can be tested with the SiFive SPI series:
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=222391
> 
> Cherry-pick patch 16 and 17 from the series above, and switch to
> different flash model to test with the following command:
> 
> $ qemu-system-riscv64 -nographic -M sifive_u -m 2G -smp 5 -kernel u-boot
> 
> I've picked up two for testing:
> 
> QEMU flash: "sst25vf032b"
> 
>   U-Boot 2020.10 (Jan 14 2021 - 21:55:59 +0800)
> 
>   CPU:   rv64imafdcsu
>   Model: SiFive HiFive Unleashed A00
>   DRAM:  2 GiB
>   MMC:
>   Loading Environment from SPIFlash... SF: Detected sst25vf032b with page size 256 Bytes, erase size 4 KiB, total 4 MiB
>   *** Warning - bad CRC, using default environment
> 
>   In:    serial@10010000
>   Out:   serial@10010000
>   Err:   serial@10010000
>   Net:   failed to get gemgxl_reset reset
> 
>   Warning: ethernet@10090000 MAC addresses don't match:
>   Address in DT is                52:54:00:12:34:56
>   Address in environment is       70:b3:d5:92:f0:01
>   eth0: ethernet@10090000
>   Hit any key to stop autoboot:  0
>   => sf probe
>   SF: Detected sst25vf032b with page size 256 Bytes, erase size 4 KiB,
>   total 4 MiB
>   => sf test 1ff000 1000
>   SPI flash test:
>   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
>   1 check: 10 ticks, 400 KiB/s 3.200 Mbps
>   2 write: 170 ticks, 23 KiB/s 0.184 Mbps
>   3 read: 9 ticks, 444 KiB/s 3.552 Mbps
>   Test passed
>   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
>   1 check: 10 ticks, 400 KiB/s 3.200 Mbps
>   2 write: 170 ticks, 23 KiB/s 0.184 Mbps
>   3 read: 9 ticks, 444 KiB/s 3.552 Mbps
> 
> QEMU flash: "mx66u51235f"
> 
>   U-Boot 2020.10 (Jan 14 2021 - 21:55:59 +0800)
> 
>   CPU:   rv64imafdcsu
>   Model: SiFive HiFive Unleashed A00
>   DRAM:  2 GiB
>   MMC:
>   Loading Environment from SPIFlash... SF: Detected mx66u51235f with page size 256 Bytes, erase size 4 KiB, total 64 MiB
>   *** Warning - bad CRC, using default environment
> 
>   In:    serial@10010000
>   Out:   serial@10010000
>   Err:   serial@10010000
>   Net:   failed to get gemgxl_reset reset
> 
>   Warning: ethernet@10090000 MAC addresses don't match:
>   Address in DT is                52:54:00:12:34:56
>   Address in environment is       70:b3:d5:92:f0:01
>   eth0: ethernet@10090000
>   Hit any key to stop autoboot:  0
>   => sf probe
>   SF: Detected mx66u51235f with page size 256 Bytes, erase size 4 KiB, total 64 MiB
>   => sf test 0 8000
>   SPI flash test:
>   0 erase: 1 ticks, 32000 KiB/s 256.000 Mbps
>   1 check: 80 ticks, 400 KiB/s 3.200 Mbps
>   2 write: 83 ticks, 385 KiB/s 3.080 Mbps
>   3 read: 79 ticks, 405 KiB/s 3.240 Mbps
>   Test passed
>   0 erase: 1 ticks, 32000 KiB/s 256.000 Mbps
>   1 check: 80 ticks, 400 KiB/s 3.200 Mbps
>   2 write: 83 ticks, 385 KiB/s 3.080 Mbps
>   3 read: 79 ticks, 405 KiB/s 3.240 Mbps
> 
> I am sure there will be bugs, and I have not tested all flashes affected.
> But I want to send out this series for an early discussion and comments.
> I will continue my testing.
> 
> 
> Bin Meng (9):
>   hw/block: m25p80: Fix the number of dummy bytes needed for Windbond
>     flashes
>   hw/block: m25p80: Fix the number of dummy bytes needed for
>     Numonyx/Micron flashes
>   hw/block: m25p80: Fix the number of dummy bytes needed for Macronix
>     flashes
>   hw/block: m25p80: Fix the number of dummy bytes needed for Spansion
>     flashes
>   hw/block: m25p80: Support fast read for SST flashes
>   hw/ssi: xilinx_spips: Fix generic fifo dummy cycle handling
>   Revert "aspeed/smc: Fix number of dummy cycles for FAST_READ_4
>     command"
>   Revert "aspeed/smc: snoop SPI transfers to fake dummy cycles"
>   hw/ssi: npcm7xx_fiu: Correct the dummy cycle emulation logic
> 
>  include/hw/ssi/aspeed_smc.h |   3 -
>  hw/block/m25p80.c           | 153 ++++++++++++++++++++++++++++--------
>  hw/ssi/aspeed_smc.c         | 116 +--------------------------
>  hw/ssi/npcm7xx_fiu.c        |   8 +-
>  hw/ssi/xilinx_spips.c       |  29 ++++++-
>  5 files changed, 153 insertions(+), 156 deletions(-)
> 
> -- 
> 2.25.1
> 

