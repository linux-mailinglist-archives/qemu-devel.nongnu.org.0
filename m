Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9812E4419CE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:26:41 +0100 (CET)
Received: from localhost ([::1]:59834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUWT-00057D-OU
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhURk-0007H7-JA; Mon, 01 Nov 2021 06:21:44 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhURf-00072D-VP; Mon, 01 Nov 2021 06:21:44 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso16783553wmc.1; 
 Mon, 01 Nov 2021 03:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=26QzzUiifrh6jwU9IPlvYsbYrk9DFgqfk6wy49xTl2w=;
 b=QoZcwoZv5a5DtN6bQR83BOY5IYF/8OQ14p1wcm7aVTVBGlunNyDRMmK9gTHFTCAumV
 Hg6dRC+IgIDZfe5MAXTRrW2AZoNQts90iwc8NjXMKV7q+w9Ki/Gk0dv+fOr+CgxKGlLq
 50HwJhthrcKn7YKXiNfEqtmZI73IslhORNJJTWCn++WyFt58rFlAu8j5s5DJ8uWNP/Id
 S7/ipiXSzAjyaXM1W7UVVXlkdsqDovMCrwZyaWo3UD1LLqimW8d2Crt2mvEd60AjU/CQ
 oN2uK2uatIoGde3TNcEXrr1q02+8BvoFXIlh5hxK7T9vbHTvXfG4vXZwHVHMinTzxwDF
 ALrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=26QzzUiifrh6jwU9IPlvYsbYrk9DFgqfk6wy49xTl2w=;
 b=YplUvDiGSTgwAsy/olfSlZzkzode3lPfMfdEFTpolF7K5KrUAQCR4fdaWvOz1NsVfy
 ElgaKmO+sSO1jsGLiS5F1qTXa/wYqplgGI/K51LwZ4fCpQc8OWNcln9isxwPUBLEZL51
 2E5cwFLYpu5OhrpCsUFPUiFFFWZtc8FGOp1Iv1vEFeRLLn60798cm/iRn/fN2ZE5/zN3
 VCQsZcVlY4jfx2z5azE8TEdiujyt/QBhIyCWGh0sZb3GQZUK5rj0L19M/gQkaN/oZuCB
 Ylfza9LDC33SewZIc8HmYAOO6XcGq1o6N45RIJYMCY/UG9gBngok9KNupoqAFI/xt9M6
 U6+g==
X-Gm-Message-State: AOAM530jZ8YdW8raaD5Km1HYAt4SY8P+TiQYhbeuYC4KOQdlfMSzX766
 L8eg3/5MYySid8dM8QD9uVH0Zql9j4M=
X-Google-Smtp-Source: ABdhPJwHBA65wxgwjWJJG4MVu7Br1pSP8Ak1gzYuNlzCRey9yOUiwzZzqkvIipVc8h9xmA1R9kMe6A==
X-Received: by 2002:a7b:ce0f:: with SMTP id m15mr1606806wmc.149.1635762096787; 
 Mon, 01 Nov 2021 03:21:36 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t1sm14891640wre.32.2021.11.01.03.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:21:35 -0700 (PDT)
Message-ID: <48a73d96-e8f3-902f-86fa-6d744cdf5e37@amsat.org>
Date: Mon, 1 Nov 2021 11:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] hw: Add a 'Sensor devices' qdev category
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211027050625.1265828-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211027050625.1265828-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.592,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-trivial@nongnu.org,
 John Wang <wangzhiqiang.bj@bytedance.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 10/27/21 07:06, Philippe Mathieu-Daudé wrote:
