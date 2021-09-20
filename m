Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B624128F1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:34:39 +0200 (CEST)
Received: from localhost ([::1]:39284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRry-0007KZ-UT
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSRK2-0004li-5g
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:59:34 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSRK0-0004t2-KA
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:59:33 -0400
Received: by mail-wr1-x432.google.com with SMTP id d21so33589780wra.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T9FyxL1dATRjcUGpbs6+qB2s/39Q1q3Wdtf4Mt5qMQs=;
 b=IHi+ny8K4ild6AMEsqLwojw1QmFMQiGWn7110cZM+VNDzAxuS6xqdDO6F9Kf6stnFs
 +arhnDuFTPeopby64uwdpDozbpznEhTIsSZ4B1uCt1/EW2hdWk2wSQDpUg0KaP0dbckz
 8ZqZb8XhYIlIjFv91AKjgxIy8xXT++HQAg7d3hk97dF6Fw2r794/rov5kGZldPbVcKHs
 XOewkdeTn3mw68Fn1vytxr4qNihf1+etkBYqcKBeu0KFAoTot72h1gEuJLAkaOqlRqjd
 Pq0sy7BqtBq9jSxkxa9NCjLDgRjsUcV8yGJIADIN5hEtRX+oWQCylhnInG+TMpMVOUUd
 H8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T9FyxL1dATRjcUGpbs6+qB2s/39Q1q3Wdtf4Mt5qMQs=;
 b=eoX4O8sR6kDjcQDZQfKR0ZNnMWzWw8MxYLcAj5F6LOqQLfe728gDOR6TDAHM3PA52H
 MXQqowuWEsG7Jt/w8AZKHTxqzx1VxDFtn06D9qXWSLP7cTOY8XXJP3OFLh51TKAZI4Ej
 /38zvYA85zbFgw2UEzCn1K3Nb9a6/PJvwIVIPaw5/sUIiWhvr0HqAIvzPCjbTTxn+38r
 90ZefBzFtKjPkSe5WjbTe14cNYsFfMRiRuOwdDr3Km+9nmM3bD7MjxCCTsjAE1MAhmU6
 VL/PkU9Q12tlQJE2nNebPRyhy3f733RWPUc+LmGIBugolxoenKDwKVKKkHwTxesFLIer
 oJkg==
X-Gm-Message-State: AOAM530GcmoXoSCj9Hswbz+Hly3M3W2gxHPmgHrvQr5S/BpOX7ktjKQR
 HJUMuYXx9LvRFptoEHM2r4I=
X-Google-Smtp-Source: ABdhPJzBgjmQ9czgw5KViKbFkhO8tQshwpcEHUDYaPD4lN1OZmxEB09Eo6DC3BKhHOK4QMlSivAIHQ==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr20348512wrw.219.1632175171146; 
 Mon, 20 Sep 2021 14:59:31 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id h18sm16874938wrb.33.2021.09.20.14.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 14:59:30 -0700 (PDT)
Message-ID: <371cc703-f0ce-552b-fa49-9cea36ce4532@amsat.org>
Date: Mon, 20 Sep 2021 23:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 15/30] Hexagon HVX (target/hexagon) helper overrides -
 vector assign & cmov
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-16-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1632173065-18522-16-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 23:24, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/gen_tcg_hvx.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/target/hexagon/gen_tcg_hvx.h b/target/hexagon/gen_tcg_hvx.h
> index eb29566..bcd53d4 100644
> --- a/target/hexagon/gen_tcg_hvx.h
> +++ b/target/hexagon/gen_tcg_hvx.h
> @@ -126,4 +126,35 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
>      } while (0)
>  
>  
> +#define fGEN_TCG_V6_vassign(SHORTCODE) \
> +    tcg_gen_gvec_mov(MO_64, VdV_off, VuV_off, \
> +                     sizeof(MMVector), sizeof(MMVector))
> +
> +/* Vector conditional move */
> +#define fGEN_TCG_VEC_CMOV(PRED) \
> +    do { \
> +        TCGv lsb = tcg_temp_new(); \
> +        TCGLabel *false_label = gen_new_label(); \
> +        TCGLabel *end_label = gen_new_label(); \
> +        tcg_gen_andi_tl(lsb, PsV, 1); \
> +        tcg_gen_brcondi_tl(TCG_COND_NE, lsb, PRED, false_label); \
> +        tcg_temp_free(lsb); \
> +        tcg_gen_gvec_mov(MO_64, VdV_off, VuV_off, \
> +                         sizeof(MMVector), sizeof(MMVector)); \
> +        tcg_gen_br(end_label); \
> +        gen_set_label(false_label); \
> +        tcg_gen_ori_tl(hex_slot_cancelled, hex_slot_cancelled, \
> +                       1 << insn->slot); \
> +        gen_set_label(end_label); \
> +    } while (0)

Why a macro and not a (eventually inlined) function?

> +/* Vector conditional move (true) */
> +#define fGEN_TCG_V6_vcmov(SHORTCODE) \
> +    fGEN_TCG_VEC_CMOV(1)
> +
> +/* Vector conditional move (false) */
> +#define fGEN_TCG_V6_vncmov(SHORTCODE) \
> +    fGEN_TCG_VEC_CMOV(0)
> +
>  #endif
> 

