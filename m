Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E187061231F
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 15:06:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oolVY-0000KI-Ky; Sat, 29 Oct 2022 09:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oolVT-0000IM-5j; Sat, 29 Oct 2022 09:04:11 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oolVR-0007yZ-6v; Sat, 29 Oct 2022 09:04:10 -0400
Received: by mail-ej1-x62d.google.com with SMTP id y14so18983150ejd.9;
 Sat, 29 Oct 2022 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgG0oAgc3NcwFx7qz0yLnPJ37y05efIKstjMt2ZTe7Q=;
 b=VlLpeC89+q/fb1yZiLFLa5vklw9i/ulSSiocuJvjtqLGPU2yiaUhr+SGL2ypTWn0jC
 V7+YLp/RXFmmjjdXuOkpguRbs77pXdlDLN2FZuQq1/BzNFiJlFsxQUjoLBzw/cA7+kCO
 aILFIARp9U4YB9SLp1/yCa3d5R/+XsPaFS9BuWp7x82iBuhH6fCFdU3nfYt/ivtAtJ6E
 rd9cn3fUGNkjv3U9RAg7ASFOS5L1JMBQxXm64Eq2x1NboTvOKYefvNHaUy85kkGxZfia
 zaydF/tVQKbEX4U/yVW1mtfX6dzDhUTJDiwQGjXcgzQvQnTE9mMidzsB/nqTrO6XQlNn
 PmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgG0oAgc3NcwFx7qz0yLnPJ37y05efIKstjMt2ZTe7Q=;
 b=4EoTnH1dyEPgbEtT/AtqgvpS+yQK2CLDXVYvAHG/+IVN6+fnJ8M1yf6j1DvPfUUiNx
 hPYK7A4GyncN/E1Ohai+kcIYPnbT+CzUeFXlal+qoieBAvTVxIDlxaEIJ4x9xrjyVHnM
 3rQwhM0ORM86zuDFveYox/gCyJg4sd/b8V205gJpWym7tMC0H5ZjEWBnGp3i0t9z+Ovw
 AY9Di/mD1dk5OTGl/Kr8ToeBgOUB6rmOOie/Di0xWM9+5j9dh+Q8Cwx8e6hgZ7pEn35f
 bAf9tejwQQA6Ej0tJSQACo2SfrV4isqiyHUvnGHEK14ceYn6oBn97fZOfyZf8T9jHxXd
 R0Rw==
X-Gm-Message-State: ACrzQf0fN8H4VesX416gIqrf5adL+0JiNoMeQg8ruEYasF1hJafMAIMR
 x2kCbA/6LPdjwoKkzq+zN0M=
X-Google-Smtp-Source: AMsMyM4uBC4DQU0BVF8+d0D4UJUBvGvfbOLkLfvR3LXnGS8kQZ8VKZm32+DpFp9MLN8FBq9mLz24Jw==
X-Received: by 2002:a17:907:1ca7:b0:7ad:9227:5288 with SMTP id
 nb39-20020a1709071ca700b007ad92275288mr3732128ejc.62.1667048646344; 
 Sat, 29 Oct 2022 06:04:06 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200c875a4c76b3be6c4.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:c875:a4c7:6b3b:e6c4])
 by smtp.gmail.com with ESMTPSA id
 23-20020a170906329700b007821f4bc328sm644886ejw.178.2022.10.29.06.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 06:04:05 -0700 (PDT)
Date: Sat, 29 Oct 2022 13:04:00 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>, 
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_6/7=5D_hw/sd/sdhci=3A_Imp?=
 =?US-ASCII?Q?lement_Freescale_eSDHC_device_model?=
In-Reply-To: <724F8CC8-C5E8-4785-B5C2-F1D327863717@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-7-shentey@gmail.com>
 <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
 <724F8CC8-C5E8-4785-B5C2-F1D327863717@gmail.com>
