Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ADA4E678C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:13:48 +0100 (CET)
Received: from localhost ([::1]:33182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXR1u-0000j6-VC
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:13:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nXQzf-00086K-48
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:11:27 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:45271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nXQzb-0006oK-SO
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:11:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C3C1421C2A;
 Thu, 24 Mar 2022 17:11:18 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 24 Mar
 2022 18:11:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0039402e761-a118-47d9-9705-a471c0d34baf,
 8921D6D4056377124FF518EF6C5C68266D051705) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.195.214.108
Message-ID: <d707b2df-5687-58f1-fe78-95a33e86bff5@kaod.org>
Date: Thu, 24 Mar 2022 18:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 1/2] aspeed/i2c: Add new register mode for ast2600/1030
Content-Language: en-US
To: Troy Lee <troy_lee@aspeedtech.com>, <leetroy@gmail.com>
References: <20220324100439.478317-1-troy_lee@aspeedtech.com>
 <20220324100439.478317-2-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220324100439.478317-2-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aa5f7c98-bb63-4134-8645-9b3f98c7cd79
X-Ovh-Tracer-Id: 11976760261962992431
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Troy,

On 3/24/22 11:04, Troy Lee wrote:
> AST2600/1030 provides a new register mode which is controlled by
> I2CG0C[2]. If the I2CG0C[2] = 1, then I2C will switch to a new set of
> register.
> 
> This commit supports new register mode with packet operation and DMA
> enabled. Byte/buffer mode is not implemented.

Overall the code looks good but this is a very large change adding
multiple extensions in a complex model. These should be split in
individual patches.

The names "new" vs "old" are not very well chosen. They are in the
specs but let's find a way to limit their use in the model. I will
think about it.

The "new" mode should be introduced progressively. First, an empty
skeleton, then the new stuff. It's hard to follow otherwise. It's
also an AST2600/AST1030 only feature.

I don't think it is necessary to duplicate the trace events.


> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>   hw/i2c/aspeed_i2c.c         | 490 ++++++++++++++++++++++++++++++++++--
>   hw/i2c/trace-events         |   7 +-
>   include/hw/i2c/aspeed_i2c.h |   8 +
>   3 files changed, 487 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 03a4f5a910..f571c8bbca 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -37,6 +37,8 @@
>                                                  Assignment */
>   #define I2C_CTRL_GLOBAL         0x0C        /* Global Control Register */
>   #define   I2C_CTRL_SRAM_EN                 BIT(0)
> +#define   I2C_CTRL_NEW_REG_MODE            BIT(2)
> +#define I2C_NEW_DIV_GLOBAL      0x10

This new "clock divider" register should have its own patch. Please also
update the vmstate (the Aspeed machine can migrate)

Since you are adding the register, why not add the "clock divider mode
selection" bit ?

