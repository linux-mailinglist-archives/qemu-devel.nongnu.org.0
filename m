Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188DD6147EE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 11:50:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opoq4-0003Pv-4z; Tue, 01 Nov 2022 06:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opopp-0003N0-Hd; Tue, 01 Nov 2022 06:49:33 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opopm-0005lG-C5; Tue, 01 Nov 2022 06:49:32 -0400
Received: by mail-wr1-x436.google.com with SMTP id j15so19568131wrq.3;
 Tue, 01 Nov 2022 03:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtcjvaktNTvXbrysdFDZUolDmm3Xsp92sjQCHgZC+EU=;
 b=gQChRysfqzupqqiAt+w1iWpI9CiJiEEsxnUf0ooZJVqVr8H1c4u5L6KQxhQb3J9NA2
 41jvu/cdbjww88LEFQK75ePn/Lg1+slK8IAYjVqJnwQ2nMYmy5QjS7NDSjVzESKON5Nh
 x4Ru1YJV99X36g9JTI1BUxTyMUO0AzuuAdr63cO2rSnG3Ccm4NtwWajsFsYb/cf5sYxK
 lVC60PkHPDmS7t9ePwTDXUEB+WBRtVeWSKuqhU4a1XFr8+J74O7hAveloMhAoFGT1zPn
 bVDeriRqSU+51GhOGtrmYwBQ2YO9ejdEoJtn3uz1lh5268HjVntswrgvtgLW6hCXUP/4
 0NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WtcjvaktNTvXbrysdFDZUolDmm3Xsp92sjQCHgZC+EU=;
 b=DVr3hICUkPc9zlod6dhb5vjuM2TJnXqGAwc/4h0KB2pvzpcGxXF3WHoSmBcuCNBjz3
 e2PKcLR1m9mDasK8XrrDVAMZnMAKGDnpYK0htuhdHOTBluvfq48NjtdmSVRTf0MN0T9S
 ZelUJK+dNFA54u1ETKNQXkdZf9ZWFY15zuVtM46qcgdpHmoKf87ic9WyRIH1P8czL10K
 AUQucJRpL77lAUSlcOK1+1DOc5xJ3HiZYiUCoIySbsDigKQtvEu4rVeuo3pyMPzQzQmT
 HiC4XVFUZeYljfkM/HkBJzM1ghUS+FjD3Wb2h/WdtrtpsV3woFJf+tXIv8om+70CGBRu
 GyRw==
X-Gm-Message-State: ACrzQf3QyTZemjz9UaXSlHOnYNDLLORnY+OB9ntjztyzCKc/oRjqMuo9
 65nUMXWDkKylKvRLcJKP7gs=
X-Google-Smtp-Source: AMsMyM4MlfwU+mHKGauqkS1uwmH4tuPlbQ+lg08D2k5XvbwlrYMvdEaQbFRB47+IL56SPwbCoyPoMw==
X-Received: by 2002:adf:e3c1:0:b0:236:6d5d:ffa2 with SMTP id
 k1-20020adfe3c1000000b002366d5dffa2mr11115687wrm.557.1667299767559; 
 Tue, 01 Nov 2022 03:49:27 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb20008d20b2c0629916b.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8d2:b2c:629:916b])
 by smtp.gmail.com with ESMTPSA id
 n185-20020a1ca4c2000000b003cf66a2d433sm9966363wme.33.2022.11.01.03.49.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 03:49:27 -0700 (PDT)
Date: Tue, 01 Nov 2022 10:49:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
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
In-Reply-To: <3629cba9-0eb7-1f9e-4bcd-030e1edb8745@linaro.org>
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-7-shentey@gmail.com>
 <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
 <724F8CC8-C5E8-4785-B5C2-F1D327863717@gmail.com>
 <590683A5-2774-432C-A47A-ED755054479C@gmail.com>
 <DB3C19E8-007B-46F6-96B3-EE0CF6AD2019@gmail.com>
 <45be44c0-766b-07c6-be8a-c21d46da7f72@linaro.org>
 <CAG4p6K5qvJFRihrZV3Gku_fYsxWFzEN4UfGf4xySQyfzkv9q0g@mail.gmail.com>
 <3629cba9-0eb7-1f9e-4bcd-030e1edb8745@linaro.org>
