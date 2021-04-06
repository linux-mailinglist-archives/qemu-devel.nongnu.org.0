Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89FB354D72
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 09:11:53 +0200 (CEST)
Received: from localhost ([::1]:56228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTfsO-0004sh-Gv
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 03:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lTfqy-0004E0-Vh; Tue, 06 Apr 2021 03:10:27 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:54107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lTfqn-0006TL-6P; Tue, 06 Apr 2021 03:10:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C3EB8977D472;
 Tue,  6 Apr 2021 09:09:59 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 6 Apr 2021
 09:09:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0061ca4388b-e651-47af-93ea-4175ab5ee6b9,
 48F3A4D201026AA1446B174829F4A17F6C46C190) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] hw/misc: Add an iBT device model
To: Hao Wu <wuhaotsh@google.com>
References: <20210329121912.271900-1-clg@kaod.org>
 <CAGcCb1024NgHXM2ziURJFeAVv5o3P8V2221L_ps6hRaAbCs23A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d8a9a945-079c-7cea-0c6c-de868f91acb6@kaod.org>
Date: Tue, 6 Apr 2021 09:09:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAGcCb1024NgHXM2ziURJFeAVv5o3P8V2221L_ps6hRaAbCs23A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 10b316c2-8410-4582-9fdf-494482d707c1
X-Ovh-Tracer-Id: 668503070089186153
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudejfedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefkeeufeefheehteelhfeigeefgfehvdeivdfhjeffvdduueffvdegiefgueejffenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgrshhpvggvugdrsghtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopeifuhhhrghothhshhesghhoohhglhgvrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 4/5/21 6:54 PM, Hao Wu wrote:
> Hi, Cedric and Corey
> 
> When I'm implementing KCS device for nuvoton BMC boards, one of the feedback Corey gave me was to refactor the existing device like ipmi-bmc-extern so that we can reuse some of the common stuff there. I'm in the process of doing that. I'll probably send that as an RFC first to see how you think about that.

OK. 

I wrote this code 5/6 years ago ... Feedback welcome ! 

Thanks,

C.  



