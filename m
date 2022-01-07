Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E004871CC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 05:35:05 +0100 (CET)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5gy0-0002zC-Ex
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 23:35:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5gsL-0007VX-Hs
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:29:13 -0500
Received: from [2607:f8b0:4864:20::1029] (port=38900
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5gsH-0005wD-0z
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:29:10 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so10745928pjf.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 20:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ul3h4JIQNKGn4xuF8R4u68sQRUrVxMXtjNCaIgqI+F0=;
 b=gyZ+jfSrWYhNT5BV8zSzhBPDfAMAHNg2HVSzmo9AUMzFMnYPbJm6NdjzOHM4ksl0zc
 zgNIkIglUPkgSxyRQqEdyUn3nxGG/VyPl/Kd800YXvlUjJ05CXR4YLfwzVdBHRy7ZSWq
 N5cLoB2x+8Z5eaSySySbd+2oMsXqxULATLigKmlFQHuuIucA3lpEtAEae2ABYfwdVMS9
 Z5ZSiYH0yAmpucVnTwg6h2YdoTnenA+Lmuz4O8/m2csDqM+qsgiQIwQIxVbu+nvIqLHO
 cqNq/tZ9gj5LNVoG+LCfD4HYw70PObdGshBNu3oSCfoUdM3f4817ZQq6WYa+Vh2jHwdl
 cZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ul3h4JIQNKGn4xuF8R4u68sQRUrVxMXtjNCaIgqI+F0=;
 b=F4XbNHIA2Sgcz7cfe7/YGPVijJLs6Ih43Kyc/vU7VH7oXYycLzgd/zwSRRXniQsyk5
 OkEoVnnP13QPSA/O27NLaHNswXXttQ0jHbeCUsDfITxxwEgWeKn9ZBd6i6KIVf5ePXi1
 J2R1hNd5gO7U9qfn34DnPZpPdrVbyf6O6snO9v7JJtp+6BVXagqlO8owVIagYfjZGTkb
 Wq2TFUrWvPiQz26omLGjWnfYRpgQ9g5vifRp0wv1B4rXLMfBvZaxz1lY762c8QarDnRB
 hCNUoRXvFBpNhXTRC2y6fleNWI1QNl+AzR3tsJfZZCPh9fnNMTgfN9z7ms0jWHi3DcMj
 WWIQ==
X-Gm-Message-State: AOAM530I6PTx5N6o3A+KPbzNbvQXfek2feQFJ6epLMZ3EGaZbcB0h3tw
 FIV7SkkUBQGpLSAKIOV0q4kgNQ==
X-Google-Smtp-Source: ABdhPJztJTczeCTF7zm7u2Ys5Il3wWZwR2pIPGINzLxMsqT3JolKTichgzLJU2fd8ySb9uC7DTMDRQ==
X-Received: by 2002:a17:90b:17c4:: with SMTP id
 me4mr13672635pjb.15.1641529747515; 
 Thu, 06 Jan 2022 20:29:07 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k2sm4180182pfc.53.2022.01.06.20.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 20:29:07 -0800 (PST)
Subject: Re: [PATCH v14 18/26] linux-user: Add LoongArch specific structures
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-19-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd91134c-0921-4155-e4e1-f2fc0ffe3438@linaro.org>
Date: Thu, 6 Jan 2022 20:29:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106094200.1801206-19-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 1:41 AM, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   linux-user/loongarch64/target_structs.h | 47 +++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>   create mode 100644 linux-user/loongarch64/target_structs.h

I've just sent a patch set such that this need be nothing but a re-include of 
generic/target_structs.h.


r~

