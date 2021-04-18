Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7221B363793
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:35:53 +0200 (CEST)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYE92-0000GC-IZ
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYE7a-0008GR-IL
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:34:22 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:46065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYE7Y-00019e-TE
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:34:22 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id bs7so15476678qvb.12
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CXZR9VffY0Dio9xqXmZTOAS64VMxQWkgtZ1xpZEVU3M=;
 b=h0hIXedONJuQslUnSMTVp10C/C+vadpHpvGIcB+UiCQLI1U8xjKNWhZOqefVVbrSQv
 k2Lg8qb7mNQ3kM07Kr3bkpaEOkvVGxv1Aj7leOq77udumdI4wYzlh7wq1X/XFPOFEQ68
 /v4OD87+lC3FdxQXuHbeh2lMrZp6Dee4Y+CkLxRF7/bZtMbXJDSwwf7PWF2yLGEF8WB0
 D43pefFWCWFvOKZwj+zcFmqAabyF7a276B6hGvk9kWpf/ZOE3YN3FVYTPP9FsoN2x6ef
 dTnZT+eDBvtVPma/dOE0BEIlpkLB+FD+L4hfdnXVzGynVDbs+jeoria5jXYyajsgwj3V
 Rifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CXZR9VffY0Dio9xqXmZTOAS64VMxQWkgtZ1xpZEVU3M=;
 b=h0XLzNptUmfkqis8Ig1Yn+v1ml5UJyaTNZld2I41Frxg155+E7PzrPEbTMwIsrfYvt
 i/fZr8gwcmKotW2DWjslDe8gmw7QsHkQAEd3qAqcRODumSQ9oKWGe/cgMlcwMUZ19N26
 XiSBzfMEdU8ivmFcBm1ey5smFx/woIuV24eIZ782lzXvOmhz8kwIEf4mk7ix3msM7s/g
 Be95r1eWFn0fAXfrbkSqx7s99d+k8tYL3yMK1zt8gJ3Dhu4Kh7nUGLz6pxAmMACN7eXY
 KIfwcYD7cQOPBAZNshtOU0abKIWTxQxZbnIhq6BXVwxMZEfdvMp9L2sX3hqo+CnkBtjc
 bFsg==
X-Gm-Message-State: AOAM530DZ8AAuw4QQ9P4O1ND2nU56yQT5bUuQKJblckmkXveS5a8o8Bt
 IA0okl9FbkkdOHxN+C4FZYjgPg==
X-Google-Smtp-Source: ABdhPJxAKsdJ/1MaF39u7cZe5zrZ4peE99aXxWSZmDL3Se+yjgsTgbZ4QMs97HSoEYpnHtftii0wXA==
X-Received: by 2002:a0c:f802:: with SMTP id r2mr18592143qvn.50.1618778060061; 
 Sun, 18 Apr 2021 13:34:20 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id q125sm8633377qke.11.2021.04.18.13.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:34:19 -0700 (PDT)
Subject: Re: [PATCH 23/26] target/mips: Move helper.h -> tcg/helper.h.inc
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-24-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <760f0c29-e334-3cf8-2389-09b1aea3bb37@linaro.org>
Date: Sun, 18 Apr 2021 13:34:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-24-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> TCG frontend "exec/helper-head.h" expects each target to declare
> its helpers in 'target/$TARGET/helper.h'. To ease maintenance we
> rather to have all TCG specific files under our tcg/ sub directory.
> 
> Move the current 'helper.h' there, and add a one-line 'helper.h'
> which re-include it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/helper.h         | 614 +----------------------------------
>   target/mips/tcg/helper.h.inc | 613 ++++++++++++++++++++++++++++++++++
>   2 files changed, 614 insertions(+), 613 deletions(-)
>   create mode 100644 target/mips/tcg/helper.h.inc

Eh.  Ok, I guess.

If we renamed the file tcg-helper.h{,.inc?} globally, would you still want it 
moved into your tcg/ subdirectory?


r~

