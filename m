Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F966BDC6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 13:24:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHOW6-0004ZY-Uu; Mon, 16 Jan 2023 07:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOW2-0004Z6-4D
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:23:08 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOW0-0001rH-L3
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:23:05 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so634447wms.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 04:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=64P7Y6yjODvx3789VOcRGXmV1/qot5F9OF92fbX+2KI=;
 b=qRWc8HecGeQ14bzdihy+V9zBGr/ePmRvJDI0OE+up1jBxS6lUM4wLvM60yJkjhMAOo
 G/5YxcUOaql5j1du/IRdFScJdIWp0FOlzl1Fl6WWNoslpRFTvUUsRotm3dm9elmGQC4c
 f5bJ0aMYnVnjbPAfAgQLZbgGsbJJsUtj6jCe1ncezHBr2QwjzmLkl8o9nc/w9pDrMUrl
 JZPqtY1/OzUJS1bSWOAvSpfaQAD6Jcfk0rpg1pVAJj/QRyY5F8ouWrwk+23SOc0km6+2
 CVuujbf54b1RJWI38Tsgajy6m8Lm9fUQW1760fMVaiu2sWKEpxxRAMm21gVWFN1TxP2N
 8DiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=64P7Y6yjODvx3789VOcRGXmV1/qot5F9OF92fbX+2KI=;
 b=osEflQo4rXW0s2hl06mtaeT7/KYpJZTUWfsvpWHVMsBrwApQmEQuaZX9rrQnrC8K7u
 1urdzJc8dJ65crf2Ue/8f7o69KCK3nlSY6zGZRiZ7wSVRCFoA2FQefqyTQ9oChu+IJNj
 9cE7bngHHmg9DYr97iC7f5fLn16CBzll6tk7piexWSsEa/128nTyhhxrqabjoQpeXMoK
 Vbum6EHUTDkrfTOjPXCRgZRJ8JBiFMENoqdBYjFLBuzUsaH5riYUIAD88zVfXZx2/8HN
 VklQFFwEqUzZn4oiEGFXj2nIIXPrKg7zQQBUv1nABac6hivF5f11SFQHVkFayi8rsMzx
 9wOg==
X-Gm-Message-State: AFqh2ko9gJPoaGd/qhe0KY3WnjyIxdj9yiLGk4VDSigNogKb217Ykx0a
 51ggjLFdTCYTDvkgtkUUMFlzGA==
X-Google-Smtp-Source: AMrXdXs5BIRdBy4Rv3O46gkRyIYKJcL1T+0/5xBYNdHLQnHgV53ZjfzSAL5dpWQ087AeDn/PqEiE/g==
X-Received: by 2002:a05:600c:34cd:b0:3d5:1175:92c3 with SMTP id
 d13-20020a05600c34cd00b003d5117592c3mr66046641wmq.23.1673871783167; 
 Mon, 16 Jan 2023 04:23:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c6b70a4d69sm38006150wmq.42.2023.01.16.04.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:23:02 -0800 (PST)
Message-ID: <c8e17594-9eb5-ce6c-c414-622f4f68d008@linaro.org>
Date: Mon, 16 Jan 2023 13:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/6] hw/nvram/eeprom_at24c: Add header w/ init helper
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-2-peter@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114170151.87833-2-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 14/1/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/nvram/eeprom_at24c.c         | 10 ++++++++++
>   include/hw/nvram/eeprom_at24c.h | 10 ++++++++++
>   2 files changed, 20 insertions(+)
>   create mode 100644 include/hw/nvram/eeprom_at24c.h

> +void at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", address);

Please use the type definition: TYPE_AT24C_EE.

> +    DeviceState *dev = DEVICE(i2c_dev);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);

Although the allocated object is somehow reachable from the i2c bus
object, it would be simpler to deallocate allowing the parent to keep
a reference to it. So consider this prototype instead:

   I2CSlave *at24c_eeprom_create(I2CBus *bus, uint8_t address,
                                 uint32_t rom_size);

> +}

