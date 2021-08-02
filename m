Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7119D3DDF8A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 20:47:32 +0200 (CEST)
Received: from localhost ([::1]:40588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAcyJ-0004mO-2n
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 14:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAcxK-00047q-JI
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:46:30 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAcxJ-0004jd-1f
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:46:30 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so234293pja.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 11:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MlMn+6ggw6/B5VYCMquBJNQSdjxb0yVQgMdpLbyqZjI=;
 b=V9/ZizgY3eGdWxZ8Q6J3LMuRJ/k+tOa5rO8cGyrahUwaJxqcnKDPINY93IAAKs4ZR8
 1sNI5aguGrs1OS6c/Vz1EnmO0kdxIP8Z1Tv6qwKO0T64HyoOdmU7TANxdUgmB2yfvBzl
 3oO8TqsStm3A98qvGOGDfJnyO+A7r3ZZmnw3JuRV80SQrJkwxZgwuxKv9nSufK1R/ggD
 dug1VXfwW8KiQrUcOpfjFSZA7ZB+3E1JvxI/I0XePvvyEzO/msCof6nBrVpkFMsaCt+6
 cD7+88X4HNl2KwhX+HjzL8O4EB6pF5NBV2z0HtiXSjvDLQD/83Ff0GI7M2WvgxN/QRih
 o9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MlMn+6ggw6/B5VYCMquBJNQSdjxb0yVQgMdpLbyqZjI=;
 b=EjeHEh639tjnGxEpL2x7v4CDZcRdoj2B6E7foTNIjia72tjf8+qE9Pw0JJVPIfcbN9
 1D9PibYnmRg0zowbfo4ktKgHEKsKTtPctxIUr83dO6D2ezv505WHW2KsIW+XkeBueDn3
 GoamGHf1A5M/AZ5jisZ2HJBdOpaV2a3dGg2uQ3Rm3FCIh9/ArfI/gJmtpfXCcxKvkN9x
 2MhFTd7cCp4NY1c2pByv9LmVcROizx7iWsGivpGElIiZk9ooggB8HHIq2eEKs8KANpXX
 pT16c5q/VOCGPPu8A+RJ0S+c2BbiLUIikUXjBljT+0i/dXvgfAPS+W2gdSQsVqV6KxK0
 vgYg==
X-Gm-Message-State: AOAM5331we+XAnuufOYYphrr+5jBfnmOTqhldqWpBkG9D4x0KUsesReW
 iUdTQ45hyMbfbvZFGLKEtxcIiw==
X-Google-Smtp-Source: ABdhPJzcnQgCDArSss5gXB8UnBGmuEqvL5SL1XMtI9WwWGy8aUTfXe94rUWGRmJMTks+dk6GRCqLjw==
X-Received: by 2002:a05:6a00:16d6:b029:32a:ffe9:76a with SMTP id
 l22-20020a056a0016d6b029032affe9076amr18319143pfc.60.1627929987143; 
 Mon, 02 Aug 2021 11:46:27 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id u27sm3567797pfg.83.2021.08.02.11.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 11:46:26 -0700 (PDT)
Subject: Re: [PATCH] target/i386: cmpxchg should not touch accumulator
To: yqwfh <amdeniulari@protonmail.com>, qemu-devel@nongnu.org
References: <20210731190507.9007-1-amdeniulari@protonmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b314b0e0-c76e-bcc7-72a2-494ef7ae7f03@linaro.org>
Date: Mon, 2 Aug 2021 08:46:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210731190507.9007-1-amdeniulari@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Daniele Ahmed <ahmeddan@amazon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/31/21 9:06 AM, yqwfh wrote:
> Signed-off-by: Daniele Ahmed <ahmeddan@amazon.com>
> ---
>   target/i386/tcg/translate.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index aacb605..41386dd 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -5366,7 +5366,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   gen_lea_modrm(env, s, modrm);
>                   tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
>                                             s->mem_index, ot | MO_LE);
> -                gen_op_mov_reg_v(s, ot, R_EAX, oldv);
>               } else {
>                   if (mod == 3) {
>                       rm = (modrm & 7) | REX_B(s);
> @@ -5381,15 +5380,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   /* store value = (old == cmp ? new : old);  */
>                   tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
>                   if (mod == 3) {
> -                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
>                       gen_op_mov_reg_v(s, ot, rm, newv);
> -                } else {
> -                    /* Perform an unconditional store cycle like physical cpu;
> -                       must be before changing accumulator to ensure
> -                       idempotency if the store faults and the instruction
> -                       is restarted */
> -                    gen_op_st_v(s, ot, newv, s->A0);
> -                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
>                   }

Obviously incorrect.  You can't *not* store to EAX.  You must conditionally store to EAX.


r~

