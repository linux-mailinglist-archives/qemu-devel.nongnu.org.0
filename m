Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D994D5111E7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 09:04:43 +0200 (CEST)
Received: from localhost ([::1]:48224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njbj8-0005hX-Ug
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 03:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njbfA-0004n1-Hc
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 03:00:37 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njbf8-0001JL-J3
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 03:00:36 -0400
Received: by mail-ej1-x62a.google.com with SMTP id y3so1462567ejo.12
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 00:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0f0plXion9R3CzG61wij8R100MD3Y9XM9i1nCgRHTzk=;
 b=eui4QfX0yB9KclJWNpiRam+QsMoRxtDlsp9DByj59xFs1ZjOSiWZvbS27o5AFZC3XY
 fdaiqhMEKSSc1m0sxEKE2GjciUEXj/s79eWJfCrsc9mqiniOWh+ZeD/Q+CXF2dVakRlt
 5mv+wgtbsObCbmoGhUFde6n5VYba4c3zXjlxQ1YLZqqH1toQi4ojtkgxM79CYThMDHwk
 M0xwLVHYQoY4IVfr+XM7/mWnzr+f3ZqedWGASROBXGVs5eJVUF9Bct0hfj96k0jMHvt/
 ebJgzRwH+THEcOKkEWF+g3LqoFkDs9yqu455acBLQmOuWnCn5HWdw5iW9jhWcG0jYEUQ
 hRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0f0plXion9R3CzG61wij8R100MD3Y9XM9i1nCgRHTzk=;
 b=XTIxewmlSMf2wRfRHdTou6idPoFp/zfI/fb5XvlpKN2BQyZ2Q2D7lJxU4soxBIzU4N
 nRAj+fl/ZqZBGFN+bRs4Mq6oSZBYSfFL13aOlUF5BiNbapKTaK2yxLiymRxOOKtBcXXJ
 Uees3QUwdrUcnhyIdsv1UcritRXAUhnFc0Z5enwmWN3vbnCTTsL5n7d3orU9Mo+oyL7g
 StiHBbD+GrmgwEqSPR+mI8DWPeYdrjUzYQaEqwGNwJF0fcg9OSOdKyB30cNQcy+tm6k+
 F6rokZn5ads+QF3QHNRVdE7eD3iRoo01jGjYJWyy8eJeJH/hCHz/58b3FombLMC92qC4
 VcrQ==
X-Gm-Message-State: AOAM530U8npjpiwrZUeIWvl9bLSAd3BXwoyD2zD5lC8NC9lsmJ/hrqv2
 qWEpSuSUFQieGz+wm03ZnBc=
X-Google-Smtp-Source: ABdhPJwC2x4vtc2gCuKn/GrAbVsCcOucrLIry43vrasqnEBgZKozFroiQgAnaGlIGMogJye8bv24Ww==
X-Received: by 2002:a17:907:50a3:b0:6f3:a302:96aa with SMTP id
 fv35-20020a17090750a300b006f3a30296aamr10192175ejc.2.1651042832967; 
 Wed, 27 Apr 2022 00:00:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 w14-20020a056402268e00b00425f02088d2sm4275780edd.26.2022.04.27.00.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 00:00:32 -0700 (PDT)
Message-ID: <860ea92c-355a-07df-23b7-a46c7e84d9b2@redhat.com>
Date: Wed, 27 Apr 2022 09:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 01/42] i386: pcmpestr 64-bit sign extension bug
Content-Language: en-US
To: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-2-paul@nowt.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220424220204.2493824-2-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 00:01, Paul Brook wrote:
> The abs1 function in ops_sse.h only works sorrectly when the result fits
> in a signed int. This is fine most of the time because we're only dealing
> with byte sized values.
> 
> However pcmp_elen helper function uses abs1 to calculate the absolute value
> of a cpu register. This incorrectly truncates to 32 bits, and will give
> the wrong anser for the most negative value.
> 
> Fix by open coding the saturation check before taking the absolute value.
> 
> Signed-off-by: Paul Brook <paul@nowt.org>

Queued, thanks.

Paolo

> ---
>   target/i386/ops_sse.h | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> index e4d74b814a..535440f882 100644
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -2011,25 +2011,23 @@ SSE_HELPER_Q(helper_pcmpgtq, FCMPGTQ)
>   
>   static inline int pcmp_elen(CPUX86State *env, int reg, uint32_t ctrl)
>   {
> -    int val;
> +    target_long val, limit;
>   
>       /* Presence of REX.W is indicated by a bit higher than 7 set */
>       if (ctrl >> 8) {
> -        val = abs1((int64_t)env->regs[reg]);
> +        val = (target_long)env->regs[reg];
>       } else {
> -        val = abs1((int32_t)env->regs[reg]);
> +        val = (int32_t)env->regs[reg];
>       }
> -
>       if (ctrl & 1) {
> -        if (val > 8) {
> -            return 8;
> -        }
> +        limit = 8;
>       } else {
> -        if (val > 16) {
> -            return 16;
> -        }
> +        limit = 16;
>       }
> -    return val;
> +    if ((val > limit) || (val < -limit)) {
> +        return limit;
> +    }
> +    return abs1(val);
>   }
>   
>   static inline int pcmp_ilen(Reg *r, uint8_t ctrl)


