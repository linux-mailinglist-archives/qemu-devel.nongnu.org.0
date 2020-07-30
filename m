Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A422334C8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 16:52:16 +0200 (CEST)
Received: from localhost ([::1]:39678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k19uo-0001H2-6v
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 10:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k19tQ-0008Rn-25
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 10:50:48 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k19tN-0001Q0-5i
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 10:50:47 -0400
Received: by mail-pj1-x102d.google.com with SMTP id mt12so4402075pjb.4
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HY/RzSHyQvwyWF/W//ebYNIPd1zGtRDEdOWAmCIIwkA=;
 b=VfP8HJCx1/chqGqr0rbiMbsIEQxWoZl61U5rUSUFjxWsK6x8wZfvU9fqciBqIdaNVe
 miVsjTTI7Y6azZFNG60/v5O0T8t4eFJ2E9pzcBr+5QdVGXE5Lh7IJtY77B+PjP0w8XfV
 f1z8vMtJCxMgtLq/Xzv0Swd/BhxVvWVf2r9nfZBq6wEkIxeG2nxUnoaKNwsL315iZDMB
 cjG97NM+C2Jj5H5BO48PyKdYPNDeIonoCUSzGSxcvhyQHLfBqo+E29uSmKxx1NDKu6uk
 ufkgdaDZEoa64KystAX4yTUgBb4pnSzn/tY2FafFGFbE58UgO6xaohT8XSPkAZUYfvCy
 tTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HY/RzSHyQvwyWF/W//ebYNIPd1zGtRDEdOWAmCIIwkA=;
 b=B6+Hw7KuPk/KSxawjFZ0NSjk465XEtYKfN9IZmTf+pHTMHsS4wN4Vh+0GGMsBnuJvP
 LVaQgtdARgp4XgwrnSwckxMbwx25tBMHo6aDe7B2DttLjgFEIZ7EBHc7JKpdEZPkvYml
 qdMjWys1E5g034h2In9H1eNzgmoBCpOuCT54xo3ZoN/KMcI2QX3zb2I4jth9nKBz1Ooe
 odztfe5aI0wzdKE6hibCr3itMcfyvjbF267JPgbHlaqdxrPpdKyv4FtDfeGCZmRDWV18
 yp68gFI0mbrjEDLQOuD+q/hRav3zEjw2h8dO+fpAJIBWniGLXnUMUYnJItiiFVPzBmUn
 YGSA==
X-Gm-Message-State: AOAM530t5IgXajsepux/+bnSEu1kew5hK5xjRNBgsOBy2ldJN0xiHXB5
 ferNZN7k8NvZDhk33J9x6SYH8w==
X-Google-Smtp-Source: ABdhPJyZ778w6ILenejAQbdbsDkIfO45nlA2lLrWnPREXNnSOiSEJ6xjj5TP+9k433IF6Qf/J4kZwQ==
X-Received: by 2002:aa7:9357:: with SMTP id 23mr3688671pfn.278.1596120643525; 
 Thu, 30 Jul 2020 07:50:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id r1sm3102696pgi.28.2020.07.30.07.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 07:50:42 -0700 (PDT)
Subject: Re: [RFC v2 39/76] target/riscv: rvv-0.9: integer scalar move
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-40-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d61baa86-3852-6ec3-bcfc-25449eb43746@linaro.org>
Date: Thu, 30 Jul 2020 07:50:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-40-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> +/* vmv.x.s rd, vs2 # x[rd] = vs2[0] */
> +static bool trans_vmv_x_s(DisasContext *s, arg_vmv_x_s *a)
> +{
> +    if (require_rvv(s) &&
> +        vext_check_isa_ill(s)) {
> +        TCGv_i64 t1;
> +        TCGv dest;
> +
> +        t1 = tcg_temp_new_i64();
> +        dest = tcg_temp_new();
> +        /*
> +         * load vreg and sign-extend to 64 bits,
> +         * then truncate to XLEN bits before storing to gpr.
> +         */
> +        vec_element_loadi(s, t1, a->rs2, 0, true);
> +        tcg_gen_trunc_i64_tl(dest, t1);
> +        gen_set_gpr(a->rd, dest);
> +        tcg_temp_free_i64(t1);
> +        tcg_temp_free(dest);
> +        mark_vs_dirty(s);

No need to mark the vector set dirty, since we're modifying general regs.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

