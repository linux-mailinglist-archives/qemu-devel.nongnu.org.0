Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0734D9B6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 23:49:28 +0200 (CEST)
Received: from localhost ([::1]:55748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQzlG-00019u-O4
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 17:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lQzgE-00006E-Gr; Mon, 29 Mar 2021 17:44:14 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:46960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lQzgB-0002cL-2g; Mon, 29 Mar 2021 17:44:14 -0400
Received: by mail-qv1-xf34.google.com with SMTP id j17so7188680qvo.13;
 Mon, 29 Mar 2021 14:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=547IcOdCTXdk9If7GlX8x3cAou2YY1EEU0AlMK5Ns9o=;
 b=SnFvigX/OMiUSC1n9E9T6Emd4Y4646GWTChAxhv9GGVr4IIT+nReeDODUeGdG72GTy
 3DzNaRwPNI4VFWqSShCHaNAHx8LdpIoYsz7EAbfpvPeKMLN3FpKIdk859YB5nOlCUG5O
 hfxqSIAN8fI3oueigY7Hsrrfk3YkgZeFm6ZSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=547IcOdCTXdk9If7GlX8x3cAou2YY1EEU0AlMK5Ns9o=;
 b=bW+aBRXYFw/VIEqT6Yluti/HeQoDG7VhQD4bfkGdNlaSKwVfEStLG9WCyfZ4eDoJC8
 cDXip6NLDDLiXZ9+qmIp2jDgQUGpOhhE4W7OirO1gnda+1GxjRHq21BeFHfSbb1k4i6O
 0s9XNqYxXF1P/6anCyvkx65+D/TFQviFyGCsCy1QIoYF2/CaFjYYcOMvbK1Nrqi+10wO
 2412WvuXlUeexSeCp7/P1NaJtY5x3BrdWov/chbqR3AE9WWvxKx7xkmyDl6F6br8xm3A
 3hJn3fZayQKkR9ue5S2vU48Pk3t2BtKK3KcTVFJbiLtvpRVuH2eyMjJGBW8o8idRJxtA
 FyXA==
X-Gm-Message-State: AOAM530sobq6+PELne+IjW6VT3ILFq9Hcxvvt4Jqi1McgZpmAtK3VTLX
 vFlS0bnvcNsv5tZRm5tOXZpJNarGuK56t/36dS0=
X-Google-Smtp-Source: ABdhPJzg2Qe6hrS82Md1++u7xp3sKRIX6FcbhG5GvNBgw8UZqtcNzMKwxC0r+10QUeNxItxeUoIpmxlyhUQ7kLVECMg=
X-Received: by 2002:a0c:d7ca:: with SMTP id g10mr26910387qvj.16.1617054249038; 
 Mon, 29 Mar 2021 14:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210329121912.271900-1-clg@kaod.org>
In-Reply-To: <20210329121912.271900-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Mar 2021 21:43:56 +0000
Message-ID: <CACPK8Xf=fgTdRu29WbarmTfdFi2LthZBoA5nOXuQUmn7pz8Pxw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: Add an iBT device model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Corey Minyard <cminyard@mvista.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Mar 2021 at 12:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
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

Yay!

Reviewed-by: Joel Stanley <joel@jms.id.au>

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
> +#define ASPEED_IBT(obj) OBJECT_CHECK(AspeedIBTState, (obj), TYPE_ASPEED_=
IBT)
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
> @@ -510,6 +512,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_H=
ACE]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                         aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> +
> +    /* iBT */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(&s->lpc.iomem,
> +                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DEV_LP=
C],
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
> @@ -438,6 +440,16 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_H=
ACE]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                         aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> +
> +    /* iBT */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
> +        return;
> +    }
> +    memory_region_add_subregion(&s->lpc.iomem,
> +                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DEV_LP=
C],
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
> +#define VM_CMD_VERSION             0xff /* A version number byte follows=
 */
