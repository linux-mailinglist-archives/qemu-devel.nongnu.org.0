Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D249401C12
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:01:55 +0200 (CEST)
Received: from localhost ([::1]:36636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEG1-0004ks-TP
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNEDK-0003Jx-Au
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:59:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNEDG-0005Ii-5c
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630933140;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=68bwVpFKahrM50hSGUpReSsTo90w/169ImvUGcjJ8Sc=;
 b=WYIPVKTVE5eGwKpRThmn8fp209M2XTcdJgKq5pHsQxXxqya0VZMQXvavqqIhHVdRTXNlAd
 uH+ccF3dVLGZLDRwsgulb2Q35OhEOybqea5RSDdzviJd+k5LvgF6XXutg/bRZ3kRW/Yagk
 zx+x3YiK/cjNgNbq432vTvtoePMHJGM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-Q4B2OpfgOb-9rnh0DTy8wQ-1; Mon, 06 Sep 2021 08:58:59 -0400
X-MC-Unique: Q4B2OpfgOb-9rnh0DTy8wQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso1169347wrn.19
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 05:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=68bwVpFKahrM50hSGUpReSsTo90w/169ImvUGcjJ8Sc=;
 b=kRToYH5NzxwYYNo0q8nkSPGoJOOwj8ivawoQxQCh3BqcUgp12r4/7mGch+9Ei1PA4E
 8JyjP6WfpdkphJucXIkkgtyzgLuywZLdzNGIG0oFAxyUlpHoiRVvxhGalhroHY4bkidW
 cWDAuGpVXjdVQUO76qjzBhmuzXJF4Z+qZmXY+kT8D7Hy9l8mgE5QcWW7ZoYWXd1cdz4E
 dTrwVZIctz+Vac83b4KkqdtOaIE05C0pwkgRFo2/eKFXOsG6cZGJF+2lY7ZRE1X08V8R
 JV8tQfHJFDp57cj7EUT7b5kVyCr2nYylfmNxbDYm0fLVmO5tsLaTZZAHCwanhjgwY1PF
 pOBA==
X-Gm-Message-State: AOAM531jJQo/RTn9XUklyWF6UPzn0OXPrgloKbZHxxZkAJDJ3UspWn25
 K6YknaIQdTc8hNX4IgJo2KH9QlB1qfvmJT8yGVKm8RMb8HZEOpFllRPqUIJadiOYTfpFY8NyZvw
 RERdXOIY9M7Xgp28=
X-Received: by 2002:a05:600c:4109:: with SMTP id
 j9mr11433821wmi.88.1630933138301; 
 Mon, 06 Sep 2021 05:58:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaa+uR5nstQdVdcjzLtSoHoU3lW/TIywpQ6AlaIKa/yOjTkWNWqCB40zqIAQ+k94fclY7wkQ==
X-Received: by 2002:a05:600c:4109:: with SMTP id
 j9mr11433802wmi.88.1630933138043; 
 Mon, 06 Sep 2021 05:58:58 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id u17sm7067122wmm.33.2021.09.06.05.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 05:58:57 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] hw/acpi: Add VIOT table
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-3-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <e3280e20-ca86-23a6-7ae4-6817b9a424e9@redhat.com>
Date: Mon, 6 Sep 2021 14:58:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-3-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> Add a function that generates a Virtual I/O Translation table (VIOT),
> describing the topology of paravirtual IOMMUs. The table is created when
> instantiating a virtio-iommu device. It contains a virtio-iommu node and
> PCI Range nodes for endpoints managed by the IOMMU. By default, a single
> node describes all PCI devices. When passing the "default_bus_bypass_iommu"
> machine option and "bypass_iommu" PXB option, only buses that do not
> bypass the IOMMU are described by PCI Range nodes.

