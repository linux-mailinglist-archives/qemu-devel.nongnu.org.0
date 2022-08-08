Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D89358CD35
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:58:34 +0200 (CEST)
Received: from localhost ([::1]:55204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL71N-0003IW-JT
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oL70O-0001yR-2c
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:57:32 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oL70M-0001sc-0g
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:57:31 -0400
Received: by mail-ej1-x62c.google.com with SMTP id k26so17999845ejx.5
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=sFh1E1MQIkiQ5IXW9Iz60FEWtGo0+gwb2+dsce3PUUc=;
 b=mUcStt14OCrAcQW1O5YkiEOzmliD8LManxaDagIazonSqDUpaQYqZY8uTVwt+EUtrB
 Efgrp0D5pS+59Em9Lrn0D1Kni6vC07pOA6GFJF3GT1Z/X9cJijveKFNgW6l2qRytrKTt
 zeDAHSuqtImxz7x3ZeygI2ZFcnd8r+BWYqa+Nl/8goPhoCj0rrc1HfaAc1gOOVDbz6LZ
 57m1SfUWHYf/JQUUAzQQd2g7vuFfL1vVKvEPvluwUGfpB9y+nfmlhqi8vGR+IESB4ZfS
 MWM9PQwYOxxSMnke2MloCZvWkcfwe9EGv4mrMvjxrWEAF3CT8fWKzoX5nsEsjA04nvnG
 uSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=sFh1E1MQIkiQ5IXW9Iz60FEWtGo0+gwb2+dsce3PUUc=;
 b=1Kcq72tk7VMGaJHsuNG9hLAfAAEyyf92RN2PMsbdZ+WQMPn9+/QEelys8xhck/hP0S
 b+Zj6l4uMP1sMchd5Nfv3L4FjHGO8qxtsy1dquD6cC730mOAcA6ke43LDJRHaBq2Vxdx
 LGdA9itNuyjGjwiTp3BUTNPDzG3C+TEGT+NrYU0BzBk0xxx9NhaR/eh4mLM2Yzoe/nsr
 Y4XJBuCwsD/a+ytooM9ATTCnuY4GYRrIUSyyhHoGASeI9+/gbsT8p1gDro65E48GhI06
 GiduF+w33FafiYuHhSjiSmKUR3W9xR8e6wOmxO4O3xt+lSFBFR/IQYkCihYm6QiIkvEH
 IWpw==
X-Gm-Message-State: ACgBeo0Too12TzTG9pjWDS0TBsd7c7gt2hlh64d36rUvciUhHy/e5TsO
 Ld1KOsrrPlSQ4XHJsd6QMig=
X-Google-Smtp-Source: AA6agR46TyLbOKya9VPK/dBsa6Y773J/cFaNSvSM/vSQL9UA1p7vLfpWrwp8zldAsvIVP4JlHC6yGg==
X-Received: by 2002:a17:907:1dc5:b0:730:aade:95fb with SMTP id
 og5-20020a1709071dc500b00730aade95fbmr14400343ejc.520.1659981447935; 
 Mon, 08 Aug 2022 10:57:27 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-176-010.89.14.pool.telefonica.de.
 [89.14.176.10]) by smtp.gmail.com with ESMTPSA id
 bx7-20020a0564020b4700b0043577da51f1sm4877927edb.81.2022.08.08.10.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 10:57:27 -0700 (PDT)
Date: Mon, 08 Aug 2022 19:57:23 +0200
From: BB <shentey@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Ani Sinha <ani@anisinha.ca>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_for-7=2E1=5D_hw/mips/malta=3A_tur?=
 =?US-ASCII?Q?n_off_x86_specific_features_of_PIIX4=5FPM?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220808141540.317e018e@redhat.com>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
 <20220728151627.119d57d5@redhat.com>
 <769cfc18-9585-5ddf-de46-52aa64328cea@amsat.org>
 <CAG4p6K53y=Oe9vynXgGYTZ9CfHewsDeE3mFDkEb-_us7rgaBcg@mail.gmail.com>
 <20220808141540.317e018e@redhat.com>
Message-ID: <E4A796B6-AA0E-4266-8698-E894A51A7807@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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



