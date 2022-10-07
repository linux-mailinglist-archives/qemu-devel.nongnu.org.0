Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12165F737B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 06:04:48 +0200 (CEST)
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogebO-0001oF-OG
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 00:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogeWZ-0008L8-V6
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 23:59:48 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogeWW-0005xL-Ux
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 23:59:47 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 67so3828223pfz.12
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 20:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=c317dYnxQFZQWlyGeFVdBMlu7n93374v7nILe6WpLLI=;
 b=j24mJ0ft8UFm6gDBsVaeLGptmA1Fmme2uIMv5L8C+K5dN8dR3Hk2UlL1tudGLXs4S+
 hJ4BKn3tFaFAx0TOCHHUtsyFYtylVuXCq6fMn0mE3kCOhU2n6NKTSolBkOWohYtEKSsD
 hokngT0cOnHcksWT0dOBinjvf9anGUMXMOQJspXTOpxRRjkbPmLO/k7fTh80PSypwg4r
 Q/zAyGpATeccudQsHLnlPfclifYWFN7BIU3SWp7Ozrqatv46yGjV965gtbqEkbSeVc5A
 6oK3XgBvs+DqkqUOC/OGAKt54We4bkeGfmRmoCz4ZqJOdsATPL/75NHnPS0JXGiDPRVt
 xCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c317dYnxQFZQWlyGeFVdBMlu7n93374v7nILe6WpLLI=;
 b=vLtWykkD/XO105aGsm5cpvS1oWEKy+purUzwpYOlnVgf34ZT7L0a9ZsSGob6g5zc14
 uuxpRGkuizOZjqZh15wXI4WglTto8TAGzxJ/qwHzyzP4b0XoaSkUD6MsAvs1Bsvidxgg
 PQ7M3EDE/XO4ffulsMdfSkmOtOF4mZmLBg2buVigsOxqLWrIxsl6V2TpVrit6Kc/tMU3
 zKyasgWmoLZodPFs0ldHmO0qd/oS3pGVScJb7ZcNpT3oJloJy4ieLPadnLKJxYByD56s
 Oe78wvk9BMisA6QTIeMfqPFfpt+XYhFcQYZdOCgCp+ZCz0EZhp4hr8M9vIP5cuuNOMci
 Vfhg==
X-Gm-Message-State: ACrzQf387tcEG/PMX2qVHADkD0wnhRx6REJM81kHyJbP+Zir64a87QKc
 fO1wu68Gv5Q+jDcJRLrsnAT1eQ==
X-Google-Smtp-Source: AMsMyM5Qc2JsULN8IL4ovn916EXYAKpJULSOMGZRyLl3lDt9a8a9j0g7Py1zEO7B6TVRDbBeN9puYA==
X-Received: by 2002:a05:6a00:e8f:b0:536:c98e:8307 with SMTP id
 bo15-20020a056a000e8f00b00536c98e8307mr3211460pfb.73.1665115183077; 
 Thu, 06 Oct 2022 20:59:43 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.124.100])
 by smtp.googlemail.com with ESMTPSA id
 e3-20020a056a0000c300b00561dcfa700asm439873pfj.107.2022.10.06.20.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 20:59:42 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 7 Oct 2022 09:29:37 +0530 (IST)
To: Miguel Luis <miguel.luis@oracle.com>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, shannon.zhaosl@gmail.com, 
 peter.maydell@linaro.org
Subject: Re: [RFC PATCH 3/4] acpi: arm/virt: madt: bump to revision 4
 accordingly to ACPI 6.0 Errata A
In-Reply-To: <20221006161450.69912-4-miguel.luis@oracle.com>
Message-ID: <a63d241c-20ab-ca11-6456-4fa0b9485366@anisinha.ca>
References: <20221006161450.69912-1-miguel.luis@oracle.com>
 <20221006161450.69912-4-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



On Thu, 6 Oct 2022, Miguel Luis wrote:

> MADT has been updated with the GIC Structures from ACPI 6.0 Errata A
> and so MADT revision and GICC Structure must be updated also.
>
> Fixes: 37f33084ed2e ("acpi: arm/virt: madt: use build_append_int_noprefix() API to compose MADT table")
>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/arm/virt-acpi-build.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 72bb6f61a5..2d21e3cec4 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -686,7 +686,7 @@ build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  };
>
>  /*
> - * ACPI spec, Revision 5.1 Errata A
> + * ACPI spec, Revision 6.0 Errata A
>   * 5.2.12 Multiple APIC Description Table (MADT)
>   */
>  static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
> @@ -705,7 +705,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int i;
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      const MemMapEntry *memmap = vms->memmap;
> -    AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
> +    AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
>
>      acpi_table_begin(&table, table_data);
> @@ -740,7 +740,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>
>          /* 5.2.12.14 GIC Structure */
>          build_append_int_noprefix(table_data, 0xB, 1);  /* Type */
> -        build_append_int_noprefix(table_data, 76, 1);   /* Length */
> +        build_append_int_noprefix(table_data, 80, 1);   /* Length */
>          build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
>          build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
>          build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
> @@ -760,6 +760,10 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          build_append_int_noprefix(table_data, 0, 8);    /* GICR Base Address*/
>          /* MPIDR */
>          build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
> +        /* Processor Power Efficiency Class */
> +        build_append_int_noprefix(table_data, 0, 1);
> +        /* Reserved */
> +        build_append_int_noprefix(table_data, 0, 3);
>      }
>
>      if (vms->gic_version != VIRT_GIC_VERSION_2) {
> @@ -771,12 +775,6 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          }
>
>          if (its_class_name() && !vmc->no_its) {
> -            /*
> -             * FIXME: Structure is from Revision 6.0 where 'GIC Structure'
> -             * has additional fields on top of implemented 5.1 Errata A,
> -             * to make it consistent with v6.0 we need to bump everything
> -             * to v6.0
> -             */
>              /*
>               * ACPI spec, Revision 6.0 Errata A
>               * (original 6.0 definition has invalid Length)
> --
> 2.37.3
>
>

