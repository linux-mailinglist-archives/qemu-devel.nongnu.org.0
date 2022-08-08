Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1058C842
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:20:08 +0200 (CEST)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1jr-0000wF-Q9
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oL1fi-0004xV-Sy
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:15:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oL1ff-00038O-6q
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659960945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwFyEO0BuNMHziApr4oMenYuP+ZcTV4ExMVA3AFwpdU=;
 b=V3IJCM9Or5vaB0NAaVy9D3idwRTioSP+eBx0uTo6PQWMRVY5eS228JGKZ7ipFuKxWr/QDo
 h7Ptnuy2HiVHjbv8+2X9QASRjiLE13y0soGp5rwBtf5n+9440t8cslFOkqBRPgRQGyp98y
 lNjJpgk4L/IzI6ADi9PPPFXVCfwcwNw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-hDndoL4LPk6bb7uNJvaDvg-1; Mon, 08 Aug 2022 08:15:44 -0400
X-MC-Unique: hDndoL4LPk6bb7uNJvaDvg-1
Received: by mail-ed1-f72.google.com with SMTP id
 b6-20020a056402278600b0043e686058feso5540550ede.10
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 05:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=ZwFyEO0BuNMHziApr4oMenYuP+ZcTV4ExMVA3AFwpdU=;
 b=u2WkIBM1mYmqW1j3qVgB8oEJ9Ud8VDNl+XU1IfJszxu3X6MYIOfE38kS0/PkdryPrS
 FgWjuNQxJRu5obP4R8P1vv2WhIY/cRjjb//crSCvkgGJ1RopLOhrgSfkovfS2RSQCNkc
 bkDQFX4csxOvMAvghcnOpsSunmgzrEFe4NQxWLM/0PTYPqGVBB9U6RcRXxIpTout15v+
 P3pbVvP3kgmX8xkys/PhHh7rmzy7hz/cXBTU/TXIsNMP4zbU1BltrbKsm6NAOPMOzyEw
 SDaEmKdHT4jPG/IkljG2E3zb+sAIiI2mNfO1cWFdG86V7dbdw1Hq2rolDmmdBegDNP4W
 aIdw==
X-Gm-Message-State: ACgBeo3uIyO5xg728WZ8407hvGAR0XdL5GKSXCjF7pZS4qxC+FRedw8O
 SI3yaKaEfnJFgC3ra+YAuDo131Js5V/smynumDFnyDG4Xps8i6DpUdlBTlZwCnKzOtU9A5v5F+V
 7u5fqKzXYjvbBzpw=
X-Received: by 2002:a17:907:9809:b0:72f:817:d433 with SMTP id
 ji9-20020a170907980900b0072f0817d433mr13882805ejc.483.1659960942899; 
 Mon, 08 Aug 2022 05:15:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5hH25WFvbCAuPkduKBAV4pjvwhGXYT45oTL854N198fFnubmtsVr6H9eSJenkJxRzcwxtHtg==
X-Received: by 2002:a17:907:9809:b0:72f:817:d433 with SMTP id
 ji9-20020a170907980900b0072f0817d433mr13882787ejc.483.1659960942608; 
 Mon, 08 Aug 2022 05:15:42 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906218200b00731582a6717sm1561313eju.98.2022.08.08.05.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 05:15:41 -0700 (PDT)
Date: Mon, 8 Aug 2022 14:15:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features
 of PIIX4_PM
Message-ID: <20220808141540.317e018e@redhat.com>
In-Reply-To: <CAG4p6K53y=Oe9vynXgGYTZ9CfHewsDeE3mFDkEb-_us7rgaBcg@mail.gmail.com>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
 <20220728151627.119d57d5@redhat.com>
 <769cfc18-9585-5ddf-de46-52aa64328cea@amsat.org>
 <CAG4p6K53y=Oe9vynXgGYTZ9CfHewsDeE3mFDkEb-_us7rgaBcg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, 3 Aug 2022 19:26:30 +0200
Bernhard Beschow <shentey@gmail.com> wrote:

