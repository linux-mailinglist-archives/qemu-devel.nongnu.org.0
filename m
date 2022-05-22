Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353FA5302FA
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 14:18:22 +0200 (CEST)
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nskXN-0006KZ-B6
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 08:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nskVv-0004kr-H6; Sun, 22 May 2022 08:16:51 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:41636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nskVt-00024J-ME; Sun, 22 May 2022 08:16:51 -0400
Received: by mail-ej1-x632.google.com with SMTP id ck4so19222134ejb.8;
 Sun, 22 May 2022 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=tDOeNZAaThO9i5dBcdZ6H1/vbFtJ5Krt3B/YKykz8x4=;
 b=MjTJQD0LkVNpfMd3xp75lKiVA1YC7/EvvvNDZ1rxlSHKe/RPFgnK/roF69wJ8dX+5z
 1RMUSg8043JC0LLPee5/UnXrOhIX1xA5Ei3SWRoi2KzbexixHDOk2/avrgSNBz0m0rOl
 E2JleXmwU2sTc+V3qv2mnfV3CK3PaE/C8n8v6UukyHOPm56x5puT8Mt/qJIYY+C2Oeua
 IU24iawaWJAnnk0qc5aJHdOInEXMZ2Yryz6hu39Kmr4cOQ5JKhxnAYkm6VmtA8eqBHmE
 VPe9ddBcSYjix7WVFnwClECswVKarL3mvrdGyn5rNVpD00dl5JXuDh1GC2NDG5NrPne1
 Kofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=tDOeNZAaThO9i5dBcdZ6H1/vbFtJ5Krt3B/YKykz8x4=;
 b=ivTTHrkrd5J0xZ+3JBA4hZ+FlpacvmIcstIdJaEHFkPJJd2/WEEEZqynPJHR3MEydw
 dpqUEzYLp7ORzcsgiwcuTJ2ASKU+B+jLM8K3F2Bt5x6AsB2rQYuR0mQBo4HchJTP9GAB
 Qn0E2VW/bBxw/f4XbfiMHdvWJg+W79Sr8T8KEa+nCrWE/lXdgp83vNTS176KJ4un0e70
 cMHGa2Nz840ZMLROzyNRDkSUahOCTI+UrPiNumU6SL9qtrYDBKn0d2VQYWUKtLZ1/Zbc
 A4kygMtoQwiyotrcxpIqqe6K1oQKoomMh4X7rw7h7/vKmIjVCHIE/ddzoyFSGDbq0m49
 DzaA==
X-Gm-Message-State: AOAM531jz42uMBOmM0ewf1U+89r+zJA0PWmSiWCtkC9xYH4azfTQkhBd
 749cad3NtpI/b6ok+bgN+FM=
X-Google-Smtp-Source: ABdhPJyEEA5md0uepILu398XqI/Thx2AA/sm49pqVdkQbVr1G0FDbh4j3IWNTSWjXO2j4lslrJoUzg==
X-Received: by 2002:a17:907:1b1b:b0:6e4:7fac:6ce0 with SMTP id
 mp27-20020a1709071b1b00b006e47fac6ce0mr15706232ejc.617.1653221807253; 
 Sun, 22 May 2022 05:16:47 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-205-016.78.54.pool.telefonica.de.
 [78.54.205.16]) by smtp.gmail.com with ESMTPSA id
 m25-20020a1709066d1900b006fec6e1d856sm973528ejr.82.2022.05.22.05.16.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 May 2022 05:16:46 -0700 (PDT)
Date: Sun, 22 May 2022 12:16:40 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 2/2] rtc/mc146818rtc: QOM'ify io_base offset
In-Reply-To: <dfdebd9e-d60b-0744-63b5-ff5d48c9314b@ilande.co.uk>
References: <20220520174537.5827-1-shentey@gmail.com>
 <20220520174537.5827-3-shentey@gmail.com>
 <233ae2da-ca1c-ea11-8af5-3eb8f936dbba@ilande.co.uk>
 <CAG4p6K4yNa7g8o1kLKp81+cZYzh8WNETJuW4NKm_6X9ChtgEEQ@mail.gmail.com>
 <dfdebd9e-d60b-0744-63b5-ff5d48c9314b@ilande.co.uk>