Am 8=2E August 2022 14:15:40 MESZ schrieb Igor Mammedov <imammedo@redhat=
=2Ecom>:
>On Wed, 3 Aug 2022 19:26:30 +0200
>Bernhard Beschow <shentey@gmail=2Ecom> wrote:
>
>> On Tue, Aug 2, 2022 at 8:37 AM Philippe Mathieu-Daud=C3=A9 via <
>> qemu-devel@nongnu=2Eorg> wrote:
>>=20
>> > On 28/7/22 15:16, Igor Mammedov wrote: =20
>> > > On Thu, 28 Jul 2022 13:29:07 +0100
>> > > Peter Maydell <peter=2Emaydell@linaro=2Eorg> wrote:
>> > > =20
>> > >> On Thu, 28 Jul 2022 at 12:50, Igor Mammedov <imammedo@redhat=2Ecom=
> =20
>> > wrote: =20
>> > >>>
>> > >>> QEMU crashes trying to save VMSTATE when only MIPS target are com=
piled =20
>> > in =20
>> > >>>    $ qemu-system-mips -monitor stdio
>> > >>>    (qemu) migrate "exec:gzip -c > STATEFILE=2Egz"
>> > >>>    Segmentation fault (core dumped)
>> > >>>
>> > >>> It happens due to PIIX4_PM trying to parse hotplug vmstate struct=
ures
>> > >>> which are valid only for x86 and not for MIPS (as it requires ACP=
I
>> > >>> tables support which is not existent for ithe later) =20
>> >
>> > We already discussed this Frankenstein PIIX4 problem 2 and 4 years ag=
o:
>> >
>> > https://lore=2Ekernel=2Eorg/qemu-devel/4d42697e-ba84-e5af-3a17-a2cc52=
cf0dbc@redhat=2Ecom/
>> >
>> > https://lore=2Ekernel=2Eorg/qemu-devel/20190304210359-mutt-send-email=
-mst@kernel=2Eorg/ =20
>>=20
>>=20
>> Interesting reads!
>>=20
>>=20
>> > >>> Issue was probably exposed by trying to cleanup/compile out unuse=
d
>> > >>> ACPI bits from MIPS target (but forgetting about migration bits)=
=2E
>> > >>>
>> > >>> Disable compiled out features using compat properties as the leas=
t
>> > >>> risky way to deal with issue=2E =20
>> >
>> > So now MIPS is forced to use meaningless compat[] to satisfy X86=2E
>> >
>> > Am I wrong seeing this as a dirty hack creeping in, yet another
>> > technical debt that will hit (me=2E=2E=2E) back in a close future?
>> >
>> > Are we sure there are no better solution (probably more time consumin=
g
>> > and involving refactors) we could do instead?
>> > =20
>>=20
>> Working on the consolidation of piix3 and -4 soutbridges [1] I've stumb=
led
>> over certain design decisions where board/platform specific assumptions=
 are
>> baked into the piix device models=2E I figure that's the core of the is=
sue=2E
>>=20
>> In our case the ACPI functionality is implemented by inheritance while
>> perhaps it should be implemented using composition=2E With composition,=
 the
>> ACPI functionality could be injected by the caller: The pc board would
>> inject it while the Malta board wouldn't=2E This would solve both the c=
rash
>> and above design problem=2E
>
>While refactoring we should keep migration stream compatible with older
>QEMU versions (we must not regress widely x86 code path)=2E Which might b=
e
>tricky in this case=2E

Does this particular fix make future compatibility harder or easier or is =
it that hard already? IIUC it omits the hotplug bits in the vm state for Ma=
lta which is what one would expect there, right?

>Perhaps the best we could do is follow up on Philippe's idea to make
>PIIX4_PM frankenstein x86-specific (the least chance for regressions)
>and create/use clean version for anything else=2E

Having two implementations of the same device means that we'll end up havi=
ng duplicate code with board/platform-specific assumptions baked in=2E I gu=
ess what Phil cares about is a sustainable solution without hacks that does=
n't cause bloat and/or regressions for MIPS, especially for features where =
MIPS doesn't benefit from=2E I believe that composition could be such a sol=
ution=2E

