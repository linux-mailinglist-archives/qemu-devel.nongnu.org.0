Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C082F403749
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 11:52:18 +0200 (CEST)
Received: from localhost ([::1]:53630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuFd-00089f-TP
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 05:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNuDS-0006RZ-FA
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:50:02 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:44921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNuDQ-0007En-LO
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:50:02 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1038359wml.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RqEVGoYp0CsB3m9INu/2TqECTBzYNXbDBTSGLpHKkSU=;
 b=ITkCBPOlIuEulOfEsWLjuOlVSFil4sNjosGgNJMkIm4HbpAAm4A7eZqFewNfEgPjSh
 hvs/O/0Oq1NTrdqIkJi0H398u0pT1hkSYc17SOzzBXg7xTWIi0kOkF1HseCoQ882vHLw
 xMwqGhkh/BgQx5lLzIN5VW9rA38OI23DUmI/YjKGeQojn+oEOQDsTzmg7b2IUsybtH6b
 YrF09Jet97WhX9x4kwddeaDCZqO56jq0Pol+o2mUqAOvVr55FVu1A7VAP5P6qWeONkFo
 xjiwqbbO1p9ZOPcor66eanabR1yldiwPQgAE8ymYXh1reSGy52BP1MhKhrOXOJB9SuWk
 zj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RqEVGoYp0CsB3m9INu/2TqECTBzYNXbDBTSGLpHKkSU=;
 b=EL5N36QMnapCsqiZQtjLY307evSNpXe53Htt5sJS3aupiuNNlyr7FKMQ1timRIMdAY
 JR31TL3XbKu3qE2qHL6xpU0IrGuU4k20K/3hqqCzuL/9fMpRsnV6Aav5MvjlvgT/ubJi
 y7DUT4RSMEljeTO0ITjp+XUV7ZT1l2yArElEhi77x7w4V7RC/Z9YgKOTcWO9DQwqkbAy
 IqpLtSfaz5ZatZqKUaxDi8R3oPQSs/p1jndXaYDEbEwFOHmdw2XZPevHu9G0ldQqpxTr
 YfaOqw2t/MddxH109zB/ECS6HSpdcxdIxfALeXL3VJ4HXHc5b9U8FR8OInNAGHBgtyHn
 xVyw==
X-Gm-Message-State: AOAM531tduGNjazVY2Jy0HZBltVWu8zV5c2U7+x1JS6FKX1tWf/RHgml
 ITtZc/CFm1j0Y4mJgssya4xQAg==
X-Google-Smtp-Source: ABdhPJxRP5Tax4OGC98gSSIO5DHdkDGUN/FENGmXixmyc01bGJkZ+b5d0OcEOe9tgPNGtY5G5u6KkQ==
X-Received: by 2002:a1c:9a8e:: with SMTP id c136mr1300789wme.191.1631094598928; 
 Wed, 08 Sep 2021 02:49:58 -0700 (PDT)
Received: from larix (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id i5sm1422168wmq.17.2021.09.08.02.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 02:49:58 -0700 (PDT)
Date: Wed, 8 Sep 2021 10:52:08 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/8] hw/acpi: Add VIOT table
Message-ID: <YTiHyBQFzv4ZXAOZ@larix>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-3-jean-philippe@linaro.org>
 <e3280e20-ca86-23a6-7ae4-6817b9a424e9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3280e20-ca86-23a6-7ae4-6817b9a424e9@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06, 2021 at 02:58:55PM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> > Add a function that generates a Virtual I/O Translation table (VIOT),
> > describing the topology of paravirtual IOMMUs. The table is created when
> > instantiating a virtio-iommu device. It contains a virtio-iommu node and
> > PCI Range nodes for endpoints managed by the IOMMU. By default, a single
> > node describes all PCI devices. When passing the "default_bus_bypass_iommu"
> > machine option and "bypass_iommu" PXB option, only buses that do not
> > bypass the IOMMU are described by PCI Range nodes.
> 
> You may consider to add a test for the new VIOT table (However this may
> be added afterwards). See tests/qtest/bios-tables-test.c for the process
> and examples.

Sure, it adds 5 patches to the series

> > +/*
> > + * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
> > + * endpoints.
> Add a link to the doc + Table refs?
> 
> https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf

No, this document is only temporary until the next ACPI release. Although
the titles and text should be the same, I don't know the refs in the final
document but they will be different

> 
> > + */
> > +void build_viot(GArray *table_data, BIOSLinker *linker,
> > +                uint16_t virtio_iommu_bdf, const char *oem_id,
> > +                const char *oem_table_id)
> > +{
> > +    /* virtio-iommu node follows the header */
> > +    int viommu_off = sizeof(AcpiViot);
> > +    int viot_start = table_data->len;
> > +    struct viot_pci_ranges pci_ranges = {
> > +        .output_node = viommu_off,
> > +        .blob = g_array_new(false, true, 1),
> > +    };
> > +
> > +    /* Build the list of PCI ranges that this viommu manages */
> > +    object_child_foreach_recursive(object_get_root(), viot_host_bridges,
> > +                                   &pci_ranges);
> > +
> > +    /* VIOT header */
> > +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> Depending on the order of landing, this may be replaced by Igor's
> 
> acpi_init_table() and associated with acpi_table_composed().

Ok I'll prepare that as a fixup, and send it or squash it after the ACPI
series lands

> <<<<<<< HEAD
> acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
> acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
> acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false:
> files('acpi-pci-hotplug-stub.c'))
> =======
> acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
> acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
> >>>>>>> hw/acpi: Add VIOT table

Indeed, fixed

Thanks,
Jean