Message-ID: <6D8A437A-F44E-499C-AC7B-24FCC35208B6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22=2E Mai 2022 12:13:48 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayland=
@ilande=2Eco=2Euk>:
>On 22/05/2022 10:07, Bernhard Beschow wrote:
>
>> On Sat, May 21, 2022 at 11:24 AM Mark Cave-Ayland <mark=2Ecave-ayland@i=
lande=2Eco=2Euk <mailto:mark=2Ecave-ayland@ilande=2Eco=2Euk>> wrote:
>>=20
>>     On 20/05/2022 18:45, Bernhard Beschow wrote:
>>=20
>>      > Exposing the io_base offset as a QOM property not only allows it=
 to be
>>      > configurable but also to be displayed in HMP:
>>      >
>>      > Before:
>>      >
>>      > (qemu) info qtree
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=2E=2E=2E
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev: mc146818rtc, id ""
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-out "" 1
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base_year =3D 0 =
(0x0)
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D 8 (0x8)
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lost_tick_policy=
 =3D "discard"
>>      >
>>      > After:
>>      >
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev: mc146818rtc, id ""
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-out "" 1
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base_year =3D 0 =
(0x0)
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iobase =3D 112 (=
0x70)
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D 8 (0x8)
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lost_tick_policy=
 =3D "discard"
