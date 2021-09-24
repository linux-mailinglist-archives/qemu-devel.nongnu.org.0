Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BF4416EB5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:15:56 +0200 (CEST)
Received: from localhost ([::1]:52452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThJD-0001od-Pm
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTh9j-00048M-O9
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTh9e-0003Ix-NX
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id t8so25326500wri.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=MpYI6CxDz/Dr1YPqETiIfnlnmmgyxfZdbvZNECOh6nQ=;
 b=K4DmdCg+0Ja9Tpip4Nf9q5kTtrk85FZKY8vvIZ12OcxkyygOTI69lVvLyTvpDYKuIn
 0hB2PvnqDFIyGgKPw/k/fUS0D4efHFCp5q9wDHvqLa4t9H/iNOoZcIWQPovksnbaL5ZU
 ONS5UXi7maYgRHQ21mBJ64cinvbQFv8TiI1m6bZrAJqFYDI5lAVh5skPlCXstHpYbFCK
 +1yjkpKFxRNg7nfFgtRXqw5pAdkJWaHKH4pEtu1pkFq4rljYt+PsdA6QVmXHjinA99yx
 rCoQFcYd4gkUejPM2C+c319/3UyY+2CmZPcLzp4WJbCKHEml3pxcrV6btXUZxuCqv93e
 lqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=MpYI6CxDz/Dr1YPqETiIfnlnmmgyxfZdbvZNECOh6nQ=;
 b=DlQPafz0MJqIImsg0EhN0VnAg9JAZtv6NgwKbju7B7+n8WtMUGywBZk4xcYuHsgN6E
 kFgebOEkzbQYR5W/vgOO6x5TvuzqmYcF1zgBbWzZjW8xj9WjM2LpMudAjfXO2eRzZ5Ph
 ygXJ63z27WRu1hRdscWpJBNFafCBnmqbL5tbmRWueBc6kBqjJxCu6Ox4qDiN6q3wbm3u
 GJOYI2xJ0XHHUHqeqI0rm+6OWdwSGfJfBEAO7QQzhDrlhMB2shzK/HJbqqIQyvD1lsxn
 Gc7ZfWfzuw26eb60bXJvvpowT573WBj4opHL9KkT9ToxWQYromgSQWaDL83F+ZWhkLME
 3CiA==
X-Gm-Message-State: AOAM531s0ZyNHo6SZsl34Xl37V6S9SOxO4h3w1w+wfrdwkL+P3GxR7Hz
 lGCrS7m29HW3TnFCSJzoGSk=
X-Google-Smtp-Source: ABdhPJymEj1KlcA2pfyYkPHq2qSjqLTfdms2QItSkjMSmLl3JHn6b+Spsc6om+u0QuQenBvm14TwtQ==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr880152wmq.154.1632474360987; 
 Fri, 24 Sep 2021 02:06:00 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 25sm13327402wmo.9.2021.09.24.02.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 02:06:00 -0700 (PDT)
Message-ID: <a4ed9bec-5aee-dfca-e773-808983153e34@amsat.org>
Date: Fri, 24 Sep 2021 11:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 18/20] nubus: add support for slot IRQs
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-19-mark.cave-ayland@ilande.co.uk>
 <2e859345-2285-6b29-a3a0-7c888f73cc93@amsat.org>
 <43591fdf-045b-6c33-d54b-a3f18f0c5d58@ilande.co.uk>
 <8e879ded-3a4e-b12f-1479-62401af06927@amsat.org>
In-Reply-To: <8e879ded-3a4e-b12f-1479-62401af06927@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 9/24/21 11:01, Philippe Mathieu-Daudé wrote:
> On 9/24/21 09:06, Mark Cave-Ayland wrote:
>> On 23/09/2021 10:49, Philippe Mathieu-Daudé wrote:
>>
>>> On 9/23/21 11:13, Mark Cave-Ayland wrote:
>>>> Each Nubus slot has an IRQ line that can be used to request service 
>>>> from the
>>>> CPU. Connect the IRQs to the Nubus bridge so that they can be wired 
>>>> up using qdev
>>>> gpios accordingly, and introduce a new nubus_set_irq() function that 
>>>> can be used
>>>> by Nubus devices to control the slot IRQ.
>>>>
>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>>> ---
>>>>   hw/nubus/nubus-bridge.c  | 2 ++
>>>>   hw/nubus/nubus-device.c  | 8 ++++++++
>>>>   include/hw/nubus/nubus.h | 6 ++++++
>>>>   3 files changed, 16 insertions(+)
>>>
>>>>   static Property nubus_bridge_properties[] = {
>>>> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
>>>> index 280f40e88a..0f1852f671 100644
>>>> --- a/hw/nubus/nubus-device.c
>>>> +++ b/hw/nubus/nubus-device.c
>>>> @@ -10,12 +10,20 @@
>>>>   #include "qemu/osdep.h"
>>>>   #include "qemu/datadir.h"
>>>> +#include "hw/irq.h"
>>>>   #include "hw/loader.h"
>>>>   #include "hw/nubus/nubus.h"
>>>>   #include "qapi/error.h"
>>>>   #include "qemu/error-report.h"
>>>> +void nubus_set_irq(NubusDevice *nd, int level)
>>>> +{
>>>> +    NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(DEVICE(nd)));
>>>> +
>>>
>>> A trace-event could be helpful here, otherwise:
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>>> +    qemu_set_irq(nubus->irqs[nd->slot], level);
>>>> +}
>>
>> I think adding a trace event here would just be too verbose 
>> (particularly if you have more than one nubus device) and not 
>> particularly helpful: normally the part you want to debug is the in 
>> the device itself looking at which constituent flags combine to 
>> raise/lower the interrupt line. And once you've done that then you've 
>> already got a suitable trace-event in place...
> 
> But devices accessing the bus are not aware of which devices are plugged
> onto it. Wait, what is suppose to call nubus_set_irq()? Devices on the
> bus, to propagate the interrupt up to the CPU? OK so then the trace
> event is irrelevant indeed. I understood this API as any external device
> could trigger an IRQ to device on the bus. I wonder if renaming as
> nubus_device_set_irq() could make it clearer. Or even simpler, add
> a comment in "hw/nubus/nubus.h" explaining what nubus_set_irq() is for
> to avoid any confusion, and we are good.

Just noticed v6 was sent, so the function description could either
- sent as reply to v6 patch and squashed by Laurent when applying
- sent later as a new cleanup patch on top
- never added

Up to you, I don't mind mind much the outcome.