> +#define VM_CMD_NOATTN              0x00
> +#define VM_CMD_ATTN                0x01
> +#define VM_CMD_ATTN_IRQ            0x02
> +#define VM_CMD_POWEROFF            0x03
> +#define VM_CMD_RESET               0x04
> +#define VM_CMD_ENABLE_IRQ          0x05 /* Enable/disable the messaging =
irq */
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
> + *    https://github.com/cminyard/openipmi/blob/master/lanserv/serial_ip=
mi.c
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
> +static void vm_add_char(unsigned char ch, unsigned char *c, unsigned int=
 *pos)
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
> +    vm_add_char(-ipmb_checksum(&ibt->send_msg[1], ibt->send_msg_len - 1,=
 0),
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
H2B)) {
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
> +        ((ibt->regs[TO_REG(BT_CR1)] & BT_CR1_IRQ_HBUSY) =3D=3D BT_CR1_IR=
Q_HBUSY)) {
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
> +        qemu_log_mask(LOG_GUEST_ERROR, " %s: Message too short\n", __fun=
c__);
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
> +        qemu_log_mask(LOG_GUEST_ERROR, " %s: Command too short\n", __fun=
c__);
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
> +            qemu_log_mask(LOG_GUEST_ERROR, " %s: Message ended in escape=
\n",
> +                          __func__);
> +        } else if (ibt->recv_msg_too_many) {
> +            qemu_log_mask(LOG_GUEST_ERROR, " %s: Message too long\n", __=
func__);
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
> +    return !ibt->recv_waiting && !(ibt->regs[TO_REG(BT_CTRL)] & BT_CTRL_=
B_BUSY);
> +}
> +
> +static void aspeed_ibt_chr_receive(void *opaque, const uint8_t *buf,
> +                                   int size)
> +{
> +    AspeedIBTState *ibt =3D ASPEED_IBT(opaque);
> +    int i;
> +
> +    if (!ibt->connected) {
> +        qemu_log_mask(LOG_GUEST_ERROR, " %s: not connected !?\n", __func=
__);
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
> +            ibt->regs[TO_REG(BT_CTRL)] |=3D (BT_CTRL_B2H_ATN | BT_CTRL_H=
_BUSY);
> +
> +            vm_send(ibt);
> +
> +            ibt->regs[TO_REG(BT_CTRL)] &=3D ~(BT_CTRL_B2H_ATN | BT_CTRL_=
H_BUSY);
> +
> +            /* signal H_BUSY falling but that's a bit useless */
> +            aspeed_ibt_update_irq(ibt);
> +        }
> +
> +        /* Anything else is unexpected */
> +        else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: unexpected CTRL setting\=
n",
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
> +        qemu_log_mask(LOG_UNIMP, "%s: not implemented 0x%" HWADDR_PRIx "=
\n",
> +                      __func__, offset);
> +        break;
> +    }
> +}
> +
> +static uint64_t aspeed_ibt_read(void *opaque, hwaddr offset, unsigned si=
ze)
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
> +        qemu_log_mask(LOG_UNIMP, "%s: not implemented 0x%" HWADDR_PRIx "=
\n",
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
> +                                 aspeed_ibt_chr_receive, aspeed_ibt_chr_=
event,
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
> @@ -111,6 +111,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: f=
iles('pvpanic-pci.c'))
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
> @@ -19,6 +19,13 @@ allwinner_h3_dramphy_write(uint64_t offset, uint64_t d=
ata, unsigned size) "write
>  allwinner_sid_read(uint64_t offset, uint64_t data, unsigned size) "offse=
t 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
>  allwinner_sid_write(uint64_t offset, uint64_t data, unsigned size) "offs=
et 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
>
> +# aspeed_ibt.c
> +aspeed_ibt_chr_dump_msg(const char *func, const char *buf, uint32_t len)=
 "%s: %s #%d bytes"
> +aspeed_ibt_chr_event(bool connected) "connected:%d"
> +aspeed_ibt_read(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " v=
alue:0x%" PRIx64
> +aspeed_ibt_write(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " =
value:0x%" PRIx64
> +aspeed_ibt_event(const char* event) "%s"
> +
>  # avr_power.c
>  avr_power_read(uint8_t value) "power_reduc read value:%u"
>  avr_power_write(uint8_t value) "power_reduc write value:%u"
> --
> 2.26.3
>

