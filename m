Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221D94C8165
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 04:01:53 +0100 (CET)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOslr-0003Nz-V0
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 22:01:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOsjW-0002R3-30
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 21:59:26 -0500
Received: from [2607:f8b0:4864:20::433] (port=44918
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOsjU-00057L-Hw
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 21:59:25 -0500
Received: by mail-pf1-x433.google.com with SMTP id g21so6572822pfj.11
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 18:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=jDpQ+HAf8aIQt4UmlJL+uVtgQqKpMApVQujthzRxqlk=;
 b=twf8H0NjZBQK6+JRx1qZLK59mTekD90OpVHucyQmyKsqHb+lPBAw5awqbzwESpn1OB
 oTcEF2uzw7FWCJXHNbbuTu+n5wy21LKyXoSrLkVp8RIfyaXAdws0uSTAsRMZQ81fK5E+
 m9FrxLtkkB+FXfnxcizBssS37cHXoMy2NSHIlTtH8uf5JTbNZXmpsUqfzMC5diXTvcIi
 s1t6MbXECjebaR9OyQlX3E0S+D6TJy2X01IhBymdYB3RXfNBzNdXAeT8w1fz0pSG75DU
 u+0C9V61m2jhi17bQUL3g0z1WbgDbq3Frhw3B/oWehYTE4+d91VCabX6Kq9vdR4MZaph
 d7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=jDpQ+HAf8aIQt4UmlJL+uVtgQqKpMApVQujthzRxqlk=;
 b=FJAlmpdcgEvUoz6Cb8x5Uj8BrrUg04GY9GOJroiZifpIjSEd15Lu58x8qe0eMRRgJX
 W98Dx3ToneP8WIm5bAQglwqC8E+sKBDjhbQHTvjfaJh6FPkUJowBnLCBggEImB31uaf/
 hd+wskNy62mkGIMYJnxKHmuopCNZhuoTap/i91DhSmkSYiuIZMy1TX11XQYuTZEg4VC9
 sjpaNr06PPipfPSgEy1r/eo1Ujm8INbMB9W2I1/7JK+9kLifeaKNcXlUDt3ne9+fnPdB
 Jl4CVykx7y00BTb4JRsq+5GH3/xZyUlnTEM5QuBGUtPgifD1yxDnVBfSuvhQCjocPG8+
 1J0A==
X-Gm-Message-State: AOAM53375boy2wRWfgApJ6hqBSN0bTZNVB6CSFgL6EdB2/TZRyEbSbmV
 d2oU/miD6nVygRT1ZYNi+Xxr8KfdKtyxAw==
X-Google-Smtp-Source: ABdhPJyAtVrquKjsxU9g8XnWT70xgXv6cep72hnKsdQPCHm5jLNOAS+FynxUL88w2Z8fMH4Cn5fJEg==
X-Received: by 2002:a63:4c65:0:b0:375:5cc8:64ea with SMTP id
 m37-20020a634c65000000b003755cc864eamr19605408pgl.279.1646103551316; 
 Mon, 28 Feb 2022 18:59:11 -0800 (PST)
Received: from anisinha-lenovo ([203.212.247.124])
 by smtp.googlemail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm14680845pfu.120.2022.02.28.18.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 18:59:10 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 1 Mar 2022 08:29:05 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
In-Reply-To: <20220228201733.714580-3-liavalb@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2203010826360.1505325@anisinha-lenovo>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x433.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, imammedo@redhat.com, shentey@gmail.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 28 Feb 2022, Liav Albani wrote:

> This can allow the guest OS to determine more easily if i8042 controller
> is present in the system or not, so it doesn't need to do probing of the
> controller, but just initialize it immediately, before enumerating the
> ACPI AML namespace.
>
> This change only applies to the x86/q35 machine type, as it uses FACP
> ACPI table with revision higher than 1, which should implement at least
> ACPI 2.0 features within the table, hence it can also set the IA-PC boot
> flags register according to the ACPI 2.0 specification.
>
> Signed-off-by: Liav Albani <liavalb@gmail.com>
> ---
>  hw/acpi/aml-build.c         | 11 ++++++++++-
>  hw/i386/acpi-build.c        |  9 +++++++++
>  hw/i386/acpi-microvm.c      |  9 +++++++++
>  include/hw/acpi/acpi-defs.h |  1 +
>  4 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 8966e16320..2085905b83 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2152,7 +2152,16 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
>      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
>      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
> -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
> +    /* IAPC_BOOT_ARCH */
> +    /*
> +     * This register is not defined in ACPI spec version 1.0, where the FACP

I'd say "this IAPC_BOOT_ARCH register" to be more specific.

> +     * revision == 1 also applies. Therefore, just ignore setting this register.
> +     */
> +    if (f->rev == 1) {
> +        build_append_int_noprefix(tbl, 0, 2);
> +    } else {
> +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
> +    }
>      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
>      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index ebd47aa26f..c72c7bb9bb 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -38,6 +38,7 @@
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/isa/isa.h"
> +#include "hw/input/i8042.h"
>  #include "hw/block/fdc.h"
>  #include "hw/acpi/memory_hotplug.h"
>  #include "sysemu/tpm.h"
> @@ -192,6 +193,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
>              .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
>          },
>      };
> +    /*
> +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence

again typo here.

> +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
> +     * (the earliest acpi revision that supports this).
> +     */
> +    fadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
> +                            0x0002 : 0x0000;

I thought I said we need to make sure the logic still applied when there
are more than one device of this type. Please fix this.

> +
>      *data = fadt;
>  }
>
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index 68ca7e7fc2..4bc72b1672 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -31,6 +31,7 @@
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/utils.h"
>  #include "hw/acpi/erst.h"
> +#include "hw/input/i8042.h"
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/microvm.h"
>  #include "hw/pci/pci.h"
> @@ -189,6 +190,14 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>          .reset_val = ACPI_GED_RESET_VALUE,
>      };
>
> +    /*
> +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
> +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
> +     * (the earliest acpi revision that supports this).
> +     */
> +    pmfadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
> +                            0x0002 : 0x0000;


Ditto.

> +
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));
>      bios_linker_loader_alloc(tables->linker,
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index c97e8633ad..2b42e4192b 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
>      uint16_t plvl2_lat;        /* P_LVL2_LAT */
>      uint16_t plvl3_lat;        /* P_LVL3_LAT */
>      uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
> +    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
>      uint8_t minor_ver;         /* FADT Minor Version */
>
>      /*
> --
> 2.35.1
>
>

