Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EC2376980
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:26:26 +0200 (CEST)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf4F7-0007dO-W4
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf4Df-000700-Ig
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:24:55 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf4DX-0008AZ-Bn
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:24:55 -0400
Received: by mail-pf1-x431.google.com with SMTP id v191so8075523pfc.8
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 10:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A4uTvmyF7Z/TuRRFmU4/ORY+QfaB6egsvRwG7g6EDJ4=;
 b=I4+zvR79lXM8phI3yyaEIco2gxJCJZnujkB6z3LMUZIzlAdzzgcCaNnZDdh/l9ZqTY
 uL86dq9GBshExPVWYnKBZCpmwIOvgsw2L3VnmgHxpXG5I1k6n1mohG2y1FNacLLe+4E2
 p0lG9Y5yNt4C98cCWcZ5v7LPiO3CY8XCD4mwqdYoNHqsBmdP1PDewHq8z5PcWhv49//i
 WnXuL0Hb0JCktVjzTNtr5pFlWKuMtrG1Ki7bD8dWRwjYJvwOP7epOxJP0INcKqCenymC
 wFOXILPYNzz6MxMuxrbAqSt2ONf6F+20Q/jDLf4ADffoC/o7aYydekYgeq7BujFRAwyL
 x8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A4uTvmyF7Z/TuRRFmU4/ORY+QfaB6egsvRwG7g6EDJ4=;
 b=MFmkvv51o8G3gjQB/1LIqMFMpH9CwOhqnlR483zfIkgF2zQqo1VsbORqlW0Sc3uPwf
 xO4CVmNYJAoY1FYQfaQEd81t9J3EHWk1OiOmzanFiuuLRNm3Zz5YMCw1rhYeGSV9pIoq
 yNCSeRuRWo9nPYu1rjDnIDI3DkirDMqwtxJSlKIDVBy6/Vc2tRm4egj0pAQ9OirADxoE
 Ux8FNuKkimhx73zzcqBI/edyGnWiUUE10bXHIH7pmS9fbMcbtvhi53vd+WS8c0QsXdoe
 6uFX6wB/IUYHyCnLe1pQhqsO4e3Q/Eb9L/Zd+0GkhO0s8sjY8RA2rk8x+VJ6qyDIo9JC
 bCCw==
X-Gm-Message-State: AOAM530tueBpnd1hD9Lx6gJyNgNEcku6I83zYplm1IyaVt8C+HJ7GHVm
 A1EeGzOeIUc9lFCEoEWJCql598a8eo7ykg==
X-Google-Smtp-Source: ABdhPJx18iy5Kcxk0uuZb1OKC+A0khQjtVrSSWhAV1gXVWlPkRImfevoXkUltUYv+7HQXWsSfzqVdg==
X-Received: by 2002:a63:f965:: with SMTP id q37mr11194834pgk.132.1620408285902; 
 Fri, 07 May 2021 10:24:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5317378pfq.165.2021.05.07.10.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 10:24:45 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] bitops.h: Improve find_xxx_bit() documentation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210507170634.2058801-1-philmd@redhat.com>
 <20210507170634.2058801-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7255dc16-456b-1b8b-d311-0442f9dbe458@linaro.org>
Date: Fri, 7 May 2021 10:24:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210507170634.2058801-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 10:06 AM, Philippe Mathieu-Daudé wrote:
> Document the following functions return the bitmap size
> if not matching bit is found:
> 
> - find_first_bit
> - find_next_bit
> - find_last_bit
> - find_first_zero_bit
> - find_next_zero_bit
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/qemu/bitops.h | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

