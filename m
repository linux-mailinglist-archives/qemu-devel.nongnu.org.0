Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626E457CC6
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 10:56:18 +0100 (CET)
Received: from localhost ([::1]:39606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moN6X-0000mN-7L
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 04:56:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moN4u-0007m0-MS
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:54:36 -0500
Received: from [2a00:1450:4864:20::330] (port=39475
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moN4s-0002N7-JA
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:54:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso12376925wmr.4
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 01:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NQju6idVScfUR86bAgOpu/21oLK1v3nj0RpWwIrXcB0=;
 b=M0jeNTedKTccsiYa4zzVNnBDcBVoxwNBzAyakV0HdoAGvh8PI52MaTjM5VBaINWf5q
 8thrg0jImRM+QpBryOP60Tkxp4LXrqINZM6Nvj3AJK2i835/cF2OfGxUIkXZGCJlQelA
 nwtWJYZF4xwBF7C8LlZLGtAmqK/ky/GKOMq31tZAymOJMD+FtuoBq9c7ozDbVql5YIX7
 XpQlH4oF8OHBQ3oqRirwtt3bJ3LrC1yRSVzL/WPNBR7bmgBWDA2QwmUXcjI3Vcg7nI4N
 6f0JxqraVf5GaGoqYV3P9KHIEmW2O9lcWgdDVLZjkpFSFZ65yhDQ9XaCPTlhq2cpr0wv
 DHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NQju6idVScfUR86bAgOpu/21oLK1v3nj0RpWwIrXcB0=;
 b=210gP9GErcs1g7+GfvHTPCJjLCMQTTTxWzDDdyzlVtPxSOYZZMPNuPhikvEDvxIiJP
 Qsec1ZHj6Y6pusohRvPhdf9wDumoNdBjZ5ZI6EMMK8ni2NbPUWcxHUC0sGluZPE7KPxg
 xt+mGTEzpdwaYa3J2HkUPvYyCAb8g1Y/UpvBc7XvlbKOCKzczEyCXnUKwE+93TU7dEQz
 B+ejbSmEpyABrj8sYtTeiaEr6Qh43dVxTLjDHMTmI77r8AU3Jt3odh/WsfpCywCtQbZ7
 f93t7oiF4rxgOkgvpJUJNisqOiertpzBU6QehDrkh/qTpy0s+aO9lkAl4fTg0+VMf2bO
 JqHQ==
X-Gm-Message-State: AOAM531ySOfcxIfZDu/No69HGAU0nGb1AlDGFYXJOdwar5mGYDG6QoBm
 geY9f4+aDPfVBlT4oUluQsIGWw==
X-Google-Smtp-Source: ABdhPJzvz48WuJD4/o6z9NxzJOJFoZrq9Xu6fMwC+sOdPxNImNG4HLQVzDILSTP2ubg9YTR5sE7TLw==
X-Received: by 2002:a05:600c:6025:: with SMTP id
 az37mr5364669wmb.194.1637402073198; 
 Sat, 20 Nov 2021 01:54:33 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id r8sm2760948wrz.43.2021.11.20.01.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 01:54:32 -0800 (PST)
Subject: Re: [PATCH v11 17/26] linux-user: Add LoongArch generic header files
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-18-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57ad5eff-2d9a-ae58-fc30-d9cc21332822@linaro.org>
Date: Sat, 20 Nov 2021 10:54:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-18-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> This includes:
> - sockbits.h
> - target_errno_defs.h
> - target_fcntl.h
> - termbits.h
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   linux-user/loongarch64/sockbits.h          | 11 +++++++++++
>   linux-user/loongarch64/target_errno_defs.h | 12 ++++++++++++
>   linux-user/loongarch64/target_fcntl.h      | 11 +++++++++++
>   linux-user/loongarch64/termbits.h          | 11 +++++++++++
>   4 files changed, 45 insertions(+)
>   create mode 100644 linux-user/loongarch64/sockbits.h
>   create mode 100644 linux-user/loongarch64/target_errno_defs.h
>   create mode 100644 linux-user/loongarch64/target_fcntl.h
>   create mode 100644 linux-user/loongarch64/termbits.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

