Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCEF369D44
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:26:30 +0200 (CEST)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la5Bt-0000sX-R7
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la5Ao-00006Z-Cu
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:25:22 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la5Al-0000HF-AC
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:25:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id u15so17411956plf.10
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nXl7nazApO9UBBIoAWDDOCZHjqrURf43sIwLcJ414Qo=;
 b=v7UfoO/CNZ1FfL3NPf7s5zi6BsGhEmMQH/sp27LOfpcZXAHrlkGf8aavAUa7YrSwdY
 0EURNvqoVVw2iLR1sSum96qGeu2EgSzn5VxE7M/1kpZL+nkbH7HEr5D7mTQdkqnZ8MsI
 C5B+qx3eZCsF7MhPLPa2S6yHhN+CYMixWfhuf8ndlTCJfJdLcUh6d0X4+rtFMkUDug6+
 KhZECS7sEtQ0H8MxsC3oSshEvuvV9XZSNUTmYmnRMWp2IrhJGOp5XUxHOcjwutJvSuS1
 SNm28xZB0BnLtWjVSBGz4YcMvOif9MiqDZ2iVEImwXRALbD7FKfapRgNbSrl8EgK/0sg
 RQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nXl7nazApO9UBBIoAWDDOCZHjqrURf43sIwLcJ414Qo=;
 b=iNa2h1DNhrirm67tf8aTh3KtEMH7m27NYgVFGXVAAWy1qpoBLEppI8dS2H1AAGXO2U
 c9Dx/Gkb3l4hjpJ86XKh6NobeAXct5N3zxp6wv8LjYioo3qFr5Px44lkt75yasHExkrl
 bJ7BPdzykUheNs/+Cz6YTER/gp81dTzEMkmS/mmmZ5FuvRn/B26EHCeuMrqVZtBaxrS3
 1OonSmSpqIdfYmHPMujqQoTNXSbzeXnnrxCwJmE9y2lvRJ1iGrdraYQEMWcy1+xk7Q9T
 nSdTVFwPbOLS6pe9DugZv2ysv+0e5kl4WuQZRTV4h6A3MnbaGU4he5OFFYCbAve+M8y6
 mqhA==
X-Gm-Message-State: AOAM530GcgVe5yN6gr9gKnkovKovns/TdWigAnS8aD14vyxa35RJz5pU
 3OXNi+B+CG2QL4phUF1yvQL8Iw==
X-Google-Smtp-Source: ABdhPJyA/lXg7O/4Jxu4PQgE47X9MQmNDluAyjWRLEL80Ovm0SCeTRojcTpr5qAKf0q5gqn5FXlkrg==
X-Received: by 2002:a17:902:a415:b029:e7:137b:ef9c with SMTP id
 p21-20020a170902a415b02900e7137bef9cmr6077256plq.28.1619220317846; 
 Fri, 23 Apr 2021 16:25:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id o127sm5675025pfd.147.2021.04.23.16.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:25:17 -0700 (PDT)
Subject: Re: [PULL 24/24] bsd-user: move sparc cpu_loop into target_arch_cpu.h
 as target_cpu_loop
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-15-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1cd04456-dc39-7d41-2bc6-bfe45a91c781@linaro.org>
Date: Fri, 23 Apr 2021 16:25:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-15-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Move the sparc cpu_loop out of main.c and into target_arch_cpu.h and
> rename it from cpu_loop to target_cpu_loop. Remove the #ifdef around
> the catch-all cpu_loop.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c                  | 305 -------------------------------
>   bsd-user/sparc/target_arch_cpu.h | 300 ++++++++++++++++++++++++++++++
>   2 files changed, 300 insertions(+), 305 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

