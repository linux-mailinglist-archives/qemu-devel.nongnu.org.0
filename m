Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A34B647E6F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 08:25:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Xjh-0003tZ-DH; Fri, 09 Dec 2022 02:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3XiW-0003kt-0D
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:22:54 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3XiK-00011B-FN
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:22:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id h12so4279582wrv.10
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 23:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K+0mLk0TCCAxJKd/MKGvLc4MPo+NHi2DACOnr69RW8o=;
 b=Qj14fr2tsHjg6Fxh32ht0BsKem9rhxYGttftQDhpTMTVnV9n381pk59tBdfAJK/T3i
 KjD365gPKX7mIldQ5MuSW31vlOXG+NicnwGJ3KOKdifVTPE5LRlf+ZAKZ2WE7fNzxoat
 3trsDfXn5Kjg/VPBjp1ECf1GYm2iMEM2dm/9cbI44iZj2hwn4LXCI1JXKEK9exbsyGmR
 vT/XotzQkVPXfGQlIqyAo5zSecCcZNn1La4pLESC1rKO07sOS44F8yCC8gfk15NLiD/j
 kB8qEfGbFaVBiuPqeEduWbLjTXe7BqSDMNX8LmRk+DpLQ07BGoXWht8k995QBcipb3w3
 KeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+0mLk0TCCAxJKd/MKGvLc4MPo+NHi2DACOnr69RW8o=;
 b=E9GYQJQpK6ZPi06lp2goOcbP2QB0DoKbBT5j0eewQezBsS74S41djiS/DRNHqBVXmV
 tOiwI+sDCTLL+SY1azvbF6UGE6yQRMYYSviSk1Nw0WwOjCFpBRv2g+FwssmwQADuFkMm
 Wx98YYpKPJ9+CMPhrn/8d1eos8rFwYIT+YQ9ftU6zj7PBebLSeQePIa7b5RA9Hjnesmb
 0ibx/cbR4x8DEHix+5ly0l/TLaqrMDjt1bdCD2lYQVQV8cJFsa2FmLmH4ooX2v3fNA8+
 8mch1kwdQKCZL0j22Jtiuc1HtcEnNswABLDFOCN32Cwn4PSq5wEa+C/4Lhk5jxy/6gZh
 +xcA==
X-Gm-Message-State: ANoB5pkItkTqoIOFZH5F64pV1jUFPDed0padtwviACP3EJvqHqu2L+c4
 eJskuIFm6BDvarUuL2HMR8DBVg==
X-Google-Smtp-Source: AA0mqf4DM9f0GFkWS/GK8bCD0d757JK5IBr4gNiWoVmuJc7s609cr2K9M+xGx9WGAE0AmzY7Nbl51Q==
X-Received: by 2002:adf:f74d:0:b0:242:55e6:dc9 with SMTP id
 z13-20020adff74d000000b0024255e60dc9mr2998384wrp.8.1670570550058; 
 Thu, 08 Dec 2022 23:22:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m13-20020a056000180d00b002366f9bd717sm782357wrh.45.2022.12.08.23.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 23:22:29 -0800 (PST)
Message-ID: <953275ef-a900-0a44-d2a4-1d990a1522a8@linaro.org>
Date: Fri, 9 Dec 2022 08:22:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 7/8] accel/tcg: Move PageDesc tree into tb-maint.c for
 system
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu
References: <20221209051914.398215-1-richard.henderson@linaro.org>
 <20221209051914.398215-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209051914.398215-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
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

On 9/12/22 06:19, Richard Henderson wrote:
> Now that PageDesc is not used for user-only, and for system
> it is only used for tb maintenance, move the implementation
> into tb-main.c appropriately ifdefed.
> 
> We have not yet eliminated all references to PageDesc for
> user-only, so retain a typedef to the structure without definition.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/internal.h      |  49 +++-----------
>   accel/tcg/tb-maint.c      | 130 ++++++++++++++++++++++++++++++++++++--
>   accel/tcg/translate-all.c |  95 ----------------------------
>   3 files changed, 134 insertions(+), 140 deletions(-)


> -/*
> - * In system mode we want L1_MAP to be based on ram offsets,
> - * while in user mode we want it to be based on virtual addresses.
> - *
> - * TODO: For user mode, see the caveat re host vs guest virtual
> - * address spaces near GUEST_ADDR_MAX.
> - */
> -#if !defined(CONFIG_USER_ONLY)
> -#if HOST_LONG_BITS < TARGET_PHYS_ADDR_SPACE_BITS
> -# define L1_MAP_ADDR_SPACE_BITS  HOST_LONG_BITS
> -#else
> -# define L1_MAP_ADDR_SPACE_BITS  TARGET_PHYS_ADDR_SPACE_BITS
> -#endif
> -#else
> -# define L1_MAP_ADDR_SPACE_BITS  MIN(HOST_LONG_BITS, TARGET_ABI_BITS)
> -#endif


> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
> index 20e86c813d..9b996bbeb2 100644
> --- a/accel/tcg/tb-maint.c
> +++ b/accel/tcg/tb-maint.c
> @@ -127,6 +127,121 @@ static PageForEachNext foreach_tb_next(PageForEachNext tb,
>   }
>   
>   #else
> +/*
> + * In system mode we want L1_MAP to be based on ram offsets.
> + */
> +#if HOST_LONG_BITS < TARGET_PHYS_ADDR_SPACE_BITS
> +# define L1_MAP_ADDR_SPACE_BITS  HOST_LONG_BITS
> +#else
> +# define L1_MAP_ADDR_SPACE_BITS  TARGET_PHYS_ADDR_SPACE_BITS
> +#endif
So you removed L1_MAP_ADDR_SPACE_BITS in this patch. If you ever respin,
I'd rather have it cleaned in the previous patch, along with the comment
updated and TODO removed.

