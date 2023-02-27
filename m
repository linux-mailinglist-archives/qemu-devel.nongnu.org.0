Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42336A4137
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc4W-0003zY-63; Mon, 27 Feb 2023 06:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc4Q-0003zG-EW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:53:30 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc4N-0000Ip-VJ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:53:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id j3so4063242wms.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t0CAtm+7RIg/ru4VueE/tEdLWjJG51qtmVUH4TuR+eA=;
 b=cRg72ZZWnlcL48sz3g4vfiYwp7KJdjmBzQGCw/wBHwiAuVpnRpl9UAjok66/dtgQvh
 wuBIwBemR84kwJQy+TKcJgFk392J1/7iUsjsU2tQIgCSsjYyQwO/odZBlCj/xWkUVhbc
 MI/6RxdPSXehBtDQYHYFuXBd67fu4N1rCAvJ23NtVkgx/LDf+3NWI97tBfiIsrCjTutO
 WZWi90NLLFXDee2m6k3tplz4icPtPoub9DP2ZoQa0vPyv+wrcEDutcmvty48dc7T6U9r
 SRP5OFpj96v1E8MO4rvXMD+2M4J1Wa/fVWs0XPk8RNTvMjIQkzW4PYMGgggUVVIN0TJZ
 J5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t0CAtm+7RIg/ru4VueE/tEdLWjJG51qtmVUH4TuR+eA=;
 b=zX5JSU0MeMhZk4Tvydfzvd9G80qNF4DLgC2csmIaT71Dhn9vXAZg1HujWXYu0HBuy2
 2z5j/n/+BloKpoj3+2fSb2m6lO14LaszVCfF0u6PqpILYrhTVMKEWLF9Vyr7+Mm1pgk1
 VgIMsaEw67y2tKmvrQtA7gA03pS4PfXKMSo/4iz3DbXf0DcVVxeW/TZNhGOR0sW9xDfp
 qaVFIEiE/9iEdIeZwzTOgyxChT1piESlrZ2CH2p35v+Bz0nm9+XI/6xNqxlcLFo1guJW
 Enwd0yRdpYXiLgf2aOoBfzBCBno+B/8GxMjFphru0FmBgn/NTaSblOchYmTtUA0jz2Ao
 vjHw==
X-Gm-Message-State: AO0yUKU8QG6fmIA2DgEjJq1WpRF3Q6Z26l/nkAtQJfS9DvKAEMovJAhR
 PizVvrWJpxYyTMwVn0uoVD+reg==
X-Google-Smtp-Source: AK7set8L6ZM4meeJjPZ/FMPKHOoVlt1A0xPSarWDoyIjQE5IrtV8qBeFlBQp6XQ0leNMVvAQrCo8xA==
X-Received: by 2002:a05:600c:4aa7:b0:3e2:a9e:4eaa with SMTP id
 b39-20020a05600c4aa700b003e20a9e4eaamr17406173wmp.35.1677498806357; 
 Mon, 27 Feb 2023 03:53:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k42-20020a05600c1caa00b003e733a973d2sm13840958wms.39.2023.02.27.03.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:53:25 -0800 (PST)
Message-ID: <fbcf0be7-28ba-4ec7-3533-ba6fd45d0409@linaro.org>
Date: Mon, 27 Feb 2023 12:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 05/12] hw/i2c/smbus_ich9: Inline ich9_smb_init() and
 remove it
Content-Language: en-US
To: minyard@acm.org
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-6-shentey@gmail.com> <Y/E0KN6slRJucBms@minyard.net>
 <be6582a8-1032-a96f-8468-d5e2aeba938b@linaro.org>
 <Y/IwhKc27n2wOzr2@minyard.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y/IwhKc27n2wOzr2@minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 19/2/23 15:21, Corey Minyard wrote:
> On Sun, Feb 19, 2023 at 02:45:44PM +0100, Philippe Mathieu-Daudé wrote:
>> On 18/2/23 21:25, Corey Minyard wrote:
>>> On Mon, Feb 13, 2023 at 06:30:26PM +0100, Bernhard Beschow wrote:
>>>> ich9_smb_init() is a legacy init function, so modernize the code.
>>>>
>>>> Note that the smb_io_base parameter was unused.
>>>
>>> Acked-by: Corey Minyard <cminyard@mvista.com>
>>>
>>>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>> ---
>>>>    include/hw/i386/ich9.h |  1 -
>>>>    hw/i2c/smbus_ich9.c    | 13 +++----------
>>>>    hw/i386/pc_q35.c       | 11 ++++++++---
>>>>    3 files changed, 11 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
>>>> index 05464f6965..52ea116f44 100644
>>>> --- a/include/hw/i386/ich9.h
>>>> +++ b/include/hw/i386/ich9.h
>>>> @@ -9,7 +9,6 @@
>>>>    #include "qom/object.h"
>>>>    void ich9_lpc_pm_init(PCIDevice *pci_lpc, bool smm_enabled);
>>>> -I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
>>>>    void ich9_generate_smi(void);
>>>> diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
>>>> index d29c0f6ffa..f0dd3cb147 100644
>>>> --- a/hw/i2c/smbus_ich9.c
>>>> +++ b/hw/i2c/smbus_ich9.c
>>>> @@ -105,6 +105,9 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
>>>>        pm_smbus_init(&d->qdev, &s->smb, false);
>>>>        pci_register_bar(d, ICH9_SMB_SMB_BASE_BAR, PCI_BASE_ADDRESS_SPACE_IO,
>>>>                         &s->smb.io);
>>>> +
>>>> +    s->smb.set_irq = ich9_smb_set_irq;
>>>> +    s->smb.opaque = s;
>>
>> Corey, shouldn't we expand pm_smbus_init() to take set_irq / opaque
>> arguments?
> 
> That would be nice, but the other two user of this function,
> hw/isa/vt82c686.c and hw/acpi/piix4.c, don't use these fields.
> I doubt we are getting any new users.  I'm fine either way, but the
> value is not large.

The value is in enforcing stricter APIs (providing good examples).

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


