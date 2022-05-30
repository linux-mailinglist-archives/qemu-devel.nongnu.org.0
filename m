Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702CE537426
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 06:50:14 +0200 (CEST)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvXM4-000647-RI
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 00:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nvXKK-0005Kg-Lb
 for qemu-devel@nongnu.org; Mon, 30 May 2022 00:48:24 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nvXKI-0007bB-GK
 for qemu-devel@nongnu.org; Mon, 30 May 2022 00:48:24 -0400
Received: by mail-ej1-x634.google.com with SMTP id q1so2014816ejz.9
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 21:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DffWV3OBcMrVLEsYH+no5y40pqvrbHQxxP5xBpN0V3Q=;
 b=g4QeW4O/4suYsTdoFG0vXjGs2hoa969euUUKtuo4oQwmWvuG8gV7SR+KLcGlSrJET/
 OGSfrqLxVGMMCgjRlwW3iITnuXFurVdyIWaiAAag0Bkm0TcPG1fftYOzOLN8vEOGlKWq
 MAez/l1GdoianuRNwcO5tgTzLRkn1dekdinnC0uKV74BP1HBJs8oJG1gedD+BhbZzbDo
 jJzFe3bh47jUZMKJMMZuqHeBOrehhgl8q8ovVuLstG88TL1M/QBbTsc4DsfUb6d+U5XK
 kief788PTMBRXrucgF58QQHTtScOpoj7iF01jtl/D2cI6P2bybqs+YJsxhBQcKObD2qA
 IE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DffWV3OBcMrVLEsYH+no5y40pqvrbHQxxP5xBpN0V3Q=;
 b=VqK0IuBmoZd+at6N3WU2xosK/fhtp3NZIdugAULwz83Pi5OHZWjc7T0rXfvIZ3BCo2
 U0+UO5Cf57mZx3pUfFzQu/eGr2DBLGjhQCG3DID0uy4phiSKbe+0KnDgLg/+T6fvyIJz
 qh1prFijgeMN1Vvo6g6uSvArur9vS2+Va1JavViSG+gaxzsRxkDUVMyCTD3NJLCPQCyX
 zDONAU+jcEXM7fi/pzTDOdCqLA/LJNbfSMXrV0bYDumpFsslhAdu3pfarkMAaQjc2zSD
 66gDZL0bm8JVRKrX72W8W5zqrC9Zh5xKy+ZeZ4zZziAS4R4KkNKV5Ca249KEMY9E67nA
 ZhyQ==
X-Gm-Message-State: AOAM533xfzG1PK95v3NOUgLoNg6PtSFT7pOAqriIG82N7902MpysYE0o
 yXoWsbq0Al6u1EVSDt4YQHSlbGInZKCIroW+RqIozA==
X-Google-Smtp-Source: ABdhPJzH4J36j0Atr1+VT+0UT8tu5jzRwKwEMaT9+OxJxrDGVyn2b9ccBnrwrwP1DcHY1NrYpV3W0HraJRiheVGKQCE=
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr47164066ejc.64.1653886098400; Sun, 29
 May 2022 21:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
 <20220528091934.15520-2-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220528091934.15520-2-mark.cave-ayland@ilande.co.uk>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 30 May 2022 10:18:07 +0530
Message-ID: <CAARzgwxmA14af=sKmv2RF8xGwCapVcjGiF9e22Q2TjuaXye+ng@mail.gmail.com>
Subject: Re: [PATCH 01/12] hw/acpi/piix4: move xen_enabled() logic from
 piix4_pm_init() to piix4_pm_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com, 
 imammedo@redhat.com, f4bug@amsat.org, aurelien@aurel32.net, 
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 hpoussin@reactos.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::634;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x634.google.com
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

On Sat, May 28, 2022 at 2:49 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This logic can be included as part of piix4_pm_realize() and does not need to
> be handled externally.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/acpi/piix4.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index fe5625d07a..bf20fa139b 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -525,6 +525,10 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
>      s->machine_ready.notify = piix4_pm_machine_ready;
>      qemu_add_machine_init_done_notifier(&s->machine_ready);
>
> +    if (xen_enabled()) {
> +        s->use_acpi_hotplug_bridge = false;
> +    }
> +
>      piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
>                                     pci_get_bus(dev), s);
>      qbus_set_hotplug_handler(BUS(pci_get_bus(dev)), OBJECT(s));
> @@ -551,9 +555,6 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
>      s->irq = sci_irq;
>      s->smi_irq = smi_irq;
>      s->smm_enabled = smm_enabled;
> -    if (xen_enabled()) {
> -        s->use_acpi_hotplug_bridge = false;
> -    }
>
>      pci_realize_and_unref(pci_dev, bus, &error_fatal);
>
> --
> 2.20.1
>

