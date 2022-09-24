Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F13C5E8C32
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 14:19:00 +0200 (CEST)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc47X-0005s0-7x
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 08:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc43S-0003ZK-O8
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 08:14:46 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc43R-0007lD-1c
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 08:14:46 -0400
Received: by mail-wr1-x434.google.com with SMTP id n15so3668341wrq.5
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 05:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=h5gbXA2RfZJ2jLbQ9EbR+Iauz9pViNgZA2KsghPYFmY=;
 b=hKn8z/BPGtgKXp1510ZCT8AB+wPRVu+iIavBc4QvuH/q0PquSUm22ZHrynUYH07O6e
 paO3pubu+QaZqsCNWaBWOjfo4X7c61fELTkOWtS89xtxzQ5suw9Jh1SWUHUkA9oNHyjZ
 ogjl9A1axcdW6N7g2hVSBfZ9wOg5b/U8IkNw7vDMVEhYEwjh0Z6OU5o11pJJS4n+KESl
 a0VIl/6+NocsG5k6yiMKxOMoLqWh3BZpbIcftVFuM3CjKsidrqdKohGUAfGBBpFQ/xuS
 zpOh7SR+DYZkin4jXczL+qWBTSt5vdb13ea2C2ZB0nnqG0f2aMxFOHobGUriz745l1S6
 7FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=h5gbXA2RfZJ2jLbQ9EbR+Iauz9pViNgZA2KsghPYFmY=;
 b=gfuanidmHUvOkbRU4++qrktF92tUTapmflkHuNBtuQR/vNkf/5His3ZBJsQwu23SdJ
 H/5zSqbvMZJddvfkkVPYEBaV6sdiJpmZP9iYSyVChSO/qHWF0PIt9HF/HzQpaIVyUnDO
 kHrvczW36hD8QiVLmci2MCll9sHxz+YVc2zfqVw+6bG+dXRicK8r3ySwKSLazsoZvcOz
 ogOcMZwH1Tuo7HfKWk4cDlk4y7R/eAnK6tb5NBFf0Y9B+Q/EPQqu3OOkxv/IlY4GbggN
 vtrmlBEWq1Bmhny6w3wtZmflSzmsX08I+hCYrzCbYsQeD3K4Prtjpty0eM2Slgr47Kj1
 f5Lg==
X-Gm-Message-State: ACrzQf0IhrODmDrR96aceNiludQqRVRnq/dvJR3zYjxJmFZAgUjAbKy7
 IHFaz5uCtnDeQkxjX0SCGT8=
X-Google-Smtp-Source: AMsMyM5+MS2PIL25Ym8D4NaylacFQL5KGyuzJ5n3bcEl8YsL1ShrsIEpN1gyN+fsQI5sB32IsBCc5A==
X-Received: by 2002:a05:6000:15c2:b0:228:dc85:d1b0 with SMTP id
 y2-20020a05600015c200b00228dc85d1b0mr7983126wry.9.1664021683384; 
 Sat, 24 Sep 2022 05:14:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b003b33de17577sm5977389wmq.13.2022.09.24.05.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 05:14:42 -0700 (PDT)
Message-ID: <b656bf18-2698-0999-3f91-417c464df0f9@amsat.org>
Date: Sat, 24 Sep 2022 14:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v11 05/15] target/hexagon: introduce new helper functions
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, babush@rev.ng, nizzo@rev.ng, tsimpson@quicinc.com,
 bcain@quicinc.com, mlambert@quicinc.com, richard.henderson@linaro.org,
 alex.bennee@linaro.org
References: <20220804115548.13024-1-anjo@rev.ng>
 <20220804115548.13024-6-anjo@rev.ng>
In-Reply-To: <20220804115548.13024-6-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.118,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/8/22 13:55, Anton Johansson via wrote:
> From: Niccolò Izzo <nizzo@rev.ng>
> 
> These helpers will be employed by the idef-parser generated code, to
> correctly implement instruction semantics. "Helper" functions, in the
> context of this patch, refers to functions which provide a manual TCG
> implementation of certain features.
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Niccolò Izzo <nizzo@rev.ng>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c | 178 ++++++++++++++++++++++++++++++++++++++--
>   target/hexagon/genptr.h |  17 +++-
>   target/hexagon/macros.h |   9 ++
>   3 files changed, 196 insertions(+), 8 deletions(-)

> diff --git a/target/hexagon/genptr.h b/target/hexagon/genptr.h
> index 016d5d7085..6c50c5383b 100644
> --- a/target/hexagon/genptr.h
> +++ b/target/hexagon/genptr.h
> @@ -24,7 +24,8 @@
>   
>   extern const SemanticInsn opcode_genptr[];
>   
> -void gen_store32(TCGv vaddr, TCGv src, int width, uint32_t slot);
> +void gen_store32(DisasContext *ctx, TCGv vaddr, TCGv src, tcg_target_long width,
> +                 uint32_t slot);
>   void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
>                   uint32_t slot);
>   void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
> @@ -41,9 +42,23 @@ void gen_store4i(TCGv_env cpu_env, TCGv vaddr, int32_t src, DisasContext *ctx,
>                    uint32_t slot);
>   void gen_store8i(TCGv_env cpu_env, TCGv vaddr, int64_t src, DisasContext *ctx,
>                    uint32_t slot);

Preferably various 'uint32_t' -> 'unsigned'.

> +TCGv gen_read_reg(TCGv result, int num);

'unsigned'.

>   TCGv gen_read_preg(TCGv pred, uint8_t num);
>   void gen_log_reg_write(int rnum, TCGv val);
>   void gen_log_pred_write(DisasContext *ctx, int pnum, TCGv val);
> +void gen_write_new_pc(TCGv addr);
> +void gen_set_usr_field(int field, TCGv val);
> +void gen_set_usr_fieldi(int field, int x);
> +void gen_set_usr_field_if(int field, TCGv val);
> +void gen_sat_i32(TCGv dest, TCGv source, int width);
> +void gen_sat_i32_ovfl(TCGv ovfl, TCGv dest, TCGv source, int width);
> +void gen_satu_i32(TCGv dest, TCGv source, int width);
> +void gen_satu_i32_ovfl(TCGv ovfl, TCGv dest, TCGv source, int width);
> +void gen_sat_i64(TCGv_i64 dest, TCGv_i64 source, int width);
> +void gen_sat_i64_ovfl(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width);
> +void gen_satu_i64(TCGv_i64 dest, TCGv_i64 source, int width);
> +void gen_satu_i64_ovfl(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width);
> +void gen_add_sat_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b);
>   TCGv gen_8bitsof(TCGv result, TCGv value);
>   void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src);
>   TCGv gen_get_byte(TCGv result, int N, TCGv src, bool sign);
> diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
> index 4529af107a..4c2e3ce21e 100644
> --- a/target/hexagon/macros.h
> +++ b/target/hexagon/macros.h
> @@ -197,7 +197,16 @@
>   #define MEM_STORE8(VA, DATA, SLOT) log_store64(env, VA, DATA, 8, SLOT)
>   #endif
>   
> +#ifdef QEMU_GENERATE
> +static inline void gen_cancel(uint32_t slot)

Preferably 'unsigned'.

> +{
> +    tcg_gen_ori_tl(hex_slot_cancelled, hex_slot_cancelled, 1 << slot);
> +}
> +
> +#define CANCEL gen_cancel(slot);
> +#else
>   #define CANCEL cancel_slot(env, slot)
> +#endif
>   
>   #define LOAD_CANCEL(EA) do { CANCEL; } while (0)
>   


