Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A318608B8A
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 12:24:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omArU-0001Li-Id; Sat, 22 Oct 2022 05:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omAqz-0001L6-90
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 05:31:46 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omAqx-0005TD-Ks
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 05:31:41 -0400
Received: by mail-pj1-x1031.google.com with SMTP id pb15so4360361pjb.5
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8jmJ13dVNdqaNPBNke7dgSs1Si43cdDNLYKTfdHhL3w=;
 b=J0/xMshZ4uOdecntKn4DgCkV479Ha0E4nicomh0TC9vSTKtn9JvKW0MIrGRwdKVfBQ
 BHk7S1Amg8MW+eto0wvpFn9rZP8HWc/mQgAbwbrpxUkZ/WQfmOODkl+he5YTSZFOqs6X
 5Rpfv5CrKoY9VqDMK59QGMRMmHGPITqejG903ieJgp9tzPIPY0riUYosSSF8/Tgn5Vc9
 53sxu3hbySTQYEVEZd/CN7IFkf48nzGSQXZeebK7I5drALO+4AsDhVaaubu9EfoEPPUb
 sYJ6ImzgyWNwByAfbAN5UFDNQkBrwJeS8uqxhrXR+bSLSScs/jgjvRWesno+xm3uMAu5
 dTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8jmJ13dVNdqaNPBNke7dgSs1Si43cdDNLYKTfdHhL3w=;
 b=LwCxFS93PCUEvLUqntQFgbMchEzVI/8yJtQ0ygkdq+XT0jrks3P2VOVHsjkRbIWcjz
 +JBMcgd3oYWahwiVAaQplT7ryBJKxS9FAth7j3kGULhkk+DAO5lCLCyRDzTR5dtd4KMc
 VDnJyXWlXweNem40cE+kWpJmo5tOhIFOfdNzYz13UPvPJIUknBQuTHKbRTFF5Yl9kWsm
 zH5VZMLU6TYJUeeUjvplFLKZPXzIEsAUqcbUNo+rqCi0h9FemUhFfzsBYJrFRd3zQDp5
 7ReiLABor2RyJ4YasMfyZYTQICqWpvx7h/yzjumuKbvTJsFs4lZ12EVlBs2gK/oSG1jJ
 uRkA==
X-Gm-Message-State: ACrzQf1MVjsFLa8bkMZepa8S3KF71SGmawEyEPIBfq5UxwENpbYnJneV
 CzhjL9Jkkg8XXw8oYe06m+U4gg==
X-Google-Smtp-Source: AMsMyM6KXWfzMsH1fsi24ygeI9E6psgOUYdJqUhoFKbl4Id9yJVDW/6FKB9jXc8eNPwgIrYREswYtw==
X-Received: by 2002:a17:902:b28c:b0:186:708e:6ed7 with SMTP id
 u12-20020a170902b28c00b00186708e6ed7mr9864409plr.98.1666431097796; 
 Sat, 22 Oct 2022 02:31:37 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a170902860700b001789ee5c821sm16030303plo.61.2022.10.22.02.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 02:31:37 -0700 (PDT)
Message-ID: <ff582518-668a-91b6-d9c9-01ba290f9f86@linaro.org>
Date: Sat, 22 Oct 2022 19:31:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] target/i386: Fix caculation of LOCK NEG eflags
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, Jinyang Shen <shenjinyang@loongson.cn>,
 Xuehai Chen <chenxuehai@loongson.cn>
References: <20221022061216.423098-1-huqi@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221022061216.423098-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/22/22 16:12, Qi Hu wrote:
> In sequence:
> ---
> lock negl -0x14(%rbp)
> pushf
> pop    %rax
> ---
> 
> %rax will obtain the wrong value becasue the "lock neg" caculates the
> wrong eflags. The "s->T0" is updated by the wrong value.
> 
> You can use this to do some test:
> ---
> #include <assert.h>
> 
> int main()
> {
>    __volatile__ unsigned test = 0x2363a;
>    __volatile__ char cond = 0;
>    asm(
>        "lock negl %0 \n\t"
>        "sets %1"
>        : "=m"(test), "=r"(cond)
>        :
>        :);
>    assert(cond & 1);
>    return 0;
> }
> ---
> 
> Reported-by: Jinyang Shen <shenjinyang@loongson.cn>
> Co-Developed-by: Xuehai Chen <chenxuehai@loongson.cn>
> Signed-off-by: Xuehai Chen <chenxuehai@loongson.cn>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
> V1 -> V2:
> Following Richard's suggestion, just change mov to neg instead of using
> local_tmp.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> ---
>   target/i386/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index e19d5c1c64..cec2182080 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -3299,7 +3299,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>   
>                   tcg_temp_free(t2);
>                   tcg_temp_free(a0);
> -                tcg_gen_mov_tl(s->T0, t0);
> +                tcg_gen_neg_tl(s->T0, t0);
>                   tcg_temp_free(t0);
>               } else {
>                   tcg_gen_neg_tl(s->T0, s->T0);


