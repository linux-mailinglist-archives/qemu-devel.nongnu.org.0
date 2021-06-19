Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EBE3ADA85
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:13:01 +0200 (CEST)
Received: from localhost ([::1]:35346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luceW-0000WD-Oz
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucaX-0004SU-0r
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:08:49 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucaV-0001qm-FV
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:08:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d11so11860198wrm.0
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 08:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+7h7d+Dyjb1m/PtGZ9OI7r0pihBNnIYyJnWSligtCa8=;
 b=rMP8k7M1QWs+vV80UoTmHzz41WI626gXooZy4CfPTK78dLk4YDu3mWzk/P3jp+Xqzt
 feRMztZvIuEUicZ2Fbs870OJKLVjd+5/fDz0/LkLFIzR8JsgZvJQ1sKN6EEvJk+uCa5p
 2nl/WMovEfYUeagmMIenl7tUpjFFxN4XQuVrPrC439dNPGysQ4zFVqOsu24r8Ucx5GeF
 bbXIfJsOHISBVWam5xwJufMtFxdqj5JiP4EDHi4+GSIbNwIezz1nh0WKN45JjdqO0U4a
 3bcrSE+GcO89EDuXu4d8nfTy/nO0TTSxevZtF3k+pUlKxSdWU59t03iQKJqZcA25natB
 ZPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+7h7d+Dyjb1m/PtGZ9OI7r0pihBNnIYyJnWSligtCa8=;
 b=hdB8yB8A3NKctGltRDuK19mOMN9G5o5SelJ0Ipdfn6phlIAuGUs8PtLv3A8Yf6qc22
 3HiBwnGHqUsx3UWOOFQ9SzMxY3ZcQ5n5EE3T6wCJsuX0/YW24emKgPWP5B3xndRHrIr5
 yrq1TitR0RSpiLMbbncdFmXC1a8KixMGcY9iHrUV+UQxSGOa0zIxYOoyb5wARa83YQh8
 mUz4BUsi3lNZ8kdAusKtakzsj91yQEMUK82BTInBSqDdcy9nAHQ/t0XiIi4iyosF6SJE
 0Osx33u8GSwNAsqSxm1qEyDPCToJzx9RJQJRTINqgEss3RUoeLp0nirgIFIOf4YZ0FpM
 i7Wg==
X-Gm-Message-State: AOAM530uRQss0JxtCN8Q+D6DKqJG/or2cFeNQ2rj1f4/53dczmI9Scu9
 9kKzFERi2TfaycyK+NWwnH0=
X-Google-Smtp-Source: ABdhPJyss+pqwIgL7KvmbW8DygDndJgRLGoCwCrcPe/N2jR1Zt2cwftXHYb47Ox5tC6pqOXpSW4Ezg==
X-Received: by 2002:adf:e850:: with SMTP id d16mr8028815wrn.254.1624115325924; 
 Sat, 19 Jun 2021 08:08:45 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u18sm10432656wmj.15.2021.06.19.08.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 08:08:45 -0700 (PDT)
Subject: Re: [PATCH 02/11] softfloat: Rename float_flag_output_denormal to
 float_flag_oflush_denormal
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bbc518af-17ec-e02c-a5d4-949ce345c1ac@amsat.org>
Date: Sat, 19 Jun 2021 17:08:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527041405.391567-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: mmorrell@tachyum.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 6:13 AM, Richard Henderson wrote:
> The new name emphasizes that the output denormal has been flushed to zero.
> 
> Patch created mechanically using:
>   sed -i s,float_flag_output_denormal,float_flag_oflush_denormal,g \
>     $(git grep -l float_flag_output_denormal)
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/fpu/softfloat-types.h | 2 +-
>  fpu/softfloat.c               | 2 +-
>  target/arm/vfp_helper.c       | 2 +-
>  target/i386/tcg/fpu_helper.c  | 2 +-
>  target/mips/tcg/msa_helper.c  | 2 +-
>  target/rx/op_helper.c         | 2 +-
>  target/tricore/fpu_helper.c   | 6 +++---
>  fpu/softfloat-parts.c.inc     | 2 +-
>  8 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

