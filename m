Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E0B2B26A5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 22:27:56 +0100 (CET)
Received: from localhost ([::1]:45230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdgbr-00014i-7x
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 16:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgSu-0003AE-AN
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:18:41 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgSr-0005XT-LC
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:18:39 -0500
Received: by mail-pf1-x442.google.com with SMTP id b63so5079325pfg.12
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 13:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1z2TQOjD4yoRTyAbO1fFLqWdCztBSj3wYN/Z/5fwMno=;
 b=L1+Msx/zPaZWM5og28DxwKLsTameZAkhrFm9bnLHkNk+We/yCBHbaJqAX0Ch3xLh7x
 ssvCQn7juTgBObm67LQn4KELvH3TFAcbpo3yvha7NgiinGNdX1VvWIgux9DL0FJ59L7u
 l1xSeBls+WSdzK8BfGrKBBLHZ4axT/NwpXrRroOEIKXjtt5s2GfiO/jUq91PQlaY94N+
 AMtJlBAnpyysZvkABmqJh2k7QZrulwi8FQUE8s7ZG+sOVwqbOzNW9UnEdMjSH14tI59z
 FafQGuUEvdP0gjKMYJ7SBrH7q4Uje37NjPsoMPR+MmzzXga9LJBTAS7MXwzE5km2qdDR
 XfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1z2TQOjD4yoRTyAbO1fFLqWdCztBSj3wYN/Z/5fwMno=;
 b=EuIo00OaOVpTZ9XT60EIdS51OwlzrQIYpVRrNTxFVWxdefTgZTD8wUNEviWe/OVybx
 Wv6/FDvaHWVckqRtBydlOOMJmIG2zHNla0X8BBCrhNKFw4k94T0L67bQdnKYElF5rsqC
 PYZu4j2AM1k/YUlUXI3PwxOh5yF1Mvp5sOW86lxZtZCqrhiiQFV/C88o57QTXDkAKL9w
 qrLIaUROAANp1QF2xmYoabjNYw99XCLQrsIGpxIOoToCHH6frOG2YPb9PiDKTJGVKtJf
 RyqdeGnn3JAnrY7sUorjIDMNA/5qv+5meOU84vIwoDnl/DDk0z/DUAK9jPJqXq4Dba5u
 Hk/g==
X-Gm-Message-State: AOAM531gWjfb9d9fRhEvzr6Q+3n8K2NstfWf9bGe2lDOVHNQ7UCcdxBJ
 TceF2DTExmFWqD2ymbUy1IaRimpv5vIjxw==
X-Google-Smtp-Source: ABdhPJzIlEEloP+4JKfkfeU8qGg6IS5SsxrLsj5sfaPqWw4xvqubGeEcSgMEd+oz/JMof9f5vhntSA==
X-Received: by 2002:a17:90b:30d0:: with SMTP id
 hi16mr4665227pjb.144.1605302315516; 
 Fri, 13 Nov 2020 13:18:35 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a3sm11077390pfd.58.2020.11.13.13.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:18:34 -0800 (PST)
Subject: Re: [PATCH 01/17] target/arm: remove redundant tests
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-1-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38693f30-7eb5-69db-b010-4471e0707699@linaro.org>
Date: Fri, 13 Nov 2020 13:18:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-1-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> In this context, the HCR value is the effective value, and thus is
> zero in secure mode. The tests for HCR.{F,I}MO are sufficient.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.c    |  8 ++++----
>  target/arm/helper.c | 10 ++++------
>  2 files changed, 8 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

