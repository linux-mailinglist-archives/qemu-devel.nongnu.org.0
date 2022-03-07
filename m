Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72414CFD03
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:33:57 +0100 (CET)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBci-0007bE-Qs
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:33:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nRBCr-0007LM-9y
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:07:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nRBCo-0004P3-Sf
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646651230;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+bRj/jAuKj0NAjyEpaRxboaI4a5D0xrXSmbiSWZxKhg=;
 b=WDcY30QscIP0pSBz212yaE87JHFq7n/VzoVZlRdDajkRSHwoL1DCOUP8cWW9hjou1/SwjV
 x5FvKHWPT/vsQySJWlaPqz9fXW2xkNkrJmEsg911M84etx20xJB79ewXwesNm3x1rfFRir
 5QWRbm6B982n/gOulS3Q864isGYHBqI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-p49coxqsNz2U63DflSA2AA-1; Mon, 07 Mar 2022 06:07:08 -0500
X-MC-Unique: p49coxqsNz2U63DflSA2AA-1
Received: by mail-wm1-f72.google.com with SMTP id
 14-20020a05600c028e00b003897a4056e8so4722777wmk.9
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 03:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=+bRj/jAuKj0NAjyEpaRxboaI4a5D0xrXSmbiSWZxKhg=;
 b=8FfPrI1JgTRxwDNveCVlRIWMZo7BddH107zM55r57j8FguTPKAHxTcu1oHpBpdlRXS
 PI1aQ2xp2g8ykuTgW3BrmKKX95i94Ow8RSIzvqLCjA8z3SWxD3Q3LtGWuIlWYwEVF2np
 rlOPAY4Fm50RL5Ryr/6cgb5JhX3vpnkVWWpi8xsOhmPbpCUZmLeUVEG24v5v1oh2v2/U
 AEOGZ5E0Qi+eAA6iRqw8ZICm85RAF+PQtCcqde0wQCUN+b9lQWsewyTwJxXKSQ/QMr7J
 5YtO3xYxzeeT8ZjC+rlbMTHsk2u+vtfkco2o7GvQYV4RakfgTKiy0K9eOgFV8pMiHQdV
 xn0A==
X-Gm-Message-State: AOAM533S5Kg8adm6Rg4mEfC8lMIFFWvy0FcEnpTMoMWo6R32TmJ2jqcw
 Y6fNv0iobIrHLNqqVY4vW5RRnJlkalQkzi9Zwu5rWdwGFQHXb2CNU0bwQcFP6iunduAnSviRasE
 KCjWWke5+Q2ERcIE=
X-Received: by 2002:a05:6000:1ace:b0:1e8:cbe4:9920 with SMTP id
 i14-20020a0560001ace00b001e8cbe49920mr8006276wry.121.1646651227385; 
 Mon, 07 Mar 2022 03:07:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhEj7l6EQtf6uwbc3SHj4ykL6b92XgiEE+P9nEBpAN2ogfUjv+v9Ce1ftya7hA45y+EekQQQ==
X-Received: by 2002:a05:6000:1ace:b0:1e8:cbe4:9920 with SMTP id
 i14-20020a0560001ace00b001e8cbe49920mr8006253wry.121.1646651227045; 
 Mon, 07 Mar 2022 03:07:07 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b001e7140ddb44sm11016389wrw.49.2022.03.07.03.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 03:07:06 -0800 (PST)
Subject: Re: [PULL 16/45] tests/qtest/libqos: Add generic pci host bridge in
 arm-virt machine
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20220304133556.233983-1-mst@redhat.com>
 <20220304133556.233983-17-mst@redhat.com>
 <20220307050209-mutt-send-email-mst@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <72cf8d3b-82b3-7f43-0c94-8f8a45504dde@redhat.com>
