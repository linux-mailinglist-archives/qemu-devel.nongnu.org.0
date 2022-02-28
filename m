Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ADD4C6368
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 07:58:03 +0100 (CET)
Received: from localhost ([::1]:47114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOZyr-0003sc-C8
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 01:58:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOZx7-0003Ca-NQ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 01:56:13 -0500
Received: from [2607:f8b0:4864:20::531] (port=41505
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOZx5-0000Xy-L6
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 01:56:13 -0500
Received: by mail-pg1-x531.google.com with SMTP id o26so9959164pgb.8
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 22:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=YqoCtprxktP+z3Wu9Fj3hZkmAhFRYGpRzeqU8Kn9UWU=;
 b=OL1mbNeeP5ot1btqjkmx+M8R9OmOaS4DLqkbNsLiKLg0foVwW0+iaVfmjI/81C6WjB
 lurfXtUMl5pSUf/nFjdQiqmyU/o8jSiznohibLiDlz9e/FaZE6i8IWUihmZf7Mj2UXYo
 L9sYpl5MJaSKC5sAa2qlwn6LzVjD/IS1/NsjK3X86m+QHrRJLV9Iid9dfFnDlyIwiKA3
 rfT449/OY8X7YdyIWNX0Y7qYJ1uy2L0AOU/s9XHEkCvXxUQB2pmnGfaWqctEWCDKOxG2
 JH60871T2IIIBy0RcXigSeRxh51rs1tP/K2yj9PijOVdmwAlmWoE7qbmV4ekNvUQZrcz
 sbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=YqoCtprxktP+z3Wu9Fj3hZkmAhFRYGpRzeqU8Kn9UWU=;
 b=oXR5YMaDl84igKVxdT+QRgWVdOO43NhgyENzE9H2y/+THwnLtYP1LJYfnq8zAueHMo
 SBawuHOTRyJEP+wpFUbED+ozg/s1IqwitlZ9hMuuS6jCmDNhH7fM1bL4wozBap7ITjg0
 5hbZ/hV8xxWcknUFO9aVDfv2h6MgSOjTKK2i9S5JWLDWzDCZxJzJcYE0DutEACseBi8+
 fwFyO8mP69jxHpC2fP60lp9/uftdmGMeYFw6Zyhxzsr6u1wuMSsWOKBsQ58uF1IWh3Oq
 TFzHWPfXmgCov/lJRgFdQzc0tk1nguYEaL6S5piaOjeSJate773zSvGOvlSMrJV+Eh65
 ra6A==
X-Gm-Message-State: AOAM531fUNOPXl9yd5AhrLpDWp5XkKt92z4t07tI3iYJlaqUTiKBT8zs
 h4W+qxylgPvL000a1nfeWHgC/A==
X-Google-Smtp-Source: ABdhPJwBWpkdVD1wvNZDb79X3U39RLQUlH8/jUe4bNrM0nTa/GeaqqyHge6cbtlDR6QXXAEOAxxtPA==
X-Received: by 2002:a63:2022:0:b0:349:beed:bfd8 with SMTP id
 g34-20020a632022000000b00349beedbfd8mr16104515pgg.175.1646031369903; 
 Sun, 27 Feb 2022 22:56:09 -0800 (PST)
Received: from anisinha-lenovo ([115.96.126.73])
 by smtp.googlemail.com with ESMTPSA id
 f18-20020a056a00229200b004f3cb984582sm11841718pfe.136.2022.02.27.22.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 22:56:09 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 28 Feb 2022 12:26:04 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 3/4] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
In-Reply-To: <CAARzgwzNKcjsHib=J5i+UWLTXgxGDdkz4VG-qq+6qAaFmt8gOQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2202281224450.1302049@anisinha-lenovo>
References: <20220226063019.1112654-1-liavalb@gmail.com>
 <20220226063019.1112654-4-liavalb@gmail.com>
 <BE89AC1C-6ED9-4F1E-9DE6-EB1E2CC863E7@gmail.com>
 <6e598f82-e68e-548d-7f72-ea7bcbca0e63@gmail.com>
 <A73557B9-3656-4143-984E-F074EFB8ADBD@gmail.com>
 <CAARzgwzNKcjsHib=J5i+UWLTXgxGDdkz4VG-qq+6qAaFmt8gOQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::531;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x531.google.com
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
Cc: imammedo@redhat.com, mst@redhat.com, Bernhard Beschow <shentey@gmail.com>,
 Liav Albani <liavalb@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> > >ObjectClass type->name here :)
> >
> > I see. What about object_resolve_path_type()? It takes a typename parameter. It even tells you if the match is ambiguous if you care.
>
> Yes this is a good suggestion and it will likely work.
> You can get rid of your first patch and only make the following change:
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 65dbc1ec36..d82c39490c 100644
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
> @@ -198,7 +199,7 @@ static void init_common_fadt_data(MachineState
> *ms, Object *o,
>       * (the earliest acpi revision that supports this).
>       */
>
> -    fadt.iapc_boot_arch = isa_check_device_existence("i8042") ?
> 0x0002 : 0x0000;
> +    fadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042,
> NULL) ? 0x0002 : 0x0000;


This might be incorrect if there are more than one device of that type.
You need to check for ambiguity as well.

>
>      *data = fadt;
>  }
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index e5f89164be..502ae61a17 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -33,6 +33,7 @@
>  #include "hw/acpi/erst.h"
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/microvm.h"
> +#include "hw/input/i8042.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/usb/xhci.h"
> @@ -195,7 +196,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>       * (the earliest acpi revision that supports this).
>       */
>
> -    pmfadt.iapc_boot_arch = isa_check_device_existence("i8042") ? 0x0002
> +    pmfadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042,
> NULL) ? 0x0002
>                              : 0x0000;
>

Ditto.

>      table_offsets = g_array_new(false, true /* clear */,
>
> Please re-test your change.
>

