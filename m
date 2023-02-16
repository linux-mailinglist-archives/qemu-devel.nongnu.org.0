Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287A3698929
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 01:20:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSRzO-0004ZT-Pj; Wed, 15 Feb 2023 19:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSRzM-0004ZD-3e; Wed, 15 Feb 2023 19:19:04 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSRzJ-0002Ae-3B; Wed, 15 Feb 2023 19:19:03 -0500
Received: by mail-ej1-x62e.google.com with SMTP id my5so1204507ejc.7;
 Wed, 15 Feb 2023 16:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Gzt82wbJgjSQI28uDgx2SND9ZTS05C0OvM84aT+VAs=;
 b=DPGDqohIVXf1fXMbRqNEeRqkGhjTIDgPSqOc8caJ5MUD7JC5krAjdJSALMTqObdZDB
 vO8pxvXl6p0z7hnqde0NttD7WBnmUqfUOUPOv2hozTu+fEmgaMK+mMEU95xFpXtWmHO6
 F9W0qoV+GZfUJNdqjZ03F6b5Q2U3Ih+6aEtHvRlFHHANETZEBzV8q0McJfLAsoPkzOjL
 c5ljr4EoToObralQxjZPWvVgbf+v+EOLPMaz/e59UXafPFEMvOwf7apHkoR8E2g6NS8/
 aeVdDGYItRb+H1PAiE7EAaDJrSLnGAMRYLoaWKKGgdwy5s2eIsWBaaVW3g6Kqa9ig54Y
 lwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Gzt82wbJgjSQI28uDgx2SND9ZTS05C0OvM84aT+VAs=;
 b=diiz8psfCgejD44JjWh0iu+Qo4d6OyquFNSo4pQxqjZtaPPWfHasyu83S2/gmJVWbg
 m1KzZfgq1M2VtFC1u+F40+9+dKOkDMbXCzZmnEZM+sV1E80NXVDA4v+bygB2gv6n2uv2
 H9MfOSHdpYjfSwLihl5FQXI/kZV59x9MSahK+nyv5ACgzmuiOnM9jcCSIkaVHPWyiYhX
 +8sfJgWfr/BbAW+7LLFWPrpQTCaiIw9haCO2PHX7tngugwWKd552IegW0eFYGF06hUfr
 Wo/tz1ylKdP1+jZ3WR3NZ5xakhS6WQ00Q8cmrna0fMeQXy7vaxaQQPBbYPlRc+nabTUB
 hI6Q==
X-Gm-Message-State: AO0yUKVoskuo3t/8xG/CW36nP8lyIc4ETMLNdpzeMaCoGxqI6UoZGo1H
 B8pf/1oL06rRDCYIfvR3oMU=
X-Google-Smtp-Source: AK7set9kkwKkt6zKQ41bAy7rjDTjYobJVmOXbk8UdG8nYrKtZYof10UlIvvDs6E6hs8kuXaJK5c3tw==
X-Received: by 2002:a17:906:dcf:b0:878:625c:c8ff with SMTP id
 p15-20020a1709060dcf00b00878625cc8ffmr4181666eji.54.1676506732519; 
 Wed, 15 Feb 2023 16:18:52 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-243-024.77.183.pool.telefonica.de.
 [77.183.243.24]) by smtp.gmail.com with ESMTPSA id
 i2-20020a170906850200b0087873afb1b4sm52042ejx.41.2023.02.15.16.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 16:18:52 -0800 (PST)
Date: Thu, 16 Feb 2023 00:18:47 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 17/20] hw/ide/pci: Unexport bmdma_active_if()
In-Reply-To: <0dc24395-ca89-323e-db20-7aecf0ed5df6@eik.bme.hu>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-18-philmd@linaro.org>
 <AF8AE36D-4C5E-465D-A416-B854707166D7@gmail.com>
 <0dc24395-ca89-323e-db20-7aecf0ed5df6@eik.bme.hu>
Message-ID: <7D46E540-4C29-4439-981B-93D33DC7F481@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 15=2E Februar 2023 21:09:10 UTC schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Wed, 15 Feb 2023, Bernhard Beschow wrote:
>> Am 15=2E Februar 2023 11:27:09 UTC schrieb "Philippe Mathieu-Daud=C3=A9=
" <philmd@linaro=2Eorg>:
>>> From: Bernhard Beschow <shentey@gmail=2Ecom>
>>>=20
>>> The function is only used inside ide/pci=2Ec, so doesn't need to be ex=
ported=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>> ---
>>> hw/ide/pci=2Ec         | 6 ++++++
>>> include/hw/ide/pci=2Eh | 6 ------
>>> 2 files changed, 6 insertions(+), 6 deletions(-)
>>>=20
>>> diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>>> index 2ddcb49b27=2E=2Efc9224bbc9 100644
>>> --- a/hw/ide/pci=2Ec
>>> +++ b/hw/ide/pci=2Ec
>>> @@ -104,6 +104,12 @@ const MemoryRegionOps pci_ide_data_le_ops =3D {
>>>     =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>>> };
>>>=20
>>> +static IDEState *bmdma_active_if(BMDMAState *bmdma)
>>> +{
>>> +    assert(bmdma->bus->retry_unit !=3D (uint8_t)-1);
>>> +    return bmdma->bus->ifs + bmdma->bus->retry_unit;
>>> +}
>>> +
>>> static void bmdma_start_dma(const IDEDMA *dma, IDEState *s,
>>>                             BlockCompletionFunc *dma_cb)
>>> {
>>> diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>>> index 2a6284acac=2E=2E7b5e3f6e1c 100644
>>> --- a/include/hw/ide/pci=2Eh
>>> +++ b/include/hw/ide/pci=2Eh
>>> @@ -55,12 +55,6 @@ struct PCIIDEState {
>>>     MemoryRegion data_bar[2];
>>> };
>>>=20
>>> -static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
>>> -{
>>> -    assert(bmdma->bus->retry_unit !=3D (uint8_t)-1);
>>> -    return bmdma->bus->ifs + bmdma->bus->retry_unit;
>>> -}
>>> -
>>> void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
>>> void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>>> extern MemoryRegionOps bmdma_addr_ioport_ops;
>>=20
>> Cool, where did you find this? ;)
>>=20
>> This patch, your other patches doing s/ide/ide_bus/, and the fact that =
IDEBus instantiates two IDE devices itself make me wonder whether the IDE d=
evices should really be instantiated in the usual QOM way=2E Then perhaps i=
t could turn out that all the s/ide/ide_bus/ patches aren't really needed s=
ince the functions could operate on the IDE device directly=2E Not sure tho=
ugh=2E=2E=2E
>>=20
>> This might all be a rabbit hole, but since you already started looking =
into it=2E=2E=2E ;)
>
>If you want some more, we've also found another problem with ports that s=
hould not have anythnig connected but still appear to have a non-working de=
vice that causes some delay during guest boot (and I think this is the reas=
on the pegasos2 firmware prints an "ATA device not present or not respondin=
g" error while detecting IDE devices=2E

Yes, that would make sense and is indeed the "phantom" behavior I would be=
 expecting=2E

>This was discussed here:
>
>https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2020-02/msg02468=2Eh=
tml
>
>Just to spread knowledge about it=2E I don't exoect this to be fixed as i=
t does not cause much trouble just if you wanted to dig into it in the futu=
re I thought I'd let you know=2E

Interesting read=2E=2E=2E Thanks for sharing!

Best regards,
Bernhard
>
>Regards,
>BALATON Zoltan

