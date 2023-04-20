Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F69D6E8C29
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:07:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPJ2-0003Ah-M0; Thu, 20 Apr 2023 04:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ppPJ0-0003AE-L6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:06:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ppPIy-0007oJ-2E
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:06:13 -0400
Received: by mail-wm1-x335.google.com with SMTP id he13so807393wmb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 01:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20221208.gappssmtp.com; s=20221208; t=1681977970; x=1684569970; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKOxyyL7AZDnCvvz/47DzqTsQzjXr1KI0sjQMLGyFPM=;
 b=CxSQrP5jya5slh9FsYs/6Sou+yduTsad6fuRzV6FsxhHN0Gqp2Sn3aTutsd4Q6MuEW
 wk8tfNfyhOqYiUBY7xF8MNLjgLGoobnzKBS8Lp/BFFBbkwzkRfyOPR7WSlWgVZHsnLXS
 e+QTomYo8Gh0MezXjgnJ22xCzou8huZZ8xyYqdmMQ/wLNZmVaEXj2NSewhuq6lOU1TSg
 8YknAeyiXld9stY3KJjLlGl3Mv8GLbrNRxyaeCNT3Es83x8tDn6F4ZB6bfvAIC2ZzTf2
 ZQfQpQmbD4xAP1K/BWCq0DH0hSvH3G93SSvNfXZvJQnttx0gJE2Irrd4huqPhIq7JMzV
 B1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681977970; x=1684569970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CKOxyyL7AZDnCvvz/47DzqTsQzjXr1KI0sjQMLGyFPM=;
 b=JbTbfTztHaqvJu9N4KOVDeHDFyMbDdHu6vkg8AS9bAj9Cjv3IuhPMo45ZXfeMR/J5b
 rl/Wd379QkZIqmnAf9mJGNX/DfvrtQGv1LQ384yjtk1f50fvnhYgmHCL22zVIoziHzc6
 vExvvJSVRVwmJRCYjn/rR9pkFw1hipjVOcps8ms+b3jCxTOLACr7Csu9O/A6SkD0FoKM
 /65Npl9NqPAhtk6HCnU0qdRwlf+gYUi+rny5Rf0KtYil29gn7k0o+XAUmcBYf4XXv9SZ
 obk8eM/cxHOSlJ9LcEmbSovw50IRA7HSN36LZit9DQcK9g1Ar86cj/0l1y4mqSU/7YV6
 k8vQ==
X-Gm-Message-State: AAQBX9cs/9gQrqq4Dkb1NWJQx9QWdh77PQk+nRD7iypi9mdNYE7ABEBV
 +m5eIXbsBWRqi+UHt3j49W4c/CyIQJr1VTTeETpuHA==
X-Google-Smtp-Source: AKy350ar6hj9x+K/bGFc93hkMfsPUfGsXgGs50ZAGLvIeS551hZC35kHd7l6SOxASZh1rL1ONynYMquzfsdEi3K6eWQ=
X-Received: by 2002:a05:600c:2182:b0:3f1:6527:df05 with SMTP id
 e2-20020a05600c218200b003f16527df05mr606024wme.22.1681977969831; Thu, 20 Apr
 2023 01:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230418165219.2036-1-eric.devolder@oracle.com>
 <20230418165219.2036-4-eric.devolder@oracle.com>
In-Reply-To: <20230418165219.2036-4-eric.devolder@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 20 Apr 2023 13:35:58 +0530
Message-ID: <CAARzgwwVAptvsR1_8ttUKroLuqKdLc1dHWtNe7S0S3N-Nq4otw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/acpi: i386: bump MADT to revision 5
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com, 
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, richard.henderson@linaro.org, 
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::335;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x335.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 18, 2023 at 10:22=E2=80=AFPM Eric DeVolder <eric.devolder@oracl=
e.com> wrote:
>
> Currently i386 QEMU generates MADT revision 3, and reports
> MADT revision 1. ACPI 6.3 introduces MADT revision 5.
>
> For MADT revision 4, that introduces ARM GIC structures, which do
> not apply to i386.
>
> For MADT revision 5, the Local APIC flags introduces the Online
> Capable bitfield.
>
> Making MADT generate and report revision 5 will solve problems with
> CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
>
> Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devol=
der@oracle.com/T/#t
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/i386/acpi-common.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 52e5c1439a..286c1c5c32 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *a=
pic_ids,
>  {
>      uint32_t apic_id =3D apic_ids->cpus[uid].arch_id;
>      /* Flags =E2=80=93 Local APIC Flags */
> -    uint32_t flags =3D apic_ids->cpus[uid].cpu !=3D NULL || force_enable=
d ?
> -                     1 /* Enabled */ : 0;
> +    bool enabled =3D apic_ids->cpus[uid].cpu !=3D NULL || force_enabled =
?
> +                     true : false;

how about "processor_enabled" instead of just "enabled" as the variable nam=
e.

> +    /*
> +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
> +     * if Enabled is set.
> +     */
> +    bool onlinecapable =3D enabled ? false : true;

ugh, how about uint32 onlinecapable =3D enabled? 0x0 : 0x2 ?

> +    uint32_t flags =3D onlinecapable ? 0x2 : 0x0 | /* Online Capable */
> +                     enabled ? 0x1 : 0x0; /* Enabled */

then here, flags =3D onlinecapable | processor_enabled? 0x1 : 0x0;

>
>      /* ACPI spec says that LAPIC entry for non present
>       * CPU may be omitted from MADT or it must be marked
> @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *=
linker,
>      MachineClass *mc =3D MACHINE_GET_CLASS(x86ms);
>      const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(MACHINE(=
x86ms));
>      AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(adev);
> -    AcpiTable table =3D { .sig =3D "APIC", .rev =3D 1, .oem_id =3D oem_i=
d,
> +    AcpiTable table =3D { .sig =3D "APIC", .rev =3D 5, .oem_id =3D oem_i=
d,
>                          .oem_table_id =3D oem_table_id };
>
>      acpi_table_begin(&table, table_data);
> --
> 2.31.1
>

