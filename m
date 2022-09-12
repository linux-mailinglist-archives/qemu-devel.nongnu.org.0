Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08CB5B61E8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 21:52:04 +0200 (CEST)
Received: from localhost ([::1]:48962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXpTP-0003uh-9N
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 15:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oXpRo-0001o6-S0; Mon, 12 Sep 2022 15:50:25 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oXpRm-0004hR-1h; Mon, 12 Sep 2022 15:50:24 -0400
Received: by mail-ed1-x536.google.com with SMTP id u6so14347863eda.12;
 Mon, 12 Sep 2022 12:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=efc+HCr06fGfpySEXqUb5MH/uUCE8jhZ0CUXlBq8YaQ=;
 b=nxvyMFNAz65ECMxFuL+MJmj6QJ3SVfHv4TQCCf1zYc9m/zMNztJvLDUvy9DnOWObO0
 kQu7UmmsE2jVwJX/xZrp1YU9itS3s00CNB+6mh1EGQRtV+DUXDfJrCMRIBEk0kSbKLpW
 CGTch3JQC49ppEkoAwcp65X+S2paw4o1ykOcg8E+vYwPP1L/Ysx+hR1bPJG1z7V/Ru//
 vF0YBHL7dzLQo7R8+iMmfn5mmmxH0OGMA7bGURXsEhTo5jTAeB3DZeICDY9yx4TOMSbJ
 1UGVuNnQDlqzCA+SHfAuOnNaCMHVDPx4tcUq78V8+qxt8a/kMn4hUbpDr6OlGSg8hCTK
 /ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=efc+HCr06fGfpySEXqUb5MH/uUCE8jhZ0CUXlBq8YaQ=;
 b=F4xzN+gSCWCv4wmxY7UO6jOq5iofrHohoqbxcJFcIs3xQ6FUNreBVtHfmK1mslxdLR
 nmgIB9Q5Lk3LbW23v17QurW6B/Z1hvpxrWACEbVj9NBOh87UMviG5keFPr/7OggGSH21
 iae8K/HfQChqn2Y2w+7R7i9Ghu1FI7ZmZS1pQuYGgMag7Ejyja5wmYaVrHfF/NLHwMNy
 bGo0D1fnW3KB3im5lICQivmCWnpqGbQeOj0FWfTQnjDe/ae8ZjtyueM0THJvMDXtmUqQ
 iWudTq5J/Eh0eyKThKLLtzgvuA7DlGR4WIQteEzE3EN9Mv8SLe7z3nBOkY8vQe0wMF+1
 Xg/A==
X-Gm-Message-State: ACgBeo3FhMV1IQFT2wgDD+KIl8EvV0RaJ5NR0f3ft+/GesObzjbXRh2R
 IrthrrjtAdsM2D8Vaam+K6n2l3hFhb8=
X-Google-Smtp-Source: AA6agR7APLogdIpRpi4RMBlS12SVccfO9hyjsEquGM4O/IWxaNg6w97airplx3/bMkohXOQhw1hqcQ==
X-Received: by 2002:a05:6402:1712:b0:44d:db03:46f2 with SMTP id
 y18-20020a056402171200b0044ddb0346f2mr23910956edu.260.1663012218387; 
 Mon, 12 Sep 2022 12:50:18 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-088-148.77.11.pool.telefonica.de.
 [77.11.88.148]) by smtp.gmail.com with ESMTPSA id
 gc33-20020a1709072b2100b00731803d4d04sm4849434ejc.82.2022.09.12.12.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 12:50:17 -0700 (PDT)
