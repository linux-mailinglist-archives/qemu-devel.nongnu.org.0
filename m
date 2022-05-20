Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6181052E645
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 09:28:40 +0200 (CEST)
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrx3v-0003B6-G3
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 03:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nrwpH-00035o-PS
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:13:31 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:44707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nrwpE-00031x-Ga
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:13:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.136])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0D885224C1;
 Fri, 20 May 2022 07:13:16 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 20 May
 2022 09:13:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004f522b33c-b8db-44dc-b0bb-a5d65b45c4c7,
 0DD4A5C779302D20AC70C8CF8FF45AED8889647F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fa28d338-1e63-cc5c-6c4f-2236bd0c561a@kaod.org>
Date: Fri, 20 May 2022 09:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] hw/net: Add LiteEth model
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <qemu-devel@nongnu.org>
CC: Jason Wang <jasowang@redhat.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Brian Swetland <swetland@frotz.net>
References: <20220520065302.715904-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220520065302.715904-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: af5d023b-b930-4a08-ac09-00cc5e6f8623
X-Ovh-Tracer-Id: 4579034922430335782
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedriedvgdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshifvghtlhgrnhgusehfrhhothiirdhnvght
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 5/20/22 08:53, Joel Stanley wrote:
> LiteX is a soft system-on-chip that targets FPGAs. LiteETH is a basic
> network device that is commonly used in LiteX designs.
> 
> There is an upstream Linux kernel driver for this device and support in
> various other firmware projects for it.


I see that the mmc driver has been merged. What about the SPI flash ?
If you are interested, here is one :

   https://github.com/legoater/linux/commits/microwatt

The whole can be tested with these microwatt SoC models :

   https://github.com/legoater/qemu/commits/ppc-microwatt


> Co-developed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Thanks,

C.


