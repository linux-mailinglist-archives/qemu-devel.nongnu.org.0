Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4CD33B13D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:38:05 +0100 (CET)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlXw-0006sT-ID
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLlVd-00054q-0V
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLlVa-0008E1-6C
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615808137;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVzyImAayCMbjI+VLuTHqAVhjcPHt3MCcJyt+Z9ugLQ=;
 b=L9cfCp7Gmtnso+nS+8AYwsakEaG7brkpl1SNxm/F6Ua5mrbd0hcLvCIXtLbmsQBLrdkpjS
 XHz2twU34rKKYwPSahrFwxkshjwU7upfvgFku322r6Q7mC62ELcYSrMe3AZxipM2wRBCjy
 arrnlRIansYxYvHSPQsD0Q7H/O/gqj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-bq9YWmWSOMuwXoCcVUlTpA-1; Mon, 15 Mar 2021 07:35:34 -0400
X-MC-Unique: bq9YWmWSOMuwXoCcVUlTpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33F273E75B;
 Mon, 15 Mar 2021 11:35:33 +0000 (UTC)
Received: from redhat.com (ovpn-115-81.ams2.redhat.com [10.36.115.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 107EB6EF51;
 Mon, 15 Mar 2021 11:35:31 +0000 (UTC)
Date: Mon, 15 Mar 2021 11:35:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 5/9] char: add goldfish-tty
Message-ID: <YE9GgQDw/TYD17Qf@redhat.com>
References: <20210311210934.1935587-1-laurent@vivier.eu>
 <20210311210934.1935587-6-laurent@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <20210311210934.1935587-6-laurent@vivier.eu>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nitpick, use  'hw/char' in the subject, as I mistakenly thought
this was touching the char/ backend initially.

On Thu, Mar 11, 2021 at 10:09:30PM +0100, Laurent Vivier wrote:
> Implement the goldfish tty device as defined in
> 
> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT
> 
> and based on the kernel driver code:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210309195941.763896-2-laurent@vivier.eu>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/hw/char/goldfish_tty.h |  35 ++++
>  hw/char/goldfish_tty.c         | 283 +++++++++++++++++++++++++++++++++
>  hw/char/Kconfig                |   3 +
>  hw/char/meson.build            |   2 +
>  hw/char/trace-events           |  10 ++
>  5 files changed, 333 insertions(+)
>  create mode 100644 include/hw/char/goldfish_tty.h
>  create mode 100644 hw/char/goldfish_tty.c
> 
> diff --git a/include/hw/char/goldfish_tty.h b/include/hw/char/goldfish_tty.h
> new file mode 100644
> index 000000000000..b9dd67362a68
> --- /dev/null
> +++ b/include/hw/char/goldfish_tty.h
> @@ -0,0 +1,35 @@
> +/*
> + * SPDX-License-Identifer: GPL-2.0-or-later
> + *
> + * Goldfish TTY
> + *
> + * (c) 2020 Laurent Vivier <laurent@vivier.eu>
> + *
> + */
> +
> +#ifndef HW_CHAR_GOLDFISH_TTY_H
> +#define HW_CHAR_GOLDFISH_TTY_H
> +
> +#include "qemu/fifo8.h"
> +#include "chardev/char-fe.h"
> +
> +#define TYPE_GOLDFISH_TTY "goldfish_tty"
> +OBJECT_DECLARE_SIMPLE_TYPE(GoldfishTTYState, GOLDFISH_TTY)
> +
> +#define GOLFISH_TTY_BUFFER_SIZE 128
> +
> +struct GoldfishTTYState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +    CharBackend chr;
> +
> +    uint32_t data_len;
> +    uint64_t data_ptr;
> +    bool int_enabled;
> +
> +    Fifo8 rx_fifo;
> +};
> +
> +#endif
> diff --git a/hw/char/goldfish_tty.c b/hw/char/goldfish_tty.c
> new file mode 100644
> index 000000000000..9f705f8653cc
> --- /dev/null
> +++ b/hw/char/goldfish_tty.c
> @@ -0,0 +1,283 @@
> +/*
> + * SPDX-License-Identifer: GPL-2.0-or-later
> + *
> + * Goldfish TTY
> + *
> + * (c) 2020 Laurent Vivier <laurent@vivier.eu>
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties-system.h"
> +#include "hw/sysbus.h"
> +#include "migration/vmstate.h"
> +#include "chardev/char-fe.h"
> +#include "qemu/log.h"
> +#include "trace.h"
> +#include "exec/address-spaces.h"
> +#include "hw/char/goldfish_tty.h"
> +
> +/* registers */
> +
> +enum {
> +    REG_PUT_CHAR      = 0x00,
> +    REG_BYTES_READY   = 0x04,
> +    REG_CMD           = 0x08,
> +    REG_DATA_PTR      = 0x10,
> +    REG_DATA_LEN      = 0x14,
> +    REG_DATA_PTR_HIGH = 0x18,
> +    REG_VERSION       = 0x20,
> +};
> +
> +/* commands */
> +
> +enum {
> +    CMD_INT_DISABLE   = 0x00,
> +    CMD_INT_ENABLE    = 0x01,
> +    CMD_WRITE_BUFFER  = 0x02,
> +    CMD_READ_BUFFER   = 0x03,
> +};
> +
> +static uint64_t goldfish_tty_read(void *opaque, hwaddr addr,
> +                                  unsigned size)
> +{
> +    GoldfishTTYState *s = opaque;
> +    uint64_t value = 0;
> +
> +    switch (addr) {
> +    case REG_BYTES_READY:
> +        value = fifo8_num_used(&s->rx_fifo);
> +        break;
> +    case REG_VERSION:
> +        value = 0;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: unimplemented register read 0x%02"HWADDR_PRIx"\n",
> +                      __func__, addr);
> +        break;
> +    }
> +
> +    trace_goldfish_tty_read(s, addr, size, value);
> +
> +    return value;
> +}
> +
> +static void goldfish_tty_cmd(GoldfishTTYState *s, uint32_t cmd)
> +{
> +    uint32_t to_copy;
> +    uint8_t *buf;
> +    uint8_t data_out[GOLFISH_TTY_BUFFER_SIZE];
> +    int len;
> +    uint64_t ptr;
> +
> +    switch (cmd) {
> +    case CMD_INT_DISABLE:
> +        if (s->int_enabled) {
> +            if (!fifo8_is_empty(&s->rx_fifo)) {
> +                qemu_set_irq(s->irq, 0);
> +            }
> +            s->int_enabled = false;
> +        }
> +        break;
> +    case CMD_INT_ENABLE:
> +        if (!s->int_enabled) {
> +            if (!fifo8_is_empty(&s->rx_fifo)) {
> +                qemu_set_irq(s->irq, 1);
> +            }
> +            s->int_enabled = true;
> +        }
> +        break;
> +    case CMD_WRITE_BUFFER:
> +        len = s->data_len;
> +        ptr = s->data_ptr;
> +        while (len) {
> +            to_copy = MIN(GOLFISH_TTY_BUFFER_SIZE, len);
> +
> +            address_space_rw(&address_space_memory, ptr,
> +                             MEMTXATTRS_UNSPECIFIED, data_out, to_copy, 0);
> +            qemu_chr_fe_write_all(&s->chr, data_out, to_copy);
> +
> +            len -= to_copy;
> +            ptr += to_copy;
> +        }
> +        break;
> +    case CMD_READ_BUFFER:
> +        len = s->data_len;
> +        ptr = s->data_ptr;
> +        while (len && !fifo8_is_empty(&s->rx_fifo)) {
> +            buf = (uint8_t *)fifo8_pop_buf(&s->rx_fifo, len, &to_copy);
> +            address_space_rw(&address_space_memory, ptr,
> +                            MEMTXATTRS_UNSPECIFIED, buf, to_copy, 1);
> +
> +            len -= to_copy;
> +            ptr += to_copy;
> +        }
> +        if (s->int_enabled && fifo8_is_empty(&s->rx_fifo)) {
> +            qemu_set_irq(s->irq, 0);
> +        }
> +        break;
> +    }
> +}
> +
> +static void goldfish_tty_write(void *opaque, hwaddr addr,
> +                               uint64_t value, unsigned size)
> +{
> +    GoldfishTTYState *s = opaque;
> +    unsigned char c;
> +
> +    trace_goldfish_tty_write(s, addr, size, value);
> +
> +    switch (addr) {
> +    case REG_PUT_CHAR:
> +        c = value;
> +        qemu_chr_fe_write_all(&s->chr, &c, sizeof(c));
> +        break;
> +    case REG_CMD:
> +        goldfish_tty_cmd(s, value);
> +        break;
> +    case REG_DATA_PTR:
> +        s->data_ptr = value;
> +        break;
> +    case REG_DATA_PTR_HIGH:
> +        s->data_ptr = deposit64(s->data_ptr, 32, 32, value);
> +        break;
> +    case REG_DATA_LEN:
> +        s->data_len = value;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
> +                      __func__, addr);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps goldfish_tty_ops = {
> +    .read = goldfish_tty_read,
> +    .write = goldfish_tty_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.max_access_size = 4,
> +    .impl.max_access_size = 4,
> +    .impl.min_access_size = 4,
> +};
> +
> +static int goldfish_tty_can_receive(void *opaque)
> +{
> +    GoldfishTTYState *s = opaque;
> +    int available = fifo8_num_free(&s->rx_fifo);
> +
> +    trace_goldfish_tty_can_receive(s, available);
> +
> +    return available;
> +}
> +
> +static void goldfish_tty_receive(void *opaque, const uint8_t *buffer, int size)
> +{
> +    GoldfishTTYState *s = opaque;
> +
> +    trace_goldfish_tty_receive(s, size);
> +
> +    g_assert(size <= fifo8_num_free(&s->rx_fifo));
> +
> +    fifo8_push_all(&s->rx_fifo, buffer, size);
> +
> +    if (s->int_enabled && !fifo8_is_empty(&s->rx_fifo)) {
> +        qemu_set_irq(s->irq, 1);
> +    }
> +}
> +
> +static void goldfish_tty_reset(DeviceState *dev)
> +{
> +    GoldfishTTYState *s = GOLDFISH_TTY(dev);
> +
> +    trace_goldfish_tty_reset(s);
> +
> +    fifo8_reset(&s->rx_fifo);
> +    s->int_enabled = false;
> +    s->data_ptr = 0;
> +    s->data_len = 0;
> +}
> +
> +static void goldfish_tty_realize(DeviceState *dev, Error **errp)
> +{
> +    GoldfishTTYState *s = GOLDFISH_TTY(dev);
> +
> +    trace_goldfish_tty_realize(s);
> +
> +    fifo8_create(&s->rx_fifo, GOLFISH_TTY_BUFFER_SIZE);
> +    memory_region_init_io(&s->iomem, OBJECT(s), &goldfish_tty_ops, s,
> +                          "goldfish_tty", 0x24);
> +
> +    if (qemu_chr_fe_backend_connected(&s->chr)) {
> +        qemu_chr_fe_set_handlers(&s->chr, goldfish_tty_can_receive,
> +                                 goldfish_tty_receive, NULL, NULL,
> +                                 s, NULL, true);
> +    }
> +}
> +
> +static void goldfish_tty_unrealize(DeviceState *dev)
> +{
> +    GoldfishTTYState *s = GOLDFISH_TTY(dev);
> +
> +    trace_goldfish_tty_unrealize(s);
> +
> +    fifo8_destroy(&s->rx_fifo);
> +}
> +
> +static const VMStateDescription vmstate_goldfish_tty = {
> +    .name = "goldfish_tty",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(data_len, GoldfishTTYState),
> +        VMSTATE_UINT64(data_ptr, GoldfishTTYState),
> +        VMSTATE_BOOL(int_enabled, GoldfishTTYState),
> +        VMSTATE_FIFO8(rx_fifo, GoldfishTTYState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property goldfish_tty_properties[] = {
> +    DEFINE_PROP_CHR("chardev", GoldfishTTYState, chr),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void goldfish_tty_instance_init(Object *obj)
> +{
> +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> +    GoldfishTTYState *s = GOLDFISH_TTY(obj);
> +
> +    trace_goldfish_tty_instance_init(s);
> +
> +    sysbus_init_mmio(dev, &s->iomem);
> +    sysbus_init_irq(dev, &s->irq);
> +}
> +
> +static void goldfish_tty_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    device_class_set_props(dc, goldfish_tty_properties);
> +    dc->reset = goldfish_tty_reset;
> +    dc->realize = goldfish_tty_realize;
> +    dc->unrealize = goldfish_tty_unrealize;
> +    dc->vmsd = &vmstate_goldfish_tty;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
> +}
> +
> +static const TypeInfo goldfish_tty_info = {
> +    .name = TYPE_GOLDFISH_TTY,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .class_init = goldfish_tty_class_init,
> +    .instance_init = goldfish_tty_instance_init,
> +    .instance_size = sizeof(GoldfishTTYState),
> +};
> +
> +static void goldfish_tty_register_types(void)
> +{
> +    type_register_static(&goldfish_tty_info);
> +}
> +
> +type_init(goldfish_tty_register_types)
> diff --git a/hw/char/Kconfig b/hw/char/Kconfig
> index f6f4fffd1b7c..4cf36ac637ba 100644
> --- a/hw/char/Kconfig
> +++ b/hw/char/Kconfig
> @@ -64,3 +64,6 @@ config MCHP_PFSOC_MMUART
>  
>  config SIFIVE_UART
>      bool
> +
> +config GOLDFISH_TTY
> +    bool
> diff --git a/hw/char/meson.build b/hw/char/meson.build
> index afe9a0af88c1..6f5c3e5b5bfa 100644
> --- a/hw/char/meson.build
> +++ b/hw/char/meson.build
> @@ -39,3 +39,5 @@ specific_ss.add(when: 'CONFIG_HTIF', if_true: files('riscv_htif.c'))
>  specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
>  specific_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-serial-bus.c'))
>  specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_vty.c'))
> +
> +specific_ss.add(when: 'CONFIG_GOLDFISH_TTY', if_true: files('goldfish_tty.c'))
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index 81026f661277..76d52938ead3 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -20,6 +20,16 @@ virtio_console_flush_buf(unsigned int port, size_t len, ssize_t ret) "port %u, i
>  virtio_console_chr_read(unsigned int port, int size) "port %u, size %d"
>  virtio_console_chr_event(unsigned int port, int event) "port %u, event %d"
>  
> +# goldfish_tty.c
> +goldfish_tty_read(void *dev, unsigned int addr, unsigned int size, uint64_t value) "tty: %p reg: 0x%02x size: %d value: 0x%"PRIx64
> +goldfish_tty_write(void *dev, unsigned int addr, unsigned int size, uint64_t value) "tty: %p reg: 0x%02x size: %d value: 0x%"PRIx64
> +goldfish_tty_can_receive(void *dev, unsigned int available) "tty: %p available: %u"
> +goldfish_tty_receive(void *dev, unsigned int size) "tty: %p size: %u"
> +goldfish_tty_reset(void *dev) "tty: %p"
> +goldfish_tty_realize(void *dev) "tty: %p"
> +goldfish_tty_unrealize(void *dev) "tty: %p"
> +goldfish_tty_instance_init(void *dev) "tty: %p"
> +
>  # grlib_apbuart.c
>  grlib_apbuart_event(int event) "event:%d"
>  grlib_apbuart_writel_unknown(uint64_t addr, uint32_t value) "addr 0x%"PRIx64" value 0x%x"
> -- 
> 2.29.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


