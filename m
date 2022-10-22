Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27A0608B49
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 12:09:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omBMY-00059V-8E; Sat, 22 Oct 2022 06:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omBMN-00058w-MJ
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 06:04:16 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omBML-0000XO-Bg
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 06:04:06 -0400
Received: by mail-pl1-x632.google.com with SMTP id d24so4461982pls.4
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 03:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4zqNBc7b8bEGYkNdJxxbw5xpseYOOFr5/dckYLSjKqQ=;
 b=bFhxEXv5PRpDzYY2MW7iktNuzacNvYuwAtZLknhk+Inmz0DybBRwtIKCutztyxfB1u
 zAbEMXqwR+ExmpFubBhq8GzBUkUTnopmRgAV6GGKhCqH0mqKQHumUiVxstmx4vPHVEXA
 N4++auSkgO+b81rIm28s2EZQ2kg4vJx5Jkjjo8wnhVMKVSVFfxLhq+qUjhoRAIS4XivG
 IiyVHAcoweTnmXVr6tmailYaAi3F7P9vh1AIHFi6mnU7J5lmH7Z6r+xKK+N4TpKfHEkj
 rISV4lIJYdOO9Utz5LldLaiXjwtAxzk+/mNqWJDqK4BCx4OE1vHAHtpHNGc0Jf5zn/iP
 iI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zqNBc7b8bEGYkNdJxxbw5xpseYOOFr5/dckYLSjKqQ=;
 b=N4h1r0OKSJby+nArVWLPVTqw2zPw0WhEeJibFm9K8RIFJZvMnaIiaCuwv5ELVa34YE
 jyR7VjhrxI85lNFKxlWd8+Ix4KeVQceAIzm+UN1pnhhvokPcfZ/gl1VND1EUOYeC4JH2
 137QMo/N1+ALBebIOGaj4AzeRgqbmVtWzMVcu0nt34h/PfWU/vDw4vJFuqqGbtNC9ul/
 z8NZEJmi556nK9f4ZjmstXW7lgN4VQLU5GS/gVcy4PwMBZKX0tOvYpweza/nu3ZWqAaG
 RKpAvMSkE5eom7Bp5TuivlTPeZnTe+c4qlIwocUglprhtugPOEqpNXmJNU2NtexYDMCN
 NxnQ==
X-Gm-Message-State: ACrzQf3tyXMerepKGqm/7thc8gGzVVwU2I0XPox+WyrS4c6dqb4XM3qC
 4b4nuKm0sbILr+Dv6AAWrvqlug==
X-Google-Smtp-Source: AMsMyM7ipqkb1Sw3d2ddi/UeNUNgWNPCPdzyi+M74w0qPK084B0KsJZLKRwgXUvHxf72c72axIjYIQ==
X-Received: by 2002:a17:90b:3c88:b0:20d:9724:95dc with SMTP id
 pv8-20020a17090b3c8800b0020d972495dcmr27059101pjb.56.1666433043502; 
 Sat, 22 Oct 2022 03:04:03 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a170903244300b00174f7d107c8sm16510934pls.293.2022.10.22.03.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 03:04:02 -0700 (PDT)
Message-ID: <3da176b2-160f-5365-8c88-64d7e1523807@linaro.org>
Date: Sat, 22 Oct 2022 20:03:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] Revert "accel/tcg: Init TCG cflags in vCPU thread handler"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org, Aaron Lindsay <aaron@os.amperecomputing.com>
References: <20221021163409.3674911-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221021163409.3674911-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/22/22 02:34, Peter Maydell wrote:
> Commit a82fd5a4ec24d was intended to be a code cleanup, but
> unfortunately it has a bug. It moves the initialization of the
> TCG cflags from the "start a new vcpu" function to the
> thread handler; this is fine when each vcpu has its own thread,
> but when we are doing round-robin of vcpus on a single thread
> we end up only initializing the cflags for CPU 0, not for any
> of the others.
> 
> The most obvious effect of this bug is that running in icount
> mode with more than one CPU is broken; typically the guest
> hangs shortly after it brings up the secondary CPUs.
> 
> This reverts commit a82fd5a4ec24d923ff1e6da128c0fd4a74079d99.
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops-mttcg.c | 5 +++--
>   accel/tcg/tcg-accel-ops-rr.c    | 7 ++++---
>   2 files changed, 7 insertions(+), 5 deletions(-)

Thanks, queued to tcg-next.

r~