>   /* I2C Device (Bus) Register */
>   
> @@ -145,6 +147,102 @@
>   #define I2CD_DMA_ADDR           0x24       /* DMA Buffer Address */
>   #define I2CD_DMA_LEN            0x28       /* DMA Transfer Length < 4KB */
>   
> +/* New register mode */
> +#define I2CC_M_S_FUNC_CTRL_REG  0x00
> +#define   I2CC_SLAVE_ADDR_RX_EN     BIT(20)
> +#define   I2CC_MASTER_RETRY_MASK    (0x3 << 18)
> +#define   I2CC_MASTER_RETRY(x)      ((x & 0x3) << 18)
> +#define   I2CC_BUS_AUTO_RELEASE     BIT(17)
> +#define   I2CC_M_SDA_LOCK_EN        BIT(16)
> +#define   I2CC_MULTI_MASTER_DIS     BIT(15)
> +#define   I2CC_M_SCL_DRIVE_EN       BIT(14)
> +#define   I2CC_MSB_STS              BIT(9)
> +#define   I2CC_SDA_DRIVE_1T_EN      BIT(8)
> +#define   I2CC_M_SDA_DRIVE_1T_EN    BIT(7)
> +#define   I2CC_M_HIGH_SPEED_EN      BIT(6)
> +#define   I2CC_SLAVE_EN             BIT(1)
> +#define   I2CC_MASTER_EN            BIT(0)
> +
> +#define I2CC_M_S_CLK_AC_TIMING_REG 0x04
> +#define I2CC_M_S_TX_RX_BUF_REG  0x08
> +#define I2CC_M_X_POOL_BUF_CTRL_REG 0x0c
> +#define I2CM_INT_CTRL_REG     0x10
> +#define I2CM_INT_STS_REG      0x14
> +#define   I2CM_PKT_OP_SM_SHIFT      28
> +#define   I2CM_PKT_OP_SM_IDLE       0x0
> +#define   I2CM_PKT_OP_SM_STARTH     0x1
> +#define   I2CM_PKT_OP_SM_STARTW     0x2
> +#define   I2CM_PKT_OP_SM_STARTR     0x3
> +#define   I2CM_PKT_OP_SM_TXMCODE    0x4
> +#define   I2CM_PKT_OP_SM_TXAW       0x5
> +#define   I2CM_PKT_OP_SM_INIT       0x8
> +#define   I2CM_PKT_OP_SM_TXD        0x9
> +#define   I2CM_PKT_OP_SM_RXD        0xa
> +#define   I2CM_PKT_OP_SM_STOP       0xb
> +#define   I2CM_PKT_OP_SM_RETRY      0xc
> +#define   I2CM_PKT_OP_SM_FAIL       0xd
> +#define   I2CM_PKT_OP_SM_WAIT       0xe
> +#define   I2CM_PKT_OP_SM_PASS       0xf
> +#define   I2CM_PKT_TIMEOUT          BIT(18)
> +#define   I2CM_PKT_ERROR            BIT(17)
> +#define   I2CM_PKT_DONE             BIT(16)
> +#define   I2CM_BUS_RECOVER_FAIL     BIT(15)
> +#define   I2CM_SDA_DL_TO            BIT(14)
> +#define   I2CM_BUS_RECOVER          BIT(13)
> +#define   I2CM_SMBUS_ALT            BIT(12)
> +#define   I2CM_SCL_LOW_TO           BIT(6)
> +#define   I2CM_ABNORMAL             BIT(5)
> +#define   I2CM_NORMAL_STOP          BIT(4)
> +#define   I2CM_ARBIT_LOSS           BIT(3)
> +#define   I2CM_RX_DONE              BIT(2)
> +#define   I2CM_TX_NAK               BIT(1)
> +#define   I2CM_TX_ACK               BIT(0)
> +#define I2CM_CMD_STS_REG      0x18
> +#define   I2CM_CMD_PKT_MODE           (1 << 16)
> +
> +#define   I2CM_PKT_EN               BIT(16)
> +#define   I2CM_SDA_OE_OUT_DIR       BIT(15)
> +#define   I2CM_SDA_O_OUT_DIR        BIT(14)
> +#define   I2CM_SCL_OE_OUT_DIR       BIT(13)
> +#define   I2CM_SCL_O_OUT_DIR        BIT(12)
> +#define   I2CM_RECOVER_CMD_EN       BIT(11)
> +#define   I2CM_RX_DMA_EN            BIT(9)
> +#define   I2CM_TX_DMA_EN            BIT(8)
> +/* Command Bit */
> +#define   I2CM_RX_BUFF_EN           BIT(7)
> +#define   I2CM_TX_BUFF_EN           BIT(6)
> +#define   I2CM_STOP_CMD             BIT(5)
> +#define   I2CM_RX_CMD_LAST          BIT(4)
> +#define   I2CM_RX_CMD               BIT(3)
> +#define   I2CM_TX_CMD               BIT(1)
> +#define   I2CM_START_CMD            BIT(0)
> +#define   I2CM_PKT_ADDR(x)          ((x & 0x7f) << 24)
> +
> +#define I2CM_DMA_LEN          0x1c
> +#define I2CS_INT_CTRL_REG     0x20
> +#define I2CS_INT_STS_REG      0x24
> +#define I2CS_CMD_STS_REG      0x28
> +#define I2CS_DMA_LEN          0x2c
> +#define I2CM_DMA_TX_BUF       0x30
> +#define I2CM_DMA_RX_BUF       0x34
> +#define I2CS_DMA_TX_BUF       0x38
> +#define I2CS_DMA_RX_BUF       0x3c
> +#define I2CS_SA_REG           0x40
> +#define I2CM_DMA_LEN_STS_REG  0x48
> +#define I2CS_DMA_LEN_STS_REG  0x4c
> +#define I2CC_DMA_OP_ADDR_REG  0x50
> +#define I2CC_DMA_OP_LEN_REG   0x54
> +
> +static inline bool aspeed_i2c_ctrl_is_new_mode(AspeedI2CState *controller)
> +{
> +    return (controller->ctrl_global & I2C_CTRL_NEW_REG_MODE) == I2C_CTRL_NEW_REG_MODE;
> +}

