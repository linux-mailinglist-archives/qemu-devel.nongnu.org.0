Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5A85BB19A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 19:29:44 +0200 (CEST)
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZF9q-0002lx-Ro
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 13:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZF7d-0000Av-MA; Fri, 16 Sep 2022 13:27:25 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZF7a-0007jJ-Am; Fri, 16 Sep 2022 13:27:25 -0400
Received: by mail-ed1-x52d.google.com with SMTP id q21so32530726edc.9;
 Fri, 16 Sep 2022 10:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=/ae3j86BNByEu2/q9mfYRXa0ok9GWhNnZdGrLqe6NaM=;
 b=Em/zY7Mcc8++b3/ia/RIr92XB65QLZqxJ546VNXBcqXgLF6fprjURwsEEOW/35Q9q0
 Uk++Tbg0NEHdY/Yq/Qr2X1r9dMnfAHt5BH+0ZjHjdzw1viom4PEKPt57hEj4i7SOub24
 OxUNE0DVWl/U8L0Aqqnq2yrcx8i/WacIgC4oHPCYDGsb928YvlvdK6SD/WnT2YsMmw8w
 /bg2SW65QJiDmFXs/9dPtwdhZQm0d4MZ1xSVePwbNrFQTmsUC6jfEmMZD/6IeNoFsHcr
 3b+u+J8i3ivYwVWoscIRQwe623D33O1/YpCPNjhKXK8JzlP3qrg2nleYR9Y0GOCUeNDz
 C5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/ae3j86BNByEu2/q9mfYRXa0ok9GWhNnZdGrLqe6NaM=;
 b=T+I5z6o/c+Or6fhYOHKJoV1zEZ/4D5UeKgvS1rwuqfpTYhPz70u/Gne3qRGN/V2bXo
 WMmY7nepLfN5dnrCTWgMix9uXLllG6SV8ZS3J24kGs2v8CgwDxvvvMYAE6BgMp7BNROX
 cxbwbgzz0KSC/AsiVLZzqpf+Fjlw0Igs6RQMNfSEfO2EQxgt1lJb//1Y/DR8+BOwVaZd
 3N8ih5AuTFtEJoRXEjfGw/kOoZ6id5vavvESI8vJ3nH7aVyGQt1qfK5lwUrqWa+gBWFQ
 EK8lNb1qonDplqAGnI4meoqr8x/PyTe8xfc1QaBcMVGU816cmSu80GLrJb/RgHHQzxWB
 aDAQ==
X-Gm-Message-State: ACrzQf3blG/FSTS0jjH/bmGUlLhra6CvDpPg2QUlXZpsjAE6z9qRXuuc
 iwcCskVet5CAi9zjV+RMWTk=
X-Google-Smtp-Source: AMsMyM4ekUHX4rzLaiAaUmMX6cHu9VUrjpc+DoZ3NT+qZzbpx57N6QznOK4VMtvTf6oaHeSCe+ttsw==
X-Received: by 2002:a05:6402:7c5:b0:44e:9319:4b26 with SMTP id
 u5-20020a05640207c500b0044e93194b26mr4815641edy.105.1663349235358; 
 Fri, 16 Sep 2022 10:27:15 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-154-155.77.191.pool.telefonica.de.
 [77.191.154.155]) by smtp.gmail.com with ESMTPSA id
 ci25-20020a170906c35900b0072b3406e9c2sm10716007ejb.95.2022.09.16.10.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 10:27:14 -0700 (PDT)
Date: Fri, 16 Sep 2022 17:27:09 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 10/11] hw/sd/sdhci: Implement Freescale eSDHC device model
In-Reply-To: <CAEUhbmWgSLJa-zm38R_itVGHnLgt64yzTLo3G7joE41=9V2_rA@mail.gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-11-shentey@gmail.com>
 <CAEUhbmWgSLJa-zm38R_itVGHnLgt64yzTLo3G7joE41=9V2_rA@mail.gmail.com>
Message-ID: <EC78518A-D06D-4BFD-A1DF-30F5B58F4142@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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

