Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B18E3AA810
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 02:24:35 +0200 (CEST)
Received: from localhost ([::1]:51166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltfpi-0007AX-DC
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 20:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltfoc-0005iE-BE
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 20:23:26 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltfoZ-0006f4-Jx
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 20:23:26 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so5057041pjs.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 17:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jvyle/Pmz2XGVlT0IHRNBLcwn+v2I26cnlJMxyRy9x4=;
 b=fMfTRhiCmcYgr5c/mKBFHtB3C9x0bVblIpbAw272IKuBQooNT2AeBcafh/L+Y3MUsC
 jV3cMgPNore1e6X8Azb7QRsSaRsn1FrdWfaNJrKHiDeE3tR0PL3DAG76Mldnn7WBlOWA
 LISqaxySs+0buonWghi0eRyH7ArJgCyZkQNwsluW5lnSmcQtaklL5hgjLlyOm+F15Qy5
 1hQeobf0LOCiQTpPAl2xIq/fQc2E4YQwrXKE0X8nUMWmKAe8K9Un3ygKLmcH252wQTlt
 75R7Eyi0+C4rIH317UwlGGi3J0S1ndFNg2hPh1ylNWaJWGR7roCqT/SWbs/aI7lNxJn5
 7Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jvyle/Pmz2XGVlT0IHRNBLcwn+v2I26cnlJMxyRy9x4=;
 b=TjFvo9NBe/mLg/JzEu3BEbos50xYpAe6mFFgW0bxsIXQlOvuUChQbC4WmxW+gqzlFu
 K7vbst1JunBwyyizYc/kzdZ1CTmRTO7HJM4icMueqaxly4/FAZpUfPAUdUBAKxM1fzbe
 dGXajX8YRpG3yoAmckql9VbgHidhdveTvDZIUGWwQX///9sZsRwnOQtH4p7DcXyT9VdW
 zpdvj9N4rVnVyIDeTWFMDYx5UDrYHnvIIYNMz7a+LqXA+kviOGwXBGXUVeFhuakotwJ0
 CioGfN6L60Tlhh+RNA65tociK/hA5mjJT2upzDNgqJP9Z7PaRb3wRyxjD0Nze/9mdADE
 s8Pg==
X-Gm-Message-State: AOAM531Da9QIik/+pGtSgIM4Xe/FSVthDhvoBA+dDH1uvdpjoM+4sElK
 Mmpbqhq3cNxn1qxxfq8xsKsAOA==
X-Google-Smtp-Source: ABdhPJwus6AgwZ8B932rPfBg9VXdOoPnP2JF9hvOby8SNiruqpSCsa7XGLcCV1Gok1x6gBmRDAvhgw==
X-Received: by 2002:a17:902:da91:b029:116:864e:893b with SMTP id
 j17-20020a170902da91b0290116864e893bmr2001991plx.26.1623889401864; 
 Wed, 16 Jun 2021 17:23:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k19sm3138128pji.32.2021.06.16.17.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 17:23:21 -0700 (PDT)
Subject: Re: [PATCH v4 15/15] hw/i2c: Introduce i2c_start_recv() and
 i2c_start_send()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616214254.2647796-1-f4bug@amsat.org>
 <20210616214254.2647796-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ecc2bf57-82fa-a49e-ae5c-740c7538ccad@linaro.org>
Date: Wed, 16 Jun 2021 17:23:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616214254.2647796-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 2:42 PM, Philippe Mathieu-Daudé wrote:
> To ease reviewing code using the I2C bus API, introduce the
> i2c_start_recv() and i2c_start_send() helpers which don't
> take the confusing 'is_recv' boolean argument.
> 
> Use these new helpers in the SMBus / AUX bus models.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/i2c/i2c.h  | 24 ++++++++++++++++++++++++
>   hw/i2c/core.c         | 10 ++++++++++
>   hw/i2c/pm_smbus.c     |  4 ++--
>   hw/i2c/smbus_master.c | 22 +++++++++++-----------
>   hw/misc/auxbus.c      | 12 ++++++------
>   5 files changed, 53 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

