Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40511595A50
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 13:37:03 +0200 (CEST)
Received: from localhost ([::1]:47426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNusX-0006bC-RP
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 07:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oNuoR-0001Ze-F5; Tue, 16 Aug 2022 07:32:47 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:43975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oNuoO-00029d-GU; Tue, 16 Aug 2022 07:32:47 -0400
Received: by mail-vk1-xa36.google.com with SMTP id w129so4983677vkg.10;
 Tue, 16 Aug 2022 04:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=aqEmZmGaODizA1pQLA+NTAIYcosxWgEM6SZk/EVN+38=;
 b=ioj6fgz1EdoqzLcXIhbruPlWMITy//+B9qNP813yF3MLntO2J4UEQ4lo/J4AgMsiqY
 FM7QI1ENqrG1DNklYPlavV/diwGhwkTixmco76peIScCAnJS47Ks+qisWWy+08CH7Cvd
 w2P9WWyG/u4dKr8BtwtxeEYdf2/jwDjPmbxStaxHL0tG/kbRx6xqodirYgysfW9mbnXp
 XUg7Agl8ifE8RMFvng3zcUqLYTM+S5e9qYFMPqQCyMFwLJvYbIgwhvzzVLw8GERJr4uQ
 atpNG4ivEaLBtn2CrQzcmepMWexkg6uSEoy6tdLo2hznuN8jOJgzHYZs1jHjpFFtSt/M
 Fk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=aqEmZmGaODizA1pQLA+NTAIYcosxWgEM6SZk/EVN+38=;
 b=BXdQS2sg+H/oSl/L2aYyGpZSIgekzUBBab5sv8/3QoQaO0DaorkWrttnQFuuNpuLZe
 1DlQBqWLK8KEP0upyiM2VPn1xjeHs4DRFPL3Bjx+zR+lcA3D7tPOs/tLeC3qhiI4LIcE
 lzcVXktwhNQcXq1e6lRFv8YRugUFkJGVkAwDjAXC23HqDwECRC6UzAq2mOXA4pbUBUsJ
 TBJVky9snjk8b3DroicNs+unh2yPN7jNy6V7UOu76/MyV7MYrpiOedSUarUmEdHTgfWX
 4HOJ+Wx1miIDgjkClyHglAMm3Uw/jkX81IU/Shb0q4PDK81Y+3FsCyY2crPv5ZNwpWuX
 58wg==
X-Gm-Message-State: ACgBeo1aYH7zDSGuUY2ro3oIuaMdhT5fiEbt+otzmrtYIVXrh/+S2/P6
 U2pE0dgAIYWCcZvuo+xCmrc=
X-Google-Smtp-Source: AA6agR7Gq3Vnl5hpijmD4PXrz5S8K+PdxOXRwvZYsvjscCfVcXhS7cDlrPMzYX8z4C2NOuwZZIbaIA==
X-Received: by 2002:a1f:d8c4:0:b0:375:8854:6d3c with SMTP id
 p187-20020a1fd8c4000000b0037588546d3cmr8333302vkg.34.1660649562903; 
 Tue, 16 Aug 2022 04:32:42 -0700 (PDT)
Received: from [192.168.10.102] (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 g30-20020a056102159e00b00386ecd2e38dsm6816955vsv.33.2022.08.16.04.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 04:32:42 -0700 (PDT)
Message-ID: <bcc84884-0ab2-1d54-8406-f5bf69e733a2@gmail.com>
Date: Tue, 16 Aug 2022 08:32:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] ppc/pnv: Add initial P9/10 SBE model
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220811093726.1442343-1-npiggin@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220811093726.1442343-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa36.google.com
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



On 8/11/22 06:37, Nicholas Piggin wrote:
> The SBE (Self Boot Engine) are on-chip microcontrollers that perform
> early boot steps, as well as provide some runtime facilities (e.g.,
> timer, secure register access, MPIPL). The latter facilities are
> accessed mostly via a message system called SBEFIFO.
> 
> This driver provides initial emulation for the SBE runtime registers
> and a very basic SBEFIFO implementation that provides the timer
> command. This covers the basic SBE behaviour expected by skiboot when
> booting.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Applied to gitlab.com/danielhb/qemu/tree/ppc-7.2 after fixing the following
checkpatch.pl error:


WARNING: line over 80 characters
#282: FILE: hw/ppc/pnv_sbe.c:73:
+#define SBE_HOST_RESPONSE_MASK          (PPC_BITMASK(0, 4) | SBE_HOST_TIMER_EXPIRY)

total: 0 errors, 2 warnings, 595 lines checked


Thanks,


Daniel



> v2: use trace events instead of open coded debug print macros
> 
>   hw/ppc/meson.build         |   1 +
>   hw/ppc/pnv.c               |  25 +++
>   hw/ppc/pnv_sbe.c           | 413 +++++++++++++++++++++++++++++++++++++
>   hw/ppc/pnv_xscom.c         |   3 +
>   hw/ppc/trace-events        |  11 +
>   include/hw/ppc/pnv.h       |   3 +
>   include/hw/ppc/pnv_sbe.h   |  55 +++++
>   include/hw/ppc/pnv_xscom.h |  12 ++
>   8 files changed, 523 insertions(+)
>   create mode 100644 hw/ppc/pnv_sbe.c
>   create mode 100644 include/hw/ppc/pnv_sbe.h
> 
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index aa4c8e6a2e..62801923f3 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -46,6 +46,7 @@ ppc_ss.add(when: 'CONFIG_POWERNV', if_true: files(
>     'pnv_lpc.c',
>     'pnv_psi.c',
>     'pnv_occ.c',
> +  'pnv_sbe.c',
>     'pnv_bmc.c',
>     'pnv_homer.c',
>     'pnv_pnor.c',
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d3f77c8367..7ff1f464d3 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1397,6 +1397,8 @@ static void pnv_chip_power9_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "occ", &chip9->occ, TYPE_PNV9_OCC);
>   
> +    object_initialize_child(obj, "sbe", &chip9->sbe, TYPE_PNV9_SBE);
> +
>       object_initialize_child(obj, "homer", &chip9->homer, TYPE_PNV9_HOMER);
>   
>       /* Number of PECs is the chip default */
> @@ -1549,6 +1551,17 @@ static void pnv_chip_power9_realize(DeviceState *dev, Error **errp)
>       memory_region_add_subregion(get_system_memory(), PNV9_OCC_SENSOR_BASE(chip),
>                                   &chip9->occ.sram_regs);
>   
> +    /* SBE */
> +    if (!qdev_realize(DEVICE(&chip9->sbe), NULL, errp)) {
> +        return;
> +    }
> +    pnv_xscom_add_subregion(chip, PNV9_XSCOM_SBE_CTRL_BASE,
> +                            &chip9->sbe.xscom_ctrl_regs);
> +    pnv_xscom_add_subregion(chip, PNV9_XSCOM_SBE_MBOX_BASE,
> +                            &chip9->sbe.xscom_mbox_regs);
> +    qdev_connect_gpio_out(DEVICE(&chip9->sbe), 0, qdev_get_gpio_in(
> +                              DEVICE(&chip9->psi), PSIHB9_IRQ_PSU));
> +
>       /* HOMER */
>       object_property_set_link(OBJECT(&chip9->homer), "chip", OBJECT(chip),
>                                &error_abort);
> @@ -1613,6 +1626,7 @@ static void pnv_chip_power10_instance_init(Object *obj)
>       object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
>       object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
>       object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
> +    object_initialize_child(obj, "sbe",  &chip10->sbe, TYPE_PNV10_SBE);
>       object_initialize_child(obj, "homer", &chip10->homer, TYPE_PNV10_HOMER);
>   
>       chip->num_pecs = pcc->num_pecs;
> @@ -1754,6 +1768,17 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
>                                   PNV10_OCC_SENSOR_BASE(chip),
>                                   &chip10->occ.sram_regs);
>   
> +    /* SBE */
> +    if (!qdev_realize(DEVICE(&chip10->sbe), NULL, errp)) {
> +        return;
> +    }
> +    pnv_xscom_add_subregion(chip, PNV10_XSCOM_SBE_CTRL_BASE,
> +                            &chip10->sbe.xscom_ctrl_regs);
> +    pnv_xscom_add_subregion(chip, PNV10_XSCOM_SBE_MBOX_BASE,
> +                            &chip10->sbe.xscom_mbox_regs);
> +    qdev_connect_gpio_out(DEVICE(&chip10->sbe), 0, qdev_get_gpio_in(
> +                              DEVICE(&chip10->psi), PSIHB9_IRQ_PSU));
> +
>       /* HOMER */
>       object_property_set_link(OBJECT(&chip10->homer), "chip", OBJECT(chip),
>                                &error_abort);
> diff --git a/hw/ppc/pnv_sbe.c b/hw/ppc/pnv_sbe.c
> new file mode 100644
> index 0000000000..41420c47bd
> --- /dev/null
> +++ b/hw/ppc/pnv_sbe.c
> @@ -0,0 +1,413 @@
> +/*
> + * QEMU PowerPC PowerNV Emulation of some SBE behaviour
> + *
> + * Copyright (c) 2022, IBM Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License, version 2, as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "target/ppc/cpu.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/ppc/pnv.h"
> +#include "hw/ppc/pnv_xscom.h"
> +#include "hw/ppc/pnv_sbe.h"
> +#include "trace.h"
> +
> +/*
> + * Most register and command definitions come from skiboot.
> + *
> + * xscom addresses are adjusted to be relative to xscom subregion bases
> + */
> +
> +/*
> + * SBE MBOX register address
> + *   Reg 0 - 3 : Host to send command packets to SBE
> + *   Reg 4 - 7 : SBE to send response packets to Host
> + */
> +#define PSU_HOST_SBE_MBOX_REG0          0x00000000
> +#define PSU_HOST_SBE_MBOX_REG1          0x00000001
> +#define PSU_HOST_SBE_MBOX_REG2          0x00000002
> +#define PSU_HOST_SBE_MBOX_REG3          0x00000003
> +#define PSU_HOST_SBE_MBOX_REG4          0x00000004
> +#define PSU_HOST_SBE_MBOX_REG5          0x00000005
> +#define PSU_HOST_SBE_MBOX_REG6          0x00000006
> +#define PSU_HOST_SBE_MBOX_REG7          0x00000007
> +#define PSU_SBE_DOORBELL_REG_RW         0x00000010
> +#define PSU_SBE_DOORBELL_REG_AND        0x00000011
> +#define PSU_SBE_DOORBELL_REG_OR         0x00000012
> +#define PSU_HOST_DOORBELL_REG_RW        0x00000013
> +#define PSU_HOST_DOORBELL_REG_AND       0x00000014
> +#define PSU_HOST_DOORBELL_REG_OR        0x00000015
> +
> +/*
> + * Doorbell register to trigger SBE interrupt. Set by OPAL to inform
> + * the SBE about a waiting message in the Host/SBE mailbox registers
> + */
> +#define HOST_SBE_MSG_WAITING            PPC_BIT(0)
> +
> +/*
> + * Doorbell register for host bridge interrupt. Set by the SBE to inform
> + * host about a response message in the Host/SBE mailbox registers
> + */
> +#define SBE_HOST_RESPONSE_WAITING       PPC_BIT(0)
> +#define SBE_HOST_MSG_READ               PPC_BIT(1)
> +#define SBE_HOST_STOP15_EXIT            PPC_BIT(2)
> +#define SBE_HOST_RESET                  PPC_BIT(3)
> +#define SBE_HOST_PASSTHROUGH            PPC_BIT(4)
> +#define SBE_HOST_TIMER_EXPIRY           PPC_BIT(14)
> +#define SBE_HOST_RESPONSE_MASK          (PPC_BITMASK(0, 4) | SBE_HOST_TIMER_EXPIRY)
> +
> +/* SBE Control Register */
> +#define SBE_CONTROL_REG_RW              0x00000000
> +
> +/* SBE interrupt s0/s1 bits */
> +#define SBE_CONTROL_REG_S0              PPC_BIT(14)
> +#define SBE_CONTROL_REG_S1              PPC_BIT(15)
> +
> +struct sbe_msg {
> +    uint64_t reg[4];
> +};
> +
> +static uint64_t pnv_sbe_power9_xscom_ctrl_read(void *opaque, hwaddr addr,
> +                                          unsigned size)
> +{
> +    uint32_t offset = addr >> 3;
> +    uint64_t val = 0;
> +
> +    switch (offset) {
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "SBE Unimplemented register: Ox%"
> +                      HWADDR_PRIx "\n", addr >> 3);
> +    }
> +
> +    trace_pnv_sbe_xscom_ctrl_read(addr, val);
> +
> +    return val;
> +}
> +
> +static void pnv_sbe_power9_xscom_ctrl_write(void *opaque, hwaddr addr,
> +                                       uint64_t val, unsigned size)
> +{
> +    uint32_t offset = addr >> 3;
> +
> +    trace_pnv_sbe_xscom_ctrl_write(addr, val);
> +
> +    switch (offset) {
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "SBE Unimplemented register: Ox%"
> +                      HWADDR_PRIx "\n", addr >> 3);
> +    }
> +}
> +
> +static const MemoryRegionOps pnv_sbe_power9_xscom_ctrl_ops = {
> +    .read = pnv_sbe_power9_xscom_ctrl_read,
> +    .write = pnv_sbe_power9_xscom_ctrl_write,
> +    .valid.min_access_size = 8,
> +    .valid.max_access_size = 8,
> +    .impl.min_access_size = 8,
> +    .impl.max_access_size = 8,
> +    .endianness = DEVICE_BIG_ENDIAN,
> +};
> +
> +static void pnv_sbe_set_host_doorbell(PnvSBE *sbe, uint64_t val)
> +{
> +    val &= SBE_HOST_RESPONSE_MASK; /* Is this right? What does HW do? */
> +    sbe->host_doorbell = val;
> +
> +    trace_pnv_sbe_reg_set_host_doorbell(val);
> +    qemu_set_irq(sbe->psi_irq, !!val);
> +}
> +
> +/* SBE Target Type */
> +#define SBE_TARGET_TYPE_PROC            0x00
> +#define SBE_TARGET_TYPE_EX              0x01
> +#define SBE_TARGET_TYPE_PERV            0x02
> +#define SBE_TARGET_TYPE_MCS             0x03
> +#define SBE_TARGET_TYPE_EQ              0x04
> +#define SBE_TARGET_TYPE_CORE            0x05
> +
> +/* SBE MBOX command class */
> +#define SBE_MCLASS_FIRST                0xD1
> +#define SBE_MCLASS_CORE_STATE           0xD1
> +#define SBE_MCLASS_SCOM                 0xD2
> +#define SBE_MCLASS_RING                 0xD3
> +#define SBE_MCLASS_TIMER                0xD4
> +#define SBE_MCLASS_MPIPL                0xD5
> +#define SBE_MCLASS_SECURITY             0xD6
> +#define SBE_MCLASS_GENERIC              0xD7
> +#define SBE_MCLASS_LAST                 0xD7
> +
> +/*
> + * Commands are provided in xxyy form where:
> + *   - xx : command class
> + *   - yy : command
> + *
> + * Both request and response message uses same seq ID,
> + * command class and command.
> + */
> +#define SBE_CMD_CTRL_DEADMAN_LOOP       0xD101
> +#define SBE_CMD_MULTI_SCOM              0xD201
> +#define SBE_CMD_PUT_RING_FORM_IMAGE     0xD301
> +#define SBE_CMD_CONTROL_TIMER           0xD401
> +#define SBE_CMD_GET_ARCHITECTED_REG     0xD501
> +#define SBE_CMD_CLR_ARCHITECTED_REG     0xD502
> +#define SBE_CMD_SET_UNSEC_MEM_WINDOW    0xD601
> +#define SBE_CMD_GET_SBE_FFDC            0xD701
> +#define SBE_CMD_GET_CAPABILITY          0xD702
> +#define SBE_CMD_READ_SBE_SEEPROM        0xD703
> +#define SBE_CMD_SET_FFDC_ADDR           0xD704
> +#define SBE_CMD_QUIESCE_SBE             0xD705
> +#define SBE_CMD_SET_FABRIC_ID_MAP       0xD706
> +#define SBE_CMD_STASH_MPIPL_CONFIG      0xD707
> +
> +/* SBE MBOX control flags */
> +
> +/* Generic flags */
> +#define SBE_CMD_CTRL_RESP_REQ           0x0100
> +#define SBE_CMD_CTRL_ACK_REQ            0x0200
> +
> +/* Deadman loop */
> +#define CTRL_DEADMAN_LOOP_START         0x0001
> +#define CTRL_DEADMAN_LOOP_STOP          0x0002
> +
> +/* Control timer */
> +#define CONTROL_TIMER_START             0x0001
> +#define CONTROL_TIMER_STOP              0x0002
> +
> +/* Stash MPIPL config */
> +#define SBE_STASH_KEY_SKIBOOT_BASE      0x03
> +
> +static void sbe_timer(void *opaque)
> +{
> +    PnvSBE *sbe = opaque;
> +
> +    trace_pnv_sbe_cmd_timer_expired();
> +
> +    pnv_sbe_set_host_doorbell(sbe, sbe->host_doorbell | SBE_HOST_TIMER_EXPIRY);
> +}
> +
> +static void do_sbe_msg(PnvSBE *sbe)
> +{
> +    struct sbe_msg msg;
> +    uint16_t cmd, ctrl_flags, seq_id;
> +    int i;
> +
> +    memset(&msg, 0, sizeof(msg));
> +
> +    for (i = 0; i < 4; i++) {
> +        msg.reg[i] = sbe->mbox[i];
> +    }
> +
> +    cmd = msg.reg[0];
> +    seq_id = msg.reg[0] >> 16;
> +    ctrl_flags = msg.reg[0] >> 32;
> +
> +    trace_pnv_sbe_msg_recv(cmd, seq_id, ctrl_flags);
> +
> +    if (ctrl_flags & SBE_CMD_CTRL_ACK_REQ) {
> +        pnv_sbe_set_host_doorbell(sbe, sbe->host_doorbell | SBE_HOST_MSG_READ);
> +    }
> +
> +    switch (cmd) {
> +    case SBE_CMD_CONTROL_TIMER:
> +        if (ctrl_flags & CONTROL_TIMER_START) {
> +            uint64_t us = msg.reg[1];
> +            trace_pnv_sbe_cmd_timer_start(us);
> +            timer_mod(sbe->timer, qemu_clock_get_us(QEMU_CLOCK_VIRTUAL) + us);
> +        }
> +        if (ctrl_flags & CONTROL_TIMER_STOP) {
> +            trace_pnv_sbe_cmd_timer_stop();
> +            timer_del(sbe->timer);
> +        }
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "SBE Unimplemented command: 0x%x\n", cmd);
> +    }
> +}
> +
> +static void pnv_sbe_set_sbe_doorbell(PnvSBE *sbe, uint64_t val)
> +{
> +    val &= HOST_SBE_MSG_WAITING;
> +    sbe->sbe_doorbell = val;
> +
> +    if (val & HOST_SBE_MSG_WAITING) {
> +        sbe->sbe_doorbell &= ~HOST_SBE_MSG_WAITING;
> +        do_sbe_msg(sbe);
> +    }
> +}
> +
> +static uint64_t pnv_sbe_power9_xscom_mbox_read(void *opaque, hwaddr addr,
> +                                          unsigned size)
> +{
> +    PnvSBE *sbe = PNV_SBE(opaque);
> +    uint32_t offset = addr >> 3;
> +    uint64_t val = 0;
> +
> +    if (offset <= PSU_HOST_SBE_MBOX_REG7) {
> +        uint32_t idx = offset - PSU_HOST_SBE_MBOX_REG0;
> +        val = sbe->mbox[idx];
> +    } else {
> +        switch (offset) {
> +        case PSU_SBE_DOORBELL_REG_RW:
> +            val = sbe->sbe_doorbell;
> +            break;
> +        case PSU_HOST_DOORBELL_REG_RW:
> +            val = sbe->host_doorbell;
> +            break;
> +        default:
> +            qemu_log_mask(LOG_UNIMP, "SBE Unimplemented register: Ox%"
> +                          HWADDR_PRIx "\n", addr >> 3);
> +        }
> +    }
> +
> +    trace_pnv_sbe_xscom_mbox_read(addr, val);
> +
> +    return val;
> +}
> +
> +static void pnv_sbe_power9_xscom_mbox_write(void *opaque, hwaddr addr,
> +                                       uint64_t val, unsigned size)
> +{
> +    PnvSBE *sbe = PNV_SBE(opaque);
> +    uint32_t offset = addr >> 3;
> +
> +    trace_pnv_sbe_xscom_mbox_write(addr, val);
> +
> +    if (offset <= PSU_HOST_SBE_MBOX_REG7) {
> +        uint32_t idx = offset - PSU_HOST_SBE_MBOX_REG0;
> +        sbe->mbox[idx] = val;
> +    } else {
> +        switch (offset) {
> +        case PSU_SBE_DOORBELL_REG_RW:
> +            pnv_sbe_set_sbe_doorbell(sbe, val);
> +            break;
> +        case PSU_SBE_DOORBELL_REG_AND:
> +            pnv_sbe_set_sbe_doorbell(sbe, sbe->sbe_doorbell & val);
> +            break;
> +        case PSU_SBE_DOORBELL_REG_OR:
> +            pnv_sbe_set_sbe_doorbell(sbe, sbe->sbe_doorbell | val);
> +            break;
> +
> +        case PSU_HOST_DOORBELL_REG_RW:
> +            pnv_sbe_set_host_doorbell(sbe, val);
> +            break;
> +        case PSU_HOST_DOORBELL_REG_AND:
> +            pnv_sbe_set_host_doorbell(sbe, sbe->host_doorbell & val);
> +            break;
> +        case PSU_HOST_DOORBELL_REG_OR:
> +            pnv_sbe_set_host_doorbell(sbe, sbe->host_doorbell | val);
> +            break;
> +
> +        default:
> +            qemu_log_mask(LOG_UNIMP, "SBE Unimplemented register: Ox%"
> +                          HWADDR_PRIx "\n", addr >> 3);
> +        }
> +    }
> +}
> +
> +static const MemoryRegionOps pnv_sbe_power9_xscom_mbox_ops = {
> +    .read = pnv_sbe_power9_xscom_mbox_read,
> +    .write = pnv_sbe_power9_xscom_mbox_write,
> +    .valid.min_access_size = 8,
> +    .valid.max_access_size = 8,
> +    .impl.min_access_size = 8,
> +    .impl.max_access_size = 8,
> +    .endianness = DEVICE_BIG_ENDIAN,
> +};
> +
> +static void pnv_sbe_power9_class_init(ObjectClass *klass, void *data)
> +{
> +    PnvSBEClass *psc = PNV_SBE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "PowerNV SBE Controller (POWER9)";
> +    psc->xscom_ctrl_size = PNV9_XSCOM_SBE_CTRL_SIZE;
> +    psc->xscom_ctrl_ops = &pnv_sbe_power9_xscom_ctrl_ops;
> +    psc->xscom_mbox_size = PNV9_XSCOM_SBE_MBOX_SIZE;
> +    psc->xscom_mbox_ops = &pnv_sbe_power9_xscom_mbox_ops;
> +}
> +
> +static const TypeInfo pnv_sbe_power9_type_info = {
> +    .name          = TYPE_PNV9_SBE,
> +    .parent        = TYPE_PNV_SBE,
> +    .instance_size = sizeof(PnvSBE),
> +    .class_init    = pnv_sbe_power9_class_init,
> +};
> +
> +static void pnv_sbe_power10_class_init(ObjectClass *klass, void *data)
> +{
> +    PnvSBEClass *psc = PNV_SBE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "PowerNV SBE Controller (POWER10)";
> +    psc->xscom_ctrl_size = PNV10_XSCOM_SBE_CTRL_SIZE;
> +    psc->xscom_ctrl_ops = &pnv_sbe_power9_xscom_ctrl_ops;
> +    psc->xscom_mbox_size = PNV10_XSCOM_SBE_MBOX_SIZE;
> +    psc->xscom_mbox_ops = &pnv_sbe_power9_xscom_mbox_ops;
> +}
> +
> +static const TypeInfo pnv_sbe_power10_type_info = {
> +    .name          = TYPE_PNV10_SBE,
> +    .parent        = TYPE_PNV9_SBE,
> +    .class_init    = pnv_sbe_power10_class_init,
> +};
> +
> +static void pnv_sbe_realize(DeviceState *dev, Error **errp)
> +{
> +    PnvSBE *sbe = PNV_SBE(dev);
> +    PnvSBEClass *psc = PNV_SBE_GET_CLASS(sbe);
> +
> +    /* XScom regions for SBE registers */
> +    pnv_xscom_region_init(&sbe->xscom_ctrl_regs, OBJECT(dev),
> +                          psc->xscom_ctrl_ops, sbe, "xscom-sbe-ctrl",
> +                          psc->xscom_ctrl_size);
> +    pnv_xscom_region_init(&sbe->xscom_mbox_regs, OBJECT(dev),
> +                          psc->xscom_mbox_ops, sbe, "xscom-sbe-mbox",
> +                          psc->xscom_mbox_size);
> +
> +    qdev_init_gpio_out(DEVICE(dev), &sbe->psi_irq, 1);
> +
> +    sbe->timer = timer_new_us(QEMU_CLOCK_VIRTUAL, sbe_timer, sbe);
> +}
> +
> +static void pnv_sbe_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = pnv_sbe_realize;
> +    dc->desc = "PowerNV SBE Controller";
> +    dc->user_creatable = false;
> +}
> +
> +static const TypeInfo pnv_sbe_type_info = {
> +    .name          = TYPE_PNV_SBE,
> +    .parent        = TYPE_DEVICE,
> +    .instance_size = sizeof(PnvSBE),
> +    .class_init    = pnv_sbe_class_init,
> +    .class_size    = sizeof(PnvSBEClass),
> +    .abstract      = true,
> +};
> +
> +static void pnv_sbe_register_types(void)
> +{
> +    type_register_static(&pnv_sbe_type_info);
> +    type_register_static(&pnv_sbe_power9_type_info);
> +    type_register_static(&pnv_sbe_power10_type_info);
> +}
> +
> +type_init(pnv_sbe_register_types);
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index 9ce018dbc2..79f10de57f 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -295,6 +295,9 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
>       _FDT((fdt_setprop(fdt, xscom_offset, "reg", reg, sizeof(reg))));
>       _FDT((fdt_setprop(fdt, xscom_offset, "compatible", compat, compat_size)));
>       _FDT((fdt_setprop(fdt, xscom_offset, "scom-controller", NULL, 0)));
> +    if (chip->chip_id == 0) {
> +        _FDT((fdt_setprop(fdt, xscom_offset, "primary", NULL, 0)));
> +    }
>   
>       args.fdt = fdt;
>       args.xscom_offset = xscom_offset;
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index 5c0a215cad..f6990439d1 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -95,6 +95,17 @@ vof_write(uint32_t ih, unsigned cb, const char *msg) "ih=0x%x [%u] \"%s\""
>   vof_avail(uint64_t start, uint64_t end, uint64_t size) "0x%"PRIx64"..0x%"PRIx64" size=0x%"PRIx64
>   vof_claimed(uint64_t start, uint64_t end, uint64_t size) "0x%"PRIx64"..0x%"PRIx64" size=0x%"PRIx64
>   
> +# pnv_sbe.c
> +pnv_sbe_xscom_ctrl_read(uint64_t addr, uint64_t val) "addr 0x%" PRIx64 " val 0x%" PRIx64
> +pnv_sbe_xscom_ctrl_write(uint64_t addr, uint64_t val) "addr 0x%" PRIx64 " val 0x%" PRIx64
> +pnv_sbe_xscom_mbox_read(uint64_t addr, uint64_t val) "addr 0x%" PRIx64 " val 0x%" PRIx64
> +pnv_sbe_xscom_mbox_write(uint64_t addr, uint64_t val) "addr 0x%" PRIx64 " val 0x%" PRIx64
> +pnv_sbe_reg_set_host_doorbell(uint64_t val) "val 0x%" PRIx64
> +pnv_sbe_cmd_timer_start(uint64_t ns) "ns 0x%" PRIu64
> +pnv_sbe_cmd_timer_stop(void) ""
> +pnv_sbe_cmd_timer_expired(void) ""
> +pnv_sbe_msg_recv(uint16_t cmd, uint16_t seq, uint16_t ctrl_flags) "cmd 0x%" PRIx16 " seq %"PRIu16 " ctrl_flags 0x%" PRIx16
> +
>   # ppc.c
>   ppc_tb_adjust(uint64_t offs1, uint64_t offs2, int64_t diff, int64_t seconds) "adjusted from 0x%"PRIx64" to 0x%"PRIx64", diff %"PRId64" (%"PRId64"s)"
>   ppc_tb_load(uint64_t tb) "tb 0x%016" PRIx64
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index b991194223..37c303bf36 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -27,6 +27,7 @@
>   #include "hw/ppc/pnv_pnor.h"
>   #include "hw/ppc/pnv_psi.h"
>   #include "hw/ppc/pnv_occ.h"
> +#include "hw/ppc/pnv_sbe.h"
>   #include "hw/ppc/pnv_homer.h"
>   #include "hw/ppc/pnv_xive.h"
>   #include "hw/ppc/pnv_core.h"
> @@ -100,6 +101,7 @@ struct Pnv9Chip {
>       Pnv9Psi      psi;
>       PnvLpcController lpc;
>       PnvOCC       occ;
> +    PnvSBE       sbe;
>       PnvHomer     homer;
>   
>       uint32_t     nr_quads;
> @@ -129,6 +131,7 @@ struct Pnv10Chip {
>       Pnv9Psi      psi;
>       PnvLpcController lpc;
>       PnvOCC       occ;
> +    PnvSBE       sbe;
>       PnvHomer     homer;
>   
>       uint32_t     nr_quads;
> diff --git a/include/hw/ppc/pnv_sbe.h b/include/hw/ppc/pnv_sbe.h
> new file mode 100644
> index 0000000000..f54a3ae9ba
> --- /dev/null
> +++ b/include/hw/ppc/pnv_sbe.h
> @@ -0,0 +1,55 @@
> +/*
> + * QEMU PowerPC PowerNV Emulation of some SBE behaviour
> + *
> + * Copyright (c) 2022, IBM Corporation.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef PPC_PNV_SBE_H
> +#define PPC_PNV_SBE_H
> +
> +#include "qom/object.h"
> +
> +#define TYPE_PNV_SBE "pnv-sbe"
> +OBJECT_DECLARE_TYPE(PnvSBE, PnvSBEClass, PNV_SBE)
> +#define TYPE_PNV9_SBE TYPE_PNV_SBE "-POWER9"
> +DECLARE_INSTANCE_CHECKER(PnvSBE, PNV9_SBE, TYPE_PNV9_SBE)
> +#define TYPE_PNV10_SBE TYPE_PNV_SBE "-POWER10"
> +DECLARE_INSTANCE_CHECKER(PnvSBE, PNV10_SBE, TYPE_PNV10_SBE)
> +
> +struct PnvSBE {
> +    DeviceState xd;
> +
> +    uint64_t mbox[8];
> +    uint64_t sbe_doorbell;
> +    uint64_t host_doorbell;
> +
> +    qemu_irq psi_irq;
> +    QEMUTimer *timer;
> +
> +    MemoryRegion xscom_mbox_regs;
> +    MemoryRegion xscom_ctrl_regs;
> +};
> +
> +struct PnvSBEClass {
> +    DeviceClass parent_class;
> +
> +    int xscom_ctrl_size;
> +    int xscom_mbox_size;
> +    const MemoryRegionOps *xscom_ctrl_ops;
> +    const MemoryRegionOps *xscom_mbox_ops;
> +};
> +
> +#endif /* PPC_PNV_SBE_H */
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 7c7440de0c..c6e9ef8dd2 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -92,6 +92,12 @@ struct PnvXScomInterfaceClass {
>   #define PNV9_XSCOM_OCC_BASE       PNV_XSCOM_OCC_BASE
>   #define PNV9_XSCOM_OCC_SIZE       0x8000
>   
> +#define PNV9_XSCOM_SBE_CTRL_BASE  0x00050008
> +#define PNV9_XSCOM_SBE_CTRL_SIZE  0x1
> +
> +#define PNV9_XSCOM_SBE_MBOX_BASE  0x000D0050
> +#define PNV9_XSCOM_SBE_MBOX_SIZE  0x16
> +
>   #define PNV9_XSCOM_PBA_BASE       0x5012b00
>   #define PNV9_XSCOM_PBA_SIZE       0x40
>   
> @@ -134,6 +140,12 @@ struct PnvXScomInterfaceClass {
>   #define PNV10_XSCOM_OCC_BASE       PNV9_XSCOM_OCC_BASE
>   #define PNV10_XSCOM_OCC_SIZE       PNV9_XSCOM_OCC_SIZE
>   
> +#define PNV10_XSCOM_SBE_CTRL_BASE  PNV9_XSCOM_SBE_CTRL_BASE
> +#define PNV10_XSCOM_SBE_CTRL_SIZE  PNV9_XSCOM_SBE_CTRL_SIZE
> +
> +#define PNV10_XSCOM_SBE_MBOX_BASE  PNV9_XSCOM_SBE_MBOX_BASE
> +#define PNV10_XSCOM_SBE_MBOX_SIZE  PNV9_XSCOM_SBE_MBOX_SIZE
> +
>   #define PNV10_XSCOM_PBA_BASE       0x01010CDA
>   #define PNV10_XSCOM_PBA_SIZE       0x40
>   