Only used once. Please merge in the bus equivalent below.

> +static inline bool aspeed_i2c_bus_is_new_mode(AspeedI2CBus *bus)
> +{
> +    return aspeed_i2c_ctrl_is_new_mode(bus->controller);
> +}
> +
>   static inline bool aspeed_i2c_bus_is_master(AspeedI2CBus *bus)
>   {
>       return bus->ctrl & I2CD_MASTER_EN;
> @@ -155,6 +253,24 @@ static inline bool aspeed_i2c_bus_is_enabled(AspeedI2CBus *bus)
>       return bus->ctrl & (I2CD_MASTER_EN | I2CD_SLAVE_EN);
>   }
>   
> +static inline void aspeed_i2c_bus_raise_interrupt_new(AspeedI2CBus *bus)
> +{
> +    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
> +
> +    trace_aspeed_i2c_bus_raise_interrupt_new(bus->intr_status,
> +          bus->intr_status & I2CM_TX_NAK ? "nak|" : "",
> +          bus->intr_status & I2CM_TX_ACK ? "ack|" : "",
> +          bus->intr_status & I2CM_RX_DONE ? "done|" : "",
> +          bus->intr_status & I2CM_NORMAL_STOP ? "normal|" : "",
> +          bus->intr_status & I2CM_ABNORMAL ? "abnormal|" : "",
> +          bus->intr_status & I2CM_PKT_DONE ? "pkt" : "");

please update the 'aspeed_i2c_bus_raise_interrupt' trace event to take a
single status string.

We might not need a specific aspeed_i2c_bus_raise_interrupt_new() routine
if the slave and master interrupts separation, BIT(3) of the global control
register, is modeled. This should be done in a preliminary patch

> +    if (bus->intr_status) {
> +        bus->controller->intr_status |= 1 << bus->id;
> +        qemu_irq_raise(aic->bus_get_irq(bus));
> +    }
> +}
> +
>   static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
>   {
>       AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
> @@ -173,7 +289,68 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
>       }
>   }
>   
> -static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
> +static uint64_t aspeed_i2c_bus_read_new(void *opaque, hwaddr offset,
> +                                    unsigned size)
>
> +{
> +    AspeedI2CBus *bus = opaque;
> +    uint64_t value = -1;
> +
> +    switch (offset) {
> +    case I2CC_M_S_FUNC_CTRL_REG:
> +        value = bus->ctrl;
> +        break;
> +    case I2CC_M_S_CLK_AC_TIMING_REG:
> +        value = ((bus->timing[1] & 0x1F) << 24) | (bus->timing[1] & 0xFFFFF);
> +        break;
> +    case I2CM_INT_CTRL_REG:
> +        value = bus->intr_ctrl;
> +        break;
> +    case I2CM_INT_STS_REG:
> +        value = bus->intr_status;
> +        break;
> +    case I2CM_CMD_STS_REG:
> +        value = bus->cmd;
> +        break;
> +    case I2CM_DMA_LEN:
> +        value = bus->dma_len & 0x0fff;
> +        break;
> +    case I2CM_DMA_TX_BUF: case I2CM_DMA_RX_BUF:

add a new line please.

> +        value = bus->dma_addr;
> +        break;
> +    case I2CM_DMA_LEN_STS_REG:
> +        value = bus->dma_len_tx | (bus->dma_len_rx << 16);
> +        break;
> +    case I2CC_M_S_TX_RX_BUF_REG:
> +        /*
> +         * TODO:
> +         * [31:16] RO  Same as I2CD14[31:16]
> +         * [15: 0] RW  Same as I2CD20[15: 0]
> +         */
> +        value = (i2c_bus_busy(bus->bus) << 16);
> +        break;
> +    case I2CC_M_X_POOL_BUF_CTRL_REG:
> +    case I2CS_INT_CTRL_REG:
> +    case I2CS_INT_STS_REG:
> +    case I2CS_CMD_STS_REG:
> +    case I2CS_DMA_LEN:
> +    case I2CS_DMA_TX_BUF:
> +    case I2CS_DMA_RX_BUF:
> +    case I2CS_SA_REG:
> +    case I2CS_DMA_LEN_STS_REG:
> +    case I2CC_DMA_OP_ADDR_REG:
> +    case I2CC_DMA_OP_LEN_REG:
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__, offset);
> +        value = -1;
> +        break;
> +    }
> +
> +    trace_aspeed_i2c_bus_read_new(bus->id, offset, size, value);
> +    return value;
> +}
> +
> +static uint64_t aspeed_i2c_bus_read_old(void *opaque, hwaddr offset,
>                                       unsigned size)
>   {
>       AspeedI2CBus *bus = opaque;
> @@ -227,19 +404,38 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
>           break;
>       }
>   
> -    trace_aspeed_i2c_bus_read(bus->id, offset, size, value);
> +    trace_aspeed_i2c_bus_read_old(bus->id, offset, size, value);

