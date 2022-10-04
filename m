Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CD25F4C3B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 00:54:01 +0200 (CEST)
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofqnY-0002Jt-Ba
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 18:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofql8-0000IW-9M; Tue, 04 Oct 2022 18:51:30 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofql6-0003h2-CB; Tue, 04 Oct 2022 18:51:30 -0400
Received: by mail-ej1-x629.google.com with SMTP id bj12so31899206ejb.13;
 Tue, 04 Oct 2022 15:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=3ObiBOZm3Qz9mr+QtUfrbl98BeQSmLrwdVpzFwMmbfg=;
 b=cyVcHhFmkttwuhkp7x5tAyhJWuyffcJnfcYOOPd/vdXXrQoD4SR3WQQlb0ur353k79
 c2CxLdJDLxMmt80/+r180nYgYn+q7ptvk3OqiM9hdkksnO+QbGAQUGGRFUOAvwr+YV1U
 U5Mum6DpPfjOP51PPMHjlj1pp7lnHFdpc14ndQnoY/XXlExCuas8HEPACmoxy0LXKBcp
 630bERPSA+Lx0aMJpqJFemJN/zKVZqYjf+fxYegkeaUg0mXXl78PnghrpTBNEt+vxH4O
 JdM8YvpU9j5vzUXGZq3Ri63eGT8ksBxe9H72TlFI9tAjUwqESliH61gIti+JKaikZuFF
 5UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3ObiBOZm3Qz9mr+QtUfrbl98BeQSmLrwdVpzFwMmbfg=;
 b=5n4Td4ZNW+16DYiDo0yv0bUDtBrcYGrQLTf5EOWv2rjLN4Vx2IIsbwcptwKcjB6buw
 WctFPuyIaEhz/Ob4H82T3Pfw9ONWMapn1ffLWbICUIC/eaz4GpHu9Cf04dYx6R3skLaP
 ykXuSqgvrgDE+kudjRVOe9Gvasj140bDWkBTXeUZG1gV2O8s8zUz1pg74ykM04fuBd4k
 koWlBKmLeL7hKX37LytxJhATl7i+s94ezwpIAHMiaeQlrqkM2+19b8kLgn/MkHtAKbC6
 9wx4BM20sIV0+0JWoiRRRyFE1UARr4LsOHZdR8ZwgyM5cJi4LcovESoHLGdJHDCAx12N
 MCpg==
X-Gm-Message-State: ACrzQf05QS1BaLSho6NsHmehvCnD0ZU0ShpV8tXajh/HDxjPM+wXMcTf
 UmdmNh+biPQX48arQyvZeCo=
X-Google-Smtp-Source: AMsMyM76Azu4uKiVhcjoUfz6ncTPMY3iRuIuLpf2o2lQ/yV72OXsabe1zro3/RLGhYuYFV1ASrGxeg==
X-Received: by 2002:a17:907:8a15:b0:782:e6da:f13d with SMTP id
 sc21-20020a1709078a1500b00782e6daf13dmr21685325ejc.152.1664923885352; 
 Tue, 04 Oct 2022 15:51:25 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-034-028.89.12.pool.telefonica.de.
 [89.12.34.28]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05640205d000b00454546561cfsm2466583edx.82.2022.10.04.15.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 15:51:24 -0700 (PDT)
Date: Tue, 04 Oct 2022 22:51:16 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 13/13] hw/ppc/e500: Add Freescale eSDHC to e500 boards
In-Reply-To: <69fadeb6-ff4d-c327-5716-5a416bf96c20@amsat.org>
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-14-shentey@gmail.com>
 <69fadeb6-ff4d-c327-5716-5a416bf96c20@amsat.org>
Message-ID: <E8F678EC-5188-4963-BBDB-0614F638A110@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

Am 3=2E Oktober 2022 21:06:57 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <f4=
bug@amsat=2Eorg>:
>On 3/10/22 22:31, Bernhard Beschow wrote:
>> Adds missing functionality to emulated e500 SOCs which increases the
>> chance of given "real" firmware images to access SD cards=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   docs/system/ppc/ppce500=2Erst | 13 +++++++++++++
>>   hw/ppc/Kconfig              |  1 +
>>   hw/ppc/e500=2Ec               | 31 ++++++++++++++++++++++++++++++-
>>   3 files changed, 44 insertions(+), 1 deletion(-)
>
>> +static void dt_sdhc_create(void *fdt, const char *parent, const char *=
mpic)
>> +{
>> +    hwaddr mmio =3D MPC85XX_ESDHC_REGS_OFFSET;
>> +    hwaddr size =3D MPC85XX_ESDHC_REGS_SIZE;
>> +    int irq =3D MPC85XX_ESDHC_IRQ;
>
>Why not pass these 3 variable as argument?

In anticipation of data-driven board creation, I'd ideally infer those fro=
m the device's QOM properties=2E This seems similar to what Mark suggested =
in the BoF at KVM Forum [1], where -- IIUC -- he stated that QOM properties=
 could be the foundation of all wiring representations=2E And device tree s=
eems just like one specialized representation to me=2E (Note that I'm sligh=
tly hijacking the review here because I don't know where and how to express=
 these thoughts elsewhere)=2E

Does it make sense to add the missing properties here?

Best regards,
Bernhard

[1] https://etherpad=2Eopendev=2Eorg/p/qemu-emulation-bof%40kvmforum2022

>
>> +    g_autofree char *name =3D NULL;
>> +
>> +    name =3D g_strdup_printf("%s/sdhc@%" PRIx64, parent, mmio);
>> +    qemu_fdt_add_subnode(fdt, name);
>> +    qemu_fdt_setprop(fdt, name, "sdhci,auto-cmd12", NULL, 0);
>> +    qemu_fdt_setprop_phandle(fdt, name, "interrupt-parent", mpic);
>> +    qemu_fdt_setprop_cells(fdt, name, "bus-width", 4);
>> +    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x2);
>> +    qemu_fdt_setprop_cells(fdt, name, "reg", mmio, size);
>> +    qemu_fdt_setprop_string(fdt, name, "compatible", "fsl,esdhc");
>> +}
>>     typedef struct PlatformDevtreeData {
>>       void *fdt;
>> @@ -553,6 +573,8 @@ static int ppce500_load_device_tree(PPCE500MachineS=
tate *pms,
>>         dt_rtc_create(fdt, "i2c", "rtc");
>>   +    /* sdhc */
>> +    dt_sdhc_create(fdt, soc, mpic);
>>  =20

