Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB164BF245
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 07:57:02 +0100 (CET)
Received: from localhost ([::1]:48770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMP6b-0000t5-Cw
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 01:57:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMP5U-000088-Q5
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 01:55:52 -0500
Received: from [2607:f8b0:4864:20::435] (port=37571
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMP5S-0007RN-IW
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 01:55:52 -0500
Received: by mail-pf1-x435.google.com with SMTP id y5so11024400pfe.4
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 22:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=vSJ7tv3YYNS51ayN48j27RQsxEIx8KFDC9sG6CYby4U=;
 b=4F2Dl0upj4EMXDh6260U0QVTacbthxCn/AxAXRLU28d1eeAYkUe5H5BnwdO9D9OADy
 oi7Cp3Z/hQTDsBRKmwuVMoWFhJl9BYhRWUKWoIjjW1+AMfRVBagOzVRrBwNZfNuF7/dR
 5l+HlOvoqcv19k+V+UsRqsxLMtrHsGq3rXp/jRwruh6XXpg5F5HQhFAlkOvpqjfKQo8G
 m4BFRSs+tm6MoyKy7MztVlPnw43O5eljsIQl3Vl+tAQiGwsZRxBESszMdFL6RoWjObLj
 iUtoyDee7JiyNZZv9V9Wkb/9g0jdt/Bzq25X69vWPc4+oNPU0Dci35k1ANADVZrlaMGB
 IWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=vSJ7tv3YYNS51ayN48j27RQsxEIx8KFDC9sG6CYby4U=;
 b=Uep5Nw+uoexIYn/+WzbrFkJ+iumc0onKcHWaH9lsI7YrrtLCYzOiP2ph8X3t2AeArI
 JNCnPe8cSjDf6n7+jBgChAiCd12Ed1NqlBhfbcdgnP0fybcO1aIM8opMxQWV6JUzjLVN
 0tXuJP6yKM4wAMukdMiMyBq0UNantWoCKK2kVgspuuujaIR9enAE8uvGiwTZfpcaekot
 VeIJFPZTZ05DsmF4selH8Kp65ogGXwMvvA/OHzxRUFKZ1k25nJVYZMr7cEyhjL6Bcygx
 zOqA4cW8U3WypL2yKde+U16jjBX3Mk7avU+5HMasLgVtcKs/zXOKRoZ36nAYfT99Tulf
 Fdjg==
X-Gm-Message-State: AOAM530QS6mpYwmtKJUo4D0xU4J174L1ByIKGfKQq66ORmYXBEXaTAlP
 87JSxPHW+jlfwLZAcpKHXY9LKA==
X-Google-Smtp-Source: ABdhPJyOIudR9bFJM5ItzcK4lMp6qXhszRy+FE92Zurcu4Z4lB/bulRHNyrNDyYbMxAXIcs2uvgGUg==
X-Received: by 2002:a62:754d:0:b0:4c7:f5db:5bd7 with SMTP id
 q74-20020a62754d000000b004c7f5db5bd7mr23654097pfc.46.1645512948875; 
 Mon, 21 Feb 2022 22:55:48 -0800 (PST)
Received: from anisinha-lenovo ([115.96.128.14])
 by smtp.googlemail.com with ESMTPSA id
 b15sm15639148pfm.154.2022.02.21.22.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 22:55:48 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 22 Feb 2022 12:25:43 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v2 2/2] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
In-Reply-To: <20220221191323.617323-3-liavalb@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2202221154300.697295@anisinha-lenovo>
References: <20220221191323.617323-1-liavalb@gmail.com>
 <20220221191323.617323-3-liavalb@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x435.google.com
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
Cc: ani@anisinha.ca, imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 21 Feb 2022, Liav Albani wrote:

> This can allow the guest OS to determine more easily if i8042 controller
> is present in the system or not, so it doesn't need to do probing of the
> controller, but just initialize it immediately, before enumerating the
> ACPI AML namespace.
>
> Signed-off-by: Liav Albani <liavalb@gmail.com>
> ---
>  hw/acpi/aml-build.c         | 7 ++++++-
>  hw/i386/acpi-build.c        | 5 +++++
>  hw/i386/acpi-microvm.c      | 5 +++++
>  include/hw/acpi/acpi-defs.h | 1 +
>  4 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 8966e16320..ef5f4cad87 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2152,7 +2152,12 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
>      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
>      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
> -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
> +    /* IAPC_BOOT_ARCH */
> +    if (f->rev == 1) {
> +        build_append_int_noprefix(tbl, 0, 2);
> +    } else {
> +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
> +    }

So your change will only apply for q35 machines and not for pc types. You
should write a comment saying that this is not defined in acpi spec 1.0
where revision == 1 also applies.
I see that IAPC boot arch is defined as
old as ACPI version 2:

https://uefi.org/sites/default/files/resources/ACPI_2.pdf
Section 5.2.8

On a unrelatd note, I see FADT revision is hardcoded to 3 even as old as
ACPI version 2. *Except* in ACPI version 1b, it is hardcoded to 1 which
w2k seems to like :-) (table 5-5 in
https://uefi.org/sites/default/files/resources/ACPI_1_Errata_B.pdf) .
I will add a comment in the code related to this.


>      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
>      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index ebd47aa26f..5dc625b8d8 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -192,6 +192,11 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
>              .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
>          },
>      };
> +    if (isa_check_device_existence("i8042")) {
> +        /* Indicates if i8042 is present or not */
> +        fadt.iapc_boot_arch = (1 << 1);
> +    }
> +
>      *data = fadt;
>  }
>
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index 68ca7e7fc2..756c69b3b0 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -189,6 +189,11 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>          .reset_val = ACPI_GED_RESET_VALUE,
>      };
>
> +    if (isa_check_device_existence("i8042")) {
> +        /* Indicates if i8042 is present or not */
> +        pmfadt.iapc_boot_arch = (1 << 1);
> +    }
> +
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));


We should do the same thing for arm architecture as well?
hw/arm/virt-acpi-build.c .


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