> On Tue, Aug 2, 2022 at 8:37 AM Philippe Mathieu-Daud=C3=A9 via <
> qemu-devel@nongnu.org> wrote:
>=20
> > On 28/7/22 15:16, Igor Mammedov wrote: =20
> > > On Thu, 28 Jul 2022 13:29:07 +0100
> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> > > =20
> > >> On Thu, 28 Jul 2022 at 12:50, Igor Mammedov <imammedo@redhat.com> =20
> > wrote: =20
> > >>>
> > >>> QEMU crashes trying to save VMSTATE when only MIPS target are compi=
led =20
> > in =20
> > >>>    $ qemu-system-mips -monitor stdio
> > >>>    (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> > >>>    Segmentation fault (core dumped)
> > >>>
> > >>> It happens due to PIIX4_PM trying to parse hotplug vmstate structur=
es
> > >>> which are valid only for x86 and not for MIPS (as it requires ACPI
> > >>> tables support which is not existent for ithe later) =20
> >
> > We already discussed this Frankenstein PIIX4 problem 2 and 4 years ago:
> >
> > https://lore.kernel.org/qemu-devel/4d42697e-ba84-e5af-3a17-a2cc52cf0dbc=
@redhat.com/
> >
> > https://lore.kernel.org/qemu-devel/20190304210359-mutt-send-email-mst@k=
ernel.org/ =20
>=20
>=20
> Interesting reads!
>=20
>=20
> > >>> Issue was probably exposed by trying to cleanup/compile out unused
> > >>> ACPI bits from MIPS target (but forgetting about migration bits).
> > >>>
> > >>> Disable compiled out features using compat properties as the least
> > >>> risky way to deal with issue. =20
> >
> > So now MIPS is forced to use meaningless compat[] to satisfy X86.
> >
> > Am I wrong seeing this as a dirty hack creeping in, yet another
> > technical debt that will hit (me...) back in a close future?
> >
> > Are we sure there are no better solution (probably more time consuming
> > and involving refactors) we could do instead?
> > =20
>=20
> Working on the consolidation of piix3 and -4 soutbridges [1] I've stumbled
> over certain design decisions where board/platform specific assumptions a=
re
> baked into the piix device models. I figure that's the core of the issue.
>=20
> In our case the ACPI functionality is implemented by inheritance while
> perhaps it should be implemented using composition. With composition, the
> ACPI functionality could be injected by the caller: The pc board would
> inject it while the Malta board wouldn't. This would solve both the crash
> and above design problem.

While refactoring we should keep migration stream compatible with older
QEMU versions (we must not regress widely x86 code path). Which might be
tricky in this case.

Perhaps the best we could do is follow up on Philippe's idea to make
PIIX4_PM frankenstein x86-specific (the least chance for regressions)
and create/use clean version for anything else.

> I'd be willing to implement it but can't make any promises about the time
> frame since I'm currently doing this in my free time. Any hints regarding
> the implementation would be welcome, though.
>=20
> Best regards,
> Bernhard
>=20
> [1] https://github.com/shentok/qemu/commits/piix-consolidate
>=20
>=20
> > Thanks,
> >
> > Phil.
> > =20
> > >>> Signed-off-by: Igor Mammedov <imammedo@redhat.com> =20
> > >>
> > >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/995
> > >> =20
> > >>> ---
> > >>> PS:
> > >>> another approach could be setting defaults to disabled state and
> > >>> enabling them using compat props on PC machines (which is more
> > >>> code to deal with =3D> more risky) or continue with PIIX4_PM
> > >>> refactoring to split x86-shism out (which I'm not really
> > >>> interested in due to risk of regressions for not much of
> > >>> benefit)
> > >>> ---
> > >>>   hw/mips/malta.c | 9 +++++++++
> > >>>   1 file changed, 9 insertions(+)
> > >>>
> > >>> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> > >>> index 7a0ec513b0..0e932988e0 100644
> > >>> --- a/hw/mips/malta.c
> > >>> +++ b/hw/mips/malta.c
> > >>> @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device =3D {
> > >>>       .instance_init =3D mips_malta_instance_init,
> > >>>   };
> > >>>
> > >>> +GlobalProperty malta_compat[] =3D {
> > >>> +    { "PIIX4_PM", "memory-hotplug-support", "off" },
> > >>> +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
> > >>> +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
> > >>> +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
> > >>> +}; =20
> > >>
> > >> Is there an easy way to assert in hw/acpi/piix4.c that if
> > >> CONFIG_ACPI_PCIHP was not set then the board has initialized
> > >> all these properties to the don't-use-hotplug state ?
> > >> That would be a guard against similar bugs (though I suppose
> > >> we probably aren't likely to add new piix4 boards...) =20
> > >
> > > unfortunately new features still creep in 'pc' machine
> > > ex: "acpi-root-pci-hotplug"), and I don't see an easy
> > > way to compile that nor enforce that in the future.
> > >
> > > Far from easy would be split piix4_pm on base/enhanced
> > > classes so we wouldn't need x86 specific hacks in 'base'
> > > variant (assuming 'enhanced' could maintain the current
> > > VMSTATE to keep cross-version migration working).
> > > =20
> > >>> +const size_t malta_compat_len =3D G_N_ELEMENTS(malta_compat);
> > >>> +
> > >>>   static void mips_malta_machine_init(MachineClass *mc)
> > >>>   {
> > >>>       mc->desc =3D "MIPS Malta Core LV";
> > >>> @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineCl=
ass =20
> > *mc) =20
> > >>>       mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("24Kf");
> > >>>   #endif
> > >>>       mc->default_ram_id =3D "mips_malta.ram";
> > >>> +    compat_props_add(mc->compat_props, malta_compat, =20
> > malta_compat_len); =20
> > >>>   }
> > >>>
> > >>>   DEFINE_MACHINE("malta", mips_malta_machine_init)
> > >>> --
> > >>> 2.31.1 =20
> > >>
> > >> thanks
> > >> -- PMM
> > >> =20
> > > =20
> >
> >
> > =20


