Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E571A67697B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 21:57:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJKuP-0007jr-K6; Sat, 21 Jan 2023 15:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJKuO-0007jS-5Z; Sat, 21 Jan 2023 15:56:16 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJKuM-0006wP-I4; Sat, 21 Jan 2023 15:56:15 -0500
Received: by mail-ej1-x631.google.com with SMTP id u19so21884449ejm.8;
 Sat, 21 Jan 2023 12:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUGuItvlLw8gIi6OK0GfQha+9gmmxYU5DpoLmRBRHog=;
 b=S7DY8Wt3Y7yE6RJADSSDm5NWKGogyl+p5tyyDrnQuLvwMo6rTaNx0BwLoIFLlvqsAX
 jkcug+rdS2RzLC7ik7t9hTESmxqgvuzZBhHd1J9jtm4YOxDjn5VaC9swfHh4FDat5JWF
 elB0gGDSoMMroKyin5fjGsNfuj4CVG7RJ2/I0eTbXpMgpwa/2CgEasnZZwGkRUic0cWW
 5Ef3hSbDr2m1N7HZvwcv01ZXS6phXFQQv0eC85PnV/1aLiKRxmbsejsBChcnsr4kW7aq
 Yczh2BlsjYUtW6aEG5YVN2pcEAJSjc9P7PkDkeTGZ7gfzljieNMegJTYQMF54bUsmw5b
 VB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUGuItvlLw8gIi6OK0GfQha+9gmmxYU5DpoLmRBRHog=;
 b=Vh9IXGxD+EqgQmJmLR1Hdx9agG7F3lo9FBgUnMRcqrwaTxStqWRHXQA66uJ2a6h9Wf
 Ah1L6zx6PcZi0hHjkP3csbb6vZijMlEAFBQuA5fX9RtKVt6IZeSx4GeEq5Cod/vWgDQR
 4h9Pd9cLU9RT7lg41kI6/r5gn3G3GVEDRBXdC/I8IUKHTIyFNzS/EsCbOWYaxQ2NI3Qo
 tFDM7duKlY0b/37zgBYxVodQGKQ8WozxicOJ4x3j2xDOyFQWSWwqu+x++FczimhJaTaE
 0zlBh0ZIM9NvLB9aOzbEpH+E/h0eFL07tv3X5YIazmwZ5UpfTLWrFu7GcTgnV4CnqPhj
 vXug==
X-Gm-Message-State: AFqh2kpt3+HPReVms1KTw2mR0NfNU59TZFCjm1U4sET7OqwHCtAAwAJM
 FrAoHyfaLRtlyTpU8aS/Xz2p09z3q1rhFQ==
X-Google-Smtp-Source: AMrXdXs0pWPqI+f8dWNF4W4aL14VDBBbZ/M834OD7RAaMQI8GgjystSxl8ViZHG9afH//s8v/8/J+w==
X-Received: by 2002:a17:907:3a90:b0:7c0:e5c6:2a74 with SMTP id
 fh16-20020a1709073a9000b007c0e5c62a74mr14395117ejc.34.1674334572340; 
 Sat, 21 Jan 2023 12:56:12 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200f0e5df3d05efd173.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:f0e5:df3d:5ef:d173])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b00862497eafb2sm13829525ejj.103.2023.01.21.12.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 12:56:11 -0800 (PST)
Date: Sat, 21 Jan 2023 20:56:03 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] hw/pci-host/mv64361: Reuse pci_swizzle_map_irq_fn
In-Reply-To: <20230106113927.8603-1-shentey@gmail.com>
References: <20230106113927.8603-1-shentey@gmail.com>
Message-ID: <73252BC9-79B9-407A-9A15-3C69065531D3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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



Am 6=2E Januar 2023 11:39:27 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>mv64361_pcihost_map_irq() is a reimplementation of
>pci_swizzle_map_irq_fn()=2E Resolve this redundancy=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>

Ping

Patch is reviewed=2E Who will queue it? Daniel?

Best regards,
Bernhard

>---
>Testing done:
>* `qemu-system-ppc -machine pegasos2 \
>                   -rtc base=3Dlocaltime \
>                   -device ati-vga,guest_hwcursor=3Dtrue,romfile=3D"" \
>                   -cdrom morphos-3=2E17=2Eiso \
>                   -kernel morphos-3=2E17/boot=2Eimg`
>---
> hw/pci-host/mv64361=2Ec | 7 +------
> 1 file changed, 1 insertion(+), 6 deletions(-)
>
>diff --git a/hw/pci-host/mv64361=2Ec b/hw/pci-host/mv64361=2Ec
>index cc9c4d6d3b=2E=2E70db142ec3 100644
>--- a/hw/pci-host/mv64361=2Ec
>+++ b/hw/pci-host/mv64361=2Ec
>@@ -72,11 +72,6 @@ struct MV64361PCIState {
>     uint64_t remap[5];
> };
>=20
>-static int mv64361_pcihost_map_irq(PCIDevice *pci_dev, int n)
>-{
>-    return (n + PCI_SLOT(pci_dev->devfn)) % PCI_NUM_PINS;
>-}
>-
> static void mv64361_pcihost_set_irq(void *opaque, int n, int level)
> {
>     MV64361PCIState *s =3D opaque;
>@@ -97,7 +92,7 @@ static void mv64361_pcihost_realize(DeviceState *dev, E=
rror **errp)
>     g_free(name);
>     name =3D g_strdup_printf("pci=2E%d", s->index);
>     h->bus =3D pci_register_root_bus(dev, name, mv64361_pcihost_set_irq,
>-                                   mv64361_pcihost_map_irq, dev,
>+                                   pci_swizzle_map_irq_fn, dev,
>                                    &s->mem, &s->io, 0, 4, TYPE_PCI_BUS);
>     g_free(name);
>     pci_create_simple(h->bus, 0, TYPE_MV64361_PCI_BRIDGE);