> Sensors models are listed in the 'Misc devices' category.
> Move them to their own category.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Only include hw/sensor/, removed AER915 device from hw/arm/z2.c
> ---
>  include/hw/qdev-core.h | 1 +
>  hw/sensor/adm1272.c    | 1 +
>  hw/sensor/dps310.c     | 1 +
>  hw/sensor/emc141x.c    | 1 +
>  hw/sensor/max34451.c   | 2 ++
>  hw/sensor/tmp105.c     | 1 +
>  hw/sensor/tmp421.c     | 1 +
>  softmmu/qdev-monitor.c | 1 +
>  8 files changed, 9 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 1bad07002df..2fd6b73bd8b 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -26,6 +26,7 @@ typedef enum DeviceCategory {
>      DEVICE_CATEGORY_SOUND,
>      DEVICE_CATEGORY_MISC,
>      DEVICE_CATEGORY_CPU,
> +    DEVICE_CATEGORY_SENSOR,
>      DEVICE_CATEGORY_MAX
>  } DeviceCategory;
>  
> diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c
> index 7310c769be2..2942ac75f90 100644
> --- a/hw/sensor/adm1272.c
> +++ b/hw/sensor/adm1272.c
> @@ -518,6 +518,7 @@ static void adm1272_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
>  
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>      dc->desc = "Analog Devices ADM1272 Hot Swap controller";
>      dc->vmsd = &vmstate_adm1272;
>      k->write_data = adm1272_write_data;
> diff --git a/hw/sensor/dps310.c b/hw/sensor/dps310.c
> index d60a18ac41b..1e24a499b38 100644
> --- a/hw/sensor/dps310.c
> +++ b/hw/sensor/dps310.c
> @@ -208,6 +208,7 @@ static void dps310_class_init(ObjectClass *klass, void *data)
>      k->send = dps310_tx;
>      dc->reset = dps310_reset;
>      dc->vmsd = &vmstate_dps310;
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>  }
>  
>  static const TypeInfo dps310_info = {
> diff --git a/hw/sensor/emc141x.c b/hw/sensor/emc141x.c
> index 7ce8f4e9794..4202d8f185a 100644
> --- a/hw/sensor/emc141x.c
> +++ b/hw/sensor/emc141x.c
> @@ -270,6 +270,7 @@ static void emc141x_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>  
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>      dc->reset = emc141x_reset;
>      k->event = emc141x_event;
>      k->recv = emc141x_rx;
> diff --git a/hw/sensor/max34451.c b/hw/sensor/max34451.c
> index a91d8bd487c..8300bf4ff43 100644
> --- a/hw/sensor/max34451.c
> +++ b/hw/sensor/max34451.c
> @@ -751,6 +751,8 @@ static void max34451_class_init(ObjectClass *klass, void *data)
>      ResettableClass *rc = RESETTABLE_CLASS(klass);
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>      dc->desc = "Maxim MAX34451 16-Channel V/I monitor";
>      dc->vmsd = &vmstate_max34451;
>      k->write_data = max34451_write_data;
> diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
> index 20564494899..43d79b9eeec 100644
> --- a/hw/sensor/tmp105.c
> +++ b/hw/sensor/tmp105.c
> @@ -305,6 +305,7 @@ static void tmp105_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>  
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>      dc->realize = tmp105_realize;
>      k->event = tmp105_event;
>      k->recv = tmp105_rx;
> diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
> index a3db57dcb5a..c328978af9c 100644
> --- a/hw/sensor/tmp421.c
> +++ b/hw/sensor/tmp421.c
> @@ -343,6 +343,7 @@ static void tmp421_class_init(ObjectClass *klass, void *data)
>      I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>      TMP421Class *sc = TMP421_CLASS(klass);
>  
> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>      dc->realize = tmp421_realize;
>      k->event = tmp421_event;
>      k->recv = tmp421_rx;
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 4851de51a5c..a411af03c5c 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -164,6 +164,7 @@ static void qdev_print_devinfos(bool show_no_user)
>          [DEVICE_CATEGORY_SOUND]   = "Sound",
>          [DEVICE_CATEGORY_MISC]    = "Misc",
>          [DEVICE_CATEGORY_CPU]     = "CPU",
> +        [DEVICE_CATEGORY_SENSOR]  = "Sensor",
>          [DEVICE_CATEGORY_MAX]     = "Uncategorized",
>      };
>      GSList *list, *elt;
> 

