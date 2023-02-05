Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C293E68AF71
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:04:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOcok-00047o-AJ; Sun, 05 Feb 2023 06:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pOcoI-00047C-SI; Sun, 05 Feb 2023 06:03:51 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pOcoH-0005ze-8p; Sun, 05 Feb 2023 06:03:50 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-163bd802238so12055346fac.1; 
 Sun, 05 Feb 2023 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xc5sRSEA0lAc/pHgHPvzQ/AfQ+MtkNasV3HbomAjm4U=;
 b=CI3CCT3GjxEsCyg98jI9f2uf6eGM+a+8xz/sWuY31UnuFU30bJaIO1x1ngHgj/uY/8
 985vYLvxN9hZ03hazP9UkzpcpFxBTTcyk6UrANiqyVKdO/PMrhUMUCpd8xiCLN/sLa27
 9sBaWsRLF9qFTEXtaCxLXfpEHN8tHB/Ca9+1ufl9+PWK//+tibePa4pA/3umJyDrF9jU
 C5pqpVg6RxZOYTMP6lqAJoCb4hx267AMzaqr1nh3pjD8w7NGG14meRmmJH5qRFfcAiW+
 nXM0hW6g8goIXrZxydVnEwVFhHAvbTc3Xhu5D2PYii/Sskj9h3ODHPAKjne3NZMErijE
 VLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xc5sRSEA0lAc/pHgHPvzQ/AfQ+MtkNasV3HbomAjm4U=;
 b=0dPa0NVw5N7JatO+bTR7JizHFAShrPiLmFUWcSy3vbqc0H5YLHnfmBhotpdqtRsnHc
 2kn9zF+AMGlSqxsZZ8ty2BNUMCj04X7iuOs/uRSWWyWchvpldoS/eokIl0lAidMN9qsJ
 4S59f1hrUlSfE4mV/CTFaYgnAG8gq50mY6sOD9L/TabcQkQOz/ut5dfnBG05ctsR6p0L
 g/CtpvT3Ug7FeDoinwQWTsWTnI1tw4BJTxOEedcpm7cvU6JretkSok0zUMRJztScrNic
 J+J1hQwkYhs6CC1BbzZiLELyw8VAwnLedvHAOD8jPLC82iMDtbbfNEHT8q32WT5Uqvwd
 YWbA==
X-Gm-Message-State: AO0yUKVkyqyGsEeAhPNhqBIrM6ZVdb22QhiEBxQrjs/narYB7hS8HW25
 S5UA+E2GQeQIs+on6rz4gx4=
X-Google-Smtp-Source: AK7set/aRycBAv/dyarY7yFZwzOZYG8B4Hk4C3b4lwCItEYxK5zxIO2OCS3AzG/SnBZyEEBLwEvJKw==
X-Received: by 2002:a05:6871:b29:b0:163:27c2:9476 with SMTP id
 fq41-20020a0568710b2900b0016327c29476mr9279235oab.10.1675595021423; 
 Sun, 05 Feb 2023 03:03:41 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a4a8289000000b0051762a73553sm3147166oog.18.2023.02.05.03.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:03:41 -0800 (PST)
Message-ID: <ed97efcc-f14c-d172-467b-5aeb05347d8d@gmail.com>
Date: Sun, 5 Feb 2023 08:03:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/5] hw/pci-host/raven: Set QDev properties using QDev API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20230203211623.50930-1-philmd@linaro.org>
 <20230203211623.50930-3-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230203211623.50930-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.09,
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



On 2/3/23 18:16, Philippe Mathieu-Daudé wrote:
> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
> 
> All calls use either errp=&error_fatal or NULL, so
> converting to the QDev API is almost a no-op (QDev API
> always uses &error_abort).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/raven.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
> index cdfb62ac2e..2c842d2146 100644
> --- a/hw/pci-host/raven.c
> +++ b/hw/pci-host/raven.c
> @@ -246,8 +246,7 @@ static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
>           /* According to PReP specification section 6.1.6 "System Interrupt
>            * Assignments", all PCI interrupts are routed via IRQ 15 */
>           s->or_irq = OR_IRQ(object_new(TYPE_OR_IRQ));
> -        object_property_set_int(OBJECT(s->or_irq), "num-lines", PCI_NUM_PINS,
> -                                &error_fatal);
> +        qdev_prop_set_uint16(DEVICE(s->or_irq), "num-lines", PCI_NUM_PINS);
>           qdev_realize(DEVICE(s->or_irq), NULL, &error_fatal);
>           sysbus_init_irq(dev, &s->or_irq->out_irq);
>   
> @@ -319,8 +318,7 @@ static void raven_pcihost_initfn(Object *obj)
>   
>       object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_RAVEN_PCI_DEVICE);
>       pci_dev = DEVICE(&s->pci_dev);
> -    object_property_set_int(OBJECT(&s->pci_dev), "addr", PCI_DEVFN(0, 0),
> -                            NULL);
> +    qdev_prop_set_int32(pci_dev, "addr", PCI_DEVFN(0, 0));
>       qdev_prop_set_bit(pci_dev, "multifunction", false);
>   }
>   

