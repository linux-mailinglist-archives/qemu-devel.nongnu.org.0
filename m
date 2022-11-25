Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DB3638B81
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:46:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZ1h-0002rc-PR; Fri, 25 Nov 2022 08:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1oyZ1X-0002qQ-Mj; Fri, 25 Nov 2022 08:45:55 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1oyZ1V-0001jO-91; Fri, 25 Nov 2022 08:45:47 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.244])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 150F9143DD0F1;
 Fri, 25 Nov 2022 14:45:41 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 25 Nov
 2022 14:45:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003a074c58c-85b5-468b-a274-ae8798b31618,
 A118ED2DA2C78367863551B1AF5232D1EC2EEEED) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 25 Nov 2022 14:45:39 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
CC: Peter Maydell <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, "Gerd
 Hoffmann" <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Daniel
 Henrique Barboza" <danielhb413@gmail.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-ppc@nongnu.org>
Subject: Re: [PATCH for-8.0 5/7] hw/intc/xics: Reset TYPE_ICS objects with
 device_cold_reset()
Message-ID: <20221125144539.4106a542@bahia>
In-Reply-To: <61ea8b5c-a8ae-1fc9-a54a-6a95c8b914fc@kaod.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-6-peter.maydell@linaro.org>
 <61ea8b5c-a8ae-1fc9-a54a-6a95c8b914fc@kaod.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 1f57f5ba-4bc3-43ef-b432-2126ebc9cb38
X-Ovh-Tracer-Id: 14340587114783086956
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuueeijedtleeluedthfetjeffieetffeuvefffeeftedvieefueejgfdugeetueenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhkrhgrgigvlhesrhgvughhrghtrdgtohhmpdhmshhtsehrvgguhhgrthdrtghomhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdgtlhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtph
 houhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=groug@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Fri, 25 Nov 2022 13:24:00 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/25/22 12:52, Peter Maydell wrote:
> > The realize method for the TYPE_ICS class uses qemu_register_reset()
> > to register a reset handler, as a workaround for the fact that
> > currently objects which directly inherit from TYPE_DEVICE don't get
> > automatically reset.  However, the reset function directly calls
> > ics_reset(), which is the function that implements the legacy reset
> > method.  This means that only the parent class's data gets reset, and
> > a subclass which also needs to handle reset, like TYPE_PHB3_MSI, has
> > to register its own reset function.
> >=20
> > Make the TYPE_ICS reset function call device_cold_reset() instead:
> > this will handle reset for both the parent class and the subclass,
> > and will work whether the classes are using legacy reset or 3-phase
> > reset. This allows us to remove the reset function that the subclass
> > currently has to set up.
>=20
> Nice !
>=20

Seconded.

Reviewed-by: Greg Kurz <groug@kaod.org>

> >=20
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Thanks,
>=20
> C.
>=20
> > ---
> >   hw/intc/xics.c             | 2 +-
> >   hw/pci-host/pnv_phb3_msi.c | 7 -------
> >   2 files changed, 1 insertion(+), 8 deletions(-)
> >=20
> > diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> > index dcd021af668..dd130467ccc 100644
> > --- a/hw/intc/xics.c
> > +++ b/hw/intc/xics.c
> > @@ -593,7 +593,7 @@ static void ics_reset(DeviceState *dev)
> >  =20
> >   static void ics_reset_handler(void *dev)
> >   {
> > -    ics_reset(dev);
> > +    device_cold_reset(dev);
> >   }
> >  =20
> >   static void ics_realize(DeviceState *dev, Error **errp)
> > diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
> > index 2f4112907b8..ae908fd9e41 100644
> > --- a/hw/pci-host/pnv_phb3_msi.c
> > +++ b/hw/pci-host/pnv_phb3_msi.c
> > @@ -239,11 +239,6 @@ static void phb3_msi_reset(DeviceState *dev)
> >       msi->rba_sum =3D 0;
> >   }
> >  =20
> > -static void phb3_msi_reset_handler(void *dev)
> > -{
> > -    phb3_msi_reset(dev);
> > -}
> > -
> >   void pnv_phb3_msi_update_config(Phb3MsiState *msi, uint32_t base,
> >                                   uint32_t count)
> >   {
> > @@ -272,8 +267,6 @@ static void phb3_msi_realize(DeviceState *dev, Erro=
r **errp)
> >       }
> >  =20
> >       msi->qirqs =3D qemu_allocate_irqs(phb3_msi_set_irq, msi, ics->nr_=
irqs);
> > -
> > -    qemu_register_reset(phb3_msi_reset_handler, dev);
> >   }
> >  =20
> >   static void phb3_msi_instance_init(Object *obj)
>=20


