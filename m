Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE4F369D4C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:30:58 +0200 (CEST)
Received: from localhost ([::1]:35110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la5GD-0002hD-48
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la5Er-0001s3-QN
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:29:33 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la5Ep-0002ru-WC
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:29:33 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 10so26137336pfl.1
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZRjPckBYxxDanzxpn9vGln/1M3hJI+g22R0u5pTXnT0=;
 b=nOHJ1mfWObMFrtpccnWdyZdV/bD9HADQv0sXxkDBGiFqvb9Y5B5eASliXF0H29jJmR
 HJBKUVcuf+hMN4B9GV8rbnaHsjc4HQcMOoxSRoIChETAxs7uEupqKP9+ZkbJ0zH+e5p5
 aexeGJvx/8YLQxZmXveuNf1HjW+yLAlkkNY1crW7DjJXiFHS+7/dbLjxiN7PjLlIzqlH
 glcwWQ2SLoI9T4ox6tInYC1vGeYb08MJirseIXPF49kknXur8tSuLAPl2b9Xp/sRjYtp
 bK3Jv+kEvcWpnBR6viIRWZPMCA3ZXJdAHqC3rz9fGiNNf8SbVO6QtAjkX6lgSziKgwAi
 feRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZRjPckBYxxDanzxpn9vGln/1M3hJI+g22R0u5pTXnT0=;
 b=az0j+nYV7aEGBbNi7YZwWWWAUbMZXQi5/r9qmQApDA7/c2xirhxB2LUv7qSJWWMtp7
 gN9Sp6eOum98isQFeQrJIWlnn9A2G9zbbvcm8J0VkhlTadHO6rXvUkCYkDACqiB4TOVg
 A7/VC3txUlch8powkQNCcuik1qdlhBtjacYCba/A7t15xSsE/Z1QbPdCjlEWsuWFPZKw
 mAnxzkpLQkB0xWSJGOnq5j89K11qGDgfKmLMHGCN8m+JHD5YKO4PUwUw0KAyBGjfQumN
 g1d/8C7xWJauVNK95fTmm2dHQZ4TDduaj0ddb3vG8eDyTVEwH8dMe9F/r72xHnUynDAt
 2fig==
X-Gm-Message-State: AOAM530S7XpjnoKJnWdf7WcNjy/1jfUCc9n6hPTu2VjJoqwmOFj5kLzF
 wTeklppEHgwJJ+ZcSKhyJsUUQw==
X-Google-Smtp-Source: ABdhPJyeCLH16gkhtGf7H1Nrewm9jKqobBT9KfBhKdu4yKdNwnmNc12JX9WXBWHOCg1NV+Y+uFnEwQ==
X-Received: by 2002:a63:b59:: with SMTP id a25mr6018056pgl.235.1619220570710; 
 Fri, 23 Apr 2021 16:29:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id ot5sm97600pjb.51.2021.04.23.16.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:29:30 -0700 (PDT)
Subject: Re: [PULL 17/24] bsd-user: move extern to header file
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eff84d3d-0a75-bff6-b01a-59b3e3a89274@linaro.org>
Date: Fri, 23 Apr 2021 16:29:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> extern char **environ has no standard home, so move the declaration from the .c
> file to a handy .h file. Since this is a standard, old-school UNIX interface
> dating from the 5th edition, it's not quite the same issue that the rule is
> supposed to protect against, though.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 1 -
>   bsd-user/qemu.h | 2 ++
>   2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

