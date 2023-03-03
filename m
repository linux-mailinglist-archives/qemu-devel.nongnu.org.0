Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730526A939C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:19:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1ZA-00062R-B0; Fri, 03 Mar 2023 04:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pY1Z7-0005uM-Me; Fri, 03 Mar 2023 04:19:01 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pY1Z6-0007lh-5S; Fri, 03 Mar 2023 04:19:01 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-176261d7f45so2240262fac.11; 
 Fri, 03 Mar 2023 01:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vjUuaU8iRQmzJuSMiAxsxhJVxEi/r2HdAtNn0i4mpIA=;
 b=PuybkSnR7qn7t7x+vfO9vXF7tSgkL1Wea/LFBlmyaQJA6FlJs7jlPLgTnPpjGl/7Td
 fe1LrnScv5/92OkRsH1Vmyfzb65AYAyBTu2EWZYcPDZB7sFwyP7GjhTnDAZ0vUd2JjH8
 jev7MDAeYWYgpW+YHcMsxf1LX/5R4mKFowXi381Z/nenJH8svnp2iHK47CLmoK4yLQHp
 WaRIbjjGQJmhaGRe9bMHOV3gnW+dbiSmt8V4Lc4lT3WMK1qb695MSg9CSdYU2JiMf8sB
 L+PumAGQvJ41WltH3M/xtDFyFJj1aoMb3d2CmyH5PcF2di44F0x6E5z8onAW3MH5yG3A
 ZJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vjUuaU8iRQmzJuSMiAxsxhJVxEi/r2HdAtNn0i4mpIA=;
 b=EoZw98zqfv8JaEC5Fo1vDurGpcZpAA4lNPxvqlNQjgQTDgTaMb2ZCsdTjr5ywlCQ9g
 hpZ+JYtYzOSDMRC2UPaixxoREwJT4e0mTetePxndZwDHuzTirTDcTEnlvlTkB1u6AfsX
 +C9q7aR2+UZ6N3qOnR4erle8jwnNq3VsU7UFbFef8wBevqACXfPLEr/laUop7zv2TlCN
 wfEFiVIbIOtb/wzPxy6a5C02AElRwKHxBPAJ+yfOWZvaBhSNUadfTjEdMB6CtjK1vLtJ
 +3PI8m0fXYLQfItVRLDjh2gnUkfvAsPT7A3bPIZwlEZw31tF9OYdyTpNSmXeiEtSC1K6
 J6Xw==
X-Gm-Message-State: AO0yUKUi+ANDVM5Z0sNl8TZMhS/UuQD3pgzvH8LW+6MYEpaLVldoYd0I
 yGCNh8bVdP+BQCCUjxTptIdDjccHho4=
X-Google-Smtp-Source: AK7set9khtnQ9hlIEB2NcGeqDKvobgjxh04bYlEvFbuncSO7/HzL04WtB0YXnzTBWakG10kcWoVlfA==
X-Received: by 2002:a05:6870:e38b:b0:176:4762:3821 with SMTP id
 x11-20020a056870e38b00b0017647623821mr505281oad.23.1677835136932; 
 Fri, 03 Mar 2023 01:18:56 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a4ad24c000000b00524f546997esm640873oos.0.2023.03.03.01.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:18:56 -0800 (PST)
Message-ID: <fe96b6bd-86f8-3e7f-60aa-d469bcfff9f9@gmail.com>
Date: Fri, 3 Mar 2023 06:18:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] pnv_phb4_pec: Only export existing PHBs to the device
 tree
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20230302163715.129635-1-fbarrat@linux.ibm.com>
 <20230302163715.129635-3-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230302163715.129635-3-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 3/2/23 13:37, Frederic Barrat wrote:
> So far, we were always exporting all possible PHBs to the device
> tree. It works well when using the default config but it potentially
> adds non-existing devices when using '-nodefaults' and user-created
> PHBs, causing the firmware (skiboot) to report errors when probing
> those PHBs. This patch only exports PHBs which have been realized to
> the device tree.
> 
> Fixes: d786be3fe746 ("ppc/pnv: enable user created pnv-phb for powernv9")
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb4_pec.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 97c06bb0a0..6c9b386069 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -199,9 +199,12 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>                         pecc->compat_size)));
>   
>       for (i = 0; i < pec->num_phbs; i++) {
> -        int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
>           int stk_offset;
>   
> +        if (!pec->phbs[i]) {
> +            continue;
> +        }
> +
>           name = g_strdup_printf("stack@%x", i);
>           stk_offset = fdt_add_subnode(fdt, offset, name);
>           _FDT(stk_offset);
> @@ -209,7 +212,8 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>           _FDT((fdt_setprop(fdt, stk_offset, "compatible", pecc->stk_compat,
>                             pecc->stk_compat_size)));
>           _FDT((fdt_setprop_cell(fdt, stk_offset, "reg", i)));
> -        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb_id)));
> +        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index",
> +                               pec->phbs[i]->phb_id)));
>       }
>   
>       return 0;

