Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0579852B81D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:49:35 +0200 (CEST)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrHFF-0003ea-SU
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrHC1-0002P1-KR
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:46:13 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrHBz-0003WK-Lo
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:46:13 -0400
Received: by mail-ed1-x534.google.com with SMTP id m12so2437690edb.6
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 03:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aHSfTyr2SQkHpLeckfrXh25vSIos9P31XEAo/KAJBo4=;
 b=CPSLilUvGN5D8FjJoy88HckQXp5xhueQWU+7idOgYobCbgejolI1EaA8aZfeyYwdPA
 7/3kQeDD+LeUPh4jlbazFwCRuF9d4Y3oAGYE5cf+XGigYtks4TlcOnA0tvcvcypkfGP6
 JEB6uI5rDmPDTBRail+VHw2YwbKxYWVVAid7eNTWHJSMBCmxX0/4M5kyDirP1NXiug+T
 AvxfDz/jhI35bQ63EMvxoKzi+u9F82ccFM0aT2qEEwl3iG9AOAkrTsEo0osx4tq5pVlM
 knfT1AGGau1hZB+geRRX91mKn6P/6LUs9WV2BlxmInaOh6+SMP7g9xuFVRCcA8f2ISx9
 x0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aHSfTyr2SQkHpLeckfrXh25vSIos9P31XEAo/KAJBo4=;
 b=lKlYbQj4WmGZm5Dln7FeQeFimYevQiadtpgfOtxAOAr3A2gIlqD4OW9iBGEMQPYKF3
 4K4CUuWOi1KBPj55reWy0znioUYJcdTEN3+Plc3JAhLoDlzGtMONkKhHUrZHjulZu0NU
 l4IMBXtjqCkg0hzakeBuwP0oBd/xG2pTjO1uEh+Ea1tvzSkq2RyJQksemoZ0ce61ymlQ
 k3NlqKMDulDIBV1m8nIBFpIceIpcgchzm2YUTo7fB9PKMMhfPWSKiaZtzjF63kEWd/e9
 affNBEJvvfCi33Qt38Yr1kkchhlepseZnvOkE08fwv+hcj9yVxRdUh8FnzisZ+UXtOj5
 jKkw==
X-Gm-Message-State: AOAM5315Ff6lgQ8yBKy65XJlOSlZMtWRtRKsVqFk5WhjPZgol0b7ZQg3
 txqWtC70bWBHlkRErNB7j1yK4oz3kIoqWC7m3YFA1w==
X-Google-Smtp-Source: ABdhPJyVAKVlFadjH8GycqOfgkcoR5gLR6RrtQOct5YagGn9+1UHRHGtVJJnqyWW4xQvr6FbFhz8+5e57BysOd6AJCY=
X-Received: by 2002:aa7:dd07:0:b0:42a:eeba:a0a8 with SMTP id
 i7-20020aa7dd07000000b0042aeebaa0a8mr741664edv.371.1652870769536; Wed, 18 May
 2022 03:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-34-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-34-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 18 May 2022 16:15:58 +0530
Message-ID: <CAARzgwweQs0D-VrbjsWfHNSXbPkucf4FmsMoBbNC4tNnyAUtLQ@mail.gmail.com>
Subject: Re: [PATCH 33/35] acpi: tpm-tis: use AcpiDevAmlIfClass:build_dev_aml
 to provide device's AML
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, minyard@acm.org, 
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x534.google.com
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

