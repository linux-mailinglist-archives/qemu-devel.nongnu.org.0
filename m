Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EE452EE2D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 16:31:15 +0200 (CEST)
Received: from localhost ([::1]:47642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns3es-0003y0-FV
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 10:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ns3cY-0003Gl-6e
 for qemu-devel@nongnu.org; Fri, 20 May 2022 10:28:50 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ns3cW-0004p8-EX
 for qemu-devel@nongnu.org; Fri, 20 May 2022 10:28:49 -0400
Received: by mail-ed1-x52d.google.com with SMTP id eg11so10984651edb.11
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 07:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TsPetF85W3uANq0kX+QUef4ngWmdiCVM3E5uXbjXvH8=;
 b=S3YYjyJWEAK1R0tGMyhGCBJmHO9OqpwaTPxZe0M1U6cHUoCtAip9uCUtkCqxzrT/xy
 FhEjEzqR8C/ZvHLpDMhfT9O76J66zDgaDWQhN7sSTDazHAIJgrj8PvFXK28GxLP+bF8X
 jL/C0HfHXRHTjqoPmUeTqlcup62A6omUFjOdrpvI/zngLVETdRNOSdTX0rCiJogegQ9N
 4lib6VDsipO8kceE+e0bW/lxDWXnVvaSBbYErVIZgcVY2shPJhSD2E+sTJlq3uU1qh7S
 oIjzRhhNt+vGEyYtyFD3/kRH/lzo4hqhSvjNaLiiPPew+1t2D5WCGfAzV3bN5JK2pdGa
 tjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TsPetF85W3uANq0kX+QUef4ngWmdiCVM3E5uXbjXvH8=;
 b=Xo91Pv0yJEK4AeJxOeMtOwzg1OF2of8Irsy/wGyheHfZbfqmAVYN1jCOmOchaHf4pn
 b/okYjqwTGGSGkNLQq1rJuVGceIcBx+EkpdZdQ/4yAbRbKxD1TNbsuWWXnbHXAb//zvL
 Ss/hvSJEu/HWLymnAsw53i6Yhm+UNish/aBfljVP+TwD7/lKWs9OXFIUu2IJjxSi4k7a
 kUJv8HrSK6zn18mcIX43/qnv69dTCmo3tV3id94UBe4DMmiG4KwuCqs9PPatZ1QBUL4/
 ZYEFl5yMyWwIZVq4yMuRHofeStTDSZUiA4HgXXQgudx16ofdDvqSN+DBDsx4YGYfThwP
 fwUQ==
X-Gm-Message-State: AOAM533hTF+TA9mOShD27IAIJQfaXgbXdCOqgs3XCya/qVb9J4XPRo14
 6E8A9t6aYz9U5ZuPFbq+HHweVMQjMcXzsiw/0Vi9Ug==
X-Google-Smtp-Source: ABdhPJzdpKZR7DlPjaJq+rwz+D9RzmMulhhFIve0PpYJgeDtVI5M2Hyrr89MiIq7Fu0jQEc4JSRwXMVZi7/q290DG78=
X-Received: by 2002:a05:6402:4001:b0:42b:212:57c3 with SMTP id
 d1-20020a056402400100b0042b021257c3mr8681427eda.109.1653056922742; Fri, 20
 May 2022 07:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
 <20220518110839.8681-4-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220518110839.8681-4-mark.cave-ayland@ilande.co.uk>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 20 May 2022 19:58:31 +0530
Message-ID: <CAARzgwxeEWEbK7zmufnt2UbyTGmLvo2pP9MxWCujur4Csqk6MA@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/acpi/viot: build array of PCI host bridges before
 generating VIOT ACPI table
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: mst@redhat.com, imammedo@redhat.com, jean-philippe@linaro.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 18, 2022 at 4:39 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Perform the generation of the VIOT ACPI table in 2 separate passes: the first pass
> enumerates all of the PCI host bridges and adds the min_bus and max_bus information
> to an array.
>
> Once this is done the VIOT table header is generated using the size of the array
> to calculate the node count, which means it is no longer necessary to use a
> sub-array to hold the PCI host bridge range information along with viommu_off.
>
> Finally the PCI host bridge array is iterated again to add the required entries
> to the final VIOT ACPI table.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/acpi/viot.c | 42 ++++++++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 18 deletions(-)
>
> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> index 662124812f..ce3b7b8c75 100644
> --- a/hw/acpi/viot.c
> +++ b/hw/acpi/viot.c
> @@ -10,10 +10,9 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
>
> -struct viot_pci_ranges {
> -    GArray *blob;
> -    size_t count;
> -    uint16_t output_node;
> +struct viot_pci_host_range {
> +    int min_bus;
> +    int max_bus;
>  };
>
>  static void build_pci_host_range(GArray *table_data, int min_bus, int max_bus,
> @@ -44,8 +43,7 @@ static void build_pci_host_range(GArray *table_data, int min_bus, int max_bus,
>  /* Build PCI range for a given PCI host bridge */
>  static int pci_host_bridges(Object *obj, void *opaque)
>  {
> -    struct viot_pci_ranges *pci_ranges = opaque;
> -    GArray *blob = pci_ranges->blob;
> +    GArray *pci_host_ranges = opaque;
>
>      if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
>          PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> @@ -55,9 +53,11 @@ static int pci_host_bridges(Object *obj, void *opaque)
>
>              pci_bus_range(bus, &min_bus, &max_bus);
>
> -            build_pci_host_range(blob, min_bus, max_bus,
> -                                 pci_ranges->output_node);
> -            pci_ranges->count++;
> +            struct viot_pci_host_range pci_host_range = {
> +                .min_bus = min_bus,
> +                .max_bus = max_bus,
> +            };
> +            g_array_append_val(pci_host_ranges, pci_host_range);
>          }
>      }
>
> @@ -78,19 +78,19 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
>      int viommu_off = 48;
>      AcpiTable table = { .sig = "VIOT", .rev = 0,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
> -    struct viot_pci_ranges pci_ranges = {
> -        .output_node = viommu_off,
> -        .blob = g_array_new(false, true /* clear */, 1),
> -    };
> +    GArray *pci_host_ranges =  g_array_new(false, true,
> +                                           sizeof(struct viot_pci_host_range));
> +    struct viot_pci_host_range *pci_host_range;
> +    int i;
>
>      /* Build the list of PCI ranges that this viommu manages */
>      object_child_foreach_recursive(OBJECT(ms), pci_host_bridges,
> -                                   &pci_ranges);
> +                                   pci_host_ranges);
>
>      /* ACPI table header */
>      acpi_table_begin(&table, table_data);
>      /* Node count */
> -    build_append_int_noprefix(table_data, pci_ranges.count + 1, 2);
> +    build_append_int_noprefix(table_data, pci_host_ranges->len + 1, 2);
>      /* Node offset */
>      build_append_int_noprefix(table_data, viommu_off, 2);
>      /* Reserved */
> @@ -111,9 +111,15 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
>      build_append_int_noprefix(table_data, 0, 8);
>
>      /* PCI ranges found above */
> -    g_array_append_vals(table_data, pci_ranges.blob->data,
> -                        pci_ranges.blob->len);
> -    g_array_free(pci_ranges.blob, true);
> +    for (i = 0; i < pci_host_ranges->len; i++) {
> +        pci_host_range = &g_array_index(pci_host_ranges,
> +                                        struct viot_pci_host_range, i);
> +
> +        build_pci_host_range(table_data, pci_host_range->min_bus,
> +                             pci_host_range->max_bus, viommu_off);
> +    }
> +
> +    g_array_free(pci_host_ranges, true);
>
>      acpi_table_end(linker, &table);
>  }
> --
> 2.20.1
>

