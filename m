Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8699E550229
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 04:52:21 +0200 (CEST)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2OZQ-0003OB-Lj
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 22:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2OY3-0001v3-Hq
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:50:55 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:47065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2OY1-0001ra-GZ
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:50:55 -0400
Received: by mail-pg1-x52d.google.com with SMTP id l4so5472073pgh.13
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 19:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eg0ligNgRPmt0coRqrKXhJ8IeX33Flipb//D5exZ+9c=;
 b=LUVQlnZRlXzyTci7jAVEOxd1EO5uN67HZvzxQcHvq3BBKmTUZdJzXv560RjPaaQU0s
 jpnS1txy7DU2X+BXVaTH0wvY3HQDfOafcEqujoSrgsrlNPD5UgYV83u2MwuHPQsXGhBd
 WI4lXG1PtdaIXN6by/Mp8E+wdTabWg0pz5y1G37GC7hqUco1sd74lUGnhYgtgASLAdZc
 BVCjVNyhfZIkisbVWhWXHgDtXRS+tFMWEXCuKNXEHSm4XkNLLU+xL04mb/uWawct6HWx
 WuCzj943ZI9hutLWqrJPE+B/2t+MwZhnzfNl30kj7O4+avjwWA7j9bwwSStnnR4AV8/u
 KBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eg0ligNgRPmt0coRqrKXhJ8IeX33Flipb//D5exZ+9c=;
 b=x6Iu9ML8UGoDf4i1P3YQ5oO3uicagwgQE9fsxP4i/rjjW1JqVX1NFhh1mWd66/p/bA
 F9Cf8w2mvd3SWSa4eXQZNQ9nrAYFZLRlvGUb1+ozUi/ocZNB/W3eGe9A8SvFzBLej2GB
 tMoI26HzmO0fbKH+x1lpdhp3UKHHDc51kgPD8t3Pn67o8v8TJaGdoNx7LBg29U3CfIoA
 h7tf7B308b9WN7zAx9C4b7k29gFST0Wr8kZ1cCPM08dsQBE9s61FbRbo28JljHDkcDdc
 KougLbq4K40HpeICwv4PqEDAcapJE5yEwj5VA8V+QAGKAto7qV9+2MPjbj1vQ4/uM1L5
 Vk/w==
X-Gm-Message-State: AJIora+RLMegxMO2iUxo7imYMeQGrx9W85mXcg5XgtuOgIeRn18U4P/r
 nM61wINsjAr7TEHEvhC8utdvdA==
X-Google-Smtp-Source: AGRyM1tN3qBo9amEXED4j88H+kU9FmJe47UnVvkWQPdferck3s7VkpCh9eHhTIictXqACY6KYZhn/A==
X-Received: by 2002:a05:6a00:170b:b0:51b:d1fd:5335 with SMTP id
 h11-20020a056a00170b00b0051bd1fd5335mr13091680pfc.28.1655520651439; 
 Fri, 17 Jun 2022 19:50:51 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:da58:e2:88d1:d15b?
 ([2602:47:d49e:3c01:da58:e2:88d1:d15b])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a170902780e00b0015e8d4eb273sm4214131pll.189.2022.06.17.19.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 19:50:51 -0700 (PDT)
Message-ID: <5537234d-6684-a570-bc90-400d71b0671b@linaro.org>
Date: Fri, 17 Jun 2022 19:50:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v17 09/13] target/loongarch: Fix helper_asrtle_d/asrtgt_d
 raise wrong exception
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220616121611.3316074-1-gaosong@loongson.cn>
 <20220616121611.3316074-10-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220616121611.3316074-10-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/16/22 05:16, Song Gao wrote:
> Raising EXCCODE_BCE instead of EXCCODE_ADEM for helper_asrtle_d/asrtgt_d.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/cpu.c       | 2 ++
>   target/loongarch/op_helper.c | 4 ++--
>   2 files changed, 4 insertions(+), 2 deletions(-)

"Raise" not "Raising".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index e32d4cc269..0013582a3a 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -51,6 +51,7 @@ static const char * const excp_names[] = {
>       [EXCCODE_IPE] = "Instruction privilege error",
>       [EXCCODE_FPE] = "Floating Point Exception",
>       [EXCCODE_DBP] = "Debug breakpoint",
> +    [EXCCODE_BCE] = "Bound Check Exception",
>   };
>   
>   const char *loongarch_exception_name(int32_t exception)
> @@ -176,6 +177,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
>       case EXCCODE_INE:
>       case EXCCODE_IPE:
>       case EXCCODE_FPE:
> +    case EXCCODE_BCE:
>           env->CSR_BADV = env->pc;
>           QEMU_FALLTHROUGH;
>       case EXCCODE_ADEM:
> diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
> index d87049851f..df049cec59 100644
> --- a/target/loongarch/op_helper.c
> +++ b/target/loongarch/op_helper.c
> @@ -49,14 +49,14 @@ target_ulong helper_bitswap(target_ulong v)
>   void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
>   {
>       if (rj > rk) {
> -        do_raise_exception(env, EXCCODE_ADEM, GETPC());
> +        do_raise_exception(env, EXCCODE_BCE, 0);
>       }
>   }
>   
>   void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
>   {
>       if (rj <= rk) {
> -        do_raise_exception(env, EXCCODE_ADEM, GETPC());
> +        do_raise_exception(env, EXCCODE_BCE, 0);
>       }
>   }
>   


