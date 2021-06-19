Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1950B3ADAC2
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:54:51 +0200 (CEST)
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ludJ4-0005jG-4x
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ludHi-0004VH-RY; Sat, 19 Jun 2021 11:53:28 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ludHg-0005Z9-6t; Sat, 19 Jun 2021 11:53:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d11so11945819wrm.0;
 Sat, 19 Jun 2021 08:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sbh9+srkt2pARn/szBI/0NG+C8m94ttyGwLkbeCw6D4=;
 b=mqQxJumzsN3rk7/S+GlizYs2i7Qsx0hAGV9pr+GRCvhqelrcPJuwCc2YgzX8Ku5LCB
 zmSDuW/CYQ8aKDT1wrjarNA7dhkDZFXmdSy5uVBAhck8bhKBa58whXEQnMwli7znOkcf
 dHMeTxsVa3hHIdHcjFRps2WGegreF2glgPayHAE9loVK1rTDEDh0BqA7aUGICMbubxwu
 IUBYUQhwivLvXXY198iaXjgEIZ0ie3knxwN7E5UatTxfK9TCJjChGgLFBBbHVeGj8Pum
 l0tgnO+TGRuhS7pZ/nDuERbLgff31qnTnqMpKr/yFrSYbnxtdwxH+FaOceiaqqFVQk1g
 Tk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sbh9+srkt2pARn/szBI/0NG+C8m94ttyGwLkbeCw6D4=;
 b=BL6YTcshh2pkh7mFvDiFeGEbsR+fRqHizWYonA9Vv7wuDZNmfdXiu7pglN8YmHQ1SF
 +MJpePTgD6DDpVS7ZN2QxjsdRlqraZYBo+TUx/jWfzNyWfkSvHnIC6kKfpigz1CDJoyq
 WI0wIrCQEaFPec0l0IeEcrImhoJF2Sh6kn0L/4iLvXXrUCU3fBR6LTmAw8j2zF1Ge+Im
 or3J5pWfsqM2G3NDIu1+/1fTUKwIfwRFNYlZQFfmVg7Bs43re0agIk6hkWkLGVqao+1Z
 ZJ5bd1chuBzb/XMSY2KoX2c3wlr+siGSfhMrrV6KHc9zMS5oi+RRFhoKuslv0hXo1h1o
 T/Bw==
X-Gm-Message-State: AOAM530VibZFYAFuRfWigMqJ4FI9xhojWYhd2iCkIIbcblFK2smNUr2T
 9NaFBfU/SCLMv7T+1vSJACgfIVvGrhj+Mg==
X-Google-Smtp-Source: ABdhPJw/WdQ5jb/ce1sVRcIFzbuD+JsqlGg6ZKsmIFkA26LOucgPAbf/FR96wIvBEZbmzagoYeiKcw==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr19098705wri.66.1624118002380; 
 Sat, 19 Jun 2021 08:53:22 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w13sm10486340wmi.48.2021.06.19.08.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 08:53:21 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] STM32VLDISCOVERY Machine Model
To: Alexandre Iooss <erdnaxe@crans.org>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
References: <20210617165647.2575955-1-erdnaxe@crans.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1227b1c6-2379-6130-450c-6bb440b6fa24@amsat.org>
Date: Sat, 19 Jun 2021 17:53:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617165647.2575955-1-erdnaxe@crans.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 "open list : STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Joaquín

On 6/17/21 6:56 PM, Alexandre Iooss wrote:
> This patch series adds the STM32VLDISCOVERY Machine to QEMU
> 
> Information on the board is available at:
> https://www.st.com/en/evaluation-tools/stm32vldiscovery.html
> 
> v3:
>  - Add test for STM32VLDISCOVERY USART1
> 
> v2:
>  - Add documentation of STM32 boards
>  - Fixed number of interrupts
>  - Fixed Cortex-M3 name
> 
> Alexandre Iooss (4):
>   stm32f100: Add the stm32f100 SoC
>   stm32vldiscovery: Add the STM32VLDISCOVERY Machine
>   docs/system: arm: Add stm32 boards description
>   tests/boot-serial-test: Add STM32VLDISCOVERY board testcase
> 
>  MAINTAINERS                             |  13 ++
>  default-configs/devices/arm-softmmu.mak |   1 +
>  docs/system/arm/stm32.rst               |  66 +++++++++
>  docs/system/target-arm.rst              |   1 +
>  hw/arm/Kconfig                          |  10 ++
>  hw/arm/meson.build                      |   2 +
>  hw/arm/stm32f100_soc.c                  | 182 ++++++++++++++++++++++++
>  hw/arm/stm32vldiscovery.c               |  66 +++++++++
>  include/hw/arm/stm32f100_soc.h          |  57 ++++++++
>  tests/qtest/boot-serial-test.c          |  37 +++++
>  10 files changed, 435 insertions(+)
>  create mode 100644 docs/system/arm/stm32.rst
>  create mode 100644 hw/arm/stm32f100_soc.c
>  create mode 100644 hw/arm/stm32vldiscovery.c
>  create mode 100644 include/hw/arm/stm32f100_soc.h
> 

