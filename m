Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1986D2DD862
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:33:47 +0100 (CET)
Received: from localhost ([::1]:48250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpy5x-0001Bw-Td
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kpy4w-0000kO-Me
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:32:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kpy4u-0000Ph-8X
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608229959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tsrkf/y1s0+LXljB0epVJtRkKQRtlYmlCcO1eXSPCkI=;
 b=Rn68PCS5rmqJ4tEzu+xxJoUwsvu15LhsPgSAep37CqF+MIPvBDqOkj6dCx9GOMPJcMSGba
 UU9nDubraZX/4s9GOOL2xIQKF0YXX1XiionsHjOCt4/bghV7uCn6SWyfzk5ktLBQZvJVwO
 Oirh/GtPTKOlHql/e8fFcA5qZUMcbE4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-_703lCSJNk-MDNMhIadzIA-1; Thu, 17 Dec 2020 13:32:37 -0500
X-MC-Unique: _703lCSJNk-MDNMhIadzIA-1
Received: by mail-wr1-f71.google.com with SMTP id q2so7689084wrp.4
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 10:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tsrkf/y1s0+LXljB0epVJtRkKQRtlYmlCcO1eXSPCkI=;
 b=Jmpz1Qtp5cSRmKW5Uy9GF8n6RULj2nbtmXtP1y2U+q160zDm8DzYnrBcm7TAXNObRV
 jJJAKwwSdugo10mhcBfB+FoOjHHB09feHugqG6fRcuVbx3pJ5KFI0tsy7jrcvdUA63j/
 NwkAlpOxO8tjAbxZvHkXz58WO8D183+rs44+oWxS1BMEsi/kYM57xk2vf/qh9Qal7TY8
 c9LuV+/POVhX8IO35ZJOIetwoIvep/8LKlph24eT6GrGNOFFMPlcopNYF8UjMMr92gkZ
 pqnSvCErPVLMvpREqjWOuRHcWVs5IGGzXJldlPAyl39ci1v4m7tNJnMjOXzyztB6CjcW
 H7Eg==
X-Gm-Message-State: AOAM532cgoCn67Hm2n+xW6SFv6feXEUzrieOPc+EkqQtGt1vB+UyIUWa
 /2lxMPJXM8ey2OwlgxgL8dW3oyCFRYuKa5vtV43mjzmeroMYF3M95HIosbz6C9vnkD9hiEf8eMS
 oG65FD2ZLNyKP+Qw=
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr638984wmh.85.1608229956593;
 Thu, 17 Dec 2020 10:32:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt+j2EpvCXet6rg5k0IPrukY07eE0ZPJW29VA66unXO+O1KJb1Y6KF7zRZfXeX0BnCDfP6Zw==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr638968wmh.85.1608229956365;
 Thu, 17 Dec 2020 10:32:36 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id r2sm9843096wrn.83.2020.12.17.10.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:32:35 -0800 (PST)
Date: Thu, 17 Dec 2020 13:32:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH] acpi: Add addr_trans in build_crs
Message-ID: <20201217132949-mutt-send-email-mst@kernel.org>
References: <20201217132747.4744-1-cenjiahui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201217132747.4744-1-cenjiahui@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 09:27:47PM +0800, Jiahui Cen wrote:
> AML needs Address Translation offset to describe how a bridge translates
> addresses accross the bridge when using an address descriptor, and
> especially on ARM, the translation offset of pio resource is usually
> non zero.
> 
> Therefore, it's necessary to pass addr_trans for pio, mmio32 and mmio64
> into build_crs.
> 
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 15 ++++++++-------
>  hw/i386/acpi-build.c        |  3 ++-
>  hw/pci-host/gpex-acpi.c     |  3 ++-
>  include/hw/acpi/aml-build.h |  4 +++-
>  4 files changed, 15 insertions(+), 10 deletions(-)


Doesn't this result in any changes to expected files for tests?

> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index f976aa667b..be077b3ab6 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2076,7 +2076,8 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>                   tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
>  }
>  
> -Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
> +Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set,
> +               hwaddr io_trans, hwaddr mmio32_trans, hwaddr mmio64_trans)


More of io_offset etc I think.

>  {
>      Aml *crs = aml_resource_template();
>      CrsRangeSet temp_range_set;
> @@ -2189,10 +2190,10 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>      for (i = 0; i < temp_range_set.io_ranges->len; i++) {
>          entry = g_ptr_array_index(temp_range_set.io_ranges, i);
>          aml_append(crs,
> -                   aml_word_io(AML_MIN_FIXED, AML_MAX_FIXED,
> -                               AML_POS_DECODE, AML_ENTIRE_RANGE,
> -                               0, entry->base, entry->limit, 0,
> -                               entry->limit - entry->base + 1));
> +                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED,
> +                                AML_POS_DECODE, AML_ENTIRE_RANGE,
> +                                0, entry->base, entry->limit, io_trans,
> +                                entry->limit - entry->base + 1));
>          crs_range_insert(range_set->io_ranges, entry->base, entry->limit);
>      }
>  
> @@ -2205,7 +2206,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>                     aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
>                                      AML_MAX_FIXED, AML_NON_CACHEABLE,
>                                      AML_READ_WRITE,
> -                                    0, entry->base, entry->limit, 0,
> +                                    0, entry->base, entry->limit, mmio32_trans,
>                                      entry->limit - entry->base + 1));
>          crs_range_insert(range_set->mem_ranges, entry->base, entry->limit);
>      }
> @@ -2217,7 +2218,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>                     aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
>                                      AML_MAX_FIXED, AML_NON_CACHEABLE,
>                                      AML_READ_WRITE,
> -                                    0, entry->base, entry->limit, 0,
> +                                    0, entry->base, entry->limit, mmio64_trans,
>                                      entry->limit - entry->base + 1));
>          crs_range_insert(range_set->mem_64bit_ranges,
>                           entry->base, entry->limit);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f18b71dea9..7461ccad2c 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1360,7 +1360,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              }
>  
>              aml_append(dev, build_prt(false));
> -            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
> +            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
> +                            0, 0, 0);
>              aml_append(dev, aml_name_decl("_CRS", crs));
>              aml_append(scope, dev);
>              aml_append(dsdt, scope);
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 7f20ee1c98..071aa11b5c 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -168,7 +168,8 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>               * 1. The resources the pci-brige/pcie-root-port need.
>               * 2. The resources the devices behind pxb need.
>               */
> -            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
> +            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
> +                            cfg->pio.base, 0, 0);
>              aml_append(dev, aml_name_decl("_CRS", crs));
>  
>              acpi_dsdt_add_pci_osc(dev);
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index e727bea1bc..ff3dcb703d 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -1,6 +1,7 @@
>  #ifndef HW_ACPI_AML_BUILD_H
>  #define HW_ACPI_AML_BUILD_H
>  
> +#include "exec/hwaddr.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  
> @@ -452,7 +453,8 @@ void crs_replace_with_free_ranges(GPtrArray *ranges,
>  void crs_range_set_init(CrsRangeSet *range_set);
>  void crs_range_set_free(CrsRangeSet *range_set);
>  
> -Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set);
> +Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set,
> +               hwaddr io_trans, hwaddr mmio32_trans, hwaddr mmio64_trans);
>  
>  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>                         uint64_t len, int node, MemoryAffinityFlags flags);
> -- 
> 2.28.0


