Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CFD437560
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:20:53 +0200 (CEST)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrfO-0004oq-OV
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mdrdN-0003z9-VO
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:18:46 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:47031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mdrdL-0001Wj-I2
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:18:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id i1so2351024plr.13
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=L3QgZzoKtdEqA9F3QjI+nt/pnBoF+jMTc0H7P8I6zKU=;
 b=7wz2Ld7gY3dx0mMo6LtR4amvARWYM0HT9xKh7bOsYuDMriERrDaJl6cG8pe37ARtT3
 SFhVoz57HYRVqy9JNR6JOn6oBEZ0+qrCQBg/LMxWdo+Uiq+k3Jxx+jmHQWNZ8kQQ2zqx
 iNOecR/sQpTC9J0g/Iubhs2GO7PGzpWXpMjMw+iEusMAyN1rIlZVpfl12GKVidaK4mN4
 mvdBg2Zg42TVaxE2di4CUtojfWeeptNjCRLPPvapix27lojv9xO81UgMuvyr6UlPb0xj
 kyoju8oBP/g66PAVIlMh+ZwWXJoHHYqLn1K8f76UAUeigxW0iX3+MMhHAMAWzyd7w82j
 LYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=L3QgZzoKtdEqA9F3QjI+nt/pnBoF+jMTc0H7P8I6zKU=;
 b=rMtpjhf9J7wJbBLVcOw73o1EVEaZXrhYuf4rh29CVPOKqQ3P8Gd172rUdu+P4hPQle
 xXOx5slxtUr6Gz/ZjvWIkHko/FVod7eYx+mO5psWFSnE+0sQi+v1on3zRwtyw8kW65+8
 fJ43fq+h+43HCla13crPEMrVzoX8cN1dNw8UGP4eKW8oYoibetOhW1hHyqqWc7ANwod6
 OA59jC1U9G5+mokcx59MwlKt2kitEYzLIO/8OuxndR/X5Y31Ms+tHxgFNJLVSYyaOdP/
 ghUZn6U4F+Y2cDnsGARFffef25yY7recW4rZgxcCG+qy2BsuGnYHcFKVD6rNaulHMPrb
 gNyg==
X-Gm-Message-State: AOAM532pIeuDYHaqHySvxTVAJ4USK+r5z+aGJcqLwFfhhXgAl0sxjUCK
 jYu+YMaeYXo28PVnewmdjTLsBg==
X-Google-Smtp-Source: ABdhPJxbO5JfBCcZ5ZdCf64aGu60CpD1h5Tld9mCSRPjkANAiLvXZau9hMho39rDsebbXLDaL8jPLg==
X-Received: by 2002:a17:90b:1049:: with SMTP id
 gq9mr13376644pjb.180.1634897920992; 
 Fri, 22 Oct 2021 03:18:40 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.152.159])
 by smtp.googlemail.com with ESMTPSA id g5sm317685pfc.65.2021.10.22.03.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 03:18:40 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 22 Oct 2021 15:48:33 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v8 07/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines
In-Reply-To: <1634324580-27120-8-git-send-email-eric.devolder@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2110221545440.268000@anisinha-lenovo>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
 <1634324580-27120-8-git-send-email-eric.devolder@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 ani@anisinha.ca, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 15 Oct 2021, Eric DeVolder wrote:

> This change exposes ACPI ERST support for x86 guests.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/i386/acpi-build.c   | 9 +++++++++
>  hw/i386/acpi-microvm.c | 9 +++++++++
>  include/hw/acpi/erst.h | 5 +++++
>  3 files changed, 23 insertions(+)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 81418b7..9c2f9d9 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -43,6 +43,7 @@
>  #include "sysemu/tpm.h"
>  #include "hw/acpi/tpm.h"
>  #include "hw/acpi/vmgenid.h"
> +#include "hw/acpi/erst.h"
>  #include "sysemu/tpm_backend.h"
>  #include "hw/rtc/mc146818rtc_regs.h"
>  #include "migration/vmstate.h"
> @@ -2499,6 +2500,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      GArray *tables_blob = tables->table_data;
>      AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
>      Object *vmgenid_dev;
> +    Object *erst_dev;
>      char *oem_id;
>      char *oem_table_id;
>
> @@ -2560,6 +2562,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>                      ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>                      x86ms->oem_table_id);
>
> +    erst_dev = find_erst_dev();
> +    if (erst_dev) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_erst(tables_blob, tables->linker, erst_dev,
> +                   x86ms->oem_id, x86ms->oem_table_id);
> +    }
> +

This needs to be ifdef'd between CONFIG_ERST.


>      vmgenid_dev = find_vmgenid_dev();
>      if (vmgenid_dev) {
>          acpi_add_table(table_offsets, tables_blob);
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c

I do not think we need to include this for microvm machines. They are
supposed to have minimal ACPUI support. So lets not bloat it unless there
is a specific requirement to support ERST on microvms as well.


> index 196d318..662c8ad 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -30,6 +30,7 @@
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/utils.h"
> +#include "hw/acpi/erst.h"
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/microvm.h"
>  #include "hw/pci/pci.h"
> @@ -158,6 +159,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>      X86MachineState *x86ms = X86_MACHINE(mms);
>      GArray *table_offsets;
>      GArray *tables_blob = tables->table_data;
> +    Object *erst_dev;
>      unsigned dsdt, xsdt;
>      AcpiFadtData pmfadt = {
>          /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
> @@ -207,6 +209,13 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>                      ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>                      x86ms->oem_table_id);
>
> +    erst_dev = find_erst_dev();
> +    if (erst_dev) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_erst(tables_blob, tables->linker, erst_dev,
> +                   x86ms->oem_id, x86ms->oem_table_id);
> +    }
> +



>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
>                 x86ms->oem_table_id);
> diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
> index 9d63717..b747fe7 100644
> --- a/include/hw/acpi/erst.h
> +++ b/include/hw/acpi/erst.h
> @@ -16,4 +16,9 @@ void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>
>  #define TYPE_ACPI_ERST "acpi-erst"
>
> +/* returns NULL unless there is exactly one device */
> +static inline Object *find_erst_dev(void)
> +{
> +    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
> +}
>  #endif
> --
> 1.8.3.1
>
>

