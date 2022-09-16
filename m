Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D265BB186
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 19:14:58 +0200 (CEST)
Received: from localhost ([::1]:55808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZEvZ-0001R1-B2
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 13:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZEsD-00052t-9o; Fri, 16 Sep 2022 13:11:29 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZEsB-0003A6-FT; Fri, 16 Sep 2022 13:11:29 -0400
Received: by mail-ej1-x635.google.com with SMTP id y3so50976737ejc.1;
 Fri, 16 Sep 2022 10:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=wcRQXp2orlQTeR88WaWr+blxp6g8kxYNHI65B4h7p8c=;
 b=eKKhomJbV8b1wqeOHm4J6+ny66oTY7Y5Ogv0B1oT245JzbcSPHbs1pdZX0tj1kimiZ
 E6vOEYdAjzPmeq1tvrMgzJLn+I/tEPop3CpCjiTdiLs/hVhBQ73QgFTLbbf3LorDb48C
 m5ZwwbuVWBv0FcH/7oH4BElh6JHqog5/XHO8iUawpo1WWeZvJEwYENHsmaBV1iY8ARUz
 XXamfE8zmuSdFKhPQQHAle1X8tVMgbwjUXtWANnUuklcPbwgfQsL8WdBpAh1PzLP9Lpa
 lMGXTZm7oil4KG+RJOv6YEUufAeLVHikZu245Qth6EGuggdf17kf0skphw54GKxFWmLG
 3wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wcRQXp2orlQTeR88WaWr+blxp6g8kxYNHI65B4h7p8c=;
 b=c/jkBKp+3o11qKut5N2O1pToroowgaFrJMA1VWZCuvcwdGj4AGZMCYMdBnJLngRE5F
 KZMlYEssuP1ZPJ2kf6iDiaQuu/L54lkdBpkvCdD/Q2BIcyTpJCwO721pimkmju8yLCF+
 /CIMqYyKhkMAkAfyyYywHgYZOkmrU7acn3EtfsAShuxmPoVuFGaIGBSmHnexFoisWQBI
 SWk52SU9Jr3kR2Docv+m9f1+FB/wVO5YbhgFypka/P6qvFVXP/VplLqzmWWp5BiC1z35
 t7vHpEUoNNtBY7uZKcxlfhCp4S9+jNtX5XMZmMYSnZDe7zpv2bn+sZ65Jm7k4WQdaNjJ
 Pv8w==
X-Gm-Message-State: ACrzQf3JhkZbNZiiZE82gTWL3QlpKVDcxec/y2NQzmzVdJvRMV5yqirl
 Ydoh4Zi9IMoxD+BQArNYl14=
X-Google-Smtp-Source: AMsMyM6kQtmTaoJB0pEyS8M57NCKoeDqBJqaqUvtWdQPuzjbrkrsf/H08dCIQRco8LkzLZTmuy/5Pw==
X-Received: by 2002:a17:906:8a53:b0:780:b0bc:1abe with SMTP id
 gx19-20020a1709068a5300b00780b0bc1abemr2235288ejc.36.1663348284993; 
 Fri, 16 Sep 2022 10:11:24 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-154-155.77.191.pool.telefonica.de.
 [77.191.154.155]) by smtp.gmail.com with ESMTPSA id
 d12-20020aa7d5cc000000b0044e937ddcabsm13603852eds.77.2022.09.16.10.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 10:11:24 -0700 (PDT)
Date: Fri, 16 Sep 2022 17:11:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 09/11] hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
In-Reply-To: <CAEUhbmWhTm=G5KjoRsNuReQazJ8U87vBbALDjcU=LUhcHmOLbA@mail.gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-10-shentey@gmail.com>
 <CAEUhbmWhTm=G5KjoRsNuReQazJ8U87vBbALDjcU=LUhcHmOLbA@mail.gmail.com>
