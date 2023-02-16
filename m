Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6013698DDF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:36:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYns-0000Zd-1Y; Thu, 16 Feb 2023 02:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYni-0000Jb-GT
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:35:31 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYnf-0006ap-1x
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:35:29 -0500
Received: by mail-wr1-x432.google.com with SMTP id r2so908812wrv.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8u9k8AEU/MStqqPN/eEDcLW//w50QRAV4Dxv0HP4ECY=;
 b=KDlxj6NIq0UbEa8qlK+V+HUYQlHPkIsdz5LTN7fOwEtjisig6QLDnEboUwKJEROhZY
 ITg1UMPgivOaVMrDj1T99fHqLjtZljCmT007X2/NdywPYzTjsIKTOCw7dR0GKiDeftcL
 iHL4qE6UEXvv8D91C7zfP2thUNM59E5e1rfvZmulQ4vp1noEyqlQED7+E1+j+QMJv1te
 RomlOgAGQJJhC/rCexaObFM6l1cbGHKToP1NqaZ+zJKGdRR2Mvq0uWYsKkXeHUUhQYwf
 JassYlRo+kC9seK7sZHR6NT+nfYVLTJJ36IpS6tw7im9kf4TTNTKV785Hz3GUfmZB/43
 eFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8u9k8AEU/MStqqPN/eEDcLW//w50QRAV4Dxv0HP4ECY=;
 b=GAhQCLlduko1s63Gj5d7tZBotHrGDffgNqLUvTu4tLwWV3MEsPxE07wR/SJ2E8w1+X
 pu1ZuNsKHkFWcxCcPxxV4gq97LFJzUYUxoqnWF8Ya16er0H3rlg0tb4Mcgn164MWzH7i
 iTrwTdTdvMtuzcc/vAzA5J0CLllDCi6J2rqNUbPrzzmGHMQsNvasILTzvsZHDtVOAynT
 mPmS0CYyuRxgKgR7KR4gRsHGmlsZ68mr+qvEKVShufkDqRbwtKauzTVUT1YKfi4vweSS
 Gx10O9OmaYZDAtWMSKJ55x5hlQBAYxPdtM7flNiB6mko16AMXlgHegpBqs8Q7FRJHStZ
 PkdA==
X-Gm-Message-State: AO0yUKUmLULrC5qill1Df2tdaXjI9Dz2YXJek+YZjkgucoonpIdSonYe
 ieH49NlH3dgW/EfpDC6kUdFAMQ==
X-Google-Smtp-Source: AK7set/dtZtiqwwg1JbIkU5OIajJvIQB3jw/huRESdJ3Ah/fmab/77UIiqm6F2Thjdk5ZTkH+KHM0Q==
X-Received: by 2002:adf:ec08:0:b0:2c5:4c32:92cd with SMTP id
 x8-20020adfec08000000b002c54c3292cdmr4426053wrn.35.1676532918901; 
 Wed, 15 Feb 2023 23:35:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q1-20020adff781000000b002c54f4d0f71sm750937wrp.38.2023.02.15.23.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:35:18 -0800 (PST)
Message-ID: <8adb5f7d-072c-f3c7-391a-95b103e26692@linaro.org>
Date: Thu, 16 Feb 2023 08:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 2/4] target/arm: Store tbi for both insns and data in
 ARMVAParameters
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anders.roxell@linaro.org, qemu-arm@nongnu.org
References: <20230202075242.260793-1-richard.henderson@linaro.org>
 <20230202075242.260793-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230202075242.260793-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/2/23 08:52, Richard Henderson wrote:
> This is slightly more work on the consumer side, but means
> we will be able to compute this once for multiple uses.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h    |  5 +++--
>   target/arm/helper.c       | 18 +++++++++---------
>   target/arm/pauth_helper.c | 29 ++++++++++++++++-------------
>   target/arm/ptw.c          |  6 +++---
>   4 files changed, 31 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


