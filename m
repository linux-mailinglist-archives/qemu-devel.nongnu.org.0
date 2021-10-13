Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBFD42C4CB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 17:28:56 +0200 (CEST)
Received: from localhost ([::1]:55094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1magBb-00086R-D8
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 11:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1magA3-0006pO-U2
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:27:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1magA1-0000Ol-Ml
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:27:19 -0400
Received: by mail-wr1-x432.google.com with SMTP id o20so9729785wro.3
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bfgnOdbwJRp0NIxxPBNQWrnxn9WFX0mV0Q4/AkhcGgY=;
 b=dEkFHyEMLElRG4rt4Swk8+P/WDxvIHKoZ17p7wf756XDPR30Fhyplz4ng3WxzSEQN8
 7aNoE6MadVLjGvqjMOtInyMKguwaQXyH2CwPCragnLn1Jx+24fAm794lzxWMG8vduEUt
 xNWfwVbUY/xxi/j0IcIq7I1938jhL2rrmKzz/qeaIav8MpIs5WsKhqhEBoMIWWY30jkH
 iZss1qy08PImYdN4qGL8tyi8XKHiK9lFa0DiggY9uUwjEVQ7FtI11giLlHpaitZoopgB
 EtLvSCL5cJfZEnmdrWGQCoOX/hhc13MhMHx/uEGDsU5VeNKAIkAvl0Z36qhDuqRTyhat
 qDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bfgnOdbwJRp0NIxxPBNQWrnxn9WFX0mV0Q4/AkhcGgY=;
 b=tlWTc9H1vl+4md36xDxUtjxsHE4lFNtUnTT0tq8/YTH8AmwspQ38KuWh1C1lyhAiRJ
 1m2TX/6vFfBQiA+eiOdxZk9PlbzNMnBY6kPpQxkP48ClJ6L2Bi1FBe0P9DfmoVbtoL3f
 8mdgEq0/2WP64t2dxGp7NINUzU5A6acZy4RKqfgd1KrQVEanvGvJo4B52RkFFQZQPav+
 vy/1g/X04ekuMOAMkjxj+alp4sW/PwH9mCxhskWFOt/Y4LUXsBH+ANcrUHyHKQl3uQf6
 nCwtiC8wkjIFjzcOVj+ib4+kqHKQ9TTT2WlNbuwPyhzyjLoID6YYIsIDd24yYNVEG9GQ
 yMmQ==
X-Gm-Message-State: AOAM5304Ge13YYtew/+bADLhZBV+Rjo4+v7XEoKzOLLHgSJDkb6nloI9
 6wv4+oiKcpcyZb3t2WschDdpCQ==
X-Google-Smtp-Source: ABdhPJwwy1LHCglFvmWHlUBxZfTFmUjz4faX722CwbokswAEqXUn3M/ibtdeHR3WhuSLU8yCoi23rg==
X-Received: by 2002:a5d:4310:: with SMTP id h16mr41506973wrq.424.1634138834229; 
 Wed, 13 Oct 2021 08:27:14 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id d3sm14051328wrb.36.2021.10.13.08.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 08:27:13 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:26:51 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/3] hw/arm/virt-acpi-build: IORT upgrade up to
 revision E.b
Message-ID: <YWb6uz/tGABul80g@myrica>
References: <20211005083805.493456-1-eric.auger@redhat.com>
 <20211005083805.493456-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005083805.493456-3-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, philmd@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 10:38:04AM +0200, Eric Auger wrote:
> Upgrade the IORT table from B to E.b specification
> revision (ARM DEN 0049E.b).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Two nits below

> 
> ---
> 
> v1 -> v2:
> - Fix Revision value for ITS node and SMMUv3 node
> - increment an identifier
> ---
>  hw/arm/virt-acpi-build.c | 48 ++++++++++++++++++++++++----------------
>  1 file changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 257d0fee17..789bac3134 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -241,19 +241,20 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  #endif
>  
>  #define ID_MAPPING_ENTRY_SIZE 20
> -#define SMMU_V3_ENTRY_SIZE 60
> -#define ROOT_COMPLEX_ENTRY_SIZE 32
> +#define SMMU_V3_ENTRY_SIZE 68
> +#define ROOT_COMPLEX_ENTRY_SIZE 36
>  #define IORT_NODE_OFFSET 48
>  
>  static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
>                                    uint32_t id_count, uint32_t out_ref)
>  {
> -    /* Identity RID mapping covering the whole input RID range */
> +    /* Table 4 ID mapping format */
>      build_append_int_noprefix(table_data, input_base, 4); /* Input base */
>      build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
>      build_append_int_noprefix(table_data, input_base, 4); /* Output base */
>      build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
> -    build_append_int_noprefix(table_data, 0, 4); /* Flags */
> +    /* Flags */
> +    build_append_int_noprefix(table_data, 0 /* Single mapping */, 4);

The comment is a bit confusing, seems to indicate that "Single mapping" is
enabled by value 0

>  }
>  
>  struct AcpiIortIdMapping {
> @@ -298,7 +299,7 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>  /*
>   * Input Output Remapping Table (IORT)
>   * Conforms to "IO Remapping Table System Software on ARM Platforms",
> - * Document number: ARM DEN 0049B, October 2015
> + * Document number: ARM DEN 0049E, Feb 2021

0049E.b?

>   */
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)

