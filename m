Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB3B5A8787
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:29:23 +0200 (CEST)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTUKw-0008CK-7B
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTUJB-0006LY-Td; Wed, 31 Aug 2022 16:27:33 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:45789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTUJ9-0005Zs-OR; Wed, 31 Aug 2022 16:27:33 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 l5-20020a05683004a500b0063707ff8244so11038972otd.12; 
 Wed, 31 Aug 2022 13:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=x32kNM9RmveKeAJcqYYhhiz8/X19l8pEo+riIaQBtaE=;
 b=EbVBR2tD3LBdDyhr8PGWrTz0eSdepI8AyYw36b3OthvBLc+CA10sMZ58odeYNwdx39
 Gt7PSxJtpIMkfm7TPlvI0jN7KSCutF+9LTjfb75VT8JXmy/eUKowchRV3p8wnhJN6dyp
 PXYMl2nYhbMe9435/+QZgtQx0OBtqqTLMPLYqCeRNLLfNRl5j0gtZUkg8VqHXy/QQ974
 So173DKTWwJlKwsosvC5F29UaRFsLqWCDq6eFfr4uEPsZSqoxhdpCZ7f9gW9woUpE7ot
 Pt1lQgDKbhJZq1tXlt5LzUjRBDG4O5tJ/+2JeBHlb8iYKtaO3yrRioXUBkESvJU/AHRP
 w5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=x32kNM9RmveKeAJcqYYhhiz8/X19l8pEo+riIaQBtaE=;
 b=FQrNZsMF+kfgtL7VleQ52JkzOUd951efNvKI9frkB+OB4HDTI1dV5JyYGmKpmGluSh
 yHemVsJGFsOh5/yZ3Sd3deVl/TwLRjSbBIVqxhmgSW7mi1LCmOax80lG6Rd7K3vLpbaX
 hBVCjDziSmUbigwixpXtOMa3G4+F9+p5YgyJD7ARmlvNq1MgG+cMF7UH+NViPwVy4ogO
 dcz11Zhvbyq4pzEqCMKzd/O7El8wgM5x2gOSrRwytK5WbnHEJJeuxTtogWLJnNFVVCdX
 r1E4/2qD58dE7BLrrYV9DX5yqMzwpqzMeOOL0CRrE8k2Vjb1z3nI0Q3XQu4Q6KE+/0mE
 SokQ==
X-Gm-Message-State: ACgBeo0h1JsdsME71j0UNNo7CtcjkUVOrUuNeZVKi/atY3SVHmMLsQ0o
 O76WasuRyH0eAE15Ti8gYVQ=
X-Google-Smtp-Source: AA6agR4Glvx7izpX1DGR5/2KM00MNG1GqQNwJy+ZQvx1T4tYTGka8RyzDy1QZifX4XlWhaOWTLp0Yw==
X-Received: by 2002:a9d:58c6:0:b0:63b:3018:bfc3 with SMTP id
 s6-20020a9d58c6000000b0063b3018bfc3mr5659172oth.259.1661977649342; 
 Wed, 31 Aug 2022 13:27:29 -0700 (PDT)
Received: from [192.168.10.102] ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a056870e0d100b0012248621f61sm896973oab.11.2022.08.31.13.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 13:27:28 -0700 (PDT)
Message-ID: <68152005-9009-8c6f-6838-7d20831e0af4@gmail.com>
Date: Wed, 31 Aug 2022 17:27:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PULL 00/60] ppc queue
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org
References: <20220831185034.23240-1-danielhb413@gmail.com>
 <8cdcb0b4-39d6-1393-e9b1-5c9f64bd9d1@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <8cdcb0b4-39d6-1393-e9b1-5c9f64bd9d1@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 8/31/22 16:37, BALATON Zoltan wrote:
