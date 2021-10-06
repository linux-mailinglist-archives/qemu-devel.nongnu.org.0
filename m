Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BFE423995
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 10:18:39 +0200 (CEST)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY28M-0003J8-1I
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 04:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY1zx-0004D1-IB
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY1zv-0007z7-Dp
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633507794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wGePxJjKsTF83i15XAt8Kjg3a+B/IS9Hw6Z8RvGlxk=;
 b=ApP+dpibT9GoU7WZbZAC0OMTZU636ULhWIIRYQCUH+wxHN5XuLgS2+cl0NjVDBUuA/3QK1
 seI/o81ENagHRYxzYGDDsS6fk2Rzjq39OtNZotEGYtgOQIat66ZgmrJ1iDCDgW/hO1jZ3K
 lRofvcTzfVt7II4zuqunZXdAcBCA59E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-_8-E-kn6P1yj0n_Q9ttSjA-1; Wed, 06 Oct 2021 04:09:53 -0400
X-MC-Unique: _8-E-kn6P1yj0n_Q9ttSjA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so1350381wrd.8
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 01:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/wGePxJjKsTF83i15XAt8Kjg3a+B/IS9Hw6Z8RvGlxk=;
 b=CGhC0iZcV4VmXIn6mFEdDP5ZZ/J+BXgmeWemhIzuAQ5C/a0nXph+A/ogvG4CX/O4l4
 7mfuTJU154nxLmeLmkTuLQLLiF2/zSM5FycW7ZAT6rJ+C/yXN3UMiruvhl4AWYVi67qF
 tJ6YF8wzCzTIsEHToOBFY+xq8j7U/m0EZZdhNwZL1XRegpE0BrgDO1xnGD+7ci1PL21m
 +OCKFZudQYnQyXCSBTb2sOhE5GEt9r/3/ZDBOhHKAg9BbbOUJnKsoB0o4g+jY4bV9ycO
 KxV5ZDtrRsZ1fhprTzz/j8u834inH0ALzQ3bDqY3J2mCES/W5RiMoetr5UUJoRSxaaU6
 8skQ==
X-Gm-Message-State: AOAM532tYBQi66v8c4piKwT51GBIfxUQ8qM4k/rE4jYkSNufKkDiA5F4
 LYeMJQJrLxmd+nXWDl8WOBhOpSsKoNlTMhAcUvNvSGxcWRztUE9yZ1NLl8dQwMoGRh17nG1pqEW
 Wk1TFFMCk3EiRoAM=
X-Received: by 2002:a05:600c:1c07:: with SMTP id
 j7mr8447708wms.28.1633507792205; 
 Wed, 06 Oct 2021 01:09:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjW0FKtDm9r9vaa3O8iFZzqfCsdb+hurXiPGgHikHFBlxia0fW6jK/EJd2uGHJ5KZoWHJojQ==
X-Received: by 2002:a05:600c:1c07:: with SMTP id
 j7mr8447692wms.28.1633507791938; 
 Wed, 06 Oct 2021 01:09:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id n186sm4482859wme.31.2021.10.06.01.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:09:51 -0700 (PDT)
Date: Wed, 6 Oct 2021 10:09:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 01/11] hw/acpi: Add VIOT table
Message-ID: <20211006100950.12798a07@redhat.com>
In-Reply-To: <20211001173358.863017-2-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-2-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Cornelia Huck <cohuck@redhat.com>,
 ehabkost@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  1 Oct 2021 18:33:49 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Add a function that generates a Virtual I/O Translation table (VIOT),
> describing the topology of paravirtual IOMMUs. The table is created when
> instantiating a virtio-iommu device. It contains a virtio-iommu node and

perhaps
s/when instantiating ... ./if a virtio-iommu device present/

> PCI Range nodes for endpoints managed by the IOMMU. By default, a single
> node describes all PCI devices. When passing the "default_bus_bypass_iommu"
> machine option and "bypass_iommu" PXB option, only buses that do not
> bypass the IOMMU are described by PCI Range nodes.


