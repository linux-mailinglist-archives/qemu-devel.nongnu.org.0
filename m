Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45E168E94B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 08:48:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPfBy-0007fM-Uk; Wed, 08 Feb 2023 02:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPfBn-0007e2-1q
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:48:23 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPfBj-0001Ul-Gc
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:48:22 -0500
Received: by mail-wr1-x42d.google.com with SMTP id g6so7842353wrv.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 23:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=973B75KVpwOBvGxnARcFvTejJyYtnXD8dmyuUJivTbw=;
 b=ei15mCw7nM1mqV/SegXES3S9Ec0RAdV4pkDCc2gfG+bVYfCoOvn9/Xd1n57itCjJ7P
 q6c1aFl8FgLrSBWsQfZJc6JvWD75ZkijrcFG6gRdO5+6bJuLYpW1nN1EGRG8pnpmFiwi
 4uW2CUOhOI1s+ziKYnc5YYQe6/d1ei3pwqL1SJu03Dd4GENxvecvXLCtrrY3J6nFGlEX
 QZ/r6KWbdUq8WDAQKSFqLAtS/DjqZqJATGzHqoQhhaFQX2DgbymsnuSTbgQpPUTk4cFg
 Z1rkZ3pGvPB4gKHI7XhaagvQBXIMJjHy9+h8D1qW+Irr8sWD0GHkP0zt2bQr710FNMMF
 0e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=973B75KVpwOBvGxnARcFvTejJyYtnXD8dmyuUJivTbw=;
 b=e8YKFY1ORcDox7SgG/Kb8NHfRBvAoM48Bj8K/phKDjQ6GPVS50ST9cqwwvPGXD2Jnf
 AFvAJ9swjiHT5pSNcw6r7st76bRoPqk04YJLMUAZjkuZHh+P7pGcXs3b73CoEz8WXVEs
 RFiGsMjewNdfyec2QEx9B34chz8oF6sj+l2xhQGf61Hn8A85Kiw4zEL5qF/s20RtYY1e
 P0UkG7aYnm+TTqPytsb0Ot2M9Kg4L5msjTPT0f57+Y+enkIfFZJ/350D5jQWu2888azM
 ao5wlcRKqkO6+psOCU8tGIbdg6g3ddLmn4foker8vuQZHcb2ohWw2RzkM5e93Xf3hKh9
 tvgg==
X-Gm-Message-State: AO0yUKVyIwiPNBXjWf4Ddy9hHFWoN72uHni6JxJqx9pCFSzD2mO/kpCb
 FY6eEyD2KfdaIPEXtek3Fow9QA==
X-Google-Smtp-Source: AK7set+L7RAYXTXK4pdoSD99L2COXzdDUocFv94sI+dmv8JnAVhZpHT87rTHHrGeQe0kZyorKv2PFw==
X-Received: by 2002:adf:fac5:0:b0:2bf:b080:77ea with SMTP id
 a5-20020adffac5000000b002bfb08077eamr5444346wrs.9.1675842496161; 
 Tue, 07 Feb 2023 23:48:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c314700b003dc59d6f2f8sm1129318wmo.17.2023.02.07.23.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 23:48:15 -0800 (PST)
Message-ID: <ce5472bb-253b-5b8b-7a79-dbd6717af16b@linaro.org>
Date: Wed, 8 Feb 2023 08:48:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] hw/ssi: Add Nuvoton PSPI Module
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com, Chris Rauer <crauer@google.com>
References: <20230207194556.3262708-1-wuhaotsh@google.com>
 <20230207194556.3262708-3-wuhaotsh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207194556.3262708-3-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 7/2/23 20:45, Hao Wu wrote:
> Nuvoton's PSPI is a general purpose SPI module which enables
> connections to SPI-based peripheral devices.
> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Philippe Mathieu-Daude <philmd@linaro.org>
> ---
>   MAINTAINERS                |   6 +-
>   hw/ssi/meson.build         |   2 +-
>   hw/ssi/npcm_pspi.c         | 221 +++++++++++++++++++++++++++++++++++++
>   hw/ssi/trace-events        |   5 +
>   include/hw/ssi/npcm_pspi.h |  53 +++++++++
>   5 files changed, 283 insertions(+), 4 deletions(-)
>   create mode 100644 hw/ssi/npcm_pspi.c
>   create mode 100644 include/hw/ssi/npcm_pspi.h


> +static const MemoryRegionOps npcm_pspi_ctrl_ops = {
> +    .read = npcm_pspi_ctrl_read,
> +    .write = npcm_pspi_ctrl_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,

You said in v1 "The datasheet suggests it's either 8-bit or
16-bit accesses.", so we want max_access_size = 2 here, right?

> +        .unaligned = false,
> +    },
> +    .impl = {
> +        .min_access_size = 2,
> +        .max_access_size = 2,
> +        .unaligned = false,
> +    },
> +};



