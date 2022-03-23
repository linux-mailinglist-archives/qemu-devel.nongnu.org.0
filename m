Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5644E5884
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:37:18 +0100 (CET)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5rB-0006G9-V5
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:37:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5oX-0003x7-4H
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:34:33 -0400
Received: from [2607:f8b0:4864:20::52f] (port=43841
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5oV-0004jn-Jj
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:34:32 -0400
Received: by mail-pg1-x52f.google.com with SMTP id c2so1832333pga.10
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4fwgzqV+4snGyzMZNlWy0+zwqKmG9t+qjouyQfbwINM=;
 b=ZWwc/wJ6do/s7pi8q5ddmIx0RbqEVbb9LFBofCuYYCsB151wHC2fhs9o8p8HQrQIQe
 sg86Qqz7ExHE50i1mxEwaN45su7SddO7P+4m76CnkTEahb7ZJ8roBUxJu0NfcLmv42uF
 KwB5xWaL2lO0c81A1aWwIrJ/IiOC06r8ZoQ4qcC8kI0QUKECoLzUTrXHMrg53wPHWbRb
 uve1Kp9s/ecq3gLQltm8hcnFafyXVXnD0liLMek/mAOUrgjFkd3blwOiLhhmNHi6HCNA
 8W/HtbFaK5n+FAMf6e7EEDHZwOGMM0htMGtozll5E8WgmTBIpYPmEBGCn8swisJke2W/
 N68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4fwgzqV+4snGyzMZNlWy0+zwqKmG9t+qjouyQfbwINM=;
 b=rEQdCbd/meflExZt123NRo9Gzu7BripsUYgzzci1LOwvgOy51xVGI3woX8TM2Z092l
 XJqWvu4+Y03J1hOMMgdZSRs3xm3Hj3v3KKMYyX32MScOdP8pRC/IAZz81URQ1rBVsj/o
 e6kXuKsvppFcXcNz0uFTauFdzMdbjYaDqwZHn8RwURBaVtdw3e3q8c7iAABgtObaw2ob
 CqIwblXIDWyueFFEEDE1ttHS+vyT5cEpNVAbKXuD4lp3ySh60vH//5znpV3s3ML0DyFe
 rzsHGcz4kUGtuHk261PHmh6DqTmtycE9Xk0yBvIGGVVIn5+JB50z8xhN18Mk2dBGP7eu
 /qjg==
X-Gm-Message-State: AOAM533FDcn4E34TZLdDBxPccqp4gTkIlKYaQVUOn82sigHiMjyiCpJg
 E3PpkQ920zkXSeKo4js41lEyZg==
X-Google-Smtp-Source: ABdhPJwSE6qIcvcsybAWNR5giPiYqRtd0KQwRCPIZ3oM99VqHpKZl2ShXMNzmdIbkBuweQ0QarvXIg==
X-Received: by 2002:a62:1650:0:b0:4fa:5a40:6681 with SMTP id
 77-20020a621650000000b004fa5a406681mr885197pfw.86.1648060470152; 
 Wed, 23 Mar 2022 11:34:30 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a17090a630a00b001c685cfd9d1sm402827pjj.20.2022.03.23.11.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:34:29 -0700 (PDT)
Message-ID: <4222aaa8-e1e9-806f-c171-804206079cf2@linaro.org>
Date: Wed, 23 Mar 2022 11:34:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 29/32] Move fcntl_setfl() to oslib-posix
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-30-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-30-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> It is only implemented for POSIX anyway.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/qemu/cutils.h     |  1 -
>   include/sysemu/os-posix.h |  2 ++
>   util/cutils.c             | 17 -----------------
>   util/oslib-posix.c        | 15 +++++++++++++++
>   4 files changed, 17 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

