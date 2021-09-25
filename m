Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A65418105
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:28:27 +0200 (CEST)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4uw-0007JQ-Nb
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4sV-0006Il-8P
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:25:55 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4sT-0004o4-CP
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:25:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w17so34977339wrv.10
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Uh33pkSUvNcJimVD0O9Bsn+RKOp5NgLHHsmOGOgtx5k=;
 b=ak8I3pTXEKm/LfVaM3XeJHGQ5FtrI5Vn6+lfqW1whn80nYODUHKa7jzYEm9GVGrCdv
 kYxxIb1/InJ7Ft7wH+TbgakB0HnrGeFKjt+CvhlsQV1HfoFqGOT5q66op+s3NDFXLaSr
 IwgQYiKUJTVzWk2xt6XvCjUEUYoZoQR191kn/ZdvLFn4E5dUxdq5sKOr9TPzuE/DlEDH
 4aLJ42+cFfGB+HpHGUm6l6fS5WnQLFG3STo69Mdv3D8nMqSSKeTUBB1m9PmkDKFHeAXH
 N/V2EqVHKos/Wkdn8hgbd92G16r+muC6qEKkNOweVIEuTUmoOd6jqIqrwVmua6yFJKjD
 5uSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Uh33pkSUvNcJimVD0O9Bsn+RKOp5NgLHHsmOGOgtx5k=;
 b=Fd4r0fWZMzSUnlzOyXZNgj6vDzsFgbNZ7fisEgbX6LoLP4+WJok0SpnQs2q4mVLFiE
 QOfe6D+Ifeiuc2fTgX5Kqtl+Wh+f0gk7cl91PV2tjl1vlgRy1bZcp1nBIzFTn5vZXCy0
 4YV2/3RZh3Hv/LMk5YMIToqYAj0SeqpSEx3/Rxr8DJdbW8dWuYczl2Dox2OFMMdtXP+U
 zcLkJ0PfW5wBbuhvkyEWUrhE35oZaXR9PqWJTEorlrCX6t5iudii15mMpEKyfMWQJhaJ
 jWnhLIebHip1o/ql0UuSK2ctwDap7Wx5c4UmSosudliY4wLB1FNpiC1HyLwJOUsdl5jN
 vsNw==
X-Gm-Message-State: AOAM530YFy9iMuGAGg8dwJ5Z/bPq6GvvsrJ/CIuBVL4qhUBIE2tOZ0ac
 p4nq4G2iZJnM5ZHffba7A74=
X-Google-Smtp-Source: ABdhPJwEaUHoyhXVa1221hfNNWfrFAzrQzoi+X5oVZ3+rXuy0J+aDfKqBWy0cbYpS9exwrKJbFJ24w==
X-Received: by 2002:adf:f94b:: with SMTP id q11mr5711782wrr.408.1632565550560; 
 Sat, 25 Sep 2021 03:25:50 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d8sm11471175wrv.80.2021.09.25.03.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:25:49 -0700 (PDT)
Message-ID: <b5efdefc-ef54-2da0-91df-815f920e465c@amsat.org>
Date: Sat, 25 Sep 2021 12:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 29/30] accel/tcg/user-exec: Implement CPU-specific
 signal handler for loongarch64 hosts
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-30-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-30-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.034,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 19:25, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/user-exec.c | 73 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 73 insertions(+)
> 
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 8fed542622..38d4ad8a7d 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -878,6 +878,79 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>       return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
>   }
>   
> +#elif defined(__loongarch64)
> +
> +int cpu_signal_handler(int host_signum, void *pinfo,
> +                       void *puc)
> +{
> +    siginfo_t *info = pinfo;
> +    ucontext_t *uc = puc;
> +    greg_t pc = uc->uc_mcontext.__pc;
> +    uint32_t insn = *(uint32_t *)pc;
> +    int is_write = 0;

Predating this patch, but is_write should be boolean.

Note this will clash with Richard signal rework:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04804.html

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +
> +    /* Detect store by reading the instruction at the program counter.  */
> +    switch ((insn >> 26) & 0b111111) {
> +    case 0b001000: /* {ll,sc}.[wd] */
> +        switch ((insn >> 24) & 0b11) {
> +        case 0b01: /* sc.w */
> +        case 0b11: /* sc.d */
> +            is_write = 1;
> +            break;
> +        }
> +        break;
> +    case 0b001001: /* {ld,st}ox4.[wd] ({ld,st}ptr.[wd]) */
> +        switch ((insn >> 24) & 0b11) {
> +        case 0b01: /* stox4.w (stptr.w) */
> +        case 0b11: /* stox4.d (stptr.d) */
> +            is_write = 1;
> +            break;
> +        }
> +        break;
> +    case 0b001010: /* {ld,st}.* family */
> +        switch ((insn >> 22) & 0b1111) {
> +        case 0b0100: /* st.b */
> +        case 0b0101: /* st.h */
> +        case 0b0110: /* st.w */
> +        case 0b0111: /* st.d */
> +        case 0b1101: /* fst.s */
> +        case 0b1111: /* fst.d */
> +            is_write = 1;
> +            break;
> +        }
> +        break;
> +    case 0b001110: /* indexed, atomic, bounds-checking memory operations */
> +        uint32_t sel = (insn >> 15) & 0b11111111111;
> +
> +        switch (sel) {
> +        case 0b00000100000: /* stx.b */
> +        case 0b00000101000: /* stx.h */
> +        case 0b00000110000: /* stx.w */
> +        case 0b00000111000: /* stx.d */
> +        case 0b00001110000: /* fstx.s */
> +        case 0b00001111000: /* fstx.d */
> +        case 0b00011101100: /* fstgt.s */
> +        case 0b00011101101: /* fstgt.d */
> +        case 0b00011101110: /* fstle.s */
> +        case 0b00011101111: /* fstle.d */
> +        case 0b00011111000: /* stgt.b */
> +        case 0b00011111001: /* stgt.h */
> +        case 0b00011111010: /* stgt.w */
> +        case 0b00011111011: /* stgt.d */
> +        case 0b00011111100: /* stle.b */
> +        case 0b00011111101: /* stle.h */
> +        case 0b00011111110: /* stle.w */
> +        case 0b00011111111: /* stle.d */
> +        case 0b00011000000 ... 0b00011100011: /* am* insns */
> +            is_write = 1;
> +            break;
> +        }
> +        break;
> +    }
> +
> +    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> +}
> +
>   #else
>   
>   #error host CPU specific signal handler needed
> 

