Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436D341810E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:35:26 +0200 (CEST)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU51h-0004dU-AX
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU508-0003rm-L7
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:33:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU507-0003L4-26
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:33:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id i23so35194482wrb.2
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NjeGzpsLqgi2f94H0Fx8LIChfClsZ+f8RjHeMP8VDqs=;
 b=kARoc+iWRSD+cBBVQD+F7oJAz35WTZHSpvqJJnR1KFfc8TelvLRDfcVFiJ5eceTOsD
 UKyJpxK/oxIbSadyII6CVqHLuEykfFpspTqWrcBa0ncB0N95jbjlxod1wglLjqru894J
 8xueTNZWZLqKVTNZ08CB0mDV1fsF7Mw+QjARs5DPQbXkoXyVU5sa/8nUbNLTUSkZdRcq
 Sl870+2/L9B4CFJVjzda4T7p11fnvB/qr+uHUcVIjMa+JH0O8FL4rZw7Nvh2QlegeU/q
 U0KV2E6S6A8q4Q0PVmXjFCOkoIGKTGvT1MKujgFkb1VNUwWiQv0tZqBHZ8KPqjCWy6zf
 MCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NjeGzpsLqgi2f94H0Fx8LIChfClsZ+f8RjHeMP8VDqs=;
 b=DH/znQyfqMNlvpXxJ/XdCM281u1FJ11xTaSmFzFWkPkYXsC7msaKx0V8vWjwBXTb3d
 /NAo9wS9DYGQCgR+QbE4viOaCC56hHG+OQKqZdvWH21bLYLYlUqolHdki3TYGbR8OxkY
 0W43Ao13eWTCkPhgsGLJOZlAgnYb1Cmme8uhPcAGqnL0Cq3l+WgZEOCwy2ZTkzP3Jgcl
 cOn/ISHsVywPam6vPK3cDcQzKYv/bfye4G1LQGy2VF4qdbyBPQxOBaG+BnUvqFTgsEDy
 EdVmLwg2QWvoVuwwSXCbdJCmo7FBX9ycz5jr0+dP7P2F18lzemQEJiK7tOQbnZ2YdA5x
 ff6A==
X-Gm-Message-State: AOAM531cAxjsvkDGPhEJPMacUmyhQKy1sGiCGg8ILxRu51CPII0hdtKd
 FO8ccruSsNE3+mX5oo/SsDA=
X-Google-Smtp-Source: ABdhPJw2+Xgv8ykhiY79qQgvj7g4bMIQvdL4WTzPBZX7GwdtlLFqoxS3FTFD6hKlqIHMuhb1Pc4iHw==
X-Received: by 2002:adf:f486:: with SMTP id l6mr15927401wro.375.1632566025376; 
 Sat, 25 Sep 2021 03:33:45 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z5sm17119886wmp.26.2021.09.25.03.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:33:44 -0700 (PDT)
Message-ID: <10bb09fe-8995-29ab-e719-616d1a7e6114@amsat.org>
Date: Sat, 25 Sep 2021 12:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 04/14] bsd-user: export get_errno and is_error from
 syscall.c
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-5-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922061438.27645-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.034,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 08:14, Warner Losh wrote:
> Make get_errno and is_error global so files other than syscall.c can use
> them.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/qemu.h    |  4 ++++
>   bsd-user/syscall.c | 10 +++++-----
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 522d6c4031..22fc3a6c30 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -235,6 +235,10 @@ extern unsigned long target_dflssiz;
>   extern unsigned long target_maxssiz;
>   extern unsigned long target_sgrowsiz;
>   
> +/* syscall.c */
> +abi_long get_errno(abi_long ret);
> +int is_error(abi_long ret);
> +
>   /* user access */
>   
>   #define VERIFY_READ  PAGE_READ
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index 372836d44d..a579d52ede 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -33,18 +33,18 @@
>   static abi_ulong target_brk;
>   static abi_ulong target_original_brk;
>   
> -static inline abi_long get_errno(abi_long ret)
> +abi_long get_errno(abi_long ret)
>   {
> -    if (ret == -1)
> +    if (ret == -1) {
>           /* XXX need to translate host -> target errnos here */
>           return -(errno);
> -    else
> -        return ret;
> +    }
> +    return ret;
>   }
>   
>   #define target_to_host_bitmask(x, tbl) (x)
>   
> -static inline int is_error(abi_long ret)
> +int is_error(abi_long ret)

Since you are modifying this, do you mind having it return
a boolean type instead?

>   {
>       return (abi_ulong)ret >= (abi_ulong)(-4096);
>   }
> 

Preferably having is_error() returning bool:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