Date: Mon, 12 Sep 2022 19:50:10 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v5 00/13] Instantiate VT82xx functions in host device
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
Message-ID: <E2820A94-3E30-46DB-9F83-8157C9A6FE1B@gmail.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 1=2E September 2022 11:41:14 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>v5:
>
>* Add patch "Inline vt82c686b_southbridge_init() and remove it" (Zoltan)
=
>
>* Use machine parameter when creating rtc-time alias (Zoltan)
>
>
>
>Testing done: Same as in v3=2E
>
>
>
>v4:
>
>* Fix in comment: AC97 Modem -> MC97 Modem (Zoltan)
>
>* Introduce TYPE_VT82C686B_USB_UHCI define (Zoltan)
>
>* Introduce TYPE_VIA_IDE define (for consistency)
>
>
>
>v3:
>
>* Replace pre increment by post increment in for loop (Zoltan)
>
>* Move class defines close to where the class is defined (Zoltan)
>
>
>
>Testing done:
>
>* `make check-avocado`
>
>  Passes for boot_linux_console=2Epy for mips64el_fuloong2e
>
>* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device ati-vg=
a,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3=2E17=2Eiso -kernel mo=
rphos-3=2E17/boot=2Eimg`
>
>  Boots successfully and it is possible to open games and tools=2E
>
>
>
>v2:
>
>* Keep the call to pci_ide_create_devs() in board code for consistency (Z=
oltan)
>
>* Create rtc-time alias in board rather than in south bridge code
>
>* Remove stale comments about PCI functions (Zoltan)
>
>
>
>v1:
>
>This series instantiates all PCI functions of the VT82xx south bridges in=
 the south bridges themselves=2E
>
>For the IDE function this is especially important since its interrupt rou=
ting is configured in the
>
>ISA function, hence doesn't make sense to instantiate it as a "Frankenste=
in" device=2E The interrupt
>
>routing is currently hardcoded and changing that is currently not in the =
scope of this series=2E
>
>
>
>Testing done:
>
>* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device ati-vg=
a,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3=2E17=2Eiso -kernel mo=
rphos-3=2E17/boot=2Eimg`
>
>  Boots successfully and it is possible to open games and tools=2E
>
>
>
>* I was unable to test the fuloong2e board even before this series since =
it seems to be unfinished [1]=2E
>
>  A buildroot-baked kernel [2] booted but doesn't find its root partition=
, though the issues could be in the buildroot receipt I created=2E
>
>
>
>[1] https://osdn=2Enet/projects/qmiga/wiki/SubprojectPegasos2
>
>[2] https://github=2Ecom/shentok/buildroot/commits/fuloong2e
>

Copying from v2 (just found it in my spam folder :/):
Series:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>

Review seems complete, thanks to all who participated! Now we just need so=
meone to queue this series=2E

Best regards,
Bernhard

>
>
>Bernhard Beschow (13):
>
>  hw/isa/vt82c686: Resolve chip-specific realize methods
>
>  hw/isa/vt82c686: Resolve unneeded attribute
>
>  hw/isa/vt82c686: Prefer pci_address_space() over get_system_memory()
>
>  hw/isa/vt82c686: Reuse errp
>
>  hw/isa/vt82c686: Introduce TYPE_VIA_IDE define
>
>  hw/isa/vt82c686: Instantiate IDE function in host device
>
>  hw/isa/vt82c686: Introduce TYPE_VT82C686B_USB_UHCI define
>
>  hw/isa/vt82c686: Instantiate USB functions in host device
>
>  hw/isa/vt82c686: Instantiate PM function in host device
>
>  hw/isa/vt82c686: Instantiate AC97 and MC97 functions in host device
>
>  hw/mips/fuloong2e: Inline vt82c686b_southbridge_init() and remove it
>
>  hw/isa/vt82c686: Embed RTCState in host device
>
>  hw/isa/vt82c686: Create rtc-time alias in boards instead
>
>
>
> configs/devices/mips64el-softmmu/default=2Emak |   1 -
>
> hw/ide/via=2Ec                                 |   2 +-
>
> hw/isa/Kconfig                               |   1 +
>
> hw/isa/vt82c686=2Ec                            | 120 +++++++++++++++----=

>
> hw/mips/fuloong2e=2Ec                          |  39 +++---
>
> hw/ppc/Kconfig                               |   1 -
>
> hw/ppc/pegasos2=2Ec                            |  25 ++--
>
> hw/usb/vt82c686-uhci-pci=2Ec                   |   4 +-
>
> include/hw/isa/vt82c686=2Eh                    |   4 +-
>
> 9 files changed, 126 insertions(+), 71 deletions(-)
>
>
>
>-- >
>2=2E37=2E3
>
>
>