Message-ID: <6F4D0C8A-5DDC-4802-BE98-F546E6E73048@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Am 31=2E Oktober 2022 12:11:37 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 30/10/22 12:46, Bernhard Beschow wrote:
>>=20
>>=20
>> On Sun, Oct 30, 2022 at 1:10 AM Philippe Mathieu-Daud=C3=A9 <philmd@lin=
aro=2Eorg <mailto:philmd@linaro=2Eorg>> wrote:
>>=20
>>     On 29/10/22 20:28, Bernhard Beschow wrote:
>>      > Am 29=2E Oktober 2022 13:04:00 UTC schrieb Bernhard Beschow
>>     <shentey@gmail=2Ecom <mailto:shentey@gmail=2Ecom>>:
>>      >> Am 29=2E Oktober 2022 11:33:51 UTC schrieb Bernhard Beschow
>>     <shentey@gmail=2Ecom <mailto:shentey@gmail=2Ecom>>:
>>      >>> Am 27=2E Oktober 2022 21:40:01 UTC schrieb "Philippe
>>     Mathieu-Daud=C3=A9" <philmd@linaro=2Eorg <mailto:philmd@linaro=2Eor=
g>>:
>>      >>>> Hi Bernhard,
>>      >>>>
>>      >>>> On 18/10/22 23:01, Bernhard Beschow wrote:
>>      >>>>> Will allow e500 boards to access SD cards using just their
>>     own devices=2E
>>      >>>>>
>>      >>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom
>>     <mailto:shentey@gmail=2Ecom>>
>>      >>>>> ---
>>      >>>>>=C2=A0 =C2=A0 hw/sd/sdhci=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 120
>>     +++++++++++++++++++++++++++++++++++++++++-
>>      >>>>>=C2=A0 =C2=A0 include/hw/sd/sdhci=2Eh |=C2=A0 =C2=A03 ++
>>      >>>>>=C2=A0 =C2=A0 2 files changed, 122 insertions(+), 1 deletion(=
-)
>>=20
>>      >>>> So now, I'd create 1 UNIMP region for ESDHC_WML and map it
>>      >>>> into SDHC_REGISTERS_MAP (s->iomem) with priority 1, and add
>>      >>>> another UNIMP region of ESDHC_REGISTERS_MAP_SIZE -
>>     SDHC_REGISTERS_MAP_SIZE (=3D 0x310) and map it normally at offset
>>      >>>> 0x100 (SDHC_REGISTERS_MAP_SIZE)=2E Look at create_unimp() in
>>      >>>> hw/arm/bcm2835_peripherals=2Ec=2E
>>      >>>>
>>      >>>> But the ESDHC_WML register has address 0x44 and fits inside t=
he
>>      >>>> SDHC_REGISTERS_MAP region, so likely belong there=2E 0x44 is =
the
>>      >>>> upper part of the SDHC_CAPAB register=2E These bits are undef=
ined
>>      >>>> on the spec v2, which I see you are setting in esdhci_init()=
=2E
>>      >>>> So this register should already return 0, otherwise we have
>>      >>>> a bug=2E Thus we don't need to handle this ESDHC_WML particul=
arly=2E
>>      >>
>>      >> My idea here was to catch this unimplemented case in order to
>>     indicate this clearly to users=2E Perhaps it nudges somebody to
>>     provide a patch?
>>      >>
>>      >>>>
>>      >>>> And your model is reduced to handling create_unimp() in
>>     esdhci_realize()=2E
>>      >>>>
>>      >>>> Am I missing something?
>>      >>>
>>      >>> The mmio ops are big endian and need to be aligned to a 4-byte
>>     boundary=2E It took me quite a while to debug this=2E So shall I ju=
st
>>     create an additional memory region for the region above
>>     SDHC_REGISTERS_MAP_SIZE for ESDHC_DMA_SYSCTL?
>>      >>
>>      >> All in all I currently don't have a better idea than keeping th=
e
>>     custom i/o ops for the standard region and adding an additional
>>     unimplemented region for ESDHC_DMA_SYSCTL=2E I think I'd have to
>>     dynamically allocate memory for it where I still need to figure out
>>     how not to leak it=2E
>>      >
>>      > By simply reusing sdhci_{read,write} in eSDHC's io_ops struct I
>>     was able to remove the custom implementations while having big
>>     endian and the alignments proper=2E However, I don't see a way of
>>     adding two memory regions - with or without a container=2E With a
>>     container I'd have to somehow preserve the mmio attribute which is
>>     initialized by the parent class, re-initialize it with the
>>     container, and add the preserved memory region as child=2E This see=
ms
>>     very fragile, esp=2E since the parent class has created an alias fo=
r
>>     mmio in sysbus=2E Without a container, one would have two memory
>>     regions that both have to be mapped separately by the caller, i=2Ee=
=2E
>>     it burdens the caller with an implementation detail=2E
>>      >
>>      > Any suggestions?
>
>See https://lore=2Ekernel=2Eorg/qemu-devel/20221031115402=2E91912-7-philm=
d@linaro=2Eorg/
>
>>     Can you share branch and how to test?
>>=20
>>=20
>> QEMU branch: https://github=2Ecom/shentok/qemu/tree/e500-flash <https:/=
/github=2Ecom/shentok/qemu/tree/e500-flash>
>>=20
>> How to test:
>> 1=2E `git clone -b e500 https://github=2Ecom/shentok/buildroot=2Egit <h=
ttps://github=2Ecom/shentok/buildroot=2Egit>`
>> 2=2E `cd buildroot`
>> 3=2E `make qemu_ppc_e500mc_defconfig`
>> 4=2E `make`
>> 5=2E `cd output/images`
>> 6=2E `dd if=3D/dev/zero of=3Droot=2Eimg bs=3D1M count=3D64 && dd if=3Dr=
ootfs=2Eext2 of=3Droot=2Eimg bs=3D1M conv=3Dnotrunc`
>> 7=2E `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -app=
end "console=3DttyS0 rootwait root=3D/dev/mmcblk0" -device sd-card,drive=3D=
mydrive -drive id=3Dmydrive,if=3Dnone,file=3Droot=2Eimg,format=3Draw`
>
>Could you add an Avocado-based test?

I could give it a try at least=2E Where would I drop the binaries?

Best regards,
Bernhard
>
>>  =C2=A0 Welcome to Buildroot
>>  =C2=A0 buildroot login:
>
>Regards,
>
>Phil=2E


