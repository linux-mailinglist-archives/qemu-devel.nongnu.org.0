Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07A4659A21
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 16:44:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBHXd-0000uH-DD; Fri, 30 Dec 2022 10:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBHXb-0000s2-5c
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 10:43:27 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBHXZ-00021q-6G
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 10:43:26 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g10so1607859wmo.1
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 07:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m80Xl48AvNuUlY0gKwkHRMMfXe4ur38qDJmDxDx1KRk=;
 b=xXyiZIX3K72kMULDnCCXPkVrRDkVvwpZ4v1zG/SyJocjzPwXVHMsxUB34cvyEtLLAh
 cQUjjtdzBMoQpbIyjp8YroZtha+UuQ5w71HRqC6LhaWV6n8fhP639eyBDgrqEjOzYDcF
 Gdl/UVb7H2dhH9opruH/uCSY9IGIlycNYnehbdadKdwn7250tZiV5x6PZ6jF5dkzBcfa
 ULYiN3GHwTEE06e9EX/RDUL0zhujjzRLt7QqabkdWV2Lihs+fr6x2fl77Vsiq2ZvKZUM
 B+OGyT4/L+1OmkMZ4aVgqYerF+aSr1TiiaWhBV87rg/MuXK7hSpf2t2oxHoGx9yRxYSX
 wtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m80Xl48AvNuUlY0gKwkHRMMfXe4ur38qDJmDxDx1KRk=;
 b=YYjoZJYIPkpLkhEjpg3DqCjFx8LcAXikZTsoaA8nOiOcauqHJst8xXYNOZGIdXazkU
 Vvd99l+v1X/SQWbySsj/1Av6ERSfRbryqLv6KTuFDnqgIVRjTyuNL2HBIxCyu4RRwXSV
 0IAw4qnOx5V2ITs1aV7Te6MLZVdnUZrcOZQEI6euHqIC36jA30sAXt4sRmDLFAB4eqa9
 m+NABJM6mXjALWbtNzr1mqFkbP4ZVRz0gIdAOfvg5VDBS4yb9Fn0aTXmRSu0Loe7Pd4f
 p7MePVOzPV+lbN5FEkMTdOEeaLIV2Na4vgV9AFk1XN1vHQ92zWDqy1k9KSdbmkYqqN1b
 ocGw==
X-Gm-Message-State: AFqh2kqd0l4+p+ga4SvwEuLbqMUtm400rZI+o3qfD5Y3tD26AQHWap6C
 XLDyPSx/05IXBH3qhuwvV8cw1w==
X-Google-Smtp-Source: AMrXdXtV5I2NcPwO1WkPZjBts2PjGhX70nBP28Q4Z/OJ9IN3ioyTaAvfAuW1t1NkjVc4rZA2dSdzAg==
X-Received: by 2002:a05:600c:510e:b0:3d3:4406:8a2e with SMTP id
 o14-20020a05600c510e00b003d344068a2emr26005732wms.15.1672415002152; 
 Fri, 30 Dec 2022 07:43:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003d9980c5e7asm8323369wmq.21.2022.12.30.07.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 07:43:21 -0800 (PST)
Message-ID: <258e42aa-1c32-15ac-137b-3d328fcf5106@linaro.org>
Date: Fri, 30 Dec 2022 16:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/2] hw/arm: Add Olimex H405
Content-Language: en-US
To: Felipe Balbi <balbi@kernel.org>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221230145733.200496-1-balbi@kernel.org>
 <20221230145733.200496-3-balbi@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221230145733.200496-3-balbi@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 30/12/22 15:57, Felipe Balbi wrote:
> Olimex makes a series of low-cost STM32 boards. This commit introduces
> the minimum setup to support SMT32-H405. See [1] for details
> 
> [1] https://www.olimex.com/Products/ARM/ST/STM32-H405/
> 
> Signed-off-by: Felipe Balbi <balbi@kernel.org>
> ---
> 
> Changes since v1:
> 	- Add a note in stm32.rst
> 	- Initialize default_cpu_type to cortex-m4
> 	- 0-initialize default_ram_size
> 
>   MAINTAINERS                             |  6 +++
>   configs/devices/arm-softmmu/default.mak |  1 +
>   docs/system/arm/stm32.rst               |  1 +
>   hw/arm/Kconfig                          |  4 ++
>   hw/arm/meson.build                      |  1 +
>   hw/arm/olimex-stm32-h405.c              | 69 +++++++++++++++++++++++++
>   6 files changed, 82 insertions(+)
>   create mode 100644 hw/arm/olimex-stm32-h405.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


