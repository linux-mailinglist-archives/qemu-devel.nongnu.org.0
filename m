Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444F660B68F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 21:04:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on1lv-000376-UG; Mon, 24 Oct 2022 14:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1on1lp-00035c-6G
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 14:01:53 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1on1lm-0003ft-7T
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 14:01:52 -0400
Received: by mail-wr1-x429.google.com with SMTP id h9so6346695wrt.0
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 11:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ta81kDrTv9usJvV7oVZGHOSjR57iiucAo2thz8Coj3I=;
 b=ABqEKpm/R/0hlWrwqTn6eW4i0MEt1nTMdnkZ2UNfxojbwQXYR7U2sDWQeLX3SzH6Vj
 2blibPrP48/bqkvZeLN+Dgq61LbghzwiycIjOPuqK1UVWomxoQKxq/Z24bGwgxUmAQjE
 0DyL+z1LibJV2CGFCP2sVVD3Ui1E6ehvP4dFV8x34IpJfAdTp0zZR9vU3VGS67AXKnOW
 jSK2lkBQNT9xK7Wd3ZhAGw55uIEjTDLK1ne5UTLzWneokvTH2IJq+h+wCi3gV6AZTsCb
 FSHNjcFN9UyLhwhAxi3oSnArZEHMf9TGS5BwLn+cgSnTzkssOKGiG/DqLWSPhD3n0aKu
 nDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ta81kDrTv9usJvV7oVZGHOSjR57iiucAo2thz8Coj3I=;
 b=wF3XKn/aqu/8KRgVYhCfPnZdZ00sa7vloF/xOi8+kP+c/ymJv3r7qU+C/THbqP5CnR
 WwQlGStO8hC6cEl6LaJZ7FecC6EaobN+YOFdjT0T7SqtJjrwa4i0m3Q+UwZTHhs5l4Nb
 LOSHs65o2WLdxi0alrrabd55JYr8Q6LX7voQ5zeeMncZgR02RN3W0RWL8nqnK621rEWO
 evW418mYQBhdfWDOsyrRVo3UwqiI2OqpanRRkm/EMWb9yXwuh1ImpzCecl9XH91allVY
 ZlXxLmzoD8wArSoUeCkUf8kyYL0lx0wPNi2TQEKUEV6TOMV7cdZpyPCcNO5CAuOxILqC
 11zw==
X-Gm-Message-State: ACrzQf0vt4xcBXdf3gPe0JBMeox//97kdP5FLLWSXts7z2jNTznxq9UJ
 PAp18oRYWRONWRAa+CZ4wGcAwg==
X-Google-Smtp-Source: AMsMyM7IUJTMGSWhsN10jyZppeS/Dq9FT9USKzHVMJW5wb0uIM8bLD1iQrW4QOC5P2im1g/u4y/Tig==
X-Received: by 2002:adf:e491:0:b0:236:5270:7f5e with SMTP id
 i17-20020adfe491000000b0023652707f5emr12557449wrm.600.1666634508438; 
 Mon, 24 Oct 2022 11:01:48 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 bl40-20020adfe268000000b002365cd93d05sm205754wrb.102.2022.10.24.11.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 11:01:47 -0700 (PDT)
Message-ID: <ab7457e6-d06f-6f0e-f46c-f103e39795fa@linaro.org>
Date: Mon, 24 Oct 2022 20:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 9/9] target/s390x: Use Int128 for passing float128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021073006.2398819-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/10/22 09:30, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/helper.h          | 32 ++++++-------
>   target/s390x/tcg/fpu_helper.c  | 88 ++++++++++++++--------------------
>   target/s390x/tcg/translate.c   | 76 ++++++++++++++++++++---------
>   target/s390x/tcg/insn-data.def | 30 ++++++------
>   4 files changed, 121 insertions(+), 105 deletions(-)

> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index d1ffbb8710..8023bbab2f 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -305,6 +305,18 @@ static TCGv_i64 load_freg32_i64(int reg)
>       return r;
>   }
>   
> +static TCGv_i128 load_freg_128(int reg)
> +{
> +    TCGv_i64 h = load_freg(reg);
> +    TCGv_i64 l = load_freg(reg + 2);
> +    TCGv_i128 r = tcg_temp_new_i128();

Maybe rename as load_freg_new_128() to make emphasis on the returned
TCGv need to be freed? Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    tcg_gen_concat_i64_i128(r, l, h);
> +    tcg_temp_free_i64(h);
> +    tcg_temp_free_i64(l);
> +    return r;
> +}



