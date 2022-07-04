Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0540A5651B1
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:05:57 +0200 (CEST)
Received: from localhost ([::1]:40164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ixo-0005rd-4A
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Iva-0004hf-Kl
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:03:38 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8IvV-00011a-1K
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:03:38 -0400
Received: by mail-pl1-x630.google.com with SMTP id b2so8135781plx.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AX1m8BxtDebrNxtLs9fzgUfdcPXVgb185UY/be8nG2c=;
 b=XhwwDH/J/DgsSqsjLaW27bzLIFowCdUDLnBDx+rdTdfrd/Cg59DEdxaJHCT3CZY/ep
 5vGDTJ0369QCDMlCMirbXit8LatmLYm/0iR/vvMFse80dikkIbfpmQ4rzDdvE8Gp8OO/
 Y7YmHsWR/6R3xD93h4cHKqRC79hNDt/mKdX6wcZpjTGRYzc1kSHWqibnHuq+KvUqCJKw
 PURXF/97vh4hc9Um3El3DrCkRTQYdVX4Rrk8D1cPAh2ikLJ13X6DWfDYHOG9NRFi4wlD
 bTT/LpSMQaxln+EmN/vdj26oW7b6EJ2vAbrXscivT7iMOSpSmQDxWLeyKwfJzEYI+RIJ
 4pfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AX1m8BxtDebrNxtLs9fzgUfdcPXVgb185UY/be8nG2c=;
 b=hcBEETCvlkQEnx2siwG3ewV9W7zxLsVpqorN0Mfa38zhmzRwP+Sp8maKrGwuTaTRH2
 EpLhjAkawKB7ixBi7OFIzvLoaH6SxXU2vFf1Z2cLF+zLNiAar+yBastgcT9ojnlGAOPD
 SfxHSle5C3wGKJIKQGtaFT/ROrotOE2pYmR2qOhoYotc3jX7Yk4+iLrRvj5z8Fpxhr1q
 mWQJbsgfv5U4KRu+f7qHKwOEyZtTJa+zpphptd77QhF8d3AUkypCETgX2yDdH4qv15di
 QprjpG5sijTtAIl31ws35cOc+A8sU8XhBlveTKrarhj/9DNUwc4UfvP80Jr4pM6ELMYp
 Btjw==
X-Gm-Message-State: AJIora+jVnTjUvGF7EWLk1K8yCYMoiUvihKgh1gJJFLKLWpX0ey2CZCG
 lAWcPnZC2e9/x1/Au2ttSvIoDA==
X-Google-Smtp-Source: AGRyM1vxc8Am+1QtcezUpuVXAwyGp0gbnEqqw65gTgq9vHPLfFPbwvBcZdA0h6PitEHf/z2HvT5WNA==
X-Received: by 2002:a17:902:70cb:b0:16b:c750:fb5a with SMTP id
 l11-20020a17090270cb00b0016bc750fb5amr14406267plt.117.1656929011357; 
 Mon, 04 Jul 2022 03:03:31 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a170902a50b00b001620eb3a2d6sm20631531plq.203.2022.07.04.03.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:03:30 -0700 (PDT)
Message-ID: <60e84190-a60f-0ed0-8755-61d5087fdf9a@linaro.org>
Date: Mon, 4 Jul 2022 15:33:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 06/11] hw/openrisc: Initialize timer time at startup
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-7-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220703212823.10067-7-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/22 02:58, Stafford Horne wrote:
> The last_clk time was initialized at zero, this means when we calculate
> the first delta we will calculate 0 vs current time which could cause
> unnecessary hops.
> 
> Initialize last_clk to the qemu clock on initialization.
> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>   hw/openrisc/cputimer.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
> index 93268815d8..4dbba3a3d4 100644
> --- a/hw/openrisc/cputimer.c
> +++ b/hw/openrisc/cputimer.c
> @@ -140,6 +140,7 @@ void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
>   
>       if (or1k_timer == NULL) {
>           or1k_timer = g_new0(OR1KTimerState, 1);
> +        or1k_timer->last_clk = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>           vmstate_register(NULL, 0, &vmstate_or1k_timer, or1k_timer);
>       }
>   }

Init doesn't seem right.  Should be in reset?


r~

