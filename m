Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4317532CA5F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 03:18:08 +0100 (CET)
Received: from localhost ([::1]:53174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHdZ1-0008FE-Ab
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 21:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdXK-0007Q1-DV
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:16:22 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdXI-0006ap-Rb
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:16:22 -0500
Received: by mail-pg1-x52e.google.com with SMTP id a23so8039412pga.8
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 18:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J1HqcBUztnKP7LpcnCgs1Y1m/Tm/ZANgeytrO8AsuEc=;
 b=yPplATN4hkZUZYpL+KBe/tSertGx43/PKAXYMbFxLu4V3PMkcYUnkUVtT/1XfC+/n7
 R3lPyBaeXkQ2LijdW7gb6hr1TgwEy5QiyMuDHFn8Is34qtXfgTiGGLIE9u5qfiNZrhbF
 Za2ow2lrWIA9Qj2d5TRqcnfgYyD5AJWMzWl9mrmSW3jn1oLVyJFFx5YKu40bQ/4gSxs3
 frqNyTGGJ++/Mv2gOtMVNTvweNjro8fKiUiTJy7BHj1ODAkm247J2HqP9eCNXAZORhyN
 Tuqr6xxX+zYXq2UUIrZWKRQxd19EngsQ6tHpmcEe0vbVA6fOyCdFsXtW4jz6BOwkt2jL
 wEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J1HqcBUztnKP7LpcnCgs1Y1m/Tm/ZANgeytrO8AsuEc=;
 b=cuP0yylXmEmGg5BgfPErHtcoXMoFN2p2HUx4fXfyXfxh42iT2y7ITtta6yft0g9Q2A
 ZQwOOx/9hikxFxu9IYN2MLhKfxZVdeqD5VD6wvM3mhckGSbL0WnIJtBtE2sFfNiTIxsN
 aTjsujwQL4FZgCQZVXK8Yt0fHUFnGPHCXyuPpbid1/zbuMSk1qDWM942FGtfCkieogfC
 I+DGawBvyJ7P/1vpIrm+IgUatqPFOjX+woqSKVEu9Xc87bmSZUIK2jBKGTfnQVDj+r4i
 tiTUq9IGeYbpX5REmMxU0dkmwbqvN7F7Nd+kSjBYKJrK99+JHlh2KRa8tOuSxIWy1Ixm
 wtSw==
X-Gm-Message-State: AOAM532TMYCDUlmr9uwBfhrXwQkjF4ZEmWH9MORpFGwxUQ4AC6u+qYgI
 P8rjym/NFiQM+gORQ57lcABWSQ==
X-Google-Smtp-Source: ABdhPJzvTJPln2II5pes/BXK6cYCamDLZRm0ukw0F8URwWnw2u/EfcQvIxZsbtjcka5oBgj1tfX+kg==
X-Received: by 2002:a62:8445:0:b029:1c1:c862:8fc4 with SMTP id
 k66-20020a6284450000b02901c1c8628fc4mr1585336pfd.77.1614824179205; 
 Wed, 03 Mar 2021 18:16:19 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 68sm12386165pfd.75.2021.03.03.18.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:16:18 -0800 (PST)
Subject: Re: [PATCH v2 21/24] hw/arm/mps2-tz: Stub out USB controller for
 mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7975259c-9fdf-0eb8-effd-c47028bb028b@linaro.org>
Date: Wed, 3 Mar 2021 18:16:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The AN524 has a USB controller (an ISP1763); we don't have a model of
> it but we should provide a stub "unimplemented-device" for it.  This
> is slightly complicated because the USB controller shares a PPC port
> with the ethernet controller.
> 
> Implement a make_* function which provides creates a container
> MemoryRegion with both the ethernet controller and an
> unimplemented-device stub for the USB controller.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/mps2-tz.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 47 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


