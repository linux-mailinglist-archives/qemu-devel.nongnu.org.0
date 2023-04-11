Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638676DD85D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:54:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBcx-00045x-Aw; Tue, 11 Apr 2023 06:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBcv-000452-MA
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:53:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBct-0003gB-7u
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:53:29 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v6so7062811wrv.8
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681210405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L3CwoKV5LuALpCo5PXpMcPu39Sbz3HucxkjjMnt5HNo=;
 b=U0E31ric7SxoCG+uQ/U7kWtifhIiaF2pQ3w/hawO2GPXY8/7mFoa0kqwwnOFw+WJgB
 59KRYC963uiNZFPivip8PExH4XX3BMEHG7SqvcRmM/X0hoAI6wks3sf/FFsSBILE4Ntu
 cpsPxHH5f1H5PIuJVxgClj2PlPY1sYLZmqY1ZE4Xb3riwb0Q7yzZiP6VWDjDCwNi8VqK
 Fm6i7x4Dkg5OW1/p55RElcVXypF2otz/rSaWjJfYqHbGuhoZj4DtrzrDIKrJ75uaFwPq
 BGj53yPnCt/N6YoePIp49Bf+x9WU7jys4gOifFRIgNsck+CZ95bLWUKYqvyTo1GEMbjE
 /FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681210405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L3CwoKV5LuALpCo5PXpMcPu39Sbz3HucxkjjMnt5HNo=;
 b=dVZiI0c0z43iiGuPCH/ocVkxNLzjIousENpomBHi0SRr6G9ulK0tA5q52JC/bZXDtm
 4y9QJ0vG31t0V/NxUJBQScCDdttyfA6PrROj+DxNoIVEmObov+6nPLCi3Qwb3bfKiVa3
 A12yZLaSKdG86rqPMH9rdsXteSXZTcN6NBHLEx36ZgFh+R5EfKCgDtjaeS+ZSGlr1JbX
 TmSw2BUx/R1sNI6ZV+46LkZAQFcq8AXuwIZPh70i4Nq9AjKcGhLwgoPRhysl4cq/SC47
 W3wnQKL7hjCdOwiI6Q85eOZs2nDYsQyNY109d/g0jAaCfh9dZUBYc/FR48H53xuBZK5Y
 LX9A==
X-Gm-Message-State: AAQBX9fiKjwOqhjXWFgeoqhgdu0YmP7ZtYNuTIeYMfPz1papzw8yQNiu
 KlRMP+xTbNBELStP+7F/k+wM7A==
X-Google-Smtp-Source: AKy350ZxfK1sj9yEoQGi/RTlimFyPEp7fMQWbCqQ5OTt9/rn4/y32KE49lTAAieXgVYlXrTZh3avWw==
X-Received: by 2002:adf:e2c3:0:b0:2ef:bae0:25a3 with SMTP id
 d3-20020adfe2c3000000b002efbae025a3mr7037166wrj.11.1681210405477; 
 Tue, 11 Apr 2023 03:53:25 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002d45575643esm14172760wro.43.2023.04.11.03.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:53:25 -0700 (PDT)
Message-ID: <4d828a37-96ca-8908-cb32-79f2824e7389@linaro.org>
Date: Tue, 11 Apr 2023 12:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 02/42] tcg: Replace tcg_abort with g_assert_not_reached
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 8/4/23 04:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h            |  6 ------
>   target/i386/tcg/translate.c  | 20 ++++++++++----------
>   target/s390x/tcg/translate.c |  4 ++--
>   tcg/optimize.c               | 10 ++++------
>   tcg/tcg.c                    |  8 ++++----
>   tcg/aarch64/tcg-target.c.inc |  4 ++--
>   tcg/arm/tcg-target.c.inc     |  2 +-
>   tcg/i386/tcg-target.c.inc    | 14 +++++++-------
>   tcg/mips/tcg-target.c.inc    | 14 +++++++-------
>   tcg/ppc/tcg-target.c.inc     |  8 ++++----
>   tcg/s390x/tcg-target.c.inc   |  8 ++++----
>   tcg/sparc64/tcg-target.c.inc |  2 +-
>   tcg/tci/tcg-target.c.inc     |  2 +-
>   13 files changed, 47 insertions(+), 55 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


