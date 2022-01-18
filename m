Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F06492FAE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 21:49:25 +0100 (CET)
Received: from localhost ([::1]:39478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9vPw-0007js-Qx
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 15:49:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9vHO-000783-Bi
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 15:40:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9vHJ-0003ii-R1
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 15:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642538429;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zncEUqUd4dBGTgj3TKShMWXThpqZ6yQR26GO114q1OE=;
 b=i4KsuGD1W3QMVNoth4IeNKLd9eCLm3b3bBfKJY2vr9l3lwnC/4Ai+6wIF1Tuiah2Q6fzBF
 EP1mZO/yryMVoFzplut8wwS4c4xxbgtHqZLIzM+fQUXVWT+eeNIvOQ3wR5VfiLT8xMvNap
 mAJwHeHPvs/Eb1zLvNVaFT74NAyCOsE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-awe_-UeKOcCSu1k1ajyBHw-1; Tue, 18 Jan 2022 15:40:28 -0500
X-MC-Unique: awe_-UeKOcCSu1k1ajyBHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so2645595wmb.7
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 12:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=zncEUqUd4dBGTgj3TKShMWXThpqZ6yQR26GO114q1OE=;
 b=EMhKwQUz0timo7hacRsnMlzsiteNxCqhC0CwMbntT0iT6krlQqeGipzQn9Tvf/XfYJ
 L4GRdnsXIbcPzDPxY6ShSx9iJFoJXTECJaK9osVie8OkW1suhxzVu18e3iyCmOxFB3eK
 Hp3SfMmTgcNM+xNqNlNUotrwR7VV4WfED8GcOiQ/Kx1GTKauH7OoELe5E8lmMn3brHwG
 Ln1GhLr3frIxoHYuiiG7Wk/SZhU5KYHVO1chCz6+iB/8priJIzlxBTC9Vuz2GUEvcbv9
 ecS5Qei8NUy6FOffXiPM3YiXvvtS/b/wRBRgbky/TEiBYBXGVGyO6Yr64VsIm3LN3kBp
 EllQ==
X-Gm-Message-State: AOAM5310rsf0DCHsF4DJnw/zRrd6OPYOmxASs7RpkqBGfxSRibxbnMur
 Dg14qhsrcjTk2a6EGWTVnGtrkp0jehOKYDJuAfxL5bdfFJmDXUMwrd+l7bhAy7pwGncTGRDfTH+
 LIIaQ1vdiyeQZ2co=
X-Received: by 2002:a5d:55ce:: with SMTP id i14mr26235424wrw.224.1642538426920; 
 Tue, 18 Jan 2022 12:40:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWg7x4z9KezdX3tK3XJwOE2n16M5y9b1oSmxPZC7OHzjeSjZKZJtm8m5D35YehdCXZSqZ8Rw==
X-Received: by 2002:a5d:55ce:: with SMTP id i14mr26235406wrw.224.1642538426647; 
 Tue, 18 Jan 2022 12:40:26 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c8sm10844621wri.69.2022.01.18.12.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 12:40:26 -0800 (PST)
Subject: Re: [PATCH 6/6] tests/qtest/libqos: Add pci-arm and add a pci-arm
 producer in arm-virt machine
To: Paolo Bonzini <pbonzini@redhat.com>, eric.auger.pro@gmail.com,
 thuth@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
References: <20220110211915.2749082-1-eric.auger@redhat.com>
 <20220110211915.2749082-7-eric.auger@redhat.com>
 <664ba767-31c9-a8cd-066c-04c4ae874029@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <31c65b49-b364-a8d4-8aa6-48cc9743406b@redhat.com>
Date: Tue, 18 Jan 2022 21:40:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <664ba767-31c9-a8cd-066c-04c4ae874029@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On 1/15/22 5:01 PM, Paolo Bonzini wrote:
> On 1/10/22 22:19, Eric Auger wrote:
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
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> Hey Eric,
>
> it's great to have gpex support in libqos/qgraph!  On the next
> versions you might also Cc Emanuele since he was the author of the
> framework.
sure!
>
>> ---
>>   tests/qtest/libqos/arm-virt-machine.c |  47 +++++-
>>   tests/qtest/libqos/meson.build        |   3 +
>>   tests/qtest/libqos/pci-arm.c          | 219 ++++++++++++++++++++++++++
>>   tests/qtest/libqos/pci-arm.h          |  56 +++++++
>>   tests/qtest/libqos/pci.h              |   1 +
>>   tests/qtest/libqos/qgraph.c           |   7 +
>>   tests/qtest/libqos/qgraph.h           |  15 ++
>>   7 files changed, 344 insertions(+), 4 deletions(-)
>>   create mode 100644 tests/qtest/libqos/pci-arm.c
>>   create mode 100644 tests/qtest/libqos/pci-arm.h
>>
>> diff --git a/tests/qtest/libqos/arm-virt-machine.c
>> b/tests/qtest/libqos/arm-virt-machine.c
>> index e0f59322845..130c45c51e2 100644
>> --- a/tests/qtest/libqos/arm-virt-machine.c
>> +++ b/tests/qtest/libqos/arm-virt-machine.c
>> @@ -22,6 +22,8 @@
>>   #include "malloc.h"
>>   #include "qgraph.h"
>>   #include "virtio-mmio.h"
>> +#include "pci-arm.h"
>> +#include "hw/pci/pci_regs.h"
>>     #define ARM_PAGE_SIZE               4096
>>   #define VIRTIO_MMIO_BASE_ADDR       0x0A003E00
>> @@ -30,13 +32,40 @@
>>   #define VIRTIO_MMIO_SIZE            0x00000200
>>     typedef struct QVirtMachine QVirtMachine;
>> +typedef struct QGenericPCIHost QGenericPCIHost;
>> +
>> +struct QGenericPCIHost {
>> +    QOSGraphObject obj;
>> +    QPCIBusARM pci;
>> +};
>
> You can rename QPCIBusARM to QGenericPCIBus and move QGenericPCIHost
> to the same file.  There's nothing ARM specific in either file, and
> nothing specific to -M virt in QGenericPCIHost.

done
>
>>   struct QVirtMachine {
>>       QOSGraphObject obj;
>>       QGuestAllocator alloc;
>>       QVirtioMMIODevice virtio_mmio;
>> +    QGenericPCIHost bridge;
>>   };
>>   +/* QGenericPCIHost */
>> +
>> +static QOSGraphObject *generic_pcihost_get_device(void *obj, const
>> char *device)
>> +{
>> +    QGenericPCIHost *host = obj;
>> +    if (!g_strcmp0(device, "pci-bus-arm")) {
>> +        return &host->pci.obj;
>> +    }
>> +    fprintf(stderr, "%s not present in generic-pcihost\n", device);
>> +    g_assert_not_reached();
>> +}
>> +
>> +static void qos_create_generic_pcihost(QGenericPCIHost *host,
>> +                                       QTestState *qts,
>> +                                       QGuestAllocator *alloc)
>> +{
>> +    host->obj.get_device = generic_pcihost_get_device;
>> +    qpci_init_arm(&host->pci, qts, alloc, false);
>> +}
>> +
>>   static void virt_destructor(QOSGraphObject *obj)
>>   {
>>       QVirtMachine *machine = (QVirtMachine *) obj;
>
> This should also be in the same file as the bus implementation.
done
>
>> +    qos_node_create_driver("generic-pcihost", NULL);
>> +    qos_node_contains("generic-pcihost", "pci-bus-arm", NULL);
>
> This too, with a new libqos_init.
done
>
>
>> +static uint8_t qpci_arm_config_readb(QPCIBus *bus, int devfn,
>> uint8_t offset)
>> +{
>> +    uint64_t addr = bus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12)
>> | offset);
>
> ecam_alloc_ptr should be in QPCIBusARM (to be renamed to
> QGenericPCIBus), which you can retrieve from the "bus" QPCIBus* via
> container_of.
done
>
>> diff --git a/tests/qtest/libqos/pci-arm.h b/tests/qtest/libqos/pci-arm.h
>> new file mode 100644
>> index 00000000000..8cd49ec2969
>> --- /dev/null
>> +++ b/tests/qtest/libqos/pci-arm.h
>> @@ -0,0 +1,56 @@
>> +/*
>> + * libqos PCI bindings for ARM
>> + *
>> + * Copyright Red Hat Inc., 2021
>> + *
>> + * Authors:
>> + *  Eric Auger   <eric.auger@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2
>> or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef LIBQOS_PCI_ARM_H
>> +#define LIBQOS_PCI_ARM_H
>> +
>> +#include "pci.h"
>> +#include "malloc.h"
>> +#include "qgraph.h"
>> +
>> +typedef struct QPCIBusARM {
>> +    QOSGraphObject obj;
>> +    QPCIBus bus;
>> +    uint64_t gpex_pio_base;
>> +} QPCIBusARM;
>> +
>> +/*
>> + * qpci_init_arm():
>> + * @ret: A valid QPCIBusARM * pointer
>> + * @qts: The %QTestState for this ARM machine
>> + * @alloc: A previously initialized @alloc providing memory for @qts
>> + * @bool: devices can be hotplugged on this bus
>> + *
>> + * This function initializes an already allocated
>> + * QPCIBusARM object.
>> + */
>> +void qpci_init_arm(QPCIBusARM *ret, QTestState *qts,
>> +                   QGuestAllocator *alloc, bool hotpluggable);
>> +
>> +/*
>> + * qpci_arm_new():
>> + * @qts: The %QTestState for this ARM machine
>> + * @alloc: A previously initialized @alloc providing memory for @qts
>> + * @hotpluggable: the pci bus is hotpluggable
>> + *
>> + * This function creates a new QPCIBusARM object,
>> + * and properly initialize its fields.
>> + *
>> + * Returns the QPCIBus *bus field of a newly
>> + * allocated QPCIBusARM.
>> + */
>> +QPCIBus *qpci_new_arm(QTestState *qts, QGuestAllocator *alloc,
>> +                      bool hotpluggable);
>> +
>> +void qpci_free_arm(QPCIBus *bus);
>
> These two functions are not needed now.  I'm not opposing non-qgraph
> tests that use the gpex device, but the functions should be introduced
> together with their users.
removed
>
>> diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
>> index 109ff04e1e8..e03fad35241 100644
>> --- a/tests/qtest/libqos/qgraph.c
>> +++ b/tests/qtest/libqos/qgraph.c
>> @@ -667,6 +667,13 @@ void qos_node_produces(const char *producer,
>> const char *interface)
>>       add_edge(producer, interface, QEDGE_PRODUCES, NULL);
>>   }
>>   +void qos_node_produces_opts(const char *producer, const char
>> *interface,
>> +                            QOSGraphEdgeOptions *opts)
>> +{
>> +    create_interface(interface);
>> +    add_edge(producer, interface, QEDGE_PRODUCES, opts);
>> +}
>> +
>
> This is not needed, I think.
indeed, removed.

So you should see the above comments taken into account in just posted v2.

Thank you for the review!

Eric
>
> Paolo
>


