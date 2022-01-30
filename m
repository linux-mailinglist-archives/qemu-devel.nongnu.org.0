Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAD94A3999
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 21:58:55 +0100 (CET)
Received: from localhost ([::1]:43608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEHHi-0007Fp-De
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 15:58:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHFh-0004WX-Dm
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 15:56:49 -0500
Received: from [2607:f8b0:4864:20::102e] (port=45856
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHFe-0004YM-9K
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 15:56:48 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso2511751pjm.4
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 12:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ewa2QfZ9P5Mkz+fZKrV9sjMpH7ikuXC4XmUz4U45Pps=;
 b=F6wr1jn5xTmb+YpVMycJVbXsEGGpw0qKLqB5dRsqS/3+vbFakrwmCCcrc6hC+XAbDl
 N9zqpX9T84BDa0YjIZgBDp9kLF5F/9bk9DBvmJ2oMw0wkiPqkd6mtpgOgANNrO6NHgAd
 6vNgOH0dzmn0+7MW19nC8MO8bfqTMtqWtRg2jM17sCZnfHOC4ixOTfHDxXSs3SAnqap9
 QdKHjquyUxIbqHzKyaLepej/qu9c51EK/vUTLPZQ1tNNlshBZMT1x74iqLEMhlkoDDHN
 FxRtOjQ6HCqfxOT3VKvG5tTaRBlDpU8QG6dTwIml8yO39pjIT0GvzB73Pu8IR4cN0C00
 eGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ewa2QfZ9P5Mkz+fZKrV9sjMpH7ikuXC4XmUz4U45Pps=;
 b=v5bZyiyLlVmeRXPQq3RGK/SoOnzhKpq/Ikm5TuUiLmtV9CG5FAZVYQxSz+CGtINLrl
 vrtIUc5EipY2PBvCkoA5aL6C3JDgWOhmftEqjYhWUJPzyH6cJxqT0htatlc0E0cIExyv
 wJSylkRQkAhAvqsJvcn14R0dnO5JRRMli7bMgXVWip9L88s/G4S5Jo/NXdP11+vPsqn7
 G5gZ9oLH2dKnugpYoglTNLTjnDXDdt4DVl66dILJJWJDaElthEZv+wpwHrOEFGtRHipx
 36SoacKlutH2bEesYuCGkmx/xMvNZzOEykWI638gMloF2QfWLXugrteJcpc2NT82F5qJ
 olmA==
X-Gm-Message-State: AOAM533JJgAR1RcjpSvw1aYo6fjQ1FHQSFrA6vDjYMMhZQEl7X6jDmDA
 JFJmQntYAhyTx+2iEiAtHVpq+Ey/NUi6zE2G
X-Google-Smtp-Source: ABdhPJw95zRsWJlUMFIH2N7VYeJcMX8rPFAZMS29HKIyvqZLIVHr089QwDe+pUdqOIdoSTEB6pDa2g==
X-Received: by 2002:a17:90b:390a:: with SMTP id
 ob10mr30879276pjb.92.1643576169003; 
 Sun, 30 Jan 2022 12:56:09 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id s37sm11685842pfg.144.2022.01.30.12.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 12:56:08 -0800 (PST)
Message-ID: <05cb37ff-3c82-9847-f4b7-f9c2f2894a92@linaro.org>
Date: Mon, 31 Jan 2022 07:56:03 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/7] target/riscv: iterate over a table of decoders
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
 <20220128145642.1305416-6-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220128145642.1305416-6-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/22 01:56, Philipp Tomsich wrote:
> -            if (!decode_insn16(ctx, opcode)) {
> -                gen_exception_illegal(ctx);
> -            }
> +            if (decode_insn16(ctx, opcode))
> +                return;
...
> -        if (!decode_insn32(ctx, opcode32)) {
> -            gen_exception_illegal(ctx);
> +
> +        for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
> +            if (!decoders[i].guard_func(ctx))
> +                continue;
> +
> +            if (decoders[i].decode_func(ctx, opcode32))
> +                return;

Missing braces, per style.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

