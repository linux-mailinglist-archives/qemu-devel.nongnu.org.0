Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D85A420E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 06:55:31 +0200 (CEST)
Received: from localhost ([::1]:54334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSWo6-0006GQ-3V
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 00:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSWko-0004PP-Jr
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 00:52:06 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSWkm-00076G-V3
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 00:52:06 -0400
Received: by mail-pf1-x430.google.com with SMTP id 76so7098997pfy.3
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 21:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=0TD0F4Pie1oyLNG5YyOnYyPiedItOiETnU0KGexqasw=;
 b=OR7rNRBPwG8l30OqzqXKAN9Yr1MqglPoaXbdj3eE8IQk1cJCO6lxlSxHL2GwMEpF78
 eLE0cDyeUSRt1hCdZuZRaUZoj3rFR88QBYvs5wer0OFigg6rI+Blou1EwJoIjWG7XYrj
 oQ6JO5MlGTeUzTQnDqouGp6Jsrzcy16CR1gWTuaRYFd/fILcn2wqDRdtGEk5oYG0TUwT
 6qflzmO9BLsuSvqTvkvTiNzR7oUbjX05Ekda/rGfCWV+sJlH9rAX/3vi3k9RTXX3lCLB
 oAO5URncZ4vSR0eU0WWlnkI+HClEy1LqBE4VgP5O+lMSR7YKupcVSpdowejItjZqC16z
 A9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=0TD0F4Pie1oyLNG5YyOnYyPiedItOiETnU0KGexqasw=;
 b=X5l6BXgLqYxqkYNuyYMlLmerf+wUc0hAA2Hbdermq1PvWK0P6EHWmmASpiRUPyVFSB
 0CHrOCsdi0/bkEX/JLhCQah09Sm7Pq9EcMqsTcMzoD37iH2X+Pr0jgRrQnLp3UsAKgnH
 JNYJU6s41vHFqmorfH3PEAZWiw7LjgzaF3CO9Sig10AmZlwErAyjbRDCIjEigU/26vJK
 j3Hfz9fdEe+0dZqree9ootOTnLoPXzSwxhMzenHQ1Jnw8+Bh1k54pKVTjvg0u09stMdc
 QgBVvIOrpTnAvsprHuvpW8qJt8NsKG6QG3VKWuBWoZaLSazuoApsgvVYtF1XfTUzM2XL
 rS3Q==
X-Gm-Message-State: ACgBeo0Q5s7GS/uSfYPEpWuMD1sakidSGg+pGeY9I6nW8rLozD8E86ze
 UMIxDRcJPev9HfIYDvngEPKnjA==
X-Google-Smtp-Source: AA6agR5OZHFZmD8GkFPOMryxaKwzhBWW1gYIE2idwi9EUojgxneWy2ZkNbxwR704Qt5cSY9w5TQ05A==
X-Received: by 2002:a63:1202:0:b0:427:7f15:4711 with SMTP id
 h2-20020a631202000000b004277f154711mr12393973pgl.550.1661748723230; 
 Sun, 28 Aug 2022 21:52:03 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35?
 ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b001726ea1b716sm6308161plk.237.2022.08.28.21.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Aug 2022 21:52:02 -0700 (PDT)
Message-ID: <3b47931f-75c9-8723-27fa-5ec11ad13526@linaro.org>
Date: Sun, 28 Aug 2022 21:52:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 11/13] linux-user: Show timespec on strace for futex()
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <20220826141853.419564-1-deller@gmx.de>
 <20220826141853.419564-12-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826141853.419564-12-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/22 07:18, Helge Deller wrote:
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index bac47748bc..a90e719681 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -3713,11 +3713,19 @@ print_futex(CPUArchState *cpu_env, const struct syscallname *name,
>               abi_long arg0, abi_long arg1, abi_long arg2,
>               abi_long arg3, abi_long arg4, abi_long arg5)
>   {
> +#ifdef FUTEX_CMD_MASK
> +    abi_long op = arg1 & FUTEX_CMD_MASK;
> +#else
> +    abi_long op = arg1;
> +#endif

FUTEX_CMD_MASK is defined in syscall_def.h, so never undefined.

> +    if (op == FUTEX_WAIT || op == FUTEX_WAIT_BITSET)
> +        print_timespec(arg3, 0);
> +    else
> +        print_pointer(arg3, 0); /* struct timespec */

The else isn't quite correct -- the ops not listed, which actually use this parameter, 
treat it as uint32_t val2.  Anyway, make this a switch, because I've implemented the other 
missing futex_ops, and several more treat use timespec.


r~