On Mon, May 16, 2022 at 8:57 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> .. and clean up not longer needed conditionals in DSTD build code
> tpm-tis AML will be fetched and included when ISA bridge will
> build its own AML code (including attached devices).
>
> Expected AML change:
>     the device under separate _SB.PCI0.ISA scope is moved directly
>     under Device(ISA) node.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/i386/acpi-build.c | 34 ----------------------------------
>  hw/tpm/tpm_tis_isa.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+), 34 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 414b9240b2..58284438f8 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1755,40 +1755,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              Aml *scope = aml_scope("PCI0");
>              /* Scan all PCI buses. Generate tables to support hotplug. */
>              build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
> -
> -#ifdef CONFIG_TPM
> -            if (TPM_IS_TIS_ISA(tpm)) {
> -                dev = aml_device("ISA.TPM");
> -                if (misc->tpm_version == TPM_VERSION_2_0) {
> -                    aml_append(dev, aml_name_decl("_HID",
> -                                                  aml_string("MSFT0101")));
> -                    aml_append(dev,
> -                               aml_name_decl("_STR",
> -                                             aml_string("TPM 2.0 Device")));
> -                } else {
> -                    aml_append(dev, aml_name_decl("_HID",
> -                                                  aml_eisaid("PNP0C31")));
> -                }
> -                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> -
> -                aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> -                crs = aml_resource_template();
> -                aml_append(crs, aml_memory32_fixed(TPM_TIS_ADDR_BASE,
> -                           TPM_TIS_ADDR_SIZE, AML_READ_WRITE));
> -                /*
> -                    FIXME: TPM_TIS_IRQ=5 conflicts with PNP0C0F irqs,
> -                    Rewrite to take IRQ from TPM device model and
> -                    fix default IRQ value there to use some unused IRQ
> -                 */
> -                /* aml_append(crs, aml_irq_no_flags(TPM_TIS_IRQ)); */
> -                aml_append(dev, aml_name_decl("_CRS", crs));
> -
> -                tpm_build_ppi_acpi(tpm, dev);
> -
> -                aml_append(scope, dev);
> -            }
> -#endif
> -
>              aml_append(sb_scope, scope);
>          }
>      }
> diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
> index 3477afd735..91e3792248 100644
> --- a/hw/tpm/tpm_tis_isa.c
> +++ b/hw/tpm/tpm_tis_isa.c
> @@ -30,6 +30,7 @@
>  #include "tpm_prop.h"
>  #include "tpm_tis.h"
>  #include "qom/object.h"
> +#include "hw/acpi/acpi_aml_interface.h"
>
>  struct TPMStateISA {
>      /*< private >*/
> @@ -138,10 +139,39 @@ static void tpm_tis_isa_realizefn(DeviceState *dev, Error **errp)
>      }
>  }
>
> +static void build_tpm_tis_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
> +{
> +    Aml *dev, *crs;
> +    TPMStateISA *isadev = TPM_TIS_ISA(adev);
> +    TPMIf *ti = TPM_IF(isadev);
> +
> +    dev = aml_device("TPM");
> +    if (tpm_tis_isa_get_tpm_version(ti) == TPM_VERSION_2_0) {
> +        aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +        aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
> +    } else {
> +        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C31")));
> +    }
> +    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> +    crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(TPM_TIS_ADDR_BASE, TPM_TIS_ADDR_SIZE,
> +                                      AML_READ_WRITE));
> +    /*
> +     * FIXME: TPM_TIS_IRQ=5 conflicts with PNP0C0F irqs,
> +     * fix default TPM_TIS_IRQ value there to use some unused IRQ
> +     */
> +    /* aml_append(crs, aml_irq_no_flags(isadev->state.irq_num)); */
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    tpm_build_ppi_acpi(ti, dev);
> +    aml_append(scope, dev);
> +}
> +
>  static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      TPMIfClass *tc = TPM_IF_CLASS(klass);
> +    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
>
>      device_class_set_props(dc, tpm_tis_isa_properties);
>      dc->vmsd  = &vmstate_tpm_tis_isa;
> @@ -151,6 +181,7 @@ static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
>      tc->request_completed = tpm_tis_isa_request_completed;
>      tc->get_version = tpm_tis_isa_get_tpm_version;
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    adevc->build_dev_aml = build_tpm_tis_isa_aml;
>  }
>
>  static const TypeInfo tpm_tis_isa_info = {
> @@ -161,6 +192,7 @@ static const TypeInfo tpm_tis_isa_info = {
>      .class_init  = tpm_tis_isa_class_init,
>      .interfaces = (InterfaceInfo[]) {
>          { TYPE_TPM_IF },
> +        { TYPE_ACPI_DEV_AML_IF },
>          { }
>      }
>  };
> --
> 2.31.1
>

