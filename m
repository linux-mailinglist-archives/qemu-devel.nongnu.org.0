Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB91760E9A9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:58:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmVf-0001Dw-MH; Wed, 26 Oct 2022 15:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1onmVV-00016O-5u; Wed, 26 Oct 2022 15:56:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1onmVT-0008Kk-Gt; Wed, 26 Oct 2022 15:56:08 -0400
Received: by mail-wr1-x433.google.com with SMTP id g12so15459985wrs.10;
 Wed, 26 Oct 2022 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Mv0Tsmxtv5h6gp4lFayt82N8mBlkFqSYotCqKUhajQ=;
 b=jwra2ZRcCOhED+IhQcvGdsuvUIJcgNHwQE/WJUxAf2X/v7aH9qeo8slJ0P+MMdXe0l
 93hlG/3r1KCPEbu16c7uw2ayhIng85VVhR92HGg0GRtllLzOKBXZuBDy5IkNkva/R83m
 ib0Y7bfxbOxKs4UsdUo6OGZGEQ//d48gG1vyAd/f+8h76SB/y0rNVsxXPzdiVrcLjkaU
 dA4Kxlbl0CR5r0vZQOy44OspsAd3TTR/Dw+uOCBwQtKGXCp5lafjF6Hzrjap5dW3dPPV
 Mk/p24t/X69pS1IAbAhaZ2p7CYLqOBr/r3KhpLzse5DRujSZ4MNmRtFJzFAaGtglXj+/
 eFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Mv0Tsmxtv5h6gp4lFayt82N8mBlkFqSYotCqKUhajQ=;
 b=oesqIMH+wpq5Dxphr7oZHW8aMJz5n33ux10URqeNlr9teFgBBnCPE7DizE6Ky06fwL
 Nue64/JKBEz30qmpXD5aTINToP5h4gwryXVm9Oez50IIRv6tpbq5t43TAhOIcTTP+AE/
 M8+Olp5siUUg/qv+FBiGEfg75hUPFKyovHMNciupV2HCKPBiiKcOEX+It04lYk3Z/aeV
 mvL7R0oCHTn5DEap4ixE32T77wWCMHs+m/MVDhI0ChzAMfi0L043w162UlxzO+bKcA6X
 CvOTzYbooPQBEM71uGi4/GV60KVMP4dbEaYZupucs4Sd7GbjyJ5nxjzPLiI3nKkQJcqN
 u0zA==
X-Gm-Message-State: ACrzQf3O/TddrFsQCuXl9APT104K/rSbjKFN3xv7YId3gKJXiPNCbXVU
 0e5W6p65K/1B0wlM8wvDids=
X-Google-Smtp-Source: AMsMyM7RA2w7QMWezyRbwgdTSfmVVjxj/7az5rj9xTa7ZTt3daUzffs9A6wCXo+8UnnuPvUl6/PxqQ==
X-Received: by 2002:a5d:4143:0:b0:236:4b40:bbd1 with SMTP id
 c3-20020a5d4143000000b002364b40bbd1mr22049489wrq.26.1666814165059; 
 Wed, 26 Oct 2022 12:56:05 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200a5b52e958d7b8718.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:a5b5:2e95:8d7b:8718])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056000128f00b0022cd0c8c696sm6128213wrx.103.2022.10.26.12.56.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Oct 2022 12:56:04 -0700 (PDT)
Date: Wed, 26 Oct 2022 19:56:02 +0000
From: B <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 14/43] hw/intc/i8259: Introduce i8259 proxy "isa-pic"
In-Reply-To: <bdd0c528-82fe-db76-00d0-4caa6f1fb2ef@linaro.org>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-15-shentey@gmail.com>
 <bdd0c528-82fe-db76-00d0-4caa6f1fb2ef@linaro.org>
Message-ID: <0C25591D-0B8C-4C56-8467-683F70D3EBF4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 24=2E Oktober 2022 07:35:48 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>Hi Bernhard,
>
>On 22/10/22 17:04, Bernhard Beschow wrote:
>> Having an i8259 proxy allows for ISA PICs to be created and wired up in
>> southbridges=2E This is especially interesting for PIIX3 for two reason=
s:
>> First, the southbridge doesn't need to care about the virtualization
>> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
>> attached) and out-IRQs (which will trigger the IRQs of the respective
>> virtzalization technology) are separated=2E Second, since the in-IRQs a=
re
>> populated with fully initialized qemu_irq's, they can already be wired
>> up inside PIIX3=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/intc/i8259=2Ec         | 27 +++++++++++++++++++++++++++
>>   include/hw/intc/i8259=2Eh | 14 ++++++++++++++
>>   2 files changed, 41 insertions(+)
>
>> +static void isapic_set_irq(void *opaque, int irq, int level)
>> +{
>> +    ISAPICState *s =3D opaque;
>> +
>> +    qemu_set_irq(s->out_irqs[irq], level);
>> +}
>> +
>> +static void isapic_init(Object *obj)
>> +{
>> +    ISAPICState *s =3D ISA_PIC(obj);
>> +
>> +    qdev_init_gpio_in(DEVICE(s), isapic_set_irq, ISA_NUM_IRQS);
>> +    qdev_init_gpio_out(DEVICE(s), s->out_irqs, ISA_NUM_IRQS);
>> +
>> +    for (int i =3D 0; i < ISA_NUM_IRQS; ++i) {
>> +        s->in_irqs[i] =3D qdev_get_gpio_in(DEVICE(s), i);
>> +    }
>> +}
>> +
>> +static const TypeInfo isapic_info =3D {
>> +    =2Ename          =3D TYPE_ISA_PIC,
>> +    =2Eparent        =3D TYPE_ISA_DEVICE,
>> +    =2Einstance_size =3D sizeof(ISAPICState),
>> +    =2Einstance_init =3D isapic_init,
>> +};
>
>> --- a/include/hw/intc/i8259=2Eh
>> +++ b/include/hw/intc/i8259=2Eh
>> @@ -1,6 +1,20 @@
>>   #ifndef HW_I8259_H
>>   #define HW_I8259_H
>>   +#include "qom/object=2Eh"
>> +#include "hw/isa/isa=2Eh"
>> +#include "qemu/typedefs=2Eh"
>> +
>> +#define TYPE_ISA_PIC "isa-pic"
>> +OBJECT_DECLARE_SIMPLE_TYPE(ISAPICState, ISA_PIC)
>> +
>> +struct ISAPICState {
>> +    ISADevice parent_obj;
>> +
>> +    qemu_irq in_irqs[ISA_NUM_IRQS];
>> +    qemu_irq out_irqs[ISA_NUM_IRQS];
>> +};
>
>There is nothing I8259 / ISA specific in your model=2E
>
>What about adding a generic qdev proxy-irq (having a configurable
>number of IRQs to proxy)? See for example hw/core/split-irq=2Ec=2E

Will do!

Best regards,
Bernhard
>
>Regards,
>
>Phil=2E

