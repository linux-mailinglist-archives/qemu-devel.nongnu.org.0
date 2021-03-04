Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256CB32DA2D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:15:30 +0100 (CET)
Received: from localhost ([::1]:47838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHtRZ-0006za-7X
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtPw-00068a-7w
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:13:48 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtPt-0003Om-Nf
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:13:48 -0500
Received: by mail-pg1-x530.google.com with SMTP id p21so19513515pgl.12
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 11:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JPc9oB7dI6ihbCTbE3KUAvo77GIk6tsUzTaZREyl+Ek=;
 b=LeR0IBLahJGMTdCd/q3Mnu/O+bM7b9C78/QywTimGNfl/5gelA/plVs195DI1yQSAf
 m5CPH/+5XFWeX8PBLYbGr9P5RBFnQ2rtqUItI8NyJ4ix2RH+dpQupfh/t/oh+f/hCAKz
 zrd9F9iiBURFo6ydRErLDoZvVbpga2CsCDT5mQKkjyba+eB6DoMqPhXl3+Urso2L1FL1
 gpuwWQ0P29pnuX0Up3U+FRgRbu2XEN+4OkiO/JqUeYyFXJdZ/chI4x7kk29JZ4M4v44B
 292soAqAnDvDYFQ2Xnw2/yDyL/3Z0PxwteYTLIDq3bGYPm8+VwbNirPLmV1ZgOTceWze
 Qhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JPc9oB7dI6ihbCTbE3KUAvo77GIk6tsUzTaZREyl+Ek=;
 b=kevYUbzXKw8Kll4uDR9AuRa3oFK8f1mxFK/Lvjx3q6h7zjGNpZ72u5lwFRxx2c6zGU
 89uGgPy/2BOt7+IB1rqnwGD+yMYR3/0Zfco9ni97O+9LLv7empqDMjoe3k2g3//EcKeS
 rqQWKnchXZ5JSndom23Qbuak85CO/aF8R8qX4+sMK8P/HPj2801Ey9cj3Sg7T4/10K1D
 wQkdB+jQWKR243a9ZoFIdyTns2tYsWM3TFE97eoC0zsREJRok6nC71+dZw5DmX3aj6cf
 B4l0q53gu8AlmHHdHUVyIexMTLkZsIpMigmuovfuSTi/V3voF2YMpcdVpBZX5+Vet7Z9
 jNNQ==
X-Gm-Message-State: AOAM530VU1FU/omwx9iKE39y154420euvOSdEfPhk92jle606WDh9iRK
 kNLx978v7H8R/mWqqxzhi1TyS8JXwgWy7A==
X-Google-Smtp-Source: ABdhPJwB2BF+CKgJ9ymSEPP39JYh7JVI/2LCle1Nf4XEbHR3hRvWeuV8ukfyPbpoOxPWXvMPsC8evQ==
X-Received: by 2002:a63:1505:: with SMTP id v5mr5021652pgl.95.1614885223540;
 Thu, 04 Mar 2021 11:13:43 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w202sm158918pff.198.2021.03.04.11.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:13:43 -0800 (PST)
Subject: Re: [PATCH 13/44] hw/misc/iotkit-sysctl: Add SSE-300 cases which
 match SSE-200 behaviour
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3da7531f-41fd-d79d-9326-ac9f16a343ee@linaro.org>
Date: Thu, 4 Mar 2021 11:13:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE-300's iokit-sysctl device is similar to the SSE-200, but
> some registers have moved address or have different behaviours.
> In this commit we add case statements for the registers where
> the SSE-300 and SSE-200 have the same behaviour. Some registers
> are the same on all SSE versions and so need no code change at all.
> Putting both of these categories together covers:
> 
> 0x0 SECDBGSTAT
> 0x4 SECDBGSET
> 0x8 SECDBGCLR
> 0xc SCSECCTRL
> 0x10 CLK_CFG0 -- this is like SSE-200 FCLK_DIV but with a
>     different set of clocks being controlled; our implementation
>     is a dummy reads-as-written anyway
> 0x14 CLK_CFG1 -- similar to SSE-200 SYSCLK_DIV; our implementation
>     is a dummy
> 0x18 CLK_FORCE -- similar to SSE-200 but different bit allocations;
>     we have a dummy implementation
> 0x100 RESET_SYNDROME -- bit allocation differs from SSE-200 but our
>     implementation is a dummy
> 0x104 RESET_MASK -- bit allocation differs from SSE-200 but our
>     implementation is a dummy
> 0x108 SWRESET
> 0x10c GRETREG
> 0x200 PDCM_PD_SYS_SENSE -- some bit allocations differ, but our
>     implementation is a dummy
> 
> We also need to migrate the state of these registers which are shared
> between the SSE-200 and SSE-300, so update the vmstate 'needed'
> function to do this.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

