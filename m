Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955F4BAC1A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 22:54:36 +0100 (CET)
Received: from localhost ([::1]:51196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKojS-0005lO-LV
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 16:54:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKohS-0004iA-GI
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 16:52:30 -0500
Received: from [2a00:1450:4864:20::535] (port=35385
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKohQ-0002Y1-9Q
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 16:52:29 -0500
Received: by mail-ed1-x535.google.com with SMTP id f17so12115690edd.2
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 13:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=XIFL0hjqnnFRxO6jLglAz+dpEQHc2thAnGlNXhplSwI=;
 b=ab3LUkBM74saxkMxcjF0z8wPU1dQzMcBGnYBQHi4AscykrHzoKL0eYmwzIgqYk7aLw
 s4XMEmxnqTRvIAEdRfSsekxLao79n/EUmoYLMgQgNHHujTSUSV3kF2gACW7sn4HlRtVF
 DOJza7Kqk7rBC0Q9Yq8XwDbFP2v4C7DdzawiIOYNSyDrRSZZlOh8ndh/VRarR7ZTRBBf
 PjmfzmOzG1RB3Woek9YJnOiB+EHQcrmLcQLZrfifudlmeVQxTbDg9QRYPUH7V01KHX/w
 CstyTBIwVcmmKIeO4+RiyYluGNs3nuSkXGTVmye6v2IYrRcNq1ML0ZQLTjPuzh9ud4hB
 Cj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=XIFL0hjqnnFRxO6jLglAz+dpEQHc2thAnGlNXhplSwI=;
 b=K6ZixRmJTpGzFuXIcnaGIPRK1KpBEyDKMEqSYPDTXSrzCO5e2lhu7XfbGGm1AEivzb
 I8rM+PMPRVKTrK7lNCYIBZb8zQzZ1GYklS2ulO0m6/I0uZ4ag9Kceav/LEQ18ynTWWvx
 NdLu0WrFeuqb9nrDzHyOexcNeAtcEEQuniX8xmS9NWpath8ZveFP8QZqOPmiRIdKPXfK
 lxv3/guYGfOR4b/Ekzsmtr0iD0wuTurZ7mTbm+nP550z8CZ0W7FlY+OiA6LCL7T5Ilh6
 oKUgandVy05WaOslOfLVWRgYytybpdw5W0Es4mBV3TS3gc8F9JPLKstxVSFb71nHNiF9
 pyjQ==
X-Gm-Message-State: AOAM532iYEexJaWss647uUSu5fDOehwQabEaVc1acJ5K3DMlcE7aK+Co
 RMOnbQ/wCDOaD2BgSDL+xPZHMCuY/5POEQ==
X-Google-Smtp-Source: ABdhPJwDPt49QGgEXjyzT7wpeHQz4VDZB+ZxQh8gaNqyihlgAX/DFipHBasvj67XVNyXrSUCNX9YEA==
X-Received: by 2002:a05:6402:c81:b0:410:a329:e27a with SMTP id
 cm1-20020a0564020c8100b00410a329e27amr4898308edb.142.1645134728282; 
 Thu, 17 Feb 2022 13:52:08 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-198-236.77.183.pool.telefonica.de.
 [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id j3sm1571238ejj.9.2022.02.17.13.52.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Feb 2022 13:52:07 -0800 (PST)
Date: Thu, 17 Feb 2022 21:52:02 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_1/7=5D_hw/mips/gt64xxx=5Fpci=3A_Fix_P?=
 =?US-ASCII?Q?CI_IRQ_levels_to_be_preserved_during_migration?=
In-Reply-To: <20220217101924.15347-2-shentey@gmail.com>
References: <20220217101924.15347-1-shentey@gmail.com>
 <20220217101924.15347-2-shentey@gmail.com>
Message-ID: <15030F67-E5A3-436F-89D7-A3BF256C3256@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17=2E Februar 2022 10:19:18 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>Based on commit e735b55a8c11dd455e31ccd4420e6c9485191d0c:
>
>  piix_pci: eliminate PIIX3State::pci_irq_levels
>
>  PIIX3State::pci_irq_levels are redundant which is already tracked by
>  PCIBus layer=2E So eliminate them=2E
>
>The IRQ levels in the PCIBus layer are already preserved during
>migration=2E By reusing them and rather than having a redundant implement=
ation
>the bug is avoided in the first place=2E
>
>Suggested-by: Peter Maydell <peter=2Emaydell@linaro=2Eorg>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>

Copy from v3:

Reviewed-by: Peter Maydell <peter=2Emaydell@linaro=2Eorg>

>---
> hw/mips/gt64xxx_pci=2Ec | 7 ++-----
> 1 file changed, 2 insertions(+), 5 deletions(-)
>
>diff --git a/hw/mips/gt64xxx_pci=2Ec b/hw/mips/gt64xxx_pci=2Ec
>index c7480bd019=2E=2E4cbd0911f5 100644
>--- a/hw/mips/gt64xxx_pci=2Ec
>+++ b/hw/mips/gt64xxx_pci=2Ec
>@@ -1006,14 +1006,11 @@ static int gt64120_pci_map_irq(PCIDevice *pci_dev=
, int irq_num)
>     }
> }
>=20
>-static int pci_irq_levels[4];
>-
> static void gt64120_pci_set_irq(void *opaque, int irq_num, int level)
> {
>     int i, pic_irq, pic_level;
>     qemu_irq *pic =3D opaque;
>-
>-    pci_irq_levels[irq_num] =3D level;
>+    PCIBus *bus =3D pci_get_bus(piix4_dev);
>=20
>     /* now we change the pic irq level according to the piix irq mapping=
s */
>     /* XXX: optimize */
>@@ -1023,7 +1020,7 @@ static void gt64120_pci_set_irq(void *opaque, int i=
rq_num, int level)
>         pic_level =3D 0;
>         for (i =3D 0; i < 4; i++) {
>             if (pic_irq =3D=3D piix4_dev->config[PIIX_PIRQCA + i]) {
>-                pic_level |=3D pci_irq_levels[i];
>+                pic_level |=3D pci_bus_get_irq_level(bus, i);
>             }
>         }
>         qemu_set_irq(pic[pic_irq], pic_level);