Am 16=2E September 2022 15:15:03 UTC schrieb Bin Meng <bmeng=2Ecn@gmail=2Ec=
om>:
>On Thu, Sep 15, 2022 at 11:30 PM Bernhard Beschow <shentey@gmail=2Ecom> w=
rote:
>>
>> Will allow e500 boards to access SD cards using just their own devices=
=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/sd/sdhci=2Ec         | 147 ++++++++++++++++++++++++++++++++++++++++=
+-
>>  include/hw/sd/sdhci=2Eh |   3 +
>>  2 files changed, 149 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/sd/sdhci=2Ec b/hw/sd/sdhci=2Ec
>> index 7a5996caad=2E=2E09285ccfa1 100644
>> --- a/hw/sd/sdhci=2Ec
>> +++ b/hw/sd/sdhci=2Ec
>> @@ -1369,6 +1369,7 @@ void sdhci_initfn(SDHCIState *s)
>>      s->transfer_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_=
transfer, s);
>>
>>      s->io_ops =3D &sdhci_mmio_ops;
>> +    s->io_registers_map_size =3D SDHC_REGISTERS_MAP_SIZE;
>>  }
>>
>>  void sdhci_uninitfn(SDHCIState *s)
>> @@ -1392,7 +1393,7 @@ void sdhci_common_realize(SDHCIState *s, Error **=
errp)
>>      s->fifo_buffer =3D g_malloc0(s->buf_maxsz);
>>
>>      memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
>> -                          SDHC_REGISTERS_MAP_SIZE);
>> +                          s->io_registers_map_size);
>>  }
>>
>>  void sdhci_common_unrealize(SDHCIState *s)
>> @@ -1575,6 +1576,149 @@ static const TypeInfo sdhci_bus_info =3D {
>>      =2Eclass_init =3D sdhci_bus_class_init,
>>  };
>>
>> +/* --- qdev Freescale eSDHC --- */
>> +
>> +/* Host Controller Capabilities Register 2 */
>> +#define ESDHC_CAPABILITIES_1        0x114
>> +
>> +/* Control Register for DMA transfer */
>> +#define ESDHC_DMA_SYSCTL            0x40c
>> +#define ESDHC_PERIPHERAL_CLK_SEL    0x00080000
>> +#define ESDHC_FLUSH_ASYNC_FIFO      0x00040000
>> +#define ESDHC_DMA_SNOOP             0x00000040
>
>It looks the above 3 bit fields are not used?

Yes, possibly=2E I'll check for more unused stuff=2E

>> +
>> +#define ESDHC_REGISTERS_MAP_SIZE    0x410
>> +
>> +static uint64_t esdhci_read(void *opaque, hwaddr offset, unsigned size=
)
>> +{
>> +    uint64_t ret;
>> +
>> +    if (size !=3D 4) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PR=
Ix
>> +                      " wrong size\n", size, offset);
>> +        return 0;
>> +    }
>> +
>> +    if (offset & 0x3) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PR=
Ix
>> +                      " unaligned\n", size, offset);
>> +        return 0;
>> +    }
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
>> +
>> +    case ESDHC_DMA_SYSCTL:
>> +    case 0x44:
>
>Can we define a macro for this offset?

Sure=2E Not sure why I didn't=2E

