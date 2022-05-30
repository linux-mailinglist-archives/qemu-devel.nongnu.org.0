Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7407537444
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 07:21:00 +0200 (CEST)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvXpr-0007OY-KP
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 01:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nvXo7-0006jC-98
 for qemu-devel@nongnu.org; Mon, 30 May 2022 01:19:11 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nvXo5-0003JK-Ft
 for qemu-devel@nongnu.org; Mon, 30 May 2022 01:19:11 -0400
Received: by mail-ed1-x52a.google.com with SMTP id h19so3907574edj.0
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 22:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yabmEfa2BaqtQcC8fwDlhKCKqgLAXFJVCSvV69+O6Rg=;
 b=fHCefeLHP+4VzaLfd6txmrS/LvCsOABjsHDcQxHC2unLS9qmSTv00XOmPXgITjhY9o
 fMhDtLHr1fCMb5GEP/7cXlIsJvxvGOl+VzlT0ZuPlh97mTU265KJBfqlFF4/KgL/7tGc
 8TRfMbE7yaSKLW80OryOF8wB6mDOGn/D4dbOioQHZ7yIjNVjGT45ya5K2qP4IcqTU5Hb
 RaOJT/FukPOQjCM7nkW2U/x7CigStuKsNi3fyj4h6HmPuoKLOdqI6XLIayYCjOabTSMc
 k34skKAi2tD6MiUUU9CwOCYZ2FjbNhRisjOrDpg7HFmGUVeKsTWjH8psk1JtFTvuC1Er
 nMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yabmEfa2BaqtQcC8fwDlhKCKqgLAXFJVCSvV69+O6Rg=;
 b=U23r9L6MLmulTCi9PeBOlXx8LOki8nc7dUryH4ty8BIkRRorbE3uzYc5PQc3vVzfEX
 dTFMKgCyw5WCAPoWYvmRclEwNUgYCLDOn64gAnaTuedgdE8d5f8DXfIju7p9z8jpnMXx
 WXGLxPD16dusKNgUieD6K1qPUgQcXEbCseDLg4t36GPt3i5AhZeVB2epfM1th/dM/6v1
 Ba2XARKQb6YqczLT2kM+WMuJQTSmU695JEQMValEjEh1LISyb6vacVSjiGk6rN8k3Upl
 vjlcqYXDTzaY8WAdjBx/TDm6aVWgVI0193uf03ubG/ZrPX5paL+nmWTv3sDGuylfmiYH
 20pg==
X-Gm-Message-State: AOAM532NeGXmxi3Q+ABPsEfBQ3OTejenD2uR2r88tjVp0METMR7IkB+D
 OiLnn7oQFlnrkuapiHG9lVtGLam9TjOu6QUOZTJ88A==
X-Google-Smtp-Source: ABdhPJy/EytwfhD0mPmDPSR3ASnWlKI7kMgN2J34rgq1oIM5xFjq0QSKD8YXLhEwzn54GE6pt+alp+xAE0UsL3DdBJI=
X-Received: by 2002:a05:6402:4316:b0:42b:4d3d:c064 with SMTP id
 m22-20020a056402431600b0042b4d3dc064mr42199866edc.194.1653887948002; Sun, 29
 May 2022 22:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
 <20220528091934.15520-4-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220528091934.15520-4-mark.cave-ayland@ilande.co.uk>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 30 May 2022 10:48:56 +0530
Message-ID: <CAARzgwwU=BuLX29S6W0h5Fg9aO7wWYeFJXNQaPAYvwesGYceog@mail.gmail.com>
Subject: Re: [PATCH 03/12] hw/acpi/piix4: convert smm_enabled bool to qdev
 property
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com, 
 imammedo@redhat.com, f4bug@amsat.org, aurelien@aurel32.net, 
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 hpoussin@reactos.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52a.google.com
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
> This allows the smm_enabled value to be set using a standard qdev property instead
> of being referenced directly in piix4_pm_init().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/acpi/piix4.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index fcfaafc175..2735ff375e 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -547,6 +547,7 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
>      pci_dev = pci_new(devfn, TYPE_PIIX4_PM);
>      dev = DEVICE(pci_dev);
>      qdev_prop_set_uint32(dev, "smb_io_base", smb_io_base);
> +    qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
>      if (piix4_pm) {
>          *piix4_pm = dev;
>      }
> @@ -554,7 +555,6 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
>      s = PIIX4_PM(dev);
>      s->irq = sci_irq;
>      s->smi_irq = smi_irq;
> -    s->smm_enabled = smm_enabled;
>
>      pci_realize_and_unref(pci_dev, bus, &error_fatal);
>
> @@ -664,6 +664,7 @@ static Property piix4_pm_properties[] = {
>      DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
>                       acpi_memory_hotplug.is_enabled, true),
>      DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
> +    DEFINE_PROP_BOOL("smm-enabled", PIIX4PMState, smm_enabled, false),
>      DEFINE_PROP_BOOL("x-not-migrate-acpi-index", PIIX4PMState,
>                        not_migrate_acpi_index, false),
>      DEFINE_PROP_END_OF_LIST(),
> --
> 2.20.1
>

