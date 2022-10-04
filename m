Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B95F4BD3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 00:27:07 +0200 (CEST)
Received: from localhost ([::1]:47264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofqNW-0005RB-4z
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 18:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofqI6-0007Kx-RP; Tue, 04 Oct 2022 18:21:31 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofqI3-0001WG-9i; Tue, 04 Oct 2022 18:21:30 -0400
Received: by mail-ed1-x534.google.com with SMTP id m3so20680036eda.12;
 Tue, 04 Oct 2022 15:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=8QqKo1eL1Bix7cmpRYXKXZNHq/v3xlUqAid9te6Ssyc=;
 b=MjRPCEq0j6SrKbr0Hbcsj6RrHC3YSO/E/H1d7LBr7AEo5plLz36m3TP1lEDGVmGJOT
 rlvHYqO3XrMn1CmKtUfMRmIe+HHHjGjeFxkxmuy6dbcEtXtealgcNoUFHnXRJ2hUIozX
 KY8PMbGPd8lsAZ0tKIdfuhMuvIRjLoC905h/bZOReF6dnMo+QX67nsBN2qxYn+aVUbM1
 HVIOQ8bk0Vip4fchyvNUgfCul4FjVQxTX6+vVWsFvD/58pYQLSDTNw9WP2jrcs5gLRHx
 UbMCRLNqR4Y/8feW5nMkHy5e7zGlHPuJmHUnvpRNudKcBA1usGogCoqgAsR5H53v3hj8
 mX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8QqKo1eL1Bix7cmpRYXKXZNHq/v3xlUqAid9te6Ssyc=;
 b=KdZW4+EUhWEn0BWJ/b1qb0Rwb9X78HiTbcYezqoT/id5e3uJq6v4ICbVWoxL2fDRzI
 m7nJN/H7bEQsHwCBelEM5dm7V7Mh+tBK9bn7Qo6+LA0uOgc42pqrOxXDKjIGmGIiv8mY
 h2QZQz8aJ+7YjaTq2cpGClgH1cBODRiyVMj9agdplQGRcJUi/zfRzQJkfA+uwNFY/S20
 /k87+UM5DEtvYo7mWA93eGwVbNBO1YKBYQw+u8UilaaKtdsoaUDKvwrIjJYExdAWqkwC
 2v43pHZtyUQguEhrOt2O9AyRfWeCTHRmj5zeeIxlM9nECu830ZstB0exh2yrrXNDMpgi
 PWNQ==
X-Gm-Message-State: ACrzQf3xZKIyFANYOmNzQ5JXJl2RUEcNaTIdFznA7bDji7nav5Fbkfgr
 Jg8Sd0U109ak2DdSgbSYrMw=
X-Google-Smtp-Source: AMsMyM4AiBP67ikrLul68qLcxKfoL9d1gnfphDjIgdQseps3QnzBeTqbe3p5U2zWiqhax3OWf0HzaQ==
X-Received: by 2002:a05:6402:d43:b0:459:b4a:18b5 with SMTP id
 ec3-20020a0564020d4300b004590b4a18b5mr10278663edb.171.1664922083314; 
 Tue, 04 Oct 2022 15:21:23 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-034-028.89.12.pool.telefonica.de.
 [89.12.34.28]) by smtp.gmail.com with ESMTPSA id
 v8-20020a50a448000000b00458d744898asm2426518edb.79.2022.10.04.15.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 15:21:22 -0700 (PDT)
Date: Tue, 04 Oct 2022 22:21:13 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 09/13] hw/ppc/e500: Implement pflash handling
In-Reply-To: <0fdd52fc-4a4d-c172-dbc9-0f7bf8e7a65e@amsat.org>
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-10-shentey@gmail.com>
 <0fdd52fc-4a4d-c172-dbc9-0f7bf8e7a65e@amsat.org>
Message-ID: <F4659219-D827-4215-ACDF-54969E1AAFC6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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

Am 3=2E Oktober 2022 21:21:15 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <f4=
bug@amsat=2Eorg>:
>On 3/10/22 22:31, Bernhard Beschow wrote:
>> Allows e500 boards to have their root file system reside on flash using
>> only builtin devices located in the eLBC memory region=2E
>>=20
>> Note that the flash memory area is only created when a -pflash argument=
 is
>> given, and that the size is determined by the given file=2E The idea is=
 to
