Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9852CDC9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 10:02:03 +0200 (CEST)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrb6f-0002A7-RC
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 04:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nraw7-0006JN-NP
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:51:08 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nraw2-0001o0-RL
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:51:07 -0400
Received: by mail-ed1-x531.google.com with SMTP id en5so5995516edb.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 00:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ilk3DT7PucRdWo5pPlhPaT0vhyvSwy19Bk3y5DiP588=;
 b=tfktKtxtDKuTASpEihOhkvW29geEaTtloRxbJnFhE2m5DSV+ix9UWp29TAUo9KPsEc
 LBysTGePBmRuRKLEdh+PJA5kCKULL2imBUq6wHtcmLss/K4NUW4Y8hm1CAGxN4glJx40
 UB0zYv4Ji1hfe0J2dEG0v5R+FCGFLhpiCqAJV5VqsmdOHfuiu5z4IDv7LKW5464lV00I
 3UEdRSTOwtenXKcVW92NnbIptqLCh/4Efdb19eSn64et6J1SYruiS3TY8aEn0pfR8607
 6zTIiM86jV00Sh6agJXSKRY8Iv3LRTRvBqz2KSRymwP2hTVBAS0kwMK+LAztM4TAx4DC
 45rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ilk3DT7PucRdWo5pPlhPaT0vhyvSwy19Bk3y5DiP588=;
 b=GhnsbFX6WjLq/IIDmSUcZetuRl/Wjal59vcYSf+GEvBbZp1HsYjT/HvQJMBvPbU5Sb
 TDVafLmxPW51+bDCltudxI42wvPF+JigXfVrarAPkqEcko8UUyRZPHeVJliPm6YAgjgg
 JQ/c5/R72NPUQbBLKxj47cPTOUWXU2J9myeVrBJp9OjtyBZZXxzHK+m8MR7Bz3nEXo2V
 sDN+Gawp1GLEIc19/gbXOwxY8ZwXMx8HaUJB8SAk4wmgwae+fgd34iYl73z0WtAyfF0w
 t3uS+kurdag2Rw8uTuhI4UhPyFhyY6jnmnWPk6XiAi+gQf8XYQVujO+A3dBX11vY6q5R
 uSAQ==
X-Gm-Message-State: AOAM531/mRFtyEde4pff+1RXFxskpVU04WSmsOY1rpxetZ+UO+zNTXPi
 SXQvxSOLMBTuy7uk3c9qtDE2D3gjizR421u6wKqg+w==
X-Google-Smtp-Source: ABdhPJwCsOiYP0a+rSVq8LuQX0a8b7uKVgxwdj+F9wVqOl3SWN6Q2yx+MmFiMaaPve4kDFDhjfAEzxMNESuGZ90hMm0=
X-Received: by 2002:a05:6402:4001:b0:42b:212:57c3 with SMTP id
 d1-20020a056402400100b0042b021257c3mr1366852eda.109.1652946660234; Thu, 19
 May 2022 00:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
 <20220518110839.8681-6-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220518110839.8681-6-mark.cave-ayland@ilande.co.uk>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 19 May 2022 13:20:49 +0530
Message-ID: <CAARzgwwepTkx0-ss8Ayitg=-kbFajkSW-V6e_cUxLBBTnXY4qQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] hw/acpi/viot: sort VIOT ACPI table entries by PCI
 host bus min_bus
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: mst@redhat.com, imammedo@redhat.com, jean-philippe@linaro.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x531.google.com
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
> This ensures that the VIOT ACPI table output is always stable for a given PCI
> topology by ensuring that entries are ordered according to min_bus.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
other than the nit below,
Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/acpi/viot.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> index ce3b7b8c75..f5714b95bd 100644
> --- a/hw/acpi/viot.c
> +++ b/hw/acpi/viot.c
> @@ -64,6 +64,20 @@ static int pci_host_bridges(Object *obj, void *opaque)
>      return 0;
>  }
>
> +static int pci_host_range_compare(gconstpointer a, gconstpointer b)

nit: shouldn't this have a gint return type since we use gconstpointer
as arguments anyway?
https://docs.gtk.org/glib/callback.CompareFunc.html

> +{
> +    struct viot_pci_host_range *range_a = (struct viot_pci_host_range *)a;
> +    struct viot_pci_host_range *range_b = (struct viot_pci_host_range *)b;
> +
> +    if (range_a->min_bus < range_b->min_bus) {
> +        return -1;
> +    } else if (range_a->min_bus > range_b->min_bus) {
> +        return 1;
> +    } else {
> +        return 0;
> +    }
> +}
> +
>  /*
>   * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
>   * endpoints.
> @@ -87,6 +101,9 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
>      object_child_foreach_recursive(OBJECT(ms), pci_host_bridges,
>                                     pci_host_ranges);
>
> +    /* Sort the pci host ranges by min_bus */
> +    g_array_sort(pci_host_ranges, pci_host_range_compare);
> +
>      /* ACPI table header */
>      acpi_table_begin(&table, table_data);
>      /* Node count */
> --
> 2.20.1
>

