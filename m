Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1844B1DF2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 06:35:27 +0100 (CET)
Received: from localhost ([::1]:43580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIOac-0006Kw-UN
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 00:35:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOUz-0004K0-L2
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:37 -0500
Received: from [2607:f8b0:4864:20::1032] (port=52098
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOUy-0007c8-23
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:37 -0500
Received: by mail-pj1-x1032.google.com with SMTP id y9so7157361pjf.1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 21:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DXMLc9F+E7fro9eWS2VCk5tVJWMkdfkGtnObgyvYcR4=;
 b=OxYrsMAhMqZ33N6lWplkmOMfKoEF5qtQE9JENoWeATdPff9Hbee2OUXC0VUIVeJcDS
 kUa8qtLbntKRNiKf3vBaQEuIbzn/VFsWtIZK/82vhptS+X2Cc1SuoTJLoYhvTBFUYtbM
 aEfxEz1FuDB3It+eHUt5sJiD3KJIfdfVlGAcWANJum3mrqHx/D8ASoDYxLlNI7L0U8yW
 do8he/V2YGMXKqUpAaDVI7ZZ5wMQSj1OZSN8U8F3r72Xtwrvg6oe1to3oMif2EaeOqq8
 hmP5KZFYt6OGc4yJdBzQ92JwsSWmzUZtik1Vas2mqWy1nUkzkfLvuUGI8M7arFJ5HcFl
 6H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DXMLc9F+E7fro9eWS2VCk5tVJWMkdfkGtnObgyvYcR4=;
 b=eRZQfFL05DVDI5YkOoAyrzaib7OGb7gCrN5ZH6k14p2ogZeXAqbVrpSyejmVpt6LHs
 3IPrHV4IrC3EyHPdBG4fmBXJJU3Ob7GQotinCuH95YNiGFNh3iOrHt1OYl48QVzKUgjz
 b4Yc/XIGgeqt0bu8EZJ4UuYh2IU5XOZGEJQH2q6NwH9ix3miYs8HDlnBAyV1dvsFOWGs
 aXarAHBXaPv/B3S/Af/f3dXH+J2+qSYLHxHaoXPpFkvP4Yv5rWxk/Cvk4OhbtVZPwbL8
 zTihjbQXVum9mgUSHG6R1nRl+IOW1mwMKRJdiYpm6z9ozr67r86PEBhZJBgdvj0/mFHM
 yaTw==
X-Gm-Message-State: AOAM532R0LRULQmxwSRlx3SbnxMqsN9YNbRdWoJcDiQsAyi4HITVDAJH
 KXRJ3JTnnRUkjxAeQIAUKrxTuQ==
X-Google-Smtp-Source: ABdhPJzO+YvC6J1EfbcRojujPZ6TLii78197nUGJpGDNv1oHMzmpePJ2JMQHnxBHceLF8uFfY3zxYg==
X-Received: by 2002:a17:902:b692:: with SMTP id c18mr27097pls.85.1644557373756; 
 Thu, 10 Feb 2022 21:29:33 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id e30sm18039222pge.34.2022.02.10.21.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 21:29:33 -0800 (PST)
Message-ID: <fdd3b7cf-163f-d728-af0d-c1d958e48329@linaro.org>
Date: Fri, 11 Feb 2022 16:00:46 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 14/37] target/ppc: implement vstri[bh][lr]
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-15-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-15-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> +#define VSTRI(NAME, ELEM, NUM_ELEMS, LEFT) \
> +void helper_##NAME(CPUPPCState *env, ppc_avr_t *t, ppc_avr_t *b,    \
> +                   target_ulong rc)                                 \
> +{                                                                   \
> +    bool null_found = false;                                        \
> +    int i, idx;                                                     \
> +                                                                    \
> +    for (i = 0; i < NUM_ELEMS; i++) {                               \
> +        idx = LEFT ? i : NUM_ELEMS - i - 1;                         \
> +        if (b->Vsr##ELEM(idx)) {                                    \
> +            t->Vsr##ELEM(idx) = b->Vsr##ELEM(idx);                  \
> +        } else {                                                    \
> +            null_found = true;                                      \
> +            break;                                                  \
> +        }                                                           \
> +    }                                                               \
> +                                                                    \
> +    for (; i < NUM_ELEMS; i++) {                                    \
> +        idx = LEFT ? i : NUM_ELEMS - i - 1;                         \
> +        t->Vsr##ELEM(idx) = 0;                                      \
> +    }                                                               \
> +                                                                    \
> +    if (rc) {                                                       \
> +        env->crf[6] = null_found ? 0b0010 : 0;                      \
> +    }                                                               \
> +}

The only reason you're passing in env is for crf[6], which requires you to pass in a 
second argument.  And you're not using the return value.

It would be better to always return the rc value, and only conditionally assign it.
E.g.

     if (a->rc) {
         gen_helper(cpu_crf[6], vrt, vrb);
     } else {
         TCGv_i32 discard = tcg_temp_new_i32();
         gen_helper(discard, vrt, vrb);
         tcg_temp_free_i32(discard);
     }

r~

