Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F7D6AF7DD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:43:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZf5r-0007jM-GV; Tue, 07 Mar 2023 16:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf5j-0007Wp-R5; Tue, 07 Mar 2023 16:43:30 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pZf5i-0003qo-4y; Tue, 07 Mar 2023 16:43:27 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17638494edbso16622629fac.10; 
 Tue, 07 Mar 2023 13:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678225404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MXS2TBuLvIkAooPXOcuWU9IWSwFvcYzEIgSe1vPVoXA=;
 b=ErDKYdVYn9ODn7fAYkpC1hqoMCESGNfcbDcy1G1lUvZ+OSm+kFFM741t9RhH2sd/7T
 9raTvF14U/Vb4qkEBrlhD5lhXGC+VVZvOoRgYmE7OB1qKAGnr2SUR54nF253WmWlS26J
 LTySW5s4hJJeamUM7V10a9HOOOsJgWk/oHroznA4wAs/TVJPs8sHv+qYlf5MKTbd1Jm2
 x5W3yAkCfkFGyLv6ux9e1Hbm5t4ayWvNBVQo4szpZk3Yjuzxv8vPgnq7FjqW8IVmOQti
 lPtAdZYTykx8YMI1awhtWYmREPEjDT0hgRLy55Chh9uaIFcww3NaIbfCCP2Ui8HLnxHu
 qbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678225404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MXS2TBuLvIkAooPXOcuWU9IWSwFvcYzEIgSe1vPVoXA=;
 b=v7ZtpLykfIBYg5lunE7ZIaepE6Lvx9BLLT55nCEmvdzzN6uBbi4t9PXlLSbuRmCRqx
 yPFk2oUnHv4rIJTIAwFS9Rpog9gDu46pqSoVmlLbF/e0jC10wvbU1XBBQFa2ic3OwnU8
 KkNjcmRgAtF654SiYvN3GiFxQNDmg4LK1ruyNPfKl0azq9j+lZ3T2MeSPHc9royHxtuQ
 vZ+6Ztadt/vvwzb250DDVbA2W2KV6gVzhzvNccgTH1w8mnwy6BeaLM+MUAT+yqKK3B2l
 4MpUKu3muAvB9w1komZifwT9CEub0g9ybLpJHgfHPFGXOkQyPoUgu8Fw0FXEOsP0n53d
 +drg==
X-Gm-Message-State: AO0yUKUh4nTMoyPZ1qEsAn8i97VVETYaCyZGV3LjgZtBy58x2Tgu0bzR
 3nQtIaiwvJlN1eh960f4qBs=
X-Google-Smtp-Source: AK7set+mHg1QPBWqsyR2Wmd4eJKEOJ+3ZP7Ih+b3RNo9GE8VOjK8p24UevtU+4MC5rf8mNOBk0/qAw==
X-Received: by 2002:a05:6870:168c:b0:176:42a1:abb2 with SMTP id
 j12-20020a056870168c00b0017642a1abb2mr9738168oae.23.1678225404359; 
 Tue, 07 Mar 2023 13:43:24 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a05687087c100b001727d62899bsm407665oam.26.2023.03.07.13.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 13:43:24 -0800 (PST)
Message-ID: <bfd9685f-be2d-8ffc-a2fb-189f0847a2ae@gmail.com>
Date: Tue, 7 Mar 2023 18:43:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 19/25] target/ppc: Avoid tcg_const_* in
 power8-pmu-regs.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-20-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230307183503.2512684-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 3/7/23 15:34, Richard Henderson wrote:
> All uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/power8-pmu-regs.c.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
> index 42f2cd04a1..d900e13cad 100644
> --- a/target/ppc/power8-pmu-regs.c.inc
> +++ b/target/ppc/power8-pmu-regs.c.inc
> @@ -177,7 +177,7 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
>   
>   void spr_read_PMC(DisasContext *ctx, int gprn, int sprn)
>   {
> -    TCGv_i32 t_sprn = tcg_const_i32(sprn);
> +    TCGv_i32 t_sprn = tcg_constant_i32(sprn);
>   
>       gen_icount_io_start(ctx);
>       gen_helper_read_pmc(cpu_gpr[gprn], cpu_env, t_sprn);
> @@ -210,7 +210,7 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
>   
>   void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
>   {
> -    TCGv_i32 t_sprn = tcg_const_i32(sprn);
> +    TCGv_i32 t_sprn = tcg_constant_i32(sprn);
>   
>       gen_icount_io_start(ctx);
>       gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);

