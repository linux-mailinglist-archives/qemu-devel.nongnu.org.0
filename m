Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BA751530A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 19:54:44 +0200 (CEST)
Received: from localhost ([::1]:33498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkUpF-0004cA-Ol
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 13:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkUo4-0003wD-Fg
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 13:53:28 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkUo2-0004TY-Tf
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 13:53:28 -0400
Received: by mail-pg1-x52c.google.com with SMTP id k14so7094556pga.0
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 10:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Hc/9fC6f6+g88WbpQjC84TnAiidFPkt6IdGkbt/J9LQ=;
 b=FRnZyysRXodr/MztVQDIf4eVkNxVdInJxEHyxqpddNLVbnoxEdeqtOOc0NNero0zkU
 gkmrmE5SgvUusxbhIKKz7EvQCKN5TZyzgvp/y+O3QcN2/kAA4Yf/jq4bUvChlzP2SR0B
 EuIY6+1VcSOVyN9a/Ii1LZnEvq7RGuiF3oEhjF8wwGytR54PgLZodwM1f3/I4zO4ZEln
 fTSjfV0gOa9a90xADgwfpo1QN0nChT0htmDSqDRt+hRjK9bklDqv0FUJvOnWPeRm4l0P
 rBPKIXUV6nqPKktTE9xnDRDhYTlwAnMyXKU0ZjxV5bW8l1fo/QliH87HORDT24L22UM9
 zWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hc/9fC6f6+g88WbpQjC84TnAiidFPkt6IdGkbt/J9LQ=;
 b=oUEk8d5+fkSVLCZgG0j2h1LV6IYNwwXypHQYoX1bmUpBlbHpqq1XR8VPmoowW9kNly
 +To5xYikerZS+vy+sH7p1eOY1xU/5BGluLQnNtu3dPtw9U1zNcooho/G563+v86CKkQ3
 56HLq3HyQMAGkorSMaWKUmb/eUvHk5jTFePVoyALNLjow4ZKUnIJVr4fhoAgz+yp3f1/
 f4GpiGOU3fR4hOQeXEWy4E5xH6uon1ITVY7X9P6tyjp9DnuNcyfTHkK7MyLExqT1y/sg
 M+KY+UDCccakFXYiGD6gA+XCcyWxkLsRsU0moiZEF6NAUK+DUBApynNBfbeZbVfx6gjk
 DPnw==
X-Gm-Message-State: AOAM530WS4cKBXqtRU50lDla3sRmuvmsVIWRUJa3LUBrV+oro/LP/KwL
 TGS1sONUhv1Jfh+TQT3od2HfcQ==
X-Google-Smtp-Source: ABdhPJzG2dBemjY20W/pynMH0x7INqG98JifP89p2PkEmyRUKK1wTuQpByuKaBK4UGYRpeKrrRFR+A==
X-Received: by 2002:a63:e952:0:b0:382:65eb:257 with SMTP id
 q18-20020a63e952000000b0038265eb0257mr399529pgj.465.1651254803361; 
 Fri, 29 Apr 2022 10:53:23 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 y68-20020a623247000000b0050acc1def3csm3701278pfy.203.2022.04.29.10.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 10:53:22 -0700 (PDT)
Message-ID: <1d322778-c684-75f4-551a-d2eed7f6b7a9@linaro.org>
Date: Fri, 29 Apr 2022 10:53:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] loader: support loading large files (>=2GB)
Content-Language: en-US
To: Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220427230716.2158127-1-pcc@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220427230716.2158127-1-pcc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 16:07, Peter Collingbourne wrote:
> Currently the loader uses int as the return type for various APIs
> that deal with file sizes, which leads to an error if the file
> size is >=2GB, as it ends up being interpreted as a negative error
> code. Furthermore, we do not tolerate short reads, which are possible
> at least on Linux when attempting to read such large files in one
> syscall.
> 
> Fix the first problem by switching to 64-bit types for file sizes,
> and fix the second by introducing a loop around the read syscall.
> 
> Signed-off-by: Peter Collingbourne<pcc@google.com>
> ---
>   hw/core/generic-loader.c |  2 +-
>   hw/core/loader.c         | 44 ++++++++++++++++++++++++----------------
>   include/hw/loader.h      | 13 ++++++------
>   3 files changed, 34 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

