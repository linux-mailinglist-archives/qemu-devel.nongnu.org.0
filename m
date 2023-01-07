Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9193C661183
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 21:14:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEFZ4-0004e7-IO; Sat, 07 Jan 2023 15:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEFYx-0004cN-HB
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 15:13:07 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEFYv-0006nc-Pa
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 15:13:07 -0500
Received: by mail-wr1-x435.google.com with SMTP id az7so4290065wrb.5
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 12:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tYeRVU2Oi3LVA91b2wF2x9PNvzGhGm25g9Msvn/wGMA=;
 b=yzEj6fhA0oFuHQEr3MoZytiLy5h1rZEFLoKfAH6QXu16YMQeb/X3JjV9TSOLBit6PP
 6BgIih4OOCYlxI1wAKGsoieZqasowrJd6+i6HRUwRSP2EM+VWNN9H8D5e/QlvbWtXKCs
 38BG+6SzDtik/zn42hc5FmnNkIcEMUOtQZ16jST4r2UQwAYWPaf86IWZSZFgBBbsORKl
 231OVNUotH63ofnFQFp65nO7joqztzNj1u2RAO+FMwTssG/rrTLycsg5ARVgqS8smlvQ
 OGuq/b/u19MMpHXXbQDmEDfx+uQk2rQabW6b41H9TJ766eLVWBsgTH+X/aqms8fhhI2S
 SOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tYeRVU2Oi3LVA91b2wF2x9PNvzGhGm25g9Msvn/wGMA=;
 b=Wm03+1pJXLx0fT2DzDXAj63f8QUyTXSnQU1z6zZlhtBGaJaxj4sGq5vmT1LM5OxEAO
 +4AMBdj0BLx07YrS3ufxOgvwlp959rtQPmH6vhnX0B3a8HG6dZ2jXfljPcfeJWQaW0zT
 1OxOcVUlKoMcZMmY5DJDOlo/C1I7kJhLIpW9N1py/SXEQvLxyU5hEYE8KRC49D/3agJC
 9pGDNEnf93XUe7f7y2/tVZPuIkrK68btj1C11YGQVAABpPf+I888Zij/9ZTWztzrJ2u7
 BWWjAhcoNUuTCRB1rNZJg30kUsCEObrOQyHHFPkQHtTdI9tOgPN55JLF4iBT6vpgxlgr
 RvcQ==
X-Gm-Message-State: AFqh2koj2BKkzwAxmsudxervP7Zy+jC0+vJpSqur38R5sXQcDsF7TW0B
 EiFfVVV+ePXJ8Hunu5AJ6fXstg==
X-Google-Smtp-Source: AMrXdXuglCX/J/HjBDMSj/KLr76JEfe+4NuUpX48Mx/90ldXHOGNL2MVdbYEsv8DTBccGN5rMQZbNw==
X-Received: by 2002:adf:ce0a:0:b0:242:4dd8:a7ee with SMTP id
 p10-20020adfce0a000000b002424dd8a7eemr38059116wrn.12.1673122382653; 
 Sat, 07 Jan 2023 12:13:02 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a5d548f000000b002425dc49024sm4549817wrv.43.2023.01.07.12.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 12:13:02 -0800 (PST)
Message-ID: <877261d0-1e07-718d-98af-b934bd480712@linaro.org>
Date: Sat, 7 Jan 2023 21:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] accel/tcg: Split out cpu_exec_{setjmp,loop}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230107182057.1984146-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230107182057.1984146-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.114,
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

On 7/1/23 19:20, Richard Henderson wrote:
> Recently the g_assert(cpu == current_cpu) test has been
> intermittently failing with gcc.  Reorg the code around
> the setjmp to minimize the lifetime of the cpu variable
> affected by the setjmp.
> 
> This appears to fix the existing issue with clang as well.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1147
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cpu-exec.c | 111 +++++++++++++++++++++----------------------
>   1 file changed, 54 insertions(+), 57 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


