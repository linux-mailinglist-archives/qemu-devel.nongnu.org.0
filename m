Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDB966D798
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHh1y-0003nP-RZ; Tue, 17 Jan 2023 03:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHh1j-0003LT-EB
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:09:07 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHh1g-0000Vb-HX
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:09:03 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r2so29692153wrv.7
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iQN4Xw9lU5M8JPxqVII6WbfWbqs8c4NOLi0YZsWhH0o=;
 b=O//LeEGS25gZbr+f7KjkHYro2JIHzmOc7rBH8kSr5yhKlZ/t7b5l0eEp2ZjVXXMckJ
 iZNtL8BYt5qGvGmedY0VAl5irndbaKrwxNLSTTh9Odkc2VJpNBYqvppwYV4m7HEYVC7i
 a0zKA/tPNO9DJZKN9A9yyXHIgqrR4N4RgAYwJIMxvq9Di62a1/G/dFUF/LDwKlk/gU6Z
 ScGT/x3Zg5CeR7PaQqcuoiyGfaGoMT6WrgTLqbS5fFqft6aB5sUOcZ57DXZhPqlB/X7i
 kBPmAymHYaHPW0ydNFip3VFHSqM7NBnk0Y+JJRqrrxHXmegvCImmSa2lbdSN0VXflQGt
 0yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iQN4Xw9lU5M8JPxqVII6WbfWbqs8c4NOLi0YZsWhH0o=;
 b=zr/2hk2mvJX5R5qb/kx2YIjaLZv7kceJEyYIN4DpV+uklJV7EmPXkpWkmc/EcjmvK6
 px9ruznI8OE+fMY6KrXpdV7mmUMPjpbHeq+x9P4H+xyJLGnz1GjCzTpB3xKFDXci+oBs
 k3+t/yYAer5J0XDLtQIRrM9NRZGC560ICQzmPv3PwuFyd0L6T5I2VskFeoawNyic583S
 FxSmHhEl/5SxCH7zJkHiEZ/fXmK9KmGqPbkYInIh5/14gopLXpo+XLVP4icRQp1fxOBa
 CvWpw6gbmcQ/Mh3ZA2mKoAIDZ6qdkDfcX+JnLljrouHS2BK+iasmhE40Y/FQ7/MOKCQM
 g+ww==
X-Gm-Message-State: AFqh2kqASKLkKv7jBebLKvKTeT/jsg3WFRJ4v8YinLgEA+Ub2qxLYbRR
 f6PmEu363az/mbe/47+RXFOqMw==
X-Google-Smtp-Source: AMrXdXszwPl5f9tV8twjcURbXVYZ5AEz52L/VgtRMQ93Cd7e+K12+Uz7w9uvn/jSWf75huIEp7oj9w==
X-Received: by 2002:adf:dc91:0:b0:2bc:83d5:6ea4 with SMTP id
 r17-20020adfdc91000000b002bc83d56ea4mr10163097wrj.65.1673942938934; 
 Tue, 17 Jan 2023 00:08:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j3-20020adfff83000000b002bddc1ac273sm11215943wrr.87.2023.01.17.00.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 00:08:58 -0800 (PST)
Message-ID: <ca4d0954-4d45-ea42-e1c1-efae62e30b1c@linaro.org>
Date: Tue, 17 Jan 2023 09:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/5] hw/arm/aspeed: Add aspeed_eeprom.c
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-5-peter@pjd.dev>
 <d494fe87-d083-cc64-867b-186852a120d7@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d494fe87-d083-cc64-867b-186852a120d7@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 17/1/23 08:39, Cédric Le Goater wrote:
> On 1/17/23 00:56, Peter Delevoryas wrote:
>> - Create aspeed_eeprom.c and aspeed_eeprom.h
>> - Include aspeed_eeprom.c in CONFIG_ASPEED meson source files
>> - Include aspeed_eeprom.h in aspeed.c
>> - Add fby35_bmc_fruid data
>> - Use new at24c_eeprom_init_rom helper to initialize BMC FRUID EEPROM 
>> with data
>>    from aspeed_eeprom.c
[...]

>> diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
>> new file mode 100644
>> index 000000000000..89860e37d007
>> --- /dev/null
>> +++ b/hw/arm/aspeed_eeprom.h
>> @@ -0,0 +1,11 @@
>> +/* Copyright (c) Meta Platforms, Inc. and affiliates. */

Missing license.

>> +#ifndef ASPEED_EEPROM_H
>> +#define ASPEED_EEPROM_H
>> +
>> +#include "qemu/osdep.h"
>> +
>> +extern const uint8_t fby35_bmc_fruid[];
> 
> 
> may be define the array with an explicit size to avoid the size variable ?
> I don't see any good solution.
  /* Return rom_size and set rombufptr, or return 0 */
  size_t aspeed_get_default_rom_content(const char *machine_typename,
                                        const void **rombufptr);

?

