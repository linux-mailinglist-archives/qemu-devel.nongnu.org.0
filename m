Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EE1457C0E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 08:11:34 +0100 (CET)
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moKX7-0003zT-EG
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 02:11:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moKVu-0003El-NS
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 02:10:18 -0500
Received: from [2a00:1450:4864:20::42e] (port=44877
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moKVs-0008MO-VV
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 02:10:18 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n29so21979696wra.11
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 23:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1cK1KWkM/bxHs/+y9L6HpyODIo+svK7aE/kzjbOujIY=;
 b=HedlRi3/XPL9SshZ1T8+gZH16uIPC46U5WmeNW7Nh+qLc74nkmU7wcSICVn9X1FoC1
 TBL+C0Fx3pfi7sLKsxZ7n9t+EooYz9O8/2ELTWWuSpnw/+tkn9s9epKlTyB6N3bjcpjO
 Tk+AVhC5qvU5yBKkOSqjACRm9rF1qzTaqTZwy0GLCdMmHy6bylNY5YBEwRbK6opjVjpN
 nCv5euiMDDaLj8/SCr8hmjdnhfvZNp6MYFxRSTJIFSq4mI9pOV9vH86EY29jPJIQvRPb
 bPwXdpIAbtSftQDp/wGAoszOFXd3eqKyLXRTGQORYboLdKIjEH8xZ4FavmTxq277VI1V
 2Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1cK1KWkM/bxHs/+y9L6HpyODIo+svK7aE/kzjbOujIY=;
 b=UqIm588ovxB4BX1Oxbu1ykNVJf+Z6tlDaCAgvxSNRdFd3VE6ti91ZyinAJOapqKpgp
 2ERnt8f0j9eTVUcsiA/fneEliTba4UPScFDxFq3EN7OmbT4qWUqTqZxYbecWWjZRPova
 J1Dk9x6alkXcmLQzSAbKcQyrOKuOP9sQLfPIQQ0runA6nk44iorxBEKYLCWTMoeJyeox
 HOjqGpoErUAGUmrX521l2qlj5F5c6XKL4U7nH9vb4WZ/0OnZB1/NdhhQQL+JvLEW0jAc
 2AB3Vl5d17dMXSnHjpj6Qwtxzgb0VT7P8pRTlFf66Z6gbl8WQ7ocCbMjBnlEjMFBLOb8
 LmIw==
X-Gm-Message-State: AOAM532uoZQzVp6gOKvrCPj+u1PZmue6tPdBHHuZP/xrLff6E6/VbZfE
 UqeHb25mPqt/GmXI6emssE3cjg==
X-Google-Smtp-Source: ABdhPJzZuDYmtYPjGWLCFRTlfaUKjkg/GtiV4wiaBQIBpEaRfa3DyElIVzDe//3eUQXyHCUPGGq5TA==
X-Received: by 2002:adf:df0b:: with SMTP id y11mr14935079wrl.181.1637392215237; 
 Fri, 19 Nov 2021 23:10:15 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id c79sm1851686wme.43.2021.11.19.23.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 23:10:14 -0800 (PST)
Subject: Re: [PATCH v11 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-5-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7bfff86-44d5-0f1f-ba95-53177ccb6454@linaro.org>
Date: Sat, 20 Nov 2021 08:10:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-5-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +static void gen_mulh_w(TCGv dest, TCGv src1, TCGv src2)
> +{
> +    tcg_gen_mul_i64(dest, src1, src2);
> +    tcg_gen_sari_i64(dest, dest, 32);
> +}
> +
> +static void gen_mulh_wu(TCGv dest, TCGv src1, TCGv src2)
> +{
> +    tcg_gen_mul_i64(dest, src1, src2);
> +    tcg_gen_sari_i64(dest, dest, 32);
> +}

These two are the same; you only need one of them.  The difference between the two insns 
is in the EXT_{SIGN,ZERO} parameter that precedes these callbacks.

> +static void gen_alsl_w(TCGv dest, TCGv src1, TCGv src2,
> +                       TCGv temp, target_long sa)
> +{
> +    tcg_gen_shli_tl(temp, src1, sa);
> +    tcg_gen_add_tl(dest, temp, src2);
> +}
> +
> +static void gen_alsl_wu(TCGv dest, TCGv src1, TCGv src2,
> +                        TCGv temp, target_long sa)
> +{
> +    tcg_gen_shli_tl(temp, src1, sa);
> +    tcg_gen_add_tl(dest, temp, src2);
> +}
> +
> +static void gen_alsl_d(TCGv dest, TCGv src1, TCGv src2,
> +                       TCGv temp, target_long sa)
> +{
> +    tcg_gen_shli_tl(temp, src1, sa);
> +    tcg_gen_add_tl(dest, temp, src2);
> +}

Likewise, these are identical.


r~

