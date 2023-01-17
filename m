Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A311966D765
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:01:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHgtn-0000Jb-Vk; Tue, 17 Jan 2023 03:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHgtd-0000Ay-8y
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:00:42 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHgta-0007zB-TA
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:00:40 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so4191897wml.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FbaD7T1wl5LUv3rQOnBXlbzGgPRsgbyZv+c1yBKtxYQ=;
 b=q6vxxe1PT/Ggu+GTw4QJQXCvQWUlAnusSnziYFKZlHW7NdUUkjXAKW+tbRjMvX2pd6
 e0ZnK8cZeHNY0fQjdSHXtK7Q6jzM7LRlYYXTGIdZmcn4EwIydWm3kgjNpq5WURP/V2ut
 ld+n9b/EcXunhYXIjGf5BC5QESwgDdKISX6Z6ZSzvuJ0WL0c89yx0W1+N10f0fQmZN9u
 aeWPqryljHTTExCn33MLnR91K5uR72NTPnFEFhRG3JrFKe74ChvgG+5zpUGZ/Xd8rX3/
 bpjR8vkaJvSZF1/aSmEO0FCuW7qg2+Cmnj3SQMy4Bs1S4MUEV0idS7aiRXtwRnsDU+Be
 Zfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FbaD7T1wl5LUv3rQOnBXlbzGgPRsgbyZv+c1yBKtxYQ=;
 b=d7ZIKqSJ2/3bNpjdtvp4zjsSL9Ks8qc8oMzs1Cgzsdivvbrg70meO44g3AoJdHUUht
 nr2cL1u6pF1Ix0nAGLYOUFuFdtOdHK5nnNYTwHsOyLKnP390l1W9KXdaLt/d73niLl5r
 wLeefJRZIN+KN/JWv9XCaIzCmaVzo5kHwUa5xEIQmSURdw0JIZhBtxi0kdNxs7MSETEv
 yw2APSPJ8OwKTymabWyVCCTSM1bqX7g+OevicbokYIH641N/NIrRl0j7Bk5a9ffjQhCL
 tscShfpZZnNjkk113h6PbSLTwKfoLrFHrUR4fBp8gdCAXM6Jyo4IybUBWK96YXZYOpNb
 qBCg==
X-Gm-Message-State: AFqh2kpjDT2AIBfV4dVoTbxaHy5Ocmv+ofd0V8CeHKoP2qrT3x/oAYeT
 zO8pvfpnkIFSRGJSzDixBUBGqQ==
X-Google-Smtp-Source: AMrXdXv4iIKJ7dhZWC4SwBz5O0tDe1iCZJkW2+t7wlcVrFH8vNqEofKXL+qTMDSOWL5+ENTq2mn2Mg==
X-Received: by 2002:a05:600c:3ca6:b0:3d1:caf1:3f56 with SMTP id
 bg38-20020a05600c3ca600b003d1caf13f56mr10963956wmb.9.1673942436018; 
 Tue, 17 Jan 2023 00:00:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b003dafbd859a6sm6035993wms.43.2023.01.17.00.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 00:00:35 -0800 (PST)
Message-ID: <961515e6-65ad-ec7f-f51e-a862424f574d@linaro.org>
Date: Tue, 17 Jan 2023 09:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/5] hw/arm: Extract at24c_eeprom_init helper from
 Aspeed and Nuvoton boards
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-2-peter@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230116235604.55099-2-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/1/23 00:56, Peter Delevoryas wrote:
> This helper is useful in board initialization because lets users initialize and
> realize an EEPROM on an I2C bus with a single function call.
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/arm/aspeed.c                 | 10 +---------
>   hw/arm/npcm7xx_boards.c         | 20 +++++---------------
>   hw/nvram/eeprom_at24c.c         | 12 ++++++++++++
>   include/hw/nvram/eeprom_at24c.h | 10 ++++++++++
>   4 files changed, 28 insertions(+), 24 deletions(-)
>   create mode 100644 include/hw/nvram/eeprom_at24c.h

> diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> new file mode 100644
> index 000000000000..79a36b53ca87
> --- /dev/null
> +++ b/include/hw/nvram/eeprom_at24c.h
> @@ -0,0 +1,10 @@
> +/* Copyright (c) Meta Platforms, Inc. and affiliates. */

What license for this copyright?

> +#ifndef EEPROM_AT24C_H
> +#define EEPROM_AT24C_H
> +
> +#include "hw/i2c/i2c.h"

  /**
   * Create and realize an AT24C EEPROM device on the heap.
   * @bus: I2C bus to put it on
   * @addr: I2C address of the EEPROM slave when put on a bus
   * @rom_size: size of the EEPROM
   *
   * Create the device state structure, initialize it, put it on
   * the specified @bus, and drop the reference to it (the device
   * is realized).
   */
  I2CSlave *at24c_eeprom_create_simple(I2CBus *bus, uint8_t addr,
                                       size_t rom_size);

> +I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
> +
> +#endif


