Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE5755BF45
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:56:53 +0200 (CEST)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o665c-0002X5-Nl
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65Fl-0004uI-Lp
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:03:18 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:41217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o65Fh-00007C-19
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:03:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.217])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9E529259B5;
 Tue, 28 Jun 2022 07:02:47 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 09:02:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004b9b4dd4c-018f-4986-9b70-bf49eeafd3e6,
 366CF7EF17C4C6544BD620BB2F2D78A15BAD5133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5f4cc0ca-bf0d-90e4-f83c-e2e18bde707c@kaod.org>
Date: Tue, 28 Jun 2022 09:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 14/14] aspeed: Add I2C new register DMA slave mode support
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627222737.1011989-1-pdel@fb.com> <20220627222737.1011989-3-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627222737.1011989-3-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b821c25c-12b4-4bc6-93b6-e30eac2a6bbb
X-Ovh-Tracer-Id: 12076120929828965341
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/28/22 00:27, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Some Intro would be welcome. Please move the patch after Klaus patches.

Thanks,

C.



> ---
>   hw/i2c/aspeed_i2c.c         | 133 ++++++++++++++++++++++++++++++++----
>   include/hw/i2c/aspeed_i2c.h |   3 +
>   2 files changed, 124 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 8a8514586f..fc8b6b62cf 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -78,6 +78,18 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
>       }
>   }
>   
> +static inline void aspeed_i2c_bus_raise_slave_interrupt(AspeedI2CBus *bus)
> +{
> +    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
> +
> +    if (!bus->regs[R_I2CS_INTR_STS]) {
> +        return;
> +    }
> +
> +    bus->controller->intr_status |= 1 << bus->id;
> +    qemu_irq_raise(aic->bus_get_irq(bus));
> +}
> +
>   static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset,
>                                           unsigned size)
>   {
> @@ -140,8 +152,17 @@ static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
>       case A_I2CM_DMA_LEN_STS:
>       case A_I2CC_DMA_ADDR:
>       case A_I2CC_DMA_LEN:
> +
> +    case A_I2CS_DEV_ADDR:
> +    case A_I2CS_DMA_RX_ADDR:
> +    case A_I2CS_DMA_LEN:
> +    case A_I2CS_CMD:
> +    case A_I2CS_INTR_CTRL:
> +    case A_I2CS_DMA_LEN_STS:
>           /* Value is already set, don't do anything. */
>           break;
> +    case A_I2CS_INTR_STS:
> +        break;
>       case A_I2CM_CMD:
>           value = SHARED_FIELD_DP32(value, BUS_BUSY_STS, i2c_bus_busy(bus->bus));
>           break;
> @@ -547,12 +568,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>   
>       switch (offset) {
>       case A_I2CC_FUN_CTRL:
> -        if (SHARED_FIELD_EX32(value, SLAVE_EN)) {
> -            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
> -                          __func__);
> -            break;
> -        }
> -        bus->regs[R_I2CC_FUN_CTRL] = value & 0x007dc3ff;
> +        bus->regs[R_I2CC_FUN_CTRL] = value;
>           break;
>       case A_I2CC_AC_TIMING:
>           bus->regs[R_I2CC_AC_TIMING] = value & 0x1ffff0ff;
> @@ -580,6 +596,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>                   bus->controller->intr_status &= ~(1 << bus->id);
>                   qemu_irq_lower(aic->bus_get_irq(bus));
>               }
> +            aspeed_i2c_bus_raise_slave_interrupt(bus);
>               break;
>           }
>           bus->regs[R_I2CM_INTR_STS] &= ~(value & 0xf007f07f);
> @@ -668,15 +685,53 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>       case A_I2CC_DMA_LEN:
>           /* RO */
>           break;
> -    case A_I2CS_DMA_LEN_STS:
> -    case A_I2CS_DMA_TX_ADDR:
> -    case A_I2CS_DMA_RX_ADDR:
>       case A_I2CS_DEV_ADDR:
> +        bus->regs[R_I2CS_DEV_ADDR] = value;
> +        break;
> +    case A_I2CS_DMA_RX_ADDR:
> +        bus->regs[R_I2CS_DMA_RX_ADDR] = value;
> +        break;
> +    case A_I2CS_DMA_LEN:
> +        assert(FIELD_EX32(value, I2CS_DMA_LEN, TX_BUF_LEN) == 0);
> +        if (FIELD_EX32(value, I2CS_DMA_LEN, RX_BUF_LEN_W1T)) {
> +            ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN, RX_BUF_LEN,
> +                             FIELD_EX32(value, I2CS_DMA_LEN, RX_BUF_LEN));
> +        } else {
> +            bus->regs[R_I2CS_DMA_LEN] = value;
> +        }
> +        break;
> +    case A_I2CS_CMD:
> +        if (FIELD_EX32(value, I2CS_CMD, W1_CTRL)) {
> +            bus->regs[R_I2CS_CMD] |= value;
> +        } else {
> +            bus->regs[R_I2CS_CMD] = value;
> +        }
> +        i2c_slave_set_address(bus->slave, bus->regs[R_I2CS_DEV_ADDR]);
> +        break;
>       case A_I2CS_INTR_CTRL:
> +        bus->regs[R_I2CS_INTR_CTRL] = value;
> +        break;
> +
>       case A_I2CS_INTR_STS:
> -    case A_I2CS_CMD:
> -    case A_I2CS_DMA_LEN:
> -        qemu_log_mask(LOG_UNIMP, "%s: Slave mode is not implemented\n",
> +        if (ARRAY_FIELD_EX32(bus->regs, I2CS_INTR_CTRL, PKT_CMD_DONE)) {
> +            if (ARRAY_FIELD_EX32(bus->regs, I2CS_INTR_STS, PKT_CMD_DONE) &&
> +                FIELD_EX32(value, I2CS_INTR_STS, PKT_CMD_DONE)) {
> +                bus->regs[R_I2CS_INTR_STS] &= 0xfffc0000;
> +            }
> +        } else {
> +            bus->regs[R_I2CS_INTR_STS] &= ~value;
> +        }
> +        if (!bus->regs[R_I2CS_INTR_STS]) {
> +            bus->controller->intr_status &= ~(1 << bus->id);
> +            qemu_irq_lower(aic->bus_get_irq(bus));
> +        }
> +        aspeed_i2c_bus_raise_interrupt(bus);
> +        break;
> +    case A_I2CS_DMA_LEN_STS:
> +        bus->regs[R_I2CS_DMA_LEN_STS] = 0;
> +        break;
> +    case A_I2CS_DMA_TX_ADDR:
> +        qemu_log_mask(LOG_UNIMP, "%s: Slave mode DMA TX is not implemented\n",
>                         __func__);
>           break;
>       default:
> @@ -1037,6 +1092,39 @@ static const TypeInfo aspeed_i2c_info = {
>       .abstract   = true,
>   };
>   
> +static int aspeed_i2c_bus_new_slave_event(AspeedI2CBus *bus,
> +                                          enum i2c_event event)
> +{
> +    switch (event) {
> +    case I2C_START_SEND_ASYNC:
> +        if (!SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CS_CMD, RX_DMA_EN)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Slave mode RX DMA is not enabled\n", __func__);
> +            return -1;
> +        }
> +        ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN, 0);
> +        bus->regs[R_I2CC_DMA_ADDR] =
> +            ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_RX_ADDR, ADDR);
> +        bus->regs[R_I2CC_DMA_LEN] =
> +            ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_LEN, RX_BUF_LEN) + 1;
> +        i2c_ack(bus->bus);
> +        break;
> +    case I2C_FINISH:
> +        ARRAY_FIELD_DP32(bus->regs, I2CS_INTR_STS, PKT_CMD_DONE, 1);
> +        ARRAY_FIELD_DP32(bus->regs, I2CS_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
> +        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CS_INTR_STS, NORMAL_STOP, 1);
> +        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CS_INTR_STS, RX_DONE, 1);
> +        aspeed_i2c_bus_raise_slave_interrupt(bus);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: i2c event %d unimplemented\n",
> +                      __func__, event);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
>   static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
>   {
>       BusState *qbus = qdev_get_parent_bus(DEVICE(slave));
> @@ -1045,6 +1133,10 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
>       uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
>       uint32_t value;
>   
> +    if (aspeed_i2c_is_new_mode(bus->controller)) {
> +        return aspeed_i2c_bus_new_slave_event(bus, event);
> +    }
> +
>       switch (event) {
>       case I2C_START_SEND_ASYNC:
>           value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
> @@ -1073,6 +1165,19 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
>       return 0;
>   }
>   
> +static void aspeed_i2c_bus_new_slave_send_async(AspeedI2CBus *bus, uint8_t data)
> +{
> +    assert(address_space_write(&bus->controller->dram_as,
> +                               bus->regs[R_I2CC_DMA_ADDR],
> +                               MEMTXATTRS_UNSPECIFIED, &data, 1) == MEMTX_OK);
> +
> +    bus->regs[R_I2CC_DMA_ADDR]++;
> +    bus->regs[R_I2CC_DMA_LEN]--;
> +    ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN,
> +                     ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN) + 1);
> +    i2c_ack(bus->bus);
> +}
> +
>   static void aspeed_i2c_bus_slave_send_async(I2CSlave *slave, uint8_t data)
>   {
>       BusState *qbus = qdev_get_parent_bus(DEVICE(slave));
> @@ -1080,6 +1185,10 @@ static void aspeed_i2c_bus_slave_send_async(I2CSlave *slave, uint8_t data)
>       uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
>       uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
>   
> +    if (aspeed_i2c_is_new_mode(bus->controller)) {
> +        return aspeed_i2c_bus_new_slave_send_async(bus, data);
> +    }
> +
>       SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, data);
>       SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
>   
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index ba148b2f6d..300a89b343 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -174,6 +174,8 @@ REG32(I2CM_DMA_LEN, 0x1c)
>       FIELD(I2CM_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
>       FIELD(I2CM_DMA_LEN, TX_BUF_LEN, 0, 11)
>   REG32(I2CS_INTR_CTRL, 0x20)
> +    FIELD(I2CS_INTR_CTRL, PKT_CMD_FAIL, 17, 1)
> +    FIELD(I2CS_INTR_CTRL, PKT_CMD_DONE, 16, 1)
>   REG32(I2CS_INTR_STS, 0x24)
>       /* 31:29 shared with I2CD_INTR_STS[31:29] */
>       FIELD(I2CS_INTR_STS, SLAVE_PARKING_STS, 24, 2)
> @@ -184,6 +186,7 @@ REG32(I2CS_INTR_STS, 0x24)
>       FIELD(I2CS_INTR_STS, PKT_CMD_FAIL, 17, 1)
>       FIELD(I2CS_INTR_STS, PKT_CMD_DONE, 16, 1)
>       /* 14:0 shared with I2CD_INTR_STS[14:0] */
> +    FIELD(I2CS_INTR_STS, SLAVE_ADDR_RX_MATCH, 7, 1)
>   REG32(I2CS_CMD, 0x28)
>       FIELD(I2CS_CMD, W1_CTRL, 31, 1)
>       FIELD(I2CS_CMD, PKT_MODE_ACTIVE_ADDR, 17, 2)