We don't need a new trace event.

>       return value;
>   }
>   
> +static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
> +                                    unsigned size)
> +{
> +    AspeedI2CBus *bus = opaque;
> +    if (aspeed_i2c_bus_is_new_mode(bus)) {
> +        return aspeed_i2c_bus_read_new(opaque, offset, size);
> +    } else {
> +        return aspeed_i2c_bus_read_old(opaque, offset, size);
> +    }

Hmm, that's a bit ugly.

I wonder if we should not have 2 different memory regions, one for
each set of registers, and simply map the 'new' set on top of the
default 'old' set when BIT(2) is 1 in the global control register.

It would remove a few aspeed_i2c_bus_is_new_mode() calls.

> +}
> +
>   static void aspeed_i2c_set_state(AspeedI2CBus *bus, uint8_t state)
>   {
> -    bus->cmd &= ~(I2CD_TX_STATE_MASK << I2CD_TX_STATE_SHIFT);
> -    bus->cmd |= (state & I2CD_TX_STATE_MASK) << I2CD_TX_STATE_SHIFT;
> +    if (aspeed_i2c_bus_is_new_mode(bus)) {
> +        bus->tx_state_machine = state;

Shouldn't the state be stored under I2CM_INT_STS_REG ?

> +    } else {
> +        bus->cmd &= ~(I2CD_TX_STATE_MASK << I2CD_TX_STATE_SHIFT);
> +        bus->cmd |= (state & I2CD_TX_STATE_MASK) << I2CD_TX_STATE_SHIFT;
> +    }
>   }
>   
>   static uint8_t aspeed_i2c_get_state(AspeedI2CBus *bus)
>   {
> -    return (bus->cmd >> I2CD_TX_STATE_SHIFT) & I2CD_TX_STATE_MASK;
> +    if (aspeed_i2c_bus_is_new_mode(bus)) {
> +        return bus->tx_state_machine;

same comment.

> +    } else {
> +        return (bus->cmd >> I2CD_TX_STATE_SHIFT) & I2CD_TX_STATE_MASK;
> +    }
>   }
>   
>   static int aspeed_i2c_dma_read(AspeedI2CBus *bus, uint8_t *data)
> @@ -257,6 +453,27 @@ static int aspeed_i2c_dma_read(AspeedI2CBus *bus, uint8_t *data)
>   
>       bus->dma_addr++;
>       bus->dma_len--;
> +    bus->dma_len_tx++;
> +    return 0;
> +}
> +
> +static int aspeed_i2c_dma_write(AspeedI2CBus *bus, uint8_t *data)
> +{
> +    MemTxResult result;
> +    AspeedI2CState *s = bus->controller;
> +
> +    result = address_space_write(&s->dram_as, bus->dma_addr,
> +                                 MEMTXATTRS_UNSPECIFIED, data, 1);
> +
> +    if (result != MEMTX_OK) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM read failed @%08x\n",
> +                      __func__, bus->dma_addr);
> +        return -1;
> +    }
> +
> +    bus->dma_addr++;
> +    bus->dma_len--;
> +    bus->dma_len_rx++;
>       return 0;
>   }
>   
> @@ -361,17 +578,29 @@ static uint8_t aspeed_i2c_get_addr(AspeedI2CBus *bus)
>   {
>       AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
>   
> -    if (bus->cmd & I2CD_TX_BUFF_ENABLE) {
> -        uint8_t *pool_base = aic->bus_pool_base(bus);
> +    if (aspeed_i2c_bus_is_new_mode(bus)) {
> +        if (bus->cmd & I2CM_CMD_PKT_MODE) {

I would reverse the logic and check that software can not configure
I2CM_CMD_PKT_MODE when new mode is off.

> +            return (bus->cmd & 0x7F000000) >> 23 |
> +                   (bus->cmd & I2CM_RX_CMD ? 0x01 : 0x00);
> +        } else {
> +            /* TODO: Support other mode */
> +            qemu_log_mask(LOG_UNIMP, "%s: New register mode with cmd=%08x\n",
> +                          __func__, bus->cmd);
> +            return 0xFF;

What does that mean ? That the old transfer modes have a different
semantic when new mode is activated ?


> +        }
> +    } else {
> +        if (bus->cmd & I2CD_TX_BUFF_ENABLE) {
> +            uint8_t *pool_base = aic->bus_pool_base(bus);
>   
> -        return pool_base[0];
> -    } else if (bus->cmd & I2CD_TX_DMA_ENABLE) {
> -        uint8_t data;
> +            return pool_base[0];
> +        } else if (bus->cmd & I2CD_TX_DMA_ENABLE) {
> +            uint8_t data;
>   
> -        aspeed_i2c_dma_read(bus, &data);
> -        return data;
> -    } else {
> -        return bus->buf;
> +            aspeed_i2c_dma_read(bus, &data);
> +            return data;
> +        } else {
> +            return bus->buf;
> +        }
>       }
>   }
>   
> @@ -425,6 +654,106 @@ static void aspeed_i2c_bus_cmd_dump(AspeedI2CBus *bus)
>       trace_aspeed_i2c_bus_cmd(bus->cmd, cmd_flags, count, bus->intr_status);
>   }
>   
> +/*
> + * This cmd handler only process new register set with packet mode

ouch. this is duplicating the complex part of the model :/

Can not we introduce the new packet mode in the original command
handler ?

> + */
> +static void aspeed_i2c_bus_handle_cmd_new(AspeedI2CBus *bus, uint64_t value)
> +{> +    uint32_t cmd_done = 0;
> +
> +    if (bus->cmd & I2CM_CMD_PKT_MODE) {
> +        bus->intr_status |= I2CM_PKT_DONE;
> +        bus->dma_len_tx = 0;
> +        bus->dma_len_rx = 0;
> +    }
> +
> +    if (bus->cmd & I2CM_START_CMD) {
> +        /* Send I2C_START event */
> +        uint8_t addr = aspeed_i2c_get_addr(bus);
> +        if (aspeed_i2c_get_state(bus) == I2CM_PKT_OP_SM_IDLE) {
> +            if (i2c_start_transfer(bus->bus, extract32(addr, 1, 7),
> +                                   extract32(addr, 0, 1))) {
> +                bus->intr_status |= I2CM_TX_NAK | I2CM_PKT_ERROR;
> +            }
> +
> +            if (addr & 0x01) {
> +                aspeed_i2c_set_state(bus, I2CM_PKT_OP_SM_STARTR);
> +            } else {
> +                aspeed_i2c_set_state(bus, I2CM_PKT_OP_SM_STARTW);
> +            }
> +        }
> +        cmd_done |= I2CM_START_CMD;
> +    }
> +
> +    if (bus->cmd & I2CM_TX_CMD) {
> +        /* Send through DMA */
> +        if (bus->cmd & I2CM_TX_DMA_EN) {
> +            while (bus->dma_len) {
> +                uint8_t data;
> +                int ret;
> +                aspeed_i2c_dma_read(bus, &data);
> +                trace_aspeed_i2c_bus_send("DMA", bus->dma_len, bus->dma_len, data);
> +                ret = i2c_send(bus->bus, data);
> +                if (ret) {
> +                    break;
> +                }
> +            }
> +            bus->intr_status |= I2CM_TX_ACK;
> +            cmd_done |= I2CM_TX_DMA_EN;
> +        } else {
> +            /* TODO: Support Byte/Buffer mode */
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Only support DMA\n",  __func__);

ah ! Please describe which mode can be used in the commit log.

> +        }
> +        aspeed_i2c_set_state(bus, I2CM_PKT_OP_SM_TXD);
> +        cmd_done |= I2CM_TX_CMD;
> +    }
> +
> +    if (bus->cmd & I2CM_RX_CMD) {
> +        uint8_t addr = aspeed_i2c_get_addr(bus);
> +        if (bus->cmd & I2CM_START_CMD &&
> +            aspeed_i2c_get_state(bus) != I2CM_PKT_OP_SM_STARTR) {
> +            /* Repeated Start */
> +            i2c_start_transfer(bus->bus, extract32(addr, 1, 7), extract32(addr, 0, 1));
> +            aspeed_i2c_set_state(bus, I2CM_PKT_OP_SM_STARTR);
> +        }
> +        if (bus->cmd & I2CM_RX_DMA_EN) {
> +            /* Write to DMA */
> +            while (bus->dma_len) {
> +                uint8_t data;
> +                data = i2c_recv(bus->bus);
> +                if (aspeed_i2c_dma_write(bus, &data)) {
> +                    break;
> +                }
> +            }
> +            cmd_done |= I2CM_RX_DMA_EN;
> +        }
> +        aspeed_i2c_set_state(bus, I2CM_PKT_OP_SM_RXD);
> +        cmd_done |= I2CM_RX_CMD;
> +    }
> +
> +    if (bus->cmd & I2CM_RX_CMD_LAST) {
> +        i2c_nack(bus->bus);
> +        bus->intr_status |= I2CM_RX_DONE;
> +        cmd_done |= I2CM_RX_CMD_LAST;
> +    }
> +
> +    if (bus->cmd & I2CM_STOP_CMD) {
> +        aspeed_i2c_set_state(bus, I2CM_PKT_OP_SM_STOP);
> +        /* Send I2C_END Event */
> +        i2c_end_transfer(bus->bus);
> +        aspeed_i2c_set_state(bus, I2CM_PKT_OP_SM_IDLE);
> +        bus->intr_status |= I2CM_NORMAL_STOP;
> +        cmd_done |= I2CM_STOP_CMD;
> +    }
> +
> +    if (bus->cmd & I2CM_CMD_PKT_MODE) {
> +        bus->intr_status |= I2CM_PKT_DONE;
> +        cmd_done |= 0x7F000000 | I2CM_CMD_PKT_MODE;
> +    }
> +
> +    bus->cmd &= ~cmd_done;
> +}
> +
>   /*
>    * The state machine needs some refinement. It is only used to track
>    * invalid STOP commands for the moment.
> @@ -523,14 +852,103 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
>       }
>   }
>   
> -static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
> +static void aspeed_i2c_bus_write_new(void *opaque, hwaddr offset,
> +                                 uint64_t value, unsigned size)
> +{
> +    AspeedI2CBus *bus = opaque;
> +    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
> +    trace_aspeed_i2c_bus_write_new(bus->id, offset, size, value);
> +
> +    switch (offset) {
> +    case I2CC_M_S_FUNC_CTRL_REG:
> +        if (value & I2CD_SLAVE_EN) {
> +            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
> +                          __func__);
> +            break;
> +        }
> +        bus->ctrl = value & 0x007FFFFF;
> +        break;
> +    case I2CC_M_S_CLK_AC_TIMING_REG:
> +        bus->timing[0] = value & 0x000FFF0F;
> +        bus->timing[1] = (value & 0x1F000000) >> 24;
> +        break;
> +    case I2CC_M_S_TX_RX_BUF_REG:
> +        bus->buf = value & 0xFF;
> +        break;
> +    case I2CM_INT_CTRL_REG:
> +        bus->intr_ctrl = value & 0x77FFF;
> +        break;
> +    case I2CM_INT_STS_REG:
> +        if (value & I2CM_PKT_DONE) {
> +            bus->intr_status &= ~(0x7E07F);
> +        } else {
> +            bus->intr_status &= ~(value & 0x7F07F);
> +        }
> +        if (1 || !(bus->intr_status & 0x7F07F)) {
> +            bus->controller->intr_status &= ~(1 << bus->id);
> +            qemu_irq_lower(aic->bus_get_irq(bus));
> +        }
> +        break;
> +    case I2CM_CMD_STS_REG:
> +        if (!aspeed_i2c_bus_is_enabled(bus)) {
> +            break;
> +        }
> +        if (!aspeed_i2c_bus_is_master(bus)) {
> +            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
> +                            __func__);
> +            break;
> +        }
> +        bus->cmd = value;
> +        aspeed_i2c_bus_handle_cmd_new(bus, value);
> +        aspeed_i2c_bus_raise_interrupt_new(bus);
> +        break;
> +    case I2CM_DMA_LEN:
> +        if (!aic->has_dma) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
> +            break;
> +        }
> +        /* 0 = 1 byte, 1 = 2 bytes, 4095 = 4096 bytes */
> +        if (value & 0x00008000) {
> +            bus->dma_len = (value & 0xfff) + 1;
> +        } else if (value & 0x80000000) {
> +            bus->dma_len = ((value >> 16) & 0xfff) + 1;
> +        }
> +        break;
> +    case I2CM_DMA_TX_BUF: case I2CM_DMA_RX_BUF:
> +        if (!aic->has_dma) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
> +            break;
> +        }
> +        bus->dma_addr = value & 0x7fffffff;
> +        break;
> +    case I2CM_DMA_LEN_STS_REG:
> +        bus->dma_len_tx = 0;
> +        bus->dma_len_rx = 0;
> +        break;
> +    case I2CC_M_X_POOL_BUF_CTRL_REG:
> +    case I2CS_INT_CTRL_REG:
> +    case I2CS_INT_STS_REG:
> +    case I2CS_CMD_STS_REG:
> +    case I2CS_DMA_LEN:
> +    case I2CS_DMA_TX_BUF:
> +    case I2CS_DMA_RX_BUF:
> +    case I2CS_SA_REG:
> +    case I2CS_DMA_LEN_STS_REG:
> +    case I2CC_DMA_OP_ADDR_REG:
> +    case I2CC_DMA_OP_LEN_REG:
> +    default:
> +        break;
> +    }
> +}
> +
> +static void aspeed_i2c_bus_write_old(void *opaque, hwaddr offset,
>                                    uint64_t value, unsigned size)
>   {
>       AspeedI2CBus *bus = opaque;
>       AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
>       bool handle_rx;
>   
> -    trace_aspeed_i2c_bus_write(bus->id, offset, size, value);
> +    trace_aspeed_i2c_bus_write_old(bus->id, offset, size, value);
>   
>       switch (offset) {
>       case I2CD_FUN_CTRL_REG:
> @@ -622,6 +1040,17 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
>       }
>   }
>   
> +static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
> +                                 uint64_t value, unsigned size)
> +{
> +    AspeedI2CBus *bus = opaque;
> +    if (aspeed_i2c_bus_is_new_mode(bus)) {
> +        return aspeed_i2c_bus_write_new(opaque, offset, value, size);
> +    } else {
> +        return aspeed_i2c_bus_write_old(opaque, offset, value, size);
> +    }
> +}