You may consider to add a test for the new VIOT table (However this may
be added afterwards). See tests/qtest/bios-tables-test.c for the process
and examples.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/acpi/Kconfig     |   4 ++
>  hw/acpi/viot.h      |  13 +++++
>  hw/acpi/viot.c      | 112 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/meson.build |   1 +
>  4 files changed, 130 insertions(+)
>  create mode 100644 hw/acpi/viot.h
>  create mode 100644 hw/acpi/viot.c
>
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index cfc4ede8d9..abad79c103 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -41,6 +41,10 @@ config ACPI_VMGENID
>      default y
>      depends on PC
>  
> +config ACPI_VIOT
> +    bool
> +    depends on ACPI
> +
>  config ACPI_HW_REDUCED
>      bool
>      select ACPI
> diff --git a/hw/acpi/viot.h b/hw/acpi/viot.h
> new file mode 100644
> index 0000000000..4cef29a640
> --- /dev/null
> +++ b/hw/acpi/viot.h
> @@ -0,0 +1,13 @@
> +/*
> + * ACPI Virtual I/O Translation Table implementation
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef VIOT_H
> +#define VIOT_H
> +
> +void build_viot(GArray *table_data, BIOSLinker *linker,
> +                uint16_t virtio_iommu_bdf, const char *oem_id,
> +                const char *oem_table_id);
> +
> +#endif /* VIOT_H */
> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> new file mode 100644
> index 0000000000..81bb2e93ff
> --- /dev/null
> +++ b/hw/acpi/viot.c
> @@ -0,0 +1,112 @@
> +/*
> + * ACPI Virtual I/O Translation table implementation
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/viot.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_host.h"
> +
> +struct viot_pci_ranges {
> +    GArray *blob;
> +    size_t count;
> +    uint16_t output_node;
> +};
> +
> +/* Build PCI range for a given PCI host bridge */
chapter 1.3
> +static int viot_host_bridges(Object *obj, void *opaque)
> +{
> +    struct viot_pci_ranges *pci_ranges = opaque;
> +    GArray *blob = pci_ranges->blob;
> +
> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> +
> +        if (bus && !pci_bus_bypass_iommu(bus)) {
> +            int min_bus, max_bus;
> +
> +            pci_bus_range(bus, &min_bus, &max_bus);
> +
> +            /* Type */
> +            build_append_int_noprefix(blob, ACPI_VIOT_NODE_PCI_RANGE, 1);
s/ACPI_VIOT_NODE_PCI_RANGE/1
> +            /* Reserved */
> +            build_append_int_noprefix(blob, 0, 1);
> +            /* Length */
> +            build_append_int_noprefix(blob, sizeof(AcpiViotPciRange), 2);
hardcode the size
> +            /* Endpoint start */
> +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
> +            /* PCI Segment start */
> +            build_append_int_noprefix(blob, 0, 2);
> +            /* PCI Segment end */
> +            build_append_int_noprefix(blob, 0, 2);
> +            /* PCI BDF start */
> +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 2);
> +            /* PCI BDF end */
> +            build_append_int_noprefix(blob, PCI_BUILD_BDF(max_bus, 0xff), 2);
> +            /* Output node */
> +            build_append_int_noprefix(blob, pci_ranges->output_node, 2);
> +            /* Reserved */
> +            build_append_int_noprefix(blob, 0, 6);
> +
> +            pci_ranges->count++;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
> + * endpoints.
Add a link to the doc + Table refs?

https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf

> + */
> +void build_viot(GArray *table_data, BIOSLinker *linker,
> +                uint16_t virtio_iommu_bdf, const char *oem_id,
> +                const char *oem_table_id)
> +{
> +    /* virtio-iommu node follows the header */
> +    int viommu_off = sizeof(AcpiViot);
> +    int viot_start = table_data->len;
> +    struct viot_pci_ranges pci_ranges = {
> +        .output_node = viommu_off,
> +        .blob = g_array_new(false, true, 1),
> +    };
> +
> +    /* Build the list of PCI ranges that this viommu manages */
> +    object_child_foreach_recursive(object_get_root(), viot_host_bridges,
> +                                   &pci_ranges);
> +
> +    /* VIOT header */
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
Depending on the order of landing, this may be replaced by Igor's

acpi_init_table() and associated with acpi_table_composed().

> +    /* Node count */
> +    build_append_int_noprefix(table_data, pci_ranges.count + 1, 2);
> +    /* Node offset */
> +    build_append_int_noprefix(table_data, viommu_off, 2);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 8);
> +
> +    /* Virtio-iommu based on virtio-pci */
chapter 1.1. By the way may be worth adding table titles in the spec.
> +    /* Type */
> +    build_append_int_noprefix(table_data, ACPI_VIOT_NODE_VIRTIO_IOMMU_PCI, 1);
s/ACPI_VIOT_NODE_VIRTIO_IOMMU_PCI/3 or put the defines here instead of
in the header.
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 1);
> +    /* Length */
> +    build_append_int_noprefix(table_data, sizeof(AcpiViotVirtioIommuPci), 2);
hardcode the size of AcpiViotVirtioIommuPci
> +    /* PCI Segment */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* PCI BDF number */
> +    build_append_int_noprefix(table_data, virtio_iommu_bdf, 2);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 8);
> +
> +    /* PCI ranges found above */
> +    g_array_append_vals(table_data, pci_ranges.blob->data,
> +                        pci_ranges.blob->len);
> +    g_array_free(pci_ranges.blob, true);
> +
> +    build_header(linker, table_data, (void *)(table_data->data + viot_start),
> +                 "VIOT", table_data->len - viot_start, 0, oem_id, oem_table_id);

acpi_table_composed() or whatever its new name

> +}
> +
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index 29f804d13e..a510988b27 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -16,6 +16,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device
>  acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
there is a conflict with main now if I did not mess up things

<<<<<<< HEAD
acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false:
files('acpi-pci-hotplug-stub.c'))
=======
acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
>>>>>>> hw/acpi: Add VIOT table

Thanks

Eric


>  acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))


