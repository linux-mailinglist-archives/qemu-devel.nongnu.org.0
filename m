Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B782532D8A0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:31:42 +0100 (CET)
Received: from localhost ([::1]:47062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrp7-0004xE-6K
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrnR-0004Js-B2
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:29:57 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrnO-0007Nx-DA
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:29:57 -0500
Received: by mail-pg1-x52e.google.com with SMTP id a4so19310193pgc.11
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5/b1P0cRaXwnbbPN/HlMCnTi143LUkySlaTLDq1g7e4=;
 b=jvVCSzPXUbogP6utkH3zarDKij0lSmPKYuT/bSyJ+PvEvqfEs4csxJE7rGgOrsbGiN
 A+TWfS5vuIPwbL1AMjMbaHpbyXZgeJsHiOJQWbkVgJIFbRxchB1UW/44Kdn+dQj6Ickp
 nmx7YPKmBcu+HbMr/y+SAvp1+sPxvtHfrDI1L7dC4EnTJcC+1YRFIxDc85m/9NuRZgH1
 yPDAhFZhOYAG3lFY5a9hYfa+z8ZXLSJnMLbVF/mrTiFwnzkBJ7atNiwnG1rxB0CJHrB1
 jZTFwsQqpUuN+1376yZ5I4/5Q1vkQ69YWYItjZM1GOjl9DucFdCeA/ss2o/ZhuZN6vyF
 tUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5/b1P0cRaXwnbbPN/HlMCnTi143LUkySlaTLDq1g7e4=;
 b=iXx/iKHDU6DPoSnT5LT6dF+lFTd7GhoDY2ygoG8XOKArJ4pWjaa0A595StyxV3vkZo
 4RzfaUJFU2piuH57vf3k3s65tmkV4xc6YkuPVLQml8bNbUC/t0qVapGTucQlJh8X1hfH
 SSfAJiMaKsW+HMhw2ohYD92+F7+yfRUcA46wDRfo/MyIk+fUzOK8wytpInPutjYwdgtz
 SMd0Ku+qz0+s30YggQPfg64086ArU52I+WaY5k9WeEEW/ez6U1fLWk9iW4YeiPZiqqry
 wknZ1fHFMsN0YGXXoFE5Bsy6wRJ9M3ia2LZB9sLgm8OqsC9K3UhfO74Xw/4rkvC/jRro
 o9OQ==
X-Gm-Message-State: AOAM533Ye8/o1CpeXRcvmto9hqbefDPvu8qLtOMj2YiCx4gBNrnzXn+c
 QWJRXyrBt90/Zv4BmipKwByhpBHF9KYZFA==
X-Google-Smtp-Source: ABdhPJwHR0Rm9kDetWYy/cVdy2IN+kRM+Lc9LSKD1TRplvzEYs17H42f7vUA+b0I4lmYdn6FnLdFdg==
X-Received: by 2002:a63:fd01:: with SMTP id d1mr4297504pgh.319.1614878990741; 
 Thu, 04 Mar 2021 09:29:50 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w6sm13085pfj.190.2021.03.04.09.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:29:48 -0800 (PST)
Subject: Re: [PATCH 07/44] hw/misc/iotkit-secctl.c: Implement SSE-300 PID
 register values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f167565-0af3-ee18-4f16-ec0a8aab12f9@linaro.org>
Date: Thu, 4 Mar 2021 09:29:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> The versions of the Secure Access Configuration Register Block
> and Non-secure Access Configuration Register Block in the SSE-300
> are the same as those in the SSE-200, but the CIDR/PIDR ID
> register values are different.
> 
> Plumb through the sse-version property and use it to select
> the correct ID register values.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/misc/iotkit-secctl.h |  2 ++
>   hw/arm/armsse.c                 |  2 ++
>   hw/misc/iotkit-secctl.c         | 50 +++++++++++++++++++++++++++++++--
>   3 files changed, 52 insertions(+), 2 deletions(-)

Which document am I looking for here?  I found DAI 0547B "Application Note 
AN547", but I don't see these register definitions.

Apart from validating the constant values, the actual code looks good.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