see comment on read.

>   static uint64_t aspeed_i2c_ctrl_read(void *opaque, hwaddr offset,
>                                      unsigned size)
>   {
> @@ -632,6 +1061,8 @@ static uint64_t aspeed_i2c_ctrl_read(void *opaque, hwaddr offset,
>           return s->intr_status;
>       case I2C_CTRL_GLOBAL:
>           return s->ctrl_global;
> +    case I2C_NEW_DIV_GLOBAL:
> +        return s->new_divider;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
>                         __func__, offset);
> @@ -650,6 +1081,9 @@ static void aspeed_i2c_ctrl_write(void *opaque, hwaddr offset,
>       case I2C_CTRL_GLOBAL:
>           s->ctrl_global = value;
>           break;
> +    case I2C_NEW_DIV_GLOBAL:
> +        s->new_divider = value;
> +        break;
>       case I2C_CTRL_STATUS:
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
> @@ -1013,6 +1447,29 @@ static const TypeInfo aspeed_2600_i2c_info = {
>       .class_init = aspeed_2600_i2c_class_init,
>   };
>   
> +static void aspeed_1030_i2c_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedI2CClass *aic = ASPEED_I2C_CLASS(klass);
> +
> +    dc->desc = "ASPEED 1030 I2C Controller";
> +
> +    aic->num_busses = 14;
> +    aic->reg_size = 0x80;
> +    aic->gap = -1; /* no gap */
> +    aic->bus_get_irq = aspeed_2600_i2c_bus_get_irq;
> +    aic->pool_size = 0x200;
> +    aic->pool_base = 0xC00;
> +    aic->bus_pool_base = aspeed_2600_i2c_bus_pool_base;
> +    aic->has_dma = true;
> +}
> +
> +static const TypeInfo aspeed_1030_i2c_info = {
> +    .name = TYPE_ASPEED_1030_I2C,
> +    .parent = TYPE_ASPEED_I2C,
> +    .class_init = aspeed_1030_i2c_class_init,
> +};

This is an extra patch.


>   static void aspeed_i2c_register_types(void)
>   {
>       type_register_static(&aspeed_i2c_bus_info);
> @@ -1020,6 +1477,7 @@ static void aspeed_i2c_register_types(void)
>       type_register_static(&aspeed_2400_i2c_info);
>       type_register_static(&aspeed_2500_i2c_info);
>       type_register_static(&aspeed_2600_i2c_info);
> +    type_register_static(&aspeed_1030_i2c_info);
>   }
>   
>   type_init(aspeed_i2c_register_types)
> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
> index 7d8907c1ee..eec3568082 100644
> --- a/hw/i2c/trace-events
> +++ b/hw/i2c/trace-events
> @@ -10,8 +10,11 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
>   
>   aspeed_i2c_bus_cmd(uint32_t cmd, const char *cmd_flags, uint32_t count, uint32_t intr_status) "handling cmd=0x%x %s count=%d intr=0x%x"
>   aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5) "handled intr=0x%x %s%s%s%s%s"
> -aspeed_i2c_bus_read(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
> -aspeed_i2c_bus_write(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
> +aspeed_i2c_bus_raise_interrupt_new(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5, const char *str6) "handled intr=0x%x %s%s%s%s%s%s"
> +aspeed_i2c_bus_read_old(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
> +aspeed_i2c_bus_read_new(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
> +aspeed_i2c_bus_write_old(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
> +aspeed_i2c_bus_write_new(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
>   aspeed_i2c_bus_send(const char *mode, int i, int count, uint8_t byte) "%s send %d/%d 0x%02x"
>   aspeed_i2c_bus_recv(const char *mode, int i, int count, uint8_t byte) "%s recv %d/%d 0x%02x"
>   
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index 4b9be09274..bcd15850d0 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -29,6 +29,7 @@
>   #define TYPE_ASPEED_2400_I2C TYPE_ASPEED_I2C "-ast2400"
>   #define TYPE_ASPEED_2500_I2C TYPE_ASPEED_I2C "-ast2500"
>   #define TYPE_ASPEED_2600_I2C TYPE_ASPEED_I2C "-ast2600"
> +#define TYPE_ASPEED_1030_I2C TYPE_ASPEED_I2C "-ast1030"
>   OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
>   
>   #define ASPEED_I2C_NR_BUSSES 16
> @@ -58,6 +59,12 @@ struct AspeedI2CBus {
>       uint32_t pool_ctrl;
>       uint32_t dma_addr;
>       uint32_t dma_len;
> +
> +    uint8_t tx_state_machine;
> +    uint32_t intr_ctrl_slave;
> +    uint32_t intr_status_slave;
> +    uint32_t dma_len_tx;
> +    uint32_t dma_len_rx;

please update the vmstate for migration.

Thanks,

C.


>   };
>   
>   struct AspeedI2CState {
> @@ -68,6 +75,7 @@ struct AspeedI2CState {
>   
>       uint32_t intr_status;
>       uint32_t ctrl_global;
> +    uint32_t new_divider;
>       MemoryRegion pool_iomem;
>       uint8_t pool[ASPEED_I2C_MAX_POOL_SIZE];
>   


