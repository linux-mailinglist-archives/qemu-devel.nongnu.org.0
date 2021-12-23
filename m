Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921B447DF76
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 08:19:37 +0100 (CET)
Received: from localhost ([::1]:59524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0IO0-0005pm-2X
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 02:19:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n0IHt-0004L6-1a
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 02:13:17 -0500
Received: from [2607:f8b0:4864:20::42a] (port=42949
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n0IHr-0003MM-2I
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 02:13:16 -0500
Received: by mail-pf1-x42a.google.com with SMTP id t19so4479373pfg.9
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 23:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=yaHlMNMytXAQExWxbQx/K1Zi/WQLWWRwpPYWi5M0rKE=;
 b=GyK88hpplTfvFaQXYLWKCsW8Ywi3vSgQBNeC4QdyyIxsETePi6L/qYiEmKiVPcJnad
 FDUe89pK7GGQQjdDg5E5IJbUBsO6E8jylpkNNbJSLNlnDsSkWqEwF2rdfajjSriZp6fu
 UuwlBtclQKwvwlzbL+9Zb6th/D5AcCj1lZn9aSnoHmDEKU6I0PwwK1TmwCmiLzPn3O7Z
 m08vOq/+ElbX7I5rNCLTEnTthXF8ZAumbQHbMZSKMTL7N6dLlTPry5SHZzLrt3TxS7RH
 C4tlzyvuBlr9D3TWJIIKAq6orf8GotX2Ex6U3QvQoHg2DNMefR3iibLBNO4zzvq/L3/m
 9wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=yaHlMNMytXAQExWxbQx/K1Zi/WQLWWRwpPYWi5M0rKE=;
 b=ka2ZkHFVt+JWuv0DP/5Kas89JMn3T1U2g7rYW0Oq/4yX1VBQvIqF26bhw4AcZ97kbP
 FUXFz/BN6w4APMuXx+FhlkA1mpQEzWokgLd5okmE9/ucuU1JhcI4UGGFVCIZKrtCdxZM
 GarIeg+O0k1vaVJerssajiQkOdvNH76Lh/BdV0e3qANgN9Z+aH0awUUvGU8HWIRDDtbQ
 SFlJClJFZohVnKsC4JoIQF60ontWgGwuAkXKFcC+ovgDY4lKgtWvdfbZJe79XEV2zRma
 Tks3tOrzGCAjJ6LEMG+ZjJmMsuVElYwr7lqvaBxgEqg3v39exnoWQ3vLRPx9il6dAMWU
 nWLA==
X-Gm-Message-State: AOAM533mNYEaTYwFxx1bl2vXbLQedyi3DOEMGJALfZF+HzPu2j01eF/I
 dMR0ug3VJVec18rx1YfmV5r1IA==
X-Google-Smtp-Source: ABdhPJyQyQ7EPOGRkns7nsAHp+GkHq/7I+Y7EbG/1F7FobwkTSvHGm2PV//WyUWbq1Q519gjebyHhA==
X-Received: by 2002:a63:804a:: with SMTP id j71mr1120884pgd.72.1640243590889; 
 Wed, 22 Dec 2021 23:13:10 -0800 (PST)
Received: from [192.168.1.7] ([115.96.109.44])
 by smtp.googlemail.com with ESMTPSA id q28sm3998867pgn.14.2021.12.22.23.13.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Dec 2021 23:13:10 -0800 (PST)
Date: Thu, 23 Dec 2021 12:43:04 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 2/3] acpi: tpm: Add missing device identification
 objects
In-Reply-To: <20211223022310.575496-3-stefanb@linux.ibm.com>
Message-ID: <alpine.OSX.2.20.2112231233001.2839@athabasca.local>
References: <20211223022310.575496-1-stefanb@linux.ibm.com>
 <20211223022310.575496-3-stefanb@linux.ibm.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 22 Dec 2021, Stefan Berger wrote:

> Add missing device identification objects _STR and _UID. They will appear
> as files 'description' and 'uid' under Linux sysfs.
>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/708
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> Message-id: 20211110133559.3370990-3-stefanb@linux.ibm.com
> ---
>  hw/arm/virt-acpi-build.c | 1 +
>  hw/i386/acpi-build.c     | 8 ++++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d0f4867fdf..f2514ce77c 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>
>      Aml *dev = aml_device("TPM0");
>      aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>
>      Aml *crs = aml_resource_template();
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 8383b83ee3..2fb70847cb 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                      dev = aml_device("TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_string("MSFT0101")));
> +                    aml_append(dev,
> +                               aml_name_decl("_STR",
> +                                             aml_string("TPM 2.0 Device")));
>                  } else {
>                      dev = aml_device("ISA.TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_eisaid("PNP0C31")));
>                  }
> +                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>
>                  aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
>                  crs = aml_resource_template();
> @@ -1844,6 +1848,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      if (TPM_IS_CRB(tpm)) {
>          dev = aml_device("TPM");
>          aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +        aml_append(dev, aml_name_decl("_STR",
> +                                      aml_string("TPM 2.0 Device")));

Should we put a check here to make sure it is a 2.0 version like the code
hunk above for TIS_ISA? I looked around and it seems CRB is only
available for TPM
2.0 in which case it is probably ok but still making sure.

https://qemu.readthedocs.io/en/latest/specs/tpm.html


>          crs = aml_resource_template();
>          aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
>                                             TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
> @@ -1851,6 +1857,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>
>          aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
>
> +        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> +
>          tpm_build_ppi_acpi(tpm, dev);
>
>          aml_append(sb_scope, dev);
> --
> 2.31.1
>
>

