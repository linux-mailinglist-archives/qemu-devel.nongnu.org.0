Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B26C696284
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:35:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtZL-0008F7-TB; Tue, 14 Feb 2023 06:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRtZK-0008Es-EW
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:33:54 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRtZI-0008QT-MO
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:33:54 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o18so15320693wrj.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 03:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PDLUjEcXWn230RLZ9pRj9KPdB7kXC/hzjcOMzyOsrKA=;
 b=LWg2zz6jkdOdWJ/TevyzPbG7DJAteAtdXsS/IRTy8rvdLS6K660jfX0/6BBibXKvBE
 J5bjNiB84c/5MdQJjtj5xaKYnzXxMSypLdPwZf9DZupEb7CHY3d9tJlr5A8XptEUPjyF
 2RyOuMQk0RtMDB3cujof4cpYak4mSHgA8BalNaG9WrDZA5VX0jB28qMqBgwXHCgSsp0I
 V0JrW3SazjzXpRqCjxoL6T4J6AKoCxxNYO3LjFFHAf46ZybkQ1P/Sz4Z/KXPl09mycF/
 kk5ZsmahGFhyiziAuSI3c8jZ/FL8k/zw9T9j7CvfKAXQPmqp2FdHBmTQmsNZBVlb0HpZ
 CEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PDLUjEcXWn230RLZ9pRj9KPdB7kXC/hzjcOMzyOsrKA=;
 b=YyvKKzWx5yW8UJmHDF0b7v36hWsxS9HJWMK98kNXTfb3WFY1M83TEqW8zyyInHXzbw
 fyYwBqWtxBIFFhZhhC3Jidhj+/z8v/xCfDiVTOMSii7BFA53tWPMezvDL9xLLunabAU7
 WVlnhKvd3dydYcTyr+EDC8EcS7pyPhKF95FgTs2qSEV9B3kTgE/dgDKqnAGSzxBZ7az/
 DjhJNY/lo6RQzMatkN++9b8/PNxJDx0EA3zvynovgcFIhg7Erq6bN5ixuUe/dR3yddru
 9A5t+6ZPr5I8BMsmZNtHXYFztQrwrTJqREyDIjlRH/tGJuLIbeeQLfCtADoTpe5nQGXG
 7Gxg==
X-Gm-Message-State: AO0yUKWUKIdavXuWbQkofXgmXjauNskmpRe1Vora3oPGCmXvYASOo3M8
 S1eiIqr81UwKg6WbiIPAKoP4dw==
X-Google-Smtp-Source: AK7set8GhnvVlaC5FGI7dGy5WqM46gpsXdja9QMaEqUp6l1dslBxvlQOYiaZnld6R2NaHa7r5BIdBg==
X-Received: by 2002:a5d:5945:0:b0:2bf:96ae:7cc8 with SMTP id
 e5-20020a5d5945000000b002bf96ae7cc8mr1791728wri.4.1676374431215; 
 Tue, 14 Feb 2023 03:33:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b16-20020adfe650000000b002c5534db60bsm6569003wrn.71.2023.02.14.03.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 03:33:50 -0800 (PST)
Message-ID: <4bfd5fc1-9a2d-f368-06eb-31c7bc1c0c77@linaro.org>
Date: Tue, 14 Feb 2023 12:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 2/4] hw: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230212224730.51438-1-philmd@linaro.org>
 <20230212224730.51438-3-philmd@linaro.org>
 <88026156-1838-bb8e-c637-b59a26759cc3@linaro.org>
 <0c477def-e852-53e3-9bf0-a9e3c313cf25@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>
In-Reply-To: <0c477def-e852-53e3-9bf0-a9e3c313cf25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 14/2/23 00:19, Richard Henderson wrote:
> On 2/12/23 13:03, Philippe Mathieu-Daudé wrote:
>> On 12/2/23 23:47, Philippe Mathieu-Daudé wrote:
>>> DeviceState::parent_bus is an internal field and should be
>>> accessed by the qdev_get_parent_bus() helper. Replace all
>>> uses in hw/ except the QDev uses in hw/core/.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/audio/intel-hda.c                |  2 +-
>>>   hw/block/fdc.c                      |  2 +-
>>>   hw/block/swim.c                     |  2 +-
>>>   hw/ide/qdev.c                       |  4 ++--
>>>   hw/net/virtio-net.c                 |  2 +-
>>>   hw/pci-bridge/pci_expander_bridge.c |  2 +-
>>>   hw/scsi/scsi-bus.c                  |  2 +-
>>>   hw/usb/bus.c                        |  2 +-
>>>   hw/usb/desc.c                       |  2 +-
>>>   hw/usb/dev-smartcard-reader.c       | 16 ++++++++--------
>>>   10 files changed, 18 insertions(+), 18 deletions(-)
>>
>> I missed:
> 
> Did you use a temporary rename of the field to catch all the uses?

No, git-grep. Good idea.

>>   void hda_codec_response(HDACodecDevice *dev, bool solicited, 
>> uint32_t response)
>>   {
>> -    HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
>> +    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(DEVICE(dev)));
> 
> I'm never sure the cast is clearer than &dev->qdev.

Maybe this one isn't obvious, but see for QOM macros use:
https://lore.kernel.org/qemu-devel/20230213170145.45666-3-philmd@linaro.org/:

-    vcdev->vdev.dev = &vcdev->cdev.parent_obj.parent_obj;
+    vcdev->vdev.dev = DEVICE(vcdev);

We should agree on how we want to use this API. If the
DeviceState::parent_bus field isn't considered internal,
the we should remove the qdev_get_parent_bus() helper which
is simply:

hw/core/qdev.c:333:BusState *qdev_get_parent_bus(DeviceState *dev)
hw/core/qdev.c-334-{
hw/core/qdev.c-335-    return dev->parent_bus;
hw/core/qdev.c-336-}

Note the alternate series expanding QDev macros:
https://lore.kernel.org/qemu-devel/20230213105609.6173-1-philmd@linaro.org/

> But it seems the normal way in qemu...
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