>
> On Mon, Mar 29, 2021 at 5:19 AM Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>> wrote:
> 
>     Implement an IPMI BT interface model using a chardev backend to
>     communicate with an external PowerNV machine. It uses the OpenIPMI
>     simulator protocol for virtual machines described in :
> 
>         https://github.com/cminyard/openipmi/blob/master/lanserv/README.vm <https://github.com/cminyard/openipmi/blob/master/lanserv/README.vm>
> 
>     and implemented by the 'ipmi-bmc-extern' model on the host side.
> 
>     To use, start the Aspeed BMC machine with :
> 
>         -chardev socket,id=ipmi0,host=localhost,port=9002,ipv4,server,nowait \
>         -global driver=aspeed.ibt,property=chardev,value=ipmi0
> 
>     and the PowerNV machine with :
> 
>         -chardev socket,id=ipmi0,host=localhost,port=9002,reconnect=10 \
>         -device ipmi-bmc-extern,id=bmc0,chardev=ipmi0 \
>         -device isa-ipmi-bt,bmc=bmc0,irq=10 -nodefaults
> 
>     Cc: Corey Minyard <cminyard@mvista.com <mailto:cminyard@mvista.com>>
>     Signed-off-by: Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>>
>     ---
>      include/hw/arm/aspeed_soc.h  |   2 +
>      include/hw/misc/aspeed_ibt.h |  47 +++
>      hw/arm/aspeed_ast2600.c      |  12 +
>      hw/arm/aspeed_soc.c          |  12 +
>      hw/misc/aspeed_ibt.c         | 596 +++++++++++++++++++++++++++++++++++
>      hw/misc/meson.build          |   1 +
>      hw/misc/trace-events         |   7 +
>      7 files changed, 677 insertions(+)
>      create mode 100644 include/hw/misc/aspeed_ibt.h
>      create mode 100644 hw/misc/aspeed_ibt.c
> 
>     diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
>     index d9161d26d645..f0c36b8f7d35 100644
>     --- a/include/hw/arm/aspeed_soc.h
>     +++ b/include/hw/arm/aspeed_soc.h
>     @@ -30,6 +30,7 @@
>      #include "hw/usb/hcd-ehci.h"
>      #include "qom/object.h"
>      #include "hw/misc/aspeed_lpc.h"
>     +#include "hw/misc/aspeed_ibt.h"
> 
>      #define ASPEED_SPIS_NUM  2
>      #define ASPEED_EHCIS_NUM 2
>     @@ -65,6 +66,7 @@ struct AspeedSoCState {
>          AspeedSDHCIState sdhci;
>          AspeedSDHCIState emmc;
>          AspeedLPCState lpc;
>     +    AspeedIBTState ibt;
>      };
> 
>      #define TYPE_ASPEED_SOC "aspeed-soc"
>     diff --git a/include/hw/misc/aspeed_ibt.h b/include/hw/misc/aspeed_ibt.h
>     new file mode 100644
>     index 000000000000..a02a57df9ff8
>     --- /dev/null
>     +++ b/include/hw/misc/aspeed_ibt.h
>     @@ -0,0 +1,47 @@
>     +/*
>     + * ASPEED iBT Device
>     + *
>     + * Copyright 2016 IBM Corp.
>     + *
>     + * This code is licensed under the GPL version 2 or later.  See
>     + * the COPYING file in the top-level directory.
>     + */
>     +#ifndef ASPEED_IBT_H
>     +#define ASPEED_IBT_H
>     +
>     +#include "hw/sysbus.h"
>     +#include "chardev/char-fe.h"
>     +
>     +#define TYPE_ASPEED_IBT "aspeed.ibt"
>     +#define ASPEED_IBT(obj) OBJECT_CHECK(AspeedIBTState, (obj), TYPE_ASPEED_IBT)
>     +
>     +#define ASPEED_IBT_NR_REGS (0x1C >> 2)
>     +
>     +#define ASPEED_IBT_BUFFER_SIZE 64
>     +
>     +typedef struct AspeedIBTState {
>     +    /*< private >*/
>     +    SysBusDevice parent_obj;
>     +
>     +    /*< public >*/
>     +    CharBackend chr;
>     +    bool connected;
>     +
>     +    uint8_t recv_msg[ASPEED_IBT_BUFFER_SIZE];
>     +    uint8_t recv_msg_len;
>     +    int recv_msg_index;
>     +    int recv_msg_too_many;
>     +    bool recv_waiting;
>     +    int in_escape;
>     +
>     +    uint8_t send_msg[ASPEED_IBT_BUFFER_SIZE];
>     +    uint8_t send_msg_len;
>     +
>     +    MemoryRegion iomem;
>     +    qemu_irq irq;
>     +
>     +    uint32_t regs[ASPEED_IBT_NR_REGS];
>     +
>     +} AspeedIBTState;
>     +
>     +#endif /* ASPEED_IBT_H */
>     diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>     index fc81c0d8df06..c30d0f320c2a 100644
>     --- a/hw/arm/aspeed_ast2600.c
>     +++ b/hw/arm/aspeed_ast2600.c
>     @@ -219,6 +219,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
> 
>          snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
>          object_initialize_child(obj, "hace", &s->hace, typename);
>     +
>     +    object_initialize_child(obj, "ibt", &s->ibt, TYPE_ASPEED_IBT);
>      }
> 
>      /*
>     @@ -510,6 +512,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>          sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                             aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
>     +
>     +    /* iBT */
>     +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
>     +        return;
>     +    }
>     +    memory_region_add_subregion(&s->lpc.iomem,
>     +                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DEV_LPC],
>     +                   &s->ibt.iomem);
>     +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ibt), 0,
>     +                       aspeed_soc_get_irq(s, ASPEED_DEV_IBT));
>      }
> 
>      static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>     diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>     index 4a95d27d9d63..5ab4cefc7e8b 100644
>     --- a/hw/arm/aspeed_soc.c
>     +++ b/hw/arm/aspeed_soc.c
>     @@ -219,6 +219,8 @@ static void aspeed_soc_init(Object *obj)
> 
>          snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
>          object_initialize_child(obj, "hace", &s->hace, typename);
>     +
>     +    object_initialize_child(obj, "ibt", &s->ibt, TYPE_ASPEED_IBT);
>      }
> 
>      static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>     @@ -438,6 +440,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>          sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                             aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
>     +
>     +    /* iBT */
>     +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
>     +        return;
>     +    }
>     +    memory_region_add_subregion(&s->lpc.iomem,
>     +                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DEV_LPC],
>     +                   &s->ibt.iomem);
>     +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_ibt,
>     +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_ibt));
>      }
>      static Property aspeed_soc_properties[] = {
>          DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
>     diff --git a/hw/misc/aspeed_ibt.c b/hw/misc/aspeed_ibt.c
>     new file mode 100644
>     index 000000000000..69a2096ccb00
>     --- /dev/null
>     +++ b/hw/misc/aspeed_ibt.c
>     @@ -0,0 +1,596 @@
>     +/*
>     + * ASPEED iBT Device
>     + *
>     + * Copyright (c) 2016-2021 Cédric Le Goater, IBM Corporation.
>     + *
>     + * This code is licensed under the GPL version 2 or later.  See
>     + * the COPYING file in the top-level directory.
>     + */
>     +
>     +#include "qemu/osdep.h"
>     +#include "hw/sysbus.h"
>     +#include "sysemu/qtest.h"
>     +#include "sysemu/sysemu.h"
>     +#include "qemu/log.h"
>     +#include "qapi/error.h"
>     +#include "qemu/error-report.h"
>     +#include "hw/irq.h"
>     +#include "hw/qdev-properties.h"
>     +#include "hw/qdev-properties-system.h"
>     +#include "migration/vmstate.h"
>     +#include "hw/misc/aspeed_ibt.h"
>     +#include "trace.h"
>     +
>     +#define BT_IO_REGION_SIZE 0x1C
>     +
>     +#define TO_REG(o) (o >> 2)
>     +
>     +#define BT_CR0                0x0   /* iBT config */
>     +#define   BT_CR0_IO_BASE         16
>     +#define   BT_CR0_IRQ             12
>     +#define   BT_CR0_EN_CLR_SLV_RDP  0x8
>     +#define   BT_CR0_EN_CLR_SLV_WRP  0x4
>     +#define   BT_CR0_ENABLE_IBT      0x1
>     +#define BT_CR1                0x4  /* interrupt enable */
>     +#define   BT_CR1_IRQ_H2B         0x01
>     +#define   BT_CR1_IRQ_HBUSY       0x40
>     +#define BT_CR2                0x8  /* interrupt status */
>     +#define   BT_CR2_IRQ_H2B         0x01
>     +#define   BT_CR2_IRQ_HBUSY       0x40
>     +#define BT_CR3                0xc /* unused */
>     +#define BT_CTRL                  0x10
>     +#define   BT_CTRL_B_BUSY         0x80
>     +#define   BT_CTRL_H_BUSY         0x40
>     +#define   BT_CTRL_OEM0           0x20
>     +#define   BT_CTRL_SMS_ATN        0x10
>     +#define   BT_CTRL_B2H_ATN        0x08
>     +#define   BT_CTRL_H2B_ATN        0x04
>     +#define   BT_CTRL_CLR_RD_PTR     0x02
>     +#define   BT_CTRL_CLR_WR_PTR     0x01
>     +#define BT_BMC2HOST            0x14
>     +#define BT_INTMASK             0x18
>     +#define   BT_INTMASK_B2H_IRQEN   0x01
>     +#define   BT_INTMASK_B2H_IRQ     0x02
>     +#define   BT_INTMASK_BMC_HWRST   0x80
>     +
>     +/*
>     + * VM IPMI defines
>     + */
>     +#define VM_MSG_CHAR        0xA0 /* Marks end of message */
>     +#define VM_CMD_CHAR        0xA1 /* Marks end of a command */
>     +#define VM_ESCAPE_CHAR     0xAA /* Set bit 4 from the next byte to 0 */
>     +
>     +#define VM_PROTOCOL_VERSION        1
>     +#define VM_CMD_VERSION             0xff /* A version number byte follows */
>     +#define VM_CMD_NOATTN              0x00
>     +#define VM_CMD_ATTN                0x01
>     +#define VM_CMD_ATTN_IRQ            0x02
>     +#define VM_CMD_POWEROFF            0x03
>     +#define VM_CMD_RESET               0x04
>     +#define VM_CMD_ENABLE_IRQ          0x05 /* Enable/disable the messaging irq */
>     +#define VM_CMD_DISABLE_IRQ         0x06
>     +#define VM_CMD_SEND_NMI            0x07
>     +#define VM_CMD_CAPABILITIES        0x08
>     +#define   VM_CAPABILITIES_POWER    0x01
>     +#define   VM_CAPABILITIES_RESET    0x02
>     +#define   VM_CAPABILITIES_IRQ      0x04
>     +#define   VM_CAPABILITIES_NMI      0x08
>     +#define   VM_CAPABILITIES_ATTN     0x10
>     +#define   VM_CAPABILITIES_GRACEFUL_SHUTDOWN 0x20
>     +#define VM_CMD_GRACEFUL_SHUTDOWN   0x09
>     +
>     +/*
>     + * These routines are inspired by the 'ipmi-bmc-extern' model and by
>     + * the lanserv simulator of OpenIPMI. See :
>     + *    https://github.com/cminyard/openipmi/blob/master/lanserv/serial_ipmi.c <https://github.com/cminyard/openipmi/blob/master/lanserv/serial_ipmi.c>
>     + */
>     +static unsigned char ipmb_checksum(const unsigned char *data, int size,
>     +                                   unsigned char start)
>     +{
>     +        unsigned char csum = start;
>     +
>     +        for (; size > 0; size--, data++) {
>     +                csum += *data;
>     +        }
>     +        return csum;
>     +}
>     +
>     +static void vm_add_char(unsigned char ch, unsigned char *c, unsigned int *pos)
>     +{
>     +    switch (ch) {
>     +    case VM_MSG_CHAR:
>     +    case VM_CMD_CHAR:
>     +    case VM_ESCAPE_CHAR:
>     +        c[(*pos)++] = VM_ESCAPE_CHAR;
>     +        c[(*pos)++] = ch | 0x10;
>     +        break;
>     +
>     +    default:
>     +        c[(*pos)++] = ch;
>     +    }
>     +}
>     +
>     +static void aspeed_ibt_dump_msg(const char *func, unsigned char *msg,
>     +                                unsigned int len)
>     +{
>     +    if (trace_event_get_state_backends(TRACE_ASPEED_IBT_CHR_DUMP_MSG)) {
>     +        int size = len * 3 + 1;
>     +        char tmp[size];
>     +        int i, n = 0;
>     +
>     +        for (i = 0; i < len; i++) {
>     +            n += snprintf(tmp + n, size - n, "%02x:", msg[i]);
>     +        }
>     +        tmp[size - 1] = 0;
>     +
>     +        trace_aspeed_ibt_chr_dump_msg(func, tmp, len);
>     +    }
>     +}
>     +
>     +static void aspeed_ibt_chr_write(AspeedIBTState *ibt, const uint8_t *buf,
>     +                                 int len)
>     +{
>     +    int i;
>     +
>     +    if (!qemu_chr_fe_get_driver(&ibt->chr)) {
>     +        return;
>     +    }
>     +
>     +    aspeed_ibt_dump_msg(__func__, ibt->recv_msg, ibt->recv_msg_len);
>     +
>     +    for (i = 0; i < len; i++) {
>     +        qemu_chr_fe_write(&ibt->chr, &buf[i], 1);
>     +    }
>     +}
>     +
>     +static void vm_send(AspeedIBTState *ibt)
>     +{
>     +    unsigned int i;
>     +    unsigned int len = 0;
>     +    unsigned char c[(ibt->send_msg_len + 7) * 2];
>     +    uint8_t netfn;
>     +
>     +    /*
>     +     * The VM IPMI message format does not follow the IPMI BT
>     +     * interface format. The sequence and the netfn bytes need to be
>     +     * swapped.
>     +     */
>     +    netfn = ibt->send_msg[1];
>     +    ibt->send_msg[1] = ibt->send_msg[2];
>     +    ibt->send_msg[2] = netfn;
>     +
>     +    /* No length byte in the VM IPMI message format. trim it */
>     +    for (i = 1; i < ibt->send_msg_len; i++) {
>     +        vm_add_char(ibt->send_msg[i], c, &len);
>     +    }
>     +
>     +    vm_add_char(-ipmb_checksum(&ibt->send_msg[1], ibt->send_msg_len - 1, 0),
>     +                c, &len);
>     +    c[len++] = VM_MSG_CHAR;
>     +
>     +    aspeed_ibt_chr_write(ibt, c, len);
>     +}
>     +
>     +static void aspeed_ibt_update_irq(AspeedIBTState *ibt)
>     +{
>     +    bool raise = false;
>     +
>     +    /* H2B rising */
>     +    if ((ibt->regs[TO_REG(BT_CTRL)] & BT_CTRL_H2B_ATN) &&
>     +        ((ibt->regs[TO_REG(BT_CR1)] & BT_CR1_IRQ_H2B) == BT_CR1_IRQ_H2B)) {
>     +        ibt->regs[TO_REG(BT_CR2)] |= BT_CR2_IRQ_H2B;
>     +
>     +        /*
>     +         * Also flag the fact that we are waiting for the guest/driver
>     +         * to read a received message
>     +         */
>     +        ibt->recv_waiting = true;
>     +        raise = true;
>     +    }
>     +
>     +    /* H_BUSY falling (not supported) */
>     +    if ((ibt->regs[TO_REG(BT_CTRL)] & BT_CTRL_H_BUSY) &&
>     +        ((ibt->regs[TO_REG(BT_CR1)] & BT_CR1_IRQ_HBUSY) == BT_CR1_IRQ_HBUSY)) {
>     +        ibt->regs[TO_REG(BT_CR2)] |= BT_CR2_IRQ_HBUSY;
>     +
>     +        raise = true;
>     +    }
>     +
>     +    if (raise) {
>     +        qemu_irq_raise(ibt->irq);
>     +    }
>     +}
>     +
>     +static void vm_handle_msg(AspeedIBTState *ibt, unsigned char *msg,
>     +                          unsigned int len)
>     +{
>     +    uint8_t seq;
>     +
>     +    aspeed_ibt_dump_msg(__func__, ibt->recv_msg, ibt->recv_msg_len);
>     +
>     +    if (len < 4) {
>     +        qemu_log_mask(LOG_GUEST_ERROR, " %s: Message too short\n", __func__);
>     +        return;
>     +    }
>     +
>     +    if (ipmb_checksum(ibt->recv_msg, ibt->recv_msg_len, 0) != 0) {
>     +        qemu_log_mask(LOG_GUEST_ERROR, " %s: Message checksum failure\n",
>     +                      __func__);
>     +        return;
>     +    }
>     +
>     +    /* Trim the checksum byte */
>     +    ibt->recv_msg_len--;
>     +
>     +    /*
>     +     * The VM IPMI message format does not follow the IPMI BT
>     +     * interface format. The sequence and the netfn bytes need to be
>     +     * swapped.
>     +     */
>     +    seq = ibt->recv_msg[0];
>     +    ibt->recv_msg[0] = ibt->recv_msg[1];
>     +    ibt->recv_msg[1] = seq;
>     +
>     +    aspeed_ibt_update_irq(ibt);
>     +}
>     +
>     +/* TODO: handle commands */
>     +static void vm_handle_cmd(AspeedIBTState *ibt, unsigned char *msg,
>     +                          unsigned int len)
>     +{
>     +    aspeed_ibt_dump_msg(__func__, ibt->recv_msg, ibt->recv_msg_len);
>     +
>     +    if (len < 1) {
>     +        qemu_log_mask(LOG_GUEST_ERROR, " %s: Command too short\n", __func__);
>     +        return;
>     +    }
>     +
>     +    switch (msg[0]) {
>     +    case VM_CMD_VERSION:
>     +        break;
>     +
>     +    case VM_CMD_CAPABILITIES:
>     +        if (len < 2) {
>     +            return;
>     +        }
>     +        break;
>     +
>     +    case VM_CMD_RESET:
>     +        break;
>     +    }
>     +}
>     +
>     +static void vm_handle_char(AspeedIBTState *ibt, unsigned char ch)
>     +{
>     +    unsigned int len = ibt->recv_msg_len;
>     +
>     +    switch (ch) {
>     +    case VM_MSG_CHAR:
>     +    case VM_CMD_CHAR:
>     +        if (ibt->in_escape) {
>     +            qemu_log_mask(LOG_GUEST_ERROR, " %s: Message ended in escape\n",
>     +                          __func__);
>     +        } else if (ibt->recv_msg_too_many) {
>     +            qemu_log_mask(LOG_GUEST_ERROR, " %s: Message too long\n", __func__);
>     +        } else if (ibt->recv_msg_len == 0) {
>     +            /* Nothing to do */
>     +        } else if (ch == VM_MSG_CHAR) {
>     +            /* Last byte of message. Signal BMC as the host would do */
>     +            ibt->regs[TO_REG(BT_CTRL)] |= BT_CTRL_H2B_ATN;
>     +
>     +            vm_handle_msg(ibt, ibt->recv_msg, ibt->recv_msg_len);
>     +
>     +            /* Message is only handled when read by BMC (!B_BUSY) */
>     +        } else if (ch == VM_CMD_CHAR) {
>     +            vm_handle_cmd(ibt, ibt->recv_msg, ibt->recv_msg_len);
>     +
>     +            /* Command is now handled. reset receive state */
>     +            ibt->in_escape = 0;
>     +            ibt->recv_msg_len = 0;
>     +            ibt->recv_msg_too_many = 0;
>     +        }
>     +        break;
>     +
>     +    case VM_ESCAPE_CHAR:
>     +        if (!ibt->recv_msg_too_many) {
>     +            ibt->in_escape = 1;
>     +        }
>     +        break;
>     +
>     +    default:
>     +        if (ibt->in_escape) {
>     +            ibt->in_escape = 0;
>     +            ch &= ~0x10;
>     +        }
>     +
>     +        if (!ibt->recv_msg_too_many) {
>     +            if (len >= sizeof(ibt->recv_msg)) {
>     +                ibt->recv_msg_too_many = 1;
>     +                break;
>     +            }
>     +
>     +            ibt->recv_msg[len] = ch;
>     +            ibt->recv_msg_len++;
>     +        }
>     +        break;
>     +    }
>     +}
>     +
>     +static void vm_connected(AspeedIBTState *ibt)
>     +{
>     +    unsigned int len = 0;
>     +    unsigned char c[5];
>     +
>     +    vm_add_char(VM_CMD_VERSION, c, &len);
>     +    vm_add_char(VM_PROTOCOL_VERSION, c, &len);
>     +    c[len++] = VM_CMD_CHAR;
>     +
>     +    aspeed_ibt_chr_write(ibt, c, len);
>     +}
>     +
>     +static void aspeed_ibt_chr_event(void *opaque, QEMUChrEvent event)
>     +{
>     +    AspeedIBTState *ibt = ASPEED_IBT(opaque);
>     +
>     +    switch (event) {
>     +    case CHR_EVENT_OPENED:
>     +        vm_connected(ibt);
>     +        ibt->connected = true;
>     +        break;
>     +
>     +    case CHR_EVENT_CLOSED:
>     +        if (!ibt->connected) {
>     +            return;
>     +        }
>     +        ibt->connected = false;
>     +        break;
>     +    case CHR_EVENT_BREAK:
>     +    case CHR_EVENT_MUX_IN:
>     +    case CHR_EVENT_MUX_OUT:
>     +        /* Ignore */
>     +        break;
>     +   }
>     +    trace_aspeed_ibt_chr_event(ibt->connected);
>     +}
>     +
>     +static int aspeed_ibt_chr_can_receive(void *opaque)
>     +{
>     +    AspeedIBTState *ibt = ASPEED_IBT(opaque);
>     +
>     +    return !ibt->recv_waiting && !(ibt->regs[TO_REG(BT_CTRL)] & BT_CTRL_B_BUSY);
>     +}
>     +
>     +static void aspeed_ibt_chr_receive(void *opaque, const uint8_t *buf,
>     +                                   int size)
>     +{
>     +    AspeedIBTState *ibt = ASPEED_IBT(opaque);
>     +    int i;
>     +
>     +    if (!ibt->connected) {
>     +        qemu_log_mask(LOG_GUEST_ERROR, " %s: not connected !?\n", __func__);
>     +        return;
>     +    }
>     +
>     +    for (i = 0; i < size; i++) {
>     +        vm_handle_char(ibt, buf[i]);
>     +    }
>     +}
>     +
>     +static void aspeed_ibt_write(void *opaque, hwaddr offset, uint64_t data,
>     +                             unsigned size)
>     +{
>     +    AspeedIBTState *ibt = ASPEED_IBT(opaque);
>     +
>     +    trace_aspeed_ibt_write(offset, data);
>     +
>     +    switch (offset) {
>     +    case BT_CTRL:
>     +        /* CLR_WR_PTR: cleared before a message is written */
>     +        if (data & BT_CTRL_CLR_WR_PTR) {
>     +            memset(ibt->send_msg, 0, sizeof(ibt->send_msg));
>     +            ibt->send_msg_len = 0;
>     +            trace_aspeed_ibt_event("CLR_WR_PTR");
>     +        }
>     +
>     +        /* CLR_RD_PTR: cleared before a message is read */
>     +        else if (data & BT_CTRL_CLR_RD_PTR) {
>     +            ibt->recv_msg_index = -1;
>     +            trace_aspeed_ibt_event("CLR_RD_PTR");
>     +        }
>     +
>     +        /*
>     +         * H2B_ATN: raised by host to end message, cleared by BMC
>     +         * before reading message
>     +         */
>     +        else if (data & BT_CTRL_H2B_ATN) {
>     +            ibt->regs[TO_REG(BT_CTRL)] &= ~BT_CTRL_H2B_ATN;
>     +            trace_aspeed_ibt_event("H2B_ATN");
>     +        }
>     +
>     +        /* B_BUSY: raised and cleared by BMC when message is read */
>     +        else if (data & BT_CTRL_B_BUSY) {
>     +            ibt->regs[TO_REG(BT_CTRL)] ^= BT_CTRL_B_BUSY;
>     +            trace_aspeed_ibt_event("B_BUSY");
>     +        }
>     +
>     +        /*
>     +         * B2H_ATN: raised by BMC and cleared by host
>     +         *
>     +         * Also simulate the host busy bit which is set while the host
>     +         * is reading the message from the BMC
>     +         */
>     +        else if (data & BT_CTRL_B2H_ATN) {
>     +            trace_aspeed_ibt_event("B2H_ATN");
>     +            ibt->regs[TO_REG(BT_CTRL)] |= (BT_CTRL_B2H_ATN | BT_CTRL_H_BUSY);
>     +
>     +            vm_send(ibt);
>     +
>     +            ibt->regs[TO_REG(BT_CTRL)] &= ~(BT_CTRL_B2H_ATN | BT_CTRL_H_BUSY);
>     +
>     +            /* signal H_BUSY falling but that's a bit useless */
>     +            aspeed_ibt_update_irq(ibt);
>     +        }
>     +
>     +        /* Anything else is unexpected */
>     +        else {
>     +            qemu_log_mask(LOG_GUEST_ERROR, "%s: unexpected CTRL setting\n",
>     +                          __func__);
>     +        }
>     +
>     +        /* Message was read by BMC. we can reset the receive state */
>     +        if (!(ibt->regs[TO_REG(BT_CTRL)] & BT_CTRL_B_BUSY)) {
>     +            trace_aspeed_ibt_event("B_BUSY cleared");
>     +            ibt->recv_waiting = false;
>     +            ibt->in_escape = 0;
>     +            ibt->recv_msg_len = 0;
>     +            ibt->recv_msg_too_many = 0;
>     +        }
>     +        break;
>     +
>     +    case BT_BMC2HOST:
>     +        if (ibt->send_msg_len < sizeof(ibt->send_msg)) {
>     +            trace_aspeed_ibt_event("BMC2HOST");
>     +            ibt->send_msg[ibt->send_msg_len++] = data & 0xff;
>     +        }
>     +        break;
>     +
>     +    case BT_CR0: /* TODO: iBT config */
>     +    case BT_CR1: /* interrupt enable */
>     +    case BT_CR3: /* unused */
>     +    case BT_INTMASK:
>     +        ibt->regs[TO_REG(offset)] = (uint32_t) data;
>     +        break;
>     +    case BT_CR2: /* interrupt status. writing 1 clears. */
>     +        ibt->regs[TO_REG(offset)] ^= (uint32_t) data;
>     +        qemu_irq_lower(ibt->irq);
>     +        break;
>     +
>     +    default:
>     +        qemu_log_mask(LOG_UNIMP, "%s: not implemented 0x%" HWADDR_PRIx "\n",
>     +                      __func__, offset);
>     +        break;
>     +    }
>     +}
>     +
>     +static uint64_t aspeed_ibt_read(void *opaque, hwaddr offset, unsigned size)
>     +{
>     +    AspeedIBTState *ibt = ASPEED_IBT(opaque);
>     +    uint64_t val = 0;
>     +
>     +    switch (offset) {
>     +    case BT_BMC2HOST:
>     +        trace_aspeed_ibt_event("BMC2HOST");
>     +        /*
>     +         * The IPMI BT interface requires the first byte to be the
>     +         * length of the message
>     +         */
>     +        if (ibt->recv_msg_index == -1) {
>     +            val = ibt->recv_msg_len;
>     +            ibt->recv_msg_index++;
>     +        } else if (ibt->recv_msg_index < ibt->recv_msg_len) {
>     +            val = ibt->recv_msg[ibt->recv_msg_index++];
>     +        }
>     +        break;
>     +
>     +    case BT_CR0:
>     +    case BT_CR1:
>     +    case BT_CR2:
>     +    case BT_CR3:
>     +    case BT_CTRL:
>     +    case BT_INTMASK:
>     +        return ibt->regs[TO_REG(offset)];
>     +    default:
>     +        qemu_log_mask(LOG_UNIMP, "%s: not implemented 0x%" HWADDR_PRIx "\n",
>     +                      __func__, offset);
>     +        return 0;
>     +    }
>     +
>     +    trace_aspeed_ibt_read(offset, val);
>     +    return val;
>     +}
>     +
>     +static const MemoryRegionOps aspeed_ibt_ops = {
>     +    .read = aspeed_ibt_read,
>     +    .write = aspeed_ibt_write,
>     +    .endianness = DEVICE_LITTLE_ENDIAN,
>     +    .valid = {
>     +        .min_access_size = 1,
>     +        .max_access_size = 4,
>     +    },
>     +};
>     +
>     +static void aspeed_ibt_reset(DeviceState *dev)
>     +{
>     +    AspeedIBTState *ibt = ASPEED_IBT(dev);
>     +
>     +    memset(ibt->regs, 0, sizeof(ibt->regs));
>     +
>     +    memset(ibt->recv_msg, 0, sizeof(ibt->recv_msg));
>     +    ibt->recv_msg_len = 0;
>     +    ibt->recv_msg_index = -1;
>     +    ibt->recv_msg_too_many = 0;
>     +    ibt->recv_waiting = false;
>     +    ibt->in_escape = 0;
>     +
>     +    memset(ibt->send_msg, 0, sizeof(ibt->send_msg));
>     +    ibt->send_msg_len = 0;
>     +}
>     +
>     +static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
>     +{
>     +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>     +    AspeedIBTState *ibt = ASPEED_IBT(dev);
>     +
>     +    if (!qemu_chr_fe_get_driver(&ibt->chr) && !qtest_enabled()) {
>     +        warn_report("Aspeed iBT has no chardev backend");
>     +    } else {
>     +        qemu_chr_fe_set_handlers(&ibt->chr, aspeed_ibt_chr_can_receive,
>     +                                 aspeed_ibt_chr_receive, aspeed_ibt_chr_event,
>     +                                 NULL, ibt, NULL, true);
>     +    }
>     +
>     +    sysbus_init_irq(sbd, &ibt->irq);
>     +    memory_region_init_io(&ibt->iomem, OBJECT(ibt), &aspeed_ibt_ops, ibt,
>     +                          TYPE_ASPEED_IBT, BT_IO_REGION_SIZE);
>     +
>     +    sysbus_init_mmio(sbd, &ibt->iomem);
>     +}
>     +
>     +static Property aspeed_ibt_props[] = {
>     +    DEFINE_PROP_CHR("chardev", AspeedIBTState, chr),
>     +    DEFINE_PROP_END_OF_LIST(),
>     +};
>     +
>     +static const VMStateDescription vmstate_aspeed_ibt = {
>     +    .name = "aspeed.bt <http://aspeed.bt>",
>     +    .version_id = 1,
>     +    .minimum_version_id = 1,
>     +    .fields = (VMStateField[]) {
>     +        VMSTATE_UINT32_ARRAY(regs, AspeedIBTState, ASPEED_IBT_NR_REGS),
>     +        VMSTATE_END_OF_LIST()
>     +    }
>     +};
>     +
>     +static void aspeed_ibt_class_init(ObjectClass *klass, void *data)
>     +{
>     +    DeviceClass *dc = DEVICE_CLASS(klass);
>     +    dc->realize = aspeed_ibt_realize;
>     +    dc->reset = aspeed_ibt_reset;
>     +    dc->desc = "ASPEED iBT Device";
>     +    dc->vmsd = &vmstate_aspeed_ibt;
>     +    device_class_set_props(dc, aspeed_ibt_props);
>     +}
>     +
>     +static const TypeInfo aspeed_ibt_info = {
>     +    .name = TYPE_ASPEED_IBT,
>     +    .parent = TYPE_SYS_BUS_DEVICE,
>     +    .instance_size = sizeof(AspeedIBTState),
>     +    .class_init = aspeed_ibt_class_init,
>     +};
>     +
>     +static void aspeed_ibt_register_types(void)
>     +{
>     +    type_register_static(&aspeed_ibt_info);
>     +}
>     +
>     +type_init(aspeed_ibt_register_types);
>     diff --git a/hw/misc/meson.build b/hw/misc/meson.build
>     index 1deef25764da..30cb61ec0e31 100644
>     --- a/hw/misc/meson.build
>     +++ b/hw/misc/meson.build
>     @@ -111,6 +111,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
>      softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
>      softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>        'aspeed_hace.c',
>     +  'aspeed_ibt.c',
>        'aspeed_lpc.c',
>        'aspeed_scu.c',
>        'aspeed_sdmc.c',
>     diff --git a/hw/misc/trace-events b/hw/misc/trace-events
>     index d0a89eb05964..e8fcacdfd9e9 100644
>     --- a/hw/misc/trace-events
>     +++ b/hw/misc/trace-events
>     @@ -19,6 +19,13 @@ allwinner_h3_dramphy_write(uint64_t offset, uint64_t data, unsigned size) "write
>      allwinner_sid_read(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
>      allwinner_sid_write(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> 
>     +# aspeed_ibt.c
>     +aspeed_ibt_chr_dump_msg(const char *func, const char *buf, uint32_t len) "%s: %s #%d bytes"
>     +aspeed_ibt_chr_event(bool connected) "connected:%d"
>     +aspeed_ibt_read(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " value:0x%" PRIx64
>     +aspeed_ibt_write(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " value:0x%" PRIx64
>     +aspeed_ibt_event(const char* event) "%s"
>     +
>      # avr_power.c
>      avr_power_read(uint8_t value) "power_reduc read value:%u"
>      avr_power_write(uint8_t value) "power_reduc write value:%u"
>     -- 
>     2.26.3
> 
> 


