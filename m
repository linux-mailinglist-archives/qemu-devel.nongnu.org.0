Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3659C650514
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:17:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71yB-0001Mv-Vc; Sun, 18 Dec 2022 17:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71y9-0001Kw-Es
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:17:18 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71y7-0005Xh-Ge
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:17:17 -0500
Received: by mail-ed1-x532.google.com with SMTP id z92so10628487ede.1
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 14:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yXC/bojD9LagN/eSMC9Tc3MJNDDf499kG/6ZuuneINY=;
 b=BSkX4RlBzXWqSzL8Pxr/oiqte6yHl29wqeGVF85FxyxASsQu8gq9LBdv9xNTw8fsm3
 iWDJTgtN6xUNXfHz5sSUErMpdr6Xh4ZDCkmkxFTMgZrnCQ59qI6aKs6eVlYspAfIYtEW
 nUeUQjSoW5tq4pFv2bT9w0klm+CZOUA2J4a/oVuzplRKE+Ldo7hj8ek3THEeJTkTQpvK
 PnzC7LEimNbFL2RpjAOMjSOU3lY3OhKda3unD8Z2hVG0OHed8hvjjvF4GWhDZ1QZUQkr
 GmhEr76rLMMN60KGgiDc3P/uzfdyTewxYEjzACqd8lbkL3YwCb5y50FrOZ35bx/ofbnN
 GTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yXC/bojD9LagN/eSMC9Tc3MJNDDf499kG/6ZuuneINY=;
 b=dOhvyG4ALGklqaOWYmxgvFvtyGmJZQO3gjztiS5XNfdzGxQUtIgrGhi0vPef4ysOLM
 VaXe3E0F0ei0blQGZyotyeN/UNvsbJQxqwWxGweQfvlEhsJgzgBQoxxOD+gOwrZ20qRr
 veC0weA3fovDxUpWjCF/1DDbhmefvVq90z7Y+b7d9FBXy9MzBztULEEOioo+trT89E8L
 ZqlIOo1mTe5xPyAmnFteGCXvRUMrJ0W0la4dB0NM55qGoTKYutTX7BhbA2szTIleQo+a
 vr7wb1RbVghHnpolEP6Xc3Hx3bzBzcTWOdHWHFP6xg6+UPMb9cP/Okt+0abUlZK9VYsz
 Ypxw==
X-Gm-Message-State: ANoB5pkaaxFdXFWj4DXRqcVBUyOBRRlT9lblHQkMJ39S6vuPxkLdb3G3
 Zl/1ATxtpfgodvZcE2ise0y+Ig==
X-Google-Smtp-Source: AA0mqf6thMUPqT2n5D7TSAm+My084gTPoZfDYU/XxZ4NFkhz+j00IV42YEFkaeTYyt4xrwE1QnZZPg==
X-Received: by 2002:a05:6402:289c:b0:461:bf47:ba43 with SMTP id
 eg28-20020a056402289c00b00461bf47ba43mr47567922edb.28.1671401832961; 
 Sun, 18 Dec 2022 14:17:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u10-20020aa7db8a000000b0046bc2f432dasm3571862edt.22.2022.12.18.14.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 14:17:12 -0800 (PST)
Message-ID: <e05afcc8-8d86-b942-6702-8ba4887c44db@linaro.org>
Date: Sun, 18 Dec 2022 23:17:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 0/7] Enable Cubieboard A10 boot SPL from SD card
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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

On 18/12/22 22:19, Strahinja Jankovic wrote:
> This patch series adds missing Allwinner A10 modules needed for
> successful SPL boot:
> - Clock controller module
> - DRAM controller
> - I2C0 controller (added also for Allwinner H3 since it is the same)
> - AXP-209 connected to I2C0 bus
> 
> It also updates Allwinner A10 emulation so SPL is copied from attached
> SD card if `-kernel` parameter is not passed when starting QEMU
> (approach adapted from Allwinner H3 implementation).
> 
> Boot from SD card has been tested with Cubieboard Armbian SD card image and custom
> Yocto image built for Cubieboard.
> Example usage for Armbian image:
> qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img

As a follow-up, could you add a test similar to
test_arm_orangepi_bionic_20_08() in tests/avocado/boot_linux_console.py?

This test could be refactored as do_test_arm_allwinner_armbian(), called
for orangepi and cubieboard with the corresponding url / hash.