Message-ID: <5EA11DD8-D73F-45F1-ADFB-6A8FE968FE72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16=2E September 2022 10:07:28 UTC schrieb Bin Meng <bmeng=2Ecn@gmail=2Ec=
om>:
>On Thu, Sep 15, 2022 at 11:42 PM Bernhard Beschow <shentey@gmail=2Ecom> w=
rote:
>>
>> The device model's functions start with "usdhc_", so rename the defines
>> accordingly for consistency=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/sd/sdhci=2Ec | 68 +++++++++++++++++++++++++------------------------=
--
>>  1 file changed, 34 insertions(+), 34 deletions(-)
>>
>> diff --git a/hw/sd/sdhci=2Ec b/hw/sd/sdhci=2Ec
>> index 6da5e2c781=2E=2E7a5996caad 100644
>> --- a/hw/sd/sdhci=2Ec
>> +++ b/hw/sd/sdhci=2Ec
>> @@ -1577,24 +1577,24 @@ static const TypeInfo sdhci_bus_info =3D {
>>
>>  /* --- qdev i=2EMX eSDHC --- */
>>
>> -#define ESDHC_MIX_CTRL                  0x48
>> +#define USDHC_MIX_CTRL                  0x48
>>
>> -#define ESDHC_VENDOR_SPEC               0xc0
>> -#define ESDHC_IMX_FRC_SDCLK_ON          (1 << 8)
>> +#define USDHC_VENDOR_SPEC               0xc0
>> +#define USDHC_IMX_FRC_SDCLK_ON          (1 << 8)
>>
>> -#define ESDHC_DLL_CTRL                  0x60
>> +#define USDHC_DLL_CTRL                  0x60
>>
>> -#define ESDHC_TUNING_CTRL               0xcc
>> -#define ESDHC_TUNE_CTRL_STATUS          0x68
>> -#define ESDHC_WTMK_LVL                  0x44
>> +#define USDHC_TUNING_CTRL               0xcc
>> +#define USDHC_TUNE_CTRL_STATUS          0x68
>> +#define USDHC_WTMK_LVL                  0x44
>>
>>  /* Undocumented register used by guests working around erratum ERR0045=
36 */
>> -#define ESDHC_UNDOCUMENTED_REG27        0x6c
>> +#define USDHC_UNDOCUMENTED_REG27        0x6c
>>
>> -#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
>> -#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
>> +#define USDHC_CTRL_4BITBUS              (0x1 << 1)
>> +#define USDHC_CTRL_8BITBUS              (0x2 << 1)
>>
>> -#define ESDHC_PRNSTS_SDSTB              (1 << 3)
>> +#define USDHC_PRNSTS_SDSTB              (1 << 3)
>>
>>  static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
>>  {
>> @@ -1615,11 +1615,11 @@ static uint64_t usdhc_read(void *opaque, hwaddr=
 offset, unsigned size)
>>          hostctl1 =3D SDHC_DMA_TYPE(s->hostctl1) << (8 - 3);
>>
>>          if (s->hostctl1 & SDHC_CTRL_8BITBUS) {
>> -            hostctl1 |=3D ESDHC_CTRL_8BITBUS;
>> +            hostctl1 |=3D USDHC_CTRL_8BITBUS;
>>          }
>>
>>          if (s->hostctl1 & SDHC_CTRL_4BITBUS) {
>> -            hostctl1 |=3D ESDHC_CTRL_4BITBUS;
>> +            hostctl1 |=3D USDHC_CTRL_4BITBUS;
>>          }
>>
>>          ret  =3D hostctl1;
>> @@ -1630,21 +1630,21 @@ static uint64_t usdhc_read(void *opaque, hwaddr=
 offset, unsigned size)
>>
>>      case SDHC_PRNSTS:
>>          /* Add SDSTB (SD Clock Stable) bit to PRNSTS */
>> -        ret =3D sdhci_read(opaque, offset, size) & ~ESDHC_PRNSTS_SDSTB=
;
>> +        ret =3D sdhci_read(opaque, offset, size) & ~USDHC_PRNSTS_SDSTB=
;
>>          if (s->clkcon & SDHC_CLOCK_INT_STABLE) {
>> -            ret |=3D ESDHC_PRNSTS_SDSTB;
>> +            ret |=3D USDHC_PRNSTS_SDSTB;
>>          }
>>          break;
>>
>> -    case ESDHC_VENDOR_SPEC:
>> +    case USDHC_VENDOR_SPEC:
>>          ret =3D s->vendor_spec;
>>          break;
>> -    case ESDHC_DLL_CTRL:
>> -    case ESDHC_TUNE_CTRL_STATUS:
>> -    case ESDHC_UNDOCUMENTED_REG27:
>> -    case ESDHC_TUNING_CTRL:
>> -    case ESDHC_MIX_CTRL:
>> -    case ESDHC_WTMK_LVL:
>> +    case USDHC_DLL_CTRL:
>> +    case USDHC_TUNE_CTRL_STATUS:
>> +    case USDHC_UNDOCUMENTED_REG27:
>> +    case USDHC_TUNING_CTRL:
>> +    case USDHC_MIX_CTRL:
>> +    case USDHC_WTMK_LVL:
>>          ret =3D 0;
>>          break;
>>      }
>> @@ -1660,18 +1660,18 @@ usdhc_write(void *opaque, hwaddr offset, uint64=
_t val, unsigned size)
>>      uint32_t value =3D (uint32_t)val;
>>
>>      switch (offset) {
>> -    case ESDHC_DLL_CTRL:
>> -    case ESDHC_TUNE_CTRL_STATUS:
>> -    case ESDHC_UNDOCUMENTED_REG27:
>> -    case ESDHC_TUNING_CTRL:
>> -    case ESDHC_WTMK_LVL:
>> +    case USDHC_DLL_CTRL:
>> +    case USDHC_TUNE_CTRL_STATUS:
>> +    case USDHC_UNDOCUMENTED_REG27:
>> +    case USDHC_TUNING_CTRL:
>> +    case USDHC_WTMK_LVL:
>>          break;
>>
>> -    case ESDHC_VENDOR_SPEC:
>> +    case USDHC_VENDOR_SPEC:
>>          s->vendor_spec =3D value;
>>          switch (s->vendor) {
>>          case SDHCI_VENDOR_IMX:
>> -            if (value & ESDHC_IMX_FRC_SDCLK_ON) {
>> +            if (value & USDHC_IMX_FRC_SDCLK_ON) {
>>                  s->prnsts &=3D ~SDHC_IMX_CLOCK_GATE_OFF;
>>              } else {
>>                  s->prnsts |=3D SDHC_IMX_CLOCK_GATE_OFF;
>> @@ -1740,12 +1740,12 @@ usdhc_write(void *opaque, hwaddr offset, uint64=
_t val, unsigned size)
>>           * Second, split "Data Transfer Width" from bits 2 and 1 in to
>>           * bits 5 and 1
>>           */
>> -        if (value & ESDHC_CTRL_8BITBUS) {
>> +        if (value & USDHC_CTRL_8BITBUS) {
>>              hostctl1 |=3D SDHC_CTRL_8BITBUS;
>>          }
>>
>> -        if (value & ESDHC_CTRL_4BITBUS) {
>> -            hostctl1 |=3D ESDHC_CTRL_4BITBUS;
>> +        if (value & USDHC_CTRL_4BITBUS) {
>> +            hostctl1 |=3D USDHC_CTRL_4BITBUS;
>>          }
>>
>>          /*
>> @@ -1768,11 +1768,11 @@ usdhc_write(void *opaque, hwaddr offset, uint64=
_t val, unsigned size)
>>          sdhci_write(opaque, offset, value, size);
>>          break;
>>
>> -    case ESDHC_MIX_CTRL:
>> +    case USDHC_MIX_CTRL:
>>          /*
>>           * So, when SD/MMC stack in Linux tries to write to "Transfer
>>           * Mode Register", ESDHC i=2EMX quirk code will translate it
>
>Here I assume ESDHC i=2EMX means the Linux eSDHC driver for i=2EMX, so no
>need to replace ESDHC with USDHC?

I see=2E Prefix with IMX_ then and rename the functions for consistency? T=
hen prefix the MPC ones with MPC_?

>
>> -         * into a write to ESDHC_MIX_CTRL, so we do the opposite in
>> +         * into a write to USDHC_MIX_CTRL, so we do the opposite in
>>           * order to get where we started
>>           *
>>           * Note that Auto CMD23 Enable bit is located in a wrong place
>> --
>
>Overall LGTM:
>Reviewed-by: Bin Meng <bmeng=2Ecn@gmail=2Ecom>


