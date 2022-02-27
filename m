Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E936B4C5A84
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 11:52:29 +0100 (CET)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOHAB-0007PZ-IS
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 05:52:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nOH6p-0005y1-NU
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 05:48:59 -0500
Received: from [2a00:1450:4864:20::632] (port=42564
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nOH6o-0008WQ-49
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 05:48:59 -0500
Received: by mail-ej1-x632.google.com with SMTP id hw13so19341683ejc.9
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 02:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=gN82mZzp0EGBKR+Us/xKE1aJZOl/SVuuyVypTlmUp9w=;
 b=iThQrElsdgVrI9iGsei5OOxtLjYlxMgD7iQiI+X02g2jOmHN1aZWXOFjMmABickb+m
 p5RH+bYi5sl0m0m0EGih4IDya+WUINqK2z64944gTrWc5R3A05BjBzFcsdmaWch9gw5S
 Nar8Mlgu+OC0wBsSnsrjhOzFsVvdVpUyKU6JGyQ+57YoIQizFiLZOhdcdLpqEtADEtdf
 s4jfbaj0DUysJxNxtYUQfHPgq3M6aagzX8lx6U43YvMQdY1Ckt2j+RM+7d99xgyAPZhL
 LtUx/FWtWg0kPPwVDsOYQRkK9mnJA+F+H87SdvuxyHPXX3HffE1DfzfveR8On59t0aIT
 fpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=gN82mZzp0EGBKR+Us/xKE1aJZOl/SVuuyVypTlmUp9w=;
 b=vRQd+gO7JgMs6eGq12CZQDGwfro5QClcKYSn8xjoEFbx74tr5YAMjd3MC0Xck0bhI4
 yT37RHza5113WyLK++jKao9/9YeJF/tmDDTjN+tmxGC5YY2W0VxoTHpwUgdsTJSLNgsJ
 UUUYhi2iN/qFWIem1dpzNMCg0Wga6Kztlpq2fM4fNv+NcRVXdkpWO+AVrP42ZQB/UWsm
 2K9dSHLbBSh78sRdKQ16yVxfey1niz6RosokKi6QiLLN8fB1mJjOujzSjbEykjKtwb1O
 VQ4cVZnblhpWNWRtIOkxBt4O0Jx3NJmZTo7FdP+AM1TJSSw0OabzUo41tgIRw5Qw0YFc
 PiLA==
X-Gm-Message-State: AOAM530YqUt4MmeCebi4196v5vpjX06pss5EQXQrvgPm0R6j+7WO5Ke1
 IzJ7PxgCAmGIoZmxk0epat7le8HEoY0=
X-Google-Smtp-Source: ABdhPJxRBW6hZ6dWLgaKiXfbi85NEIezeBNfrAReAAwu851Pkk9br6rQtlwY0GnCnyT4dIfl0T+VQA==
X-Received: by 2002:a17:906:3905:b0:6cf:7ef5:fee0 with SMTP id
 f5-20020a170906390500b006cf7ef5fee0mr11547764eje.307.1645958935762; 
 Sun, 27 Feb 2022 02:48:55 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-173-033.78.54.pool.telefonica.de.
 [78.54.173.33]) by smtp.gmail.com with ESMTPSA id
 i5-20020aa7dd05000000b00410d26d170bsm4408799edv.4.2022.02.27.02.48.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Feb 2022 02:48:55 -0800 (PST)
Date: Sun, 27 Feb 2022 10:48:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Liav Albani <liavalb@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_3/4=5D_hw/acpi=3A_add_indication_fo?=
 =?US-ASCII?Q?r_i8042_in_IA-PC_boot_flags_of_the_FADT_table?=
In-Reply-To: <20220226063019.1112654-4-liavalb@gmail.com>
References: <20220226063019.1112654-1-liavalb@gmail.com>
 <20220226063019.1112654-4-liavalb@gmail.com>
