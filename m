Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0858A612270
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 13:35:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ook6Q-0002wt-08; Sat, 29 Oct 2022 07:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ook6E-0002wN-4i; Sat, 29 Oct 2022 07:34:08 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ook6C-00088a-4p; Sat, 29 Oct 2022 07:34:01 -0400
Received: by mail-ed1-x536.google.com with SMTP id z18so6304582edb.9;
 Sat, 29 Oct 2022 04:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTd+7LNVLJqurlB1aAgkPpQ3yoh4dje/MIK5EYlszOU=;
 b=UEbyKRDqyiFEptHP1vcMSmdfwCRQQ0W2Jw3zGFX1ZginydWbKqkQD6pFuBho9v4iIf
 SWjNdbcGvbS+oNJeSi8vxQtE2iXyHj/8zz6XbaO2wJYgXDA223TGZ0xsFxT58mgAvX1y
 w6T64y8TN+bqQTIa10Cca35W7QeLW/qnguDFv8Uv56vsPQUgzwaQInJQL+jCd+xjqscn
 /Jbdg+CIfZDjsujtM6iHNOopuDg4ecLB1TCbBdUJk19Xm+Q6dg3ArNU89Q+lPURSVpVB
 0ulW7VEqwyvNhNxf34D1Wc56Td4dxzqWCqbNcBaZpbpc1Xser8rgIs2ZVCj47jYQRGih
 Emqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XTd+7LNVLJqurlB1aAgkPpQ3yoh4dje/MIK5EYlszOU=;
 b=CUa2s+6TvdrL7FlgqbfqhsEtuFShBvyZS8Ibsv73vPteVRFz9r4wF08B3CVd+GX1l+
 4tKuFkO/gsY9FJHmw3e7oI0f6svGUqA4aymJ+VUcMzrCxMMqPJ8hQ7L2o9Sa7+9JfBJW
 YumZ0ieK6y3G/Ce9EeUE4RC2Sjw7JS4RLp+6GbqTCPxXW1H+enZlYTWec4mFkpn/tubn
 +az+9FIZwr8Cdt1rVRMcKVVDsI9wQAdIWtPHV4qSKGCFxgyDhJDiQ8gRYS2SH1oKErFL
 vBr/tED3Z+pwVTQMTodkgMN2Y0LMIyOUiVTjvrktftmI+kKkehpe4ucjxi8XfJkP+fil
 Rv+w==
X-Gm-Message-State: ACrzQf3UMGYGQAr0qol3uyy2YdcRZmcRShaqmqeRhUiZGqeE+QtIMgRE
 9eHqNHVE1J2PhoAHC6BJojk=
X-Google-Smtp-Source: AMsMyM5/rQOjGrH24gBIgVCCsVTojCMKOguT62zlF/PNLQCFI850g+m94J9UML/qblR9Rr8jNyY3pw==
X-Received: by 2002:a05:6402:2409:b0:456:f97b:3794 with SMTP id
 t9-20020a056402240900b00456f97b3794mr3923099eda.145.1667043236512; 
 Sat, 29 Oct 2022 04:33:56 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200c875a4c76b3be6c4.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:c875:a4c7:6b3b:e6c4])
 by smtp.gmail.com with ESMTPSA id
 x1-20020aa7dac1000000b00461bd82581asm658659eds.84.2022.10.29.04.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 04:33:56 -0700 (PDT)
Date: Sat, 29 Oct 2022 11:33:51 +0000
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
In-Reply-To: <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-7-shentey@gmail.com>
 <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
Message-ID: <724F8CC8-C5E8-4785-B5C2-F1D327863717@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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