>> put users into control=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   docs/system/ppc/ppce500=2Erst | 12 ++++++
>>   hw/ppc/Kconfig              |  1 +
>>   hw/ppc/e500=2Ec               | 76 ++++++++++++++++++++++++++++++++++=
+++
>>   3 files changed, 89 insertions(+)
>
>> @@ -856,6 +892,7 @@ void ppce500_init(MachineState *machine)
>>       unsigned int pci_irq_nrs[PCI_NUM_PINS] =3D {1, 2, 3, 4};
>>       IrqLines *irqs;
>>       DeviceState *dev, *mpicdev;
>> +    DriveInfo *dinfo;
>>       CPUPPCState *firstenv =3D NULL;
>>       MemoryRegion *ccsr_addr_space;
>>       SysBusDevice *s;
>> @@ -1024,6 +1061,45 @@ void ppce500_init(MachineState *machine)
>>                                   pmc->platform_bus_base,
>>                                   &pms->pbus_dev->mmio);
>>   +    dinfo =3D drive_get(IF_PFLASH, 0, 0);
>> +    if (dinfo) {
>> +        BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
>> +        BlockDriverState *bs =3D blk_bs(blk);
>> +        uint64_t size =3D bdrv_getlength(bs);
>> +        uint64_t mmio_size =3D pms->pbus_dev->mmio=2Esize;
>> +        uint32_t sector_len =3D 64 * KiB;
>> +
>> +        if (ctpop64(size) !=3D 1) {
>> +            error_report("Size of pflash file must be a power of two=
=2E");
>
>This is a PFLASH restriction (which you already fixed in the previous
>patch), not a board one=2E

I agree that this check seems redundant to the one in cfi01=2E I added thi=
s one for clearer error messages since cfi01 only complains about the "devi=
ce size" not being a power of two while this message at least gives a hint =
towards the source of the problem (the file given in the pflash option)=2E

Usually the size of the pflash area is hardcoded in the board while I choo=
se to derive it from the size of the backing file in order to avoid hardcod=
ing it=2E My idea is to put users into control by offering more flexibility=
=2E

>
>> +            exit(1);
>> +        }
>> +
>> +        if (size > mmio_size) {
>> +            error_report("Size of pflash file must not be bigger than =
%" PRIu64
>> +                         " bytes=2E", mmio_size);
>
>There is no hardware limitation here, you can wire flash bigger than the
>memory aperture=2E What is above the aperture will simply be ignored=2E
>
>Should we display a warning here instead of a fatal error?

While this is technically possible, is that what users would expect? Could=
n't we just require users to truncate their files if they really want the "=
aperture" behavior?

>
>> +            exit(1);
>> +        }
>> +
>> +        assert(QEMU_IS_ALIGNED(size, sector_len));
>
>Similarly, this doesn't seem a problem the board code should worry
>about: better to defer it to PFLASH realize()=2E

The reason for the assert() here is that size isn't stored directly in the=
 cfi01 device=2E Instead, it must be calculated by the properties "num-bloc=
ks" times "sector-length"=2E For this to work, size must be divisible by se=
ctor_len without remainder, which is checked by the assertion=2E

We could theoretically add a "size" property which would violate the singl=
e point of truth principle, though=2E Do you see a different solution?

Best regards,
Bernhard

>
>> +        dev =3D qdev_new(TYPE_PFLASH_CFI01);
>> +        qdev_prop_set_drive(dev, "drive", blk);
>> +        qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
>> +        qdev_prop_set_uint64(dev, "sector-length", sector_len);
>> +        qdev_prop_set_uint8(dev, "width", 2);
>> +        qdev_prop_set_bit(dev, "big-endian", true);
>> +        qdev_prop_set_uint16(dev, "id0", 0x89);
>> +        qdev_prop_set_uint16(dev, "id1", 0x18);
>> +        qdev_prop_set_uint16(dev, "id2", 0x0000);
>> +        qdev_prop_set_uint16(dev, "id3", 0x0);
>> +        qdev_prop_set_string(dev, "name", "e500=2Eflash");
>> +        s =3D SYS_BUS_DEVICE(dev);
>> +        sysbus_realize_and_unref(s, &error_fatal);
>> +
>> +        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
>> +                                    sysbus_mmio_get_region(s, 0));
>> +    }
>> +
>>       /*
>>        * Smart firmware defaults ahead!
>>        *
>


