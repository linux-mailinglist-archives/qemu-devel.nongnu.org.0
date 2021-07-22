Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833AC3D2B69
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:51:03 +0200 (CEST)
Received: from localhost ([::1]:51164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cqc-0003S2-KH
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6cpN-0002CJ-LU
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6cpK-0008Rg-QS
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IZPFHWpgWHRlHvVXzk5nAxcthqG8oDTLwvwcmnYdA2Q=;
 b=NkgmQhCzua7YULzAMTvq/OmR8SRhuZJLhTn1m79qMEuoltRV1iQFEJfr5+VVYUYdkdGbbQ
 /vmV6RIZ3QOEPj5v+mm0m1PO+nv4GKQtf0Vwa1b5kD4oYdGYpRPLDghgdD+PryiM52FUUK
 +3limMFfDk8rSl7e3yhLhk80Q28BaGU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-k1Jzch0UMFCEUaXtlZNh7g-1; Thu, 22 Jul 2021 13:49:39 -0400
X-MC-Unique: k1Jzch0UMFCEUaXtlZNh7g-1
Received: by mail-ej1-f71.google.com with SMTP id
 u12-20020a17090617ccb029051ab3a0d553so2070308eje.6
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IZPFHWpgWHRlHvVXzk5nAxcthqG8oDTLwvwcmnYdA2Q=;
 b=S/GCxK+oQMn7DuE1Be9nAERofTGOznamEe2k4WsR9FZM2sB2hE3JvHN/V8pLUhDKY4
 8yTEZgVLPDZmWXhBDAtVySUSAx9LHDT2d9WvDSNjraLCK1KNSiGiT3hYPPOcoyPF87h3
 xqsEzyYHteSlzvGjO6k3JhHiQX5qi+MHh8+b47RpK04+yb5YuyW7GmJbj0OjXcGgT3h8
 ZeK0u7ofaHC5nlvnxaaPBBiuzfxF8+WndczYXW2Ovntkz5xvvgiYFZ7J0+fDhEKy0wii
 +T7BAWBOIehzj773noclqtVOqjT7k9MmO+bcjudcYy+nmTIs46n6YBjzglG8Rjy7EkLF
 6kBQ==
X-Gm-Message-State: AOAM531A14yGhZcsaxmjO/Kt31K+P8/RYCDt8emON0sgp9NFi44KwYXr
 ZycHIm03V/JJ4OaZcsnE2R33b098iUFnC6bikrS03bkO+PJtPwwFnvKuD1lqftck69eH/q7fGoN
 INHtWdG7tFDF7vMQ=
X-Received: by 2002:a05:6402:60e:: with SMTP id
 n14mr900992edv.363.1626976178482; 
 Thu, 22 Jul 2021 10:49:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMw2B+7jlb55tDGAAcM4yBQzQGpMhKJqPxP4TzuqjfdDXORvcTsOIuXRx4ncQi3VYB37haWw==
X-Received: by 2002:a05:6402:60e:: with SMTP id
 n14mr900963edv.363.1626976178209; 
 Thu, 22 Jul 2021 10:49:38 -0700 (PDT)
Received: from redhat.com ([2.55.134.65])
 by smtp.gmail.com with ESMTPSA id dd24sm12854292edb.45.2021.07.22.10.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:49:37 -0700 (PDT)
Date: Thu, 22 Jul 2021 13:49:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/2] acpi: x86: pcihp: add support hotplug on
 multifunction bridges
Message-ID: <20210722133738-mutt-send-email-mst@kernel.org>
References: <20210722105945.2080428-1-imammedo@redhat.com>
 <20210722105945.2080428-3-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722105945.2080428-3-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, peter.maydell@linaro.org,
 jusual@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 06:59:45AM -0400, Igor Mammedov wrote:
> Commit 17858a1695 (hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35)
> switched PCI hotplug from native to ACPI one by default.
> 
> That however breaks ihotplug on following CLI that used to work:

s/ihotplug/hotplug/ ?

>    -nodefaults -machine q35 \
>    -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
>    -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2
> 
> where PCI device is hotplugged to pcie-root-port-1 with error on guest side:
> 
>   ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND (20201113/psargs-330)
>   ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
>   ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
>   ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01] (20201113/evgpe-515)
> 
> cause is that QEMU's ACPI hotplug never supported functions other then 0
> and due to bug it was generating notification entries for not described
> functions.
> 
> Technically there is no reason not to describe cold-plugged bridges
> (root ports) on functions other then 0, as they similaraly to bridge
> on function 0 are unpluggable.
> 
> Fix consists of describing cold-plugged bridges[root ports] on functions
> other than 0.


I would add: since we need to describe multifunction devices


> 
> Fixes: 17858a169508609ca9063c544833e5a1adeb7b52

use short hash and include subject within ("subject here") please

> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reported-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/i386/acpi-build.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b40e284b72..77cb7a338a 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -364,7 +364,7 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
>      int32_t devfn = PCI_DEVFN(slot, 0);
>  
>      if_ctx = aml_if(aml_and(aml_arg(0), aml_int(0x1U << slot), NULL));
> -    aml_append(if_ctx, aml_notify(aml_name("S%.02X", devfn), aml_arg(1)));
> +    aml_append(if_ctx, aml_notify(aml_name("^S%.03X", devfn), aml_arg(1)));
>      aml_append(method, if_ctx);
>  }
>

why are you adding a parent prefix here? anything wrong with
relying on search rules?
Seems like an unrelated change.

Also there's always 8 bit in devfn. Why do we need an extra 0?

  
> @@ -389,18 +389,26 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>          PCIDeviceClass *pc;
>          PCIDevice *pdev = bus->devices[devfn];
>          int slot = PCI_SLOT(devfn);
> +        int func = PCI_FUNC(devfn);
> +        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
> +        int adr = slot << 16 | func;
>          bool hotplug_enabled_dev;
>          bool bridge_in_acpi;
>          bool cold_plugged_bridge;
>  
>          if (!pdev) {
> -            if (bsel) { /* add hotplug slots for non present devices */
> +            /*
> +             * add hotplug slots for non present devices.
> +             * hotplug is supported only for non-multifunction device
> +             * so generate device description only for function 0
> +             */
> +            if (bsel && !PCI_FUNC(devfn)) {

replace with func here and elsewhere?

>                  if (pci_bus_is_express(bus) && slot > 0) {
>                      break;
>                  }
> -                dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
> +                dev = aml_device("S%.03X", devfn);
>                  aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
> -                aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
> +                aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
>                  method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
>                  aml_append(method,
>                      aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
> @@ -436,9 +444,18 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>              continue;
>          }
>  
> +        /*
> +         * allow describing coldplugged bridges in ACPI even if they are not
> +         * on function 0, as they are not unpluggale, for all other devices


unpluggable 

> +         * generate description only for function 0 per slot
> +         */
> +        if (PCI_FUNC(devfn) && !bridge_in_acpi) {
> +            continue;
> +        }
> +
>          /* start to compose PCI slot descriptor */
> -        dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
> -        aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
> +        dev = aml_device("S%.03X", devfn);
> +        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
>  
>          if (bsel) {
>              /*
> @@ -529,7 +546,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>                      continue;
>                  }
>  
> -                aml_append(method, aml_name("^S%.02X.PCNT",
> +                aml_append(method, aml_name("^S%.03X.PCNT",
>                                              sec->parent_dev->devfn));
>              }
>          }
> -- 
> 2.27.0


