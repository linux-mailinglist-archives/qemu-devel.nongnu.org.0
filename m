Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51F74AD611
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:19:20 +0100 (CET)
Received: from localhost ([::1]:50478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOWl-00061z-T3
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:19:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHNvr-0008CK-Qo
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:41:11 -0500
Received: from [2607:f8b0:4864:20::632] (port=35508
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHNvb-0000Az-T7
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:40:58 -0500
Received: by mail-pl1-x632.google.com with SMTP id y7so8218581plp.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jRwS6v12KNPYgjNgTM0OFnuU69uuPyMV3yunIsXXuMI=;
 b=Q4IFjnCDgfRPxpnu0fLnAgNVinmsofZhW0Opt4Lg++0vCIUlYsh7NSg83FScQN5KzH
 LM5hAz/ZUz83J9juhSgB+NISmVO2ywZSbnrBELTm1wbEqRBzuU1k4TKWK8P7JGss8nDx
 IjZP6gSWMFm9DwkB0ypE7HhOfW0BKPr38IAn2w3z/D2Fq3mnHFwpqPbAaxZNtMh4bfLy
 0l4d4yO6mT6SHAxBfMp6Y5lFXXI+MZw+cBY10fbMVfy6ZjiSvc1yAjMwYtYxuvTKQ16J
 anVIaxvGze3q84++WAEAGJX/K9LeVretg0GU8OV+JoXnOjhPpdghD0txM+G4UKLwdsr1
 wwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jRwS6v12KNPYgjNgTM0OFnuU69uuPyMV3yunIsXXuMI=;
 b=LMHaXFYlc9ymTgiO9JKotA52w2a7QtyFc+35f+7IuZ2Pt3/lCZXVWbpI4litNZj/+J
 izCI0D+vZObl+EGfzZoDgrCXAXx9r8wCUqg9esTt3aGsjlapnSU+/+/u8ER1gqFOifJH
 YXVRRhwtD9u114o7zy1kH3nUWvmHJaSLx5xJco4502XM0GZsGaYset1U7RnuBoPjIxCL
 jCW6OJSIXoaPMHOMD1Q1dHRLKqQXN7hd+UJyT6mF2MAsrItg0LmQwaBiy6KivGxoF+zr
 C2w2f1dVyKPEQ9xFjaP3hvC+QIu/Y4cHRZl3uAjeTqwxj1HijKrA55GncPdcQ+UULy/2
 7XPA==
X-Gm-Message-State: AOAM531sf/A/0QQBIn47WQeTsSvAwIAlVjA4BpyS61N/J6L62JfTaggV
 Sc9Foq3H2jPTZHhLrdWa1lI=
X-Google-Smtp-Source: ABdhPJwW0FUKuJASqHt2RrO4dGi+TgokBHGylp62jeDoVq+zaTA7EbHHtMJmV1jfe7pCbhQmHn/2Dg==
X-Received: by 2002:a17:90a:4045:: with SMTP id k5mr663448pjg.98.1644316852954; 
 Tue, 08 Feb 2022 02:40:52 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id nn12sm2305154pjb.24.2022.02.08.02.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 02:40:52 -0800 (PST)
Message-ID: <14905868-a494-893e-b2f6-7a5fbc64dfa8@amsat.org>
Date: Tue, 8 Feb 2022 11:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 3/5] linux-user: Introduce host_sigcontext
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220208071237.319844-1-richard.henderson@linaro.org>
 <20220208071237.319844-4-richard.henderson@linaro.org>
In-Reply-To: <20220208071237.319844-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/2/22 08:12, Richard Henderson wrote:
> Do not directly access ucontext_t as the third signal parameter.
> This is preparation for a sparc64 fix.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/include/host/aarch64/host-signal.h     | 13 ++++++++-----
>   linux-user/include/host/alpha/host-signal.h       | 11 +++++++----
>   linux-user/include/host/arm/host-signal.h         | 11 +++++++----
>   linux-user/include/host/i386/host-signal.h        | 11 +++++++----
>   linux-user/include/host/loongarch64/host-signal.h | 11 +++++++----
>   linux-user/include/host/mips/host-signal.h        | 11 +++++++----
>   linux-user/include/host/ppc/host-signal.h         | 11 +++++++----
>   linux-user/include/host/riscv/host-signal.h       | 11 +++++++----
>   linux-user/include/host/s390/host-signal.h        | 11 +++++++----
>   linux-user/include/host/sparc/host-signal.h       | 11 +++++++----
>   linux-user/include/host/x86_64/host-signal.h      | 11 +++++++----
>   linux-user/signal.c                               |  4 ++--
>   12 files changed, 80 insertions(+), 47 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

