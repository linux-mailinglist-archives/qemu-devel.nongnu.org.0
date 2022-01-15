Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644B748F7B5
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 17:03:42 +0100 (CET)
Received: from localhost ([::1]:37000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8lWn-0001pg-1P
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 11:03:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8lUg-000828-4O; Sat, 15 Jan 2022 11:01:30 -0500
Received: from [2a00:1450:4864:20::334] (port=52178
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8lUc-0002wg-Op; Sat, 15 Jan 2022 11:01:29 -0500
Received: by mail-wm1-x334.google.com with SMTP id c2so6247012wml.1;
 Sat, 15 Jan 2022 08:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZsZJr6oNFuHIPJmhcNDjs4YnC4pxwEbTfOTx0TwlpWo=;
 b=M06db3rWM3j399Xq1Th9sNS1DscbTzO7jzkb33+0tbstE0S9ZttImf2oysFQOZpGUj
 zGKGqFwKwG6K3khNjLCQ4PD/tAgxaukKZF0mVMr2EVDN/wdk9/gYQ1Nz+yXxxV0G4T6Z
 SPvD5kHUd2Y6EBbLVLgm1KFWtc/dC5+9YTfC37SbME6ScIX9RhrTWYzLfPNYDySaJJV4
 NtVirxTVSODqSDznpTU1VhE460qYFO7vjJvHIoeTdCh8QMby89badhoIaTKcmTrHhVPh
 8/rpAK6xHsDcDU9Nr+mnS1GOKYQCL+n18lOXIQ01IyipbGjzYYGFT2xjLGV5L4MVlq5o
 7TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZsZJr6oNFuHIPJmhcNDjs4YnC4pxwEbTfOTx0TwlpWo=;
 b=xSStNebyDDiGBOt996Fh+wbR6vkSx59jXJcy8MGXO86nWI5v5jQRSz2l6GBdeF1uqH
 4qIq46/kFbrDMHljHtuddSL7QJ7QuhMFEFfdajbrJgnpDJyi/3nIdJqx8pXCNrcFLDPb
 VA5EnB7tCb7bOvGXcQpSPuDyPU38GKX9LNUv0rSXzd1TTHXcKJsXdt4ceX75qsgq3cYL
 pjQgJotuRM80gZdSbr52ERcETSpXFN2ApJccJF4O1vjmu6a/pUJWJI68j1suqXInpyUV
 TDAsaLRVTwPKZE88eKLvdu/7kjswouJCumciCgOmw5KrZCNouxd1DogBLYvTqqYxPsCf
 7Chw==
X-Gm-Message-State: AOAM530Bnr2upUclMf8iYKG6gen4UVrkoLFH8g/VhMjtmV3ZSy5+WvTR
 7+4N2XDL87WrXiFQPeRsCWg=
X-Google-Smtp-Source: ABdhPJwWqmfBmcazdCl4qyud/7qi+Y2NbtHwvrbaShCmsooHdkC6dnpVO5kQ82Ps/eTjqDPHuqnDyg==
X-Received: by 2002:a5d:668a:: with SMTP id l10mr12550581wru.92.1642262471977; 
 Sat, 15 Jan 2022 08:01:11 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id q6sm9034147wrr.88.2022.01.15.08.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jan 2022 08:01:11 -0800 (PST)
Message-ID: <664ba767-31c9-a8cd-066c-04c4ae874029@redhat.com>
Date: Sat, 15 Jan 2022 17:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 6/6] tests/qtest/libqos: Add pci-arm and add a pci-arm
 producer in arm-virt machine
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 thuth@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
References: <20220110211915.2749082-1-eric.auger@redhat.com>
 <20220110211915.2749082-7-eric.auger@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220110211915.2749082-7-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 22:19, Eric Auger wrote:
> Up to now the virt-machine node contains a virtio-mmio node.
> However no driver produces any PCI interface node. Hence, PCI
> tests cannot be run with aarch64 binary.
> 
> Add a GPEX driver node that produces a pci interface node. This latter
> then can be consumed by all the pci tests. One of the first motivation
> was to be able to run the virtio-iommu-pci tests.
> 
> We still face an issue with pci hotplug tests as hotplug cannot happen
> on the pcie root bus and require a generic root port. This will be
> addressed later on.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Hey Eric,

it's great to have gpex support in libqos/qgraph!  On the next versions 
you might also Cc Emanuele since he was the author of the framework.

> ---
>   tests/qtest/libqos/arm-virt-machine.c |  47 +++++-
>   tests/qtest/libqos/meson.build        |   3 +
>   tests/qtest/libqos/pci-arm.c          | 219 ++++++++++++++++++++++++++
>   tests/qtest/libqos/pci-arm.h          |  56 +++++++
>   tests/qtest/libqos/pci.h              |   1 +
>   tests/qtest/libqos/qgraph.c           |   7 +
>   tests/qtest/libqos/qgraph.h           |  15 ++
>   7 files changed, 344 insertions(+), 4 deletions(-)
>   create mode 100644 tests/qtest/libqos/pci-arm.c
>   create mode 100644 tests/qtest/libqos/pci-arm.h
> 
> diff --git a/tests/qtest/libqos/arm-virt-machine.c b/tests/qtest/libqos/arm-virt-machine.c
> index e0f59322845..130c45c51e2 100644
> --- a/tests/qtest/libqos/arm-virt-machine.c
> +++ b/tests/qtest/libqos/arm-virt-machine.c
> @@ -22,6 +22,8 @@
>   #include "malloc.h"
>   #include "qgraph.h"
>   #include "virtio-mmio.h"
> +#include "pci-arm.h"
> +#include "hw/pci/pci_regs.h"
>   
>   #define ARM_PAGE_SIZE               4096
>   #define VIRTIO_MMIO_BASE_ADDR       0x0A003E00
> @@ -30,13 +32,40 @@
>   #define VIRTIO_MMIO_SIZE            0x00000200
>   
>   typedef struct QVirtMachine QVirtMachine;
> +typedef struct QGenericPCIHost QGenericPCIHost;
> +
> +struct QGenericPCIHost {
> +    QOSGraphObject obj;
> +    QPCIBusARM pci;
> +};

You can rename QPCIBusARM to QGenericPCIBus and move QGenericPCIHost to 
the same file.  There's nothing ARM specific in either file, and nothing 
specific to -M virt in QGenericPCIHost.

>   struct QVirtMachine {
>       QOSGraphObject obj;
>       QGuestAllocator alloc;
>       QVirtioMMIODevice virtio_mmio;
> +    QGenericPCIHost bridge;
>   };
>   
> +/* QGenericPCIHost */
> +
> +static QOSGraphObject *generic_pcihost_get_device(void *obj, const char *device)
> +{
> +    QGenericPCIHost *host = obj;
> +    if (!g_strcmp0(device, "pci-bus-arm")) {
> +        return &host->pci.obj;
> +    }
> +    fprintf(stderr, "%s not present in generic-pcihost\n", device);
> +    g_assert_not_reached();
> +}
> +
> +static void qos_create_generic_pcihost(QGenericPCIHost *host,
> +                                       QTestState *qts,
> +                                       QGuestAllocator *alloc)
> +{
> +    host->obj.get_device = generic_pcihost_get_device;
> +    qpci_init_arm(&host->pci, qts, alloc, false);
> +}
> +
>   static void virt_destructor(QOSGraphObject *obj)
>   {
>       QVirtMachine *machine = (QVirtMachine *) obj;

This should also be in the same file as the bus implementation.

> +    qos_node_create_driver("generic-pcihost", NULL);
> +    qos_node_contains("generic-pcihost", "pci-bus-arm", NULL);

This too, with a new libqos_init.


> +static uint8_t qpci_arm_config_readb(QPCIBus *bus, int devfn, uint8_t offset)
> +{
> +    uint64_t addr = bus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);

ecam_alloc_ptr should be in QPCIBusARM (to be renamed to 
QGenericPCIBus), which you can retrieve from the "bus" QPCIBus* via 
container_of.

> diff --git a/tests/qtest/libqos/pci-arm.h b/tests/qtest/libqos/pci-arm.h
> new file mode 100644
> index 00000000000..8cd49ec2969
> --- /dev/null
> +++ b/tests/qtest/libqos/pci-arm.h
> @@ -0,0 +1,56 @@
> +/*
> + * libqos PCI bindings for ARM
> + *
> + * Copyright Red Hat Inc., 2021
> + *
> + * Authors:
> + *  Eric Auger   <eric.auger@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef LIBQOS_PCI_ARM_H
> +#define LIBQOS_PCI_ARM_H
> +
> +#include "pci.h"
> +#include "malloc.h"
> +#include "qgraph.h"
> +
> +typedef struct QPCIBusARM {
> +    QOSGraphObject obj;
> +    QPCIBus bus;
> +    uint64_t gpex_pio_base;
> +} QPCIBusARM;
> +
> +/*
> + * qpci_init_arm():
> + * @ret: A valid QPCIBusARM * pointer
> + * @qts: The %QTestState for this ARM machine
> + * @alloc: A previously initialized @alloc providing memory for @qts
> + * @bool: devices can be hotplugged on this bus
> + *
> + * This function initializes an already allocated
> + * QPCIBusARM object.
> + */
> +void qpci_init_arm(QPCIBusARM *ret, QTestState *qts,
> +                   QGuestAllocator *alloc, bool hotpluggable);
> +
> +/*
> + * qpci_arm_new():
> + * @qts: The %QTestState for this ARM machine
> + * @alloc: A previously initialized @alloc providing memory for @qts
> + * @hotpluggable: the pci bus is hotpluggable
> + *
> + * This function creates a new QPCIBusARM object,
> + * and properly initialize its fields.
> + *
> + * Returns the QPCIBus *bus field of a newly
> + * allocated QPCIBusARM.
> + */
> +QPCIBus *qpci_new_arm(QTestState *qts, QGuestAllocator *alloc,
> +                      bool hotpluggable);
> +
> +void qpci_free_arm(QPCIBus *bus);

These two functions are not needed now.  I'm not opposing non-qgraph 
tests that use the gpex device, but the functions should be introduced 
together with their users.

> diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
> index 109ff04e1e8..e03fad35241 100644
> --- a/tests/qtest/libqos/qgraph.c
> +++ b/tests/qtest/libqos/qgraph.c
> @@ -667,6 +667,13 @@ void qos_node_produces(const char *producer, const char *interface)
>       add_edge(producer, interface, QEDGE_PRODUCES, NULL);
>   }
>   
> +void qos_node_produces_opts(const char *producer, const char *interface,
> +                            QOSGraphEdgeOptions *opts)
> +{
> +    create_interface(interface);
> +    add_edge(producer, interface, QEDGE_PRODUCES, opts);
> +}
> +

This is not needed, I think.

Paolo

