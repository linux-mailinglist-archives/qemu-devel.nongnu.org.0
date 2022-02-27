Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD0D4C5F5F
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:15:01 +0100 (CET)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nORoi-0002ZE-9Z
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:15:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORnK-0001jT-QS; Sun, 27 Feb 2022 17:13:36 -0500
Received: from [2607:f8b0:4864:20::1035] (port=54176
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORnJ-0001dp-GQ; Sun, 27 Feb 2022 17:13:34 -0500
Received: by mail-pj1-x1035.google.com with SMTP id bx5so9484202pjb.3;
 Sun, 27 Feb 2022 14:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1IoOd9yofovtjDOIWEwqS/Ke/b7fyLX/0KT4/3ZgScA=;
 b=ARP+XC6nI3WF3U0CNdcjrhLLr99LE2E9Qzncvxrs/TSdX58ragh3OJPsPV7+9bKonf
 4Q7idIsaYbMAChFe3LeuaiO07tLjkSaeMKkyuQuOTj77TBCGaVUvDJnVBH5fPkOP3i1a
 Haw4we4iFAA48Zj6cMCCMY1mA4VUy95s3NIzphuqAPjvLZY+/TFqLyjMQ2K9LdMrcgOI
 b7DFhXvObBuJ6BpAe2v5FOilyZcbsBbS5/632H463qxtKRUr8NpRmKvJFkc584Elmotf
 o2skUvq3A/RAJb/AW82jFoTow7+T2WzCm5dvz3SdoMfu0mNZ1Rb/+q6L5JRKB0wMk9OT
 kuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1IoOd9yofovtjDOIWEwqS/Ke/b7fyLX/0KT4/3ZgScA=;
 b=TcwjFoUevxQpPWdqexzV8HQ2E8dGfWd3UT6G6TlgfmSm6jQnJNDI5g10T+x1lVRX2R
 Z0eAgp4Ix0fnXY4sHdEGcjAg1tdyEoRRx+6WSELdeBrFKU7d3JcaJo6lW/9/HY9qMZ2R
 J2j6UMxIyXHas6DDFw0eWz9IZcD5L0pLzFwZbp4PtkvXNra3n39D/4FedM56IrNbgZ+U
 W863ObonfBtlj1YLmkH2RAADGzoSxEVkrWdiWN1WsD4WKeRFjlMX6UKSYHZjo/bd8NJj
 ZxByDU+VzFa00FzISXnYcmBod+CsN8vnFqr2UB30V3iJO19HO+Ipmyh4+wkKfk8zQ5Ci
 Bgsg==
X-Gm-Message-State: AOAM531IjhGhDEAZCYMxCUpDQ9o5wFLBqbS+1K+sQwwKnWFwRvm2+SV/
 BEryQwxpSsrujMxbbBsM1iU=
X-Google-Smtp-Source: ABdhPJz/H4mQDxkYO3IqLc3zHEJkzwzqNgRp5DxG1A7WYwncrBYNCxHnsmQngpzlegO/4Bf2MKOhfw==
X-Received: by 2002:a17:902:f687:b0:14f:dff9:6a3c with SMTP id
 l7-20020a170902f68700b0014fdff96a3cmr17628045plg.163.1646000011436; 
 Sun, 27 Feb 2022 14:13:31 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 k17-20020a056a00135100b004f3a9a477d0sm10561564pfu.110.2022.02.27.14.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:13:31 -0800 (PST)
Message-ID: <12a3bd53-cfb4-cecf-1d75-aa941eaa9663@gmail.com>
Date: Sun, 27 Feb 2022 23:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 02/22] hw/rtc/m48t59-isa: QOM'ify IRQ number
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220222193446.156717-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "open list:PReP" <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/2/22 20:34, Bernhard Beschow wrote:
> Exposing the IRQ number as a QOM property not only allows it to be
> configurable but also to be printed by standard QOM mechanisms. This allows
> isabus_dev_print() to be retired eventually.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/rtc/m48t59-isa.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

> @@ -97,9 +99,14 @@ static void m48t59_isa_realize(DeviceState *dev, Error **errp)
>       M48txxISAState *d = M48TXX_ISA(dev);
>       M48t59State *s = &d->state;
>   
> +    if (d->isairq >= ISA_NUM_IRQS) {
> +        error_setg(errp, "Maximum value for \"irq\" is: %d", ISA_NUM_IRQS - 1);

Format is "%u".

> +        return;
> +    }

Similarly to patch #1, ISA_NUM_IRQS fits in uint8_t. Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

