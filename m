Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0447F38A044
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:54:26 +0200 (CEST)
Received: from localhost ([::1]:60974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeRl-0004sL-41
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lje9Q-0001iM-PY
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:35:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lje9J-0000Wu-4F
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621499718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uFdvgWVCMzRrcOD8JNV33rQs3WZBWBNz3v6eB6eonGo=;
 b=GapfsjrMtFf999pa7Jk/eA5+wOj5SuhoaSPK13z2LTiGRuTnrglWR2NC8Mo+Q3N3ohfeaF
 DxnvFOlORWTtC2BiFgyO5B9mIwpK2LbCzQZR8zpAdOd9gxgtIv9oXwzKxmkWVowHjAAMTK
 hgZBOw9tyOq8wb7sr+Tphpbifr6qVHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-k0cQ9rm0NbuCN5t7_iDxLg-1; Thu, 20 May 2021 04:35:17 -0400
X-MC-Unique: k0cQ9rm0NbuCN5t7_iDxLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9396786ABD2;
 Thu, 20 May 2021 08:35:15 +0000 (UTC)
Received: from localhost (ovpn-113-245.ams2.redhat.com [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE1C65DDAD;
 Thu, 20 May 2021 08:35:05 +0000 (UTC)
Date: Thu, 20 May 2021 09:35:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [RFC PATCH 02/11] hw/ide: Add PCIIDEState::isa_bus link
Message-ID: <YKYfOMUvCnQTcQtZ@stefanha-x1.localdomain>
References: <20210518215545.1793947-1-philmd@redhat.com>
 <20210518215545.1793947-3-philmd@redhat.com>
 <f571a63d-d6a2-2085-740-bcc59b3424e5@eik.bme.hu>
 <3ba44704-6418-4aee-23ad-7d4dcc1fe60d@redhat.com>
 <babbf5da-b4c0-9736-b09-426e3a358587@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <babbf5da-b4c0-9736-b09-426e3a358587@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1OdjQrt7LH924zFl"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--1OdjQrt7LH924zFl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 02:46:47AM +0200, BALATON Zoltan wrote:
> On Wed, 19 May 2021, John Snow wrote:
> > On 5/18/21 7:05 PM, BALATON Zoltan wrote:
> > > On Tue, 18 May 2021, Philippe Mathieu-Daud=E9 wrote:
> > > > IDE bus depends on ISA bus for IRQ/DMA.
> > > >=20
> > > > Add an ISABus reference in PCIIDEState, and add link properties
> > > > to it in the PIIX and VIA objects (which inherit PCI_IDE).
> > > >=20
> > > > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > > ---
> > > > include/hw/ide/pci.h |=A0 1 +
> > > > hw/ide/piix.c=A0=A0=A0=A0=A0=A0=A0 | 11 ++++++++++-
> > > > hw/ide/via.c=A0=A0=A0=A0=A0=A0=A0=A0 | 10 +++++++++-
> > > > 3 files changed, 20 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> > > > index d8384e1c422..e790722ed14 100644
> > > > --- a/include/hw/ide/pci.h
> > > > +++ b/include/hw/ide/pci.h
> > > > @@ -47,6 +47,7 @@ struct PCIIDEState {
> > > > =A0=A0=A0 PCIDevice parent_obj;
> > > > =A0=A0=A0 /*< public >*/
> > > >=20
> > > > +=A0=A0=A0 ISABus *isa_bus;
> > >=20
> > > I'm not sure that this belongs here. Previously we managed to remove
> > > device specific fields from this structure so it's now really just
> > > holds stuff related to PCI IDE (except the remaining "secondary"
> > > field specific to CMD646). PCI IDE normaly has nothing to do with
> > > ISA except for those south bridges that have IDE with legacy mode.
> > > So this ISABus reference should be in those south bridges instead.
> > > But that may need a
> >=20
> > by "those south bridges" I assume you are referring to the integrated
> > PIIX and VIA controller implementations.
>=20
> Yes, those are that also have an ISA bridge so the IDE in those can use
> either ISA or PCI IRQs but we probably only emulate one mode. At least
> that's the case for via-ide which we have gone into great detail before a=
nd
> concluded we can't cleanly switch between legacy ISA or PCI mode and the
> pegasos2 needs hard coded ISA interrupts even when in PCI mode so we only
> emulate that.
>=20
> Apart from that this PCI IDE is also used by CMD646 and sii3112 that are
> pure PCI IDE devices without any ISA dependency so that's why I think we
> should not need this ISABus here to keep this implementing PCI IDE and on=
ly
> keep ISA in the south bridge models.
>=20
> > > new subclass just for this so putting it here is just avoiding
> > > boilerplate of declaring new subclasses in piix and via-ide. I can
> > > sympathise with that but I'd still prefer to keep it off here but I
> > > wonder if there's a way to do that without subclassing and storing
> > > an ISABus ref? If I understand correctly this ISABus ref is just
> > > needed to get appropriate ISA irqs. But could we just store a ref to
> > > those irqs
> >=20
> > It looks like it's just the IRQs, yeah.
> >=20
> > > directly so we don't need to keep the ref to the ISA bus? There's
> >=20
> > I think the idea actually is to formalize the dependency of these model=
s
> > on the ISA bus instead of hacking / faking one. I think we DO want the
> > dependency.
>=20
> Right, but only piix and via depend on ISA so the dependency should be in
> those not in PCI IDE in my opinion. But I don't mind too much so if it wo=
uld
> be too difficult to put it elsewhere I don't mind introducing this ISABus
> field but we should at least look if it could be avoided first.
>=20
> > > already a qemu_irq in BMDMAState but I'm not sure how those are set
> > > and if you could store an isa irq there to simplify this. I don't
> > > know the details and could not detangle it by a brief look so not
> > > sure it can be done but conceptually it feels better to keep PCI IDE
> > > separate from ISA and let it raise either PCI irq or ISA irq as
> > > needed. For that a ref to the irq should be enough and that can
> > > either come from a PCI bus (which is normaly expected for PCI IDE)
> > > or an ISA bridge for legacy modes. Hope it makes sense and you get
> > > what I'm trying to say. (Longer term we may want to make it
> > > changeable also after the device is created to allow switching
> > > between legacy and PCI mode but so far we could get away without
> > > emulating that so it's not a requirement just something to consider
> > > when you're changing this. The real problem that prevents switching
> > > modes is not irq I think but ioports and that ISA devices are not
> > > configurable after creating them but that would need QOM'ifying ISA
> > > emulation which probably does not worth the effort unless we come
> > > across some guest that needs this.)
> > >=20
> > > Regards,
> > > BALATON Zoltan
> > >=20
> >=20
> > I assume the idea here is that PCIIDE does not technically need "ISA" t=
o
> > provide ioport access to the ATA drives, so taxonomically it's odd for
> > the generic/abstract PCIIDE device to require an ISA bus.
> >=20
> > Am I understanding correctly?
>=20
> I'm not sure I understand all of the IDE emulation but in my view PCI IDE
> should be independent of ISA so instead of adding a reference to an ISA b=
us
> to PCIIDEState maybe it's enough to set the irqs used by PCI IDE to the
> appropriate irq to raise which could be an ISA interrupt for the south
> bridges in legacy mode or a PCI irq for PCI cards and that way we don't n=
eed
> a dependency on ISABus in PCI IDE. But I'm not sure how IDE interrupts ar=
e
> set so don't know if that would work so it's just an idea to avoid
> introducing ISA into PCI IDE where it does not seem to belong.
>=20
> A simpler way keeping the current code may be to subclass PCI IDE in piix
> and via and put the ISABus ref in those subclasses but that's more boiler
> plate and the result may not be simpler so while conceptually may be clea=
ner
> the code may be longer and harder to understand that way. So cleaning up =
the
> interrupt handling could make it simpler and also avoid the subclasses bu=
t
> that needs more work to detangle how IDE interrupts are emulated and add
> some clean way to set them if that's not yet available. But I don't
> completely understand what the qemu_irqs are in BMDMAState and if those
> could be connected to an ISA interrupt or some more changes would be need=
ed.

I realized I don't really understand how ISA IDE and PCI IDE interact in
PIIX3:

- ISA IDE has well-known PIO registers that are always present?

- PCI IDE has the same registers, but the BAR must be mapped and PCI IO
  space access must be enabled?

- ISA IDE has a hardcoded ISA irq number?

- PCI IDE has a normal PCI irq that is routed like any legacy PCI INTx
  irq?

- What combinations of ISA enabled/disabled and PCI enabled/disabled
  need to be supported?

Stefan

--1OdjQrt7LH924zFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCmHzgACgkQnKSrs4Gr
c8hFzggAw3+7BQtkoL6tbhKtPK2ECfffT1pxIA4UVYl05XHaR4VimoVH/i7d6pQU
aW7Q2b1D2C7Y71G3Qy0ilz13sYOV4LcshOM4MHcW5nhV6WLU+9xLMrOKSF8e3mi4
OeuopSk5EkbyB5mskD94pYuQWp/k9uQiGaM087DUcGO0583GNzCMEh0ZOY4SSGa4
o09H3t8jzxfVHRolfuB1Dj8VXyyMnkJb5jj2+N1ubUM2YPqsezjtlYuYz+l5C7BD
Oig+jhSZyDX6Xcjn55dvCgevPubwn68Q5g6UM8gCzdPM78N8VNwwwLCj+KxrGpSk
VYrbyIeZF4CBfehrDPADen5gek9UTw==
=qL78
-----END PGP SIGNATURE-----

--1OdjQrt7LH924zFl--


