Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AE53FC1A4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 05:41:18 +0200 (CEST)
Received: from localhost ([::1]:39472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKueD-0008SY-4l
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 23:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKuc0-0007gM-IZ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 23:39:00 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKubz-0007LQ-3C
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 23:39:00 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so959035pjc.3
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 20:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wCZg+2tAmazul8bREPYflmdiyuTenpiF98rvkBLIe3Y=;
 b=C8FYy2Fh2TEMCJjDJUXMHnmt4ceRSKhgitwEKMqHeaQTxA6DQOA8Id9t4fhEIjg9hx
 LRgbNLBmIm3Te7re9oHFV2exp048OKIfJzJcK19U8S2JKr+vTs9s/Tn9373xfNFiKGZ6
 BmJIdl6teyMfjGrZf79fqwCflF17gYioWoWWlpFi1E/yOgmFZ4IRIkYc9j5dmZSXsXTJ
 iC1wCwIweVVdwSulVyCCk43+NdSFB70XEBUfMEWWL70AAgxGW773gyYt4wKGrrjHE28K
 eCPdsNiwM9rhBpNGCyOsZyMEEmXvpYaZhoirxKG68WEWAuxlEHkS1gWmCRNqp8L5dY/z
 ZcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wCZg+2tAmazul8bREPYflmdiyuTenpiF98rvkBLIe3Y=;
 b=TjJ7pZ+o1KAwvvUwjD3gsGBEWd2qd9ytAZkeb/OCB3i4xrtV70H04o+oMDYXR/gOsK
 YZjjjpsYASFxUthe3/yzqkqyrWpUqfy4Sg4dxIsQDXAajcUdtm2ahq3HeYNATm6PVKhn
 x+qJ4mbAsSI49s6QAAZKIlGl11ct1lXt346l9gRe2dqKheySleKO6J8H3HrCg2VcMK1l
 Hq7RT79ec5nlayBB/6BOYBf5atzgEQRzdOeaKMoHCY4gdmWPTZrZ3kI+wWoYgmfzNJxZ
 Abu9CE9aHHZJsDcbAoEQlUIXvZ5jcuGdPSQDcU7b7uPvFEWf+zVoPftdl0J499AWV+cG
 5XRA==
X-Gm-Message-State: AOAM531T/RE2+jb5OLr55LCzYMsNMzMp2LbO57x0h+x0OJDo6u+b4B6H
 cMA8sveW+qCWmDlNDrOybtPjWA==
X-Google-Smtp-Source: ABdhPJyR419AFQAAawjfo6ynilrih0byN9aTsVMZhtXKNBa3irwTGBGuP0I5WTJ2MTlaLJW4S/5npg==
X-Received: by 2002:a17:90a:1a12:: with SMTP id
 18mr2632924pjk.113.1630381137412; 
 Mon, 30 Aug 2021 20:38:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id m13sm890753pjv.20.2021.08.30.20.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 20:38:57 -0700 (PDT)
Subject: Re: [PATCH 6/8] target/riscv: Support of compiler's 128-bit integer
 types
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-6-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <53dd633e-eca6-582e-70f9-1e42d436c8bd@linaro.org>
Date: Mon, 30 Aug 2021 20:38:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830171638.126325-6-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 10:16 AM, Frédéric Pétrot wrote:
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6528b4540e..4321b03b94 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -60,6 +60,19 @@
>   #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
>   /* To be used on misah, the upper part of misa */
>   #define RV128 ((target_ulong)3 << (TARGET_LONG_BITS - 2))
> +/*
> + * Defined to force the use of tcg 128-bit arithmetic
> + * if the compiler does not have a 128-bit built-in type
> + */
> +#define SOFT_128BIT
> +/*
> + * If available and not explicitly disabled,
> + * use compiler's 128-bit integers.
> + */
> +#if defined(__SIZEOF_INT128__) && !defined(SOFT_128BIT)
> +#define HARD_128BIT
> +#endif

This doesn't belong here.  CONFIG_INT128 is more correct.


r~