> On Wed, 31 Aug 2022, Daniel Henrique Barboza wrote:
>> The following changes since commit 93fac696d241dccb04ebb9d23da55fc1e9d8ee36:
>>
>>  Open 7.2 development tree (2022-08-30 09:40:41 -0700)
>>
>> are available in the Git repository at:
>>
>>  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220831
>>
>> for you to fetch changes up to 2d9c27ac5c035823315f68c227ca1cc6313e9842:
>>
>>  ppc4xx: Fix code style problems reported by checkpatch (2022-08-31 14:08:06 -0300)
>>
>> ----------------------------------------------------------------
>> ppc patch queue for 2022-08-31:
>>
>> In the first 7.2 queue we have changes in the powernv pnv-phb handling,
>> the start of the QOMification of the ppc405 model, the removal of the
>> taihu machine, a new SLOF image and others.
>>
>> ----------------------------------------------------------------
>> Alexey Kardashevskiy (1):
>>      pseries: Update SLOF firmware image
>>
>> BALATON Zoltan (9):
>>      ppc4xx: Move PLB model to ppc4xx_devs.c
>>      ppc4xx: Rename ppc405-plb to ppc4xx-plb
>>      ppc4xx: Move EBC model to ppc4xx_devs.c
>>      ppc4xx: Rename ppc405-ebc to ppc4xx-ebc
>>      hw/intc/ppc-uic: Convert ppc-uic to a PPC4xx DCR device
>>      ppc405: Move machine specific code to ppc405_boards.c
>>      hw/ppc/sam3460ex: Remove PPC405 dependency from sam460ex
> 
> Seems like we have a typo in this patch title, sam3460ex should be sam460ex

That completely went under the radar during 2-3 reviewed versions. Impressive :)


Richard/Peter, I've fixed the commit name and recreated the tag. I'll
send just the cover-letter as a v2 since there were no code changes
made.


Thanks,

Daniel




