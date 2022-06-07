Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8496F5404FD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 19:20:49 +0200 (CEST)
Received: from localhost ([::1]:39738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nycsp-000093-6p
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 13:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nycp4-0003b4-PV
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:16:54 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nycp3-0007zE-4k
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:16:54 -0400
Received: by mail-pf1-x433.google.com with SMTP id 15so16092179pfy.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 10:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qR04LUYZNbONIEc2hFXdXiU0GrP06zCDFpmYde3L6i0=;
 b=UK55SWNCIHEOQCilgBjsx/eDEv7/IrdHbWSfAFnTssQYbUowoUrfWZC2Z9NkqoIDf5
 f2Wl4XfwJm7/tywZW8bu0KvX1mfiWSF4gyW5t8IImxsZjqFmI2x8Yoj725h3Adk8Url+
 BcI7oyOjdeZa6/yAF5wzI1LJjZGDC7lrVScOUXJgyqBMK6tPzDFhxZNdCo7CAJMZ29yI
 2POAYDCevxISwBu4ur/y2guh7roszkpM3tgAdG1UH1W+gavgLXhr8lZHD+NO+F6gkkJ5
 hp6DovlRPAy+org7OphD9yXzGv+UNmcH2xrdKs+eXuKvOtxJQGDOsKx6hLfaFIlWddMz
 KAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qR04LUYZNbONIEc2hFXdXiU0GrP06zCDFpmYde3L6i0=;
 b=6wgt/ghQ/jNmywx4ssv53yV0C9kn6QbRAcUYZSytV5e8SwPWb8vWpsE3KCSEfS0j01
 KWeu415Q3+O3nEHAvJIIqx1ey8naptBaDvr4EnafKXgjSuIZKzAnZzctaSQlsxExCEdE
 SP5Q75xVPy/dRw80sU7tUcViOzvJ6SYuj5SXixb/mfYz8Uufsmuurd4pmYZAPeJKqdzx
 0NpNqdF8q9uiMHBmXtse77WXl1uaPbxzKM9brxBfktI0k6wR3iPZLQ9xrYLMk2uCSDuN
 NadaEq/ielljWl5VRD5kq+oUZDPKG+1F1k+bTbEang7rAJeOiD+mUaIRq4WngHpYVIiy
 4nRQ==
X-Gm-Message-State: AOAM532nMSE9XaL5E1cxe8hD71MpJ4qLKdnlZ1DXaSLiZGqV51ecpAMC
 TPvFS/dUDMQ9AClAd4Y207dRKg==
X-Google-Smtp-Source: ABdhPJzhI3aBZuUicym5suseISPFud5yICiLVNP4+kXqbn+p4B3RsoyIsXhugDIJ774JZeAvc3NMuw==
X-Received: by 2002:a05:6a00:1811:b0:51b:fec8:be7b with SMTP id
 y17-20020a056a00181100b0051bfec8be7bmr16587507pfa.22.1654622209727; 
 Tue, 07 Jun 2022 10:16:49 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79911000000b0050dc7628179sm13304973pff.83.2022.06.07.10.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 10:16:49 -0700 (PDT)
Message-ID: <52743815-631b-b0c4-4c9a-4ea344e0cfbe@linaro.org>
Date: Tue, 7 Jun 2022 10:16:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] target/mips: implement Octeon-specific arithmetic
 instructions
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jiaxun.yang@flygoat.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com
References: <165459235408.143371.17715826203190085295.stgit@pasha-ThinkPad-X280>
 <165459237035.143371.5795143736970750111.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165459237035.143371.5795143736970750111.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 6/7/22 01:59, Pavel Dovgalyuk wrote:
> +static bool trans_EXTS(DisasContext *ctx, arg_EXTS *a)
> +{
> +    TCGv t0, t1;
> +    int p;
> +    TCGLabel *l1;
> +
> +    if (a->rt == 0) {
> +        /* nop */
> +        return true;
> +    }
> +
> +    p = a->p;
> +    if (a->shift) {
> +        p += 32;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    t1 = tcg_temp_new();
> +    gen_load_gpr(t1, a->rs);
> +
> +    tcg_gen_movi_tl(t0, ((1ULL << (a->lenm1 + 1)) - 1) << p);
> +    tcg_gen_and_tl(t1, t1, t0);
> +    tcg_gen_movi_tl(t0, p);
> +    tcg_gen_shr_tl(cpu_gpr[a->rt], t1, t0);
> +
> +    l1 = gen_new_label();
> +    tcg_gen_movi_tl(t0, 1ULL << a->lenm1);
> +    tcg_gen_and_tl(t0, cpu_gpr[a->rt], t0);
> +    tcg_gen_brcondi_tl(TCG_COND_EQ, t0, 0, l1);
> +    tcg_gen_movi_tl(t0, ~((1ULL << (a->lenm1 + 1)) - 1));
> +    tcg_gen_or_tl(cpu_gpr[a->rt], cpu_gpr[a->rt], t0);
> +    gen_set_label(l1);

This is tcg_gen_sextract_tl.

> +static bool trans_CINS(DisasContext *ctx, arg_CINS *a)
> +{
> +    TCGv t0, t1;
> +
> +    if (a->rt == 0) {
> +        /* nop */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    t1 = tcg_temp_new();
> +    gen_load_gpr(t1, a->rs);
> +
> +    tcg_gen_movi_tl(t0, (1ULL << (a->lenm1 + 1)) - 1);
> +    tcg_gen_and_tl(t1, t1, t0);
> +    tcg_gen_movi_tl(t0, a->p + a->shift ? 32 : 0);
> +    tcg_gen_shl_tl(cpu_gpr[a->rt], t1, t0);

This is tcg_gen_deposit_z_tl.

> +static bool trans_POP(DisasContext *ctx, arg_POP *a)
> +{
> +    TCGv t0;
> +
> +    if (a->rd == 0) {
> +        /* nop */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    gen_load_gpr(t0, a->rs);
> +    if (!a->dw) {
> +        tcg_gen_andi_i64(t0, t0, 0xffffffff);
> +    }
> +    gen_helper_pop(cpu_gpr[a->rd], t0);

This is tcg_gen_ctpop_tl.


r~

