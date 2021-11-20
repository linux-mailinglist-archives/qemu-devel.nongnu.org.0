Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D99A457C7F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 09:08:45 +0100 (CET)
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moLQS-0000FQ-7d
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 03:08:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moLNw-0007IP-0t
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:06:09 -0500
Received: from [2a00:1450:4864:20::42c] (port=46752
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moLNs-0006QY-2T
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:06:07 -0500
Received: by mail-wr1-x42c.google.com with SMTP id u1so22165933wru.13
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 00:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rNuSf+ZTFvuYrjXQ16Pn2nKWyBor5n/4apCUU6/UQt0=;
 b=kK5xVfQhzKjMXoiltrW/Af4Z6MYtYRt77M/VuChCv31OFrJBcc7WHc/IhegeAKyWrC
 mzK7WurTAm2FWdO10b3w2gCmfwk+VwL9RlOmYd93BTt4cSmtB/qgwcxR52NeW+vTg4Rl
 EJ313Op3sHPl53164M21hX5msb9PtM3ES6s9lrql3hcHHY/7F0jVY7AXiWhg7/SNRd84
 WIXtxKg2zpOc8plvzvpEP1mStjV1GzkxA4EpPivDg58dpnbB9piNbf7eiqJmIii0isdF
 JOjPrJGdL1h+3bniAvunzwSjbcBTCKFV5zB1pjGccxhTLRXuO05jUv/9ESDpL+msNlZF
 vs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rNuSf+ZTFvuYrjXQ16Pn2nKWyBor5n/4apCUU6/UQt0=;
 b=jr+XZBkd6agGHWJ1yZpkZn5R4W2ncE2LSxflx42TPaFxQveU6H0jNyW0uH7GpNontf
 xKL+3hfr8sib+V8fpQrrrqh74WLq276s31sf88x4EXo8iC6mIQ7HjbR+0kHo/lIQI6Cm
 kYa3F4rbZ8wKoW6/TTzZqzTTTzEMYaodKENU89Xv+VOuI6TchyniB/bQEQ9LieXlC8lS
 aaa0CLAz8SlrJMbB9lUIaml9UIxfj8jDsYOECoPerI9C452IM+YvLNm9JHpCWxcdzc50
 NRBo1CXT77e3EsXUiX5TPnjW38/23k5v9zueN1twD5Jt6eERK7jPUNo4uFQMnIazHTGX
 YWiw==
X-Gm-Message-State: AOAM532PeRUl75gJ+Ax37muJgOR8L7mCcV8vBL7MfCB/GsWmgjKZfTOL
 w+aXlKFfaKUgdqVom9kxwNrf8w==
X-Google-Smtp-Source: ABdhPJxs31jryc0uGdtcwAouQljWFE/zQ3gA4YdCddGWQfnP8P8UXW163YBaAJJucDiKHuVI3D2MjA==
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr14748014wrq.311.1637395562028; 
 Sat, 20 Nov 2021 00:06:02 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id r17sm18022231wmq.5.2021.11.20.00.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 00:06:01 -0800 (PST)
Subject: Re: [PATCH v11 06/26] target/loongarch: Add fixed point bit
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-7-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c4b8bff-9502-0a2c-3ecd-3b1156a69e81@linaro.org>
Date: Sat, 20 Nov 2021 09:05:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-7-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +static bool gen_rr(DisasContext *ctx, arg_rr *a,
> +                   DisasExtend src_ext, DisasExtend dst_ext,
> +                   void (*func)(TCGv, TCGv))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
> +    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
> +
> +    func(dest, src1);
> +
> +    if (dst_ext) {
> +        gen_set_gpr(a->rd, dest, dst_ext);
> +    }

Again, I think you should call gen_set_gpr unconditionally.

> +static bool trans_bytepick_w(DisasContext *ctx, arg_bytepick_w *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
> +
> +    tcg_gen_concat_tl_i64(dest, src1, src2);
> +    tcg_gen_sextract_i64(dest, dest, (32 - (a->sa) * 8), 32);
> +
> +    return true;
> +}

Better to use gen_rrr_sa.

> +static bool trans_bytepick_d(DisasContext *ctx, arg_bytepick_d *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
> +
> +    tcg_gen_extract2_i64(dest, src1, src2, (64 - (a->sa) * 8));
> +    return true;
> +}

Likewise.

> +static void gen_ctz_w(TCGv dest, TCGv src1)
> +{
> +    tcg_gen_ori_tl(dest, src1, (target_ulong)MAKE_64BIT_MASK(32, 32));
> +    tcg_gen_ctzi_tl(dest, dest, 32);

This should be TARGET_LONG_BITS.  It will never happen, because the value is not zero per 
the OR, but it's what is most efficient for a tcg backend that naturally produces 
TARGET_LONG_BITS for a TL-sized ctz.

> +}
> +
> +static void gen_cto_w(TCGv dest, TCGv src1)
> +{
> +    tcg_gen_not_tl(dest, src1);
> +    tcg_gen_ext32u_tl(dest, dest);
> +    gen_ctz_w(dest, dest);
> +}

The EXT32U here is useless, as the OR within gen_ctz_w overrides it.

> +&rr_2bw       rd rj msbw lsbw
> +&rr_2bd       rd rj msbd lsbd

Merge these.


r~

