Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF46936B595
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 17:20:03 +0200 (CEST)
Received: from localhost ([::1]:36938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb31m-00045u-Mi
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 11:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lb2z6-0002DM-LQ; Mon, 26 Apr 2021 11:17:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lb2z3-0005K0-FU; Mon, 26 Apr 2021 11:17:15 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x7so56260648wrw.10;
 Mon, 26 Apr 2021 08:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3tk2AGn6nJVpa73y63zWntkGf3PpkrX9E3NdwpL+uWs=;
 b=m1GGk1dBNb+HOga904FBdNLFzvbpqQci1oORho1cKFRkTc10QYo4JVZw+4KyXyTueG
 Sq50QZRhGVUl1CqXfXAHOztcacLt6tiH3jHwpjCsYOmxWYxyQkYt8z+8e/Q9tkKQzvEY
 sAjxnqdOWyJMcGQCsHudZgeEHFI6peZtuv0Ukow1TbW3bN7ig5as5M0VjeRQk55H68wn
 uMQRqqDvMhXhe9KTaSv7zLgPzwNokACykc5Svg17K9xirUnCg4jNIGBy/hcDpMjrojax
 y77EXLYT+m+IWMQCJsdATvrhMfsBwWD8+zyi/MejJqTCTJxVlyslPOfcethqyn0hv3Mo
 IWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3tk2AGn6nJVpa73y63zWntkGf3PpkrX9E3NdwpL+uWs=;
 b=LVB3JTv6FPasjitIOKFU1yOllkUDeHztCeraOXUMBOMYjEfspz0RZorSA6eYx0qLHk
 cb4axjWtjIgmJ3rwDxc2zFiswvNPudfgvYEET9UmlFuxH4Z5eD2P9n1K+bpt408hex2g
 vFA/9xJSyrUeceybt3Rc2Rp9H5brQ4CXXVyeTjnFpARweKEa1g81Q4TEX6VmNCH/6QAN
 JzR938mBLO6odC1w2qxH7Lwv5tPXEnzfqyHJjbc3LOT/oFI9Kt5r2HuzV5NuXDPYpjce
 l5aQBO/YScOETiBosrWFzGCuujcTc+GXlvwN+vD97Ye83eCSuaPpYrJGEg5zK7Qr4PwL
 6aeA==
X-Gm-Message-State: AOAM533w5Am1lZ+EKSKmTv5lRg3TY3oXzxec9Kug0IP7HPFqcr+pWNS0
 j1dkO1cwvZXUs7sJvGggAl0=
X-Google-Smtp-Source: ABdhPJyUwSua8/oqJ0hhe33OG3Gqv2mZzoacHjDj9N4iwH1/9GU/KRX410/B/pJ+Y05Y951UxDlnyQ==
X-Received: by 2002:a5d:4a02:: with SMTP id m2mr13467788wrq.188.1619450228627; 
 Mon, 26 Apr 2021 08:17:08 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a2sm382489wrt.82.2021.04.26.08.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 08:17:08 -0700 (PDT)
Subject: Re: [PATCH 2/5] hw/pcmcia/microdrive: Register machine reset handler
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210424162229.3312116-1-f4bug@amsat.org>
 <20210424162229.3312116-3-f4bug@amsat.org>
 <CAFEAcA8=YAABLQL+n1gDXafhoZeUo9emmjCmi_BTqvH=3NS6GA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <064afc23-9c5f-a075-477a-002c3842cb94@amsat.org>
Date: Mon, 26 Apr 2021 17:17:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=YAABLQL+n1gDXafhoZeUo9emmjCmi_BTqvH=3NS6GA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/21 8:36 PM, Peter Maydell wrote:
> On Sat, 24 Apr 2021 at 17:22, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> The abstract PCMCIA_CARD is a bus-less TYPE_DEVICE, so devices
>> implementing it are not reset automatically.
>> Register a reset handler so children get reset on machine reset.
>>
>> Note, the DSCM-1XXXX device (TYPE_DSCM1XXXX) which inherits
>> TYPE_MICRODRIVE and PCMCIA_CARD reset itself when a disk is
>> attached or detached, but was not resetting itself on machine
>> reset.
>>
>> It doesn't seem to be an issue because it is that way since the
>> device QDev'ifycation 8 years ago, in commit d1f2c96a81a
>> ("pcmcia: QOM'ify PCMCIACardState and MicroDriveState").
>> Still, correct to have a proper API usage.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/pcmcia/pcmcia.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/hw/pcmcia/pcmcia.c b/hw/pcmcia/pcmcia.c
>> index 03d13e7d670..73656257227 100644
>> --- a/hw/pcmcia/pcmcia.c
>> +++ b/hw/pcmcia/pcmcia.c
>> @@ -6,14 +6,39 @@
>>
>>  #include "qemu/osdep.h"
>>  #include "qemu/module.h"
>> +#include "sysemu/reset.h"
>>  #include "hw/pcmcia.h"
>>
>> +static void pcmcia_card_reset_handler(void *dev)
>> +{
>> +    device_legacy_reset(DEVICE(dev));
>> +}
>> +
>> +static void pcmcia_card_realize(DeviceState *dev, Error **errp)
>> +{
>> +    qemu_register_reset(pcmcia_card_reset_handler, dev);
>> +}
>> +
>> +static void pcmcia_card_unrealize(DeviceState *dev)
>> +{
>> +    qemu_unregister_reset(pcmcia_card_reset_handler, dev);
>> +}
> 
> Why isn't a pcmcia card something that plugs into a bus ?

No clue, looks like a very old device with unfinished qdev-ification?

See pxa2xx_pcmcia_attach():

/* Insert a new card into a slot */
int pxa2xx_pcmcia_attach(void *opaque, PCMCIACardState *card)
{
    PXA2xxPCMCIAState *s = (PXA2xxPCMCIAState *) opaque;
    PCMCIACardClass *pcc;

    ...
    s->card = card;
    pcc = PCMCIA_CARD_GET_CLASS(s->card);
    ...
    s->card->slot = &s->slot;
    pcc->attach(s->card);
    ...
}

