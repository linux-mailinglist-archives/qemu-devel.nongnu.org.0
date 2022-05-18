Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA89952B914
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 13:54:34 +0200 (CEST)
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrIG9-0006Bc-PQ
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 07:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrHyt-0003RA-OO
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:36:43 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrHyr-0004X1-Qp
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:36:43 -0400
Received: by mail-ej1-x62b.google.com with SMTP id kq17so3245064ejb.4
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 04:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fNkbIpcuG9d1nbkPRxCV8gq+8zLJPe+Gnbk+v6sJlwQ=;
 b=PtsH2dWu+PLnwg3UDIqL4kV9t19HckL9I6w73W8EpNVOF4bNwTTZqLbW9iGpiD0zOf
 +1N0U9AHOHKjHvY18DyxnD8iFTMkjoR+k9Le56m4ek+9MxWUXQohOIySnt074bzhyVcH
 seSnL4lUdV7gIprJwWSLoRzixin/cxP7wF2rux10wrY1y6jfiI5yuHaOIo6LNVUViXVW
 I/l2+vrYdlnrVqIV5eJkCkyBtLmNrveFDA/QPBr+a3WXlmirjmccTB+TJM3PJDxS1Rmy
 enFVrN3pvdyS9pETNTz3JJLCk8H7+25K6tyFtJJFXgpqN1ZWqvfXcA8MhHbxBFZs/qwy
 Hgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fNkbIpcuG9d1nbkPRxCV8gq+8zLJPe+Gnbk+v6sJlwQ=;
 b=RU7JHhV9bpIoRRqu9q8Ql4+QJfjd0TmOuEvnBUhcp2c1yDccCSz4tBmuA9wqo7yljC
 QD03NcjFNUEbpGGPY/g0ZQ3T3GaUWqAe59emSGz5wQie1GrdHRPeU2zlDH0UI80DewoU
 4F4bpJomuBT1zOQDFIuC2T95XDqp56fPfQeopO13UIsFktvbmmhzmC0uKzVdy5ZIsTEl
 7q99qPBXVp1Gk35h1ZlR3ITusyauaBUGhtRugjDVuFe3KNXN094QQ4T7tRL4ezLD9l9C
 NWEVkYYek8dLsvloGZGAx9+VdzqbkFue8b5O9tGvf3gwsXu3+YHMDly8TSQklU1eg0tC
 uHFw==
X-Gm-Message-State: AOAM531zsndDfE3mimts377rBiKg2lLuJU9jI8+7L97FOKCU2k6uBxXc
 G6PyKZTrJxVjJDpPnXHrhD655ul70foG+xy5tKYMaA==
X-Google-Smtp-Source: ABdhPJwl/Awyb7o6WUEfb+g1VHDQWUNX/ytl+qKT0kgKWmbJfWFmZlfCTRbE/456P4kPPm4bCn708Xkj+KFSeKgsUNA=
X-Received: by 2002:a17:907:7247:b0:6f9:bb40:efd8 with SMTP id
 ds7-20020a170907724700b006f9bb40efd8mr23762210ejc.273.1652873799402; Wed, 18
 May 2022 04:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
 <20220518110839.8681-2-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220518110839.8681-2-mark.cave-ayland@ilande.co.uk>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 18 May 2022 17:06:28 +0530
Message-ID: <CAARzgwx4u0N1-XC2z18kKJZ3gkna22YMZ3nw+tikJt=sv-zc-w@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/acpi/viot: rename build_pci_range_node() to
 pci_host_bridges()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: mst@redhat.com, imammedo@redhat.com, jean-philippe@linaro.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62b;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62b.google.com
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
> This is in preparation for separating out the VIOT ACPI table build from the
> PCI host bridge numeration.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/acpi/viot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> index c1af75206e..2897aa8c88 100644
> --- a/hw/acpi/viot.c
> +++ b/hw/acpi/viot.c
> @@ -17,7 +17,7 @@ struct viot_pci_ranges {
>  };
>
>  /* Build PCI range for a given PCI host bridge */
> -static int build_pci_range_node(Object *obj, void *opaque)
> +static int pci_host_bridges(Object *obj, void *opaque)

Please rename this as build_pci_host_bridges()

>  {
>      struct viot_pci_ranges *pci_ranges = opaque;
>      GArray *blob = pci_ranges->blob;
> @@ -78,7 +78,7 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
>      };
>
>      /* Build the list of PCI ranges that this viommu manages */
> -    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
> +    object_child_foreach_recursive(OBJECT(ms), pci_host_bridges,
>                                     &pci_ranges);
>
>      /* ACPI table header */
> --
> 2.20.1
>

