Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFCE68AF95
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:49:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOdVk-0002gB-Ng; Sun, 05 Feb 2023 06:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOdVh-0002ff-ML
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:48:41 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOdVT-0008GM-Fy
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:48:39 -0500
Received: by mail-ed1-x532.google.com with SMTP id fi26so9098498edb.7
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 03:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ndyd0vylg7hbf5nsTI+JENriLkRdS38Rny/WxSr8Iic=;
 b=MaMMN6VTJ8aSQ3SHyLwuKzxFrremk1gyWfs+zlcENArkc28/rMQFQ0advs4R8ZeSlB
 004Dpz4DBJ8hqdFJ2eXCxkciYy4AewxXkhV+x/AwWK0Z+09zqSVNIWVQXBv+PGvHR8TR
 Zujm27yr4qzIePIx+MvzqIqDqarSwoJX5PEcUJnYspaZ580b2F9/QguWmNG3avpMgqrj
 3b7MTUBg5W+7oe0y+1cQ3pPUryrMeNpYA/ca7X+FmS7G0Sde+Np4ODEY48xr17kEfYlk
 ee5W4opIigVe8V3TZD9MDsjPtY9NR41guxFQp90ojrSZK+Fp77YTAVW1ruGP8tYAdW5z
 fMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ndyd0vylg7hbf5nsTI+JENriLkRdS38Rny/WxSr8Iic=;
 b=Ujmflxr0duKfcPjiUJKfv8pRBqbeL0DDjKc+1VLKU1dDIjWsxtko+yJyDV5Arb6Etp
 S6VeRZcQqpw8FIvhk332zmQGEQN4LDsGoTY5+AD+LUbE0CVfT7ewVazaNoaKkCD2su1D
 JN1DwlobvZH7SKGFhQtBenumWOlNih+FZ6ba99uxD6+SC6ICNuKoIK4/mOP/hOhbjczL
 kO4KmfEM7o4ewecS6RCdU0VCTu6FRLFX04LvqyTmaVKFGKllJQQAiuQTlzI0Upj9S69T
 I0WuSozdIQx/Dms1OmXNCCc3OEaSLEAE1nN2HxHrTbx0hJurjqzO53C6m/MwZZIZsa0I
 FU/Q==
X-Gm-Message-State: AO0yUKWFdQ9akeQ5qzfG75fTiaN+/WuI4NBgwhdlmUZ2G8J1UtLOiI8R
 ZYBb4spql53w5r+ZNbMBULhLTg==
X-Google-Smtp-Source: AK7set8ZYm/OgxvGL3shOhQsKg4/o5WK+aACvMcy8EOGmjhcwjSECfUOF4tE+xDKCsH0N0wGlUx2ow==
X-Received: by 2002:a50:9eca:0:b0:4a2:4abc:29d4 with SMTP id
 a68-20020a509eca000000b004a24abc29d4mr17900060edf.32.1675597705549; 
 Sun, 05 Feb 2023 03:48:25 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a1709061c8600b007c14ae38a80sm3958851ejh.122.2023.02.05.03.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:48:25 -0800 (PST)
Message-ID: <02b95cdf-fe38-f147-1b9c-5078aaf35adb@linaro.org>
Date: Sun, 5 Feb 2023 12:48:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] hw/mips: Add MIPS virt board
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu
References: <20230202132138.30945-1-jiaxun.yang@flygoat.com>
 <20230202132138.30945-4-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230202132138.30945-4-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Jiaxun,

On 2/2/23 14:21, Jiaxun Yang wrote:
> MIPS virt board is design to utilize existing VirtIO infrastures
> but also comptitable with MIPS's existing internal simulation tools.
> 
> It includes virtio-mmio, pcie gpex, flash rom, fw_cfg, goldfish-rtc,
> and optional goldfish_pic in case MIPS GIC is not present.

Is it worth using the CPS/GIC? Can't we using the goldfish PIC
regardless CPS availability? Did you run performance comparison?

> 
> It should be able to cooperate with any MIPS CPU cores.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v1:
>   - Rename to virt board
>   - Convert BIOS flash to ROM
>   - Cleanups
> ---
>   MAINTAINERS                             |    7 +
>   configs/devices/mips-softmmu/common.mak |    1 +
>   docs/system/target-mips.rst             |   24 +
>   hw/mips/Kconfig                         |   18 +
>   hw/mips/meson.build                     |    1 +
>   hw/mips/virt.c                          | 1015 +++++++++++++++++++++++
>   6 files changed, 1066 insertions(+)
>   create mode 100644 hw/mips/virt.c


