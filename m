Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAD55B5665
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 10:37:31 +0200 (CEST)
Received: from localhost ([::1]:49600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXewc-0002Rd-Cz
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 04:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXetG-00006a-Kq
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:34:03 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXet9-0007y7-Q4
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:34:01 -0400
Received: by mail-wr1-x431.google.com with SMTP id h8so7139028wrf.3
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 01:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=eMcsFseGqdLR6cQeu+oZkFuKM+xPG1LtgvydaxztnIQ=;
 b=N1llNeHct9RdHGoY8omroE1ZqEPzjaqhtNQTpRAGS0AKTa8dlhhlh+9AbdWnpILKWP
 P0hSgNd7QAQu2mfoVhQdebMK2MvfmWjp0G6gD0dkw45SBOj4GOEj86ZekV/N2twelFbX
 HLmDf8i4IVgmhvykrp0N2719ap/f50jEb/Ef9sgRrt1rgAdi39kn/pRf+FQamRBirrYy
 QjUnjLm2WTysO5ZTzofvrNlYc5nsBkEz1uGfXm0N3FQzg5a6R29nd1Tv2AWG6/rfmaWF
 Xs4N2txiUn2Lr+FnMbzMvlF90yVhgeUOsp3Bw9vrbfnEEAxj8CS5tH8xfNyBr2nOsH1c
 1ICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=eMcsFseGqdLR6cQeu+oZkFuKM+xPG1LtgvydaxztnIQ=;
 b=RfpKY7/L9503pkuC5Ef29xbZv+a6CAGRPNru/FOOBO6qMwkS6MTsyssYJ4nmCt2KzH
 N/mT0ZK+GHtGCsgFtdQWSllEpgQJlbyf+7RrN/HRp5wlXZtTfFQ9UxM59exOuE0+0Mbn
 b1ieLTYb3236kD8rwtGJSEjOxAyoL+7gmHTVuafV03ngDi5VgpGlg95gjnyafu52L0SO
 D32CNlfVdu4/R5+Jh+zp0fQFr9FP+PTNkz5E9/kN07Ahgiv/21QOd6M0SqxR+3mUcMVW
 mjKTtTSN4AK/6Ad6RPf1G1HXz8ujhQLNaqCPOWh3Hqj6BTc9ATQhsOE3DIkVe9SrtDtZ
 6HPA==
X-Gm-Message-State: ACgBeo1FcixWJ3pXZRS0SrkamnBi32NeOFm1AUDL3mOCJCVWGlkZlj12
 rTb9ZnQZuwjQ+KlwiDmfr7IFng==
X-Google-Smtp-Source: AA6agR6HDtADEaIVyiyyJCMIIhFhG7F6L5neg8jCcojLA8NoVW6FgXSqr+aiCg8iyHdl6lLplfGHUg==
X-Received: by 2002:a05:6000:15c7:b0:22a:99a6:8627 with SMTP id
 y7-20020a05600015c700b0022a99a68627mr1259766wry.344.1662971631414; 
 Mon, 12 Sep 2022 01:33:51 -0700 (PDT)
Received: from [192.168.44.231] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 l4-20020adfe9c4000000b002253fd19a6asm8069087wrn.18.2022.09.12.01.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 01:33:50 -0700 (PDT)
Message-ID: <579e64b4-921d-158e-c1d0-7acabcc82e77@linaro.org>
Date: Mon, 12 Sep 2022 09:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/37] target/i386: make ldo/sto operations consistent
 with ldq
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> ldq takes a pointer to the first byte to load the 64-bit word in;
> ldo takes a pointer to the first byte of the ZMMReg.  Make them
> consistent, which will be useful in the new SSE decoder's
> load/writeback routines.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 44 +++++++++++++++++++------------------
>   1 file changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 001af76663..9a85010dcd 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -2761,28 +2761,29 @@ static inline void gen_ldo_env_A0(DisasContext *s, int offset)
>   {
>       int mem_index = s->mem_index;
>       tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
> -    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(0)));
> +    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(XMMReg, XMM_Q(0)));
>       tcg_gen_addi_tl(s->tmp0, s->A0, 8);
>       tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
> -    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));
> +    tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(XMMReg, XMM_Q(1)));
>   }
>   
>   static inline void gen_sto_env_A0(DisasContext *s, int offset)
>   {
>       int mem_index = s->mem_index;
> -    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(0)));
> +    offset -= offsetof(ZMMReg, ZMM_Q(0));
> +    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(XMMReg, XMM_Q(0)));

What is this subtract?  You don't have it for ldo or movo, and it looks wrong.

The rest of it looks ok.


r~

