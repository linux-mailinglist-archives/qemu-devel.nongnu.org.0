Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35CE31F2D3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:13:25 +0100 (CET)
Received: from localhost ([::1]:50310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsU8-000224-Gf
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsSj-0001HI-Qr
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:11:57 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsSh-0003aB-V7
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:11:57 -0500
Received: by mail-wm1-x332.google.com with SMTP id a207so5366617wmd.1
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6ZnjzWz8+PuO3HCgrfjWiO9JccKPXcFtXk8FC0+hTOs=;
 b=Ef3k1osM/NOikkMal7a/v7iAvMMHPmeRwsiIo9COg3rUQDWlz8J2WhSHRmlqyKM8GC
 mGShukSoBVvvC0b+uHORRRlCkLpPIGILK5aRsQRGo1gRyDu/zGKUNYv52StUH8THuqL5
 Ii5uZIHoZSEYOxUfWNmuT6wSSbOeDM9cZ1FdKKa64DIKp6TyG+j5On8DgrtOleLHQgph
 kYe//xeqqC0TTSFhTFLVHbS0mz7KojyGoDq1yyPCYhvSK1VKwOzs4sScmIyj/kEoOpB4
 JLxgpOyzW+ph/a1i1vnP1UUprTko10OTIj2QPVWe2y5Ty2cH1EKxEXCaZv97itojdzDd
 CZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ZnjzWz8+PuO3HCgrfjWiO9JccKPXcFtXk8FC0+hTOs=;
 b=VKYcdQp9syFATK5GARgjET5n9zw0kOYcUJ1bbw6gQ5QfJFQonGdQHpJqLDms4PMQ7o
 P4o5qqD0m84/cjnSgY3j7XnL9X5Cs/jgNqrPfqhooAp2zzz3ywJMjD6PWLYGAcRUBCDF
 d3Ze73F/+GoKHIhZO/xXwvCr6cFLN5GWByuV7vyTowXn1FgaJQG7oWJAUC8FVS0yYowI
 95dD5KjlO5QSz6N+l5JTOx5uWt7WWsPsa9OP4aXY+2QbkwfFnQLy7wEjnFo/1+jh3j5L
 sYe1U/wG34ztWJu9s7JAZNY6d+M13GdIlwzytyWHxvJ6Vqd6wAKyHelBhiy+uFRKIbP7
 Wx8w==
X-Gm-Message-State: AOAM533Ge45GkdwLcT3BapdjOQebVFmIGHXM3u1gkfChkvUM2e51FkhQ
 jDroi1Vnyv1BHmIfq8pndMQ=
X-Google-Smtp-Source: ABdhPJzBDP32MSIqqFYa4ed3NuetBf/7lWgLdPo2nJSa3d5a7ZbEo2OoCioONR20jMBlwb6nMfU4Sw==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr5420118wmr.179.1613689914195; 
 Thu, 18 Feb 2021 15:11:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm9767935wmb.33.2021.02.18.15.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 15:11:53 -0800 (PST)
Subject: Re: [PATCH v4 05/71] tcg/tci: Remove tci_read_r8
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7f634553-3e1c-2cd6-a712-31c335e79508@amsat.org>
Date: Fri, 19 Feb 2021 00:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> Use explicit casts for ext8u opcodes, and allow truncation
> to happen with the store for st8 opcodes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 1c667537fe..4ade0ccaf9 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -78,11 +78,6 @@ static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
>  }
>  #endif
>  
> -static uint8_t tci_read_reg8(const tcg_target_ulong *regs, TCGReg index)
> -{
> -    return (uint8_t)tci_read_reg(regs, index);
> -}
> -
>  static uint16_t tci_read_reg16(const tcg_target_ulong *regs, TCGReg index)
>  {
>      return (uint16_t)tci_read_reg(regs, index);
> @@ -169,14 +164,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
>      return value;
>  }
>  
> -/* Read indexed register (8 bit) from bytecode. */
> -static uint8_t tci_read_r8(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
> -{
> -    uint8_t value = tci_read_reg8(regs, **tb_ptr);
> -    *tb_ptr += 1;
> -    return value;
> -}
> -
>  #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
>  /* Read indexed register (8 bit signed) from bytecode. */
>  static int8_t tci_read_r8s(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
> @@ -533,7 +520,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>              tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
>              break;
>          CASE_32_64(st8)
> -            t0 = tci_read_r8(regs, &tb_ptr);
> +            t0 = tci_read_r(regs, &tb_ptr);

No need for tb_ptr++ here?

>              t1 = tci_read_r(regs, &tb_ptr);
>              t2 = tci_read_s32(&tb_ptr);
>              *(uint8_t *)(t1 + t2) = t0;
> @@ -722,8 +709,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>  #if TCG_TARGET_HAS_ext8u_i32
>          case INDEX_op_ext8u_i32:
>              t0 = *tb_ptr++;
> -            t1 = tci_read_r8(regs, &tb_ptr);
> -            tci_write_reg(regs, t0, t1);
> +            t1 = tci_read_r(regs, &tb_ptr);
> +            tci_write_reg(regs, t0, (uint8_t)t1);
>              break;
>  #endif
>  #if TCG_TARGET_HAS_ext16u_i32
> @@ -916,8 +903,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>  #if TCG_TARGET_HAS_ext8u_i64
>          case INDEX_op_ext8u_i64:
>              t0 = *tb_ptr++;
> -            t1 = tci_read_r8(regs, &tb_ptr);
> -            tci_write_reg(regs, t0, t1);
> +            t1 = tci_read_r(regs, &tb_ptr);
> +            tci_write_reg(regs, t0, (uint8_t)t1);
>              break;
>  #endif
>  #if TCG_TARGET_HAS_ext8s_i64
> 