My consolidation work could actually make PIIX4 an option for the PC machi=
ne=2E This means that PIIX4_PM wouldn't be Frankenstein any more=2E This wo=
rks already on my branch - for both PC and Malta=2E Furthermore, it looks l=
ike it allowed Malta to benefit more from KVM virtualization, but that's of=
f-topic in this discussion=2E

>> I'd be willing to implement it but can't make any promises about the ti=
me
>> frame since I'm currently doing this in my free time=2E Any hints regar=
ding
>> the implementation would be welcome, though=2E
>>=20
>> Best regards,
>> Bernhard
>>=20
>> [1] https://github=2Ecom/shentok/qemu/commits/piix-consolidate
>>=20
>>=20
>> > Thanks,
>> >
>> > Phil=2E
>> > =20
>> > >>> Signed-off-by: Igor Mammedov <imammedo@redhat=2Ecom> =20
>> > >>
>> > >> Resolves: https://gitlab=2Ecom/qemu-project/qemu/-/issues/995
>> > >> =20
>> > >>> ---
>> > >>> PS:
>> > >>> another approach could be setting defaults to disabled state and
>> > >>> enabling them using compat props on PC machines (which is more
>> > >>> code to deal with =3D> more risky) or continue with PIIX4_PM
>> > >>> refactoring to split x86-shism out (which I'm not really
>> > >>> interested in due to risk of regressions for not much of
>> > >>> benefit)
>> > >>> ---
>> > >>>   hw/mips/malta=2Ec | 9 +++++++++
>> > >>>   1 file changed, 9 insertions(+)
>> > >>>
>> > >>> diff --git a/hw/mips/malta=2Ec b/hw/mips/malta=2Ec
>> > >>> index 7a0ec513b0=2E=2E0e932988e0 100644
>> > >>> --- a/hw/mips/malta=2Ec
>> > >>> +++ b/hw/mips/malta=2Ec
>> > >>> @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device =
=3D {
>> > >>>       =2Einstance_init =3D mips_malta_instance_init,
>> > >>>   };
>> > >>>
>> > >>> +GlobalProperty malta_compat[] =3D {
>> > >>> +    { "PIIX4_PM", "memory-hotplug-support", "off" },
>> > >>> +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" =
},
>> > >>> +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
>> > >>> +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
>> > >>> +}; =20
>> > >>
>> > >> Is there an easy way to assert in hw/acpi/piix4=2Ec that if
>> > >> CONFIG_ACPI_PCIHP was not set then the board has initialized
>> > >> all these properties to the don't-use-hotplug state ?
>> > >> That would be a guard against similar bugs (though I suppose
>> > >> we probably aren't likely to add new piix4 boards=2E=2E=2E) =20
>> > >
>> > > unfortunately new features still creep in 'pc' machine
>> > > ex: "acpi-root-pci-hotplug"), and I don't see an easy
>> > > way to compile that nor enforce that in the future=2E
>> > >
>> > > Far from easy would be split piix4_pm on base/enhanced
>> > > classes so we wouldn't need x86 specific hacks in 'base'
>> > > variant (assuming 'enhanced' could maintain the current
>> > > VMSTATE to keep cross-version migration working)=2E
>> > > =20
>> > >>> +const size_t malta_compat_len =3D G_N_ELEMENTS(malta_compat);
>> > >>> +
>> > >>>   static void mips_malta_machine_init(MachineClass *mc)
>> > >>>   {
>> > >>>       mc->desc =3D "MIPS Malta Core LV";
>> > >>> @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(Machine=
Class =20
>> > *mc) =20
>> > >>>       mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("24Kf");
>> > >>>   #endif
>> > >>>       mc->default_ram_id =3D "mips_malta=2Eram";
>> > >>> +    compat_props_add(mc->compat_props, malta_compat, =20
>> > malta_compat_len); =20
>> > >>>   }
>> > >>>
>> > >>>   DEFINE_MACHINE("malta", mips_malta_machine_init)
>> > >>> --
>> > >>> 2=2E31=2E1 =20
>> > >>
>> > >> thanks
>> > >> -- PMM
>> > >> =20
>> > > =20
>> >
>> >
>> > =20
>

