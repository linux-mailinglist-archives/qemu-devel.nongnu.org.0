Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2D503056
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 00:48:23 +0200 (CEST)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfUjm-0001IE-71
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 18:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfUiV-0000cD-Jo
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 18:47:03 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfUiT-0004Ro-T6
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 18:47:03 -0400
Received: by mail-pg1-x536.google.com with SMTP id k62so2751825pgd.2
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 15:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6YmohQLyzdOIbIR3JUx66asglwZFWXlsDniQP7G4Csc=;
 b=Cx7MmbbAGUJt14P8ipGx+44Zq7klHORSuUoRFSDy7ptkQ8OOt0E1/VQV6Q/edj+F3/
 79czPgPBDpLYSxI8cVLlNMD+bYjHOM4Mq6uwUiuSuMP2tYzqm7N6hu0gnuirP2EKDRmR
 9MpxyJP8ERrJ7r+rrgzlT8o54ZqlVcA92oJLVcOonS4kdcu9hmRkg+zhtIqX8mRDl8tA
 hd2D1W51vJezBSM/Gf6r+uIajoZQ07c/Rh/eUA6+oaSJW5qJv+HvZmlLwHrhtZ3fLpYv
 cGINjzbMP4mnIeqQCw/CCf1MYQhpIuRIIlzuclS/Afdy2581OzLVoyCl4WT6VKtkH79n
 zjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6YmohQLyzdOIbIR3JUx66asglwZFWXlsDniQP7G4Csc=;
 b=nswv0BUf4AedsqwyXvejkyC44g3WWMkSWtKBnsv9XhISNOcETxXbddVXwCdFA/Ml3N
 5N3xHlS3LLhpq/wtRkOws8KAt/aYKLf76jrL0V7Fu3Vsx4YwLA0RzPtWWgi+4StE63NR
 pXYu84RCq4bYZmSNDoO4co41cf40+y/BWMTJWSSLNXeWMbphjzHC78LdWnRxTco9dKRg
 lIUswHWuBd2XhmR8pnGKj+wXz4YG2qdTBA0CF2QZ3rLAszuNc1kPyHlFshdvPekJThuz
 onHe/ZPMzSDDZnwAoWNXzXE2k2RO3JbM3wcBOcl921OnDKikV5t7nL3H3Y1dYCmQ3QBu
 QVoQ==
X-Gm-Message-State: AOAM530KavMLSLVpPNSSE39tZIPqZSGaDxB/6bvbotZeU7SWUnkZffMk
 ZO9Xfve4v56iIs1wZVB25YcZGA==
X-Google-Smtp-Source: ABdhPJzx/4F0Rj4c3b4Jf3Aed8H5zlOIFsoFSRRmyZoL7Ow3KsYnt234k53PcewYIe2K/vFu/4XiTg==
X-Received: by 2002:aa7:920d:0:b0:505:c9d4:5819 with SMTP id
 13-20020aa7920d000000b00505c9d45819mr1215469pfo.15.1650062819925; 
 Fri, 15 Apr 2022 15:46:59 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm4002938pfw.188.2022.04.15.15.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 15:46:58 -0700 (PDT)
Message-ID: <73dc7f7c-81c2-181e-7e45-76f87eb75ae9@linaro.org>
Date: Fri, 15 Apr 2022 15:46:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 08/43] target/loongarch: Add fixed point atomic
 instruction translation
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-9-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-9-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +static bool gen_ll(DisasContext *ctx, arg_rr_i *a,
> +                   void (*func)(TCGv, TCGv, int))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv t0 = tcg_temp_new();
> +
> +    tcg_gen_addi_tl(t0, src1, a->imm);
> +    func(dest, t0, ctx->mem_idx);
> +    tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, lladdr));
> +    tcg_gen_st_tl(dest, cpu_env, offsetof(CPULoongArchState, llval));
> +    gen_set_gpr(a->rd, dest, EXT_NONE);
> +    tcg_temp_free(t0);
> +
> +    return true;
> +}
> +
> +static bool gen_sc(DisasContext *ctx, arg_rr_i *a, MemOp mop)
...
> +TRANS(ll_w, gen_ll, tcg_gen_qemu_ld32s)
> +TRANS(sc_w, gen_sc, MO_TESL)
> +TRANS(ll_d, gen_ll, tcg_gen_qemu_ld64)
> +TRANS(sc_d, gen_sc, MO_TEUQ)

You should use MemOp for gen_ll as well.
The function would always be tcg_gen_qemu_ld_i64.


r~

