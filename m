Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109A73A5F46
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:42:37 +0200 (CEST)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsj76-0002Tj-4H
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsj6K-0001na-87
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:41:48 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsj6I-0007Pw-Je
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:41:47 -0400
Received: by mail-wr1-x432.google.com with SMTP id f2so13784825wri.11
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 02:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pqV3Oi1TtLAafwTaLldkiams1YxXlIu+GBiQ+Q1hq78=;
 b=KOujQNoLqMZ1SDSAybCXHci68/WmBRkjaDYEWOZZRk9h2MHOhMZBmeoTkTDfufy6WU
 KUF9jbHvH286K+6UTq3onkhgeb7s0C4LaP/M0iuOyR+T1OIvV/hzIKpQpDJOIKdqZm9l
 WJ2Dwfwp0H+RGVP4gmfiPq7GmMPOwrE98j9BNVhAbpIO2TA7sNaANlIp6zLFhi5Gk0vP
 nXQBx+i547WeNREqu5gHl3sf01KfJcrODlY7KwVPCQpCNorzYdzfzvmazi1+z1OuBePr
 iZLS/2WB3ySNMpVwPTJX2kBqqfXd1LEK9D+UMwxKplcZCtY6SM0VqKDutdWtGbKERxc5
 aDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pqV3Oi1TtLAafwTaLldkiams1YxXlIu+GBiQ+Q1hq78=;
 b=JaNORQwg2mqlMopGijz6RLU3Hw5ll+GO2QOo9lzV+qNHONClx1zzfMuujy7iP2DrQl
 OLxpt7b6ylr6qjh6v7ch7I7ehG9xbgnY8njQ1Q8yWVrGf5Z4p8jf/Vk9xt2q0LlfrDNz
 lqa8+EBKbGYHUl4RljyG13gTkAGSBcC2rVix/UtrmFACixkLVHbf8qeAQ5UTOXr+2Vpl
 72/SMEm17w4XkWzY9ovd9/mjam6VYEGjOHCU5CuZ5VuJLyAt+RCTOfQgj+zE71I405QT
 NPfeujvCwZv3v2oLzP8M5kXOER8gzGYOIZVFscwLnqxtBk9rJXornzK+1uHF7+SSKlAt
 K2wQ==
X-Gm-Message-State: AOAM5336ytXae999DNBn8fpQgwnIIJdKPAhbmCUh3CGGlUs53byKO2oO
 sgMtebQBXndwLHptM61yLVpGvdbAaHIVfA==
X-Google-Smtp-Source: ABdhPJzkrTN8NHIBJq4mHYrw17tUC/G4YFARCmZnhqtszPhVAT35/HcLBI6uCGQfbfRVx01FEcBhrg==
X-Received: by 2002:a05:6000:18ca:: with SMTP id
 w10mr10052265wrq.55.1623663704743; 
 Mon, 14 Jun 2021 02:41:44 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x125sm13707004wmg.37.2021.06.14.02.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 02:41:43 -0700 (PDT)
Subject: Re: [PATCH 17/28] tcg: Add flags argument to tcg_gen_bswap16_*,
 tcg_gen_bswap32_i64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f01808cb-0bd1-aa4d-f289-a59a4c281203@amsat.org>
Date: Mon, 14 Jun 2021 11:41:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614083800.1166166-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 10:37 AM, Richard Henderson wrote:
> Implement the new semantics in the fallback expansion.
> Change all callers to supply the flags that keep the
> semantics unchanged locally.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-op.h            |   8 +--
>  target/arm/translate-a64.c      |  12 ++--
>  target/arm/translate.c          |   2 +-
>  target/i386/tcg/translate.c     |   2 +-
>  target/mips/tcg/mxu_translate.c |   2 +-
>  target/s390x/translate.c        |   4 +-
>  target/sh4/translate.c          |   2 +-

Various REV 16/32, would it be useful to have it as a TCG opcode?

>  tcg/tcg-op.c                    | 121 ++++++++++++++++++++++----------
>  8 files changed, 99 insertions(+), 54 deletions(-)

>      } else {
>          TCGv_i64 t0 = tcg_temp_new_i64();
>          TCGv_i64 t1 = tcg_temp_new_i64();
>          TCGv_i64 t2 = tcg_constant_i64(0x00ff00ff);
>  
> -                                        /* arg = ....abcd */
> -        tcg_gen_shri_i64(t0, arg, 8);   /*  t0 = .....abc */
> -        tcg_gen_and_i64(t1, arg, t2);   /*  t1 = .....b.d */
> -        tcg_gen_and_i64(t0, t0, t2);    /*  t0 = .....a.c */
> -        tcg_gen_shli_i64(t1, t1, 8);    /*  t1 = ....b.d. */
> -        tcg_gen_or_i64(ret, t0, t1);    /* ret = ....badc */
> +                                            /* arg = xxxxabcd */
> +        tcg_gen_shri_i64(t0, arg, 8);       /*  t0 = .xxxxabc */
> +        tcg_gen_and_i64(t1, arg, t2);       /*  t1 = .....b.d */
> +        tcg_gen_and_i64(t0, t0, t2);        /*  t0 = .....a.c */
> +        tcg_gen_shli_i64(t1, t1, 8);        /*  t1 = ....b.d. */
> +        tcg_gen_or_i64(ret, t0, t1);        /* ret = ....badc */
>  
> -        tcg_gen_shli_i64(t1, ret, 48);  /*  t1 = dc...... */
> -        tcg_gen_shri_i64(t0, ret, 16);  /*  t0 = ......ba */
> -        tcg_gen_shri_i64(t1, t1, 32);   /*  t1 = ....dc.. */
> -        tcg_gen_or_i64(ret, t0, t1);    /* ret = ....dcba */
> +        tcg_gen_shli_i64(t1, ret, 48);      /*  t1 = dc...... */
> +        tcg_gen_shri_i64(t0, ret, 16);      /*  t0 = ......ba */
> +        if (flags & TCG_BSWAP_OS) {
> +            tcg_gen_sari_i64(t1, t1, 32);   /*  t1 = ssssdc.. */
> +        } else {
> +            tcg_gen_shri_i64(t1, t1, 32);   /*  t1 = ....dc.. */
> +        }
> +        tcg_gen_or_i64(ret, t0, t1);        /* ret = ssssdcba */

Comment update appreciated, thanks.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

