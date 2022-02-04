Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25FA4A93E4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 07:18:47 +0100 (CET)
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFrvi-00076v-Jt
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 01:18:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFrq6-0004oQ-SU
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 01:13:00 -0500
Received: from [2607:f8b0:4864:20::102d] (port=46056
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFrq4-0006ir-TK
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 01:12:58 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso5226288pjm.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 22:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CCLgnvsm7vD+bh9/4ieK7Z0/Ure24bZCsNxp2wndBWU=;
 b=my8R5tweNguO+kSXfLcoutGJj9QIo8DJkzoteKwiGwe3kfaozkVbywx2LFEX4gUCAj
 eKR3zF3S6KhRdmiMVffsBoRWN0s6zIluv4fbM0z9xcpZ8mA6H6bnBBodJUWVRqY4Dt5m
 EHZt+uV1ZUZ6hSUfoPf5ZA6u9r3NwDhwV41BJUlLGwTy/hPoMvUicHdHe3gWuiTys0sb
 4ScmOtgicZ9Al6iYrxTv+lmNh/VrVMXYpFZsmmVsXdPt/dRTP/ZN27qcUV5yD1QG83SJ
 mjy76w3cxeF//s6jv1+LPYFTm1Hcvit5Wndkfv4ICM6Q+MNjCtt/1moAigJWn0ToB7on
 Dcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CCLgnvsm7vD+bh9/4ieK7Z0/Ure24bZCsNxp2wndBWU=;
 b=dNRSaBvtvEOUFqsiw0GRo62BVSrisDksdE/Wa81zEI3cCIYHhBm9DeSZkn8JP46ozo
 OuYIwsYLY4SWNenHaa/XLeW0ggcYbkMgP/K7p75XG24GWFDA5u86BzZm+JSlRGMR/+3K
 aTaxay6V6sC5RqZEY7bkcwe4wE2tfZs29jkodJRQ7wHZDjL5du0lw0RnG11cw7vVpWyu
 PM0gJtYVzr0lIh05xavUUVpcCdq9i/idhZC5LxJZrgnPq2jqcZ7FoTkQ2MF5RL+fC0FZ
 7Ud4hdR7whs1OK5ryaw+IXPn4HaOimul0ib2YvjWblLPS4BOvPWknpuckBFcmKhnRsUb
 cVIg==
X-Gm-Message-State: AOAM531IHedPkAZ1DlzsaMZ98avn2k8hpGcuXi/k4nF5EQ3mZVxem19c
 wS8WOPT+FXLOLVRwUfZ87oE=
X-Google-Smtp-Source: ABdhPJzeKIjJT0oG/7ZtzBwr7J/UOKBMdbpozzCnFwIjIQjYJv0AODYCj9bp4N3rEubEzPJ2F84CaA==
X-Received: by 2002:a17:902:e552:: with SMTP id
 n18mr1520453plf.152.1643955166805; 
 Thu, 03 Feb 2022 22:12:46 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y13sm970379pfi.2.2022.02.03.22.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 22:12:46 -0800 (PST)
Message-ID: <4f4fff9f-bc6b-1474-527b-4c4611e560bb@amsat.org>
Date: Fri, 4 Feb 2022 07:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 1/2] tcg/mips: Support unaligned access for user-only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220201234107.316487-1-richard.henderson@linaro.org>
 <20220201234107.316487-2-richard.henderson@linaro.org>
In-Reply-To: <20220201234107.316487-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/2/22 00:41, Richard Henderson wrote:
> This is kinda sorta the opposite of the other tcg hosts, where
> we get (normal) alignment checks for free with host SIGBUS and
> need to add code to support unaligned accesses.
> 
> Fortunately, the ISA contains pairs of instructions that are
> used to implement unaligned memory accesses.  Use them.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.h     |   2 -
>   tcg/mips/tcg-target.c.inc | 334 +++++++++++++++++++++++++++++++++++++-
>   2 files changed, 328 insertions(+), 8 deletions(-)

> +static void __attribute__((unused))
> +tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
> +                                    TCGReg base, MemOp opc, bool is_64)

Unaligned style to honor the function name? ;)

> +static void __attribute__((unused))
> +tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
> +                                    TCGReg base, MemOp opc)

Ditto.

> +    case MO_64 | MO_BSWAP:
> +        if (TCG_TARGET_REG_BITS == 64) {
> +            tcg_out_bswap64(s, TCG_TMP3, lo);
> +            lo = TCG_TMP3;
> +        } else if (use_mips32r2_instructions) {
> +            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, MIPS_BE ? hi : lo);
> +            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, MIPS_BE ? lo : hi);
> +            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP0, TCG_TMP0, 16);
> +            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP1, TCG_TMP1, 16);
> +            hi = MIPS_BE ? TCG_TMP0 : TCG_TMP1;
> +            lo = MIPS_BE ? TCG_TMP1 : TCG_TMP0;
> +        } else {
> +            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi, 0);
> +            tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 0);
> +            tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 3);

I'd keep the parity with ld_unalign and use 0 + 0, 0 + 3, ...

> +            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
> +            tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 4);
> +            tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 7);

4 + 0, 4 + 3, ...

> +            break;
> +        }
> +        /* fall through */
> +    case MO_64:
> +        if (TCG_TARGET_REG_BITS == 64) {
> +            tcg_out_opc_imm(s, sd1, lo, base, 0);
> +            tcg_out_opc_imm(s, sd2, lo, base, 7);

Ditto, ...
> +        } else {
> +            tcg_out_opc_imm(s, sw1, MIPS_BE ? hi : lo, base, 0);
> +            tcg_out_opc_imm(s, sw2, MIPS_BE ? hi : lo, base, 3);
> +            tcg_out_opc_imm(s, sw1, MIPS_BE ? lo : hi, base, 4);
> +            tcg_out_opc_imm(s, sw2, MIPS_BE ? lo : hi, base, 7);

Ditto.

> +        }
> +        break;
> +
> +    default:
> +        tcg_abort();
> +    }
> +}

Beside the nitpicking comments, nothing to say, hardcore!
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


