Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497DC413115
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:01:52 +0200 (CEST)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mScb0-0005P5-Ku
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mScYN-0004ZQ-Kh
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:59:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mScYB-0000Bm-OL
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:59:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u15so37383928wru.6
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:in-reply-to
 :content-transfer-encoding;
 bh=qMG1bH17NFU+npwPtxmYM7dmzo/tk0FnbIfTJPyDz30=;
 b=ENtOsnUB69eyIJRry9cwQCpz4lmfU1fCJWZI71r+g2+9cRbQRFHUosc3yBipg2ozlZ
 KB38/7r67EYqWCPCzIH+DYFr91FL5DTwwv5ge02+7qdAUvpUU+Cp1sVh3eYQkF4/WE06
 HqOXd8ODK4+ZupogMZJIrwgaG8D4jcHvt1U2/+ldo6NMIRm5fZAg0/kXfV470AUXy8DN
 C5Y4Zido0yykrmECLPU806lqd8u62+GT6F8k9yrURfcRWGFqOqgj4nBGEJ4dv0OMkIe4
 lYTQ3vHZ2STTlLia0M5exRUD+wbEgxjKittmwk5wQ89wcxwkRg7/wUftSWJTHKr3M2oF
 7zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:cc:in-reply-to
 :content-transfer-encoding;
 bh=qMG1bH17NFU+npwPtxmYM7dmzo/tk0FnbIfTJPyDz30=;
 b=5om29joyPG2/Ijk8Egu/CCly1L0XuhSdOlisvPpTlkhQqxVMRjlNr/xmDN3odpJCMl
 jqpwG1BYICe1Ilzz1pCivAkNCHREmDKekMoH8JUQAm/pm5xWbLPRBnsSSmk4/SB0jGdV
 Lmx3ipfBZcIwrbF0XBueJFcCZ0aolYxQsyesNciJD0QavZl3I7RbGJdwuOqnLGycPuFA
 ijA4ld1jF5+gAFHGI/IsDNE9N+MqlYizgmCnce9clESQhriPIkh/L5I1MfumvA/r3K7P
 CG9ztXo8q3DvB38KC2H9nWG6Ej/6m6q033jULjjByJZF57AnaFxlLqiZ3EX+gqB+FgH+
 gv5Q==
X-Gm-Message-State: AOAM533BODp1+52faNbda7e7jANXYYdBGxbb92K+mmcwdjjRqjMjio51
 9B3K9DEGWFzQhgRLwXARQM8=
X-Google-Smtp-Source: ABdhPJznif4ZIjdFmIF1c7AnMPYJNghiyt3evQ467aHUyzuON9xKJPMt1PWnAg3LLdnv6BcX/68u2Q==
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr3634919wmq.0.1632218332537; 
 Tue, 21 Sep 2021 02:58:52 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f19sm2323409wmf.11.2021.09.21.02.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 02:58:51 -0700 (PDT)
Message-ID: <37d8ad22-a440-83b1-6d2d-d851df96723b@amsat.org>
Date: Tue, 21 Sep 2021 11:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 04/30] tcg/loongarch: Add generated instruction opcodes
 and encoding helpers
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-5-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210920080451.408655-5-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 10:04, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>   tcg/loongarch/tcg-insn-defs.c.inc | 1080 +++++++++++++++++++++++++++++
>   1 file changed, 1080 insertions(+)
>   create mode 100644 tcg/loongarch/tcg-insn-defs.c.inc

> +static int32_t encode_dj_slots(LoongArchInsn opc, uint32_t d, uint32_t j)
> +{
Can we move the range check to the callee and avoid masking the values
in the caller?

        tcg_debug_assert(d < 0x20);
        tcg_debug_assert(j < 0x20);

> +    return opc | d | j << 5;
> +}
> +
> +static int32_t encode_djk_slots(LoongArchInsn opc, uint32_t d, uint32_t j,
> +                                uint32_t k) __attribute__((unused));
> +
> +static int32_t encode_djk_slots(LoongArchInsn opc, uint32_t d, uint32_t j,
> +                                uint32_t k)
> +{

        tcg_debug_assert(d < 0x20);
        tcg_debug_assert(j < 0x20);

> +    return opc | d | j << 5 | k << 10;
> +}
> +
> +static int32_t encode_djkm_slots(LoongArchInsn opc, uint32_t d, uint32_t j,
> +                                 uint32_t k, uint32_t m)
> +    __attribute__((unused));
> +
> +static int32_t encode_djkm_slots(LoongArchInsn opc, uint32_t d, uint32_t j,
> +                                 uint32_t k, uint32_t m)
> +{
> +    return opc | d | j << 5 | k << 10 | m << 16;
> +}
> +
> +static int32_t encode_dk_slots(LoongArchInsn opc, uint32_t d, uint32_t k)
> +    __attribute__((unused));
> +
> +static int32_t encode_dk_slots(LoongArchInsn opc, uint32_t d, uint32_t k)
> +{
> +    return opc | d | k << 10;
> +}
> +
> +static int32_t encode_dj_insn(LoongArchInsn opc, TCGReg d, TCGReg j)
> +    __attribute__((unused));
> +
> +static int32_t encode_dj_insn(LoongArchInsn opc, TCGReg d, TCGReg j)
> +{
> +    d &= 0x1f;
> +    j &= 0x1f;
> +    return encode_dj_slots(opc, d, j);
> +}
> +
> +static int32_t encode_djk_insn(LoongArchInsn opc, TCGReg d, TCGReg j, TCGReg k)
> +    __attribute__((unused));
> +
> +static int32_t encode_djk_insn(LoongArchInsn opc, TCGReg d, TCGReg j, TCGReg k)
> +{
> +    d &= 0x1f;
> +    j &= 0x1f;
^ moved to encode_djk_slots()

> +    k &= 0x1f;

        tcg_debug_assert(k < 0x20);

> +    return encode_djk_slots(opc, d, j, k);
> +}
> +
> +static int32_t encode_djsk12_insn(LoongArchInsn opc, TCGReg d, TCGReg j,
> +                                  int32_t sk12) __attribute__((unused));
> +
> +static int32_t encode_djsk12_insn(LoongArchInsn opc, TCGReg d, TCGReg j,
> +                                  int32_t sk12)
> +{
> +    d &= 0x1f;
> +    j &= 0x1f;

^ moved to encode_djk_slots()

> +    sk12 &= 0xfff;

        tcg_debug_assert(sk12 < 0x1000);

> +    return encode_djk_slots(opc, d, j, sk12);
> +}
> +
> +static int32_t encode_djsk16_insn(LoongArchInsn opc, TCGReg d, TCGReg j,
> +                                  int32_t sk16) __attribute__((unused));
> +
> +static int32_t encode_djsk16_insn(LoongArchInsn opc, TCGReg d, TCGReg j,
> +                                  int32_t sk16)
> +{
> +    d &= 0x1f;
> +    j &= 0x1f;

^ moved to encode_djk_slots()

> +    sk16 &= 0xffff;

        tcg_debug_assert(sk16 < 0x10000);

> +    return encode_djk_slots(opc, d, j, sk16);
> +}

etc...

