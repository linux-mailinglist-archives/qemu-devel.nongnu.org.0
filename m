Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8894C37E4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 22:34:07 +0100 (CET)
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNLkT-0003On-Sw
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 16:34:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNLir-0002W6-GL
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:32:25 -0500
Received: from [2607:f8b0:4864:20::1031] (port=53082
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNLip-0008DJ-9T
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:32:25 -0500
Received: by mail-pj1-x1031.google.com with SMTP id v4so3105467pjh.2
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 13:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8F+Dsxy0RVuXgRQ6Y5ZUwC3XyP+w5EMnQYbLXvL49/I=;
 b=Ghbkow3WiI72l0YDOSNhM3YTLn/NYW5P+1+T+eKEZfClivwwCYwc5GionGQ8ttil3y
 TO2FOKbFV38gkKG0EOC9uXLfvVcLQqx0ejVsygqNpJT6eSDq/67lklVq+Q/t0FVtP03i
 aS1oZVpjbDV6acBK0nnv+f2f+mGZsUouQDeCPV1wbA3symGgFXRmX3wI6M8UoD+pb1tM
 K++kkwYPvFuwWFQaSdY+vXQvEtk+Gv3e/F4fyHmoc9NeurZioiv7Ei5EKlbBKYskBfb5
 7tXvxVN05J3aPVq/YRZJOLAC9+Hm9krBbB6yYlxwdIg/AbY8TSfY11w4KOQOS5xYphBX
 ZkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8F+Dsxy0RVuXgRQ6Y5ZUwC3XyP+w5EMnQYbLXvL49/I=;
 b=e9vpG0KHB6wHdvPbZaFC83kFMlygWEXpDZYgOoa8RTdNKriUDm9eFExKPEP9NOQ2Dv
 IUAElUdLe7yOgnDVFrbvQfFXAkmCwJuPSeMNbvshtLCdrLm6Ob87UphUa854uVn0RPkg
 DPtpyuReVw8SdjLE7fHQc/RNv9zUR2ar11mnuc9R6HvHjzbrxEF/L7WlmZJT9JbvH2OO
 ZwxRkVLGHUgbX4IFElaVJ64mzuc5a7uT0DY2LViU4d7psl0a2kH9NXQjRf7C34d3bb/h
 yCUITbzozMak6gQc8ft6lhDqQT+iz1nZBnxyUSsuH4j25sibkIFns/RaWYkI6r3myu+m
 ncTw==
X-Gm-Message-State: AOAM530bahqfNCRQPhNCkJ9Q+coz8Q8uj+YgRLo11hg/JpJlYpt17eFX
 P9ZUUSm/KRiJgq4n5eHQekuQ4w==
X-Google-Smtp-Source: ABdhPJy6mBZPv9SldouvHk3IfFPkcLVH1XwaT1c087JsGVgP95E7CJJs8k6253hg9zH3lZGjr6bK1w==
X-Received: by 2002:a17:903:3092:b0:14f:9c1c:45a4 with SMTP id
 u18-20020a170903309200b0014f9c1c45a4mr4293466plc.126.1645738341809; 
 Thu, 24 Feb 2022 13:32:21 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 u19-20020a056a00159300b004e1590f88c1sm388497pfk.220.2022.02.24.13.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 13:32:21 -0800 (PST)
Message-ID: <b485cf47-32c5-fead-6aef-7e8c9ffbe558@linaro.org>
Date: Thu, 24 Feb 2022 11:32:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v13 1/4] target/ppc: make power8-pmu.c CONFIG_TCG only
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220224201900.1037465-1-danielhb413@gmail.com>
 <20220224201900.1037465-2-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224201900.1037465-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 10:18, Daniel Henrique Barboza wrote:
> This is an exclusive TCG helper. Gating it with CONFIG_TCG and changing
> meson.build accordingly will prevent problems --disable-tcg and
> --disable-linux-user later on.
> 
> We're also changing the uses of !kvm_enabled() to tcg_enabled() to avoid
> adding "defined(CONFIG_TCG)" ifdefs, since tcg_enabled() will be
> defaulted to false with --disable-tcg and the block will always be
> skipped.
> 
> Signed-off-by: Daniel Henrique Barboza<danielhb413@gmail.com>
> ---
>   target/ppc/cpu_init.c   | 16 +++++++---------
>   target/ppc/machine.c    |  6 +++++-
>   target/ppc/meson.build  |  2 +-
>   target/ppc/power8-pmu.h |  4 ++--
>   4 files changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

