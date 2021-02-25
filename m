Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADA43257EF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:49:01 +0100 (CET)
Received: from localhost ([::1]:50682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFNZE-0007rF-Q7
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFNXx-0006vl-6V
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:47:41 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFNXv-0005um-Gm
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:47:40 -0500
Received: by mail-pf1-x42f.google.com with SMTP id w18so4419645pfu.9
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 12:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FrsCjIbNVxH0GzQ+X2SI+twYDbO3vDZSVdU73hlZ6cs=;
 b=vYHvPpbxLCI8swvIOQjTDk073f+E0aEBrwHfFAF+VfQPFFx6zjeWNTryMt6Jt7fYU7
 /S5nLOZ4ymSfo3BRFWKH/o5mTKFQKbHbSJEcwU70IAFF97qHQ7L6MIA5pNW5DM9YiDG5
 b+rXvWKiAZRI2kOElRbxNQsYtP7BHEjZtNRz2eTLyhd3USHbu4C6cboksQdQagCqegXv
 sOkFOgiP2Od3fWVVVn9oAd84r62M0vY5YNlmF3hQQGV9NbCzS0jaG645uFCFd0uGwIil
 2wjjSDIXxhvMypfMFT+sZVIZpKd+V8RxlEk+Od70lR9HnGlrgTPt0KONcIHk31jkfgoy
 2p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FrsCjIbNVxH0GzQ+X2SI+twYDbO3vDZSVdU73hlZ6cs=;
 b=WZDQ1c43mth+eOVoNVjsAkGJXLcdld1rWIIQ40emYhMVJG0tzscpeDoskjVGvJ8kJY
 9PeQ75t1QXCsrfVvYBE9n8eWQPmgNzoo9QxUqYpm8SOKbUqo9A9NUxL8H6/E1zeZYl0p
 uDF6s0ie7osbtPW1y8CNccwco7dQ88W4qsJc/E+0EuRkt1RcV5/+aGufFpB6uhXqt2of
 NROM4YyKQxUGOEdWfqI6VofKQKKJplMjt+12XQvP22DEyLVAY8syACByTAyXbPPZeq2+
 rKILkwYJVwxXSDZRP1Bnl3bWsMLGimNgHQeR/cPUDQwBRWiY0ZirxJFv2AJvWvv+RuNH
 Tn0g==
X-Gm-Message-State: AOAM5300t2F7c5zMZh6H2O+jLRAoWXltrv/PHw4BRTlJr8TA98iuVeWM
 wuJsywVfxrveMUMa0pInZ7b8/2IO77H1tg==
X-Google-Smtp-Source: ABdhPJz7bqSseUv4KY1SMhFChgN3elVRYhlpT9SLkkMXgGYaa3gSrq4hmp+vUuiwkUMsIkZn+bFEfA==
X-Received: by 2002:a63:1503:: with SMTP id v3mr4562199pgl.240.1614286058082; 
 Thu, 25 Feb 2021 12:47:38 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r2sm6794641pgv.50.2021.02.25.12.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 12:47:37 -0800 (PST)
Subject: Re: [PATCH v2 03/10] target/hexagon: make helper functions non-static
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-4-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1810031f-a137-6fe7-1f6e-16347855618f@linaro.org>
Date: Thu, 25 Feb 2021 12:47:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225151856.3284701-4-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 7:18 AM, Alessandro Di Federico wrote:
> From: Paolo Montesel <babush@rev.ng>
> 
> Make certain helper functions non-static, making them available outside
> genptr.c. These functions are required by code generated by the
> idef-parser.
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> ---
>  target/hexagon/genptr.c | 13 ++++++++++---
>  target/hexagon/genptr.h |  7 +++++++
>  2 files changed, 17 insertions(+), 3 deletions(-)

You should mention that gen_read_reg is new.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


