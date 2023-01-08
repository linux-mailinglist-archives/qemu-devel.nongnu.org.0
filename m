Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62D8661634
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 16:36:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEXgN-0000lM-4n; Sun, 08 Jan 2023 10:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEXgL-0000jz-5Z; Sun, 08 Jan 2023 10:33:57 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEXdk-0007Tc-Ua; Sun, 08 Jan 2023 10:31:19 -0500
Received: by mail-ed1-x536.google.com with SMTP id v30so9051854edb.9;
 Sun, 08 Jan 2023 07:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DL0zTmUvAtOVMfdecjpYoh8tCp6kX4cDtJuiKYX36U=;
 b=GY5lMCO81Ny223poD2pq5gVBo1l+pCW7wuqj945Pqx+iDfEHgzCtVTtrSf9WXA7Tzy
 mObeYCJGf4g1SF+OFmlkFxuZfwiwJSAZMyTblWHhGLdguwqws0EZJZChLpqiyXrMWjJl
 xpBz/0bHh3A2k2xf/frduYtoxQjiIRf6ThOHT8YJHrVPbt5NeMtS7GQHR2JM72XTa4qk
 MhsrZTwiNSQAR9v6r60LjSGjaX0Qificthm809epDKPkJ9m1anAeubORiWcg0bj2sipz
 niCZLANclg6dP6jJS258BjRIbBdh0d4lsnTF9WFHbbSJDj3Cs2bBtrYW7GHnTs2CYmQ8
 mReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DL0zTmUvAtOVMfdecjpYoh8tCp6kX4cDtJuiKYX36U=;
 b=DWTjukZgSYp8+92F7Agt7uVJ4o4TmUXbFJR7aU2/acGksWR1109DJh5ShO3fIdgWCk
 BCEvbfu/RLxKeBj8+RTQ74BerF2sJhJwG+acTsdr/wd2zRMj9CImKtysn6MpGgvinWMx
 fzv0wG+iY9iVuRx1PEnLsYvHsft1d3WjzURy8QqloNR8ENluXdTC9PPj0JwLqxPrNk31
 yxY8IlHVZCfQ8ujomNvVu2/AZFs72twsHuaG1FPtjMovoRKvzxuz7qHUR2H+lXnSbyfe
 7HhX9s8tuW/c/qJY25NNYf7bd/u7GllRvO1HZ7LCLacDaipktPpkp6M5GUvw2dfG8SAw
 Qikg==
X-Gm-Message-State: AFqh2kokC6LPpP+YJTx2my+nNMb+3ODxhnOyXuR81z4Yv93Yl6notM7p
 vm3J3vVR3smSS92yEiBGaY4=
X-Google-Smtp-Source: AMrXdXuUSK78skwpl/JJGKNW05EuN3VGlb8/SMtr3/+NzBhjeEe3bxHDPXqaSFX8LiQFJ0asaDuenA==
X-Received: by 2002:a05:6402:160e:b0:499:8849:5fb3 with SMTP id
 f14-20020a056402160e00b0049988495fb3mr1686914edv.31.1673191824789; 
 Sun, 08 Jan 2023 07:30:24 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200b8984a967c4b65c7.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:b898:4a96:7c4b:65c7])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a056402516700b004642b35f89esm2637827ede.9.2023.01.08.07.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 07:30:24 -0800 (PST)
Date: Sun, 08 Jan 2023 15:30:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 13/31] hw/intc/i8259: Introduce i8259 proxy "isa-pic"
In-Reply-To: <9724624c-4848-4308-4dc6-d77bfcc8fc0f@ilande.co.uk>
References: <20230105143228.244965-1-shentey@gmail.com>
 <20230105143228.244965-14-shentey@gmail.com>
 <9724624c-4848-4308-4dc6-d77bfcc8fc0f@ilande.co.uk>
Message-ID: <CB2025A6-2962-475F-8CD6-5CBBCEFBC711@gmail.com>
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

Hi Mark,

