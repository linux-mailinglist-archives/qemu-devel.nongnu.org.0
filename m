Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA5E36A26E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:49:12 +0200 (CEST)
Received: from localhost ([::1]:36860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMP1-0006e5-Ev
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laML7-0004pk-Ua
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:45:09 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laML6-0006dQ-AZ
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:45:09 -0400
Received: by mail-pf1-x42b.google.com with SMTP id a12so36182938pfc.7
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7hK2JQ4D6BujRiHSkaNQuzvU/cT6A/BIWFG2dj3zPzc=;
 b=UoPPCPHvl50tfj4JkzphCEo72mA0iVYkGH1sNpcZy/iWm5luY8NCfakbLgYO8OaR/6
 y9p2CMbQUZEoj5ZM3KfIMLdRq1anG4IhOGW9iALuXLCBwQ4mHr3WgGMc05//zNPAxakS
 roT6n3B/kiqpIroieigE/u9JisFYUZyFdy3+xYPzQhNMSwQVl73wElRs8pFrNnqezQNO
 pJRnZJeL3cH4wlic+0cfEKAFguuNmpoJYu46qNjIK3M6Uf97B73yXflbCvDKkOc0dSGI
 LWY3pVcBmvnISEeaXoctkxcwEAAP/8SqXPmG0pjr6XmHdYXR6ARYrk/apuaSpE4+U4bP
 rykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7hK2JQ4D6BujRiHSkaNQuzvU/cT6A/BIWFG2dj3zPzc=;
 b=J8DK3y3nK9ona2KAq0OkbEUdV8GIfJwB7YQ9XlVsepYQWGVEyfAB75ko+LLaNEsYKg
 eosH31wffIkTrf9NBrzeQ1/QP2SELcBKTEXz/jgy7cwAjAs8hq1W7lQue7muOFsdcHas
 X+YKojxJ7FkmGIX6FskN+MTPyXcWYw+jOZ72ypxQwlDlJ7kXKDRUl6tjJitOUkOwJK6T
 Fg/xyc+6bFczPhW2kIunBcjMJTTIu2tx3x5QRzdRMHxvNL2dmT0wnpYVjs3Cl3hYdnCk
 6UoDXNzY1imUF88426nrC2DjnKn6v2eybnlhiBgOgIEItT+Zevvk/v34kbgVag91xGln
 0ecA==
X-Gm-Message-State: AOAM531ceL8oNsQhbacL3S8l77fDL3vL+s8TbsJ2NSCdsugh45VhSIjD
 xf+ErtnoMhVcHTyuO/1r/itJiA==
X-Google-Smtp-Source: ABdhPJzCl4/7+yvl8vYILBXxdmWcAiVw0WdQDhCHUAX7pUd52n5VH/vcH5eB7ti457V1eEjFmyo2vw==
X-Received: by 2002:a63:af5d:: with SMTP id s29mr9323547pgo.220.1619286304633; 
 Sat, 24 Apr 2021 10:45:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u6sm7242703pfi.44.2021.04.24.10.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:45:04 -0700 (PDT)
Subject: Re: [PATCH v2 26/48] bsd-user: move sparc cpu_loop into
 target_arch_cpu.h as target_cpu_loop
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-27-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7661e0e2-3c45-7ccb-8d4f-d46c12f1f8f4@linaro.org>
Date: Sat, 24 Apr 2021 10:45:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-27-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Move the sparc cpu_loop out of main.c and into target_arch_cpu.h and
> rename it from cpu_loop to target_cpu_loop. Remove the #ifdef around
> the catch-all cpu_loop.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c                  | 270 -------------------------------
>   bsd-user/sparc/target_arch_cpu.h | 267 +++++++++++++++++++++++++++++-
>   2 files changed, 266 insertions(+), 271 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

