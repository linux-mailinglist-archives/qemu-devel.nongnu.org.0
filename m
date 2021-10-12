Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED90242A55A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:19:49 +0200 (CEST)
Received: from localhost ([::1]:51268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maHh6-0007HJ-QS
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maHdM-0002ZL-Ds
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:16:00 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maHdF-00073R-Q3
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:15:56 -0400
Received: by mail-pf1-x430.google.com with SMTP id m14so17557352pfc.9
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 06:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0z6JDl0dpDKiHhytDpsiH/NbZQb5fPTigeWUlHBas/A=;
 b=f3N/hrBVeZ99c14gTreuzlR28+PFf6vMWZBcJLHUtd+9FJJRBwum9b3cZSxiWvGHjb
 3f41MWFVIrE7/vTN5dDu+hNecErH6+V7GlS9ntbVZVxX902nS/HoFfADBPcKG7AwdqNq
 cyqWbR/SE0pw4lxMje/dT0jU47O5uBu6cHSy6yS7AC+khluHwp427FgJgpTIeN4XX3zS
 t1zry8YkUWmxDRkfhF78dGyhBnmf4JbyF7Te/S7nF4eloy8/qyBO0p9AE18Zd8EdoLcn
 qK1FTqc00Ng5w1xtzH7H9JMahv1JxvPLrC9rtMLhO+XWb2/Qfur6cw0JleuZWu+PWD6w
 H3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0z6JDl0dpDKiHhytDpsiH/NbZQb5fPTigeWUlHBas/A=;
 b=vZMGjC+2dG1A1hocTONUsHfRjLphBCgznpErOOrTnqxCIa/rtAqjQfFYiTN9upN0QX
 qofWcoJ27hICAfEpRoZ+kjXQEUgWfN7Ucp3HVQE6xPsqZsOXDenCXm4j0MqL+KX0lAZZ
 Zak/2J8I5660qsCrtn5sZKld2Dyw12JWnEko9g71mVBqB+sFAt2sjN1ZcPEKMVX32kKQ
 iwiXZ8/v7R4otqbFq/cRklK5gXLyYVggAl2r/HVvw0Jtr+m2z8cezTekrRnMOb2Rvt5L
 T0cM3vLXP0ozEXG1o9VtjbUlk6a5ELI2Wqn8YroKRoGOD4cn5IxreZS9ytPA8vHFfFvx
 GoIw==
X-Gm-Message-State: AOAM530mN5398ugJA7cx1N8xfr9qNDDjxCje3Kpt8fqbvfnrnOKLa3kf
 ElKU/n95Z0Jc5wbOpiX3G2dh3bElCav2OQ==
X-Google-Smtp-Source: ABdhPJzGtPHMHBd/uqG1ywRdgdxU15UBb43cYtusSnHs8GW5TSm/+HJVl4FdhMlU/jYRl6Nlnm0qbg==
X-Received: by 2002:aa7:8891:0:b0:44d:a66:2f1b with SMTP id
 z17-20020aa78891000000b0044d0a662f1bmr15350611pfe.22.1634044547997; 
 Tue, 12 Oct 2021 06:15:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s8sm2827105pjm.32.2021.10.12.06.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 06:15:47 -0700 (PDT)
Subject: Re: [PULL 00/18] aspeed queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211012073728.257748-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4d33ddf-cf48-3a2e-e135-26584f6452d3@linaro.org>
Date: Tue, 12 Oct 2021 06:15:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012073728.257748-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 12:37 AM, Cédric Le Goater wrote:
> The following changes since commit c09124dcb8401a0d635b4a52b295e9b3fc12392a:
> 
>    Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2021-10-11 08:15:32 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20211012
> 
> for you to fetch changes up to e2804a1ec97ceede14b69a2a6e9a8b5dfa0b15c2:
> 
>    aspeed/smc: Dump address offset in trace events (2021-10-12 08:20:08 +0200)
> 
> ----------------------------------------------------------------
> Aspeed patches :
> 
> * I2C QOMify (Cedric)
> * SMC model cleanup and QOMify (Cedric)
> * ADC model (Peter and Andrew)
> * GPIO fixes (Peter)
> 
> ----------------------------------------------------------------
> Andrew Jeffery (2):
>        hw/adc: Add basic Aspeed ADC model
>        hw/arm: Integrate ADC model into Aspeed SoC
> 
> Cédric Le Goater (14):
>        aspeed/smc: Add watchdog Control/Status Registers
>        aspeed/smc: Introduce aspeed_smc_error() helper
>        aspeed/smc: Stop using the model name for the memory regions
>        aspeed/smc: Drop AspeedSMCController structure
>        aspeed/smc: Remove the 'flash' attribute from AspeedSMCFlash
>        aspeed/smc: Remove the 'size' attribute from AspeedSMCFlash
>        aspeed/smc: Rename AspeedSMCFlash 'id' to 'cs'
>        aspeed/smc: QOMify AspeedSMCFlash
>        aspeed/smc: Add default reset values
>        aspeed/smc: Introduce a new addr_width() class handler
>        aspeed/smc: Remove unused attribute 'irqline'
>        aspeed/i2c: QOMify AspeedI2CBus
>        aspeed/wdt: Add trace events
>        aspeed/smc: Dump address offset in trace events
> 
> Peter Delevoryas (2):
>        hw: aspeed_gpio: Fix pin I/O type declarations
>        hw: aspeed_gpio: Fix GPIO array indexing
> 
>   include/hw/adc/aspeed_adc.h   |   55 ++
>   include/hw/arm/aspeed_soc.h   |    2 +
>   include/hw/gpio/aspeed_gpio.h |    5 +-
>   include/hw/i2c/aspeed_i2c.h   |    8 +-
>   include/hw/ssi/aspeed_smc.h   |   82 ++-
>   hw/adc/aspeed_adc.c           |  427 ++++++++++++++++
>   hw/arm/aspeed.c               |   18 +-
>   hw/arm/aspeed_ast2600.c       |   22 +-
>   hw/arm/aspeed_soc.c           |   15 +-
>   hw/gpio/aspeed_gpio.c         |   88 ++--
>   hw/i2c/aspeed_i2c.c           |  101 +++-
>   hw/ssi/aspeed_smc.c           | 1134 +++++++++++++++++++++++------------------
>   hw/watchdog/wdt_aspeed.c      |    5 +
>   hw/adc/meson.build            |    1 +
>   hw/adc/trace-events           |    3 +
>   hw/watchdog/trace-events      |    4 +
>   16 files changed, 1352 insertions(+), 618 deletions(-)
>   create mode 100644 include/hw/adc/aspeed_adc.h
>   create mode 100644 hw/adc/aspeed_adc.c

Applied, thanks.

r~

