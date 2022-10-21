Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664ED607097
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 08:57:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollyb-0006vV-CA
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:57:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollxP-0004hJ-EH
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1ollxA-0004BZ-1d
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:56:27 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1ollx8-0007I0-0J
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:56:23 -0400
Received: by mail-ed1-x535.google.com with SMTP id t16so2940193edd.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 23:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n3M7VM54w6TTnxwW0xFBTdrPFLiI4kH4Y+jYA/IxDXM=;
 b=dEEJ+BQg7gCirRoBdxykOu1/wzG+hZrju7ZLm3y/BA2iVPPekd159s4g1ITvWidfAx
 Vs9GjXQ8DwCKVqgHHvBn7oL07xnnNiPwrYQm+Rijf7TIwXaNxgk5EbfItZ+54YcEEHbD
 Sj6XjxaN/+qwwIMx/Y5yXxIokt9MgqkJblqfTn3xQ9jD+2lThnj9AjaD73RwgxSPbqd5
 0d/6bQ1Pm/Y8BEWKZvDfKhg5WA7kys7b2P7CvZjKee2CwtBAdya57y8exPo4SlnWg0GL
 sQIMcoxDQ/3B3PExGwyf2PAbfJEK5+wCDzb4VdI7uJCLw67n1WSL5bLhxIHz6j4+YgmW
 iPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3M7VM54w6TTnxwW0xFBTdrPFLiI4kH4Y+jYA/IxDXM=;
 b=UJ6sz3zpIGEgPyOWGbUviq5DNqetoGM5e8RnIbhgZ4J3FtEtUUQo/Pm3Y3evZDx+KM
 PzlQdX74ppR6PyWv86FrtFSmeIJuWP5dy/CKcDxln41WnPNho5lo2dlxYTWxDLWnCmvp
 kPRHrsNmjJw41KEHzHM0bvRjX3ThKqTBPSWnfRB9tqz4Zw5l0awuNcd7I0Vyni9r71rz
 SYVBLDTE27Tafh7wXzAlCNc5S83FMR5XsG/tLky2v32A7z4uK3O05w1/JjSXcOIiqJwt
 NceHPI9f1EkcA7zuJgurMUxnsrpiIJW6jJB5FJ9dlwnxGAZooygXJQ0LXzSXhtgFNyCD
 IH2A==
X-Gm-Message-State: ACrzQf04sp9Fnd7dYvC9nw+gUgzZwG1223g9+9QdDDU3o7VEkrcShHaD
 irAo0nuuxAB6I4fo/6qPmbh6Kg==
X-Google-Smtp-Source: AMsMyM6cR58Jm9/n1Ch2c16YBHYtyeINWsmU20tzjBbxhw2/EIHLRo95Ir7SMZb/qK3rg17BtJsuAA==
X-Received: by 2002:a05:6402:5cb:b0:452:e416:2bc4 with SMTP id
 n11-20020a05640205cb00b00452e4162bc4mr15559962edx.114.1666335379926; 
 Thu, 20 Oct 2022 23:56:19 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 lb5-20020a170907784500b0071cbc7487e1sm11308368ejc.69.2022.10.20.23.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 23:56:19 -0700 (PDT)
Date: Fri, 21 Oct 2022 08:56:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v5 1/6] device_tree: add qemu_fdt_setprop_strings() helper
Message-ID: <20221021065618.hdu7elwg4tnj3vuj@kamzik>
References: <20221021055808.342055-1-qemu@ben.fluff.org>
 <20221021055808.342055-2-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021055808.342055-2-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 21, 2022 at 06:58:03AM +0100, Ben Dooks wrote:
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
> index e7c5441f56..cb49df471b 100644
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
> +        qemu_fdt_setprop_string_array(fdt, path, prop,          \
> +                (char **)&__strs, ARRAY_SIZE(__strs));          \
> +     } while(0)
> +
> +

I made several comments on v4 of this that aren't addressed.

>  int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>                               const char *property,
>                               const char *target_node_path);
> -- 
> 2.35.1
> 
> 

