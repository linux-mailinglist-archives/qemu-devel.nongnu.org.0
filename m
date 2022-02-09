Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532CE4B0004
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:19:47 +0100 (CET)
Received: from localhost ([::1]:51330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvJS-00061P-D5
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:19:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHvCm-0000Rh-3u
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:12:52 -0500
Received: from [2607:f8b0:4864:20::102f] (port=54987
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHvCc-0007BN-EP
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:12:44 -0500
Received: by mail-pj1-x102f.google.com with SMTP id on2so3441628pjb.4
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 14:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZI4TeLdlMT5BVuzO0o5jzUuXjOgm/7+a4/D2l5W1I8E=;
 b=dYF8VWf1oiNxBhPvuIoVQRpb7EN2lnV50FzWvjCX5GSOp+PiBXrz2HlIzecu8g9noR
 U/C6TUSONQ57N8pcJa7x5hNRPhlvTQ+wrjffAeBLlkGtCtKOoSvJtKmm+OtYuoVpFY1I
 OUnE0HwiTZvjRZIotG1lA6V5rcJph9zfvlZlSQVUdp09dAT+wKJ+KfBFNk31juVQqY+l
 NanrV68pc5NNxDcSlYNqH5ygDyLYVC7aIC/0aTQePwtQrIAHZp10eqr7vpubfIKc/Oqp
 u0JCvYCm+1tysmbVeqcXPmjpHdWrTnD9aRq6JgsWZW5nvaN61HdxV07cvvmST92DwesX
 GxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZI4TeLdlMT5BVuzO0o5jzUuXjOgm/7+a4/D2l5W1I8E=;
 b=5jhFQAloQQixjtJsoshCod8yiph17YWypmB/VkAd2S8QHpIXBLoCfnK39czASe9h61
 TgtbK/7ZgEEThO2EmeWbtZYWTNAd23f/DujpsGStLJFbsinD8tcSDB+nIJIaeH95idAH
 A0CSkkilfRl3txJtsjg08RVVag1CqDctjkNuRRozTiqq9XjO1S51gc3fbBHpM7ywC9Ce
 oZsuPtQJoGyUpCvAQMpANpCiqEM/fjOIhfJdS3ZYCvGoiLV0pIb24Ik6qhQhIa6CheuE
 cadZNqDyLWKDpokojugrXi3RT4L0K7cOj3UhEHx+XDqFCqe4siY8sQJX1qAywTWn2R1V
 VJIA==
X-Gm-Message-State: AOAM5314pX0S5o8PY/BVRSIp1Nsv00xJHsb/MX5gMT2IIkD12uZsKwxl
 dENH7if40KLvmbalxc4ySNvDGTB07dSzaIhS
X-Google-Smtp-Source: ABdhPJx8iCBYbt/b7vaFTTbKn7NLCnpq5NAor7Z7X/FyRLKHiDs8UvxiDbN6vHKF9rqQ2IAC0ODf9w==
X-Received: by 2002:a17:90a:1987:: with SMTP id
 7mr4927730pji.215.1644444761107; 
 Wed, 09 Feb 2022 14:12:41 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id f12sm21857229pfj.37.2022.02.09.14.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:12:40 -0800 (PST)
Message-ID: <d3644f5a-e146-0721-8d2f-396af548792e@linaro.org>
Date: Thu, 10 Feb 2022 09:12:36 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/15] hw/tricore: Remove unused and incorrect header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209215446.58402-4-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 08:54, Philippe Mathieu-Daudé wrote:
> TriCore boards certainly don't need the ARM loader API :)
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/tricore/triboard.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

