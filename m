Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC52DB033
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:38:53 +0100 (CET)
Received: from localhost ([::1]:32976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCPc-0007ug-Bd
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpCAt-00030N-Va
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:23:40 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpCAq-0002gu-Ld
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:23:39 -0500
Received: by mail-oi1-x242.google.com with SMTP id q205so10944890oig.13
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qxyg1YGy8MOdvkRLJMY7S/6YpqiFWz0vCsZe6cd6Oco=;
 b=yI8OBzLBkM4j8OfqV3OO9c0BlCynZ6FdoISI0LMnQeL+DRVmM3NNW3933EKL+6Unef
 z3NmhlGVJ1BM9Nmb0SrI6fitDJhZo9pz1L07lrCoVTeEV14gGS7sAcE6pKXyOYx8FINk
 iLUKdwZGSKVwBP8q/3PsS+wai5fXODsaRiTRa9TFOPwxHBNxgVQp/qMdS+VJ9Fm01KUt
 Gn5DhI0S1p7gNRrA/S3S/Hs74ocGw2ahWgco591xNURoGjl5TKbIxj9bIgXgWp5N0Dyy
 rv3rjxF2HmrB67bajDUiRtPaJK1yrWQ9ES7dVzKVB2NcEzdFD7bJxVMlv18Q1O38A4Q2
 vOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qxyg1YGy8MOdvkRLJMY7S/6YpqiFWz0vCsZe6cd6Oco=;
 b=YM2tiV6jZHHpRFw7UPxDedDfEFjpQfXM2LgCPPf5LxTll/CX78SQPRKJtrjl7Izr8v
 w0TD2r9AE/cU4AkBXRMpMWZoDkJwVoPLxYh2Dtna4HPRQfi+RNqrt+AICGeH2e4nMGDv
 J6azsMOm7E0KiCLBqkz5FDJTOJbLCe3TnhXE65/rp6R30s/Vq6uRFGL/7znqIEa+4C/K
 fEOWBHswPV3Jt+ROw/2K26xh7vbTy22itSyK1lTBxoa/pP3zKRsXkdPYAhA2vyEeUDsh
 ichZUVfHTT+8oyEYnKyuVJcU5qWpMRMlBSguQAZnxFYN0U2IYAnbn6b+FVHI1+4vfWPl
 lSEQ==
X-Gm-Message-State: AOAM531wIxP02CI9e6jiWEsDVTLrH56yLGHXgtZifdAr9mU9V9VrRwBe
 ilW3fv6w9VY/bh3kZ/gW9dsBvQ==
X-Google-Smtp-Source: ABdhPJzPDulHscwXS0KZWQNz2Cyw59amwmse/LvEUzs/HyeW2HY9YrHcL7RYD5DNDndplb3s00p7TA==
X-Received: by 2002:aca:f48b:: with SMTP id s133mr21709813oih.59.1608045815428; 
 Tue, 15 Dec 2020 07:23:35 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id e10sm475298otl.38.2020.12.15.07.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 07:23:34 -0800 (PST)
Subject: Re: [PATCH] hw/arm/highbank: Drop dead KVM support code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201215144215.28482-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d617172-a39c-dddc-639c-accdbe389891@linaro.org>
Date: Tue, 15 Dec 2020 09:23:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215144215.28482-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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
Cc: Rob Herring <robh@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 8:42 AM, Peter Maydell wrote:
> Support for running KVM on 32-bit Arm hosts was removed in commit
> 82bf7ae84ce739e.  You can still run a 32-bit guest on a 64-bit Arm
> host CPU, but because Arm KVM requires the host and guest CPU types
> to match, it is not possible to run a guest that requires a Cortex-A9
> or Cortex-A15 CPU there.  That means that the code in the
> highbank/midway board models to support KVM is no longer used, and we
> can delete it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/highbank.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


