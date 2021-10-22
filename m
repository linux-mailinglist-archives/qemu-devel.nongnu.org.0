Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4652F4378E5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:17:43 +0200 (CEST)
Received: from localhost ([::1]:52200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvMc-0003b5-8n
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvD2-00083K-Q7
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:07:48 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvD0-0001ZX-Sg
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:07:48 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 193-20020a1c01ca000000b00327775075f7so3518364wmb.5
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qeoVWjtvSYsIJvsvMJqUhtTiuuxkNPM85YoK4VBmi5k=;
 b=I/Mlifqwjkn8KQScDJKyUXjhGuRb+PyXm28LL/VcekQt7F1InR6+nes8fWzKU4eSVM
 PgGwutX1EGm/dmDZqEpiBzwP+IFPUNI2os1xnXnE6nfsH2X4oVPRIKtUBY3uCju85vdl
 mYGw2OpDnkmp8CoD9B7lehwM0/YtfTclqM7GKVblduKFTIE1yA/zMBtaZNRqrxoAR0Gs
 HmjMn5eTp3oS0zwerQZuxfMbyyef+4q/hZxP9tfqUmirV/zAaASUXDK3vhBMuMyWj3rV
 pQEFSBYeQ23IdIqH58xP3gF6VMYOtHK1woKeoCFQ+EtbWVO0xsDOt4yLMBe0CY07s25t
 e2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qeoVWjtvSYsIJvsvMJqUhtTiuuxkNPM85YoK4VBmi5k=;
 b=MoAdwxvL0VPqn0x38NTdTDxgaM8M7NGbVpiCpvFlrsO6DAAG1WMlPB85kH/0rH/j0I
 z6zMxi/mZYVMlqF20oRTRUfKOWg1cGwGiDssX3KgkawntSI1QMZRfX0IAcpNqQf8qaS6
 RubOteXWAIDBuKUtIkCqj+qYBHeOtvzZhn0fj06X0IUXwXosdXJeAs5vZVVZ8RrF6REM
 q1gOgASHuT8lL3griDMfQvky8XwRYcqSyAO4/4EdobnrCUPqayEACdqICszkdCKVzGgq
 3vCx3DTFHJ22w4xnQspk8gWe7VRL5GRebch+cOUHL6Xt6VjXlIg4cwKa0A+pYcPG8e4E
 qKUg==
X-Gm-Message-State: AOAM533wziy080YMUB69DWYd4d5xdUdTQ6QUJQPelhpNynmemB2GpkaL
 Fp2hDvoEFo3Zn1z6S8sIN+c=
X-Google-Smtp-Source: ABdhPJw7xTjmT/4cJfHSYIu4gvYYmFnkE+9domqLlXG6sFpHWgpMvdbYV1ScJ9PoIkH6fjHGX3zAVw==
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr64728wmc.75.1634911665261;
 Fri, 22 Oct 2021 07:07:45 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id g2sm7871585wrq.62.2021.10.22.07.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 07:07:44 -0700 (PDT)
Message-ID: <2dfb25fb-6451-9e93-22ed-59c84988f945@amsat.org>
Date: Fri, 22 Oct 2021 16:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 23/48] tcg/optimize: Split out fold_extract2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)

> +static bool fold_extract2(OptContext *ctx, TCGOp *op)
> +{
> +    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
> +        uint64_t v1 = arg_info(op->args[1])->val;
> +        uint64_t v2 = arg_info(op->args[2])->val;
> +        int shr = op->args[3];
> +
> +        if (op->opc == INDEX_op_extract2_i64) {
> +            v1 >>= shr;
> +            v2 <<= 64 - shr;
> +        } else {
> +            v1 = (uint32_t)v1 >> shr;
> +            v2 = (int32_t)v2 << (32 - shr);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        }
> +        return tcg_opt_gen_movi(ctx, op, op->args[0], v1 | v2);
> +    }
> +    return false;
> +}

