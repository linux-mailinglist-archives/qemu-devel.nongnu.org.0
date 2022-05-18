Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D3952B942
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 14:02:29 +0200 (CEST)
Received: from localhost ([::1]:38056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrINo-0003cq-Jp
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 08:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrIBJ-0002SV-Mz
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:49:33 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrIBG-0006W5-QR
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:49:32 -0400
Received: by mail-ed1-x529.google.com with SMTP id eg11so2616907edb.11
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ViMQZdKP3qyDfLG3X2ceA62h441faxrQu+FndER88Y=;
 b=j+OYHgElMjr7UYWlsFa09ciD1lz7uqZr0CruxowiOAMnbtX2FlO7u88UHVxH1O0xAg
 iBo+I2yzVc57RruScVAqnT1LD7NMj22qWYhXdN4ZPCrf1vMMf2podVntJTP3ujwelu4j
 Yl5yiAZ7MbqOqf/8DIPFFQDUZ1YulAuP2HOSkdb0VMUINQZmnknAlhRcek7O4Um0DVeh
 5hAxKh0uSWdcfqF+pfjv1L1JvX8DboSkZnxoY3+5/U9fCqpeyNG86R0asWWXG7Lt+Zin
 /0laeDsMMcQKl4uxainf3WoYCe4qI8eEzqet5G3ip3WHb6fXt7NCAR+HP6j6zVWoxSL9
 yzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ViMQZdKP3qyDfLG3X2ceA62h441faxrQu+FndER88Y=;
 b=pgQOtrrouXk6lZUc+h2egs1F8yXCQFYPzHbsc2UuJ4KiF6U+3eQ0Dy/HAlpkmHTPKt
 XqTAPwzXxGjZY4Bnp7/RnVCtH6DaCVFMLTAyyCicAWA2C5mo4teCrd/paVwaywyMnBsN
 8ZqAJun1RjuO06YSzJ21PeEY9Koyh1C1ZKQYH4gB22pGKkexPvETX20IbzTk/MtCWmC7
 wj33X3QF6RI/oCsB4A1aKsAH4fH6pn9zgxgo469dner1zGInrpbWwQc9LCRF+8XiEryv
 iMyn1lrHEiqBqWGZ+ss/1cnVnn/GXgXa5+FAHWs51I0TptqTEkk8Jt/+Xa9tr43umPP/
 hngg==
X-Gm-Message-State: AOAM532xU9tGTmEm2U5AuyBIE0oZeBevHyWIMIXB5uZ5TqssgWIHCKFj
 Kes+JlM3dOzeqFI8WJFgJP3CkLiqo/wMDEiQZdmN2w==
X-Google-Smtp-Source: ABdhPJzOSTJGKRvpn2cRyFkduwgVNkDJ5Wnv3A6sKW32Rz9jsA23swC2k/9g7vxKubG4Hgn6IPIdeV7YCd0WLrPUlDw=
X-Received: by 2002:a05:6402:5253:b0:427:ed62:bb8b with SMTP id
 t19-20020a056402525300b00427ed62bb8bmr24700458edd.65.1652874569121; Wed, 18
 May 2022 04:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
 <20220518110839.8681-3-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220518110839.8681-3-mark.cave-ayland@ilande.co.uk>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 18 May 2022 17:19:18 +0530
Message-ID: <CAARzgwy805i12i-n1qCu8PHGJLXKhFUazRcW9EMwGxztPqp8sw@mail.gmail.com>
Subject: Re: [PATCH 2/6] hw/acpi/viot: move the individual PCI host bridge
 entry generation to a new function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: mst@redhat.com, imammedo@redhat.com, jean-philippe@linaro.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x529.google.com
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

On Wed, May 18, 2022 at 4:38 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Instead of generating each table entry inline, move the individual PCI host bridge
> table entry generation to a separate build_pci_host_range() function.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Ani Sinha <ani@anisinha.ca>


> ---
>  hw/acpi/viot.c | 48 +++++++++++++++++++++++++++---------------------
>  1 file changed, 27 insertions(+), 21 deletions(-)
>
> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> index 2897aa8c88..662124812f 100644
> --- a/hw/acpi/viot.c
> +++ b/hw/acpi/viot.c
> @@ -16,6 +16,31 @@ struct viot_pci_ranges {
>      uint16_t output_node;
>  };
>
> +static void build_pci_host_range(GArray *table_data, int min_bus, int max_bus,
> +                                 uint16_t output_node)
> +{
> +    /* Type */
> +    build_append_int_noprefix(table_data, 1 /* PCI range */, 1);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 1);
> +    /* Length */
> +    build_append_int_noprefix(table_data, 24, 2);
> +    /* Endpoint start */
> +    build_append_int_noprefix(table_data, PCI_BUILD_BDF(min_bus, 0), 4);
> +    /* PCI Segment start */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* PCI Segment end */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* PCI BDF start */
> +    build_append_int_noprefix(table_data, PCI_BUILD_BDF(min_bus, 0), 2);
> +    /* PCI BDF end */
> +    build_append_int_noprefix(table_data, PCI_BUILD_BDF(max_bus, 0xff), 2);
> +    /* Output node */
> +    build_append_int_noprefix(table_data, output_node, 2);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 6);
> +}
> +
>  /* Build PCI range for a given PCI host bridge */
>  static int pci_host_bridges(Object *obj, void *opaque)
>  {
> @@ -30,27 +55,8 @@ static int pci_host_bridges(Object *obj, void *opaque)
>
>              pci_bus_range(bus, &min_bus, &max_bus);
>
> -            /* Type */
> -            build_append_int_noprefix(blob, 1 /* PCI range */, 1);
> -            /* Reserved */
> -            build_append_int_noprefix(blob, 0, 1);
> -            /* Length */
> -            build_append_int_noprefix(blob, 24, 2);
> -            /* Endpoint start */
> -            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
> -            /* PCI Segment start */
> -            build_append_int_noprefix(blob, 0, 2);
> -            /* PCI Segment end */
> -            build_append_int_noprefix(blob, 0, 2);
> -            /* PCI BDF start */
> -            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 2);
> -            /* PCI BDF end */
> -            build_append_int_noprefix(blob, PCI_BUILD_BDF(max_bus, 0xff), 2);
> -            /* Output node */
> -            build_append_int_noprefix(blob, pci_ranges->output_node, 2);
> -            /* Reserved */
> -            build_append_int_noprefix(blob, 0, 6);
> -
> +            build_pci_host_range(blob, min_bus, max_bus,
> +                                 pci_ranges->output_node);
>              pci_ranges->count++;
>          }
>      }
> --
> 2.20.1
>

