Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D180758EBF1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 14:27:22 +0200 (CEST)
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLknx-0000p9-DF
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 08:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkgi-0002VV-P0
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:19:52 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkgf-00014W-1d
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:19:52 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 186-20020a1c02c3000000b003a34ac64bdfso917656wmc.1
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=2Jipa5cCVLQr1pCuJwLIKcVPQhTtTjmjFqhQGp0LHLA=;
 b=J8SUt/TIcIDwqF6kQXBizFPsBqrkCvyKaZok+fZwUpDbKmjO43mpwj8uEM461HnXwX
 cnFV+Oq7EfFEVVsdwL1UfbAaNkWvAbHdVXLuevaOBBPI3k0+Ken2ABcyfJSE8VcOnkYx
 1JaeYqozp8v8ASzuPFwy+LalBlPA5mx+RjvgZnl/HLDMkuxTvbwazxGWguMJRhtrLSsB
 0kcA58ihmPwQvHhcVN3YXZ1ho+ixcovgFabFhJmf0prdepDo8x3b5+dMM2W7GtkgqrkT
 chKXQqeMsycPjBw82zxK/34/j9WNsKik/bT7usUW+ldGQqRKAcv/KVIKUgdKbP+X80h1
 WIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=2Jipa5cCVLQr1pCuJwLIKcVPQhTtTjmjFqhQGp0LHLA=;
 b=B56vQ0epxkyRwdE1HlDtPR5mYc38KxTaoM+/S1ndYSMLh3ATmXRvWVxeZyFC22dNTY
 t/yjEdnLRjBBEqynlvmOtFkGJWbDwBRLHUCehLfgGWVNTVC2vwoMDTXEXfiajK0gMDcb
 ryGD8jDNdgicmPHblzIDvmZoapkimCdDGyHG7QTJHM96gPuhrV8Cd/9qHFNwtLkpqu/D
 45QIt8nfI5BpepXFq3FO57gSXKccDRlokCGKh1cxmO0UeBddurgP2bLC2ozEATtstfhV
 WHz9WkcLW9NTzaDK2n3KXZUduaJRd86OYDOPxpvslzy9UFXAZdYvyhzzVrztx+ip6wfY
 YQZQ==
X-Gm-Message-State: ACgBeo1zvG3hGtr2s1rIPh1BtY+Qs0Cmtv/XbilV99VmAuu2H99pRPjl
 smCMRmrjx3JR0NQRpz2QtJfxoQ==
X-Google-Smtp-Source: AA6agR5GyGgwHx6fuQBW07XOGgbEKTsPVvgePKSLJAjpU77hGbSz7ASw15hvLNtwqiUDS3A42ID1xQ==
X-Received: by 2002:a05:600c:350:b0:3a5:3473:1c23 with SMTP id
 u16-20020a05600c035000b003a534731c23mr2344563wmd.9.1660133984409; 
 Wed, 10 Aug 2022 05:19:44 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a1c4304000000b003a5a5069107sm2150830wma.24.2022.08.10.05.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:19:43 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:19:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 1/6] device_tree: add qemu_fdt_setprop_strings() helper
Message-ID: <20220810121942.rlegpjuprzj3qsvd@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-2-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-2-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Aug 09, 2022 at 07:56:35PM +0100, Ben Dooks wrote:
> Add a helper to set a property from a set of strings
> to reduce the following code:
> 
>     static const char * const clint_compat[2] = {
>         "sifive,clint0", "riscv,clint0"
>     };
> 
>     qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
>         (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
> v4:
>  - go back to the non-return call, no-one is using the result
> v3;
>  - fix return value for the call
>  - add better help text
> v2:
>  - fix node/path in comment
> ---
>  include/sysemu/device_tree.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..d5c05b5ebb 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -87,6 +87,25 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
>  int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
>                                    const char *prop, char **array, int len);
>  
> +/**
> + * qemu_fdt_setprop_strings: set a property from a set of strings
> + *
> + * @fdt: pointer to the dt blob
> + * @path: node name
> + * @prop: property array
> + *
> + * This is a helper for the qemu_fdt_setprop_string_array() function
> + * which takes a va-arg set of strings instead of having to setup a
> + * single use string array.
> + */
> +#define qemu_fdt_setprop_strings(fdt, path, prop, ...)          \
> +    do {                                                        \
> +        static const char * const __strs[] = { __VA_ARGS__ };   \

           ^^ We don't want that static there. That'll keep the storage
	   for each invocation and require that __VA_ARGS__ are always
	   constants only.

	   I'd drop the const's too since __strs is only used for a
	   single call where it immediately gets the const's cast'ed
	   away.

> +        qemu_fdt_setprop_string_array(fdt, path, prop,          \
> +                (char **)&__strs, ARRAY_SIZE(__strs));          \

                   ^^ And then this can just be __strs

> +     } while(0)
> +
> +
>  int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>                               const char *property,
>                               const char *target_node_path);
> -- 
> 2.35.1
> 
> 

Thanks,
drew

