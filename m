Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D368AF6E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:01:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOckv-0001bl-VS; Sun, 05 Feb 2023 06:00:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pOckt-0001ac-Jh; Sun, 05 Feb 2023 06:00:19 -0500
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pOckr-0005XZ-He; Sun, 05 Feb 2023 06:00:19 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 h12-20020a4a940c000000b004fa81915b1cso892771ooi.4; 
 Sun, 05 Feb 2023 03:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R0RBaKeiKQLLmjHAB5JsQkFMoVG9tIpF9DIZ3jtmovo=;
 b=hfA/ZE5G4DuXUjSuxHSGcq4vtaE/5y5wB7EURAjdzwLnTf7K284JUAV+Mq5mGiinKP
 7YQKvtt9EHxNWAn+asWDRiq3suavybbH5rne97Apv2I9l6wFPjsX/tU/zOoZbuuAxjlZ
 t8qdBMi8cYuUKVSBkDr3t2q9kUKrem2UOwdokwdzJupK4YuTkHmtxcAHBmimLaW3iV0d
 Zz7Dan0QjuVEwDWTFN/wj3bPzqrXGuwwWaVQS9kOIQmw0BX/6Ftg66Qb6FxgrlXVyDVL
 BetshSxJsbWOD/WfZ7Hfia6QN0cnDRbLUkegtbQiOWvAtlmD338ZSAI0gfsnVw4Sxax6
 5tXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R0RBaKeiKQLLmjHAB5JsQkFMoVG9tIpF9DIZ3jtmovo=;
 b=UnTwm/zk66NMq52nYSSNvcgD/gmdbmqQgftXpcCf0lMp48kulRtHMm8r1vS/2GUyQ0
 mufSWUaG/cE1fZx1Pf8mG138kC3Dc6PU7Hpy3Ak1Q99whIrDZw45/QJN/Sah0qoNKOOg
 E1J4QoS0VSlX/n5At3aVmEe8iQZ9EPRXT7V2ZBMZsFAFTAkQc6Mdx8OenHkfYcLX4yws
 vckXXvfZisg9DEpyNKHRCp68D6bs8gtSTZZ9ekRQ1A7oST2BDbQNFR3nDkTIvAcC2F0r
 OUVTFr9t6JqTPlpvomw2NQPsgPDu1b7WLD2//ULlrn5WFg9D/00iwah40ZQStps4gzFB
 xW9A==
X-Gm-Message-State: AO0yUKUTzvtGo+Q8mKkNWdxcg/lqNNzb9hSm5S0TOkFQdr6f0qqPGg13
 BMJKPE+KlwECVZ1v683trNY=
X-Google-Smtp-Source: AK7set8PD/UFzgfV6c9kCd82ObPPTUYRpgczNoQ7BpnxKcCCQkhuYGL/hnffWQPpwAscCKL9M4LfBg==
X-Received: by 2002:a4a:e904:0:b0:51a:3226:e0a7 with SMTP id
 bx4-20020a4ae904000000b0051a3226e0a7mr6247384oob.9.1675594815899; 
 Sun, 05 Feb 2023 03:00:15 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a4aa408000000b005178a98b6d2sm3121149ool.30.2023.02.05.03.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:00:15 -0800 (PST)
