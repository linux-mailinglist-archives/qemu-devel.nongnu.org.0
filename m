Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD761031D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9kj-00089Q-4a; Thu, 27 Oct 2022 16:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9kS-00085W-4H
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:45:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9kQ-00073i-Dp
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:45:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id 5so1794825wmo.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Y2J3CLxCUsWfpuTyv8PC3W2Pni/Qo2FLv6ih1qllYw=;
 b=YRElwokv4GXPveh5AJj+4wDnaPNiqG1Vfo9yu5KEupiFmeeasW3oZCrBRxbRn6vEEV
 GVzKMa6CHXSiAXS2leBsO2i8iZmWC1jrLkQMIhCDaTIv1Tzyt3ciNRVHGmc5JbYof7rq
 haajzVIZmJTB2tvnO/zrUp/kDxCMX/r+k3Tzm27Nr318dYxNcn+pQeOUSRGc5KdoSzZQ
 uT9Fp+4GrnN8JtiYbY41M0GHaC/kOMGKHWTV2CVQuldqAuPna0VIqFl4Gnu0b1VU6BOm
 CzfohJwpwwDOlpY1xbylfGpfYuBHiquysICs8ks2m4rsgmlOXMoF8fPyn7ocIMUjzthI
 g18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Y2J3CLxCUsWfpuTyv8PC3W2Pni/Qo2FLv6ih1qllYw=;
 b=YkNq2aogcCiwbkRIEjwliirfy3EMBB7rjt1xUDjKdcsZBBtGHakK5cL3fUbNKQl5Vu
 U+k7t2SZtvb7Ln3F5vjlQI+hhh67d/7Bdz8xl6xeYJdpvuH6ZXpFrxI5Xx9bD3Rhz/a0
 MQcdPRrsVZrrr8ovmYvfw2Y7TgisjvBw8gCl/SxfFGMNzcZvQyuIsnITZ6orqnbZLU76
 Dc3ckUwjkiRki4Zsal3gzMsG2HoA2Y/pj3SEZ1yTNLxJTfir5gIUlS2YpWojJkQCboh6
 3EF4oMe2TnXWctrh/UEoZOi+fV+VraUYEWpVD2wGo4QbwLTWu8Y0R1RfK1n6aiUUpM38
 hEQg==
X-Gm-Message-State: ACrzQf3ihbTtEMJ8iZMQBlv7yCLOEhbgQ9U7od0FhhLoFv9tczTEaLev
 tECXqGqUBvTULJcOx2RLZmTHeQ==
X-Google-Smtp-Source: AMsMyM6uy69/gkKDzXhwy29zwp7q8I4tJHWnx8nyuzABB52dojyxPGF/L+Za0gsXsNBdFTQ27WZe6A==
X-Received: by 2002:a05:600c:310c:b0:3c6:f7c6:c7b6 with SMTP id
 g12-20020a05600c310c00b003c6f7c6c7b6mr7133514wmo.81.1666903504571; 
 Thu, 27 Oct 2022 13:45:04 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a5d58cc000000b00236705daefesm1942764wrf.39.2022.10.27.13.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 13:45:03 -0700 (PDT)
Message-ID: <4e6ea923-8cc8-da32-bc30-7709fdcc6549@linaro.org>
Date: Thu, 27 Oct 2022 22:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 3/3] hw/isa/piix4: Correct IRQRC[A:D] reset values
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20221026194619.28880-1-philmd@linaro.org>
 <20221026194619.28880-4-philmd@linaro.org>
 <CAG4p6K5NKs59r8ODzOY6AneDuALDgjimsUUu6pO_dvwq5AuWjQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAG4p6K5NKs59r8ODzOY6AneDuALDgjimsUUu6pO_dvwq5AuWjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/10/22 23:32, Bernhard Beschow wrote:
> On Wed, Oct 26, 2022 at 9:46 PM Philippe Mathieu-Daudé 
> <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
> 
>     IRQRC[A:D] registers reset value is 0x80. We were forcing
>     the MIPS Malta machine routing to be able to boot a Linux
>     kernel without any bootloader.
>     We now have these registers initialized in the Malta machine
>     write_bootloader(), so we can use the correct reset values.
> 
>     Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org
>     <mailto:philmd@linaro.org>>
>     ---
>       hw/isa/piix4.c | 8 ++++----
>       1 file changed, 4 insertions(+), 4 deletions(-)
> 
>     diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
>     index 15f344dbb7..a2165c6a49 100644
>     --- a/hw/isa/piix4.c
>     +++ b/hw/isa/piix4.c
>     @@ -115,10 +115,10 @@ static void piix4_isa_reset(DeviceState *dev)
>           pci_conf[0x4c] = 0x4d;
>           pci_conf[0x4e] = 0x03;
>           pci_conf[0x4f] = 0x00;
>     -    pci_conf[0x60] = 0x0a; // PCI A -> IRQ 10
>     -    pci_conf[0x61] = 0x0a; // PCI B -> IRQ 10
>     -    pci_conf[0x62] = 0x0b; // PCI C -> IRQ 11
>     -    pci_conf[0x63] = 0x0b; // PCI D -> IRQ 11
>     +    pci_conf[0x60] = 0x80;
>     +    pci_conf[0x61] = 0x80;
>     +    pci_conf[0x62] = 0x80;
>     +    pci_conf[0x63] = 0x80;
> 
> 
> Running `qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta 
> -hda debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 
> console=ttyS0"` with this patch Linux outputs:
> 
> [    7.944000] uhci_hcd: USB Universal Host Controller Interface driver
> [    7.944000] uhci_hcd 0000:00:0a.2: Found HC with no IRQ. Check 
> BIOS/PCI 0000:00:0a.2 setup!
> [    7.944000] uhci_hcd 0000:00:0a.2: init 0000:00:0a.2 fail, -19
> 
> Omitting this patch from the series the USB host is found.

Oh, I should have used tswap() instead of bswap()! I have been moving
and my test suite is on an offline backup, I'm not yet set up. As you
see my testing is poor :/