> ---
>   include/hw/net/liteeth.h |  56 ++++++++
>   hw/net/liteeth.c         | 299 +++++++++++++++++++++++++++++++++++++++
>   hw/net/Kconfig           |   3 +
>   hw/net/meson.build       |   1 +
>   hw/net/trace-events      |   6 +
>   5 files changed, 365 insertions(+)
>   create mode 100644 include/hw/net/liteeth.h
>   create mode 100644 hw/net/liteeth.c
> 
> diff --git a/include/hw/net/liteeth.h b/include/hw/net/liteeth.h
> new file mode 100644
> index 000000000000..8abdfd46bc8e
> --- /dev/null
> +++ b/include/hw/net/liteeth.h
> @@ -0,0 +1,56 @@
> +/*
> + * LiteX Liteeth Ethernet controller
> + *
> + * Copyright (c) 2021, IBM Corporation.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef LITEETH_H
> +#define LITEETH_H
> +
> +#include "net/net.h"
> +#include "hw/sysbus.h"
> +
> +struct LiteEthState {
> +    SysBusDevice parent;
> +
> +    MemoryRegion mmio;
> +    MemoryRegion mmio_buf_container;
> +    MemoryRegion mmio_buf;
> +    AddressSpace mmio_buf_as;
> +
> +    qemu_irq irq;
> +    NICState *nic;
> +    NICConf conf;
> +
> +    /*
> +     * Hardware configuration
> +     *
> +     * n slots, slot_size bytes each.
> +     *
> +     *  -----   <- rx_base
> +     * |  1  |
> +     * |  2  |
> +     * |  .  |
> +     * |  n  |
> +     * |-----|  <- tx_base
> +     * |  1  |
> +     * |  2  |
> +     * |  .  |
> +     * |  n  |
> +     *  -----
> +     */
> +    uint32_t rx_current;
> +
> +    uint32_t tx_slots;
> +    uint32_t rx_slots;
> +    uint32_t slot_size;
> +
> +    uint32_t regs[0x100 / 4];
> +};
> +
> +#define TYPE_LITEETH "liteeth"
> +OBJECT_DECLARE_SIMPLE_TYPE(LiteEthState, LITEETH)
> +
> +#endif
> diff --git a/hw/net/liteeth.c b/hw/net/liteeth.c
> new file mode 100644
> index 000000000000..daea8a165337
> --- /dev/null
> +++ b/hw/net/liteeth.c
> @@ -0,0 +1,299 @@
> +/*
> + * LiteX Liteeth Ethernet controller
> + *
> + * Copyright (c) 2021, IBM Corporation.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/net/liteeth.h"
> +#include "net/eth.h"
> +#include "qemu/log.h"
> +#include "qemu/units.h"
> +#include "sysemu/dma.h"
> +#include "trace.h"
> +
> +#define LITEETH_WRITER_SLOT       (0x00 / 4)
> +#define LITEETH_WRITER_LENGTH     (0x04 / 4)
> +#define LITEETH_WRITER_ERRORS     (0x08 / 4) /* backend FIFO errors */
> +#define LITEETH_WRITER_EV_STATUS  (0x0C / 4) /* raw IRQ level bits */
> +#define LITEETH_WRITER_EV_PENDING (0x10 / 4) /* to read and clear level */
> +#define LITEETH_WRITER_EV_ENABLE  (0x14 / 4)
> +#define LITEETH_READER_START      (0x18 / 4)
> +#define LITEETH_READER_READY      (0x1C / 4)
> +#define LITEETH_READER_LEVEL      (0x20 / 4)
> +#define LITEETH_READER_SLOT       (0x24 / 4)
> +#define LITEETH_READER_LENGTH     (0x28 / 4)
> +#define LITEETH_READER_EV_STATUS  (0x2C / 4) /* raw IRQ level bits */
> +#define LITEETH_READER_EV_PENDING (0x30 / 4)
> +#define LITEETH_READER_EV_ENABLE  (0x34 / 4)
> +#define LITEETH_PREAMBLE_CRC      (0x38 / 4) /* ??? */
> +#define LITEETH_PREAMBLE_ERRORS   (0x3C / 4) /* ??? */
> +#define LITEETH_CRC_ERRORS        (0x40 / 4) /* ??? */
> +
> +#define LITEETH_SLOT_SIZE         (2 * KiB)
> +
> +static void liteeth_update_irq(LiteEthState *s)
> +{
> +    bool level = s->regs[LITEETH_READER_EV_PENDING] ||
> +        s->regs[LITEETH_WRITER_EV_PENDING];
> +
> +    qemu_set_irq(s->irq, level);
> +}
> +
> +static hwaddr liteeth_rx_addr(LiteEthState *s)
> +{
> +    return s->rx_current * LITEETH_SLOT_SIZE;
> +}
> +
> +static hwaddr liteeth_tx_addr(LiteEthState *s)
> +{
> +    hwaddr tx_offset = s->rx_slots * LITEETH_SLOT_SIZE;
> +    uint8_t slot = s->regs[LITEETH_READER_SLOT];
> +
> +    return tx_offset + slot * LITEETH_SLOT_SIZE;
> +}
> +
> +static void liteeth_xmit(LiteEthState *s)
> +{
> +    uint8_t buf[LITEETH_SLOT_SIZE];
> +    uint16_t len = s->regs[LITEETH_READER_LENGTH];
> +    hwaddr addr = liteeth_tx_addr(s);
> +    MemTxResult result;
> +
> +    trace_liteeth_xmit(len, s->regs[LITEETH_READER_SLOT]);
> +
> +    assert(len <= LITEETH_SLOT_SIZE);
> +
> +    result = address_space_read(&s->mmio_buf_as, addr, MEMTXATTRS_UNSPECIFIED,
> +                                buf, len);
> +    if (result != MEMTX_OK) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: failed to read packet @0x%"HWADDR_PRIx "\n",
> +                      __func__, addr);
> +        /* TODO: report TX errors ? */
> +        return;
> +    }
> +
> +    qemu_send_packet(qemu_get_queue(s->nic), buf, len);
> +
> +    if (s->regs[LITEETH_READER_EV_ENABLE]) {
> +        s->regs[LITEETH_READER_EV_PENDING] = 1;
> +    }
> +}
> +
> +static bool liteeth_can_receive(NetClientState *nc)
> +{
> +    LiteEthState *s = LITEETH(qemu_get_nic_opaque(nc));
> +    return s->regs[LITEETH_WRITER_EV_ENABLE];
> +}
> +
> +static ssize_t liteeth_receive(NetClientState *nc, const uint8_t *buf,
> +                               size_t len)
> +{
> +    LiteEthState *s = LITEETH(qemu_get_nic_opaque(nc));
> +    hwaddr addr = liteeth_rx_addr(s);
> +    MemTxResult result;
> +
> +    trace_liteeth_receive(len, s->rx_current);
> +
> +    if (len > LITEETH_SLOT_SIZE) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %zd bytes\n",
> +                      __func__, len);
> +        len = LITEETH_SLOT_SIZE;
> +    }
> +
> +    /* Copy data into memory */
> +    result = address_space_write(&s->mmio_buf_as, addr, MEMTXATTRS_UNSPECIFIED,
> +                                 buf, len);
> +    if (result != MEMTX_OK) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: failed to write packet @0x%"HWADDR_PRIx "\n",
> +                      __func__, addr);
> +        return -1;
> +    }
> +
> +    /* Update registers */
> +    s->regs[LITEETH_WRITER_SLOT] = s->rx_current;
> +    s->regs[LITEETH_WRITER_LENGTH] = len;
> +
> +    if (s->regs[LITEETH_WRITER_EV_ENABLE]) {
> +        s->regs[LITEETH_WRITER_EV_PENDING] = 1;
> +    }
> +
> +    s->rx_current = (s->rx_current + 1) % s->rx_slots;
> +
> +    liteeth_update_irq(s);
> +    return len;
> +}
> +
> +static void liteeth_reset(DeviceState *dev)
> +{
> +    LiteEthState *s = LITEETH(dev);
> +
> +    memset(s->regs, 0, sizeof(s->regs));
> +    s->regs[LITEETH_READER_READY] = 1;
> +
> +    s->rx_current = 0;
> +    qemu_set_irq(s->irq, 0);
> +}
> +
> +static uint64_t liteeth_read(void *opaque, hwaddr addr, unsigned width)
> +{
> +    LiteEthState *s = LITEETH(opaque);
> +    uint32_t reg = addr >> 2;
> +    uint64_t val = s->regs[reg];
> +
> +    trace_liteeth_read(addr, val);
> +
> +    return val;
> +}
> +
> +static void liteeth_write(void *opaque, hwaddr addr, uint64_t val,
> +                         unsigned width)
> +{
> +    LiteEthState *s = LITEETH(opaque);
> +    uint32_t reg = addr >> 2;
> +
> +    trace_liteeth_write(addr, val);
> +
> +    switch (reg) {
> +    case LITEETH_READER_START:
> +        if (s->regs[LITEETH_READER_EV_ENABLE]) {
> +            s->regs[LITEETH_READER_READY] = 0;
> +            liteeth_xmit(s);
> +            s->regs[LITEETH_READER_READY] = 1;
> +        }
> +        if (liteeth_can_receive(qemu_get_queue(s->nic))) {
> +            qemu_flush_queued_packets(qemu_get_queue(s->nic));
> +        }
> +        break;
> +
> +    case LITEETH_READER_EV_PENDING:
> +    case LITEETH_WRITER_EV_PENDING:
> +        s->regs[reg] = 0;
> +        break;
> +
> +    case LITEETH_READER_LENGTH:
> +        if (val > LITEETH_SLOT_SIZE) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: frame too big : %"PRIx64" bytes\n",
> +                          __func__, val);
> +            val = LITEETH_SLOT_SIZE;
> +        }
> +        s->regs[reg] = val;
> +        break;
> +    case LITEETH_READER_SLOT:
> +        s->regs[reg] = val % s->tx_slots;
> +        break;
> +
> +    case LITEETH_READER_READY:
> +    case LITEETH_WRITER_LENGTH:
> +    case LITEETH_WRITER_SLOT:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid write @%"HWADDR_PRIx"\n",
> +                      __func__, addr);
> +        break;
> +
> +    default:
> +        s->regs[reg] = val;
> +    }
> +
> +    liteeth_update_irq(s);
> +}
> +
> +static const MemoryRegionOps liteeth_ops = {
> +    .read = liteeth_read,
> +    .write = liteeth_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +static void liteeth_cleanup(NetClientState *nc)
> +{
> +    LiteEthState *s = LITEETH(qemu_get_nic_opaque(nc));
> +
> +    s->nic = NULL;
> +}
> +
> +struct NetClientInfo net_liteeth_info = {
> +    .type = NET_CLIENT_DRIVER_NIC,
> +    .size = sizeof(NICState),
> +    .can_receive = liteeth_can_receive,
> +    .receive = liteeth_receive,
> +    .cleanup = liteeth_cleanup,
> +};
> +
> +static void liteeth_realize(DeviceState *dev, Error **errp)
> +{
> +    LiteEthState *s = LITEETH(dev);
> +    Error *err = NULL;
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    uint64_t membuf_size = (s->tx_slots + s->rx_slots) * LITEETH_SLOT_SIZE;
> +
> +    sysbus_init_irq(sbd, &s->irq);
> +
> +    /* MAC registers */
> +    memory_region_init_io(&s->mmio, OBJECT(s), &liteeth_ops, s,
> +                          TYPE_LITEETH "-regs", 0x44);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> +
> +    /* Packet buffers */
> +    memory_region_init(&s->mmio_buf_container, OBJECT(s),
> +                       TYPE_LITEETH "-buf-container", membuf_size);
> +    sysbus_init_mmio(sbd, &s->mmio_buf_container);
> +
> +    memory_region_init_ram(&s->mmio_buf, OBJECT(s), TYPE_LITEETH "-buf",
> +                           membuf_size, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(&s->mmio_buf_container, 0x0, &s->mmio_buf);
> +
> +    address_space_init(&s->mmio_buf_as, &s->mmio_buf, TYPE_LITEETH "-buf");
> +
> +
> +    qemu_macaddr_default_if_unset(&s->conf.macaddr);
> +    s->nic = qemu_new_nic(&net_liteeth_info, &s->conf,
> +                          object_get_typename(OBJECT(dev)), dev->id, s);
> +    qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
> +}
> +
> +static Property liteeth_properties[] = {
> +    DEFINE_PROP_UINT32("tx-slots", struct LiteEthState, tx_slots, 2),
> +    DEFINE_PROP_UINT32("rx-slots", struct LiteEthState, rx_slots, 2),
> +    DEFINE_NIC_PROPERTIES(struct LiteEthState, conf),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void liteeth_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc    = "LiteX Ethernet";
> +    dc->realize = liteeth_realize;
> +    dc->reset = liteeth_reset;
> +    device_class_set_props(dc, liteeth_properties);
> +    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
> +}
> +
> +static const TypeInfo liteeth_info = {
> +    .name = TYPE_LITEETH,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(struct LiteEthState),
> +    .class_init = liteeth_class_init,
> +};
> +
> +static void liteeth_register_types(void)
> +{
> +    type_register_static(&liteeth_info);
> +}
> +
> +type_init(liteeth_register_types);
> diff --git a/hw/net/Kconfig b/hw/net/Kconfig
> index 6d795ec75256..e2c0f43f96b6 100644
> --- a/hw/net/Kconfig
> +++ b/hw/net/Kconfig
> @@ -61,6 +61,9 @@ config LAN9118
>       bool
>       select PTIMER
>   
> +config LITEETH
> +    bool
> +
>   config NE2000_ISA
>       bool
>       default y
> diff --git a/hw/net/meson.build b/hw/net/meson.build
> index ebac26154261..c8197685c603 100644
> --- a/hw/net/meson.build
> +++ b/hw/net/meson.build
> @@ -33,6 +33,7 @@ softmmu_ss.add(when: 'CONFIG_STELLARIS_ENET', if_true: files('stellaris_enet.c')
>   softmmu_ss.add(when: 'CONFIG_LANCE', if_true: files('lance.c'))
>   softmmu_ss.add(when: 'CONFIG_LASI_I82596', if_true: files('lasi_i82596.c'))
>   softmmu_ss.add(when: 'CONFIG_I82596_COMMON', if_true: files('i82596.c'))
> +softmmu_ss.add(when: 'CONFIG_LITEETH', if_true: files('liteeth.c'))
>   softmmu_ss.add(when: 'CONFIG_SUNHME', if_true: files('sunhme.c'))
>   softmmu_ss.add(when: 'CONFIG_FTGMAC100', if_true: files('ftgmac100.c'))
>   softmmu_ss.add(when: 'CONFIG_SUNGEM', if_true: files('sungem.c'))
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index 4c0ec3fda167..30400401359b 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -19,6 +19,12 @@ mdio_bitbang(bool mdc, bool mdio, int state, uint16_t cnt, unsigned int drive) "
>   lance_mem_readw(uint64_t addr, uint32_t ret) "addr=0x%"PRIx64"val=0x%04x"
>   lance_mem_writew(uint64_t addr, uint32_t val) "addr=0x%"PRIx64"val=0x%04x"
>   
> +# liteeth.c
> +liteeth_read(uint64_t addr, uint64_t data)  "@0x%" PRIx64 " value=0x%"PRIx64
> +liteeth_write(uint64_t addr, uint64_t data) "@0x%" PRIx64 " value=0x%"PRIx64
> +liteeth_xmit(uint16_t len, uint8_t slot) "len=%d slot=%d"
> +liteeth_receive(uint16_t len, uint8_t slot) "len=%d slot=%d"
> +
>   # mipsnet.c
>   mipsnet_send(uint32_t size) "sending len=%u"
>   mipsnet_receive(uint32_t size) "receiving len=%u"