Date: Mon, 7 Mar 2022 12:07:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220307050209-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On 3/7/22 11:02 AM, Michael S. Tsirkin wrote:
> On Fri, Mar 04, 2022 at 08:39:36AM -0500, Michael S. Tsirkin wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> Up to now the virt-machine node contains a virtio-mmio node.
>> However no driver produces any PCI interface node. Hence, PCI
>> tests cannot be run with aarch64 binary.
>>
>> Add a GPEX driver node that produces a pci interface node. This latter
>> then can be consumed by all the pci tests. One of the first motivation
>> was to be able to run the virtio-iommu-pci tests.
>>
>> We still face an issue with pci hotplug tests as hotplug cannot happen
>> on the pcie root bus and require a generic root port. This will be
>> addressed later on.
>>
>> We force cpu=max along with aarch64/virt machine as some PCI tests
>> require high MMIO regions to be available.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> Message-Id: <20220210145254.157790-6-eric.auger@redhat.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Pls note I dropped this in v2 due to issues on powerpc.  Feel free to resubmit. Thanks!
noted, thanks. Working on it... Sorry for the inconvenience.

Eric
>
>> ---
>>  tests/qtest/libqos/generic-pcihost.h  |  54 ++++++
>>  tests/qtest/libqos/arm-virt-machine.c |  19 ++-
>>  tests/qtest/libqos/generic-pcihost.c  | 231 ++++++++++++++++++++++++++
>>  tests/qtest/libqos/meson.build        |   1 +
>>  4 files changed, 301 insertions(+), 4 deletions(-)
>>  create mode 100644 tests/qtest/libqos/generic-pcihost.h
>>  create mode 100644 tests/qtest/libqos/generic-pcihost.c
>>
>> diff --git a/tests/qtest/libqos/generic-pcihost.h b/tests/qtest/libqos/generic-pcihost.h
>> new file mode 100644
>> index 0000000000..c693c769df
>> --- /dev/null
>> +++ b/tests/qtest/libqos/generic-pcihost.h
>> @@ -0,0 +1,54 @@
>> +/*
>> + * libqos Generic PCI bindings and generic pci host bridge
>> + *
>> + * Copyright Red Hat Inc., 2022
>> + *
>> + * Authors:
>> + *  Eric Auger <eric.auger@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef LIBQOS_GENERIC_PCIHOST_H
>> +#define LIBQOS_GENERIC_PCIHOST_H
>> +
>> +#include "pci.h"
>> +#include "malloc.h"
>> +#include "qgraph.h"
>> +
>> +typedef struct QGenericPCIBus {
>> +    QOSGraphObject obj;
>> +    QPCIBus bus;
>> +    uint64_t gpex_pio_base;
>> +    uint64_t ecam_alloc_ptr;
>> +} QGenericPCIBus;
>> +
>> +/*
>> + * qpci_init_generic():
>> + * @ret: A valid QGenericPCIBus * pointer
>> + * @qts: The %QTestState
>> + * @alloc: A previously initialized @alloc providing memory for @qts
>> + * @bool: devices can be hotplugged on this bus
>> + *
>> + * This function initializes an already allocated
>> + * QGenericPCIBus object.
>> + */
>> +void qpci_init_generic(QGenericPCIBus *ret, QTestState *qts,
>> +                       QGuestAllocator *alloc, bool hotpluggable);
>> +
>> +/* QGenericPCIHost */
>> +
>> +typedef struct QGenericPCIHost QGenericPCIHost;
>> +
>> +struct QGenericPCIHost {
>> +    QOSGraphObject obj;
>> +    QGenericPCIBus pci;
>> +};
>> +
>> +QOSGraphObject *generic_pcihost_get_device(void *obj, const char *device);
>> +void qos_create_generic_pcihost(QGenericPCIHost *host,
>> +                                QTestState *qts,
>> +                                QGuestAllocator *alloc);
>> +
>> +#endif
>> diff --git a/tests/qtest/libqos/arm-virt-machine.c b/tests/qtest/libqos/arm-virt-machine.c
>> index e0f5932284..96da0dde54 100644
>> --- a/tests/qtest/libqos/arm-virt-machine.c
>> +++ b/tests/qtest/libqos/arm-virt-machine.c
>> @@ -22,6 +22,8 @@
>>  #include "malloc.h"
>>  #include "qgraph.h"
>>  #include "virtio-mmio.h"
>> +#include "generic-pcihost.h"
>> +#include "hw/pci/pci_regs.h"
>>  
>>  #define ARM_PAGE_SIZE               4096
>>  #define VIRTIO_MMIO_BASE_ADDR       0x0A003E00
>> @@ -35,6 +37,7 @@ struct QVirtMachine {
>>      QOSGraphObject obj;
>>      QGuestAllocator alloc;
>>      QVirtioMMIODevice virtio_mmio;
>> +    QGenericPCIHost bridge;
>>  };
>>  
>>  static void virt_destructor(QOSGraphObject *obj)
>> @@ -57,11 +60,13 @@ static void *virt_get_driver(void *object, const char *interface)
>>  static QOSGraphObject *virt_get_device(void *obj, const char *device)
>>  {
>>      QVirtMachine *machine = obj;
>> -    if (!g_strcmp0(device, "virtio-mmio")) {
>> +    if (!g_strcmp0(device, "generic-pcihost")) {
>> +        return &machine->bridge.obj;
>> +    } else if (!g_strcmp0(device, "virtio-mmio")) {
>>          return &machine->virtio_mmio.obj;
>>      }
>>  
>> -    fprintf(stderr, "%s not present in arm/virtio\n", device);
>> +    fprintf(stderr, "%s not present in arm/virt\n", device);
>>      g_assert_not_reached();
>>  }
>>  
>> @@ -76,16 +81,22 @@ static void *qos_create_machine_arm_virt(QTestState *qts)
>>      qvirtio_mmio_init_device(&machine->virtio_mmio, qts, VIRTIO_MMIO_BASE_ADDR,
>>                               VIRTIO_MMIO_SIZE);
>>  
>> +    qos_create_generic_pcihost(&machine->bridge, qts, &machine->alloc);
>> +
>>      machine->obj.get_device = virt_get_device;
>>      machine->obj.get_driver = virt_get_driver;
>>      machine->obj.destructor = virt_destructor;
>>      return machine;
>>  }
>>  
>> -static void virtio_mmio_register_nodes(void)
>> +static void virt_machine_register_nodes(void)
>>  {
>>      qos_node_create_machine("arm/virt", qos_create_machine_arm_virt);
>>      qos_node_contains("arm/virt", "virtio-mmio", NULL);
>> +
>> +    qos_node_create_machine_args("aarch64/virt", qos_create_machine_arm_virt,
>> +                                 " -cpu max");
>> +    qos_node_contains("aarch64/virt", "generic-pcihost", NULL);
>>  }
>>  
>> -libqos_init(virtio_mmio_register_nodes);
>> +libqos_init(virt_machine_register_nodes);
>> diff --git a/tests/qtest/libqos/generic-pcihost.c b/tests/qtest/libqos/generic-pcihost.c
>> new file mode 100644
>> index 0000000000..704bbc3473
>> --- /dev/null
>> +++ b/tests/qtest/libqos/generic-pcihost.c
>> @@ -0,0 +1,231 @@
>> +/*
>> + * libqos PCI bindings for generic PCI
>> + *
>> + * Copyright Red Hat Inc., 2022
>> + *
>> + * Authors:
>> + *  Eric Auger   <eric.auger@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "libqtest.h"
>> +#include "generic-pcihost.h"
>> +#include "qapi/qmp/qdict.h"
>> +#include "hw/pci/pci_regs.h"
>> +
>> +#include "qemu/module.h"
>> +
>> +/* QGenericPCIHost */
>> +
>> +QOSGraphObject *generic_pcihost_get_device(void *obj, const char *device)
>> +{
>> +    QGenericPCIHost *host = obj;
>> +    if (!g_strcmp0(device, "pci-bus-generic")) {
>> +        return &host->pci.obj;
>> +    }
>> +    fprintf(stderr, "%s not present in generic-pcihost\n", device);
>> +    g_assert_not_reached();
>> +}
>> +
>> +void qos_create_generic_pcihost(QGenericPCIHost *host,
>> +                                QTestState *qts,
>> +                                QGuestAllocator *alloc)
>> +{
>> +    host->obj.get_device = generic_pcihost_get_device;
>> +    qpci_init_generic(&host->pci, qts, alloc, false);
>> +}
>> +
>> +static uint8_t qpci_generic_pio_readb(QPCIBus *bus, uint32_t addr)
>> +{
>> +    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
>> +
>> +    return qtest_readb(bus->qts, s->gpex_pio_base + addr);
>> +}
>> +
>> +static void qpci_generic_pio_writeb(QPCIBus *bus, uint32_t addr, uint8_t val)
>> +{
>> +    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
>> +
>> +    qtest_writeb(bus->qts, s->gpex_pio_base + addr,  val);
>> +}
>> +
>> +static uint16_t qpci_generic_pio_readw(QPCIBus *bus, uint32_t addr)
>> +{
>> +    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
>> +
>> +    return qtest_readw(bus->qts, s->gpex_pio_base + addr);
>> +}
>> +
>> +static void qpci_generic_pio_writew(QPCIBus *bus, uint32_t addr, uint16_t val)
>> +{
>> +    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
>> +
>> +    qtest_writew(bus->qts, s->gpex_pio_base + addr, val);
>> +}
>> +
>> +static uint32_t qpci_generic_pio_readl(QPCIBus *bus, uint32_t addr)
>> +{
>> +    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
>> +
>> +    return qtest_readl(bus->qts, s->gpex_pio_base + addr);
>> +}
>> +
>> +static void qpci_generic_pio_writel(QPCIBus *bus, uint32_t addr, uint32_t val)
>> +{
>> +    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
>> +
>> +    qtest_writel(bus->qts, s->gpex_pio_base + addr, val);
>> +}
>> +
>> +static uint64_t qpci_generic_pio_readq(QPCIBus *bus, uint32_t addr)
>> +{
>> +    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
>> +
>> +    return qtest_readq(bus->qts, s->gpex_pio_base + addr);
>> +}
>> +
>> +static void qpci_generic_pio_writeq(QPCIBus *bus, uint32_t addr, uint64_t val)
>> +{
>> +    QGenericPCIBus *s = container_of(bus, QGenericPCIBus, bus);
>> +
>> +    qtest_writeq(bus->qts, s->gpex_pio_base + addr, val);
>> +}
>> +
>> +static void qpci_generic_memread(QPCIBus *bus, uint32_t addr, void *buf, size_t len)
>> +{
>> +    qtest_memread(bus->qts, addr, buf, len);
>> +}
>> +
>> +static void qpci_generic_memwrite(QPCIBus *bus, uint32_t addr,
>> +                                  const void *buf, size_t len)
>> +{
>> +    qtest_memwrite(bus->qts, addr, buf, len);
>> +}
>> +
>> +static uint8_t qpci_generic_config_readb(QPCIBus *bus, int devfn, uint8_t offset)
>> +{
>> +    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
>> +    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
>> +    uint8_t val;
>> +
>> +    qtest_memread(bus->qts, addr, &val, 1);
>> +    return val;
>> +}
>> +
>> +static uint16_t qpci_generic_config_readw(QPCIBus *bus, int devfn, uint8_t offset)
>> +{
>> +    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
>> +    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
>> +    uint16_t val;
>> +
>> +    qtest_memread(bus->qts, addr, &val, 2);
>> +    return val;
>> +}
>> +
>> +static uint32_t qpci_generic_config_readl(QPCIBus *bus, int devfn, uint8_t offset)
>> +{
>> +    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
>> +    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
>> +    uint32_t val;
>> +
>> +    qtest_memread(bus->qts, addr, &val, 4);
>> +    return val;
>> +}
>> +
>> +static void
>> +qpci_generic_config_writeb(QPCIBus *bus, int devfn, uint8_t offset, uint8_t value)
>> +{
>> +    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
>> +    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
>> +    uint32_t val = value;
>> +
>> +    qtest_memwrite(bus->qts, addr, &val, 1);
>> +}
>> +
>> +static void
>> +qpci_generic_config_writew(QPCIBus *bus, int devfn, uint8_t offset, uint16_t value)
>> +{
>> +    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
>> +    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
>> +    uint32_t val = value;
>> +
>> +    qtest_memwrite(bus->qts, addr, &val, 2);
>> +}
>> +
>> +static void
>> +qpci_generic_config_writel(QPCIBus *bus, int devfn, uint8_t offset, uint32_t value)
>> +{
>> +    QGenericPCIBus *gbus = container_of(bus, QGenericPCIBus, bus);
>> +    uint64_t addr = gbus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
>> +    uint32_t val = value;
>> +
>> +    qtest_memwrite(bus->qts, addr, &val, 4);
>> +}
>> +
>> +static void *qpci_generic_get_driver(void *obj, const char *interface)
>> +{
>> +    QGenericPCIBus *qpci = obj;
>> +    if (!g_strcmp0(interface, "pci-bus")) {
>> +        return &qpci->bus;
>> +    }
>> +    fprintf(stderr, "%s not present in pci-bus-generic\n", interface);
>> +    g_assert_not_reached();
>> +}
>> +
>> +void qpci_init_generic(QGenericPCIBus *qpci, QTestState *qts,
>> +                       QGuestAllocator *alloc, bool hotpluggable)
>> +{
>> +    assert(qts);
>> +
>> +    qpci->gpex_pio_base = 0x3eff0000;
>> +    qpci->bus.not_hotpluggable = !hotpluggable;
>> +    qpci->bus.has_buggy_msi = false;
>> +
>> +    qpci->bus.pio_readb = qpci_generic_pio_readb;
>> +    qpci->bus.pio_readw = qpci_generic_pio_readw;
>> +    qpci->bus.pio_readl = qpci_generic_pio_readl;
>> +    qpci->bus.pio_readq = qpci_generic_pio_readq;
>> +
>> +    qpci->bus.pio_writeb = qpci_generic_pio_writeb;
>> +    qpci->bus.pio_writew = qpci_generic_pio_writew;
>> +    qpci->bus.pio_writel = qpci_generic_pio_writel;
>> +    qpci->bus.pio_writeq = qpci_generic_pio_writeq;
>> +
>> +    qpci->bus.memread = qpci_generic_memread;
>> +    qpci->bus.memwrite = qpci_generic_memwrite;
>> +
>> +    qpci->bus.config_readb = qpci_generic_config_readb;
>> +    qpci->bus.config_readw = qpci_generic_config_readw;
>> +    qpci->bus.config_readl = qpci_generic_config_readl;
>> +
>> +    qpci->bus.config_writeb = qpci_generic_config_writeb;
>> +    qpci->bus.config_writew = qpci_generic_config_writew;
>> +    qpci->bus.config_writel = qpci_generic_config_writel;
>> +
>> +    qpci->bus.qts = qts;
>> +    qpci->bus.pio_alloc_ptr = 0x0000;
>> +    qpci->bus.pio_limit = 0x10000;
>> +    qpci->bus.mmio_alloc_ptr = 0x10000000;
>> +    qpci->bus.mmio_limit = 0x2eff0000;
>> +    qpci->ecam_alloc_ptr = 0x4010000000;
>> +
>> +    qpci->obj.get_driver = qpci_generic_get_driver;
>> +}
>> +
>> +static void qpci_generic_register_nodes(void)
>> +{
>> +    qos_node_create_driver("pci-bus-generic", NULL);
>> +    qos_node_produces("pci-bus-generic", "pci-bus");
>> +}
>> +
>> +static void qpci_generic_pci_register_nodes(void)
>> +{
>> +    qos_node_create_driver("generic-pcihost", NULL);
>> +    qos_node_contains("generic-pcihost", "pci-bus-generic", NULL);
>> +}
>> +
>> +libqos_init(qpci_generic_register_nodes);
>> +libqos_init(qpci_generic_pci_register_nodes);
>> diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
>> index e988d15791..8c8ee15553 100644
>> --- a/tests/qtest/libqos/meson.build
>> +++ b/tests/qtest/libqos/meson.build
>> @@ -42,6 +42,7 @@ libqos_srcs = files('../libqtest.c',
>>          'virtio-scsi.c',
>>          'virtio-serial.c',
>>          'virtio-iommu.c',
>> +        'generic-pcihost.c',
>>  
>>          # qgraph machines:
>>          'aarch64-xlnx-zcu102-machine.c',
>> -- 
>> MST
>>