>>      >
>>      > Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom <mailto:she=
ntey@gmail=2Ecom>>
>>      > ---
>>      >=C2=A0 =C2=A0hw/i386/microvm-dt=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-
>>      >=C2=A0 =C2=A0hw/rtc/mc146818rtc=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 7 ++++---
>>      >=C2=A0 =C2=A0include/hw/rtc/mc146818rtc=2Eh | 2 +-
>>      >=C2=A0 =C2=A03 files changed, 6 insertions(+), 5 deletions(-)
>>      >
>>      > diff --git a/hw/i386/microvm-dt=2Ec b/hw/i386/microvm-dt=2Ec
>>      > index a5db9e4e5a=2E=2E39fe425b26 100644
>>      > --- a/hw/i386/microvm-dt=2Ec
>>      > +++ b/hw/i386/microvm-dt=2Ec
>>      > @@ -209,7 +209,7 @@ static void dt_add_isa_rtc(MicrovmMachineSta=
te *mms,
>>     ISADevice *dev)
>>      >=C2=A0 =C2=A0{
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0const char compat[] =3D "motorola,mc14=
6818";
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t irq =3D object_property_get_u=
int(OBJECT(dev), "irq", NULL);
>>      > -=C2=A0 =C2=A0 hwaddr base =3D RTC_ISA_BASE;
>>      > +=C2=A0 =C2=A0 hwaddr base =3D object_property_get_int(OBJECT(de=
v), "iobase", NULL);
>>=20
>>     Same comment here re: &error_abort=2E
>>=20
>>=20
>> Ack=2E
>>=20
>>=20
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr size =3D 8;
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0char *nodename;
>>      >
>>      > diff --git a/hw/rtc/mc146818rtc=2Ec b/hw/rtc/mc146818rtc=2Ec
>>      > index f235c2ddbe=2E=2E484f91b6f8 100644
>>      > --- a/hw/rtc/mc146818rtc=2Ec
>>      > +++ b/hw/rtc/mc146818rtc=2Ec
>>      > @@ -941,7 +941,7 @@ static void rtc_realizefn(DeviceState *dev, =
Error **errp)
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_register_suspend_notifier(&s->sus=
pend_notifier);
>>      >
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_init_io(&s->io, OBJECT(s=
), &cmos_ops, s, "rtc", 2);
>>      > -=C2=A0 =C2=A0 isa_register_ioport(isadev, &s->io, RTC_ISA_BASE)=
;
>>      > +=C2=A0 =C2=A0 isa_register_ioport(isadev, &s->io, s->io_base);
>>      >
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0/* register rtc 0x70 port for coalesce=
d_pio */
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_set_flush_coalesced(&s->=
io);
>>      > @@ -950,7 +950,7 @@ static void rtc_realizefn(DeviceState *dev, =
Error **errp)
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(&s->io, 0,=
 &s->coalesced_io);
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_add_coalescing(&s->coale=
sced_io, 0, 1);
>>      >
>>      > -=C2=A0 =C2=A0 qdev_set_legacy_instance_id(dev, RTC_ISA_BASE, 3)=
;
>>      > +=C2=A0 =C2=A0 qdev_set_legacy_instance_id(dev, s->io_base, 3);
>>      >
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0object_property_add_tm(OBJECT(s), "dat=
e", rtc_get_date);
>>      >
>>      > @@ -983,6 +983,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, in=
t base_year,
>>     qemu_irq intercept_irq)
>>      >
>>      >=C2=A0 =C2=A0static Property mc146818rtc_properties[] =3D {
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_INT32("base_year", RTCStat=
e, base_year, 1980),
>>      > +=C2=A0 =C2=A0 DEFINE_PROP_UINT32("iobase", RTCState, io_base, 0=
x70),
>>=20
>>     I think this should be RTC_ISA_BASE?
>>=20
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT8("irq", RTCState, isa=
irq, RTC_ISA_IRQ),
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_LOSTTICKPOLICY("lost_tick_=
policy", RTCState,
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lost_tick_policy, L=
OST_TICK_POLICY_DISCARD),
>>      > @@ -1028,7 +1029,7 @@ static void rtc_build_aml(ISADevice *isade=
v, Aml *scope)
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 * does, even though qemu only respond=
s to the first two ports=2E
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0crs =3D aml_resource_template();
>>      > -=C2=A0 =C2=A0 aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE=
, RTC_ISA_BASE,
>>      > +=C2=A0 =C2=A0 aml_append(crs, aml_io(AML_DECODE16, s->io_base, =
s->io_base,
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01, 0x08));
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0aml_append(crs, aml_irq_no_flags(s->is=
airq));
>>      >
>>      > diff --git a/include/hw/rtc/mc146818rtc=2Eh b/include/hw/rtc/mc1=
46818rtc=2Eh
>>      > index 33d85753c0=2E=2E1f7942a9f8 100644
>>      > --- a/include/hw/rtc/mc146818rtc=2Eh
>>      > +++ b/include/hw/rtc/mc146818rtc=2Eh
>>      > @@ -26,6 +26,7 @@ struct RTCState {
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t cmos_data[128];
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t cmos_index;
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t isairq;
>>      > +=C2=A0 =C2=A0 uint32_t io_base;
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t base_year;
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t base_rtc;
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t last_update;
>>      > @@ -49,7 +50,6 @@ struct RTCState {
>>      >=C2=A0 =C2=A0};
>>      >
>>      >=C2=A0 =C2=A0#define RTC_ISA_IRQ 8
>>      > -#define RTC_ISA_BASE 0x70
>>=20
>>     =2E=2E=2E and so you'll need to keep this=2E
>>=20
>>=20
>> My intention was indeed to remove it since it is now redundant=2E Keepi=
ng the constant public has the risk of using it instead of the user-configu=
rable QOM property which could cause bugs=2E
>
>True, that's not a completely unreasonable argument=2E In that case how a=
bout moving the RTC_ISA_BASE define to somewhere around the top of hw/rtc/m=
c146818rtc=2Ec so that the origin of the 0x70 address is preserved?

Okay, I'll move it there=2E
>
>>      >=C2=A0 =C2=A0ISADevice *mc146818_rtc_init(ISABus *bus, int base_y=
ear,
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq intercept_irq);
>>=20
>>     Otherwise:
>>=20
>>     Reviewed-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk
>>     <mailto:mark=2Ecave-ayland@ilande=2Eco=2Euk>>
>>=20
>>=20
>>     ATB,
>>=20
>>     Mark=2E
>
>
>ATB,
>
>Mark=2E