Message-ID: <BE89AC1C-6ED9-4F1E-9DE6-EB1E2CC863E7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: ani@anisinha.ca, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26=2E Februar 2022 06:30:18 UTC schrieb Liav Albani <liavalb@gmail=2Ecom=
>:
>This can allow the guest OS to determine more easily if i8042 controller
>is present in the system or not, so it doesn't need to do probing of the
>controller, but just initialize it immediately, before enumerating the
>ACPI AML namespace=2E
>
>Signed-off-by: Liav Albani <liavalb@gmail=2Ecom>
>---
> hw/acpi/aml-build=2Ec         | 7 ++++++-
> hw/i386/acpi-build=2Ec        | 8 ++++++++
> hw/i386/acpi-microvm=2Ec      | 9 +++++++++
> include/hw/acpi/acpi-defs=2Eh | 1 +
> 4 files changed, 24 insertions(+), 1 deletion(-)
>
>diff --git a/hw/acpi/aml-build=2Ec b/hw/acpi/aml-build=2Ec
>index 8966e16320=2E=2Eef5f4cad87 100644
>--- a/hw/acpi/aml-build=2Ec
>+++ b/hw/acpi/aml-build=2Ec
>@@ -2152,7 +2152,12 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, c=
onst AcpiFadtData *f,
>     build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
>     build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
>     build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
>-    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
>+    /* IAPC_BOOT_ARCH */
>+    if (f->rev =3D=3D 1) {
>+        build_append_int_noprefix(tbl, 0, 2);
>+    } else {
>+        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
>+    }
>     build_append_int_noprefix(tbl, 0, 1); /* Reserved */
>     build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
>=20
>diff --git a/hw/i386/acpi-build=2Ec b/hw/i386/acpi-build=2Ec
>index ebd47aa26f=2E=2E65dbc1ec36 100644
>--- a/hw/i386/acpi-build=2Ec
>+++ b/hw/i386/acpi-build=2Ec
>@@ -192,6 +192,14 @@ static void init_common_fadt_data(MachineState *ms, =
Object *o,
>             =2Eaddress =3D object_property_get_uint(o, ACPI_PM_PROP_GPE0=
_BLK, NULL)
>         },
>     };
>+    /*
>+     * second bit of 16 but IAPC_BOOT_ARCH indicates presence of 8042 or
>+     * equivalent micro controller=2E See table 5-10 of APCI spec versio=
n 2=2E0
>+     * (the earliest acpi revision that supports this)=2E
>+     */
>+
>+    fadt=2Eiapc_boot_arch =3D isa_check_device_existence("i8042") ? 0x00=
02 : 0x0000;

Couldn't qdev_find_recursive() be used here instead? This would also make =
patch 1 unneccessary=2E Same below=2E

Best regards
Bernhard

>+
>     *data =3D fadt;
> }
>=20
>diff --git a/hw/i386/acpi-microvm=2Ec b/hw/i386/acpi-microvm=2Ec
>index 68ca7e7fc2=2E=2Ee5f89164be 100644
>--- a/hw/i386/acpi-microvm=2Ec
>+++ b/hw/i386/acpi-microvm=2Ec
>@@ -189,6 +189,15 @@ static void acpi_build_microvm(AcpiBuildTables *tabl=
es,
>         =2Ereset_val =3D ACPI_GED_RESET_VALUE,
>     };
>=20
>+    /*
>+     * second bit of 16 but IAPC_BOOT_ARCH indicates presence of 8042 or
>+     * equivalent micro controller=2E See table 5-10 of APCI spec versio=
n 2=2E0
>+     * (the earliest acpi revision that supports this)=2E
>+     */
>+
>+    pmfadt=2Eiapc_boot_arch =3D isa_check_device_existence("i8042") ? 0x=
0002
>+                            : 0x0000;
>+
>     table_offsets =3D g_array_new(false, true /* clear */,
>                                         sizeof(uint32_t));
>     bios_linker_loader_alloc(tables->linker,
>diff --git a/include/hw/acpi/acpi-defs=2Eh b/include/hw/acpi/acpi-defs=2E=
h
>index c97e8633ad=2E=2E2b42e4192b 100644
>--- a/include/hw/acpi/acpi-defs=2Eh
>+++ b/include/hw/acpi/acpi-defs=2Eh
>@@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
>     uint16_t plvl2_lat;        /* P_LVL2_LAT */
>     uint16_t plvl3_lat;        /* P_LVL3_LAT */
>     uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
>+    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
>     uint8_t minor_ver;         /* FADT Minor Version */
>=20
>     /*


