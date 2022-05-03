Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEE4518942
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:03:52 +0200 (CEST)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlv0B-0005j3-77
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluvG-00031M-BO
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:58:47 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluvE-0001j7-IY
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:58:46 -0400
Received: by mail-pf1-x434.google.com with SMTP id g8so12658355pfh.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=acCMj7lJQCHh3LpulGNebbMVX2arzLXWkrGtPvynfqg=;
 b=gyTsiOUY8JeZ5Em2AN7T0Hy/QvsYqBGzIklbHejjXZWmhG3hBn0AkUOS6bhkJfPQYa
 TQ3Z6fsLS576Fug21Il0T/145AOnqcIFIDmV8NNiwMErqxbS3njdcUUvB5bhwU7JvU3D
 hjVrtQB1RNz1w415jQSe+TujMFCePImi2Lpz9VbLh62ldbrkd+LBAZ3mItCbAsK5AfJX
 pn+Et0PVqKNrLO0MOur6ocpzqxw0jL/M9CTQ0vdxztxFRaDjabHOmmC6YDfZRnFNWbTB
 Gu3dK9G8/a2koqf/Xg34tKSLMS4IsB620x+Fu1OqKcdnSNycb9Lkkbrkj1dkuWFqoFpH
 Xv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=acCMj7lJQCHh3LpulGNebbMVX2arzLXWkrGtPvynfqg=;
 b=BiN/+C1PdzP/HVJ7qWPOztVtpDrABtbfvC5tcYmgrmTWyRIXR8IcM8WkuTx04OA6HX
 IAev+YZXeFTPFX+3LBqvfllGyfbTpIz4CziEkFh6Ew6sC9t+TaUfVVed5aSKXxCiMLMq
 IVb/eWOkzQm/XsZJgBfZhiDliSPXvBWYY8NY/r10ROX30UUDPLc5ZFJQx1oe9T94Bk3w
 Xko5/tPIVFKiVH+aMT/FeR4BZe7drNZmAJLySudCsXvGG3PhKuOVUWHDrxCC9aIJ+Dyd
 fcVcPWGn/O5yjixr60wmnhrSFN8EDFgSvpjoHJkgHqkO5RkSeOl37aF2WbL0WE0y9mzT
 BF2Q==
X-Gm-Message-State: AOAM531nqP3ar/1hh/AfWBv+CzIzdsNlsdx4t1dXeIm97iAAMwT8U920
 91uHI5QamSmKEB5hatRr7AKH8g==
X-Google-Smtp-Source: ABdhPJwGsmJCti3BxqJzylsRd38GVHn9tseXfLcdId67rLYuknMLIxCXjgtDyP0t02ePMbzPyUZY1g==
X-Received: by 2002:a63:4004:0:b0:39d:8634:fff2 with SMTP id
 n4-20020a634004000000b0039d8634fff2mr14104221pga.28.1651593522907; 
 Tue, 03 May 2022 08:58:42 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a170902c7d100b0015eab1ad02esm3224641pla.215.2022.05.03.08.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:58:42 -0700 (PDT)
Message-ID: <f585a5ca-b38d-8531-b05f-2f9cfb87d592@linaro.org>
Date: Tue, 3 May 2022 08:58:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/19] aspeed queue
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220503065848.125215-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 5/2/22 23:58, Cédric Le Goater wrote:
> The following changes since commit f5643914a9e8f79c606a76e6a9d7ea82a3fc3e65:
> 
>    Merge tag 'pull-9p-20220501' of https://github.com/cschoenebeck/qemu into staging (2022-05-01 07:48:11 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220503
> 
> for you to fetch changes up to e056c52233910ef156e6d790ce41b33cd838bad6:
> 
>    aspeed/hace: Support AST1030 HACE (2022-05-03 07:17:20 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * New AST1030 SoC and eval board
> * Accumulative mode support for HACE controller
> * GPIO fix and unit test
> * Clock modeling adjustments for the AST2600
> * Dummy eMMC Boot Controller model
> * Change of AST2500 EVB and AST2600 EVB flash model (for quad IO)

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Jae Hyun Yoo (1):
>        hw/arm/aspeed: fix AST2500/AST2600 EVB fmc model
> 
> Jamin Lin (2):
>        aspeed: Add an AST1030 eval board
>        test/avocado/machine_aspeed.py: Add ast1030 test case
> 
> Joel Stanley (2):
>        aspeed: sbc: Correct default reset values
>        aspeed: Add eMMC Boot Controller stub
> 
> Peter Delevoryas (1):
>        hw/gpio/aspeed_gpio: Fix QOM pin property
> 
> Steven Lee (13):
>        hw: aspeed_scu: Add AST2600 apb_freq and hpll calculation function
>        hw: aspeed_scu: Introduce clkin_25Mhz attribute
>        aspeed/adc: Add AST1030 support
>        aspeed/smc: Add AST1030 support
>        aspeed/wdt: Fix ast2500/ast2600 default reload value
>        aspeed/wdt: Add AST1030 support
>        aspeed/timer: Add AST1030 support
>        aspeed/scu: Add AST1030 support
>        aspeed/soc : Add AST1030 support
>        aspeed/hace: Support HMAC Key Buffer register.
>        aspeed/hace: Support AST2600 HACE
>        tests/qtest: Add test for Aspeed HACE accumulative mode
>        aspeed/hace: Support AST1030 HACE
> 
>   include/hw/adc/aspeed_adc.h      |   1 +
>   include/hw/arm/aspeed_soc.h      |   4 +
>   include/hw/misc/aspeed_hace.h    |   7 +
>   include/hw/misc/aspeed_scu.h     |  45 ++++++
>   include/hw/timer/aspeed_timer.h  |   1 +
>   include/hw/watchdog/wdt_aspeed.h |   3 +
>   hw/adc/aspeed_adc.c              |  16 +++
>   hw/arm/aspeed.c                  |  70 ++++++++-
>   hw/arm/aspeed_ast10x0.c          | 299 +++++++++++++++++++++++++++++++++++++++
>   hw/arm/aspeed_ast2600.c          |   6 +
>   hw/gpio/aspeed_gpio.c            |   2 +-
>   hw/misc/aspeed_hace.c            | 159 ++++++++++++++++++++-
>   hw/misc/aspeed_sbc.c             |   7 +-
>   hw/misc/aspeed_scu.c             | 108 +++++++++++++-
>   hw/ssi/aspeed_smc.c              | 157 ++++++++++++++++++++
>   hw/timer/aspeed_timer.c          |  17 +++
>   hw/watchdog/wdt_aspeed.c         |  34 ++++-
>   tests/qtest/aspeed_gpio-test.c   |  87 ++++++++++++
>   tests/qtest/aspeed_hace-test.c   | 147 +++++++++++++++++++
>   hw/arm/meson.build               |   6 +-
>   tests/avocado/machine_aspeed.py  |  36 +++++
>   tests/qtest/meson.build          |   3 +-
>   22 files changed, 1199 insertions(+), 16 deletions(-)
>   create mode 100644 hw/arm/aspeed_ast10x0.c
>   create mode 100644 tests/qtest/aspeed_gpio-test.c
>   create mode 100644 tests/avocado/machine_aspeed.py
> 


