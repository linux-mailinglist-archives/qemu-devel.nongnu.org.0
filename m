Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A676A3583
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 00:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWQA8-0006Ly-7E; Sun, 26 Feb 2023 18:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWQA1-0006KH-6d; Sun, 26 Feb 2023 18:10:29 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWQ9x-0004yT-7R; Sun, 26 Feb 2023 18:10:27 -0500
Received: by mail-ed1-x52e.google.com with SMTP id o12so18768774edb.9;
 Sun, 26 Feb 2023 15:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+TZjNq/kfbYlw1L7KJyYQ6J+Gnvmty+DGlljUWDegw=;
 b=kNjy1UxntuHEESeMDGpnbfiZ+UfqILR88ziEZG+Tj9J+oT11OctcWHB6/Q2RUDVRhD
 49erB5RXMvIe1pqnH8ooy8d4q9qwAyZHK19PV1xMP+dJs0i0TdkQdit9Xo0KEe0fp3YK
 y9Qhol7RuKuccGyREWcJNBkMVQL0fECWhV+Cnvw/xSfqh27EMQIXu0Vhkv1jCXTxrUbi
 kg2XxWa3OF8bcU0/nHczLobOecgVzkHE/Yg5R1LfkLKW051NjalwB/Eb3EQHwUFa8XD4
 Md2eGZM1UlCVqder5FnP/ol2aZhjbyz5xwYsmLryokcJUb1zoskrh77gy1EmYvS0EJCU
 aFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+TZjNq/kfbYlw1L7KJyYQ6J+Gnvmty+DGlljUWDegw=;
 b=Hz54caEQ4ntQ69/ZVmJPSWTPjfAvqH0hQcZBDHU7FXUmirabsYmiMHRu3IBv3TAZAR
 J3X4NpVHYufZGLYwJLZ3k4QhVdOUxx8xDZI5TiPaAFrv4nxkYOEfvfllEfL+KevUEE3Z
 3tKJiIqxmibHnNj6iuiUxQ82Wc9tgJ+9W9VuUFQLboLrueeolVK0/yuffENL4ZgB5Id4
 4vqMyiXUnjqx3TSDkpx8Oy++lq45bsdYJqsNzHObEljqO92aX3ACWkbiItSU7aJWKq13
 cEnEht6RMwHlZ993In/PAt8T+9P5lnZ3MpqarxL0fJ9IKKldGHpNkPNjPKVsPmBNdroT
 4afQ==
X-Gm-Message-State: AO0yUKU+4fd+W84w+wBFJpQVOt95WJO8xtHZo2E/7NjemQ+EtbNcwJ9n
 JkVdoNhIWidcWqCOY/n5ptY=
X-Google-Smtp-Source: AK7set+KlMueyqvIF199kItof0cIVL0fewp3Qi1skLSRyNQXFEVgupkthyQxKw8D3MqUNXdK98ks+A==
X-Received: by 2002:a17:906:5390:b0:87b:e105:5d9a with SMTP id
 g16-20020a170906539000b0087be1055d9amr32825766ejo.67.1677453023238; 
 Sun, 26 Feb 2023 15:10:23 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-013-188-032.77.13.pool.telefonica.de.
 [77.13.188.32]) by smtp.gmail.com with ESMTPSA id
 d9-20020a170906174900b008d3abe8726bsm2425987eje.154.2023.02.26.15.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 15:10:22 -0800 (PST)
Date: Sun, 26 Feb 2023 23:10:18 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
CC: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <a496276e-24fb-e2bc-fbdf-ace9ef7f361f@linaro.org>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
 <a496276e-24fb-e2bc-fbdf-ace9ef7f361f@linaro.org>
Message-ID: <0E10FCF9-465D-462A-8031-880B0907CCDA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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



Am 26=2E Februar 2023 22:27:50 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>On 25/2/23 19:11, BALATON Zoltan wrote:
>> From: Bernhard Beschow <shentey@gmail=2Ecom>
>>=20
>> The real VIA south bridges implement a PCI IRQ router which is configur=
ed
>> by the BIOS or the OS=2E In order to respect these configurations, QEMU
>> needs to implement it as well=2E
>>=20
>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4=
=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> [balaton: declare gpio inputs instead of changing pci bus irqs so it ca=
n
>>   be connected in board code; remove some empty lines]
>> Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>> Tested-by: Rene Engel <ReneEngel80@emailn=2Ede>
>> ---
>>   hw/isa/vt82c686=2Ec | 39 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>
>> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>> +{
>> +    switch (irq_num) {
>> +    case 0:
>> +        return s->dev=2Econfig[0x55] >> 4;
>> +    case 1:
>> +        return s->dev=2Econfig[0x56] & 0xf;
>> +    case 2:
>> +        return s->dev=2Econfig[0x56] >> 4;
>> +    case 3:
>> +        return s->dev=2Econfig[0x57] >> 4;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>> +{
>> +    ViaISAState *s =3D opaque;
>> +    PCIBus *bus =3D pci_get_bus(&s->dev);
>> +    int pic_irq;
>> +
>> +    /* now we change the pic irq level according to the via irq mappin=
gs */
>> +    /* XXX: optimize */
>> +    pic_irq =3D via_isa_get_pci_irq(s, irq_num);
>> +    if (pic_irq < ISA_NUM_IRQS) {
>
>the ISA IRQ is stored in 4-bit so will always be in range=2E

Indeed=2E I'd turn this into an assert to keep this assum visible=2E I'll =
do another iteration of the PCI IRQ router series=2E

Best regards,
Bernhard
>
>> +        int i, pic_level;
>> +
>> +        /* The pic level is the logical OR of all the PCI irqs mapped =
to it=2E */
>> +        pic_level =3D 0;
>> +        for (i =3D 0; i < PCI_NUM_PINS; i++) {
>> +            if (pic_irq =3D=3D via_isa_get_pci_irq(s, i)) {
>> +                pic_level |=3D pci_bus_get_irq_level(bus, i);
>> +            }
>> +        }
>> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
>> +    }
>> +}
>
>