Am 27=2E Oktober 2022 21:40:01 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>Hi Bernhard,
>
>On 18/10/22 23:01, Bernhard Beschow wrote:
>> Will allow e500 boards to access SD cards using just their own devices=
=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/sd/sdhci=2Ec         | 120 +++++++++++++++++++++++++++++++++++++++=
++-
>>   include/hw/sd/sdhci=2Eh |   3 ++
>>   2 files changed, 122 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/hw/sd/sdhci=2Ec b/hw/sd/sdhci=2Ec
>> index 306070c872=2E=2E8d8ad9ff24 100644
>> --- a/hw/sd/sdhci=2Ec
>> +++ b/hw/sd/sdhci=2Ec
>> @@ -1369,6 +1369,7 @@ void sdhci_initfn(SDHCIState *s)
>>       s->transfer_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data=
_transfer, s);
>>         s->io_ops =3D &sdhci_mmio_ops;
>> +    s->io_registers_map_size =3D SDHC_REGISTERS_MAP_SIZE;
>>   }
>>     void sdhci_uninitfn(SDHCIState *s)
>> @@ -1392,7 +1393,7 @@ void sdhci_common_realize(SDHCIState *s, Error **=
errp)
>>       s->fifo_buffer =3D g_malloc0(s->buf_maxsz);
>>         memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhc=
i",
>> -                          SDHC_REGISTERS_MAP_SIZE);
>> +                          s->io_registers_map_size);
>
>I don't think we want to change this region size=2E [see below]
>
>>   void sdhci_common_unrealize(SDHCIState *s)
>> @@ -1575,6 +1576,122 @@ static const TypeInfo sdhci_bus_info =3D {
>>       =2Eclass_init =3D sdhci_bus_class_init,
>>   };
>>   +/* --- qdev Freescale eSDHC --- */
>> +
>> +/* Watermark Level Register */
>> +#define ESDHC_WML                    0x44
>> +
>> +/* Control Register for DMA transfer */
>> +#define ESDHC_DMA_SYSCTL            0x40c
>> +
>> +#define ESDHC_REGISTERS_MAP_SIZE    0x410
>
>My preferred approach would be to create a container region with a
>size of ESDHC_REGISTERS_MAP_SIZE=2E Map the SDHC_REGISTERS_MAP region
>in the container at offset 0, priority -1=2E Add 2 register regions
>for ESDHC_WML and ESDHC_DMA_SYSCTL, and map them with priority 1 in
>the container=2E =2E=2E=2E
>
>> +static uint64_t esdhci_read(void *opaque, hwaddr offset, unsigned size=
)
>> +{
>> +    uint64_t ret;
>> +
>> +    switch (offset) {
>> +    case SDHC_SYSAD:
>> +    case SDHC_BLKSIZE:
>> +    case SDHC_ARGUMENT:
>> +    case SDHC_TRNMOD:
>> +    case SDHC_RSPREG0:
>> +    case SDHC_RSPREG1:
>> +    case SDHC_RSPREG2:
>> +    case SDHC_RSPREG3:
>> +    case SDHC_BDATA:
>> +    case SDHC_PRNSTS:
>> +    case SDHC_HOSTCTL:
>> +    case SDHC_CLKCON:
>> +    case SDHC_NORINTSTS:
>> +    case SDHC_NORINTSTSEN:
>> +    case SDHC_NORINTSIGEN:
>> +    case SDHC_ACMD12ERRSTS:
>> +    case SDHC_CAPAB:
>> +    case SDHC_SLOT_INT_STATUS:
>> +        ret =3D sdhci_read(opaque, offset, size);
>> +        break;
>
>=2E=2E=2E Then you don't need these cases=2E
>
>> +    case ESDHC_WML:
>> +    case ESDHC_DMA_SYSCTL:
>> +        ret =3D 0;
>> +        qemu_log_mask(LOG_UNIMP, "ESDHC rd @0x%02" HWADDR_PRIx
>> +                      " not implemented\n", offset);
>
>But then I realize you only treat these 2 registers as UNIMP=2E
>
>So now, I'd create 1 UNIMP region for ESDHC_WML and map it
>into SDHC_REGISTERS_MAP (s->iomem) with priority 1, and add
>another UNIMP region of ESDHC_REGISTERS_MAP_SIZE - SDHC_REGISTERS_MAP_SIZ=
E (=3D 0x310) and map it normally at offset
>0x100 (SDHC_REGISTERS_MAP_SIZE)=2E Look at create_unimp() in
>hw/arm/bcm2835_peripherals=2Ec=2E
>
>But the ESDHC_WML register has address 0x44 and fits inside the
>SDHC_REGISTERS_MAP region, so likely belong there=2E 0x44 is the
>upper part of the SDHC_CAPAB register=2E These bits are undefined
>on the spec v2, which I see you are setting in esdhci_init()=2E
>So this register should already return 0, otherwise we have
>a bug=2E Thus we don't need to handle this ESDHC_WML particularly=2E
>
>And your model is reduced to handling create_unimp() in esdhci_realize()=
=2E
>
>Am I missing something?

The mmio ops are big endian and need to be aligned to a 4-byte boundary=2E=
 It took me quite a while to debug this=2E So shall I just create an additi=
onal memory region for the region above SDHC_REGISTERS_MAP_SIZE for ESDHC_D=
MA_SYSCTL?

Best regards,
Bernhard
>
>Regards,
>
>Phil=2E


