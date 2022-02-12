Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6DE4B356C
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 15:13:41 +0100 (CET)
Received: from localhost ([::1]:33658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIt9f-00026i-Oo
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 09:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nIt83-0001LL-2Q
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 09:11:59 -0500
Received: from [2a00:1450:4864:20::436] (port=37752
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nIt81-0003iQ-AE
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 09:11:58 -0500
Received: by mail-wr1-x436.google.com with SMTP id w11so19713488wra.4
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 06:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=cxef1gGstdcQuc1v+AdXvTVIfRPm7fZIBwosAUZmEBg=;
 b=YCc+9b2SAAVmr0z/mFk54tD5ddcXG8AxUZOVgG/zJEGgNG+NjVBRdGnL6j7BUcxV3g
 k0BCgE/praU+CVl+7bqzGi5u0k0zkXe9AxBBIXa8JbCKV9SeSFj6T8msPDW8TvKPe+iK
 hXFWoK4OvSANjZOq2R9j9IqPT89HHkTK9eUfdmbRAfMzqlxLaNdFEbp1hwya+FKOBmJa
 G0CEbn/sAo020GQEfL9yZ+K65Wk8J25CbVEzlwkh4KZ0Xvnyt5MYGk6NFKy6LxBBNT0Y
 8nxz0VSyGJi4CIBQRq4aQ/U0f+ym05XG0uQo83ttV3agXDsLM2ZYegmRsqIhBf3/jsca
 WhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=cxef1gGstdcQuc1v+AdXvTVIfRPm7fZIBwosAUZmEBg=;
 b=XYtFR5vyJJg0gupQqKngsG08dNI3wDGEhQ01ozR2VqIhCTvoUi1Q1tF0gkJhIWe1P+
 GEA8m4pdvqPR5KVu2yC7Mf99JNj+jdHw5a0f0wmgzR7Z2om6e+/r5yqg8wrIm/RipSuX
 Yf0j4916GvpcYAZ21GjOylCO0Q+gghy3/yJbrjcBwM2vDHUI+tsNEKoejwjoLU2N0iHy
 Gpnw0uDf85nJXbZf+P/QHTAOFZ3frVK4V1ffR+6y2vyqV/jW5yU3urWjl8PMU1wQEsxo
 NSYQSlfwPT71ii7WLdOVY4RtAVmhCqjGestu0tcH7DH86EnBCfNLHU5vt2fNm6mG1Kqu
 zO7A==
X-Gm-Message-State: AOAM532zuXkpZ36de3TiCOuzoO7vgDFyUwfaUnL0NNuJ0LYgvVrOXQNO
 ItD19wNw6RxQqlfs+IfcZq3UOp5shzs=
X-Google-Smtp-Source: ABdhPJwmJ1GuwPMdv2nIZHn/DYILJjufv37toT9BG2YJT+UZNx9g16oBEKxxadVdV3QFFhYY/NtETQ==
X-Received: by 2002:a17:906:1d0a:: with SMTP id
 n10mr5054935ejh.143.1644674761307; 
 Sat, 12 Feb 2022 06:06:01 -0800 (PST)
Received: from ?IPv6:::1?
 (200116b846c2ee0039d293ada42c1ec9.dip.versatel-1u1.de.
 [2001:16b8:46c2:ee00:39d2:93ad:a42c:1ec9])
 by smtp.gmail.com with ESMTPSA id cz12sm7335926edb.30.2022.02.12.06.06.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Feb 2022 06:06:00 -0800 (PST)
Date: Sat, 12 Feb 2022 15:05:58 +0100
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 5/5] isa/piix4: Resolve redundant i8259[] attribute
User-Agent: K-9 Mail for Android
In-Reply-To: <9a3e73e-ac7-f79-c84-ca9a8523d0d1@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-6-shentey@gmail.com>
 <9a3e73e-ac7-f79-c84-ca9a8523d0d1@eik.bme.hu>
Message-ID: <1D2AB604-50DD-48F8-8E92-DE9AEAE0FC90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12=2E Februar 2022 14:19:51 MEZ schrieb BALATON Zoltan <balaton@eik=2Ebm=
e=2Ehu>:
>On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>> This is a follow-up on patch "malta: Move PCI interrupt handling from
>> gt64xxx to piix4" where i8259[] was moved from MaltaState to PIIX4State
>> to make the code movement more obvious=2E However, i8259[] seems redund=
ant
>> to *isa, so remove it=2E
>
>Should this be squashed in patch 1 or at least come after it? Or are ther=
e=20
>some other changes needed before this patch?

I didn't want to change the patch order since they've been reviewed alread=
y=2E But yeah, you're right: It makes sense to get this out of the way earl=
y in the patch series=2E I will do a v3=2E

Regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> hw/isa/piix4=2Ec | 7 +------
>> 1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>> index a9322851db=2E=2E692fa8d1f9 100644
>> --- a/hw/isa/piix4=2Ec
>> +++ b/hw/isa/piix4=2Ec
>> @@ -43,7 +43,6 @@ struct PIIX4State {
>>     PCIDevice dev;
>>     qemu_irq cpu_intr;
>>     qemu_irq *isa;
>> -    qemu_irq i8259[ISA_NUM_IRQS];
>>
>>     int32_t pci_irq_levels[PIIX_NUM_PIRQS];
>>
>> @@ -73,7 +72,7 @@ static void piix4_set_irq(void *opaque, int irq_num, =
int level)
>>                 pic_level |=3D s->pci_irq_levels[i];
>>             }
>>         }
>> -        qemu_set_irq(s->i8259[pic_irq], pic_level);
>> +        qemu_set_irq(s->isa[pic_irq], pic_level);
>>     }
>> }
>>
>> @@ -323,9 +322,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus *=
*isa_bus, I2CBus **smbus)
>>
>>     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM=
_PIRQS);
>>
>> -    for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
>> -        s->i8259[i] =3D qdev_get_gpio_in_named(dev, "isa", i);
>> -    }
>> -
>>     return dev;
>> }
>>


