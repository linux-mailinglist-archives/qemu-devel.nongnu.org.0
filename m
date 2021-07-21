Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738A73D156C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 19:48:17 +0200 (CEST)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6GKO-0005O5-H2
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 13:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GJ4-0004h4-R0
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:46:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GJ2-000870-1y
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:46:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so3886074wmf.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 10:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oPAQ1HIU9OEYgJseCTbLTzhiLb4iqXPKpTt16ufEuko=;
 b=XX1s6oKs72SKOx4KYIhN1u7dApSqug8VLoaEBS0G1UqvdF9eOzoccIMzzunuGCTCsW
 D3Xm83nCapjYC+LJOJKAH9qFEhTugDR4mWQLtcv5IoN2EmxvOf28cGQ/xG/ldqtOTXDv
 icR5F6tWu5OVpGLD1l8vR2tJKNs5BrfBhlYeVPlmnng6nUOedKnCDul8akOfm/ai8wAk
 nwrs9GIjzOcalx9ae8DYqLHld+1frnhKNqwOxzq2A0mq+wungm8KSl3PP/sSpvIEy/6B
 HtgDrjTkbbINHkI+SEl4d6WWfwlw3HShhnnIJcVzb7Wa2dpRMscuEPYBnpa2iYPbxzHs
 stYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oPAQ1HIU9OEYgJseCTbLTzhiLb4iqXPKpTt16ufEuko=;
 b=Z0uAkH5uoXlZc1vx3t3QD/zeqcjX83NXcF71Zral6PSN8PhiEIZq1cUqft3WNNqUqo
 UYDAP9dhPpzJlMqhrZG67UTV+WBusl3q5BcnIpe1VNzUuy4dMgO0sLGlwtzz1m1YaB0L
 RPVtQKQO9mffGIhQGAKh1EdpNfyc0V3aF/g16JboXx6qg74xGxh94VVJt4nSwyuRZoHm
 VYQsJVARJWJkGvJhaNGj9ZDoDej0I3XL0VfnkrVOPpNf4/OwpBH6r5WZci5TpQkZiYvD
 8wVBMEmYL/XleLQq6ipWFn56n+WVkPqjnigPYJ449D3nLd5XKTtjduhrP1d84QxgUwth
 j8kA==
X-Gm-Message-State: AOAM530Udi+FsWGPeCTQ5eqtABKyyrFw6aL/Hem7kW1i+GBgR8+ZEMHV
 4LEcvzyR9bR7LXHBUBbfz4U=
X-Google-Smtp-Source: ABdhPJy6LqDHpDsjkA8AAXLgbyOp/RRnMBOCkvoDqY+eMmVyHzvBIvGd/Hf7ToErPs9g1LwufChelQ==
X-Received: by 2002:a1c:35c2:: with SMTP id
 c185mr38281935wma.126.1626889610512; 
 Wed, 21 Jul 2021 10:46:50 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id d29sm33703173wrb.63.2021.07.21.10.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 10:46:49 -0700 (PDT)
Subject: Re: [PATCH v2 09/22] target/loongarch: Add fixed point bit
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-10-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fa4f505f-067d-29b4-03ca-e65108792257@amsat.org>
Date: Wed, 21 Jul 2021 19:46:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-10-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.117,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 richard.henderson@linaro.org, laurent@vivier.eu, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 11:53 AM, Song Gao wrote:
> This patch implement fixed point bit instruction translation.
> 
> This includes:
> - EXT.W.{B/H}
> - CL{O/Z}.{W/D}, CT{O/Z}.{W/D}
> - BYTEPICK.{W/D}
> - REVB.{2H/4H/2W/D}
> - REVH.{2W/D}
> - BITREV.{4B/8B}, BITREV.{W/D}
> - BSTRINS.{W/D}, BSTRPICK.{W/D}
> - MASKEQZ, MASKNEZ
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  target/loongarch/helper.h     |  10 +
>  target/loongarch/insns.decode |  45 +++
>  target/loongarch/op_helper.c  | 119 ++++++++
>  target/loongarch/trans.inc.c  | 665 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 839 insertions(+)

> diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
> index b2cbdd7..07c3d52 100644
> --- a/target/loongarch/op_helper.c
> +++ b/target/loongarch/op_helper.c
> @@ -25,3 +25,122 @@ void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
>  {
>      do_raise_exception(env, exception, GETPC());
>  }
> +
> +target_ulong helper_cto_w(CPULoongArchState *env, target_ulong rj)
> +{
> +    uint32_t v = (uint32_t)rj;
> +    int temp = 0;
> +
> +    while ((v & 0x1) == 1) {
> +        temp++;
> +        v = v >> 1;
> +    }

Why not use cto32() from "qemu/host-utils.h"

> +
> +    return (target_ulong)temp;
> +}
> +
> +target_ulong helper_ctz_w(CPULoongArchState *env, target_ulong rj)
> +{
> +    uint32_t v = (uint32_t)rj;
> +
> +    if (v == 0) {
> +        return 32;
> +    }
> +
> +    int temp = 0;
> +    while ((v & 0x1) == 0) {
> +        temp++;
> +        v = v >> 1;
> +    }

ctz32

> +
> +    return (target_ulong)temp;
> +}
> +
> +target_ulong helper_cto_d(CPULoongArchState *env, target_ulong rj)
> +{
> +    uint64_t v = rj;
> +    int temp = 0;
> +
> +    while ((v & 0x1) == 1) {
> +        temp++;
> +        v = v >> 1;
> +    }

cto64

> +
> +    return (target_ulong)temp;
> +}
> +
> +target_ulong helper_ctz_d(CPULoongArchState *env, target_ulong rj)
> +{
> +    uint64_t v = rj;
> +
> +    if (v == 0) {
> +        return 64;
> +    }
> +
> +    int temp = 0;
> +    while ((v & 0x1) == 0) {
> +        temp++;
> +        v = v >> 1;
> +    }

and ctz64?

> +
> +    return (target_ulong)temp;
> +}
> +
> +target_ulong helper_bitrev_w(CPULoongArchState *env, target_ulong rj)
> +{
> +    int32_t v = (int32_t)rj;
> +    const int SIZE = 32;
> +    uint8_t bytes[SIZE];
> +
> +    int i;
> +    for (i = 0; i < SIZE; i++) {
> +        bytes[i] = v & 0x1;
> +        v = v >> 1;
> +    }
> +    /* v == 0 */
> +    for (i = 0; i < SIZE; i++) {
> +        v = v | ((uint32_t)bytes[i] << (SIZE - 1 - i));
> +    }
> +
> +    return (target_ulong)(int32_t)v;
> +}
> +
> +target_ulong helper_bitrev_d(CPULoongArchState *env, target_ulong rj)
> +{
> +    uint64_t v = rj;
> +    const int SIZE = 64;
> +    uint8_t bytes[SIZE];
> +
> +    int i;
> +    for (i = 0; i < SIZE; i++) {
> +        bytes[i] = v & 0x1;
> +        v = v >> 1;
> +    }
> +    /* v == 0 */
> +    for (i = 0; i < SIZE; i++) {
> +        v = v | ((uint64_t)bytes[i] << (SIZE - 1 - i));
> +    }
> +
> +    return (target_ulong)v;
> +}
> +
> +static inline target_ulong bitswap(target_ulong v)
> +{
> +    v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
> +        ((v & (target_ulong)0x5555555555555555ULL) << 1);
> +    v = ((v >> 2) & (target_ulong)0x3333333333333333ULL) |
> +        ((v & (target_ulong)0x3333333333333333ULL) << 2);
> +    v = ((v >> 4) & (target_ulong)0x0F0F0F0F0F0F0F0FULL) |
> +        ((v & (target_ulong)0x0F0F0F0F0F0F0F0FULL) << 4);
> +    return v;

Is this revbit64?

> +}
> +
> +target_ulong helper_loongarch_dbitswap(target_ulong rj)
> +{
> +    return bitswap(rj);
> +}
> +
> +target_ulong helper_loongarch_bitswap(target_ulong rt)
> +{
> +    return (int32_t)bitswap(rt);
> +}