modulo comments, patch looks fine to me from ACPI point of view.

but I don't know if values used for describing PCI structures
make any sense so this might need an ACK from a person who knows
PCI innards better.

> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/acpi/viot.h      |  13 +++++
>  hw/acpi/viot.c      | 112 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/Kconfig     |   4 ++
>  hw/acpi/meson.build |   1 +
>  4 files changed, 130 insertions(+)
>  create mode 100644 hw/acpi/viot.h
>  create mode 100644 hw/acpi/viot.c
> 
> diff --git a/hw/acpi/viot.h b/hw/acpi/viot.h
> new file mode 100644
> index 0000000000..9fe565bb87
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
> +void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
> +                uint16_t virtio_iommu_bdf, const char *oem_id,
> +                const char *oem_table_id);
> +
> +#endif /* VIOT_H */
> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> new file mode 100644
> index 0000000000..e33d468e11
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
> +static int build_pci_range_node(Object *obj, void *opaque)
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
> +            /* Type (PCI range) */
see [1] below

> +            build_append_int_noprefix(blob, 1, 1);
> +            /* Reserved */
> +            build_append_int_noprefix(blob, 0, 1);
> +            /* Length */
> +            build_append_int_noprefix(blob, 24, 2);

spec should be fixed to state length value for fixed length structures
like it's done in ACPI specs, I who we should poke at to make this happen.

zzzz
> +            /* Endpoint start */
> +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
> +            /* PCI Segment start */
> +            build_append_int_noprefix(blob, 0, 2);
> +            /* PCI Segment end */
> +            build_append_int_noprefix(blob, 0, 2);
zzzz
see comment [2]

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
> + */

this comment needs to state spec name/version, otherwise it's not clear
what code below is based on (example: build_dmar_q35).

Also since there is no final spec yet and spec doesn't have permanent
hosting place (i.e. hosted by one of specs org), I'd consider
link in cover letter 'dead' and not suitable for long term use.
So we should shovel spec docs/specs and point to it in this comment

> +void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
> +                uint16_t virtio_iommu_bdf, const char *oem_id,
> +                const char *oem_table_id)
> +{
> +    /* The virtio-iommu node follows the 48-bytes header */
> +    int viommu_off = 48;
> +    AcpiTable table = { .sig = "VIOT", .rev = 0,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> +    struct viot_pci_ranges pci_ranges = {
> +        .output_node = viommu_off,
> +        .blob = g_array_new(false, true /* clear */, 1),
> +    };
> +
> +    /* Build the list of PCI ranges that this viommu manages */
> +    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
> +                                   &pci_ranges);
> +
> +    /* ACPI table header */
> +    acpi_table_begin(&table, table_data);
> +    /* Node count */
> +    build_append_int_noprefix(table_data, pci_ranges.count + 1, 2);
> +    /* Node offset */
> +    build_append_int_noprefix(table_data, viommu_off, 2);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 8);
> +
> +    /* Virtio-iommu node */
> +    /* Type (virtio-pci IOMMU)  */

(1)
/* Type */
> +    build_append_int_noprefix(table_data, 3, 1);
  s:3,:3 /* virtio-pci IOMMU */,:

check-patch will spit out warning but that kind comment
is common practice with ACPI code

> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 1);
> +    /* Length */
> +    build_append_int_noprefix(table_data, 16, 2);
> +    /* PCI Segment */
> +    build_append_int_noprefix(table_data, 0, 2);
(2)
can we fetch _SEG value from device instead of hard-codding value here?

I might be obvious to PCI folks,
but it would be better have at least a comment explaining
where these values come from

Michael,
what do you think?

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
> +    acpi_table_end(linker, &table);
> +}
> +
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 3b5e118c54..622b0b50b7 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -51,6 +51,10 @@ config ACPI_VMGENID
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
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index 7d8c0eb43e..adf6347bc4 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -20,6 +20,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files(
>  acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))