Am 7=2E Januar 2023 23:45:39 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayl=
and@ilande=2Eco=2Euk>:
>On 05/01/2023 14:32, Bernhard Beschow wrote:
>
>> Having an i8259 proxy allows for ISA PICs to be created and wired up in
>> southbridges=2E This is especially interesting for PIIX3 for two reason=
s:
>> First, the southbridge doesn't need to care about the virtualization
>> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
>> attached) and out-IRQs (which will trigger the IRQs of the respective
>> virtualization technology) are separated=2E Second, since the in-IRQs a=
re
>> populated with fully initialized qemu_irq's, they can already be wired
>> up inside PIIX3=2E
>>=20
>> Cc: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/hw/intc/i8259=2Eh | 19 +++++++++++++++++++
>>   hw/intc/i8259=2Ec         | 27 +++++++++++++++++++++++++++
>>   2 files changed, 46 insertions(+)
>>=20
>> diff --git a/include/hw/intc/i8259=2Eh b/include/hw/intc/i8259=2Eh
>> index a0e34dd990=2E=2Ef666f5ee09 100644
>> --- a/include/hw/intc/i8259=2Eh
>> +++ b/include/hw/intc/i8259=2Eh
>> @@ -1,6 +1,25 @@
>>   #ifndef HW_I8259_H
>>   #define HW_I8259_H
>>   +#include "qom/object=2Eh"
>> +#include "hw/isa/isa=2Eh"
>> +#include "qemu/typedefs=2Eh"
>> +
>> +#define TYPE_ISA_PIC "isa-pic"
>> +OBJECT_DECLARE_SIMPLE_TYPE(ISAPICState, ISA_PIC)
>> +
>> +/*
>> + * TYPE_ISA_PIC is currently a PIC proxy which allows for interrupt wi=
ring in
>> + * a virtualization technology agnostic way=2E It could be turned into=
 a proper
>> + * GPIO-based ISA PIC in the future=2E
>> + */
>
>I would say that the last sentence isn't true, since when all PIC impleme=
ntations have been converted to qdev the mechanism for choosing the PIC imp=
lementation is currently unspecified=2E As an example once this has been do=
ne "isa-pic" could be removed completely and the code in the following patc=
h changed to something like:
>
>    object_initialize_child(obj, "pic", &d->pic, kvm_enabled() ?  TYPE_KV=
M_I8259 :
>                            TYPE_I8259);

This wouldn't work for the Malta machine where TYPE_I8259 is used even in =
the case of kvm_enabled()=2E Furthermore, the PC machine may instantiate ye=
t another interrupt controller here in Xen mode=2E Hence my sentence in the=
 cover letter of making PIIX agnostic about the virtualization technology u=
sed=2E Let's discuss future directions elsewhere for the sake of separation=
 of concerns ;)

>Perhaps change the last sentence to something like: "It provides a tempor=
ary bridge between older x86 code where qemu_irqs are passed around directl=
y and devices that use qdev gpios=2E"?

I'd omit the last sentence for now=2E

>Other than that the implementation looks sensible to me, so:
>
>Reviewed-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>

Thanks!

Best regards,
Bernhard

>> +struct ISAPICState {
>> +    DeviceState parent_obj;
>> +
>> +    qemu_irq in_irqs[ISA_NUM_IRQS];
>> +    qemu_irq out_irqs[ISA_NUM_IRQS];
>> +};
>> +
>>   /* i8259=2Ec */
>>     extern PICCommonState *isa_pic;
>> diff --git a/hw/intc/i8259=2Ec b/hw/intc/i8259=2Ec
>> index 0261f087b2=2E=2Ee99d02136d 100644
>> --- a/hw/intc/i8259=2Ec
>> +++ b/hw/intc/i8259=2Ec
>> @@ -455,9 +455,36 @@ static const TypeInfo i8259_info =3D {
>>       =2Eclass_size =3D sizeof(PICClass),
>>   };
>>   +static void isapic_set_irq(void *opaque, int irq, int level)
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
>> +    =2Eparent        =3D TYPE_DEVICE,
>> +    =2Einstance_size =3D sizeof(ISAPICState),
>> +    =2Einstance_init =3D isapic_init,
>> +};
>> +
>>   static void pic_register_types(void)
>>   {
>>       type_register_static(&i8259_info);
>> +    type_register_static(&isapic_info);
>>   }
>>     type_init(pic_register_types)
>
>
>ATB,
>
>Mark=2E

