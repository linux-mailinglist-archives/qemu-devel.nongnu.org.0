Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F82E47F9A7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 02:36:56 +0100 (CET)
Received: from localhost ([::1]:35924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1ewY-0006Qu-O8
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 20:36:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shannon.zhaosl@gmail.com>)
 id 1n1eul-0005i5-L4
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 20:35:04 -0500
Received: from [2607:f8b0:4864:20::1030] (port=51110
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shannon.zhaosl@gmail.com>)
 id 1n1euk-0002WF-0a
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 20:35:03 -0500
Received: by mail-pj1-x1030.google.com with SMTP id gj24so12305192pjb.0
 for <qemu-devel@nongnu.org>; Sun, 26 Dec 2021 17:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KYqCT2vdk7agKHnboHtfnlObDlSNL/rSXiO8mw6OCpk=;
 b=TAkiPccGX7qBlz8ouno8OYp3nw2Plccm6yp1R+GFZtblFA26gERgqGkZNHCAiAqusx
 Mwxt+ZH4WQrc83QA2wcoxfyBNVqqyNeAyvjcgopVkqnxHoW6sLsGETSUZkGpsyt1xev8
 b6KN5M5n/twYR0xkQFnvhlbUnvLMczFW5nk6NOpBo+dGe3nMePAFxPxMOQLu545Rvjfv
 qbiuMR4PLzmhELVCheBhq/zg0r9NSTJk3GB7JObTX7max+GpkInjB441WONglI+T8Tg8
 ERmryCmT8tdX96gq2807654xI80CSZipBtVv+SJvmfrQigjC3WNRGT3TbZAwO+xLw20p
 DzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KYqCT2vdk7agKHnboHtfnlObDlSNL/rSXiO8mw6OCpk=;
 b=QHP1I3SdjmQRFMOZO3KV5XcgcFwGaBEcWQ2OKiTHJu6A38JHeSnqBI9ZWhWD1jW1Mp
 AJv/yWFCVnvv3SOomKCM+PQItxgvAN+I23Xpq2LUCSLicRH+zUJkFgmsBz2m2n/7xKXa
 x3KoqFu5BYm92cSRyDJU3Bc8tcgdzKQl9Dz3COLsbpx9d/emOmMhs8gnSxWjVs4RKBsh
 7gFKG6BvKxSh0LhB/Emj4UQfUkqFFAugRNgxjq3haWat0R0eQ2W9WQ8kPVcNz9wsD+BD
 QWsmITRPkgbZQ7NCzqr0/cxt2xfeIg10nZDdcPs9Hc6gLXORubB3sT2MW6jf8KcjRoin
 cYrA==
X-Gm-Message-State: AOAM532e4BU3DXY3ycOK0R5+5QPHOeAnS3VTIEI/rB4/x7IpHDrTVDzH
 /hrJex1fQjudZ4dELflAeIo=
X-Google-Smtp-Source: ABdhPJxorLSu7Y7In12dW9mrI+mG85L772bBINUesf/2tNFyjZcvlehamY0QFh1IZ+0z8+dgiOa8iA==
X-Received: by 2002:a17:90a:db0f:: with SMTP id
 g15mr18967152pjv.76.1640568899944; 
 Sun, 26 Dec 2021 17:34:59 -0800 (PST)
Received: from [30.43.104.201] ([47.89.83.34])
 by smtp.gmail.com with ESMTPSA id cx5sm13878321pjb.22.2021.12.26.17.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Dec 2021 17:34:59 -0800 (PST)
Message-ID: <784f44d1-0f90-3c02-52ba-02f8a6824464@gmail.com>
Date: Mon, 27 Dec 2021 09:34:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] acpi: tpm: Add missing device identification
 objects
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211223022310.575496-1-stefanb@linux.ibm.com>
 <20211223022310.575496-3-stefanb@linux.ibm.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
In-Reply-To: <20211223022310.575496-3-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=shannon.zhaosl@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.063, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/12/23 10:23, Stefan Berger wrote:
> Add missing device identification objects _STR and _UID. They will appear
> as files 'description' and 'uid' under Linux sysfs.
> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/708
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Message-id: 20211110133559.3370990-3-stefanb@linux.ibm.com
> ---
>   hw/arm/virt-acpi-build.c | 1 +
>   hw/i386/acpi-build.c     | 8 ++++++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d0f4867fdf..f2514ce77c 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>   
>       Aml *dev = aml_device("TPM0");
>       aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
>       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>
For ARM part
Reviewed-by: Shannon Zhao <shannon.zhaosl@gmail.com>

>       Aml *crs = aml_resource_template();
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 8383b83ee3..2fb70847cb 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                       dev = aml_device("TPM");
>                       aml_append(dev, aml_name_decl("_HID",
>                                                     aml_string("MSFT0101")));
> +                    aml_append(dev,
> +                               aml_name_decl("_STR",
> +                                             aml_string("TPM 2.0 Device")));
>                   } else {
>                       dev = aml_device("ISA.TPM");
>                       aml_append(dev, aml_name_decl("_HID",
>                                                     aml_eisaid("PNP0C31")));
>                   }
> +                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>   
>                   aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
>                   crs = aml_resource_template();
> @@ -1844,6 +1848,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>       if (TPM_IS_CRB(tpm)) {
>           dev = aml_device("TPM");
>           aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +        aml_append(dev, aml_name_decl("_STR",
> +                                      aml_string("TPM 2.0 Device")));
>           crs = aml_resource_template();
>           aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
>                                              TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
> @@ -1851,6 +1857,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>   
>           aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
>   
> +        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> +
>           tpm_build_ppi_acpi(tpm, dev);
>   
>           aml_append(sb_scope, dev);

