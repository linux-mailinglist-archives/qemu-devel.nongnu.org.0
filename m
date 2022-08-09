Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0AA58D48C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 09:31:30 +0200 (CEST)
Received: from localhost ([::1]:54964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLJi5-0002Nc-Cu
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 03:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oLJe8-0007za-RI
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oLJe3-000760-1D
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660030035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8FFZ6VDmzEEYHvkcS1M19LQCOVWsrj/3skK2UaX9Ko=;
 b=ZoNwmE6uuj6DOsdndO2gurDnT+ZtG09SQxZWaf1FYZ56voAG+He/lB3Ac+P3DE2dhrm1nq
 o1We6a0DVIaiHwT84OFXQAPxOb9wkU9oYCK3fq1mM4jWYGuPdDWOmLuvrw6HCQl5OfH+HU
 TKpRwP811pC1t9ES7GblHC7Z8qgP9WE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-ObxOF8ImPzenLpRrOhHSPg-1; Tue, 09 Aug 2022 03:27:13 -0400
X-MC-Unique: ObxOF8ImPzenLpRrOhHSPg-1
Received: by mail-ej1-f72.google.com with SMTP id
 g18-20020a1709065d1200b0073082300e1fso3128902ejt.12
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 00:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=X8FFZ6VDmzEEYHvkcS1M19LQCOVWsrj/3skK2UaX9Ko=;
 b=5X+6M0KsXEwkpy/vr+iFtNN4dPnPZFqUeBIE7/M/iCq4JMvf1Q/+57xkkenWqluH6T
 0qkkssJMYWHOW1dYxTMUjSDdO2N6R8yN6gWNK1xCq0TJ940pwnb/1wwlkZIawrsq1C84
 bRZmrW/pE7znZMtQlwGR7aKDxnzVrkHuJNcG4rn7b3AZSzM7zn3IH8GZmjAJ2U6s92CG
 gsy7A0JJOdE5a1DbxrbpG25kTgIMQl0btKDMW+I1I/vrJKjQQQVmg3ZLxG3Gxj9iK6Qo
 d89y0pkBX3tcfa9cEJaQvyHT4HrfXklryQ6cf9QoPQV1GtUnpTGtEUKGuFtHESfd1avb
 Tpeg==
X-Gm-Message-State: ACgBeo3FWGsso+Wu8l0KzKNH/AYFXJApcgmRmE/gDviYAG77Z45RvF+A
 rELAHVjDVtAimZQsxxyY024fVxm51KeWgBYC9tmavNx3zQPF0Bg5+sZC5Od077GXKwhmTdLC6wV
 m2gA5EPyb6GoEh+g=
X-Received: by 2002:aa7:d49a:0:b0:43c:fed4:c656 with SMTP id
 b26-20020aa7d49a000000b0043cfed4c656mr20319927edr.312.1660030032685; 
 Tue, 09 Aug 2022 00:27:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7eSoOCRALzC3w1o6g3v+dHAxzj5/gR6VjGq6M0Xb2bSJHP+O4yODLZVD26droQhEtRxPvuVA==
X-Received: by 2002:aa7:d49a:0:b0:43c:fed4:c656 with SMTP id
 b26-20020aa7d49a000000b0043cfed4c656mr20319905edr.312.1660030032428; 
 Tue, 09 Aug 2022 00:27:12 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a170906768300b0072b2ef2757csm764701ejm.180.2022.08.09.00.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:27:11 -0700 (PDT)
Date: Tue, 9 Aug 2022 09:27:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: BB <shentey@gmail.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features
 of PIIX4_PM
Message-ID: <20220809092710.66301168@redhat.com>
In-Reply-To: <E4A796B6-AA0E-4266-8698-E894A51A7807@gmail.com>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
 <20220728151627.119d57d5@redhat.com>
 <769cfc18-9585-5ddf-de46-52aa64328cea@amsat.org>
 <CAG4p6K53y=Oe9vynXgGYTZ9CfHewsDeE3mFDkEb-_us7rgaBcg@mail.gmail.com>
 <20220808141540.317e018e@redhat.com>
 <E4A796B6-AA0E-4266-8698-E894A51A7807@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 08 Aug 2022 19:57:23 +0200
BB <shentey@gmail.com> wrote:

> Am 8. August 2022 14:15:40 MESZ schrieb Igor Mammedov <imammedo@redhat.co=
m>:
> >On Wed, 3 Aug 2022 19:26:30 +0200
> >Bernhard Beschow <shentey@gmail.com> wrote:
> > =20
> >> On Tue, Aug 2, 2022 at 8:37 AM Philippe Mathieu-Daud=C3=A9 via <
> >> qemu-devel@nongnu.org> wrote:
> >>  =20
> >> > On 28/7/22 15:16, Igor Mammedov wrote:   =20
> >> > > On Thu, 28 Jul 2022 13:29:07 +0100
> >> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> >> > >   =20
> >> > >> On Thu, 28 Jul 2022 at 12:50, Igor Mammedov <imammedo@redhat.com>=
   =20
> >> > wrote:   =20
> >> > >>>
> >> > >>> QEMU crashes trying to save VMSTATE when only MIPS target are co=
mpiled   =20
> >> > in   =20
> >> > >>>    $ qemu-system-mips -monitor stdio
> >> > >>>    (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> >> > >>>    Segmentation fault (core dumped)
> >> > >>>
> >> > >>> It happens due to PIIX4_PM trying to parse hotplug vmstate struc=
tures
> >> > >>> which are valid only for x86 and not for MIPS (as it requires AC=
PI
> >> > >>> tables support which is not existent for ithe later)   =20
> >> >
> >> > We already discussed this Frankenstein PIIX4 problem 2 and 4 years a=
go:
> >> >
> >> > https://lore.kernel.org/qemu-devel/4d42697e-ba84-e5af-3a17-a2cc52cf0=
dbc@redhat.com/
> >> >
> >> > https://lore.kernel.org/qemu-devel/20190304210359-mutt-send-email-ms=
t@kernel.org/   =20
> >>=20
> >>=20
> >> Interesting reads!
> >>=20
> >>  =20
> >> > >>> Issue was probably exposed by trying to cleanup/compile out unus=
ed
> >> > >>> ACPI bits from MIPS target (but forgetting about migration bits).
> >> > >>>
> >> > >>> Disable compiled out features using compat properties as the lea=
st
> >> > >>> risky way to deal with issue.   =20
> >> >
> >> > So now MIPS is forced to use meaningless compat[] to satisfy X86.
> >> >
> >> > Am I wrong seeing this as a dirty hack creeping in, yet another
> >> > technical debt that will hit (me...) back in a close future?
> >> >
> >> > Are we sure there are no better solution (probably more time consumi=
ng
> >> > and involving refactors) we could do instead?
> >> >   =20
> >>=20
> >> Working on the consolidation of piix3 and -4 soutbridges [1] I've stum=
bled
> >> over certain design decisions where board/platform specific assumption=
s are
> >> baked into the piix device models. I figure that's the core of the iss=
ue.
> >>=20
> >> In our case the ACPI functionality is implemented by inheritance while
> >> perhaps it should be implemented using composition. With composition, =
the
> >> ACPI functionality could be injected by the caller: The pc board would
> >> inject it while the Malta board wouldn't. This would solve both the cr=
ash
> >> and above design problem. =20
> >
> >While refactoring we should keep migration stream compatible with older
> >QEMU versions (we must not regress widely x86 code path). Which might be
> >tricky in this case. =20
>=20
> Does this particular fix make future compatibility harder or easier or is=
 it that hard already? IIUC it omits the hotplug bits in the vm state for M=
alta which is what one would expect there, right?
>=20
> >Perhaps the best we could do is follow up on Philippe's idea to make
> >PIIX4_PM frankenstein x86-specific (the least chance for regressions)
> >and create/use clean version for anything else. =20
>=20
> Having two implementations of the same device means that we'll end up hav=
ing duplicate code with board/platform-specific assumptions baked in. I gue=
ss what Phil cares about is a sustainable solution without hacks that doesn=
't cause bloat and/or regressions for MIPS, especially for features where M=
IPS doesn't benefit from. I believe that composition could be such a soluti=
on.

maybe creating PIIX4_PM-base without carrying any VMstate code and then
inheriting/branching that into piix4_pm-speced and PIIX4_PM, which will
carry it's own VMstate descriptors (with minimal duplication or somewhat
shared) can be made to work.

> My consolidation work could actually make PIIX4 an option for the PC mach=
ine. This means that PIIX4_PM wouldn't be Frankenstein any more. This works=
 already on my branch - for both PC and Malta. Furthermore, it looks like i=
t allowed Malta to benefit more from KVM virtualization, but that's off-top=
ic in this discussion.
>=20
> >> I'd be willing to implement it but can't make any promises about the t=
ime
> >> frame since I'm currently doing this in my free time. Any hints regard=
ing
> >> the implementation would be welcome, though.
> >>=20
> >> Best regards,
> >> Bernhard
> >>=20
> >> [1] https://github.com/shentok/qemu/commits/piix-consolidate
> >>=20
> >>  =20
> >> > Thanks,
> >> >
> >> > Phil.
> >> >   =20
> >> > >>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>   =20
> >> > >>
> >> > >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/995
> >> > >>   =20
> >> > >>> ---
> >> > >>> PS:
> >> > >>> another approach could be setting defaults to disabled state and
> >> > >>> enabling them using compat props on PC machines (which is more
> >> > >>> code to deal with =3D> more risky) or continue with PIIX4_PM
> >> > >>> refactoring to split x86-shism out (which I'm not really
> >> > >>> interested in due to risk of regressions for not much of
> >> > >>> benefit)
> >> > >>> ---
> >> > >>>   hw/mips/malta.c | 9 +++++++++
> >> > >>>   1 file changed, 9 insertions(+)
> >> > >>>
> >> > >>> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> >> > >>> index 7a0ec513b0..0e932988e0 100644
> >> > >>> --- a/hw/mips/malta.c
> >> > >>> +++ b/hw/mips/malta.c
> >> > >>> @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device =
=3D {
> >> > >>>       .instance_init =3D mips_malta_instance_init,
> >> > >>>   };
> >> > >>>
> >> > >>> +GlobalProperty malta_compat[] =3D {
> >> > >>> +    { "PIIX4_PM", "memory-hotplug-support", "off" },
> >> > >>> +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off"=
 },
> >> > >>> +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
> >> > >>> +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
> >> > >>> +};   =20
> >> > >>
> >> > >> Is there an easy way to assert in hw/acpi/piix4.c that if
> >> > >> CONFIG_ACPI_PCIHP was not set then the board has initialized
> >> > >> all these properties to the don't-use-hotplug state ?
> >> > >> That would be a guard against similar bugs (though I suppose
> >> > >> we probably aren't likely to add new piix4 boards...)   =20
> >> > >
> >> > > unfortunately new features still creep in 'pc' machine
> >> > > ex: "acpi-root-pci-hotplug"), and I don't see an easy
> >> > > way to compile that nor enforce that in the future.
> >> > >
> >> > > Far from easy would be split piix4_pm on base/enhanced
> >> > > classes so we wouldn't need x86 specific hacks in 'base'
> >> > > variant (assuming 'enhanced' could maintain the current
> >> > > VMSTATE to keep cross-version migration working).
> >> > >   =20
> >> > >>> +const size_t malta_compat_len =3D G_N_ELEMENTS(malta_compat);
> >> > >>> +
> >> > >>>   static void mips_malta_machine_init(MachineClass *mc)
> >> > >>>   {
> >> > >>>       mc->desc =3D "MIPS Malta Core LV";
> >> > >>> @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(Machin=
eClass   =20
> >> > *mc)   =20
> >> > >>>       mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("24Kf");
> >> > >>>   #endif
> >> > >>>       mc->default_ram_id =3D "mips_malta.ram";
> >> > >>> +    compat_props_add(mc->compat_props, malta_compat,   =20
> >> > malta_compat_len);   =20
> >> > >>>   }
> >> > >>>
> >> > >>>   DEFINE_MACHINE("malta", mips_malta_machine_init)
> >> > >>> --
> >> > >>> 2.31.1   =20
> >> > >>
> >> > >> thanks
> >> > >> -- PMM
> >> > >>   =20
> >> > >   =20
> >> >
> >> >
> >> >   =20
> > =20
>=20


