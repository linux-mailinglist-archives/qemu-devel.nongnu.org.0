Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC045640AB
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:12:11 +0200 (CEST)
Received: from localhost ([::1]:57980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dr0-0004xJ-7u
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dcr-0007kj-O8
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:57:35 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dcq-0000ee-6e
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:57:33 -0400
Received: by mail-pl1-x629.google.com with SMTP id c13so1050478pla.6
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=VHxURPl/8MTYEkzx500mVJB3zx/ZKyGoJAp7kO85dvw=;
 b=VniVwjXHmXeRvhRCRU0hIY8h9Zb1WukOT1pPHPI6I7Y44B5CyId28jr3YabEfSx5rU
 JAcIVaWShSjn48T+jE2PZR1+wVh7JZuzwDcuXehTRzHxzmjaVcBE5d1v1fmsz33vufFV
 nTXFVS+jyLqoqYNMwn+cCkH928A9Z0ttJZzzv9dGnpV/sglxmr0jh2xFGnIkw6mwZVKe
 mRld1kGfffI6BsSk0NIffANW6QAeZ6fpNhQGQxnQD+Qu0Fe7GEA9w8Kz7BB1V9M9VlhO
 mxP/lTV5kun47Zq6hatQH5I+pW22fck7mRjFWSvjRsnBE/8NxkrjGvYDDaWnMh8OocWT
 3jdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VHxURPl/8MTYEkzx500mVJB3zx/ZKyGoJAp7kO85dvw=;
 b=iSMbJxyp2GihKIYyGc2iLpX8y6ifbsQwe67WsAIytTYY3amO7aJzIGn3Yu+rm+7Q59
 fS+9cn4nA0gQDmR53qk58qDoopAnEXYVA9GSV+xoXmK0huuu6NZ3G8xnvQ9x8RbQMGWY
 1n1Psss0tRj6GncEhwaSjQpWe1IVrdtGi2HTSn6Q983R6hXabwXUWo3lYNRph8p/ImKW
 jU4yrpDnaOOzh87P6ynde+Y2egkJVILDI3xKB3Bv7LFHAbOsMD0rX3GIvX2gL3mzU9sc
 OYzmAx4i1G5u3we4ZisUbWpm1R5yLrxW7+Is/LHG9nXRAIjh22Zw7MxUSYcSXy0guAYl
 Psng==
X-Gm-Message-State: AJIora/yyYNBKBfazYsXk6G492YLGJfyQVIOvfNoqpIUdiN5drdxu2f5
 Ncsccbrop8tryuNw5w+hyc7n9Q==
X-Google-Smtp-Source: AGRyM1t5Un9DizgomB6tHbnjgR3sQNVAb0CaOdflk3obeGkfjZ30iP9s8aBG9zSxf2L1hZPTh/EDCA==
X-Received: by 2002:a17:903:234e:b0:16a:2d02:add7 with SMTP id
 c14-20020a170903234e00b0016a2d02add7mr24001362plh.10.1656770247618; 
 Sat, 02 Jul 2022 06:57:27 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 w34-20020a17090a6ba500b001e34b5ed5a7sm6016799pjj.35.2022.07.02.06.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 06:57:25 -0700 (PDT)
Message-ID: <cb1d8ad9-ac6c-7f2f-3a93-49ebc0ee0faa@linaro.org>
Date: Sat, 2 Jul 2022 19:27:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/5] target/arm: Move define_debug_regs() to debug_helper.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220630194116.3438513-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 7/1/22 01:11, Peter Maydell wrote:
> The target/arm/helper.c file is very long and is a grabbag of all
> kinds of functionality.  We have already a debug_helper.c which has
> code for implementing architectural debug.  Move the code which
> defines the debug-related system registers out to this file also.
> This affects the define_debug_regs() function and the various
> functions and arrays which are used only by it.
> 
> The functions raw_write() and arm_mdcr_el2_eff() and
> define_debug_regs() now need to be global rather than local to
> helper.c; everything else is pure code movement.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h       |   3 +
>   target/arm/internals.h    |   9 +
>   target/arm/debug_helper.c | 525 +++++++++++++++++++++++++++++++++++++
>   target/arm/helper.c       | 531 +-------------------------------------
>   4 files changed, 538 insertions(+), 530 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

