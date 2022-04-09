Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22AE4FA954
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 17:41:26 +0200 (CEST)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndDDI-00050o-Gr
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 11:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDBl-0004Bf-2T
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 11:39:49 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDBj-0003Mr-7Q
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 11:39:48 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x16so10899955pfa.10
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XKuOgXtH+HZ5PmRGbBuiped8Xv5BMxxNWPpupFiNAkM=;
 b=HfYTDH8MZ3Wf7VPZim9bKWjZnZw1dEhNVVR6lq48iW7U/ewZdj7I+aNc4l5FgbTbXE
 EyIXWeqcee4EgP15hbJUB1GCJxDftFBBmnU/KFWLPLo7J9KLy7CqK2hfeGxHihFgTfjo
 YdpyAFSv8Jrlh+p/47HHyzJ9fc4kR8LuOzN0ZPIlxVfLPn/LGGl/7f0/B9W9j+O4akL9
 ZFg8dYOzR9Wm2uc0lCske/sssQll/lnZSlvAzto7XU7QmxlIVNliS7W9HzEXSKhCV7ph
 MDymk9rFB3b6TXVUbUEob2s4dePMkj8BJc0sX0BZrcxW2H8YpNHMWfVWu82nAU77q/6S
 8+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XKuOgXtH+HZ5PmRGbBuiped8Xv5BMxxNWPpupFiNAkM=;
 b=Q6V2Fht2NihCrh+6ZOQJp3bOwbJivsNXyWKhwQ9ttwcekkTW3/XypqkXvxu8Gz8bBD
 80w19FfkIwjg45deiistiKJsPziY1VccVYQcLdeYgI3M+ndyUB88lzQPIUSH+o85iH2o
 ACKa5tr3EJBwsDDmmLhedcd2Ns6k932hxXiTm0NRBYXslI2fKh/e4rOazYFPza01p0bu
 ttvMHYyoSeBjVqM0A0ARHw5hYZlKW/7v4vHeQDUrDioDvyMX97ljMVasQBxoDWwbGys7
 AkAiboWirXAknm2tTYXMqb6UPpjlJKEU/iAZ+xQeaDe5j4N8jQVmWhztVYqQX5n9sKNj
 ILaA==
X-Gm-Message-State: AOAM532VxY25mvIP0momQr++cO973nqDlXFPihw3/X4qo8JaKXl3t4Ji
 MO8Oj5soX5zR9r6ZCLK4/JAKQw==
X-Google-Smtp-Source: ABdhPJw2nNaefGtf9ULC6y4MC99Uo5vev4YK9pMwE630heyMrt5YsVC7L6esOIQbgBqi9coV/8VC4w==
X-Received: by 2002:a63:e201:0:b0:382:6afe:f0ec with SMTP id
 q1-20020a63e201000000b003826afef0ecmr19803487pgh.339.1649518785040; 
 Sat, 09 Apr 2022 08:39:45 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a638c0f000000b003827bfe1f5csm24719473pgd.7.2022.04.09.08.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 08:39:44 -0700 (PDT)
Message-ID: <16256d45-740c-c858-b5ce-3eb1e4b10565@linaro.org>
Date: Sat, 9 Apr 2022 08:39:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/riscv: replace TARGET_LONG_BITS in gdbstub
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20220409094612.1908512-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20220409094612.1908512-2-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220409094612.1908512-2-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/22 02:46, Frédéric Pétrot wrote:
> Now that we have misa xlen, use that in riscv gdbstub.c instead of the
> TARGET_LONG_BITS define, and use riscv_cpu_mxl_bits to provide the number of
> bits in a consistent way.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   target/riscv/gdbstub.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 9ed049c29e..1602f76d2b 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -305,7 +305,7 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>       CPURISCVState *env = &cpu->env;
>       GString *s = g_string_new(NULL);
>       riscv_csr_predicate_fn predicate;
> -    int bitsize = 16 << env->misa_mxl_max;
> +    int bitsize = riscv_cpu_mxl_bits(env);

This isn't correct, changing from using max to current mxl.

You might think this is ok, because this will run up in startup, but it really runs 
whenever gdb attaches to the stub.  Which could be anytime.


r~