> 
> Regards,
> BALATON Zoltan
> 
>>      hw/ppc/Kconfig: Move imply before select
>>      ppc4xx: Fix code style problems reported by checkpatch
>>
>> Cédric Le Goater (22):
>>      ppc/ppc405: Remove taihu machine
>>      ppc/ppc405: Introduce a PPC405 generic machine
>>      ppc/ppc405: Move devices under the ref405ep machine
>>      ppc/ppc405: Move SRAM under the ref405ep machine
>>      ppc/ppc405: Introduce a PPC405 SoC
>>      ppc/ppc405: Start QOMification of the SoC
>>      ppc/ppc405: QOM'ify CPU
>>      ppc/ppc4xx: Introduce a DCR device model
>>      ppc/ppc405: QOM'ify CPC
>>      ppc/ppc405: QOM'ify GPT
>>      ppc/ppc405: QOM'ify OCM
>>      ppc/ppc405: QOM'ify GPIO
>>      ppc/ppc405: QOM'ify DMA
>>      ppc/ppc405: QOM'ify EBC
>>      ppc/ppc405: QOM'ify OPBA
>>      ppc/ppc405: QOM'ify POB
>>      ppc/ppc405: QOM'ify PLB
>>      ppc/ppc405: QOM'ify MAL
>>      ppc/ppc405: Use an embedded PPCUIC model in SoC state
>>      ppc/ppc405: Use an explicit I2C object
>>      ppc/ppc405: QOM'ify FPGA
>>      ppc/ppc4xx: Fix sdram trace events
>>
>> Daniel Henrique Barboza (24):
>>      ppc/pnv: add PHB3 bus init helper
>>      ppc/pnv: add PnvPHB base/proxy device
>>      ppc/pnv: turn PnvPHB3 into a PnvPHB backend
>>      ppc/pnv: add PHB4 bus init helper
>>      ppc/pnv: turn PnvPHB4 into a PnvPHB backend
>>      ppc/pnv: add pnv-phb-root-port device
>>      ppc/pnv: remove pnv-phb3-root-port
>>      ppc/pnv: remove pnv-phb4-root-port
>>      ppc/pnv: remove root port name from pnv_phb_attach_root_port()
>>      ppc/pnv: remove pecc->rp_model
>>      ppc/pnv: remove PnvPHB4.version
>>      ppc/pnv: move attach_root_port helper to pnv-phb.c
>>      ppc/pnv: add phb-id/chip-id PnvPHB3RootBus properties
>>      ppc/pnv: add phb-id/chip-id PnvPHB4RootBus properties
>>      ppc/pnv: set root port chassis and slot using Bus properties
>>      ppc/pnv: add helpers for pnv-phb user devices
>>      ppc/pnv: turn chip8->phbs[] into a PnvPHB* array
>>      ppc/pnv: enable user created pnv-phb for powernv8
>>      ppc/pnv: add PHB4 helpers for user created pnv-phb
>>      ppc/pnv: enable user created pnv-phb for powernv9
>>      ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
>>      ppc/pnv: user creatable pnv-phb for powernv10
>>      ppc/pnv: consolidate pnv_parent_*_fixup() helpers
>>      ppc/pnv: fix QOM parenting of user creatable root ports
>>
>> Lucas Mateus Castro (alqotel) (2):
>>      fpu: Add rebias bool, value and operation
>>      target/ppc: Bugfix FP when OE/UE are set
>>
>> Nicholas Piggin (2):
>>      target/ppc: Fix host PVR matching for KVM
>>      ppc/pnv: Add initial P9/10 SBE model
>>
>> MAINTAINERS                     |    2 +-
>> docs/about/deprecated.rst       |    9 -
>> docs/about/removed-features.rst |    6 +
>> docs/system/ppc/embedded.rst    |    1 -
>> docs/system/ppc/pseries.rst     |    2 +-
>> fpu/softfloat-parts.c.inc       |   21 +-
>> fpu/softfloat.c                 |    2 +
>> hw/intc/ppc-uic.c               |   26 +-
>> hw/pci-host/meson.build         |    3 +-
>> hw/pci-host/pnv_phb.c           |  337 ++++++++++++
>> hw/pci-host/pnv_phb.h           |   55 ++
>> hw/pci-host/pnv_phb3.c          |  152 +++--
>> hw/pci-host/pnv_phb4.c          |  191 +++----
>> hw/pci-host/pnv_phb4_pec.c      |   11 +-
>> hw/ppc/Kconfig                  |    3 +-
>> hw/ppc/meson.build              |    1 +
>> hw/ppc/pnv.c                    |  188 +++++--
>> hw/ppc/pnv_sbe.c                |  414 ++++++++++++++
>> hw/ppc/pnv_xscom.c              |    3 +
>> hw/ppc/ppc405.h                 |  200 +++++--
>> hw/ppc/ppc405_boards.c          |  552 +++++++++----------
>> hw/ppc/ppc405_uc.c              | 1156 ++++++++++++++-------------------------
>> hw/ppc/ppc440_bamboo.c          |   34 +-
>> hw/ppc/ppc440_uc.c              |    3 +-
>> hw/ppc/ppc4xx_devs.c            |  554 ++++++++++++++-----
>> hw/ppc/ppc4xx_pci.c             |   31 +-
>> hw/ppc/sam460ex.c               |   38 +-
>> hw/ppc/trace-events             |   14 +-
>> hw/ppc/virtex_ml507.c           |    7 +-
>> include/fpu/softfloat-types.h   |    4 +
>> include/hw/intc/ppc-uic.h       |    6 +-
>> include/hw/pci-host/pnv_phb3.h  |   19 +-
>> include/hw/pci-host/pnv_phb4.h  |   22 +-
>> include/hw/ppc/pnv.h            |   13 +-
>> include/hw/ppc/pnv_sbe.h        |   55 ++
>> include/hw/ppc/pnv_xscom.h      |   12 +
>> include/hw/ppc/ppc4xx.h         |   76 ++-
>> pc-bios/README                  |    2 +-
>> pc-bios/slof.bin                |  Bin 992384 -> 995176 bytes
>> roms/SLOF                       |    2 +-
>> target/ppc/cpu-qom.h            |    6 +-
>> target/ppc/cpu.c                |    2 +
>> target/ppc/cpu_init.c           |   91 ++-
>> target/ppc/fpu_helper.c         |    2 -
>> target/ppc/machine.c            |    2 +-
>> 45 files changed, 2736 insertions(+), 1594 deletions(-)
>> create mode 100644 hw/pci-host/pnv_phb.c
>> create mode 100644 hw/pci-host/pnv_phb.h
>> create mode 100644 hw/ppc/pnv_sbe.c
>> create mode 100644 include/hw/ppc/pnv_sbe.h
>>
>>

