Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B73D3162
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 03:50:45 +0200 (CEST)
Received: from localhost ([::1]:49108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6kKq-00020K-Cf
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 21:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6kJU-0001Gj-Ct
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 21:49:20 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6kJT-0000jv-2Y
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 21:49:20 -0400
Received: by mail-pj1-x1029.google.com with SMTP id l19so181081pjz.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 18:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2phKtDmikTnXvD+zBW1mFIlsNU7XuCMCu2himmIUlK0=;
 b=D5wIR2dk2xD/QjIWzQDsVSSEc18hRz/rJlPEmeoWh9rinIyJJeR21B7QhAxZP6JiGV
 6YSYkPs5oyF10/lZHiaB8cEY6FXUHdpYAp3iQ2AS7vgsSETqXwQg4TNcjUtEr1DRaRjg
 ZRiej7OcqfJl17aqyhW27GdXFIDD2HWUXNuTxodndAkzqnGsH2hhp3ulG2cXvWJmdW/U
 4UiMnskD5tvKrJRxPQqSZNaYerfpgKRPBM205IWBaP+8x9nS25K4VRxJnav6bLTDcuR/
 r6y+Zi0MXE3cbn7VXkXT/LCs6qQ6hg3JLBTGSBEA9qYedCOh41ZeGNO5M5Z5NRoZ7a/1
 uXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2phKtDmikTnXvD+zBW1mFIlsNU7XuCMCu2himmIUlK0=;
 b=tCeObWXVyWzOx7zJE0dH8KVkvnu7AEo25d268YE32v2fJ25u3fBFTKuz4YOr+SDO3Q
 N4f4C2h5H120afkXByMJkLgIF8HquuPHq8/03jHXDX4m8BgQUB5IVwvIi2IbUE26Gpr2
 Ix82QxSas+492By2gXqN4z8cjx2++Hi9iCy6VZLm5KWMPRjnQuGqQ53dQ2aNd3CUqev3
 43uabZPEe9LKtEbjgE2uRFBAuj31SAcFFN8fEtRwfvXc9O+WlDadufFodc+K6Wo7MeDU
 KSOFJgZeSH8IwyTfsxJ5okah0Du3/U2kiGsGltJuyiU079LA5/2crfBMxZO9BH1wL/y5
 s91w==
X-Gm-Message-State: AOAM532bQNxHsCh2i9uLDrigTgWzDd6D+zFsAXhtrpAihV1ks5+7g6Jx
 thFfA9ux/ZJdKTObQi58KoHtgQ==
X-Google-Smtp-Source: ABdhPJwlJ9BAWPcEPOrFEBvJHk3QlhU6WZb/xIwREPEofl4Vt/aWoUUtHC+aT9qdWdVaFNnbBIDjyA==
X-Received: by 2002:a63:5b17:: with SMTP id p23mr2749233pgb.94.1627004957685; 
 Thu, 22 Jul 2021 18:49:17 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id a8sm13728639pgd.50.2021.07.22.18.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 18:49:17 -0700 (PDT)
Subject: Re: [PATCH v2 11/22] target/loongarch: Add fixed point atomic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-12-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b4f41a3-1f7c-6eaa-d0d4-e676888fdc98@linaro.org>
Date: Thu, 22 Jul 2021 15:49:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-12-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> +#define TRANS_AM_W(name, op)                                      \
> +static bool trans_ ## name(DisasContext *ctx, arg_ ## name * a)   \
> +{                                                                 \
> +    TCGv addr, val, ret;                                          \
> +    TCGv Rd = cpu_gpr[a->rd];                                     \
> +    int mem_idx = ctx->mem_idx;                                   \
> +                                                                  \
> +    if (a->rd == 0) {                                             \
> +        return true;                                              \
> +    }                                                             \
> +    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) { \
> +        printf("%s: warning, register equal\n", __func__);        \
> +        return false;                                             \
> +    }                                                             \
> +                                                                  \
> +    addr = get_gpr(a->rj);                                        \
> +    val = get_gpr(a->rk);                                         \
> +    ret = tcg_temp_new();                                         \
> +                                                                  \
> +    tcg_gen_atomic_##op##_tl(ret, addr, val, mem_idx, MO_TESL |   \
> +                            ctx->default_tcg_memop_mask);         \
> +    tcg_gen_mov_tl(Rd, ret);                                      \
> +                                                                  \
> +    tcg_temp_free(ret);                                           \
> +                                                                  \
> +    return true;                                                  \
> +}

No printf.  Use a common routine instead of macros.


r~

