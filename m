Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA833637E0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 23:33:07 +0200 (CEST)
Received: from localhost ([::1]:53928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYF2Q-0002gD-GB
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 17:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYF0l-0002Fo-99
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:31:23 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYF0j-0006AP-Ad
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:31:22 -0400
Received: by mail-qt1-x835.google.com with SMTP id 18so11367024qtz.6
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 14:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PGWy/frr+QV8tqjACrzYNoMz1qYQbVSQLygbHuBCzAQ=;
 b=veQAATexTRLJw/qaQtvdFMg6sHHkMhFq+q+xpvrqFsRpi14wgKQhS/BtMELM8V7Ukk
 75lW+O2PPfGOnU+sTr9SC1LvKam8StT5B8aQrMNRQqHB4ujgF/z0qzmw74gVrfmX+nkp
 vEpKsDrWhiZp7CKS1ma25OpH6mWBquzSJ1suNK1QDFNTBpvUYu/f6wKTEYw4SuwZJiEr
 rUyvtoU9Sq2g499UNx4miQ/ay3fNBZIu74VltHUVj0CZSKKKi7DDshNNtjdWxu2mir+f
 2NN6LwNfQCHAIUUn5nOgX69Jo0ptI5AeHuRZ0D/Ames1q5e60GwxlKCjFKSO9L33Q586
 8ZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PGWy/frr+QV8tqjACrzYNoMz1qYQbVSQLygbHuBCzAQ=;
 b=HPVyWW9H01xq9qgyhdzUwXcUse9f9m/92uMTlGs/vgfcMWun8P6WAi4kQp2QSEbyu4
 FzIrSPYoJyoMey39Fxm5S6nTH5H2/pclEuCOlOkcZgN21HhM8wyunSy3eyLZxfdWjB8o
 nYLz+oLXH2Gp9ITy0vnrZaF2TpEXxfmMc0JyDeNObF/JfmrFYnzSF6Jbmh3KQ96ICyY9
 cFWpZvkVHi0ncClLeG+UuvphvCW0kU9Q6GmCpAtc+wIXZ3MnnPdM7zbBlbhXXD2i9wSA
 YaW6CUgLHHLjzwuPBrUOn/al5X7HsQ8EF5cgjA+BkRzamwZWEV7T01wIdN3dynY3wr0A
 tVPg==
X-Gm-Message-State: AOAM530Z/Fe+T4/SeKz6k4xkIck/Yg0yj1fq/LkiYsAKFpOD+Jp/D/c0
 RCMmALPXzm/bprm8R6cpBftQaw==
X-Google-Smtp-Source: ABdhPJwh+i+TIt1OpCJNEb4UJ9z6d96szb4gruPHi+64akCBgleX6E1oR1VOmWXMkcOsYdBXo1UuNA==
X-Received: by 2002:ac8:6b49:: with SMTP id x9mr3008297qts.193.1618781480115; 
 Sun, 18 Apr 2021 14:31:20 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id f24sm2467521qto.45.2021.04.18.14.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 14:31:19 -0700 (PDT)
Subject: Re: [PATCH v4 06/12] target/hexagon: introduce new helper functions
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-7-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b36337c6-f6d0-45b1-be11-b998d8579c4c@linaro.org>
Date: Sun, 18 Apr 2021 14:31:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415163455.3839169-7-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 9:34 AM, Alessandro Di Federico wrote:
> +void gen_store32(TCGv vaddr, TCGv src, tcg_target_long width, unsigned slot)
> +{
> +    tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
> +    tcg_gen_movi_tl(hex_store_width[slot], width);
> +    tcg_gen_mov_tl(hex_store_val32[slot], src);
> +}
> +
> +void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
> +                unsigned slot)
> +{
> +    gen_store32(vaddr, src, 1, slot);
> +    ctx->store_width[slot] = 1;
> +}

Why is store_width here and not in gen_store32?
Do you really need so many helpers here, as opposed to making use of MemOp?

> +void gen_sat_i32_ext(TCGv ovfl, TCGv dest, TCGv source, int width)
> +{
> +    gen_sat_i32(dest, source, width);
> +    TCGv zero = tcg_const_i32(0);
> +    TCGv one = tcg_const_i32(1);
> +    tcg_gen_movcond_i32(TCG_COND_NE, ovfl, source, dest, one, zero);

(source != dest ? 1 : 0) -> (source != dest).

Therefore, tcg_gen_setcond_i32.

Or did you intend

ovfl = (source != dest ? 1 : ovfl)?

which is probably still better as

   tcg_gen_setcond_tl(TCG_COND_NE, tmp, source,dest);
   tcg_gen_or_tl(ovfl, ovfl, tmp);

> +void gen_fbrev(TCGv result, TCGv src)
> +{
> +    TCGv lo = tcg_temp_new();
> +    TCGv tmp1 = tcg_temp_new();
> +    TCGv tmp2 = tcg_temp_new();
> +
> +    /* Bit reversal of low 16 bits */
> +    tcg_gen_extract_tl(lo, src, 0, 16);
> +    tcg_gen_andi_tl(tmp1, lo, 0xaaaa);
> +    tcg_gen_shri_tl(tmp1, tmp1, 1);
> +    tcg_gen_andi_tl(tmp2, lo, 0x5555);
> +    tcg_gen_shli_tl(tmp2, tmp2, 1);
> +    tcg_gen_or_tl(lo, tmp1, tmp2);
> +    tcg_gen_andi_tl(tmp1, lo, 0xcccc);
> +    tcg_gen_shri_tl(tmp1, tmp1, 2);
> +    tcg_gen_andi_tl(tmp2, lo, 0x3333);
> +    tcg_gen_shli_tl(tmp2, tmp2, 2);
> +    tcg_gen_or_tl(lo, tmp1, tmp2);
> +    tcg_gen_andi_tl(tmp1, lo, 0xf0f0);
> +    tcg_gen_shri_tl(tmp1, tmp1, 4);
> +    tcg_gen_andi_tl(tmp2, lo, 0x0f0f);
> +    tcg_gen_shli_tl(tmp2, tmp2, 4);
> +    tcg_gen_or_tl(lo, tmp1, tmp2);
> +    tcg_gen_bswap16_tl(lo, lo);
> +
> +    /* Final tweaks */
> +    tcg_gen_deposit_tl(result, src, lo, 0, 16);
> +    tcg_gen_or_tl(result, result, lo);
> +
> +    tcg_temp_free(lo);
> +    tcg_temp_free(tmp1);
> +    tcg_temp_free(tmp2);
> +}

Coordinate with Taylor.
https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg10007.html


r~

