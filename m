Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE31697A4A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:57:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFTH-0006AR-2q; Wed, 15 Feb 2023 05:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFTA-00069q-4R
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:57:00 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFT4-0000FO-8D
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:56:58 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso1214167wms.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 02:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mp4SqVNtqwXiIzu8dHycszP9EdUnkoJsxgr3HBIXYEA=;
 b=S2LK789GsSP0cKHzOEGy8+WLCn/Yl2EkhFofQQvaEeLvjFggvHL6vzsyCtBp31anIS
 evSuFDRaZOw8GQfwXfpQfxBU4oSv0X15eUkpkJ92sv+Vqtsn+KK4wx+/hZsUbrHlKf9l
 q3WDEHDn8LPfJ01i9ancrQxea75vDzZwz6p9fCLDI0qDrwmfs+RVxD0iAooCgZuUSxWg
 VFhaU5vXviJW5pdsRmSsvKaENuA1Ea87Hf3ppIouLvoFhKcnUwPzJZ3x55E0Yk7Z4emk
 dzrM7e9qjHJs7+vP1a99AQwb6Fr1TiA0mc4F5XFRxhcp3HlLzKD359RE9jdCYe0nwFSd
 b4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mp4SqVNtqwXiIzu8dHycszP9EdUnkoJsxgr3HBIXYEA=;
 b=yFqEvWAPuQTqo6Jf7crSk3mnc+WqcwLri69vmoDWNZvMf7VbYn1xtSSpBSj8Sjgd4F
 3YGhryVPHc19Dcv+b7D0z/i2yKnvTwrj+UAuh/87uc5cMN2au0n2wKhXYvIfg9LUrREb
 QRdmfhFpHpMMSvZ3hHiQh3kpoK8+OK0DDZ5QywLBErTavSNIDuzoabXY9vD63Ok2wzoa
 i2XQ0NTXKXPhSNZ2WVg/T+vxoAt1K7zDwyEIEF1V4E3QjkVZdyI2T/1POW/Ux0tvJELz
 +I1j6BnpYm7lmqwaZaiLlfzR8SC3CiTc1MTFUWeu4sbmXd3RQSOfIEFo2+q9y1ctIAou
 YjKg==
X-Gm-Message-State: AO0yUKWfuKsN2jzHNrX1rmAERJaB3pPY0T1+x94Zd2OVLLtD5qTVooXz
 FR7Vl0VxglIqwHY4q1kByCFc3g==
X-Google-Smtp-Source: AK7set9nhL6i9IM8nEJjrMTG3PfzM8I+HilwU1DDonFeKX9PdXGlhzYltMD0EmtvC5/2ZFAnbO4uZA==
X-Received: by 2002:a05:600c:4b1b:b0:3df:fbd5:690 with SMTP id
 i27-20020a05600c4b1b00b003dffbd50690mr1468227wmp.17.1676458609360; 
 Wed, 15 Feb 2023 02:56:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b003e001afa274sm2001284wmq.2.2023.02.15.02.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 02:56:49 -0800 (PST)
Message-ID: <2a87b119-4782-ce91-5174-f7b18019b3fc@linaro.org>
Date: Wed, 15 Feb 2023 11:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 5/8] aspeed/smc: Replace SysBus IRQs with GPIO lines
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-6-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214171830.681594-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 14/2/23 18:18, Cédric Le Goater wrote:
> It's cleaner and removes the curious '+ 1' required to skip the DMA
> IRQ line of the controller.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c     | 2 +-
>   hw/ssi/aspeed_smc.c | 5 +----
>   2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


