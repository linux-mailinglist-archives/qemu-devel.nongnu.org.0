Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA434378D9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:14:14 +0200 (CEST)
Received: from localhost ([::1]:45386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvJF-0007S9-3h
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvB2-0004zk-JL
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:05:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvAz-0000pa-Bz
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:05:44 -0400
Received: by mail-wr1-x432.google.com with SMTP id v17so910826wrv.9
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7oR9+ZU6pfUGDJ0BByXBWb8Ek32bGmv/O1NtimSyj+Y=;
 b=Cgg0gOTFGuFSGZMVg5iRdx/7MXSpc3H52EI7puQzvkafJWc0uxAuuC/EcdHHbfZlpU
 R6nb1hmzfBaZZKND+YD3qOl9sPepL7jtTday6QWEqJoJ4zLlrPMwkG8SF02MgHywxjxU
 UhYFxF2q/7CqmsBaV3SMqBY7ZEFu93EqfN9T+K2Ic+IvG/WFdM5l/OhrfOffI7t21Szz
 u8xgqJUkqTbjyNGSsGo5i1fZ/KumJH3S+tkkUK8y2743dvXuzxbkPGvEnqaX7NNjzvKO
 pI0uU8XVyFdbceYvBFKu7GuucVAGyKyw/oXcxLd/86E62bLsNUi5MMXjfy+NmZOzWP0F
 237w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7oR9+ZU6pfUGDJ0BByXBWb8Ek32bGmv/O1NtimSyj+Y=;
 b=BwsiUinq5RZvLH2r3P5pu5Zn8W7U02eSTanCrMtTLJ7t/pnC7NphwtoFqTgUIeLiyN
 NtPrUxOr58PIBCvU0on046dyGpRvAlTIDK17i2f8QxM2hw+c8gQ1Uv4/nl0QPU4A1Bhg
 prJzRkehWeOl1gOfz1DlYF0B++W1sBFTSkOTmRCLtwAIMKt9I0rFZm0nwXHxqHlhr870
 iSLPiHn0vPZZZSMCZ+KtRb+DJvlRe22nmI7/eeRYtj4wn+xLDe/u4e2j6iwGh5auWy7C
 NJpHfLNK1Di0CkwzRj0y/46DG1C2m94UyS1si+wlaOpWkUOSIP5rhGdmDxvHXb5mS6iB
 +gxQ==
X-Gm-Message-State: AOAM530zFD6d1l9X3XlTsItnzAEm5gSZ1FQryBDvr3w0NvX94xT6ldKn
 eS94z7JF3v4hPshOdpZ5kcY=
X-Google-Smtp-Source: ABdhPJyv55EBvlXK4GG4+YTQA4nEobWWooGr2IKxuJJTV/vETx4wh440KZWrJSM9YMKWSWXoKf0Gyg==
X-Received: by 2002:adf:aa87:: with SMTP id h7mr110461wrc.254.1634911538365;
 Fri, 22 Oct 2021 07:05:38 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id z18sm407582wro.4.2021.10.22.07.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 07:05:37 -0700 (PDT)
Message-ID: <cf30a9a7-aa69-b12b-ecc3-1c8ad9b259c0@amsat.org>
Date: Fri, 22 Oct 2021 16:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 22/48] tcg/optimize: Split out fold_movcond
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
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
>  tcg/optimize.c | 56 ++++++++++++++++++++++++++++----------------------
>  1 file changed, 31 insertions(+), 25 deletions(-)

> +static bool fold_movcond(OptContext *ctx, TCGOp *op)
> +{
> +    TCGOpcode opc = op->opc;
> +    TCGCond cond = op->args[5];
> +    int i = do_constant_folding_cond(opc, op->args[1], op->args[2], cond);
> +
> +    if (i >= 0) {
> +        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[4 - i]);
> +    }
> +
> +    if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
> +        uint64_t tv = arg_info(op->args[3])->val;
> +        uint64_t fv = arg_info(op->args[4])->val;
> +
> +        opc = (opc == INDEX_op_movcond_i32
> +               ? INDEX_op_setcond_i32 : INDEX_op_setcond_i64);
> +
> +        if (tv == 1 && fv == 0) {
> +            op->opc = opc;
> +            op->args[3] = cond;
> +        } else if (fv == 1 && tv == 0) {

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +            op->opc = opc;
> +            op->args[3] = tcg_invert_cond(cond);
> +        }
> +    }
> +    return false;
> +}

