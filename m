Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A08265118B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:12:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7KbX-0003M3-Th; Mon, 19 Dec 2022 13:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7KbV-0003Lc-TF
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:11:09 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7KbU-0005ns-BQ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:11:09 -0500
Received: by mail-pl1-x632.google.com with SMTP id 17so9872983pll.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 10:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ck+zoytS0vv4I0E1r0qdFZSxWNLmJKsTWrz6YBMNUZo=;
 b=jqsm6SgS8GEI8K1yBcWmgVC9PziIbZ4N5bA0rhf1jWsICovoVhhGM7pWo6fyu7eK8M
 o+6KzywrbFo5UDMxni13jqj+WOV1qcps9R3wJp6Q5cuQWoprZUKVXKxym9qIIkpxIoPs
 XpvawgpAP+GH4nE6y2sZMvjw3eL2qByZPzcXaXXKtXXauhoHyLvpGQ+mgY5mOowX5hPw
 jT31978Sqr++dkQyVmBz0uUZ9tji6JjQch2JAL7QRBxBs3pU4Cq/8SWqg9rifudAOp/S
 hX/CaeG9SHmBUh/iozPFoMTbU7fWH5wUnYRZF5PZLP9sU2HI3qIb28N+a0V920oSEnj7
 MAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ck+zoytS0vv4I0E1r0qdFZSxWNLmJKsTWrz6YBMNUZo=;
 b=5uilwBlBpS3EVC3SqOw6PlTcMFA+HBzHCU65oT/3vShdplzeKbktrg227pC9QuF6PQ
 NuC6dR/+F7mog1zgiH4JlC71ev3pO+F/FHoiWOTdfMHEzU0HFENrI/pLN8R7IjRD/3Ar
 2r0Ate3fV2vwuGU1C5vQB9m8qYh6ukkxflHbF5s9Osd3n+7jLYlZIFu4N/+7rnR2m0Yx
 Lj7ZC+fT1nqdKqpYkVb1SPiE0W9HABF6UdiApGo87cpL5v5K13sSD27hCgDbjRuJwaa9
 jikBdViTd6dzRYi/WPfjui0b6lAxM7OIK8gJ6FT/iPbPzyEgzrdQ5UbUWOG7DPulSaKR
 dS2A==
X-Gm-Message-State: ANoB5pkOBTQXVNNxG06miFMt+GJ7+11fNBx0Ay0xPu+pPzbuR7hFF1p4
 golJ33zhwT3UlzKbxUzf8gIFcA==
X-Google-Smtp-Source: AA0mqf6dYvO7i9p4WWB38s5d7kZzChhHi5Y1/kjAQkXcGHqMyUXxN/N9n9CvI0cXHikDrghbr88BVw==
X-Received: by 2002:a17:902:b708:b0:189:9dca:65e1 with SMTP id
 d8-20020a170902b70800b001899dca65e1mr41812652pls.21.1671473465982; 
 Mon, 19 Dec 2022 10:11:05 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a170902e84600b001871acf245csm7485570plg.37.2022.12.19.10.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 10:11:05 -0800 (PST)
Message-ID: <a95f71d0-3212-0361-874a-b6d1b293e2dd@linaro.org>
Date: Mon, 19 Dec 2022 10:11:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/i386/gdbstub: Fix a bug about order of FPU stack
 in 'g' packets.
Content-Language: en-US
To: TaiseiIto <taisei1212@outlook.jp>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
 <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/18/22 20:04, TaiseiIto wrote:
> Before this commit, when GDB attached an OS working on QEMU, order of FPU
> stack registers printed by GDB command 'info float' was wrong. There was a
> bug causing the problem in 'g' packets sent by QEMU to GDB. The packets have
> values of registers of machine emulated by QEMU containing FPU stack
> registers. There are 2 ways to specify a x87 FPU stack register. The first
> is specifying by absolute indexed register names (R0, ..., R7). The second
> is specifying by stack top relative indexed register names (ST0, ..., ST7).
> Values of the FPU stack registers should be located in 'g' packet and be
> ordered by the relative index. But QEMU had located these registers ordered
> by the absolute index. After this commit, when QEMU reads registers to make
> a 'g' packet, QEMU specifies FPU stack registers by the relative index.
> Then, the registers are ordered correctly in the packet. As a result, GDB,
> the packet receiver, can print FPU stack registers in the correct order.
> 
> Signed-off-by: TaiseiIto <taisei1212@outlook.jp>
> ---
>   target/i386/gdbstub.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
> index c3a2cf6f28..6109ad166d 100644
> --- a/target/i386/gdbstub.c
> +++ b/target/i386/gdbstub.c
> @@ -121,7 +121,9 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>               return gdb_get_reg32(mem_buf, env->regs[gpr_map32[n]]);
>           }
>       } else if (n >= IDX_FP_REGS && n < IDX_FP_REGS + 8) {
> -        floatx80 *fp = (floatx80 *) &env->fpregs[n - IDX_FP_REGS];
> +        int st_index = n - IDX_FP_REGS;
> +        int r_index = (st_index + env->fpstt) % 8;
> +        floatx80 *fp = &env->fpregs[r_index].d;
>           int len = gdb_get_reg64(mem_buf, cpu_to_le64(fp->low));
>           len += gdb_get_reg16(mem_buf, cpu_to_le16(fp->high));
>           return len;


