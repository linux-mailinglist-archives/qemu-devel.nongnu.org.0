Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E523650B59
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:21:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F8J-00005l-TZ; Mon, 19 Dec 2022 07:20:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p7F83-0008W4-Pv
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:20:25 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p7F81-0006nL-TR
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:20:23 -0500
Received: by mail-ej1-x633.google.com with SMTP id qk9so21035958ejc.3
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3PQTm/xF10k+kHSz7oGaeI1SdclDtwfUkUsXmMY0ahQ=;
 b=Fu9ozZK0MIxlVn9PS1Z0eTzMf+CpGETjM71+xIEVLuJdQl5t+p1oZfyHLLxa/vVNT+
 wTZtfUBqPoV9p7tAv25Vm4p3Y3obDOoGjicQ9m2AdvDK6xCXc1F08u4epIEv7XAeu9iM
 GgBK4wngMwlkVdthjkWYU+GywGZoJd+p+23Bt5SZ6TrGd6VCH/CZgi4PsPBvihOboTAZ
 lbcz9jnQD6PYnvyU5mymc9JeXSw0QhL0cpUT3HjW4EPXbjGIM4tCrSSbRzOqFxHuXom8
 065sb0RBK5JvTWBjAncd1w1nMJ30JGf49ZJFsUE3SXyEkEU3zK3E1XKR2cQV7fOVkQzf
 c/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3PQTm/xF10k+kHSz7oGaeI1SdclDtwfUkUsXmMY0ahQ=;
 b=KA7s6n3XBsw9YScuYbLWd8BZTkx89BbntxRt4H2D+PDYu0rGxa+pNzKzO9XSQRUBbI
 7Lgp8DQwaxEqBdaFxwBkzD4dH4KsVZGiamezuTbYDhqdK70Wv25W6nuMUt25axQFKwyH
 nt1OAdJEqOfW0obiYpBykoJaktawMeqYDSmiYu2GrH47SClATu55nqHS81FaNxgiSpBv
 DnD+zsCnAN1elb5rleExltD3/U0cD47q3mmLXWeZF5WySM2SxsQAHRioCFu06Jaf5+sH
 3CvfQhohge9ZEZlTe8o/2y4BV/Mzc62HviDN+dB3k48VA00rPAhUa+NbSRE3kzNyJNqS
 WlPg==
X-Gm-Message-State: ANoB5pldKIoyCVRskRx8ODAwKqPQptz8A7rg50lwQYHpE+hL2IviW8Jf
 +O+wZUb8k2vFOUwEkOs6rmo=
X-Google-Smtp-Source: AA0mqf6UpK1KMwf5ue8iFTE6q5JHgM78DiBG8JlpwLsw4zAKcisyNX0x3thvOO7FRUVO6yvcWANvCA==
X-Received: by 2002:a17:906:298c:b0:7c1:9eb:845b with SMTP id
 x12-20020a170906298c00b007c109eb845bmr34443414eje.16.1671452419947; 
 Mon, 19 Dec 2022 04:20:19 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-056-244.78.55.pool.telefonica.de.
 [78.55.56.244]) by smtp.gmail.com with ESMTPSA id
 r4-20020a170906364400b007c0a90663d5sm4264552ejb.162.2022.12.19.04.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 04:20:19 -0800 (PST)
Date: Mon, 19 Dec 2022 12:20:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v2 3/3] hw/isa/piix4: Correct IRQRC[A:D] reset values
In-Reply-To: <20221027204720.33611-4-philmd@linaro.org>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-4-philmd@linaro.org>
Message-ID: <47E74C2E-38CC-4DAB-9B38-31D8BD71BC0D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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



Am 27=2E Oktober 2022 20:47:20 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>IRQRC[A:D] registers reset value is 0x80=2E We were forcing
>the MIPS Malta machine routing to be able to boot a Linux
>kernel without any bootloader=2E
>We now have these registers initialized in the Malta machine
>write_bootloader(), so we can use the correct reset values=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-12/msg03048=2Eht=
ml :

Reviewed-by: Igor Mammedov <imammedo@redhat=2Ecom>

>---
> hw/isa/piix4=2Ec | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>index 15f344dbb7=2E=2Ea2165c6a49 100644
>--- a/hw/isa/piix4=2Ec
>+++ b/hw/isa/piix4=2Ec
>@@ -115,10 +115,10 @@ static void piix4_isa_reset(DeviceState *dev)
>     pci_conf[0x4c] =3D 0x4d;
>     pci_conf[0x4e] =3D 0x03;
>     pci_conf[0x4f] =3D 0x00;
>-    pci_conf[0x60] =3D 0x0a; // PCI A -> IRQ 10
>-    pci_conf[0x61] =3D 0x0a; // PCI B -> IRQ 10
>-    pci_conf[0x62] =3D 0x0b; // PCI C -> IRQ 11
>-    pci_conf[0x63] =3D 0x0b; // PCI D -> IRQ 11
>+    pci_conf[0x60] =3D 0x80;
>+    pci_conf[0x61] =3D 0x80;
>+    pci_conf[0x62] =3D 0x80;
>+    pci_conf[0x63] =3D 0x80;
>     pci_conf[0x69] =3D 0x02;
>     pci_conf[0x70] =3D 0x80;
>     pci_conf[0x76] =3D 0x0c;

