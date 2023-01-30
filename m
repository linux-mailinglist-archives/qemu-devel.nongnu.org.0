Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E7681728
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 18:03:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMXWt-000268-Sj; Mon, 30 Jan 2023 12:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMXWi-000247-PK; Mon, 30 Jan 2023 12:01:05 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMXWg-0000WX-Pt; Mon, 30 Jan 2023 12:01:04 -0500
Received: by mail-ej1-x634.google.com with SMTP id p26so22450320ejx.13;
 Mon, 30 Jan 2023 09:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7cNcBoCFRGFL287RkCLwUTCw45GsIyuh05XIOQRTKs=;
 b=peQqbSF4/UvK1b5pM1ycGJRP3RkLghPQwhgRItHo4HoXrcqN5IESZrk5UCwEDTPHiT
 JgTWXFqiz33VQ1+HLOmhIPMHE6qttKotEzHNMzkTBPYexBbBZtTsoBl/EP9Veln5Denx
 NlKdCPuQKg1zBbe9TnNVN9VnKotqc1gzaTtrIN68/aL/TaVofjRTFyu4ZhB5C/703yR7
 BKRjNDUrJwSLte1x1hTtC8KBzVC4IjZm+ip6WKOwX4wk8UHKnksRUzaHqX3BadoZJGVK
 4L49e/4H8iprnv9sQvF9soziPtC1E4vSamyoSnzPZDngbF988pB2AYxJwTs28htm0kml
 cbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7cNcBoCFRGFL287RkCLwUTCw45GsIyuh05XIOQRTKs=;
 b=aEvMFtdEC1mieoVO7rZxoIhOBgbaKPhFNkZjkTTGTMt5hEoePQgDw4/OLe9yLdiDXC
 rULFFfjsb/DRzoXxfQatMPt0KMw2A325nz7Kv78ooTkiyUmQROVv6J5VyhaiPtaneLqm
 HubvGdO1dznk7i93RYvGQKpGcFWlyq4tfSngJ2ep9ct9+3483t8QEJxPLqRbCcjoPa+E
 QfrEXB1UryNFIr54xN/H5rZs1j/mg/dzCA3IQJkGMw+i0gv3Xt2KL4slumswO9x1E1RW
 ixZmSVHQj9i36/TT7R5D7HwVOMV4g8b77rWBJMFPj43KM5exJvL/fB7H6iqm+5aZFxgj
 vKMg==
X-Gm-Message-State: AO0yUKUrruMXQZ3+MGJRH5OuLUUDY+wkJyrmt/TPYsx2A256QCDK+xM8
 NmENK7+XxDvKRISd9l6SCz9jmX/xuqU=
X-Google-Smtp-Source: AK7set+VLg9/69LkXi8I9gYKki7Tt2rN1ly668tzGu50LwfyHt/6jmy0cN4EFT+J90QV4pXkOV1NfQ==
X-Received: by 2002:a17:907:c206:b0:870:dceb:696d with SMTP id
 ti6-20020a170907c20600b00870dceb696dmr177348ejc.43.1675098057846; 
 Mon, 30 Jan 2023 09:00:57 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-240-001.89.12.pool.telefonica.de.
 [89.12.240.1]) by smtp.gmail.com with ESMTPSA id
 w25-20020a17090652d900b0088ade3056b8sm657025ejn.44.2023.01.30.09.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 09:00:57 -0800 (PST)
Date: Mon, 30 Jan 2023 17:00:51 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 06/10] hw/ide/pci: Add PCIIDEState::isa_irqs[]
In-Reply-To: <20230126211740.66874-7-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-7-shentey@gmail.com>
Message-ID: <FB58332B-FAB6-464A-A74C-B412FF7F1D27@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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



Am 26=2E Januar 2023 21:17:36 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>These legacy ISA IRQs allow the PIIX IDE functions to be wired up in
>their south bridges and the VIA IDE functions to disuse
>PCI_INTERRUPT_LINE as outlined in https://lists=2Enongnu=2Eorg/archive/ht=
ml/
>qemu-devel/2020-03/msg01707=2Ehtml =2E
>

Suggested-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>

>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> include/hw/ide/pci=2Eh | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>index 2a6284acac=2E=2E24c0b7a2dd 100644
>--- a/include/hw/ide/pci=2Eh
>+++ b/include/hw/ide/pci=2Eh
>@@ -49,6 +49,7 @@ struct PCIIDEState {
>=20
>     IDEBus bus[2];
>     BMDMAState bmdma[2];
>+    qemu_irq isa_irqs[2];
>     uint32_t secondary; /* used only for cmd646 */
>     MemoryRegion bmdma_bar;
>     MemoryRegion cmd_bar[2];