Message-ID: <590683A5-2774-432C-A47A-ED755054479C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 29=2E Oktober 2022 11:33:51 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>Am 27=2E Oktober 2022 21:40:01 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>>Hi Bernhard,
>>
>>On 18/10/22 23:01, Bernhard Beschow wrote:
>>> Will allow e500 boards to access SD cards using just their own devices=
=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> ---
>>>   hw/sd/sdhci=2Ec         | 120 ++++++++++++++++++++++++++++++++++++++=
+++-
>>>   include/hw/sd/sdhci=2Eh |   3 ++
>>>   2 files changed, 122 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/hw/sd/sdhci=2Ec b/hw/sd/sdhci=2Ec
>>> index 306070c872=2E=2E8d8ad9ff24 100644
>>> --- a/hw/sd/sdhci=2Ec
>>> +++ b/hw/sd/sdhci=2Ec
>>> @@ -1369,6 +1369,7 @@ void sdhci_initfn(SDHCIState *s)
>>>       s->transfer_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_dat=
a_transfer, s);
>>>         s->io_ops =3D &sdhci_mmio_ops;
>>> +    s->io_registers_map_size =3D SDHC_REGISTERS_MAP_SIZE;
>>>   }
>>>     void sdhci_uninitfn(SDHCIState *s)
>>> @@ -1392,7 +1393,7 @@ void sdhci_common_realize(SDHCIState *s, Error *=
*errp)
>>>       s->fifo_buffer =3D g_malloc0(s->buf_maxsz);
>>>         memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdh=
ci",
>>> -                          SDHC_REGISTERS_MAP_SIZE);
>>> +                          s->io_registers_map_size);
>>
>>I don't think we want to change this region size=2E [see below]
>>
>>>   void sdhci_common_unrealize(SDHCIState *s)
>>> @@ -1575,6 +1576,122 @@ static const TypeInfo sdhci_bus_info =3D {
>>>       =2Eclass_init =3D sdhci_bus_class_init,
>>>   };
>>>   +/* --- qdev Freescale eSDHC --- */
>>> +
>>> +/* Watermark Level Register */
>>> +#define ESDHC_WML                    0x44
>>> +
>>> +/* Control Register for DMA transfer */
>>> +#define ESDHC_DMA_SYSCTL            0x40c
>>> +
>>> +#define ESDHC_REGISTERS_MAP_SIZE    0x410
>>
>>My preferred approach would be to create a container region with a
>>size of ESDHC_REGISTERS_MAP_SIZE=2E Map the SDHC_REGISTERS_MAP region
>>in the container at offset 0, priority -1=2E Add 2 register regions
>>for ESDHC_WML and ESDHC_DMA_SYSCTL, and map them with priority 1 in
>>the container=2E =2E=2E=2E
>>
>>> +static uint64_t esdhci_read(void *opaque, hwaddr offset, unsigned siz=
e)
>>> +{
>>> +    uint64_t ret;
>>> +
>>> +    switch (offset) {
>>> +    case SDHC_SYSAD:
>>> +    case SDHC_BLKSIZE:
>>> +    case SDHC_ARGUMENT:
>>> +    case SDHC_TRNMOD:
>>> +    case SDHC_RSPREG0:
>>> +    case SDHC_RSPREG1:
>>> +    case SDHC_RSPREG2:
>>> +    case SDHC_RSPREG3:
>>> +    case SDHC_BDATA:
>>> +    case SDHC_PRNSTS:
>>> +    case SDHC_HOSTCTL:
>>> +    case SDHC_CLKCON:
>>> +    case SDHC_NORINTSTS:
>>> +    case SDHC_NORINTSTSEN:
>>> +    case SDHC_NORINTSIGEN:
>>> +    case SDHC_ACMD12ERRSTS:
>>> +    case SDHC_CAPAB:
>>> +    case SDHC_SLOT_INT_STATUS:
>>> +        ret =3D sdhci_read(opaque, offset, size);
>>> +        break;
>>
>>=2E=2E=2E Then you don't need these cases=2E
>>
>>> +    case ESDHC_WML:
>>> +    case ESDHC_DMA_SYSCTL:
>>> +        ret =3D 0;
>>> +        qemu_log_mask(LOG_UNIMP, "ESDHC rd @0x%02" HWADDR_PRIx
>>> +                      " not implemented\n", offset);
>>
>>But then I realize you only treat these 2 registers as UNIMP=2E
>>
>>So now, I'd create 1 UNIMP region for ESDHC_WML and map it
>>into SDHC_REGISTERS_MAP (s->iomem) with priority 1, and add
>>another UNIMP region of ESDHC_REGISTERS_MAP_SIZE - SDHC_REGISTERS_MAP_SI=
ZE (=3D 0x310) and map it normally at offset
>>0x100 (SDHC_REGISTERS_MAP_SIZE)=2E Look at create_unimp() in
>>hw/arm/bcm2835_peripherals=2Ec=2E
>>
>>But the ESDHC_WML register has address 0x44 and fits inside the
>>SDHC_REGISTERS_MAP region, so likely belong there=2E 0x44 is the
>>upper part of the SDHC_CAPAB register=2E These bits are undefined
>>on the spec v2, which I see you are setting in esdhci_init()=2E
>>So this register should already return 0, otherwise we have
>>a bug=2E Thus we don't need to handle this ESDHC_WML particularly=2E

My idea here was to catch this unimplemented case in order to indicate thi=
s clearly to users=2E Perhaps it nudges somebody to provide a patch?

>>
>>And your model is reduced to handling create_unimp() in esdhci_realize()=
=2E
>>
>>Am I missing something?
>
>The mmio ops are big endian and need to be aligned to a 4-byte boundary=
=2E It took me quite a while to debug this=2E So shall I just create an add=
itional memory region for the region above SDHC_REGISTERS_MAP_SIZE for ESDH=
C_DMA_SYSCTL?

All in all I currently don't have a better idea than keeping the custom i/=
o ops for the standard region and adding an additional unimplemented region=
 for ESDHC_DMA_SYSCTL=2E I think I'd have to dynamically allocate memory fo=
r it where I still need to figure out how not to leak it=2E

Best regards,
Bernhard
>
>Best regards,
>Bernhard
>>
>>Regards,
>>
>>Phil=2E
>


