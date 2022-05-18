Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D9E52B527
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 10:52:03 +0200 (CEST)
Received: from localhost ([::1]:50516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFPV-0006AH-FV
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 04:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrFHM-000440-T6
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:43:36 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrFHL-00010a-62
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:43:36 -0400
Received: by mail-ed1-x535.google.com with SMTP id m12so2042479edb.6
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wcESpeg/hQZhHMlEska5uhZSH2rPxM8gSTS2kd06dLM=;
 b=BkT6MGl8pdhKuxC+mV6ZjjaEEZN9ZjLZXnlNRgeK3jeqMTv2ZMDQ5kWkDEXmAb9tTE
 Dma8YuebZhtgOjVH/UBo8EjCJ92GktsLaPIdlRkDEkPgJTmdetsmlq53TOPaZQpCwzm8
 FSvWOHVsq3KK9JbDwoVpMfdVRqF7sY/tsHC/2BXfhWJU33JXNojaqtwKZgaAFoYaIAcE
 PY14Yt1X8MSQJdyuHmaPIqOtG7+y3Bb/iSlT/14EyyELXcmd40RnxZLH2ikjWlLDeovB
 +Rlej9G71Myqdgkk1rcJ2qkDuzZGoTw1Wt4Xb9nNhGtI3yfssIbU+Sysz9cfHfe+HP+e
 hMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wcESpeg/hQZhHMlEska5uhZSH2rPxM8gSTS2kd06dLM=;
 b=KZsJehdvG/0loAL7f/Yt9zU4mUDz1GBTMl3cAty8i6IFWAFKljGsA6Mo9hEmqbuZCu
 k9pS7OsBcgY2i+fCFx6LpNKpoCjk3h1857PMdKfuPTyItFlEXp0iEqNAwqZzAj3qksWM
 5qTG/XwQ8Ira3zNpqOLNpqX3iSHsy/cMrlwRuGDJPKad+eOailYc9uYfcUPT9/vz41oM
 CoNdhqLuWwna42bZdPy6fs5YVBF2vnjIuHK6RKM7Fmn2D2C4/301H7uFTFZ7qYyz0sN2
 UuWuBb1I5Uj4Zc/XWWjOUL39cvq5pZnq26k1OhaXRZaVQZ7BVaSLXSlgT6IDXE6wAXR3
 Y9Vg==
X-Gm-Message-State: AOAM5338wp2NS4UtyBf8MtMuSOoKUm405r1zbfr9Sj3Uh0tZiKuwhzzF
 579kOCDTfTkcyxJ7aDSpWxVhHMW+j1aA2E7ZC0227w==
X-Google-Smtp-Source: ABdhPJwetkn8asY7TZOrUuPfbXnUQjTGrgWUghKalJaBD8sFlC1EQDsY7E6y5LcmrGOjG2G/6ulO08Tfiudux6JfVXI=
X-Received: by 2002:a05:6402:254c:b0:427:db53:dfb0 with SMTP id
 l12-20020a056402254c00b00427db53dfb0mr23049712edb.176.1652863413183; Wed, 18
 May 2022 01:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-33-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-33-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 18 May 2022 14:13:21 +0530
Message-ID: <CAARzgwz4hSvd9FDLS_0ku2wiSvxZs6jupCtPgWGrTbC+HSttKQ@mail.gmail.com>
Subject: Re: [PATCH 32/35] acpi: pc/q35: remove not needed 'if' condition on
 pci bus
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, minyard@acm.org, 
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x535.google.com
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

On Mon, May 16, 2022 at 8:56 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/i386/acpi-build.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 85a7313cad..414b9240b2 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1748,16 +1748,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>
>      sb_scope = aml_scope("\\_SB");
>      {
> -        Object *pci_host;
> -        PCIBus *bus = NULL;
> -
> -        pci_host = acpi_get_i386_pci_host();
> +        Object *pci_host = acpi_get_i386_pci_host();
>
>          if (pci_host) {
> -            bus = PCI_HOST_BRIDGE(pci_host)->bus;
> -        }
> -
> -        if (bus) {
> +            PCIBus *bus = PCI_HOST_BRIDGE(pci_host)->bus;
>              Aml *scope = aml_scope("PCI0");
>              /* Scan all PCI buses. Generate tables to support hotplug. */
>              build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
> --
> 2.31.1
>

