Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C16534531
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 22:47:48 +0200 (CEST)
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntxv0-0005mU-Up
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 16:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntxs8-0004ZP-FY
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:44:49 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntxs6-0006N6-9M
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:44:47 -0400
Received: by mail-pf1-x430.google.com with SMTP id bo5so20234899pfb.4
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 13:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=C+AHWhvrxtlTirVHdpnFVckkGQ08Su9qwAAjqNyefQk=;
 b=E8850heQE7zxbr0orWGO+Z3vpkL3VoY7bKGKGeQa7LjlEnwSYf2ZBVc5lfWOBQiPpi
 babmqbJky7np//uzF/AGA4LERd2hDWW1/S9JXvmuusHVE15e8GnRqj/mdzfY4p2yFbQy
 weH2om8nyMA8Ek0YTsSTwCvAFKQSYFNfpkFZeEnJ7csFeKVnnT+HsuUmuFBYcNpWSb7O
 JNdJzCaeIzrA5dKLXl2+hqu4jdPNXm+Ygax2PRXt+2+kewRFO851M4mMdSD1zgokSSnA
 8o8Y+CcOEy7VMA2SkPkAYp02SuwQZ1eDir/GI4BxuF0zZ65RcPVpygb/cGhTBx8s2ORK
 zESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C+AHWhvrxtlTirVHdpnFVckkGQ08Su9qwAAjqNyefQk=;
 b=6u6fZzfp4q/XlXyr9m+FiWbX/T052KvGX+p9cYoj70lEmeF+ut/+xy0nGYNKJMSlGB
 64ZZw9BxMvxYrSqCq0fc4D2ZvvsGg27A3WO0tqILA0/O34hEN2H8kPfgostCF0hZuWnC
 v1isj35Z9HTGwlR03Pqrhiww1SJnRrFK5G5Vucsf3L+wV74JFBP9Y9iBWZMjZP2rqFEW
 zCP9vfZazUkZ9b6AcOe3bnx7nzEesreNFVq4uP594YOBqIqORX7Kw6FZtTLuy7VpXQ0o
 BZvrFTBcHpsabBmWN98yrsoVbRBONW6OxLexfBecFxFaBHkAV/ZV0DWN42d5RNAyASrv
 JogA==
X-Gm-Message-State: AOAM531Eu6K9X9aNuIvXGVL4XG2dmmMrwhlTPpANy5wxF9b5C0OaitES
 VUjtD7Z6d+b0wpuCblkd3/EZew==
X-Google-Smtp-Source: ABdhPJw/oO5idpsNgIEL17qm+lgA8pCNddLoa9AMWzumhcewV7/qJDINnxf69gGjg5WTz8GC1ewUKA==
X-Received: by 2002:a63:8ac3:0:b0:3fa:e447:ec3 with SMTP id
 y186-20020a638ac3000000b003fae4470ec3mr3647036pgd.606.1653511484732; 
 Wed, 25 May 2022 13:44:44 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 l184-20020a6391c1000000b003fadfd7be5asm1766854pge.18.2022.05.25.13.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 13:44:44 -0700 (PDT)
Message-ID: <cb16fb54-80dd-7c02-d836-4c44173d2c1f@linaro.org>
Date: Wed, 25 May 2022 13:44:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/15] aspeed queue
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220525160136.556277-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 5/25/22 09:01, Cédric Le Goater wrote:
> The following changes since commit 3757b0d08b399c609954cf57f273b1167e5d7a8d:
> 
>    Merge tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu into staging (2022-05-20 08:04:30 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220525
> 
> for you to fetch changes up to 52bcd997800fab67d57bea6d93e368f6f7a93b24:
> 
>    hw/arm/aspeed: Add i2c devices for AST2600 EVB (2022-05-25 16:22:37 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Aspeed GPIO model extensions
> * GPIO support for the Aspeed AST1030 SoC
> * New fby35 machine (AST2600 based)
> * Extra unit tests for the GPIO and SMC models
> * Initialization of all UART with serial devices
> * AST2600 EVB and Documentation update

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Cédric Le Goater (1):
>        aspeed: Introduce a get_irq AspeedSoCClass method
> 
> Howard Chiu (1):
>        hw/arm/aspeed: Add i2c devices for AST2600 EVB
> 
> Iris Chen (1):
>        hw: m25p80: allow write_enable latch get/set
> 
> Jamin Lin (5):
>        docs: add minibmc section in aspeed document
>        hw/gpio Add GPIO read/write trace event.
>        hw/gpio: Add ASPEED GPIO model for AST1030
>        hw/gpio support GPIO index mode for write operation.
>        hw/gpio: replace HWADDR_PRIx with PRIx64
> 
> Peter Delevoryas (7):
>        hw/arm/aspeed: Add fby35 machine type
>        docs: aspeed: Add fby35 board
>        hw: aspeed: Add missing UART's
>        hw: aspeed: Add uarts_num SoC attribute
>        hw: aspeed: Ensure AST1030 respects uart-default
>        hw: aspeed: Introduce common UART init function
>        hw: aspeed: Init all UART's with serial devices
> 
>   docs/system/arm/aspeed.rst     |  62 ++++++++++
>   include/hw/arm/aspeed_soc.h    |  13 +++
>   include/hw/gpio/aspeed_gpio.h  |  16 ++-
>   tests/qtest/libqtest.h         |  22 ++++
>   hw/arm/aspeed.c                |  74 +++++++++++-
>   hw/arm/aspeed_ast10x0.c        |  48 ++++++--
>   hw/arm/aspeed_ast2600.c        |  32 +++--
>   hw/arm/aspeed_soc.c            |  46 ++++++--
>   hw/block/m25p80.c              |   1 +
>   hw/gpio/aspeed_gpio.c          | 257 ++++++++++++++++++++++++++++++++++++++---
>   tests/qtest/aspeed_gpio-test.c |  40 ++-----
>   tests/qtest/aspeed_smc-test.c  |  43 +++++++
>   tests/qtest/libqtest.c         |  24 ++++
>   hw/gpio/trace-events           |   4 +
>   14 files changed, 607 insertions(+), 75 deletions(-)
> 


