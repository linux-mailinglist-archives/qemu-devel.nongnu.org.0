Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C03545B3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 18:56:13 +0200 (CEST)
Received: from localhost ([::1]:41946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTSWJ-0004NC-Tg
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 12:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1lTSUa-0003uU-6y
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 12:54:24 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:41616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1lTSUV-000159-9Z
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 12:54:23 -0400
Received: by mail-lj1-x235.google.com with SMTP id c6so11854751lji.8
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zNzQEyMrqcSFlf1/I6cujROG6L3KVZno4nkFwWS14XA=;
 b=mlmElVmOA0h5/YxWaL09dxTu3Dtoe2XZiVT4a86INpa+MN44dulX5kKNAY0kOqmHfG
 zZkUtEasU8F+632shn9qnrjS0jfJzZ9QG9FGNto84U3r/jdv7mrPoSXLISJFXmVaOSJi
 sOUj6t0kYb9BeSljau6AKAtHELfqE0GTGZq6qGwpe/lbvTFJwIztm9nqo4SHBASa+/sW
 WhvPdvz/CdZahuHF9J3AyqlJmTjfwGhQOuye8UeqP/W0TrlKFTLYIUEQY+5FBw06Yrfv
 V7MgGsnjkx3XKQj0y8fFNnJhe+Mb1AdzEGsUOM4wMu3Q7gcy/hq5aaSX5i1QEWwxKE9h
 rerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zNzQEyMrqcSFlf1/I6cujROG6L3KVZno4nkFwWS14XA=;
 b=sSB2wtcnLuRKL0xuVs7kY5785/Z4C//NO1JLLVH0+6/cDxaZXH4LwtW5bYfO2ytpg1
 3EWX6rsi35rUxTxZOgwgXrX61yDKcST09ephUysib/9qAXGRKdzrxuraXMktGh4gdJeE
 QZS2Ok0GZt5ry2cZeqI4RnVcM8Btt2/lsi2Nalltul4eITBKPIqWsJkKaYLzHALJ8Z5k
 sg5eKAVeb2kttv4pKI62QO5Mp+OGvdgcXtwZm5hIvEBabe812huvNJXg20jiKs7vtPQl
 D3RFYPffw/wHYjyGQdrKw2Jt3b4U4KwuAD0409YdPsGie21hl5A/zehASnYARnRvxd0m
 zxuQ==
X-Gm-Message-State: AOAM533ylQCnNIOZiIr4gdrte24uvz0rJviI8cHeHLF/rVxMZHMmptdg
 cmjjXdNvg0TDbMSn2Ne3T/grY7y5itS1OdsTzxqNAA==
X-Google-Smtp-Source: ABdhPJxH7Cm5+cVFAzWYU7g0F/jFkbtqDV4hih1ff6TZ4kdBqUr8DXXi9GNjLQZztmobCliL4b1qN4FCFX2vynDs95g=
X-Received: by 2002:a05:651c:1a3:: with SMTP id
 c3mr16271966ljn.77.1617641655540; 
 Mon, 05 Apr 2021 09:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210329121912.271900-1-clg@kaod.org>
In-Reply-To: <20210329121912.271900-1-clg@kaod.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 5 Apr 2021 09:54:02 -0700
Message-ID: <CAGcCb1024NgHXM2ziURJFeAVv5o3P8V2221L_ps6hRaAbCs23A@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: Add an iBT device model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, 
 Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="000000000000410c4d05bf3c8caf"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000410c4d05bf3c8caf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Cedric and Corey

When I'm implementing KCS device for nuvoton BMC boards, one of the
feedback Corey gave me was to refactor the existing device like
ipmi-bmc-extern so that we can reuse some of the common stuff there. I'm in
the process of doing that. I'll probably send that as an RFC first to see
how you think about that.

On Mon, Mar 29, 2021 at 5:19 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Implement an IPMI BT interface model using a chardev backend to
> communicate with an external PowerNV machine. It uses the OpenIPMI
> simulator protocol for virtual machines described in :
>
>     https://github.com/cminyard/openipmi/blob/master/lanserv/README.vm
>
> and implemented by the 'ipmi-bmc-extern' model on the host side.
>
> To use, start the Aspeed BMC machine with :
>
>     -chardev socket,id=3Dipmi0,host=3Dlocalhost,port=3D9002,ipv4,server,n=
owait \
>     -global driver=3Daspeed.ibt,property=3Dchardev,value=3Dipmi0
>
> and the PowerNV machine with :
>
>     -chardev socket,id=3Dipmi0,host=3Dlocalhost,port=3D9002,reconnect=3D1=
0 \
>     -device ipmi-bmc-extern,id=3Dbmc0,chardev=3Dipmi0 \
>     -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 -nodefaults
>
> Cc: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/arm/aspeed_soc.h  |   2 +
>  include/hw/misc/aspeed_ibt.h |  47 +++
>  hw/arm/aspeed_ast2600.c      |  12 +
>  hw/arm/aspeed_soc.c          |  12 +
>  hw/misc/aspeed_ibt.c         | 596 +++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build          |   1 +
>  hw/misc/trace-events         |   7 +
>  7 files changed, 677 insertions(+)
>  create mode 100644 include/hw/misc/aspeed_ibt.h
>  create mode 100644 hw/misc/aspeed_ibt.c
>
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index d9161d26d645..f0c36b8f7d35 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -30,6 +30,7 @@
>  #include "hw/usb/hcd-ehci.h"
>  #include "qom/object.h"
>  #include "hw/misc/aspeed_lpc.h"
> +#include "hw/misc/aspeed_ibt.h"
>
>  #define ASPEED_SPIS_NUM  2
>  #define ASPEED_EHCIS_NUM 2
> @@ -65,6 +66,7 @@ struct AspeedSoCState {
>      AspeedSDHCIState sdhci;
>      AspeedSDHCIState emmc;
>      AspeedLPCState lpc;
> +    AspeedIBTState ibt;
>  };
>
>  #define TYPE_ASPEED_SOC "aspeed-soc"
> diff --git a/include/hw/misc/aspeed_ibt.h b/include/hw/misc/aspeed_ibt.h
> new file mode 100644
> index 000000000000..a02a57df9ff8
> --- /dev/null
> +++ b/include/hw/misc/aspeed_ibt.h
> @@ -0,0 +1,47 @@
> +/*
> + * ASPEED iBT Device
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +#ifndef ASPEED_IBT_H
> +#define ASPEED_IBT_H
> +
> +#include "hw/sysbus.h"
> +#include "chardev/char-fe.h"
> +
> +#define TYPE_ASPEED_IBT "aspeed.ibt"
> +#define ASPEED_IBT(obj) OBJECT_CHECK(AspeedIBTState, (obj),
> TYPE_ASPEED_IBT)
> +
> +#define ASPEED_IBT_NR_REGS (0x1C >> 2)
> +
> +#define ASPEED_IBT_BUFFER_SIZE 64
> +
> +typedef struct AspeedIBTState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    CharBackend chr;
> +    bool connected;
> +
> +    uint8_t recv_msg[ASPEED_IBT_BUFFER_SIZE];
> +    uint8_t recv_msg_len;
> +    int recv_msg_index;
> +    int recv_msg_too_many;
> +    bool recv_waiting;
> +    int in_escape;
> +
> +    uint8_t send_msg[ASPEED_IBT_BUFFER_SIZE];
> +    uint8_t send_msg_len;
> +
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +
> +    uint32_t regs[ASPEED_IBT_NR_REGS];
> +
> +} AspeedIBTState;
> +
> +#endif /* ASPEED_IBT_H */
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index fc81c0d8df06..c30d0f320c2a 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -219,6 +219,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
>
>      snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
>      object_initialize_child(obj, "hace", &s->hace, typename);
> +
> +    object_initialize_child(obj, "ibt", &s->ibt, TYPE_ASPEED_IBT);
>  }
>
>  /*
> @@ -510,6 +512,16 @@ static void aspeed_soc_ast2600_realize(DeviceState
> *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0,
> sc->memmap[ASPEED_DEV_HACE]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                         aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> +
> +    /* iBT */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(&s->lpc.iomem,
> +                   sc->memmap[ASPEED_DEV_IBT] -
> sc->memmap[ASPEED_DEV_LPC],
> +                   &s->ibt.iomem);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ibt), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_IBT));
>  }
>
>  static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 4a95d27d9d63..5ab4cefc7e8b 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -219,6 +219,8 @@ static void aspeed_soc_init(Object *obj)
>
>      snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
>      object_initialize_child(obj, "hace", &s->hace, typename);
> +
> +    object_initialize_child(obj, "ibt", &s->ibt, TYPE_ASPEED_IBT);
>  }
>
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -438,6 +440,16 @@ static void aspeed_soc_realize(DeviceState *dev,
> Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0,
> sc->memmap[ASPEED_DEV_HACE]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                         aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> +
> +    /* iBT */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(&s->lpc.iomem,
> +                   sc->memmap[ASPEED_DEV_IBT] -
> sc->memmap[ASPEED_DEV_LPC],
> +                   &s->ibt.iomem);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_ibt,
> +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_ibt)=
);
>  }
>  static Property aspeed_soc_properties[] =3D {
>      DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION=
,
> diff --git a/hw/misc/aspeed_ibt.c b/hw/misc/aspeed_ibt.c
> new file mode 100644
> index 000000000000..69a2096ccb00
> --- /dev/null
> +++ b/hw/misc/aspeed_ibt.c
> @@ -0,0 +1,596 @@
> +/*
> + * ASPEED iBT Device
> + *
> + * Copyright (c) 2016-2021 C=C3=A9dric Le Goater, IBM Corporation.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "sysemu/qtest.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "migration/vmstate.h"
> +#include "hw/misc/aspeed_ibt.h"
> +#include "trace.h"
> +
> +#define BT_IO_REGION_SIZE 0x1C
> +
> +#define TO_REG(o) (o >> 2)
> +
> +#define BT_CR0                0x0   /* iBT config */
> +#define   BT_CR0_IO_BASE         16
> +#define   BT_CR0_IRQ             12
> +#define   BT_CR0_EN_CLR_SLV_RDP  0x8
> +#define   BT_CR0_EN_CLR_SLV_WRP  0x4
> +#define   BT_CR0_ENABLE_IBT      0x1
> +#define BT_CR1                0x4  /* interrupt enable */
> +#define   BT_CR1_IRQ_H2B         0x01
> +#define   BT_CR1_IRQ_HBUSY       0x40
> +#define BT_CR2                0x8  /* interrupt status */
> +#define   BT_CR2_IRQ_H2B         0x01
> +#define   BT_CR2_IRQ_HBUSY       0x40
> +#define BT_CR3                0xc /* unused */
> +#define BT_CTRL                  0x10
> +#define   BT_CTRL_B_BUSY         0x80
> +#define   BT_CTRL_H_BUSY         0x40
> +#define   BT_CTRL_OEM0           0x20
> +#define   BT_CTRL_SMS_ATN        0x10
> +#define   BT_CTRL_B2H_ATN        0x08
> +#define   BT_CTRL_H2B_ATN        0x04
> +#define   BT_CTRL_CLR_RD_PTR     0x02
> +#define   BT_CTRL_CLR_WR_PTR     0x01
> +#define BT_BMC2HOST            0x14
> +#define BT_INTMASK             0x18
> +#define   BT_INTMASK_B2H_IRQEN   0x01
> +#define   BT_INTMASK_B2H_IRQ     0x02
> +#define   BT_INTMASK_BMC_HWRST   0x80
> +
> +/*
> + * VM IPMI defines
> + */
> +#define VM_MSG_CHAR        0xA0 /* Marks end of message */
> +#define VM_CMD_CHAR        0xA1 /* Marks end of a command */
> +#define VM_ESCAPE_CHAR     0xAA /* Set bit 4 from the next byte to 0 */
> +
> +#define VM_PROTOCOL_VERSION        1
> +#define VM_CMD_VERSION             0xff /* A version number byte follows
> */
> +#define VM_CMD_NOATTN              0x00
> +#define VM_CMD_ATTN                0x01
> +#define VM_CMD_ATTN_IRQ            0x02
> +#define VM_CMD_POWEROFF            0x03
> +#define VM_CMD_RESET               0x04
> +#define VM_CMD_ENABLE_IRQ          0x05 /* Enable/disable the messaging
> irq */
> +#define VM_CMD_DISABLE_IRQ         0x06
> +#define VM_CMD_SEND_NMI            0x07
> +#define VM_CMD_CAPABILITIES        0x08
> +#define   VM_CAPABILITIES_POWER    0x01
> +#define   VM_CAPABILITIES_RESET    0x02
> +#define   VM_CAPABILITIES_IRQ      0x04
> +#define   VM_CAPABILITIES_NMI      0x08
> +#define   VM_CAPABILITIES_ATTN     0x10
> +#define   VM_CAPABILITIES_GRACEFUL_SHUTDOWN 0x20
> +#define VM_CMD_GRACEFUL_SHUTDOWN   0x09
> +
> +/*
> + * These routines are inspired by the 'ipmi-bmc-extern' model and by
> + * the lanserv simulator of OpenIPMI. See :
> + *
> https://github.com/cminyard/openipmi/blob/master/lanserv/serial_ipmi.c
> + */
> +static unsigned char ipmb_checksum(const unsigned char *data, int size,
> +                                   unsigned char start)
> +{
> +        unsigned char csum =3D start;
> +
> +        for (; size > 0; size--, data++) {
> +                csum +=3D *data;
> +        }
> +        return csum;
> +}
> +
> +static void vm_add_char(unsigned char ch, unsigned char *c, unsigned int
> *pos)
> +{
> +    switch (ch) {
> +    case VM_MSG_CHAR:
> +    case VM_CMD_CHAR:
> +    case VM_ESCAPE_CHAR:
> +        c[(*pos)++] =3D VM_ESCAPE_CHAR;
> +        c[(*pos)++] =3D ch | 0x10;
> +        break;
> +
> +    default:
> +        c[(*pos)++] =3D ch;
> +    }
> +}
> +
> +static void aspeed_ibt_dump_msg(const char *func, unsigned char *msg,
> +                                unsigned int len)
> +{
> +    if (trace_event_get_state_backends(TRACE_ASPEED_IBT_CHR_DUMP_MSG)) {
> +        int size =3D len * 3 + 1;
> +        char tmp[size];
> +        int i, n =3D 0;
> +
> +        for (i =3D 0; i < len; i++) {
> +            n +=3D snprintf(tmp + n, size - n, "%02x:", msg[i]);
> +        }
> +        tmp[size - 1] =3D 0;
> +
> +        trace_aspeed_ibt_chr_dump_msg(func, tmp, len);
> +    }
> +}
> +
> +static void aspeed_ibt_chr_write(AspeedIBTState *ibt, const uint8_t *buf=
,
> +                                 int len)
> +{
> +    int i;
> +
> +    if (!qemu_chr_fe_get_driver(&ibt->chr)) {
> +        return;
> +    }
> +
> +    aspeed_ibt_dump_msg(__func__, ibt->recv_msg, ibt->recv_msg_len);
> +
> +    for (i =3D 0; i < len; i++) {
> +        qemu_chr_fe_write(&ibt->chr, &buf[i], 1);
> +    }
> +}
> +
> +static void vm_send(AspeedIBTState *ibt)
> +{
> +    unsigned int i;
> +    unsigned int len =3D 0;
> +    unsigned char c[(ibt->send_msg_len + 7) * 2];
> +    uint8_t netfn;
> +
> +    /*
> +     * The VM IPMI message format does not follow the IPMI BT
> +     * interface format. The sequence and the netfn bytes need to be
> +     * swapped.
> +     */
> +    netfn =3D ibt->send_msg[1];
> +    ibt->send_msg[1] =3D ibt->send_msg[2];
> +    ibt->send_msg[2] =3D netfn;
> +
> +    /* No length byte in the VM IPMI message format. trim it */
> +    for (i =3D 1; i < ibt->send_msg_len; i++) {
> +        vm_add_char(ibt->send_msg[i], c, &len);
> +    }
> +
> +    vm_add_char(-ipmb_checksum(&ibt->send_msg[1], ibt->send_msg_len - 1,
> 0),
> +                c, &len);
> +    c[len++] =3D VM_MSG_CHAR;
> +
> +    aspeed_ibt_chr_write(ibt, c, len);
> +}
> +
> +static void aspeed_ibt_update_irq(AspeedIBTState *ibt)
> +{
> +    bool raise =3D false;
> +
> +    /* H2B rising */
> +    if ((ibt->regs[TO_REG(BT_CTRL)] & BT_CTRL_H2B_ATN) &&
> +        ((ibt->regs[TO_REG(BT_CR1)] & BT_CR1_IRQ_H2B) =3D=3D BT_CR1_IRQ_=
H2B))
> {
> +        ibt->regs[TO_REG(BT_CR2)] |=3D BT_CR2_IRQ_H2B;
> +
> +        /*
> +         * Also flag the fact that we are waiting for the guest/driver
> +         * to read a received message
> +         */
> +        ibt->recv_waiting =3D true;
> +        raise =3D true;
> +    }
> +
> +    /* H_BUSY falling (not supported) */
> +    if ((ibt->regs[TO_REG(BT_CTRL)] & BT_CTRL_H_BUSY) &&
> +        ((ibt->regs[TO_REG(BT_CR1)] & BT_CR1_IRQ_HBUSY) =3D=3D
> BT_CR1_IRQ_HBUSY)) {
> +        ibt->regs[TO_REG(BT_CR2)] |=3D BT_CR2_IRQ_HBUSY;
> +
> +        raise =3D true;
> +    }
> +
> +    if (raise) {
> +        qemu_irq_raise(ibt->irq);
> +    }
> +}
> +
> +static void vm_handle_msg(AspeedIBTState *ibt, unsigned char *msg,
> +                          unsigned int len)
> +{
> +    uint8_t seq;
> +
> +    aspeed_ibt_dump_msg(__func__, ibt->recv_msg, ibt->recv_msg_len);
> +
> +    if (len < 4) {
> +        qemu_log_mask(LOG_GUEST_ERROR, " %s: Message too short\n",
> __func__);
> +        return;
> +    }
> +
> +    if (ipmb_checksum(ibt->recv_msg, ibt->recv_msg_len, 0) !=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, " %s: Message checksum failure\n"=
,
> +                      __func__);
> +        return;
> +    }
> +
> +    /* Trim the checksum byte */
> +    ibt->recv_msg_len--;
> +
> +    /*
> +     * The VM IPMI message format does not follow the IPMI BT
> +     * interface format. The sequence and the netfn bytes need to be
> +     * swapped.
> +     */
> +    seq =3D ibt->recv_msg[0];
> +    ibt->recv_msg[0] =3D ibt->recv_msg[1];
> +    ibt->recv_msg[1] =3D seq;
> +
> +    aspeed_ibt_update_irq(ibt);
> +}
> +
> +/* TODO: handle commands */
> +static void vm_handle_cmd(AspeedIBTState *ibt, unsigned char *msg,
> +                          unsigned int len)
> +{
> +    aspeed_ibt_dump_msg(__func__, ibt->recv_msg, ibt->recv_msg_len);
> +
> +    if (len < 1) {
> +        qemu_log_mask(LOG_GUEST_ERROR, " %s: Command too short\n",
> __func__);
> +        return;
> +    }
> +
> +    switch (msg[0]) {
> +    case VM_CMD_VERSION:
> +        break;
> +
> +    case VM_CMD_CAPABILITIES:
> +        if (len < 2) {
> +            return;
> +        }
> +        break;
> +
> +    case VM_CMD_RESET:
> +        break;
> +    }
> +}
> +
> +static void vm_handle_char(AspeedIBTState *ibt, unsigned char ch)
> +{
> +    unsigned int len =3D ibt->recv_msg_len;
> +
> +    switch (ch) {
> +    case VM_MSG_CHAR:
> +    case VM_CMD_CHAR:
> +        if (ibt->in_escape) {
> +            qemu_log_mask(LOG_GUEST_ERROR, " %s: Message ended in
> escape\n",
> +                          __func__);
> +        } else if (ibt->recv_msg_too_many) {
> +            qemu_log_mask(LOG_GUEST_ERROR, " %s: Message too long\n",
> __func__);
> +        } else if (ibt->recv_msg_len =3D=3D 0) {
> +            /* Nothing to do */
> +        } else if (ch =3D=3D VM_MSG_CHAR) {
> +            /* Last byte of message. Signal BMC as the host would do */
> +            ibt->regs[TO_REG(BT_CTRL)] |=3D BT_CTRL_H2B_ATN;
> +
> +            vm_handle_msg(ibt, ibt->recv_msg, ibt->recv_msg_len);
> +
> +            /* Message is only handled when read by BMC (!B_BUSY) */
> +        } else if (ch =3D=3D VM_CMD_CHAR) {
> +            vm_handle_cmd(ibt, ibt->recv_msg, ibt->recv_msg_len);
> +
> +            /* Command is now handled. reset receive state */
> +            ibt->in_escape =3D 0;
> +            ibt->recv_msg_len =3D 0;
> +            ibt->recv_msg_too_many =3D 0;
> +        }
> +        break;
> +
> +    case VM_ESCAPE_CHAR:
> +        if (!ibt->recv_msg_too_many) {
> +            ibt->in_escape =3D 1;
> +        }
> +        break;
> +
> +    default:
> +        if (ibt->in_escape) {
> +            ibt->in_escape =3D 0;
> +            ch &=3D ~0x10;
> +        }
> +
> +        if (!ibt->recv_msg_too_many) {
> +            if (len >=3D sizeof(ibt->recv_msg)) {
> +                ibt->recv_msg_too_many =3D 1;
> +                break;
> +            }
> +
> +            ibt->recv_msg[len] =3D ch;
> +            ibt->recv_msg_len++;
> +        }
> +        break;
> +    }
> +}
> +
> +static void vm_connected(AspeedIBTState *ibt)
> +{
> +    unsigned int len =3D 0;
> +    unsigned char c[5];
> +
> +    vm_add_char(VM_CMD_VERSION, c, &len);
> +    vm_add_char(VM_PROTOCOL_VERSION, c, &len);
> +    c[len++] =3D VM_CMD_CHAR;
> +
> +    aspeed_ibt_chr_write(ibt, c, len);
> +}
> +
> +static void aspeed_ibt_chr_event(void *opaque, QEMUChrEvent event)
> +{
> +    AspeedIBTState *ibt =3D ASPEED_IBT(opaque);
> +
> +    switch (event) {
> +    case CHR_EVENT_OPENED:
> +        vm_connected(ibt);
> +        ibt->connected =3D true;
> +        break;
> +
> +    case CHR_EVENT_CLOSED:
> +        if (!ibt->connected) {
> +            return;
> +        }
> +        ibt->connected =3D false;
> +        break;
> +    case CHR_EVENT_BREAK:
> +    case CHR_EVENT_MUX_IN:
> +    case CHR_EVENT_MUX_OUT:
> +        /* Ignore */
> +        break;
> +   }
> +    trace_aspeed_ibt_chr_event(ibt->connected);
> +}
> +
> +static int aspeed_ibt_chr_can_receive(void *opaque)
> +{
> +    AspeedIBTState *ibt =3D ASPEED_IBT(opaque);
> +
> +    return !ibt->recv_waiting && !(ibt->regs[TO_REG(BT_CTRL)] &
> BT_CTRL_B_BUSY);
> +}
> +
> +static void aspeed_ibt_chr_receive(void *opaque, const uint8_t *buf,
> +                                   int size)
> +{
> +    AspeedIBTState *ibt =3D ASPEED_IBT(opaque);
> +    int i;
> +
> +    if (!ibt->connected) {
> +        qemu_log_mask(LOG_GUEST_ERROR, " %s: not connected !?\n",
> __func__);
> +        return;
> +    }
> +
> +    for (i =3D 0; i < size; i++) {
> +        vm_handle_char(ibt, buf[i]);
> +    }
> +}
> +
> +static void aspeed_ibt_write(void *opaque, hwaddr offset, uint64_t data,
> +                             unsigned size)
> +{
> +    AspeedIBTState *ibt =3D ASPEED_IBT(opaque);
> +
> +    trace_aspeed_ibt_write(offset, data);
> +
> +    switch (offset) {
> +    case BT_CTRL:
> +        /* CLR_WR_PTR: cleared before a message is written */
> +        if (data & BT_CTRL_CLR_WR_PTR) {
> +            memset(ibt->send_msg, 0, sizeof(ibt->send_msg));
> +            ibt->send_msg_len =3D 0;
> +            trace_aspeed_ibt_event("CLR_WR_PTR");
> +        }
> +
> +        /* CLR_RD_PTR: cleared before a message is read */
> +        else if (data & BT_CTRL_CLR_RD_PTR) {
> +            ibt->recv_msg_index =3D -1;
> +            trace_aspeed_ibt_event("CLR_RD_PTR");
> +        }
> +
> +        /*
> +         * H2B_ATN: raised by host to end message, cleared by BMC
> +         * before reading message
> +         */
> +        else if (data & BT_CTRL_H2B_ATN) {
> +            ibt->regs[TO_REG(BT_CTRL)] &=3D ~BT_CTRL_H2B_ATN;
> +            trace_aspeed_ibt_event("H2B_ATN");
> +        }
> +
> +        /* B_BUSY: raised and cleared by BMC when message is read */
> +        else if (data & BT_CTRL_B_BUSY) {
> +            ibt->regs[TO_REG(BT_CTRL)] ^=3D BT_CTRL_B_BUSY;
> +            trace_aspeed_ibt_event("B_BUSY");
> +        }
> +
> +        /*
> +         * B2H_ATN: raised by BMC and cleared by host
> +         *
> +         * Also simulate the host busy bit which is set while the host
> +         * is reading the message from the BMC
> +         */
> +        else if (data & BT_CTRL_B2H_ATN) {
> +            trace_aspeed_ibt_event("B2H_ATN");
> +            ibt->regs[TO_REG(BT_CTRL)] |=3D (BT_CTRL_B2H_ATN |
> BT_CTRL_H_BUSY);
> +
> +            vm_send(ibt);
> +
> +            ibt->regs[TO_REG(BT_CTRL)] &=3D ~(BT_CTRL_B2H_ATN |
> BT_CTRL_H_BUSY);
> +
> +            /* signal H_BUSY falling but that's a bit useless */
> +            aspeed_ibt_update_irq(ibt);
> +        }
> +
> +        /* Anything else is unexpected */
> +        else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: unexpected CTRL
> setting\n",
> +                          __func__);
> +        }
> +
> +        /* Message was read by BMC. we can reset the receive state */
> +        if (!(ibt->regs[TO_REG(BT_CTRL)] & BT_CTRL_B_BUSY)) {
> +            trace_aspeed_ibt_event("B_BUSY cleared");
> +            ibt->recv_waiting =3D false;
> +            ibt->in_escape =3D 0;
> +            ibt->recv_msg_len =3D 0;
> +            ibt->recv_msg_too_many =3D 0;
> +        }
> +        break;
> +
> +    case BT_BMC2HOST:
> +        if (ibt->send_msg_len < sizeof(ibt->send_msg)) {
> +            trace_aspeed_ibt_event("BMC2HOST");
> +            ibt->send_msg[ibt->send_msg_len++] =3D data & 0xff;
> +        }
> +        break;
> +
> +    case BT_CR0: /* TODO: iBT config */
> +    case BT_CR1: /* interrupt enable */
> +    case BT_CR3: /* unused */
> +    case BT_INTMASK:
> +        ibt->regs[TO_REG(offset)] =3D (uint32_t) data;
> +        break;
> +    case BT_CR2: /* interrupt status. writing 1 clears. */
> +        ibt->regs[TO_REG(offset)] ^=3D (uint32_t) data;
> +        qemu_irq_lower(ibt->irq);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: not implemented 0x%" HWADDR_PRIx
> "\n",
> +                      __func__, offset);
> +        break;
> +    }
> +}
> +
> +static uint64_t aspeed_ibt_read(void *opaque, hwaddr offset, unsigned
> size)
> +{
> +    AspeedIBTState *ibt =3D ASPEED_IBT(opaque);
> +    uint64_t val =3D 0;
> +
> +    switch (offset) {
> +    case BT_BMC2HOST:
> +        trace_aspeed_ibt_event("BMC2HOST");
> +        /*
> +         * The IPMI BT interface requires the first byte to be the
> +         * length of the message
> +         */
> +        if (ibt->recv_msg_index =3D=3D -1) {
> +            val =3D ibt->recv_msg_len;
> +            ibt->recv_msg_index++;
> +        } else if (ibt->recv_msg_index < ibt->recv_msg_len) {
> +            val =3D ibt->recv_msg[ibt->recv_msg_index++];
> +        }
> +        break;
> +
> +    case BT_CR0:
> +    case BT_CR1:
> +    case BT_CR2:
> +    case BT_CR3:
> +    case BT_CTRL:
> +    case BT_INTMASK:
> +        return ibt->regs[TO_REG(offset)];
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: not implemented 0x%" HWADDR_PRIx
> "\n",
> +                      __func__, offset);
> +        return 0;
> +    }
> +
> +    trace_aspeed_ibt_read(offset, val);
> +    return val;
> +}
> +
> +static const MemoryRegionOps aspeed_ibt_ops =3D {
> +    .read =3D aspeed_ibt_read,
> +    .write =3D aspeed_ibt_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 1,
> +        .max_access_size =3D 4,
> +    },
> +};
> +
> +static void aspeed_ibt_reset(DeviceState *dev)
> +{
> +    AspeedIBTState *ibt =3D ASPEED_IBT(dev);
> +
> +    memset(ibt->regs, 0, sizeof(ibt->regs));
> +
> +    memset(ibt->recv_msg, 0, sizeof(ibt->recv_msg));
> +    ibt->recv_msg_len =3D 0;
> +    ibt->recv_msg_index =3D -1;
> +    ibt->recv_msg_too_many =3D 0;
> +    ibt->recv_waiting =3D false;
> +    ibt->in_escape =3D 0;
> +
> +    memset(ibt->send_msg, 0, sizeof(ibt->send_msg));
> +    ibt->send_msg_len =3D 0;
> +}
> +
> +static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> +    AspeedIBTState *ibt =3D ASPEED_IBT(dev);
> +
> +    if (!qemu_chr_fe_get_driver(&ibt->chr) && !qtest_enabled()) {
> +        warn_report("Aspeed iBT has no chardev backend");
> +    } else {
> +        qemu_chr_fe_set_handlers(&ibt->chr, aspeed_ibt_chr_can_receive,
> +                                 aspeed_ibt_chr_receive,
> aspeed_ibt_chr_event,
> +                                 NULL, ibt, NULL, true);
> +    }
> +
> +    sysbus_init_irq(sbd, &ibt->irq);
> +    memory_region_init_io(&ibt->iomem, OBJECT(ibt), &aspeed_ibt_ops, ibt=
,
> +                          TYPE_ASPEED_IBT, BT_IO_REGION_SIZE);
> +
> +    sysbus_init_mmio(sbd, &ibt->iomem);
> +}
> +
> +static Property aspeed_ibt_props[] =3D {
> +    DEFINE_PROP_CHR("chardev", AspeedIBTState, chr),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static const VMStateDescription vmstate_aspeed_ibt =3D {
> +    .name =3D "aspeed.bt",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, AspeedIBTState, ASPEED_IBT_NR_REGS),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void aspeed_ibt_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    dc->realize =3D aspeed_ibt_realize;
> +    dc->reset =3D aspeed_ibt_reset;
> +    dc->desc =3D "ASPEED iBT Device";
> +    dc->vmsd =3D &vmstate_aspeed_ibt;
> +    device_class_set_props(dc, aspeed_ibt_props);
> +}
> +
> +static const TypeInfo aspeed_ibt_info =3D {
> +    .name =3D TYPE_ASPEED_IBT,
> +    .parent =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(AspeedIBTState),
> +    .class_init =3D aspeed_ibt_class_init,
> +};
> +
> +static void aspeed_ibt_register_types(void)
> +{
> +    type_register_static(&aspeed_ibt_info);
> +}
> +
> +type_init(aspeed_ibt_register_types);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 1deef25764da..30cb61ec0e31 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -111,6 +111,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true:
> files('pvpanic-pci.c'))
>  softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
>  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>    'aspeed_hace.c',
> +  'aspeed_ibt.c',
>    'aspeed_lpc.c',
>    'aspeed_scu.c',
>    'aspeed_sdmc.c',
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index d0a89eb05964..e8fcacdfd9e9 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -19,6 +19,13 @@ allwinner_h3_dramphy_write(uint64_t offset, uint64_t
> data, unsigned size) "write
>  allwinner_sid_read(uint64_t offset, uint64_t data, unsigned size) "offse=
t
> 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
>  allwinner_sid_write(uint64_t offset, uint64_t data, unsigned size)
> "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
>
> +# aspeed_ibt.c
> +aspeed_ibt_chr_dump_msg(const char *func, const char *buf, uint32_t len)
> "%s: %s #%d bytes"
> +aspeed_ibt_chr_event(bool connected) "connected:%d"
> +aspeed_ibt_read(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 "
> value:0x%" PRIx64
> +aspeed_ibt_write(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 "
> value:0x%" PRIx64
> +aspeed_ibt_event(const char* event) "%s"
> +
>  # avr_power.c
>  avr_power_read(uint8_t value) "power_reduc read value:%u"
>  avr_power_write(uint8_t value) "power_reduc write value:%u"
> --
> 2.26.3
>
>
>

--000000000000410c4d05bf3c8caf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Cedric and Corey<div><br></div><div>When I&#39;m imple=
menting KCS device for nuvoton BMC boards, one of the feedback Corey gave m=
e was to refactor the existing device like ipmi-bmc-extern so that we can r=
euse some of the common stuff there. I&#39;m in the process of doing that. =
I&#39;ll probably send that as an RFC first to see how you think about that=
.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Mar 29, 2021 at 5:19 AM C=C3=A9dric Le Goater &lt;<a href=3D=
"mailto:clg@kaod.org">clg@kaod.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Implement an IPMI BT interface model usin=
g a chardev backend to<br>
communicate with an external PowerNV machine. It uses the OpenIPMI<br>
simulator protocol for virtual machines described in :<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/cminyard/openipmi/blob/master/l=
anserv/README.vm" rel=3D"noreferrer" target=3D"_blank">https://github.com/c=
minyard/openipmi/blob/master/lanserv/README.vm</a><br>
<br>
and implemented by the &#39;ipmi-bmc-extern&#39; model on the host side.<br=
>
<br>
To use, start the Aspeed BMC machine with :<br>
<br>
=C2=A0 =C2=A0 -chardev socket,id=3Dipmi0,host=3Dlocalhost,port=3D9002,ipv4,=
server,nowait \<br>
=C2=A0 =C2=A0 -global driver=3Daspeed.ibt,property=3Dchardev,value=3Dipmi0<=
br>
<br>
and the PowerNV machine with :<br>
<br>
=C2=A0 =C2=A0 -chardev socket,id=3Dipmi0,host=3Dlocalhost,port=3D9002,recon=
nect=3D10 \<br>
=C2=A0 =C2=A0 -device ipmi-bmc-extern,id=3Dbmc0,chardev=3Dipmi0 \<br>
=C2=A0 =C2=A0 -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 -nodefaults<br>
<br>
Cc: Corey Minyard &lt;<a href=3D"mailto:cminyard@mvista.com" target=3D"_bla=
nk">cminyard@mvista.com</a>&gt;<br>
Signed-off-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org" ta=
rget=3D"_blank">clg@kaod.org</a>&gt;<br>
---<br>
=C2=A0include/hw/arm/aspeed_soc.h=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0include/hw/misc/aspeed_ibt.h |=C2=A0 47 +++<br>
=C2=A0hw/arm/aspeed_ast2600.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +<br>
=C2=A0hw/arm/aspeed_soc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +<br=
>
=C2=A0hw/misc/aspeed_ibt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 596 +++++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01=
 +<br>
=C2=A0hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07=
 +<br>
=C2=A07 files changed, 677 insertions(+)<br>
=C2=A0create mode 100644 include/hw/misc/aspeed_ibt.h<br>
=C2=A0create mode 100644 hw/misc/aspeed_ibt.c<br>
<br>
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h<br>
index d9161d26d645..f0c36b8f7d35 100644<br>
--- a/include/hw/arm/aspeed_soc.h<br>
+++ b/include/hw/arm/aspeed_soc.h<br>
@@ -30,6 +30,7 @@<br>
=C2=A0#include &quot;hw/usb/hcd-ehci.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
=C2=A0#include &quot;hw/misc/aspeed_lpc.h&quot;<br>
+#include &quot;hw/misc/aspeed_ibt.h&quot;<br>
<br>
=C2=A0#define ASPEED_SPIS_NUM=C2=A0 2<br>
=C2=A0#define ASPEED_EHCIS_NUM 2<br>
@@ -65,6 +66,7 @@ struct AspeedSoCState {<br>
=C2=A0 =C2=A0 =C2=A0AspeedSDHCIState sdhci;<br>
=C2=A0 =C2=A0 =C2=A0AspeedSDHCIState emmc;<br>
=C2=A0 =C2=A0 =C2=A0AspeedLPCState lpc;<br>
+=C2=A0 =C2=A0 AspeedIBTState ibt;<br>
=C2=A0};<br>
<br>
=C2=A0#define TYPE_ASPEED_SOC &quot;aspeed-soc&quot;<br>
diff --git a/include/hw/misc/aspeed_ibt.h b/include/hw/misc/aspeed_ibt.h<br=
>
new file mode 100644<br>
index 000000000000..a02a57df9ff8<br>
--- /dev/null<br>
+++ b/include/hw/misc/aspeed_ibt.h<br>
@@ -0,0 +1,47 @@<br>
+/*<br>
+ * ASPEED iBT Device<br>
+ *<br>
+ * Copyright 2016 IBM Corp.<br>
+ *<br>
+ * This code is licensed under the GPL version 2 or later.=C2=A0 See<br>
+ * the COPYING file in the top-level directory.<br>
+ */<br>
+#ifndef ASPEED_IBT_H<br>
+#define ASPEED_IBT_H<br>
+<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;chardev/char-fe.h&quot;<br>
+<br>
+#define TYPE_ASPEED_IBT &quot;aspeed.ibt&quot;<br>
+#define ASPEED_IBT(obj) OBJECT_CHECK(AspeedIBTState, (obj), TYPE_ASPEED_IB=
T)<br>
+<br>
+#define ASPEED_IBT_NR_REGS (0x1C &gt;&gt; 2)<br>
+<br>
+#define ASPEED_IBT_BUFFER_SIZE 64<br>
+<br>
+typedef struct AspeedIBTState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+=C2=A0 =C2=A0 CharBackend chr;<br>
+=C2=A0 =C2=A0 bool connected;<br>
+<br>
+=C2=A0 =C2=A0 uint8_t recv_msg[ASPEED_IBT_BUFFER_SIZE];<br>
+=C2=A0 =C2=A0 uint8_t recv_msg_len;<br>
+=C2=A0 =C2=A0 int recv_msg_index;<br>
+=C2=A0 =C2=A0 int recv_msg_too_many;<br>
+=C2=A0 =C2=A0 bool recv_waiting;<br>
+=C2=A0 =C2=A0 int in_escape;<br>
+<br>
+=C2=A0 =C2=A0 uint8_t send_msg[ASPEED_IBT_BUFFER_SIZE];<br>
+=C2=A0 =C2=A0 uint8_t send_msg_len;<br>
+<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+=C2=A0 =C2=A0 qemu_irq irq;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t regs[ASPEED_IBT_NR_REGS];<br>
+<br>
+} AspeedIBTState;<br>
+<br>
+#endif /* ASPEED_IBT_H */<br>
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c<br>
index fc81c0d8df06..c30d0f320c2a 100644<br>
--- a/hw/arm/aspeed_ast2600.c<br>
+++ b/hw/arm/aspeed_ast2600.c<br>
@@ -219,6 +219,8 @@ static void aspeed_soc_ast2600_init(Object *obj)<br>
<br>
=C2=A0 =C2=A0 =C2=A0snprintf(typename, sizeof(typename), &quot;aspeed.hace-=
%s&quot;, socname);<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;hace&quot;, &amp;s-&=
gt;hace, typename);<br>
+<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;ibt&quot;, &amp;s-&gt;ibt=
, TYPE_ASPEED_IBT);<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
@@ -510,6 +512,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *de=
v, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;hace), 0, sc-=
&gt;memmap[ASPEED_DEV_HACE]);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;hace), 0,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 aspeed_soc_get_irq(s, ASPEED_DEV_HACE));<br>
+<br>
+=C2=A0 =C2=A0 /* iBT */<br>
+=C2=A0 =C2=A0 if (!sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;ibt), errp)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(&amp;s-&gt;lpc.iomem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sc-&g=
t;memmap[ASPEED_DEV_IBT] - sc-&gt;memmap[ASPEED_DEV_LPC],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
s-&gt;ibt.iomem);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;ibt), 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0aspeed_soc_get_irq(s, ASPEED_DEV_IBT));<br>
=C2=A0}<br>
<br>
=C2=A0static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data=
)<br>
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c<br>
index 4a95d27d9d63..5ab4cefc7e8b 100644<br>
--- a/hw/arm/aspeed_soc.c<br>
+++ b/hw/arm/aspeed_soc.c<br>
@@ -219,6 +219,8 @@ static void aspeed_soc_init(Object *obj)<br>
<br>
=C2=A0 =C2=A0 =C2=A0snprintf(typename, sizeof(typename), &quot;aspeed.hace-=
%s&quot;, socname);<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;hace&quot;, &amp;s-&=
gt;hace, typename);<br>
+<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;ibt&quot;, &amp;s-&gt;ibt=
, TYPE_ASPEED_IBT);<br>
=C2=A0}<br>
<br>
=C2=A0static void aspeed_soc_realize(DeviceState *dev, Error **errp)<br>
@@ -438,6 +440,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;hace), 0, sc-=
&gt;memmap[ASPEED_DEV_HACE]);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;hace), 0,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 aspeed_soc_get_irq(s, ASPEED_DEV_HACE));<br>
+<br>
+=C2=A0 =C2=A0 /* iBT */<br>
+=C2=A0 =C2=A0 if (!sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;ibt), errp)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(&amp;s-&gt;lpc.iomem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sc-&g=
t;memmap[ASPEED_DEV_IBT] - sc-&gt;memmap[ASPEED_DEV_LPC],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
s-&gt;ibt.iomem);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;lpc), 1 + aspee=
d_lpc_ibt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;lpc), aspeed_lpc_ibt));<br>
=C2=A0}<br>
=C2=A0static Property aspeed_soc_properties[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_LINK(&quot;dram&quot;, AspeedSoCState, dram=
_mr, TYPE_MEMORY_REGION,<br>
diff --git a/hw/misc/aspeed_ibt.c b/hw/misc/aspeed_ibt.c<br>
new file mode 100644<br>
index 000000000000..69a2096ccb00<br>
--- /dev/null<br>
+++ b/hw/misc/aspeed_ibt.c<br>
@@ -0,0 +1,596 @@<br>
+/*<br>
+ * ASPEED iBT Device<br>
+ *<br>
+ * Copyright (c) 2016-2021 C=C3=A9dric Le Goater, IBM Corporation.<br>
+ *<br>
+ * This code is licensed under the GPL version 2 or later.=C2=A0 See<br>
+ * the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;sysemu/qtest.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;hw/qdev-properties-system.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+#include &quot;hw/misc/aspeed_ibt.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+#define BT_IO_REGION_SIZE 0x1C<br>
+<br>
+#define TO_REG(o) (o &gt;&gt; 2)<br>
+<br>
+#define BT_CR0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0=
=C2=A0 =C2=A0/* iBT config */<br>
+#define=C2=A0 =C2=A0BT_CR0_IO_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016<br>
+#define=C2=A0 =C2=A0BT_CR0_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A012<br>
+#define=C2=A0 =C2=A0BT_CR0_EN_CLR_SLV_RDP=C2=A0 0x8<br>
+#define=C2=A0 =C2=A0BT_CR0_EN_CLR_SLV_WRP=C2=A0 0x4<br>
+#define=C2=A0 =C2=A0BT_CR0_ENABLE_IBT=C2=A0 =C2=A0 =C2=A0 0x1<br>
+#define BT_CR1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4=
=C2=A0 /* interrupt enable */<br>
+#define=C2=A0 =C2=A0BT_CR1_IRQ_H2B=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01<b=
r>
+#define=C2=A0 =C2=A0BT_CR1_IRQ_HBUSY=C2=A0 =C2=A0 =C2=A0 =C2=A00x40<br>
+#define BT_CR2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x8=
=C2=A0 /* interrupt status */<br>
+#define=C2=A0 =C2=A0BT_CR2_IRQ_H2B=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01<b=
r>
+#define=C2=A0 =C2=A0BT_CR2_IRQ_HBUSY=C2=A0 =C2=A0 =C2=A0 =C2=A00x40<br>
+#define BT_CR3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xc =
/* unused */<br>
+#define BT_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x10<br>
+#define=C2=A0 =C2=A0BT_CTRL_B_BUSY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x80<b=
r>
+#define=C2=A0 =C2=A0BT_CTRL_H_BUSY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x40<b=
r>
+#define=C2=A0 =C2=A0BT_CTRL_OEM0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=
x20<br>
+#define=C2=A0 =C2=A0BT_CTRL_SMS_ATN=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10<br>
+#define=C2=A0 =C2=A0BT_CTRL_B2H_ATN=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x08<br>
+#define=C2=A0 =C2=A0BT_CTRL_H2B_ATN=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04<br>
+#define=C2=A0 =C2=A0BT_CTRL_CLR_RD_PTR=C2=A0 =C2=A0 =C2=A00x02<br>
+#define=C2=A0 =C2=A0BT_CTRL_CLR_WR_PTR=C2=A0 =C2=A0 =C2=A00x01<br>
+#define BT_BMC2HOST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x14<br>
+#define BT_INTMASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x18<br>
+#define=C2=A0 =C2=A0BT_INTMASK_B2H_IRQEN=C2=A0 =C2=A00x01<br>
+#define=C2=A0 =C2=A0BT_INTMASK_B2H_IRQ=C2=A0 =C2=A0 =C2=A00x02<br>
+#define=C2=A0 =C2=A0BT_INTMASK_BMC_HWRST=C2=A0 =C2=A00x80<br>
+<br>
+/*<br>
+ * VM IPMI defines<br>
+ */<br>
+#define VM_MSG_CHAR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xA0 /* Marks end of messag=
e */<br>
+#define VM_CMD_CHAR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xA1 /* Marks end of a comm=
and */<br>
+#define VM_ESCAPE_CHAR=C2=A0 =C2=A0 =C2=A00xAA /* Set bit 4 from the next =
byte to 0 */<br>
+<br>
+#define VM_PROTOCOL_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
+#define VM_CMD_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xff=
 /* A version number byte follows */<br>
+#define VM_CMD_NOATTN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00=
<br>
+#define VM_CMD_ATTN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x01<br>
+#define VM_CMD_ATTN_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02<br>
+#define VM_CMD_POWEROFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x03<br>
+#define VM_CMD_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x04<br>
+#define VM_CMD_ENABLE_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x05 /* Enable=
/disable the messaging irq */<br>
+#define VM_CMD_DISABLE_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x06<br>
+#define VM_CMD_SEND_NMI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x07<br>
+#define VM_CMD_CAPABILITIES=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x08<br>
+#define=C2=A0 =C2=A0VM_CAPABILITIES_POWER=C2=A0 =C2=A0 0x01<br>
+#define=C2=A0 =C2=A0VM_CAPABILITIES_RESET=C2=A0 =C2=A0 0x02<br>
+#define=C2=A0 =C2=A0VM_CAPABILITIES_IRQ=C2=A0 =C2=A0 =C2=A0 0x04<br>
+#define=C2=A0 =C2=A0VM_CAPABILITIES_NMI=C2=A0 =C2=A0 =C2=A0 0x08<br>
+#define=C2=A0 =C2=A0VM_CAPABILITIES_ATTN=C2=A0 =C2=A0 =C2=A00x10<br>
+#define=C2=A0 =C2=A0VM_CAPABILITIES_GRACEFUL_SHUTDOWN 0x20<br>
+#define VM_CMD_GRACEFUL_SHUTDOWN=C2=A0 =C2=A00x09<br>
+<br>
+/*<br>
+ * These routines are inspired by the &#39;ipmi-bmc-extern&#39; model and =
by<br>
+ * the lanserv simulator of OpenIPMI. See :<br>
+ *=C2=A0 =C2=A0 <a href=3D"https://github.com/cminyard/openipmi/blob/maste=
r/lanserv/serial_ipmi.c" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/cminyard/openipmi/blob/master/lanserv/serial_ipmi.c</a><br>
+ */<br>
+static unsigned char ipmb_checksum(const unsigned char *data, int size,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char start)<br=
>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char csum =3D start;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (; size &gt; 0; size--, data++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csum +=3D *data;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return csum;<br>
+}<br>
+<br>
+static void vm_add_char(unsigned char ch, unsigned char *c, unsigned int *=
pos)<br>
+{<br>
+=C2=A0 =C2=A0 switch (ch) {<br>
+=C2=A0 =C2=A0 case VM_MSG_CHAR:<br>
+=C2=A0 =C2=A0 case VM_CMD_CHAR:<br>
+=C2=A0 =C2=A0 case VM_ESCAPE_CHAR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c[(*pos)++] =3D VM_ESCAPE_CHAR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c[(*pos)++] =3D ch | 0x10;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c[(*pos)++] =3D ch;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void aspeed_ibt_dump_msg(const char *func, unsigned char *msg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int len)<br>
+{<br>
+=C2=A0 =C2=A0 if (trace_event_get_state_backends(TRACE_ASPEED_IBT_CHR_DUMP=
_MSG)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int size =3D len * 3 + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char tmp[size];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i, n =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; len; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n +=3D snprintf(tmp + n, size - =
n, &quot;%02x:&quot;, msg[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp[size - 1] =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_aspeed_ibt_chr_dump_msg(func, tmp, len);=
<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void aspeed_ibt_chr_write(AspeedIBTState *ibt, const uint8_t *buf,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int len)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 if (!qemu_chr_fe_get_driver(&amp;ibt-&gt;chr)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 aspeed_ibt_dump_msg(__func__, ibt-&gt;recv_msg, ibt-&gt;recv=
_msg_len);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; len; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_write(&amp;ibt-&gt;chr, &amp;buf[i=
], 1);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vm_send(AspeedIBTState *ibt)<br>
+{<br>
+=C2=A0 =C2=A0 unsigned int i;<br>
+=C2=A0 =C2=A0 unsigned int len =3D 0;<br>
+=C2=A0 =C2=A0 unsigned char c[(ibt-&gt;send_msg_len + 7) * 2];<br>
+=C2=A0 =C2=A0 uint8_t netfn;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* The VM IPMI message format does not follow the IPMI =
BT<br>
+=C2=A0 =C2=A0 =C2=A0* interface format. The sequence and the netfn bytes n=
eed to be<br>
+=C2=A0 =C2=A0 =C2=A0* swapped.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 netfn =3D ibt-&gt;send_msg[1];<br>
+=C2=A0 =C2=A0 ibt-&gt;send_msg[1] =3D ibt-&gt;send_msg[2];<br>
+=C2=A0 =C2=A0 ibt-&gt;send_msg[2] =3D netfn;<br>
+<br>
+=C2=A0 =C2=A0 /* No length byte in the VM IPMI message format. trim it */<=
br>
+=C2=A0 =C2=A0 for (i =3D 1; i &lt; ibt-&gt;send_msg_len; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_add_char(ibt-&gt;send_msg[i], c, &amp;len);=
<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 vm_add_char(-ipmb_checksum(&amp;ibt-&gt;send_msg[1], ibt-&gt=
;send_msg_len - 1, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c, &amp;len);<br>
+=C2=A0 =C2=A0 c[len++] =3D VM_MSG_CHAR;<br>
+<br>
+=C2=A0 =C2=A0 aspeed_ibt_chr_write(ibt, c, len);<br>
+}<br>
+<br>
+static void aspeed_ibt_update_irq(AspeedIBTState *ibt)<br>
+{<br>
+=C2=A0 =C2=A0 bool raise =3D false;<br>
+<br>
+=C2=A0 =C2=A0 /* H2B rising */<br>
+=C2=A0 =C2=A0 if ((ibt-&gt;regs[TO_REG(BT_CTRL)] &amp; BT_CTRL_H2B_ATN) &a=
mp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((ibt-&gt;regs[TO_REG(BT_CR1)] &amp; BT_CR1_IR=
Q_H2B) =3D=3D BT_CR1_IRQ_H2B)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;regs[TO_REG(BT_CR2)] |=3D BT_CR2_IRQ_H=
2B;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Also flag the fact that we are waiting=
 for the guest/driver<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to read a received message<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;recv_waiting =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise =3D true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* H_BUSY falling (not supported) */<br>
+=C2=A0 =C2=A0 if ((ibt-&gt;regs[TO_REG(BT_CTRL)] &amp; BT_CTRL_H_BUSY) &am=
p;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((ibt-&gt;regs[TO_REG(BT_CR1)] &amp; BT_CR1_IR=
Q_HBUSY) =3D=3D BT_CR1_IRQ_HBUSY)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;regs[TO_REG(BT_CR2)] |=3D BT_CR2_IRQ_H=
BUSY;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise =3D true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (raise) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(ibt-&gt;irq);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vm_handle_msg(AspeedIBTState *ibt, unsigned char *msg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned int len)<br>
+{<br>
+=C2=A0 =C2=A0 uint8_t seq;<br>
+<br>
+=C2=A0 =C2=A0 aspeed_ibt_dump_msg(__func__, ibt-&gt;recv_msg, ibt-&gt;recv=
_msg_len);<br>
+<br>
+=C2=A0 =C2=A0 if (len &lt; 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot; %s: Mess=
age too short\n&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (ipmb_checksum(ibt-&gt;recv_msg, ibt-&gt;recv_msg_len, 0)=
 !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot; %s: Mess=
age checksum failure\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Trim the checksum byte */<br>
+=C2=A0 =C2=A0 ibt-&gt;recv_msg_len--;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* The VM IPMI message format does not follow the IPMI =
BT<br>
+=C2=A0 =C2=A0 =C2=A0* interface format. The sequence and the netfn bytes n=
eed to be<br>
+=C2=A0 =C2=A0 =C2=A0* swapped.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 seq =3D ibt-&gt;recv_msg[0];<br>
+=C2=A0 =C2=A0 ibt-&gt;recv_msg[0] =3D ibt-&gt;recv_msg[1];<br>
+=C2=A0 =C2=A0 ibt-&gt;recv_msg[1] =3D seq;<br>
+<br>
+=C2=A0 =C2=A0 aspeed_ibt_update_irq(ibt);<br>
+}<br>
+<br>
+/* TODO: handle commands */<br>
+static void vm_handle_cmd(AspeedIBTState *ibt, unsigned char *msg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned int len)<br>
+{<br>
+=C2=A0 =C2=A0 aspeed_ibt_dump_msg(__func__, ibt-&gt;recv_msg, ibt-&gt;recv=
_msg_len);<br>
+<br>
+=C2=A0 =C2=A0 if (len &lt; 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot; %s: Comm=
and too short\n&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (msg[0]) {<br>
+=C2=A0 =C2=A0 case VM_CMD_VERSION:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case VM_CMD_CAPABILITIES:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &lt; 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case VM_CMD_RESET:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vm_handle_char(AspeedIBTState *ibt, unsigned char ch)<br>
+{<br>
+=C2=A0 =C2=A0 unsigned int len =3D ibt-&gt;recv_msg_len;<br>
+<br>
+=C2=A0 =C2=A0 switch (ch) {<br>
+=C2=A0 =C2=A0 case VM_MSG_CHAR:<br>
+=C2=A0 =C2=A0 case VM_CMD_CHAR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ibt-&gt;in_escape) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &=
quot; %s: Message ended in escape\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ibt-&gt;recv_msg_too_many) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &=
quot; %s: Message too long\n&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ibt-&gt;recv_msg_len =3D=3D 0) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Nothing to do */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ch =3D=3D VM_MSG_CHAR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Last byte of message. Signal =
BMC as the host would do */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;regs[TO_REG(BT_CTRL)] |=
=3D BT_CTRL_H2B_ATN;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_handle_msg(ibt, ibt-&gt;recv_=
msg, ibt-&gt;recv_msg_len);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Message is only handled when =
read by BMC (!B_BUSY) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ch =3D=3D VM_CMD_CHAR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_handle_cmd(ibt, ibt-&gt;recv_=
msg, ibt-&gt;recv_msg_len);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Command is now handled. reset=
 receive state */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;in_escape =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;recv_msg_len =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;recv_msg_too_many =3D 0;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case VM_ESCAPE_CHAR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ibt-&gt;recv_msg_too_many) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;in_escape =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ibt-&gt;in_escape) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;in_escape =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ch &amp;=3D ~0x10;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ibt-&gt;recv_msg_too_many) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt;=3D sizeof(ibt-&gt;r=
ecv_msg)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;recv_msg_t=
oo_many =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;recv_msg[len] =3D ch;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;recv_msg_len++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void vm_connected(AspeedIBTState *ibt)<br>
+{<br>
+=C2=A0 =C2=A0 unsigned int len =3D 0;<br>
+=C2=A0 =C2=A0 unsigned char c[5];<br>
+<br>
+=C2=A0 =C2=A0 vm_add_char(VM_CMD_VERSION, c, &amp;len);<br>
+=C2=A0 =C2=A0 vm_add_char(VM_PROTOCOL_VERSION, c, &amp;len);<br>
+=C2=A0 =C2=A0 c[len++] =3D VM_CMD_CHAR;<br>
+<br>
+=C2=A0 =C2=A0 aspeed_ibt_chr_write(ibt, c, len);<br>
+}<br>
+<br>
+static void aspeed_ibt_chr_event(void *opaque, QEMUChrEvent event)<br>
+{<br>
+=C2=A0 =C2=A0 AspeedIBTState *ibt =3D ASPEED_IBT(opaque);<br>
+<br>
+=C2=A0 =C2=A0 switch (event) {<br>
+=C2=A0 =C2=A0 case CHR_EVENT_OPENED:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_connected(ibt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;connected =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case CHR_EVENT_CLOSED:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ibt-&gt;connected) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;connected =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CHR_EVENT_BREAK:<br>
+=C2=A0 =C2=A0 case CHR_EVENT_MUX_IN:<br>
+=C2=A0 =C2=A0 case CHR_EVENT_MUX_OUT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ignore */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 trace_aspeed_ibt_chr_event(ibt-&gt;connected);<br>
+}<br>
+<br>
+static int aspeed_ibt_chr_can_receive(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 AspeedIBTState *ibt =3D ASPEED_IBT(opaque);<br>
+<br>
+=C2=A0 =C2=A0 return !ibt-&gt;recv_waiting &amp;&amp; !(ibt-&gt;regs[TO_RE=
G(BT_CTRL)] &amp; BT_CTRL_B_BUSY);<br>
+}<br>
+<br>
+static void aspeed_ibt_chr_receive(void *opaque, const uint8_t *buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int size)<br>
+{<br>
+=C2=A0 =C2=A0 AspeedIBTState *ibt =3D ASPEED_IBT(opaque);<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 if (!ibt-&gt;connected) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot; %s: not =
connected !?\n&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; size; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_handle_char(ibt, buf[i]);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void aspeed_ibt_write(void *opaque, hwaddr offset, uint64_t data,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 AspeedIBTState *ibt =3D ASPEED_IBT(opaque);<br>
+<br>
+=C2=A0 =C2=A0 trace_aspeed_ibt_write(offset, data);<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case BT_CTRL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* CLR_WR_PTR: cleared before a message is wri=
tten */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (data &amp; BT_CTRL_CLR_WR_PTR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(ibt-&gt;send_msg, 0, size=
of(ibt-&gt;send_msg));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;send_msg_len =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_aspeed_ibt_event(&quot;CLR=
_WR_PTR&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* CLR_RD_PTR: cleared before a message is rea=
d */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (data &amp; BT_CTRL_CLR_RD_PTR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;recv_msg_index =3D -1;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_aspeed_ibt_event(&quot;CLR=
_RD_PTR&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* H2B_ATN: raised by host to end message=
, cleared by BMC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* before reading message<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (data &amp; BT_CTRL_H2B_ATN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;regs[TO_REG(BT_CTRL)] &a=
mp;=3D ~BT_CTRL_H2B_ATN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_aspeed_ibt_event(&quot;H2B=
_ATN&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* B_BUSY: raised and cleared by BMC when mess=
age is read */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (data &amp; BT_CTRL_B_BUSY) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;regs[TO_REG(BT_CTRL)] ^=
=3D BT_CTRL_B_BUSY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_aspeed_ibt_event(&quot;B_B=
USY&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* B2H_ATN: raised by BMC and cleared by =
host<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Also simulate the host busy bit which =
is set while the host<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* is reading the message from the BMC<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (data &amp; BT_CTRL_B2H_ATN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_aspeed_ibt_event(&quot;B2H=
_ATN&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;regs[TO_REG(BT_CTRL)] |=
=3D (BT_CTRL_B2H_ATN | BT_CTRL_H_BUSY);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_send(ibt);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;regs[TO_REG(BT_CTRL)] &a=
mp;=3D ~(BT_CTRL_B2H_ATN | BT_CTRL_H_BUSY);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* signal H_BUSY falling but tha=
t&#39;s a bit useless */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aspeed_ibt_update_irq(ibt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Anything else is unexpected */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &=
quot;%s: unexpected CTRL setting\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Message was read by BMC. we can reset the r=
eceive state */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(ibt-&gt;regs[TO_REG(BT_CTRL)] &amp; BT_C=
TRL_B_BUSY)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_aspeed_ibt_event(&quot;B_B=
USY cleared&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;recv_waiting =3D false;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;in_escape =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;recv_msg_len =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;recv_msg_too_many =3D 0;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case BT_BMC2HOST:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ibt-&gt;send_msg_len &lt; sizeof(ibt-&gt;s=
end_msg)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_aspeed_ibt_event(&quot;BMC=
2HOST&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;send_msg[ibt-&gt;send_ms=
g_len++] =3D data &amp; 0xff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case BT_CR0: /* TODO: iBT config */<br>
+=C2=A0 =C2=A0 case BT_CR1: /* interrupt enable */<br>
+=C2=A0 =C2=A0 case BT_CR3: /* unused */<br>
+=C2=A0 =C2=A0 case BT_INTMASK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;regs[TO_REG(offset)] =3D (uint32_t) da=
ta;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case BT_CR2: /* interrupt status. writing 1 clears. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;regs[TO_REG(offset)] ^=3D (uint32_t) d=
ata;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(ibt-&gt;irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: not impleme=
nted 0x%&quot; HWADDR_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint64_t aspeed_ibt_read(void *opaque, hwaddr offset, unsigned size=
)<br>
+{<br>
+=C2=A0 =C2=A0 AspeedIBTState *ibt =3D ASPEED_IBT(opaque);<br>
+=C2=A0 =C2=A0 uint64_t val =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case BT_BMC2HOST:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_aspeed_ibt_event(&quot;BMC2HOST&quot;);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The IPMI BT interface requires the fir=
st byte to be the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* length of the message<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ibt-&gt;recv_msg_index =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D ibt-&gt;recv_msg_len;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibt-&gt;recv_msg_index++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ibt-&gt;recv_msg_index &lt; ibt-&gt=
;recv_msg_len) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D ibt-&gt;recv_msg[ibt-&gt=
;recv_msg_index++];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case BT_CR0:<br>
+=C2=A0 =C2=A0 case BT_CR1:<br>
+=C2=A0 =C2=A0 case BT_CR2:<br>
+=C2=A0 =C2=A0 case BT_CR3:<br>
+=C2=A0 =C2=A0 case BT_CTRL:<br>
+=C2=A0 =C2=A0 case BT_INTMASK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ibt-&gt;regs[TO_REG(offset)];<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: not impleme=
nted 0x%&quot; HWADDR_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 trace_aspeed_ibt_read(offset, val);<br>
+=C2=A0 =C2=A0 return val;<br>
+}<br>
+<br>
+static const MemoryRegionOps aspeed_ibt_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D aspeed_ibt_read,<br>
+=C2=A0 =C2=A0 .write =3D aspeed_ibt_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4,<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static void aspeed_ibt_reset(DeviceState *dev)<br>
+{<br>
+=C2=A0 =C2=A0 AspeedIBTState *ibt =3D ASPEED_IBT(dev);<br>
+<br>
+=C2=A0 =C2=A0 memset(ibt-&gt;regs, 0, sizeof(ibt-&gt;regs));<br>
+<br>
+=C2=A0 =C2=A0 memset(ibt-&gt;recv_msg, 0, sizeof(ibt-&gt;recv_msg));<br>
+=C2=A0 =C2=A0 ibt-&gt;recv_msg_len =3D 0;<br>
+=C2=A0 =C2=A0 ibt-&gt;recv_msg_index =3D -1;<br>
+=C2=A0 =C2=A0 ibt-&gt;recv_msg_too_many =3D 0;<br>
+=C2=A0 =C2=A0 ibt-&gt;recv_waiting =3D false;<br>
+=C2=A0 =C2=A0 ibt-&gt;in_escape =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 memset(ibt-&gt;send_msg, 0, sizeof(ibt-&gt;send_msg));<br>
+=C2=A0 =C2=A0 ibt-&gt;send_msg_len =3D 0;<br>
+}<br>
+<br>
+static void aspeed_ibt_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);<br>
+=C2=A0 =C2=A0 AspeedIBTState *ibt =3D ASPEED_IBT(dev);<br>
+<br>
+=C2=A0 =C2=A0 if (!qemu_chr_fe_get_driver(&amp;ibt-&gt;chr) &amp;&amp; !qt=
est_enabled()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Aspeed iBT has no chardev ba=
ckend&quot;);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_set_handlers(&amp;ibt-&gt;chr, asp=
eed_ibt_chr_can_receive,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_ibt_chr_receive, aspeed=
_ibt_chr_event,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, ibt, NULL, true);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;ibt-&gt;irq);<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;ibt-&gt;iomem, OBJECT(ibt), &amp;=
aspeed_ibt_ops, ibt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_ASPEED_IBT, BT_IO_REGION_SIZE);<br>
+<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;ibt-&gt;iomem);<br>
+}<br>
+<br>
+static Property aspeed_ibt_props[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_CHR(&quot;chardev&quot;, AspeedIBTState, chr),<b=
r>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static const VMStateDescription vmstate_aspeed_ibt =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;<a href=3D"http://aspeed.bt" rel=3D"noreferr=
er" target=3D"_blank">aspeed.bt</a>&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, AspeedIBTState, ASP=
EED_IBT_NR_REGS),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void aspeed_ibt_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D aspeed_ibt_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D aspeed_ibt_reset;<br>
+=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;ASPEED iBT Device&quot;;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_aspeed_ibt;<br>
+=C2=A0 =C2=A0 device_class_set_props(dc, aspeed_ibt_props);<br>
+}<br>
+<br>
+static const TypeInfo aspeed_ibt_info =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_ASPEED_IBT,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_SYS_BUS_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(AspeedIBTState),<br>
+=C2=A0 =C2=A0 .class_init =3D aspeed_ibt_class_init,<br>
+};<br>
+<br>
+static void aspeed_ibt_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;aspeed_ibt_info);<br>
+}<br>
+<br>
+type_init(aspeed_ibt_register_types);<br>
diff --git a/hw/misc/meson.build b/hw/misc/meson.build<br>
index 1deef25764da..30cb61ec0e31 100644<br>
--- a/hw/misc/meson.build<br>
+++ b/hw/misc/meson.build<br>
@@ -111,6 +111,7 @@ softmmu_ss.add(when: &#39;CONFIG_PVPANIC_PCI&#39;, if_t=
rue: files(&#39;pvpanic-pci.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_AUX&#39;, if_true: files(&#39;auxbus=
.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ASPEED_SOC&#39;, if_true: files(<br>
=C2=A0 =C2=A0&#39;aspeed_hace.c&#39;,<br>
+=C2=A0 &#39;aspeed_ibt.c&#39;,<br>
=C2=A0 =C2=A0&#39;aspeed_lpc.c&#39;,<br>
=C2=A0 =C2=A0&#39;aspeed_scu.c&#39;,<br>
=C2=A0 =C2=A0&#39;aspeed_sdmc.c&#39;,<br>
diff --git a/hw/misc/trace-events b/hw/misc/trace-events<br>
index d0a89eb05964..e8fcacdfd9e9 100644<br>
--- a/hw/misc/trace-events<br>
+++ b/hw/misc/trace-events<br>
@@ -19,6 +19,13 @@ allwinner_h3_dramphy_write(uint64_t offset, uint64_t dat=
a, unsigned size) &quot;write<br>
=C2=A0allwinner_sid_read(uint64_t offset, uint64_t data, unsigned size) &qu=
ot;offset 0x%&quot; PRIx64 &quot; data 0x%&quot; PRIx64 &quot; size %&quot;=
 PRIu32<br>
=C2=A0allwinner_sid_write(uint64_t offset, uint64_t data, unsigned size) &q=
uot;offset 0x%&quot; PRIx64 &quot; data 0x%&quot; PRIx64 &quot; size %&quot=
; PRIu32<br>
<br>
+# aspeed_ibt.c<br>
+aspeed_ibt_chr_dump_msg(const char *func, const char *buf, uint32_t len) &=
quot;%s: %s #%d bytes&quot;<br>
+aspeed_ibt_chr_event(bool connected) &quot;connected:%d&quot;<br>
+aspeed_ibt_read(uint64_t offset, uint64_t value) &quot;offset:0x%&quot; PR=
Ix64 &quot; value:0x%&quot; PRIx64<br>
+aspeed_ibt_write(uint64_t offset, uint64_t value) &quot;offset:0x%&quot; P=
RIx64 &quot; value:0x%&quot; PRIx64<br>
+aspeed_ibt_event(const char* event) &quot;%s&quot;<br>
+<br>
=C2=A0# avr_power.c<br>
=C2=A0avr_power_read(uint8_t value) &quot;power_reduc read value:%u&quot;<b=
r>
=C2=A0avr_power_write(uint8_t value) &quot;power_reduc write value:%u&quot;=
<br>
-- <br>
2.26.3<br>
<br>
<br>
</blockquote></div>

--000000000000410c4d05bf3c8caf--

