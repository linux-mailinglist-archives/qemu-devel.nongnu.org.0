Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DFF4D00C0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:09:41 +0100 (CET)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRE3Q-0004sP-5Y
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:09:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDvT-00007Z-RU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:01:27 -0500
Received: from [2a00:1450:4864:20::632] (port=45592
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDvR-0001iw-S6
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:01:27 -0500
Received: by mail-ej1-x632.google.com with SMTP id qa43so32080856ejc.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 06:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=pteNMBXTfxxz/JBBFJONMtukg/g/iO4C40S0KLq7wB8=;
 b=iwE+7xHXFr3yXTn61o4kahoDLbdByBcgG/lh5lWn/EI4bl5bxfB3fgG8BEYY8eVeLI
 35IGD3KJrMErmruV5/Fb1w/SZB/D/8BgEj1aK21tv0RdQDwJprFyJVceB+zOCrZEZXW7
 GnlJdAkxuGa0coiWgNCPGDwGN4hxMUsjdwYq2RV9qeu8t+psL5CU7DS0soGzHfCVGdAm
 Bsn/BXSLSaOQ6Wc68b3tpJqY5hy/TQ+vwIhlkU5o7LIrXXlt0FAhBfXSR3STsLQFUvxI
 Z6oVhcDL9k7A0Pa+A9o/J86mVFTb3Cw1RySSXrHnwZhop3e36Lxk7hbMRNICniwWzkV+
 +VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=pteNMBXTfxxz/JBBFJONMtukg/g/iO4C40S0KLq7wB8=;
 b=HMaSsd5kMRL3bQxANGu8cnmQE4cFvprgoFgDltIA2ihs4Ba3YrnoySmEgGtbh3RZk7
 ntZZi46KSOogi71OEf1u0ng0B1/0U2Rorpx/J7728O5KxFGIYNCCs3kXm0F6RXtPH9bj
 VtgorvsD9ftaJZVYtKEpKurRDCrNRxjS1G+nHKwNc0O4IivqdDXWMXdlhQBBHBcNNmyj
 v0F+Ud0GN3rQ4/uVzDU2XZ/I3Kx+Je0RsGNVKPIk0Wa3ctr9xA1IBAnIu39mBrp0hWhg
 IulmaIPY4yu2+jvvBEL2i0aiDCzlhRBKGKLpWUHMobXQ4TitKTcV+m0SFXKp0tl5lVrz
 zZGw==
X-Gm-Message-State: AOAM5327uwDdD7cbmVRFUH6xi5Q8e+H1OKfpqpJ6k1zAW2PZlFytjqix
 wH4SRjvPlFt12uwLxpoNVMU=
X-Google-Smtp-Source: ABdhPJzZAulE+4O7zPl7FUo1BeRqo0CKueHlJ0dh13sejeur2sHphGBUoxSHS3lkBAx8DDY8kotovw==
X-Received: by 2002:a17:906:58ce:b0:6da:b548:1bbb with SMTP id
 e14-20020a17090658ce00b006dab5481bbbmr9039402ejs.14.1646661683674; 
 Mon, 07 Mar 2022 06:01:23 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-143-092.89.12.pool.telefonica.de.
 [89.12.143.92]) by smtp.gmail.com with ESMTPSA id
 kw5-20020a170907770500b006db075e5358sm2331005ejc.66.2022.03.07.06.01.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Mar 2022 06:01:23 -0800 (PST)
Date: Mon, 07 Mar 2022 14:01:17 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 12/13] hw/isa: Drop unused attributes from ISADevice
In-Reply-To: <20220307134353.1950-13-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-13-philippe.mathieu.daude@gmail.com>
Message-ID: <506A2E1F-40A5-4CE9-B000-FC4534ABBCC4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 7=2E M=C3=A4rz 2022 13:43:52 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philippe=2Emathieu=2Edaude@gmail=2Ecom>:
>From: Bernhard Beschow <shentey@gmail=2Ecom>
>
>Now that the last users of ISADevice::isairq[] have been resolved during =
the
>previous commits, it can be removed for good=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>Message-Id: <20220301220037=2E76555-7-shentey@gmail=2Ecom>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>---
> hw/isa/isa-bus=2Ec     | 13 -------------
> include/hw/isa/isa=2Eh |  2 --
> 2 files changed, 15 deletions(-)
>
>diff --git a/hw/isa/isa-bus=2Ec b/hw/isa/isa-bus=2Ec
>index af5add6a26=2E=2Ec64a14120b 100644
>--- a/hw/isa/isa-bus=2Ec
>+++ b/hw/isa/isa-bus=2Ec
>@@ -87,11 +87,7 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
>=20
> void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
> {
>-    assert(dev->nirqs < ARRAY_SIZE(dev->isairq));
>-    assert(isairq < ISA_NUM_IRQS);
>-    dev->isairq[dev->nirqs] =3D isairq;
>     *p =3D isa_get_irq(dev, isairq);
>-    dev->nirqs++;
> }
>=20
> void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isair=
q)
>@@ -150,14 +146,6 @@ int isa_register_portio_list(ISADevice *dev,
>     return 0;
> }
>=20
>-static void isa_device_init(Object *obj)
>-{
>-    ISADevice *dev =3D ISA_DEVICE(obj);
>-
>-    dev->isairq[0] =3D -1;
>-    dev->isairq[1] =3D -1;
>-}
>-
> ISADevice *isa_new(const char *name)
> {
>     return ISA_DEVICE(qdev_new(name));
>@@ -244,7 +232,6 @@ static const TypeInfo isa_device_type_info =3D {
>     =2Ename =3D TYPE_ISA_DEVICE,
>     =2Eparent =3D TYPE_DEVICE,
>     =2Einstance_size =3D sizeof(ISADevice),
>-    =2Einstance_init =3D isa_device_init,
>     =2Eabstract =3D true,
>     =2Eclass_size =3D sizeof(ISADeviceClass),
>     =2Eclass_init =3D isa_device_class_init,
>diff --git a/include/hw/isa/isa=2Eh b/include/hw/isa/isa=2Eh
>index d4417b34b6=2E=2Ed80cab5b79 100644
>--- a/include/hw/isa/isa=2Eh
>+++ b/include/hw/isa/isa=2Eh
>@@ -83,8 +83,6 @@ struct ISADevice {
>     DeviceState parent_obj;
>     /*< public >*/
>=20
>-    int8_t isairq[2];      /* -1 =3D unassigned */
>-    int nirqs;
>     int ioport_id;
> };
>=20

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>


