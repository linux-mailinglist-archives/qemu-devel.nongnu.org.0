Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3091D400B6F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 15:05:45 +0200 (CEST)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMVMe-0001lm-80
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 09:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMVL9-00013o-Gk
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 09:04:11 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMVL7-0001cT-PA
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 09:04:11 -0400
Received: by mail-ej1-x631.google.com with SMTP id h9so3653645ejs.4
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DU0v+3400YmYnHY5umnHPtMAO0hSaq3omGdIh+/QxnE=;
 b=jJ1vyju8wV3UK9OBbYX51C5MfLD2YG92iAEK8XFxPmj4WQxiqoO5+Ps3Ci5l0JHSXE
 j3+pf5uiCyHw8Bd+gMBQ3rTGZsGwcKZxEbJGxuCxa4C6sFI9hAQt5ZBJ8s8HRkDaArLT
 KxUyRsP7G4uIwmdT8nZ8AkcJdoNw1onGh7sE12M3EI+9Z62RWS3B/bwfYM/XI7Cg3pjN
 K9bjPYVtyJRzupA2uQJQODIXjsBNRwIyevL5eQOJj3UhxKpWKj5pGryiWUhB/owsmx/W
 HfuEU/8UhlkVvsxyMTutA/ddNZkzIUSTLC96PPGq6xHD9eTlrO4UEXP1wT7QYxX8+kXT
 z2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DU0v+3400YmYnHY5umnHPtMAO0hSaq3omGdIh+/QxnE=;
 b=npPm9KxnMwOcghgDku/wRd0ndX16RH+p6U0aZQQabJfYWrujt4tJElaAxPha9nop7s
 TCyoimTkF9BVnk34AoWNuJBGrGK6CdXkoaOLRkfeWgwdc3kOHY0F9yXv9bpodt1Kg8sh
 hEuO1zQAasDEX9W02RtJIYpSlUQBMAdIFoEedwMp9M/LpVIN12KBziFytHHHuQDNQlFZ
 qiiITdxkjIDLCYL14wIz0zjgEy+gBbqNHSIuAgBXpCy1Uin4CnN4TJceSpVYeYPJb1LQ
 R7U2HhbyQDQ5fyyVOxfOjhpZ6LUo5WdfQHOtlwVj1LTqJlbUzwThiJEXs/ww6fcPOfWt
 oL/g==
X-Gm-Message-State: AOAM531LqCisc3pwW7D+fjksUhHNCUUOmt78oUk1+oiJuZj4ZBuBoxJF
 FIt9fOj1AzURAZ9rfLWQIz+wfQ==
X-Google-Smtp-Source: ABdhPJxGoOJD9CuSKCqBOqaL5yGpdOmm3eDpHhQ7kLj6tSu4+/DyYMyw1d6foAh9oahouetjSPySCA==
X-Received: by 2002:a17:906:12c6:: with SMTP id
 l6mr3885747ejb.373.1630760648116; 
 Sat, 04 Sep 2021 06:04:08 -0700 (PDT)
Received: from [192.168.127.34] ([185.81.136.19])
 by smtp.gmail.com with ESMTPSA id g13sm1320475edr.76.2021.09.04.06.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 06:04:07 -0700 (PDT)
Subject: Re: [PATCH v4 07/21] target/loongarch: Add fixed point load/store
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-8-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64dfcb77-e6d4-f9d9-078d-e5ad03f60195@linaro.org>
Date: Sat, 4 Sep 2021 15:03:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-8-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:40 PM, Song Gao wrote:
> +static bool gen_load(DisasContext *ctx, arg_fmt_rdrjsi12 *a,
> +                     DisasExtend dst_ext, MemOp mop)
> +{
> +    ctx->dst_ext = dst_ext;
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv temp = NULL;
> +
> +    if (a->si12) {
> +        temp = tcg_temp_new();
> +        tcg_gen_addi_tl(temp, addr, a->si12);
> +        addr = temp;
> +    }
> +
> +    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
> +
> +    if (ctx->dst_ext) {
> +        gen_set_gpr(ctx, a->rd, dest);
> +    }

You shouldn't ever need dst_ext for loads, since mop can control the extension.

> +static bool gen_loadx(DisasContext *ctx, arg_fmt_rdrjrk *a,
> +                      DisasExtend dst_ext, MemOp mop)

Likewise.

> +static bool gen_load_le(DisasContext *ctx, arg_fmt_rdrjrk *a,
> +                        DisasExtend dst_ext, MemOp mop)

Etc.

> +TRANS(ld_b, gen_load, EXT_SIGN, MO_SB)
> +TRANS(ld_h, gen_load, EXT_SIGN, MO_TESW)
> +TRANS(ld_w, gen_load, EXT_SIGN, MO_TESL)
...
> +TRANS(ld_bu, gen_load, EXT_ZERO, MO_UB)
> +TRANS(ld_hu, gen_load, EXT_ZERO, MO_TEUW)
> +TRANS(ld_wu, gen_load, EXT_ZERO, MO_TEUL)

Note that dst_ext is already matching the sign of mop.


r~

