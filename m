Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0F7407DE2
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:17:32 +0200 (CEST)
Received: from localhost ([::1]:58408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPREZ-0000wV-Th
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRCJ-0008Iq-W7
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:15:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRCH-0001tI-RI
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:15:11 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so3786839wme.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=akbSip+eYvF6qNH2otzONcJ5LkTBDHsahUFkbFRYc7g=;
 b=kkkkcq2KY3LhgfJIOILC+f+E/oP8Syvv2jsbbIopwWdwe6y82J01rkHX9Z3nwZ9KZN
 igVCXNNE5SucIp4SXN9qVzdwoQQaI2eiezmt0VBEF+oOIFFCMyZuf3dwDJ6b6LkJy08W
 9CfiodUJ1t3YbjIIqP9RJIjO0XwqVKuyEQU52JolYR0dlGmOhE5HbE+TFEI6A4xiJCUI
 03oK5tOk6KGjSK1pjtZfPvNY4QpAPegXwR1ay+VjFlsNb2+sUw+20154KdJexBmtlGRC
 N3p0XkEw5X9Duym+GeOTydXq/zqbDxJMl4io5qMA6S/UJYwzAYz7KaIXB1H4WqmM3Vtv
 3UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=akbSip+eYvF6qNH2otzONcJ5LkTBDHsahUFkbFRYc7g=;
 b=x86AsWG7m7TDwG3orNbuf3zQPQApF5RCyIy+zNOOT65RiWKcfvf7KKvGbUHIOpC6eQ
 yyO7MUBq0eFsMj5+5VALlQV2tLyPoMP0IN0rAJiF5HyN4h3gGd2qcXQyCBz06ZXbLxsa
 le4qru4VB0BfIWNKU62fPkgbapJUrB2UbmGT/TLE4HeTQ6uYL08LSV+SQkUfftd0zIlJ
 s4YRyAjGw+7FOw9/hly8RlJ5tc6mh7MZomvqGKif55DkL3Dlgi6XK3MYh0v/r8bhf+zf
 zC8qYNWuAC9YDlzm59ks2vfkwucLc5tkZ0vvZfpFVA+DB+wAiIzh2jGHhMiv9W+v7oKC
 KFAg==
X-Gm-Message-State: AOAM5313dRQikM+8n6qOmnMeuFhrMXEPzqy9JheMl5wKFCPPj4xXckdC
 icvvNOpEnQvpLVm5Nw3AN0w=
X-Google-Smtp-Source: ABdhPJwlcHV0u8u2HfUTMwRUnwR/Y+WKe3wybX4wFi0t22pLhLlPQSMYXdBgl43eV/n86Ctg6ZW80A==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr7196184wmj.124.1631459707825; 
 Sun, 12 Sep 2021 08:15:07 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z1sm4372856wmi.34.2021.09.12.08.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:15:07 -0700 (PDT)
Subject: Re: [PATCH 03/20] nubus-device: add device slot parameter
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-4-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2ade04c9-59f8-04cc-d80f-f9eab22bc4ff@amsat.org>
Date: Sun, 12 Sep 2021 17:15:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 9:48 AM, Mark Cave-Ayland wrote:
> This prepares for allowing Nubus devices to be placed in a specific slot instead
> of always being auto-allocated by the bus itself.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-device.c  | 6 ++++++
>  include/hw/nubus/nubus.h | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 36203848e5..c1832f73da 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -191,12 +191,18 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>      nubus_register_format_block(nd);
>  }
>  
> +static Property nubus_device_properties[] = {
> +    DEFINE_PROP_INT32("slot", NubusDevice, slot, -1),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>  static void nubus_device_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
>  
>      dc->realize = nubus_device_realize;
>      dc->bus_type = TYPE_NUBUS_BUS;
> +    device_class_set_props(dc, nubus_device_properties);

Can we reorder this after #4 where you sanity check 'slot'
in nubus_device_realize()? First sanity check, then expose
the property.

