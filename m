Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AD9415051
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:02:44 +0200 (CEST)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7Vz-0004gO-3Z
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT7BC-0001We-Se
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:41:15 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT7BB-0007W3-Fk
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:41:14 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t7so9642037wrw.13
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JZDyt9WDbc/wjZ/FNCkm+Gok2DGHDyedT9FRUhJ+eXE=;
 b=JsyA75nZlnhY9grUeFwI2H2+XK+FaqdF0bMWABbzu0ntpstia3XtjOp9IrFSWKJspM
 b70hdcIikpVCVmCDkz28Z2jOim1Jfv7L+3nVFc6mO8WzNPSKqyZ/4oto4DT3UzGgaZL6
 hb7ys/b0UnxeDIYvCLQed5tDw8Zs57eS91yPeV5rXE5chYx2k+2mLZZQ85uUEmDWT/7q
 AtmL3sfFB6t88VkY3ok3zYMRmkR3QZq/OEwEO7IOjr4d88yGSlDIjj6PPXSJMxrE1D6p
 jmxtx2NpRAygWQM8BC1Yn1DD5827trUr7+Lp1DHB1y4Qm2ZQFtUQfu7gLPK2NegtOiMH
 +GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JZDyt9WDbc/wjZ/FNCkm+Gok2DGHDyedT9FRUhJ+eXE=;
 b=uEjUHaOzLunG+GuKVc6uFTzx3aTAV7fQSsWfxttn1jfvxqm4ZZy/Q4N8j4xOWLgMTt
 EktI56yBwdMZXmRijyhzVvS52ziGeePbCE/9sVv7KIEjHWUoiTrkBrLY63VXrMy9O4Ao
 xULXO+LKqvKBtv9vAMZ36aaVIHZ67VJMjYBfcgv58M1GI2USxnfPdPWKWpW0zwLtgZXh
 ZIlSCXFosNz6htuH1YA7J8nrgRAz6+Hb1bzzo7ny4P4qxkz9lhfzaTqCCCeGE2Dq8SZA
 yrG7VAVS5/CgyRT/lmFBrAGqRm7uBgftn9NSfQDyVwVg4hP2c0lFqkfNgW0xkv6tEs65
 9X4A==
X-Gm-Message-State: AOAM531PXhj1H/9Z9Vz1XYxxu/yJmK3lVJChNMNpTki9e6fE71ZWZVyN
 vCGLhhGYS5N+dpXy12x0ds0N9YWj6eQ=
X-Google-Smtp-Source: ABdhPJxnMqokhOzHsrBCZV0duMvn0heCqxDNkewcBQWS3KmDM2y07BG0bCs/O/XA6wkKoDJE8Ts9mA==
X-Received: by 2002:a5d:4488:: with SMTP id j8mr571161wrq.260.1632336071999;
 Wed, 22 Sep 2021 11:41:11 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id q201sm8089020wme.2.2021.09.22.11.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 11:41:11 -0700 (PDT)
Message-ID: <5e1286b2-83c7-db59-a4db-02af7c7dbcd2@amsat.org>
Date: Wed, 22 Sep 2021 20:41:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 07/30] tcg/loongarch64: Implement necessary relocation
 operations
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-8-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922180927.666273-8-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 20:09, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 66 ++++++++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)

> +/* Field Sk16, shifted right by 2; suitable for conditional jumps */
> +#define R_LOONGARCH_BR_SK16     256
> +/* Field Sd10k16, shifted right by 2; suitable for B and BL */
> +#define R_LOONGARCH_BR_SD10K16  257
> +
> +static bool reloc_br_sk16(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
> +{
> +    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
> +    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
> +
> +    tcg_debug_assert((offset & 3) == 0);
> +    offset >>= 2;
> +    if (offset == sextreg(offset, 0, 16)) {
> +        *src_rw |= (offset << 10) & 0x3fffc00;

Alternatively easier to read:

            *src_rw = deposit64(*src_rw , 10, 16, offset);

> +        return true;
> +    }
> +
> +    return false;
> +}

