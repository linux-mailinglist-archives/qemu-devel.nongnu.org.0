Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737C72F233A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:04:39 +0100 (CET)
Received: from localhost ([::1]:37186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7As-0003A3-8C
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz78g-0001jX-8M
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:02:22 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz78a-00042a-J4
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:02:22 -0500
Received: by mail-pg1-x52a.google.com with SMTP id n10so214627pgl.10
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xjvLBrHeF+JCsVH9axuUq0DIVfH9q/a3MGYMon8ZpGY=;
 b=U6fi7A0+faosF40L0HO+4wWL7GKTWQxIdiWIkG/Wtl9UfKgmwSl7u7NjFmQ5SuWTtq
 SEs8Fk7cOs7e0PuqRzF+rxRmVtpo4/9yCk5RIyo09VENqeECfYYsXcnDa7xQiXrjTnPj
 4qXCh4y35VZgVyi2Hf+7cv7TP1ALO/Ca7KO+oveD254ISQ5v4Ngi5skGQQ6Wuj7LonO1
 gOoQb0NfVcpmMve6tBjTqktXkWGA49EksTvb80Oz3xDM4mBvJteDa5CnRpU/KijMqK2c
 keJR29mjIKFLFmu4+YMAoc9kHqEz1tbGqKLp3ziMV8+IgBrzi/s8XndMrrprx1PP0p+E
 +8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xjvLBrHeF+JCsVH9axuUq0DIVfH9q/a3MGYMon8ZpGY=;
 b=D/UmASkUZAWfqwMRSsOgABeDB/McajdY4xHTay8y0SLNy8x/LVfrTDjU/9s+52DpfW
 r4mRWr878kRiRIbdlKA7BK69/Bh0o9jk5cfGWF3ZEG59E+kZCi3XB+LUXTjqmXDQXPZT
 6dJyIZ9Jro3duABmFd3+dPrBQ6IHP1UAOnvNFxwSdSf50pyECl/tSH//fMQWX1JCFVgm
 HT7mIAeA2w77k/9vyjYCoHVBY3fMkh72mM4xvzdBjtb4/nGFDgVcGF68Omo5H213Rlur
 8ssELGBSNZnqYwyEbMW+VH/Us1E2p4uDxSTsiTaqgMof/zOEOXxVO+ODIk43Fd4fdZOW
 2zyg==
X-Gm-Message-State: AOAM533kqlvelBVkH+q/WnJ2EgdeqVeQMhdCG52Dm8lXH9J8L4D4Rsuh
 /dFNU5soVvmFsvU8fO1O8600PGqPASwa/w==
X-Google-Smtp-Source: ABdhPJw4Kvisy4MN6k+g9CSwpFeooW2erk2h1xHH9FhQr5zR9n5b5j8Nwv2sf9S56MEs90rUeqy+Ew==
X-Received: by 2002:a65:4785:: with SMTP id e5mr1929953pgs.0.1610409734619;
 Mon, 11 Jan 2021 16:02:14 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id ay21sm601298pjb.1.2021.01.11.16.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:02:14 -0800 (PST)
Subject: Re: [PATCHv2 1/2] target/arm: ARMv8.4-TTST extension
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <20210108090817.6127-1-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ebf9ea27-bebb-30fc-bd2e-445f59a52f10@linaro.org>
Date: Mon, 11 Jan 2021 14:02:10 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108090817.6127-1-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 1/7/21 11:08 PM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This adds for the Small Translation tables extension in AArch64 state.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h    |  5 +++++
>  target/arm/helper.c | 15 +++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

