Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760A56998E0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:29:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgBm-0008MB-PZ; Thu, 16 Feb 2023 10:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSgBj-0008HA-90; Thu, 16 Feb 2023 10:28:47 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSgBf-0005yf-Cn; Thu, 16 Feb 2023 10:28:46 -0500
Received: by mail-ed1-x532.google.com with SMTP id dz21so4159035edb.13;
 Thu, 16 Feb 2023 07:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=msIQitLvCy3hNNZR6SlR9WVL30vgZmR3rkuqSXp+DgM=;
 b=ZORI345+T6tzd6yymOq2cbmC57JmrPGG0Cz5zeTnVvKdOaOfDwqydywAmi+sZlQIar
 EOpIFs79uFbTwqm+CsEbZ6geHdqwfK7AAWToV4Hrs22syo3DuX8KGwlehHLpj2YRtoKO
 QC0A5PQne/lj9zYikDwb4wwHY9lbZTYQvB56hPlA3geBALlecdrVEae0bGpfnHaia8aK
 91TSf0lsJv1/S4H215KS7SSHk1jyoz5VSsUKbkhHaUMFXUXT0kILjWO8tOmUsbQLNmp/
 9atYEosW/YzUreiXciaR9NRIcYu8ARNJJ225O440VnmDECTWrRzTaFqSGEYOBXLOFZrq
 9Wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=msIQitLvCy3hNNZR6SlR9WVL30vgZmR3rkuqSXp+DgM=;
 b=R1yMVwtEOuuJ4qJVMbDXNHkXspUlqCQEmXwp9SXJJas0ElY4H5ieSmcjd1x/PPlDij
 jJc3zlcJpElI94l6yF1WdBabehhhuRwfQLm1MJEyaPbCAtZ67gOc2JNsjjOqgmSVVxE6
 j+ydFVUNdMYxVBIWV0/ojKMA9yAyTGrgR2+1SU5kVWqDhm2dWZkEX/Qu/osaS4rB3yoA
 s91Ifg0v3QgJeZtvgfrygEsqHY7pig+nfEwNYGryrKgBOx0Or32LXFd7+XS6zdlStmiU
 0SsKQd3lKEapoihU+Ir5EgG3nC0GiptY9ECeL9u/2rO7w2ElAATvYkRPfS+IdKJacnns
 FM8A==
X-Gm-Message-State: AO0yUKV9gm8X1WWNUezGkLaRFiwYx46OxBN1JSV0kcg00t6gO9Bc20Pb
 iZsx3K/72YHptOpxENJJRfdg9rUUBQQ=
X-Google-Smtp-Source: AK7set9M+9WQ1y7Y0rv427FcHgAxS3x6oX/Ux26y3nzQnzTQo2lGU2Ng/VknXOr1MAqO/d/ql83vHQ==
X-Received: by 2002:aa7:d3cc:0:b0:4ac:bdf3:36ca with SMTP id
 o12-20020aa7d3cc000000b004acbdf336camr5931078edr.10.1676561321124; 
 Thu, 16 Feb 2023 07:28:41 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-175-191.89.12.pool.telefonica.de.
 [89.12.175.191]) by smtp.gmail.com with ESMTPSA id
 k2-20020a50ce42000000b004acbecf091esm1019340edj.17.2023.02.16.07.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 07:28:40 -0800 (PST)
Date: Thu, 16 Feb 2023 15:28:35 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 17/18] hw/isa: Un-inline isa_bus_from_device()
In-Reply-To: <20230215161641.32663-18-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-18-philmd@linaro.org>
Message-ID: <40DB2F9B-C716-46A1-88A0-DFC24C8C4388@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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



Am 15=2E Februar 2023 16:16:40 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>No point in inlining isa_bus_from_device() which is only
>used at device realization time=2E
>
>Reviewed-by: Richard Henderson <richard=2Ehenderson@linaro=2Eorg>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/isa/isa-bus=2Ec     | 5 +++++
> include/hw/isa/isa=2Eh | 6 +-----
> 2 files changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/hw/isa/isa-bus=2Ec b/hw/isa/isa-bus=2Ec
>index 719f2e96f2=2E=2Ef44817b88b 100644
>--- a/hw/isa/isa-bus=2Ec
>+++ b/hw/isa/isa-bus=2Ec
>@@ -167,6 +167,11 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *b=
us, Error **errp)
>     return qdev_realize_and_unref(&dev->parent_obj, &bus->parent_obj, er=
rp);
> }
>=20
>+ISABus *isa_bus_from_device(ISADevice *dev)
>+{
>+    return ISA_BUS(qdev_get_parent_bus(DEVICE(dev)));
>+}
>+
> ISADevice *isa_vga_init(ISABus *bus)
> {
>     vga_interface_created =3D true;
>diff --git a/include/hw/isa/isa=2Eh b/include/hw/isa/isa=2Eh
>index 1084d68ead=2E=2Ec9954a7d99 100644
>--- a/include/hw/isa/isa=2Eh
>+++ b/include/hw/isa/isa=2Eh
>@@ -96,6 +96,7 @@ ISADevice *isa_vga_init(ISABus *bus);
>=20
> /*  isa_get_irq() is deprecated, please use isa_bus_get_irq() instead=2E=
 */
> qemu_irq isa_get_irq(ISADevice *dev, unsigned irqnum);
>+ISABus *isa_bus_from_device(ISADevice *dev);
>=20
> /**
>  * isa_register_ioport: Install an I/O port region on the ISA bus=2E
>@@ -133,9 +134,4 @@ int isa_register_portio_list(ISADevice *dev,
>                              const MemoryRegionPortio *portio,
>                              void *opaque, const char *name);
>=20
>-static inline ISABus *isa_bus_from_device(ISADevice *d)
>-{
>-    return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
>-}
>-
> #endif

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