>> +        ret =3D 0;
>> +        qemu_log_mask(LOG_UNIMP, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
>> +                      " not implemented\n", size, offset);
>> +        break;
>> +
>> +    default:
>> +        ret =3D 0;
>> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PR=
Ix
>> +                      " unknown offset\n", size, offset);
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void esdhci_write(void *opaque, hwaddr offset, uint64_t val,
>> +                         unsigned size)
>> +{
>> +    if (size !=3D 4) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PR=
Ix
>> +                      " <- 0x%08lx wrong size\n", size, offset, val);
>> +        return;
>> +    }
>> +
>> +    if (offset & 0x3) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PR=
Ix
>> +                      " <- 0x%08lx unaligned\n", size, offset, val);
>> +        return;
>> +    }
>> +
>> +    switch (offset) {
>> +    case SDHC_SYSAD:
>> +    case SDHC_BLKSIZE:
>> +    case SDHC_ARGUMENT:
>> +    case SDHC_TRNMOD:
>> +    case SDHC_BDATA:
>> +    case SDHC_HOSTCTL:
>> +    case SDHC_CLKCON:
>> +    case SDHC_NORINTSTS:
>> +    case SDHC_NORINTSTSEN:
>> +    case SDHC_NORINTSIGEN:
>> +    case SDHC_FEAER:
>> +        sdhci_write(opaque, offset, val, size);
>> +        break;
>> +
>> +    case ESDHC_DMA_SYSCTL:
>> +    case 0x44:
>
>ditto

Ack=2E

Best regards,
Bernhard
>
>> +        qemu_log_mask(LOG_UNIMP, "ESDHC wr_%ub @0x%02" HWADDR_PRIx " <=
- 0x%08lx "
>> +                      "not implemented\n", size, offset, val);
>> +        break;
>> +
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PR=
Ix
>> +                      " <- 0x%08lx unknown offset\n", size, offset, va=
l);
>> +        break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps esdhc_mmio_ops =3D {
>> +    =2Eread =3D esdhci_read,
>> +    =2Ewrite =3D esdhci_write,
>> +    =2Evalid =3D {
>> +        =2Emin_access_size =3D 1,
>> +        =2Emax_access_size =3D 4,
>> +        =2Eunaligned =3D false
>> +    },
>> +    =2Eendianness =3D DEVICE_BIG_ENDIAN,
>> +};
>> +
>> +static void esdhci_init(Object *obj)
>> +{
>> +    DeviceState *dev =3D DEVICE(obj);
>> +    SDHCIState *s =3D SYSBUS_SDHCI(obj);
>> +
>> +    s->io_ops =3D &esdhc_mmio_ops;
>> +    s->io_registers_map_size =3D ESDHC_REGISTERS_MAP_SIZE;
>> +
>> +    /*
>> +     * Compatible with:
>> +     * - SD Host Controller Specification Version 2=2E0 Part A2
>> +     */
>> +    qdev_prop_set_uint8(dev, "sd-spec-version", 2);
>> +}
>> +
>> +static const TypeInfo esdhc_info =3D {
>> +    =2Ename =3D TYPE_FSL_ESDHC,
>> +    =2Eparent =3D TYPE_SYSBUS_SDHCI,
>> +    =2Einstance_init =3D esdhci_init,
>> +};
>> +
>>  /* --- qdev i=2EMX eSDHC --- */
>>
>>  #define USDHC_MIX_CTRL                  0x48
>> @@ -1907,6 +2051,7 @@ static void sdhci_register_types(void)
>>  {
>>      type_register_static(&sdhci_sysbus_info);
>>      type_register_static(&sdhci_bus_info);
>> +    type_register_static(&esdhc_info);
>>      type_register_static(&imx_usdhc_info);
>>      type_register_static(&sdhci_s3c_info);
>>  }
>> diff --git a/include/hw/sd/sdhci=2Eh b/include/hw/sd/sdhci=2Eh
>> index 01a64c5442=2E=2E5b32e83eee 100644
>> --- a/include/hw/sd/sdhci=2Eh
>> +++ b/include/hw/sd/sdhci=2Eh
>> @@ -45,6 +45,7 @@ struct SDHCIState {
>>      AddressSpace *dma_as;
>>      MemoryRegion *dma_mr;
>>      const MemoryRegionOps *io_ops;
>> +    uint64_t io_registers_map_size;
>>
>>      QEMUTimer *insert_timer;       /* timer for 'changing' sd card=2E =
*/
>>      QEMUTimer *transfer_timer;
>> @@ -122,6 +123,8 @@ DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
>>  DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
>>                           TYPE_SYSBUS_SDHCI)
>>
>> +#define TYPE_FSL_ESDHC "fsl-esdhc"
>> +
>>  #define TYPE_IMX_USDHC "imx-usdhc"
>>
>>  #define TYPE_S3C_SDHCI "s3c-sdhci"
>> --
>
>Regards,
>Bin


