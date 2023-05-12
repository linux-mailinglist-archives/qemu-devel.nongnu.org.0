Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA266FFF84
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 06:03:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxJzd-00089Z-10; Fri, 12 May 2023 00:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxJza-00087O-6W
 for qemu-devel@nongnu.org; Fri, 12 May 2023 00:02:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxJzY-0003u8-Db
 for qemu-devel@nongnu.org; Fri, 12 May 2023 00:02:53 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f450815d02so20427005e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 21:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683864171; x=1686456171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t2o7w8RBwFGak+QYy/6Ay6dkOTj5vbc9lyltm5ngL+A=;
 b=r8evVbfYvi9j9NYAkfZO1GB+LU0VvlbuUhZAH9p6lbSC/tdwTJLAV4iNAMtFzWTzWa
 X2tCgwDCSLzGk61KI7qQwX3yNYH91AUyf56FsL+oA6LTjb9qdoOR2DF4+PW1GnZO2bp0
 ZWMuKiQJ7p9roMnJa0XzbSXOUq8Z3npXCG761XxXEPGtLMFD1UATZvSBYZMw1qOV4NYl
 N6INevl6qkOMW+bzEXpULRJYyDKNb5ABQ5EUr0ikXodDCXtbbbu0YQfhMO08roqQmHEv
 PglMWXz57wZiClqifmNpkbgH1UmanSpV5UYc599dnPKD2frHLMIFJe4WkFcbHG63KP7w
 rIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683864171; x=1686456171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t2o7w8RBwFGak+QYy/6Ay6dkOTj5vbc9lyltm5ngL+A=;
 b=Gceaqe2+SaSSQUJlYmg4M5KT745mX6I2MNLEZtJXJqzcuqkDOJgg39V+AzgkW1aGx/
 aFj9CRaORFv98ARzGHJ2JXAdp4F/tHQqSy20Bx5GO0NgLe+pBMHVnp8CMtBaTF7M55qR
 H7ITQmCXq8l5U8y3JYFYE+Fpm1TvSRzz4zoKVhruwZiVXiKuWD3uCn5yYG7dulXqJ8bn
 Z5V6Y3byWPTVprK7qxQDW6BXqhZOxX5IVEoI6VlznfQvJYGPFtOsLZDuK2tpzob3MKq+
 dJshWf8mv2xsFQdZEESFiApUKWpSIKllIwoI1vBusQGhbDOfmgZebj5F8+OmPVd5P+HM
 9Hjw==
X-Gm-Message-State: AC+VfDz5THHBecdyIlMAzqadc6zSWSnx2zaLhzpIBfyV9yX6Z8iN/nrP
 KGQuKuBeklDYq3MZedAhuas/TQ==
X-Google-Smtp-Source: ACHHUZ7pSX0lcwtx2g1rtX0/FiIA39jLWr1j3u8jts6iD2l3KjBjqGWqYHvYPmxY1QClVIU4RfcYXQ==
X-Received: by 2002:a1c:7413:0:b0:3f4:bb58:d174 with SMTP id
 p19-20020a1c7413000000b003f4bb58d174mr5209156wmc.22.1683864170687; 
 Thu, 11 May 2023 21:02:50 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a05600c219300b003f173419e7asm27067886wme.43.2023.05.11.21.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 21:02:50 -0700 (PDT)
Message-ID: <aa83095b-64f5-584f-8ccc-0e1f6f2e6ae3@linaro.org>
Date: Fri, 12 May 2023 06:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PULL 03/16] ssi: cache SSIPeripheralClass to avoid GET_CLASS()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221025152042.278287-1-clg@kaod.org>
 <20221025152042.278287-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221025152042.278287-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Alex,

On 25/10/22 17:20, Cédric Le Goater wrote:
> From: Alex Bennée <alex.bennee@linaro.org>
> 
> Investigating why some BMC models are so slow compared to a plain ARM
> virt machines I did some profiling of:
> 
>    ./qemu-system-arm -M romulus-bmc -nic user \
>      -drive
>      file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd \
>      -nographic -serial mon:stdio
> 
> And saw that object_class_dynamic_cast_assert was dominating the
> profile times. We have a number of cases in this model of the SSI bus.
> As the class is static once the object is created we just cache it and
> use it instead of the dynamic case macros.
> 
> Profiling against:
> 
>    ./tests/venv/bin/avocado run \
>      tests/avocado/machine_aspeed.py:test_arm_ast2500_romulus_openbmc_v2_9_0
> 
> Before: 35.565 s ±  0.087 s
> After: 15.713 s ±  0.287 s

Do you remember if you were using --enable-qom-cast-debug when
profiling this?

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Cédric Le Goater <clg@kaod.org>
> Tested-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Message-Id: <20220811151413.3350684-6-alex.bennee@linaro.org>
> Message-Id: <20220923084803.498337-6-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/ssi/ssi.h |  3 +++
>   hw/ssi/ssi.c         | 18 ++++++++----------
>   2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index f411858ab083..6950f86810d3 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -59,6 +59,9 @@ struct SSIPeripheralClass {
>   struct SSIPeripheral {
>       DeviceState parent_obj;
>   
> +    /* cache the class */
> +    SSIPeripheralClass *spc;
> +
>       /* Chip select state */
>       bool cs;
>   };
> diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
> index 003931fb509e..d54a109beeb5 100644
> --- a/hw/ssi/ssi.c
> +++ b/hw/ssi/ssi.c
> @@ -38,9 +38,8 @@ static void ssi_cs_default(void *opaque, int n, int level)
>       bool cs = !!level;
>       assert(n == 0);
>       if (s->cs != cs) {
> -        SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(s);
> -        if (ssc->set_cs) {
> -            ssc->set_cs(s, cs);
> +        if (s->spc->set_cs) {
> +            s->spc->set_cs(s, cs);
>           }
>       }
>       s->cs = cs;
> @@ -48,11 +47,11 @@ static void ssi_cs_default(void *opaque, int n, int level)
>   
>   static uint32_t ssi_transfer_raw_default(SSIPeripheral *dev, uint32_t val)
>   {
> -    SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(dev);
> +    SSIPeripheralClass *ssc = dev->spc;
>   
>       if ((dev->cs && ssc->cs_polarity == SSI_CS_HIGH) ||
> -            (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
> -            ssc->cs_polarity == SSI_CS_NONE) {
> +        (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
> +        ssc->cs_polarity == SSI_CS_NONE) {
>           return ssc->transfer(dev, val);
>       }
>       return 0;
> @@ -67,6 +66,7 @@ static void ssi_peripheral_realize(DeviceState *dev, Error **errp)
>               ssc->cs_polarity != SSI_CS_NONE) {
>           qdev_init_gpio_in_named(dev, ssi_cs_default, SSI_GPIO_CS, 1);
>       }
> +    s->spc = ssc;
>   
>       ssc->realize(s, errp);
>   }
> @@ -115,13 +115,11 @@ uint32_t ssi_transfer(SSIBus *bus, uint32_t val)
>   {
>       BusState *b = BUS(bus);
>       BusChild *kid;
> -    SSIPeripheralClass *ssc;
>       uint32_t r = 0;
>   
>       QTAILQ_FOREACH(kid, &b->children, sibling) {
> -        SSIPeripheral *peripheral = SSI_PERIPHERAL(kid->child);
> -        ssc = SSI_PERIPHERAL_GET_CLASS(peripheral);
> -        r |= ssc->transfer_raw(peripheral, val);
> +        SSIPeripheral *p = SSI_PERIPHERAL(kid->child);
> +        r |= p->spc->transfer_raw(p, val);
>       }
>   
>       return r;


