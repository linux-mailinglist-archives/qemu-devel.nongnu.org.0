Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B27E2E70EA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 14:38:34 +0100 (CET)
Received: from localhost ([::1]:37086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuFCq-0004ih-N2
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 08:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuFBa-0004HB-QD
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuFBX-0006ZS-Q8
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609249030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6TKpvYTpvS3VM6DAN9nCcFqkKxDQCNPv8mOLZREvspU=;
 b=EI/Gt18p0Jg/FqcFvDfxitq0J5kKbBoDxabisLl/VeUhRXXdvxD+eZTndXF1jr1lASZb13
 jmYg8MCAmXoXwHcNxGnAJzUbyKmI8LtqMIfLue7WhMx0zdXYinJRVJuhVtbdHHWE0XjbuK
 G5geiXir0M858XLeTrBaxfZbofzoKiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-wga7LaPmMgirCfWHIgG0sg-1; Tue, 29 Dec 2020 08:37:09 -0500
X-MC-Unique: wga7LaPmMgirCfWHIgG0sg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 710B3107ACF8;
 Tue, 29 Dec 2020 13:37:07 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 431312C167;
 Tue, 29 Dec 2020 13:36:58 +0000 (UTC)
Date: Tue, 29 Dec 2020 14:36:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v3 2/8] acpi: Add addr offset in build_crs
Message-ID: <20201229143657.1e00faf5@redhat.com>
In-Reply-To: <20201223090836.9075-3-cenjiahui@huawei.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-3-cenjiahui@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: xieyingtai@huawei.com, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Dec 2020 17:08:30 +0800
Jiahui Cen <cenjiahui@huawei.com> wrote:

> AML needs Address Translation offset to describe how a bridge translates
> addresses accross the bridge when using an address descriptor, and
> especially on ARM, the translation offset of pio resource is usually
> non zero.

could you point out where in patch [8/8] it becomes non zero?

> 
> Therefore, it's necessary to pass offset for pio, mmio32, mmio64 and bus
> number into build_crs.
> 
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 18 ++++++++++--------
>  hw/i386/acpi-build.c        |  3 ++-
>  hw/pci-host/gpex-acpi.c     |  3 ++-
>  include/hw/acpi/aml-build.h |  4 +++-
>  4 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index f976aa667b..7b6ebb0cc8 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2076,7 +2076,9 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>                   tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
>  }
>  
> -Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
> +Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
> +               uint32_t mmio32_offset, uint64_t mmio64_offset,
> +               uint16_t bus_nr_offset)
>  {
>      Aml *crs = aml_resource_template();
>      CrsRangeSet temp_range_set;
> @@ -2189,10 +2191,10 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>      for (i = 0; i < temp_range_set.io_ranges->len; i++) {
>          entry = g_ptr_array_index(temp_range_set.io_ranges, i);
>          aml_append(crs,
> -                   aml_word_io(AML_MIN_FIXED, AML_MAX_FIXED,
> -                               AML_POS_DECODE, AML_ENTIRE_RANGE,
> -                               0, entry->base, entry->limit, 0,
> -                               entry->limit - entry->base + 1));
> +                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED,
> +                                AML_POS_DECODE, AML_ENTIRE_RANGE,
> +                                0, entry->base, entry->limit, io_offset,
> +                                entry->limit - entry->base + 1));
>          crs_range_insert(range_set->io_ranges, entry->base, entry->limit);
>      }
>  
> @@ -2205,7 +2207,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>                     aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
>                                      AML_MAX_FIXED, AML_NON_CACHEABLE,
>                                      AML_READ_WRITE,
> -                                    0, entry->base, entry->limit, 0,
> +                                    0, entry->base, entry->limit, mmio32_offset,
>                                      entry->limit - entry->base + 1));
>          crs_range_insert(range_set->mem_ranges, entry->base, entry->limit);
>      }
> @@ -2217,7 +2219,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>                     aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
>                                      AML_MAX_FIXED, AML_NON_CACHEABLE,
>                                      AML_READ_WRITE,
> -                                    0, entry->base, entry->limit, 0,
> +                                    0, entry->base, entry->limit, mmio64_offset,
>                                      entry->limit - entry->base + 1));
>          crs_range_insert(range_set->mem_64bit_ranges,
>                           entry->base, entry->limit);
> @@ -2230,7 +2232,7 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
>                              0,
>                              pci_bus_num(host->bus),
>                              max_bus,
> -                            0,
> +                            bus_nr_offset,
>                              max_bus - pci_bus_num(host->bus) + 1));
>  
>      return crs;
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f18b71dea9..f56d699c7f 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1360,7 +1360,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              }
>  
>              aml_append(dev, build_prt(false));
> -            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
> +            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
> +                            0, 0, 0, 0);
>              aml_append(dev, aml_name_decl("_CRS", crs));
>              aml_append(scope, dev);
>              aml_append(dsdt, scope);
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 7f20ee1c98..11b3db8f71 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -168,7 +168,8 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>               * 1. The resources the pci-brige/pcie-root-port need.
>               * 2. The resources the devices behind pxb need.
>               */
> -            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
> +            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
> +                            cfg->pio.base, 0, 0, 0);
>              aml_append(dev, aml_name_decl("_CRS", crs));
>  
>              acpi_dsdt_add_pci_osc(dev);
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index e727bea1bc..54a5aec4d7 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -452,7 +452,9 @@ void crs_replace_with_free_ranges(GPtrArray *ranges,
>  void crs_range_set_init(CrsRangeSet *range_set);
>  void crs_range_set_free(CrsRangeSet *range_set);
>  
> -Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set);
> +Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
> +               uint32_t mmio32_offset, uint64_t mmio64_offset,
> +               uint16_t bus_nr_offset);
>  
>  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>                         uint64_t len, int node, MemoryAffinityFlags flags);


