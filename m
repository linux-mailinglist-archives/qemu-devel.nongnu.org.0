Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D37D59FE58
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:28:58 +0200 (CEST)
Received: from localhost ([::1]:60548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQsJM-0007zI-RI
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oQsFG-0005Hd-Ms
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:24:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oQsFD-0005cU-72
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661354674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8WgNE2rCB0PR0bN1Vq+8qpFr+fQgsTJ6xgQrGhi80U=;
 b=Fp3T9jhOSeqWsVP0zBPqrWiljlsCvUpN4gn1luBx+yACmCuiBPkkDci/Ms+DaaDe2W2gVe
 bzAAUTeuDn7qOii6Q9nScWxFvOMkYwPD3bkhODoRXGgydvwLcokv8pLzVvAM0+5FJ2OMv0
 ApzjgoRvDzlJQvXFGqw1jn4hjcowoEc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-iMFMSzO5PtCfBLPrj4tt8w-1; Wed, 24 Aug 2022 11:24:33 -0400
X-MC-Unique: iMFMSzO5PtCfBLPrj4tt8w-1
Received: by mail-ed1-f70.google.com with SMTP id
 h17-20020a05640250d100b00446d1825c9fso5536999edb.14
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=a8WgNE2rCB0PR0bN1Vq+8qpFr+fQgsTJ6xgQrGhi80U=;
 b=wXo4fqJ+6k/0NF0QcwXh9r8SpeRejqkhvG7afkhFWz438gdnxfmqEZyi2W3QU53MCr
 PT4SjWOBPj6Ve+WF2u8t8EQpW1yLHfRfGcnzHa1VhleBnyt/Kuny/Ak4df5d2YlAlD7V
 elT4GYovu1qpZEyR4LWRVs6Vv2LGrND+kOHaCbMXKAf0MdWR56OMLyKmgzh4QiqJnCEj
 5+2xYC3kWsgdmDbgw5EEAEvuE2euerhd6duHhyagg5n0Pnlx65cIaLNSeP5vNUw96Ln2
 bQ23ikj1ulN0uNP7yUG9ugmL2TpqHgPxcF9Tm6j5dnEXKFpowHGXCiWRQPQ0ZSgv3mXn
 SoKQ==
X-Gm-Message-State: ACgBeo3Z9MQ4/EEfSzNmUjiO9D7UaqUa+xj7YVFQIeM56+bFxLQLvY34
 YNP4mxaAnDsJBjv+PfKZ2klUCVLYTBUb/8J7BOUHFoJ/tlIZY/DQF43SAfA27Zsr3FIXTMWkEs0
 qBo5U6UNNRRqvSs0=
X-Received: by 2002:a17:907:8a01:b0:731:4316:b0ad with SMTP id
 sc1-20020a1709078a0100b007314316b0admr3354614ejc.477.1661354671394; 
 Wed, 24 Aug 2022 08:24:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7zEDx4mBoMQzxKuuyS1iIlmyPWsEgSz6v+b1sNFBE8yalefata5NdG9Rxznsd9WPZGmmvYxA==
X-Received: by 2002:a17:907:8a01:b0:731:4316:b0ad with SMTP id
 sc1-20020a1709078a0100b007314316b0admr3354591ejc.477.1661354671157; 
 Wed, 24 Aug 2022 08:24:31 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a056402165800b0043df042bfc6sm3226574edx.47.2022.08.24.08.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:24:30 -0700 (PDT)
Date: Wed, 24 Aug 2022 17:24:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, yvugenfi@redhat.com,
 jusual@redhat.com, kkostiuk@redhat.com, ybendito@redhat.com
Subject: Re: [PATCH 2/4] hw/acpi: set ATS capability explicitly per pcie
 root port
Message-ID: <20220824172429.058281c4@redhat.com>
In-Reply-To: <20220822090811.427029-3-ani@anisinha.ca>
References: <20220822090811.427029-1-ani@anisinha.ca>
 <20220822090811.427029-3-ani@anisinha.ca>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 22 Aug 2022 14:38:09 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> Currently the bit 0 of the flags field of Root Port ATS capability report=
ing
> structure sub-table under the DMAR table is set to 1. This indicates ALL_=
PORTS,
> thus enabling ATS capability for all pcie roots without the ability to tu=
rn off
> ATS for some ports and leaving ATS on for others.
>=20
> This change clears the bit 0 of the flags field of the above structure and
> explicitly adds scopes for every pcie root port in the structure so that =
ATS
> is enabled for all of them. In future, we might add new attribite to the =
root
> ports so that we can selectively enable ATS for some and leave ATS off for
> others.

Thanks, it was worth a try,
unfortunately since we are shooting in dark this time it was a miss.


> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> Suggested-by: Michael Tsirkin <mst@redhat.com>
> ---
>  hw/i386/acpi-build.c | 74 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 72 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 0355bd3dda..9c5a555536 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -60,6 +60,7 @@
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/ich9.h"
>  #include "hw/pci/pci_bus.h"
> +#include "hw/pci/pcie_port.h"
>  #include "hw/pci-host/q35.h"
>  #include "hw/i386/x86-iommu.h"
> =20
> @@ -2118,6 +2119,60 @@ dmar_host_bridges(Object *obj, void *opaque)
>      return 0;
>  }
> =20
> +/*
> + * Insert DMAR scope for PCIE root ports
> + */
> +static void
> +insert_pcie_root_port_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
> +{
> +    const size_t device_scope_size =3D 6 + 2;
> +                                   /* device scope structure + 1 path en=
try */
> +    GArray *scope_blob =3D opaque;
> +
> +    /*
> +     * We are only interested in PCIE root ports. We can extend
> +     * this to check for specific properties of PCIE root ports and based
> +     * on that remove some ports from having ATS capability.
> +     */
> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCIE_ROOT_PORT)) {
> +        return;
> +    }
> +
> +    /* Dmar Scope Type: 0x02 for all PCIE root ports */
> +    build_append_int_noprefix(scope_blob, 0x02, 1);
> +
> +    /* length */
> +    build_append_int_noprefix(scope_blob, device_scope_size, 1);
> +    /* reserved */
> +    build_append_int_noprefix(scope_blob, 0, 2);
> +    /* enumeration_id */
> +    build_append_int_noprefix(scope_blob, 0, 1);
> +    /* bus */
> +    build_append_int_noprefix(scope_blob, pci_bus_num(bus), 1);
> +    /* device */
> +    build_append_int_noprefix(scope_blob, PCI_SLOT(dev->devfn), 1);
> +    /* function */
> +    build_append_int_noprefix(scope_blob, PCI_FUNC(dev->devfn), 1);
> +}
> +
> +/* For a given PCI host bridge, walk and insert DMAR scope */
> +static int
> +dmar_pcie_root_ports(Object *obj, void *opaque)
> +{
> +    GArray *scope_blob =3D opaque;
> +
> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        PCIBus *bus =3D PCI_HOST_BRIDGE(obj)->bus;
> +
> +        if (bus && !pci_bus_bypass_iommu(bus)) {
> +            pci_for_each_device_under_bus(bus, insert_pcie_root_port_sco=
pe,
> +                                          scope_blob);
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  /*
>   * Intel =C2=AE Virtualization Technology for Directed I/O
>   * Architecture Specification. Revision 3.3
> @@ -2190,11 +2245,26 @@ build_dmar_q35(GArray *table_data, BIOSLinker *li=
nker, const char *oem_id,
> =20
>      if (iommu->dt_supported) {
>          /* 8.5 Root Port ATS Capability Reporting Structure */
> +        /*
> +         * A PCI bus walk, for each PCIE root port.
> +         * Since we did not enable ALL_PORTS bit in the flags above, we
> +         * need to add the scope for each pcie root port explicitly
> +         * that are attached to bus0 with iommu enabled.
> +         */
> +        scope_blob =3D g_array_new(false, true, 1);
> +        object_child_foreach_recursive(object_get_root(),
> +                                       dmar_pcie_root_ports, scope_blob);
> +
>          build_append_int_noprefix(table_data, 2, 2); /* Type */
> -        build_append_int_noprefix(table_data, 8, 2); /* Length */
> -        build_append_int_noprefix(table_data, 1 /* ALL_PORTS */, 1); /* =
Flags */
> +        build_append_int_noprefix(table_data,
> +                                  8 + scope_blob->len, 2); /* Length */
> +        build_append_int_noprefix(table_data, 0, 1); /* Flags */
>          build_append_int_noprefix(table_data, 0, 1); /* Reserved */
>          build_append_int_noprefix(table_data, 0, 2); /* Segment Number */
> +
> +        /* now add the scope to the sub-table */
> +        g_array_append_vals(table_data, scope_blob->data, scope_blob->le=
n);
> +        g_array_free(scope_blob, true);
>      }
> =20
>      acpi_table_end(linker, &table);