Message-ID: <8796fab9-3b48-b385-4f2c-c8b8ace29f03@gmail.com>
Date: Sun, 5 Feb 2023 08:00:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/5] hw/ppc/spapr: Set QDev properties using QDev API
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
 <20230203211623.50930-5-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230203211623.50930-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc33.google.com
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
> All calls use either errp=&error_abort or &error_fatal,
> so converting to the QDev API is almost a no-op (QDev
> API always uses &error_abort).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/intc/spapr_xive.c | 11 ++++-------
>   hw/intc/xics.c       |  4 ++--
>   hw/intc/xive.c       |  4 ++--
>   hw/ppc/spapr_irq.c   |  8 +++-----
>   4 files changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index dc641cc604..213c4cac44 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -310,9 +310,8 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
>       /*
>        * Initialize the internal sources, for IPIs and virtual devices.
>        */
> -    object_property_set_int(OBJECT(xsrc), "nr-irqs", xive->nr_irqs,
> -                            &error_fatal);
> -    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(xive), &error_abort);
> +    qdev_prop_set_uint32(DEVICE(xsrc), "nr-irqs", xive->nr_irqs);
> +    qdev_prop_set_link(DEVICE(xsrc), "xive", OBJECT(xive));
>       if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
>           return;
>       }
> @@ -321,10 +320,8 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
>       /*
>        * Initialize the END ESB source
>        */
> -    object_property_set_int(OBJECT(end_xsrc), "nr-ends", xive->nr_irqs,
> -                            &error_fatal);
> -    object_property_set_link(OBJECT(end_xsrc), "xive", OBJECT(xive),
> -                             &error_abort);
> +    qdev_prop_set_uint32(DEVICE(end_xsrc), "nr-ends", xive->nr_irqs);
> +    qdev_prop_set_link(DEVICE(end_xsrc), "xive", OBJECT(xive));
>       if (!qdev_realize(DEVICE(end_xsrc), NULL, errp)) {
>           return;
>       }
> diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> index c7f8abd71e..2fd1a15153 100644
> --- a/hw/intc/xics.c
> +++ b/hw/intc/xics.c
> @@ -382,8 +382,8 @@ Object *icp_create(Object *cpu, const char *type, XICSFabric *xi, Error **errp)
>       obj = object_new(type);
>       object_property_add_child(cpu, type, obj);
>       object_unref(obj);
> -    object_property_set_link(obj, ICP_PROP_XICS, OBJECT(xi), &error_abort);
> -    object_property_set_link(obj, ICP_PROP_CPU, cpu, &error_abort);
> +    qdev_prop_set_link(DEVICE(obj), ICP_PROP_XICS, OBJECT(xi));
> +    qdev_prop_set_link(DEVICE(obj), ICP_PROP_CPU, cpu);
>       if (!qdev_realize(DEVICE(obj), NULL, errp)) {
>           object_unparent(obj);
>           obj = NULL;
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index a986b96843..0e34035bc6 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -799,8 +799,8 @@ Object *xive_tctx_create(Object *cpu, XivePresenter *xptr, Error **errp)
>       obj = object_new(TYPE_XIVE_TCTX);
>       object_property_add_child(cpu, TYPE_XIVE_TCTX, obj);
>       object_unref(obj);
> -    object_property_set_link(obj, "cpu", cpu, &error_abort);
> -    object_property_set_link(obj, "presenter", OBJECT(xptr), &error_abort);
> +    qdev_prop_set_link(DEVICE(obj), "cpu", cpu);
> +    qdev_prop_set_link(DEVICE(obj), "presenter", OBJECT(xptr));
>       if (!qdev_realize(DEVICE(obj), NULL, errp)) {
>           object_unparent(obj);
>           return NULL;
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index a0d1e1298e..283769c074 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -313,9 +313,8 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>           obj = object_new(TYPE_ICS_SPAPR);
>   
>           object_property_add_child(OBJECT(spapr), "ics", obj);
> -        object_property_set_link(obj, ICS_PROP_XICS, OBJECT(spapr),
> -                                 &error_abort);
> -        object_property_set_int(obj, "nr-irqs", smc->nr_xirqs, &error_abort);
> +        qdev_prop_set_link(DEVICE(obj), ICS_PROP_XICS, OBJECT(spapr));
> +        qdev_prop_set_uint32(DEVICE(obj), "nr-irqs", smc->nr_xirqs);
>           if (!qdev_realize(DEVICE(obj), NULL, errp)) {
>               return;
>           }
> @@ -335,8 +334,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>            * priority
>            */
>           qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
> -        object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spapr),
> -                                 &error_abort);
> +        qdev_prop_set_link(dev, "xive-fabric", OBJECT(spapr));
>           sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
>           spapr->xive = SPAPR_XIVE(dev);

