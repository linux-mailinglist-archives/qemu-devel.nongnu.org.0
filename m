Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF044C6258
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 06:07:22 +0100 (CET)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOYFk-0006MO-Am
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 00:07:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOYAA-000526-9u
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 00:01:34 -0500
Received: from [2a00:1450:4864:20::62a] (port=38656
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOYA6-0004hd-1X
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 00:01:33 -0500
Received: by mail-ej1-x62a.google.com with SMTP id r13so22378558ejd.5
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 21:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5F3rdpsCHk+32nxuR31FLnFccuObuocTvrK2/nbyfNA=;
 b=Ybi1Cpp8uOX4cKPnuZJVcKexKgQHKLB+d31dKoE9w4SKwFXt+yiN2l5TjPugbW7giz
 Lb10xX0GlbfuRt65OcGRoVsdI+Vm+NwtKWAp2ex8q1+XLedWP5xZ+eCUXcIrY497IWBI
 cT6w9vhW1L49GqtoILLkjACbdXIKmWrRUIOZbyPkynjknjGEX2Dm+Svm5mmD8Ge/up2t
 HbgyyQszf3u6GBwcx6bMDrynVyFXuAF/HJUV0ztU3Mos0lgzPxxZoI5zTXhidPb8vrGo
 B1UUMyghMePwS8k1qSk9VjptJVLaXKBVTipAYpsb247ueKKRmUuBJ5/ZObnFL3EhmBl7
 4Etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5F3rdpsCHk+32nxuR31FLnFccuObuocTvrK2/nbyfNA=;
 b=aVaWDD4ig2t7zuw8ym+ZGGPm6atZism8uGLNO7lHYivY0+3Mu6nchGHh78eCAF8IEG
 wMlX2HVfeJKfjiFYzoPI7BcuUKMjDSo/L0mjDqSZsOvFbNzNuOSZFjD4nnZFY9lunCl1
 jLCIy241m72HSyEQfi6KN9geHMCSLLGpb8e5eU8H7UG0CWmTnPdsj9cxMBWTWpDaKaQO
 uSrctG18UR53yz3NtsD7vtB2FXCHa0P9EdCx3x4zUrQlvyxKerRTTuLTUbSCMm5PEFn2
 bS8kVHit7escNOsySVZpvmLx5q2VEQwUShb36X/nTnbvuEIJdDCzUo3iiJ1bsiCI6V8P
 aAkw==
X-Gm-Message-State: AOAM533qfSYZ++Mpe+z3Khb4y6DM5wNd5z0Q2grQuVUOCk9qachNvGNL
 IxSN7V5C05vyBN95QFiBhRXeEi8ZWJQ3vFlawuLwVA==
X-Google-Smtp-Source: ABdhPJwToQLo5LS4lUMcdz+V7DOTqHpFkxL/iqLCIbZ1Q5nbkF+cHLKDMGtPzKtiMYgUhnvAfvHhf8JPQlRKTPlxHXw=
X-Received: by 2002:a17:906:d49:b0:6b6:1f07:fb76 with SMTP id
 r9-20020a1709060d4900b006b61f07fb76mr13459488ejh.704.1646024472715; Sun, 27
 Feb 2022 21:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20220226063019.1112654-1-liavalb@gmail.com>
 <20220226063019.1112654-4-liavalb@gmail.com>
 <BE89AC1C-6ED9-4F1E-9DE6-EB1E2CC863E7@gmail.com>
 <6e598f82-e68e-548d-7f72-ea7bcbca0e63@gmail.com>
 <A73557B9-3656-4143-984E-F074EFB8ADBD@gmail.com>
In-Reply-To: <A73557B9-3656-4143-984E-F074EFB8ADBD@gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 28 Feb 2022 10:31:01 +0530
Message-ID: <CAARzgwzNKcjsHib=J5i+UWLTXgxGDdkz4VG-qq+6qAaFmt8gOQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
To: Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62a;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62a.google.com
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
Cc: imammedo@redhat.com, mst@redhat.com, Liav Albani <liavalb@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 3:03 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Am 27. Februar 2022 18:58:18 UTC schrieb Liav Albani <liavalb@gmail.com>:
> >
> >On 2/27/22 12:48, Bernhard Beschow wrote:
> >> Am 26. Februar 2022 06:30:18 UTC schrieb Liav Albani <liavalb@gmail.com>:
> >>> This can allow the guest OS to determine more easily if i8042 controller
> >>> is present in the system or not, so it doesn't need to do probing of the
> >>> controller, but just initialize it immediately, before enumerating the
> >>> ACPI AML namespace.
> >>>
> >>> Signed-off-by: Liav Albani <liavalb@gmail.com>
> >>> ---
> >>> hw/acpi/aml-build.c         | 7 ++++++-
> >>> hw/i386/acpi-build.c        | 8 ++++++++
> >>> hw/i386/acpi-microvm.c      | 9 +++++++++
> >>> include/hw/acpi/acpi-defs.h | 1 +
> >>> 4 files changed, 24 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> >>> index 8966e16320..ef5f4cad87 100644
> >>> --- a/hw/acpi/aml-build.c
> >>> +++ b/hw/acpi/aml-build.c
> >>> @@ -2152,7 +2152,12 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> >>>      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
> >>>      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
> >>>      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
> >>> -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
> >>> +    /* IAPC_BOOT_ARCH */
> >>> +    if (f->rev == 1) {
> >>> +        build_append_int_noprefix(tbl, 0, 2);
> >>> +    } else {
> >>> +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
> >>> +    }
> >>>      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
> >>>      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
> >>>
> >>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >>> index ebd47aa26f..65dbc1ec36 100644
> >>> --- a/hw/i386/acpi-build.c
> >>> +++ b/hw/i386/acpi-build.c
> >>> @@ -192,6 +192,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
> >>>              .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
> >>>          },
> >>>      };
> >>> +    /*
> >>> +     * second bit of 16 but IAPC_BOOT_ARCH indicates presence of 8042 or
> >>> +     * equivalent micro controller. See table 5-10 of APCI spec version 2.0
> >>> +     * (the earliest acpi revision that supports this).
> >>> +     */
> >>> +
> >>> +    fadt.iapc_boot_arch = isa_check_device_existence("i8042") ? 0x0002 : 0x0000;
> >> Couldn't qdev_find_recursive() be used here instead? This would also make patch 1 unneccessary. Same below.
> >>
> >> Best regards
> >> Bernhard
> >
> >I tried it first, but because it tries to find the ID of a device
> >instead of a type (I look for i8042 type which is a string of the device
> >type), it didn't work as expected. We don't compare DeviceState id, but
> >ObjectClass type->name here :)
>
> I see. What about object_resolve_path_type()? It takes a typename parameter. It even tells you if the match is ambiguous if you care.

Yes this is a good suggestion and it will likely work.
You can get rid of your first patch and only make the following change:

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 65dbc1ec36..d82c39490c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -38,6 +38,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/isa/isa.h"
+#include "hw/input/i8042.h"
 #include "hw/block/fdc.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "sysemu/tpm.h"
@@ -198,7 +199,7 @@ static void init_common_fadt_data(MachineState
*ms, Object *o,
      * (the earliest acpi revision that supports this).
      */

-    fadt.iapc_boot_arch = isa_check_device_existence("i8042") ?
0x0002 : 0x0000;
+    fadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042,
NULL) ? 0x0002 : 0x0000;

     *data = fadt;
 }
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index e5f89164be..502ae61a17 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -33,6 +33,7 @@
 #include "hw/acpi/erst.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/microvm.h"
+#include "hw/input/i8042.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/usb/xhci.h"
@@ -195,7 +196,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
      * (the earliest acpi revision that supports this).
      */

-    pmfadt.iapc_boot_arch = isa_check_device_existence("i8042") ? 0x0002
+    pmfadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042,
NULL) ? 0x0002
                             : 0x0000;

     table_offsets = g_array_new(false, true /* clear */,

Please re-test your change.

