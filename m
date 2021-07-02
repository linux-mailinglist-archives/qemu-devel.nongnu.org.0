Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D763F3B9DC4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 10:52:46 +0200 (CEST)
Received: from localhost ([::1]:39364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzEuj-00042x-Ep
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 04:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzEth-00035b-He
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 04:51:41 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzEtg-0008Qm-1N
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 04:51:41 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso5861000wmj.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ix7qV0vGpO93MNHRTfv4LURmm0q0bLRkAZfn0AqTYmo=;
 b=amKHH6Dplq3jCbIl8qSmjssDgYa7EoG/gNRnrTtsfdCy1cd40eEZXCrGG7BELC0539
 +lLxel0oOV/oGU5Uy2ePAmWnjZ+ggYUGTmPh8RUVrQq1G+RUYFyeUGMrEDRxoxgZ7mPu
 LykyqdbLsbDRDFc3xQYr/50UN7hgksWEuuR1Umj6dc/va6aMQgLY2RiKHtuHdLJcOQn1
 HIRElv4Ov5+a69bZmseK/AGYxwxakAIRYIUB59kZQaI1tFHYpf2zvuaYZtWqT1o0Z83r
 +ZlJQ2CUAmSAOaoEkzCVxHe1KULpKplSRoBog40mrMxOOCzptKJw4ISep2gUeRqhjB9p
 Yulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ix7qV0vGpO93MNHRTfv4LURmm0q0bLRkAZfn0AqTYmo=;
 b=pCRUO+kCfRIpDph6bedAIHw0mJ7J1k4MTEm+Zs5vhIZVDzYNIEMh1Iv9xdCrBW9ZmW
 L82NFNsfZd3MqPnjBLmV8KsTVbcAxedoZg6htpL/WMbIfwvLa9+FMASvjEAZLdq71GBW
 3BRyij3Qc3RNmAfVn+QlBzEAAsJf1k3kTcc2k50HnU/v9oiMFCy4GA8AK7R1ucbshBjG
 zxB+tluOmBLIze5BO2vYm4kbzIHM0ZJMJpECaFc7KApaMLwJw1R16BZQDdi142/Dtrx2
 /yDQXqVV2ySedRdAPY2J+2L/9nY3KnUw6WbtOnxOkd31C75nD/yjmgjS/EZQQTC676Il
 cG5g==
X-Gm-Message-State: AOAM532HED+xqwACbNYEv8PHWvrklx3nvhOusoeNBhdRiJ7vk0CIf2Be
 LAFf/iWBZlo1WfxSZxcAC6M=
X-Google-Smtp-Source: ABdhPJzrBK8lVfh3wi49WxseTlAaYQegNVWQ9+uc3zVhkMAmdpXeUbHmQqHXt+uqoCZ/wDsgHS0PLg==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr4042399wmj.19.1625215898019; 
 Fri, 02 Jul 2021 01:51:38 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id r6sm2251902wmq.37.2021.07.02.01.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 01:51:37 -0700 (PDT)
Subject: Re: [PATCH 07/20] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-8-git-send-email-gaosong@loongson.cn>
 <248d54fc-ebdd-09e9-22c2-e66307b22705@amsat.org>
 <fcc6a9cd-2fa9-d976-3326-bda0efedea5f@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2912e517-dba0-04f8-80e2-edc0a9b1a27d@amsat.org>
Date: Fri, 2 Jul 2021 10:51:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fcc6a9cd-2fa9-d976-3326-bda0efedea5f@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, maobibo@loongson.cn, laurent@vivier.eu,
 alistair.francis@wdc.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 10:15 AM, Song Gao wrote:
> On 07/02/2021 04:31 AM, Philippe Mathieu-Daudé wrote:
>> On 6/28/21 2:04 PM, Song Gao wrote:
>>> This patch implement fixed point arithemtic instruction translation.
>>>
>>> This includes:
>>> - ADD.{W/D}, SUB.{W/D}
>>> - ADDI.{W/D}, ADDU16ID
>>> - ALSL.{W[U]/D}
>>> - LU12I.W, LU32I.D LU52I.D
>>> - SLT[U], SLT[U]I
>>> - PCADDI, PCADDU12I, PCADDU18I, PCALAU12I
>>> - AND, OR, NOR, XOR, ANDN, ORN
>>> - MUL.{W/D}, MULH.{W[U]/D[U]}
>>> - MULW.D.W[U]
>>> - DIV.{W[U]/D[U]}, MOD.{W[U]/D[U]}
>>> - ANDI, ORI, XORI
>>>
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> ---
>>>  target/loongarch/insns.decode |  89 ++++++++
>>>  target/loongarch/instmap.h    |  53 +++++
>>>  target/loongarch/trans.inc.c  | 367 +++++++++++++++++++++++++++++++++
>>>  target/loongarch/translate.c  | 458 ++++++++++++++++++++++++++++++++++++++++++
>>>  4 files changed, 967 insertions(+)
>>>  create mode 100644 target/loongarch/insns.decode
>>>  create mode 100644 target/loongarch/instmap.h
>>>  create mode 100644 target/loongarch/trans.inc.c

>> It seems you are missing what decodetree is for... You should inline
>> each opcode code from gen_loongarch_muldiv in the opcode handler.
>>
>> Don't take MIPS as an example =)
>>
> Hi, Philippe,
> 
> I‘m not sure I understand right.  Here is an example of my modification
> 
>     static bool trans_xxx(DisasContext *ctx, arg_mul_w *a)
>     {
>         gen_loongarch_muldiv(ctx, a->rd, a->rj, a->rk);
>         return true;
>     }
>     ...
> 
>     static void gen_loongarch_muldiv(DisasContext *ctx, int rd,
>                                      int rj, int rk)
>     {
>         TCGv t0, t1;
> 
>         if (rd == 0) {
>             /* Treat as NOP. */
>             return;
>         }
> 
>         t0 = tcg_temp_new();
>         t1 = tcg_temp_new();
> 
>         gen_load_gpr(t0, rj);
>         gen_load_gpr(t1, rk);
> 
>         switch (ctx->opcode) {
>         case  xxx_opcode:
>              /* translate  xxx  */
>         ...
> 
>     }
> 
> Is that right？

No. With decode"tree" you only have to implement the
decode"leaves". No need to pass 'uin32_t opcode' and
use 'switch (ctx->opcode) ...'. Example for LA_OPC_MUL_D:

static bool trans_mul_d(DisasContext *ctx, int rd, int rj, int rk)
{
    TCGv t0, t1;

    check_loongarch_64(ctx);

    if (a->rd == 0) {
        /* Treat as NOP. */
        return true;
    }

    t0 = tcg_temp_new();
    t1 = tcg_temp_new();

    gen_load_gpr(t0, a->rj);
    gen_load_gpr(t1, a->rk);

    tcg_gen_mul_i64(cpu_gpr[a->rd], t0, t1);

    tcg_temp_free(t0);
    tcg_temp_free(t1);

    return true;
}

