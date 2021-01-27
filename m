Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D970C3066F3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 23:03:09 +0100 (CET)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4su4-0001Qw-U5
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 17:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4srA-0008C5-8e; Wed, 27 Jan 2021 17:00:08 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4sr8-000527-QN; Wed, 27 Jan 2021 17:00:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id i9so2928850wmq.1;
 Wed, 27 Jan 2021 14:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q06cb+ER67QjfpkhaNND73FcXJ5FSWiZuvbSOvSD5B0=;
 b=tS7PEhLUVZRnmQXgjx+qJ3xnyXKKNWUl6iC/pofC88w6yeq4MwmwCq0uKRu0zHc+hT
 Q3vO3lGikmw5RlcU9Gsx0zKClUkJXJsU3JuZrQIU5er6bMw/6nSpF7o/2UFqISSCI9yF
 kei8ckkEpswAhdpPjFbNUwSPy9mLqMigQ9+vPpFt92S25kf7/jQTn1ve29CYYWIhTqZx
 6YqrJcyIgfRoPBXLwdty5nIBYjEuI1MdMvwINFiXybCvkzjZg+cLmdeGW8I+8E3qKr2H
 3eRNiSZyp2d25F2KeIuTfIvUImrSRKS51lrRsFcYHVHhW1M/yehDH9o1nn6hwLD7YRAO
 FV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q06cb+ER67QjfpkhaNND73FcXJ5FSWiZuvbSOvSD5B0=;
 b=RmzK5v0tEgOhho1AJvNFVk0h2DWJ8vzJsAhy/FJcje910IbS2D/WiMbkXo7hZNO5Jt
 wEVyfEX0hutHnH9pksBi+W9gRmfGv2vEFeTMMBO/9qjzTWSjwYXFoIcy+4dVPYOCLSiK
 ux3+84MD0ZewOpb2OXgw8W8+5jzykBwqooX8MXmEljGbgnfmUr8TBOqMZ37lgvLPnGIf
 hNDzh5RPww73ONyVphmRdsVjo7IzdMGYwyJrVQUPjNFS8kMwnB5qh0ClbPF5kwMDlPid
 TktW7FxsdXLhks1rJ16LwvoweWoHgpfeHnYlrojxXRCO/rqjLvGqF+iqqPg/PUmxM9Yd
 9SJA==
X-Gm-Message-State: AOAM530DHQiebaPNh+2mA/Xm12DGmW+6Yo8noBXJdbDzPyMJmzRkZKIa
 zYOztYxhXUOHGdjExQXfqCA=
X-Google-Smtp-Source: ABdhPJxI8mf5s31NTDN1WY8bxbF9UcB74iT11pxs7j4BTh/s6ILVHvnTTrZF83Ya9SCvYwPLhQbanQ==
X-Received: by 2002:a1c:4303:: with SMTP id q3mr5852377wma.3.1611784804925;
 Wed, 27 Jan 2021 14:00:04 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s19sm4964346wrf.72.2021.01.27.14.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 14:00:04 -0800 (PST)
Subject: Re: [PATCH 19/25] hw/timer/cmsdk-apb-dualtimer: Convert to use Clock
 input
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-20-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <867464b2-576c-588e-3890-a0a78d5dc710@amsat.org>
Date: Wed, 27 Jan 2021 23:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Switch the CMSDK APB dualtimer device over to using its Clock input;
> the pclk-frq property is now ignored.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/cmsdk-apb-dualtimer.c | 42 ++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 5 deletions(-)
...

> @@ -454,8 +486,8 @@ static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
>      CMSDKAPBDualTimer *s = CMSDK_APB_DUALTIMER(dev);
>      int i;
>  
> -    if (s->pclk_frq == 0) {
> -        error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
> +    if (!clock_has_source(s->timclk)) {
> +        error_setg(errp, "CMSDK APB dualtimer: TIMCLK clock must be connected");
>          return;
>      }
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

