Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164412C26F7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:18:07 +0100 (CET)
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYCr-0002CH-Jn
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khY2h-0005QB-Gt
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:07:35 -0500
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:57956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khY2f-0001t5-NP
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:07:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.235])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 1E247207930;
 Tue, 24 Nov 2020 14:07:29 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 24 Nov
 2020 14:07:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003cf61c50c-5a08-4d09-98fb-a43e37276135,
 886B3C846F729F79F342FB8F3892F62368E4F687) smtp.auth=groug@kaod.org
Date: Tue, 24 Nov 2020 14:07:27 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-6.0 5/9] spapr: Simplify error path of
 spapr_core_plug()
Message-ID: <20201124140727.18124eeb@bahia.lan>
In-Reply-To: <20201123051318.GM521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-6-groug@kaod.org>
 <20201123051318.GM521467@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/icC9x4JeX40aijVN6L5g1z1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c0daafa7-5f65-453e-aa4e-76d89aeffcc5
X-Ovh-Tracer-Id: 401101844220254688
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedggeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfffgfejleefgefggfetheeftdevhfehtdeggeehffduteduudeugfdvleelueetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehimhgrmhhmvgguohesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=178.33.43.201; envelope-from=groug@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/icC9x4JeX40aijVN6L5g1z1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2020 16:13:18 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Sat, Nov 21, 2020 at 12:42:04AM +0100, Greg Kurz wrote:
> > spapr_core_pre_plug() already guarantees that the slot for the given co=
re
> > ID is available. It is thus safe to assume that spapr_find_cpu_slot()
> > returns a slot during plug. Turn the error path into an assertion.
> > It is also safe to assume that no device is attached to the correspondi=
ng
> > DRC and that spapr_drc_attach() shouldn't fail.
> >=20
> > Pass &error_abort to spapr_drc_attach() and simplify error handling.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
>=20
> Applied to ppc-for-6.0, thanks.
>=20

This patch depends on the previous one.

> > ---
> >  hw/ppc/spapr.c | 21 ++++++++++-----------
> >  1 file changed, 10 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index da7586f548df..cfca033c7b14 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -3739,8 +3739,7 @@ int spapr_core_dt_populate(SpaprDrc *drc, SpaprMa=
chineState *spapr,
> >      return 0;
> >  }
> > =20
> > -static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *=
dev,
> > -                            Error **errp)

../../hw/ppc/spapr.c: In function =E2=80=98spapr_core_plug=E2=80=99:
../../hw/ppc/spapr.c:3802:32: error: =E2=80=98errp=E2=80=99 undeclared (fir=
st use in this function); did you mean =E2=80=98errno=E2=80=99?
                                errp) < 0) {
                                ^~~~
                                errno
../../hw/ppc/spapr.c:3802:32: note: each undeclared identifier is reported =
only once for each function it appears in

Please either drop it from ppc-for-6.0 or possibly adapt spapr_core_plug()
to handle errors from ppc_set_compat().

<my 2 cents>
Since I can't see how this could fail for a hotplugged CPU if it
succeeded for the boot CPU, I'd pass &error_abort despite this
being a hotplug path.
</my 2 cents>

> > +static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *=
dev)
> >  {
> >      SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
> >      MachineClass *mc =3D MACHINE_GET_CLASS(spapr);
> > @@ -3755,20 +3754,20 @@ static void spapr_core_plug(HotplugHandler *hot=
plug_dev, DeviceState *dev,
> >      int i;
> > =20
> >      core_slot =3D spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_i=
d, &index);
> > -    if (!core_slot) {
> > -        error_setg(errp, "Unable to find CPU core with core-id: %d",
> > -                   cc->core_id);
> > -        return;
> > -    }
> > +    g_assert(core_slot); /* Already checked in spapr_core_pre_plug() */
> > +
> >      drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_CPU,
> >                            spapr_vcpu_id(spapr, cc->core_id));
> > =20
> >      g_assert(drc || !mc->has_hotpluggable_cpus);
> > =20
> >      if (drc) {
> > -        if (!spapr_drc_attach(drc, dev, errp)) {
> > -            return;
> > -        }
> > +        /*
> > +         * spapr_core_pre_plug() already buys us this is a brand new
> > +         * core being plugged into a free slot. Nothing should already
> > +         * be attached to the corresponding DRC.
> > +         */
> > +        spapr_drc_attach(drc, dev, &error_abort);
> > =20
> >          if (hotplugged) {
> >              /*
> > @@ -3981,7 +3980,7 @@ static void spapr_machine_device_plug(HotplugHand=
ler *hotplug_dev,
> >      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> >          spapr_memory_plug(hotplug_dev, dev);
> >      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
> > -        spapr_core_plug(hotplug_dev, dev, errp);
> > +        spapr_core_plug(hotplug_dev, dev);
> >      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BR=
IDGE)) {
> >          spapr_phb_plug(hotplug_dev, dev, errp);
> >      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY))=
 {
>=20


--Sig_/icC9x4JeX40aijVN6L5g1z1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl+9BY8ACgkQcdTV5YIv
c9Z4FRAAvdUn/yGetl6P8mNopXPQGvLuuPuD/V79BAZPFWPlF7hWbmAb7MLibuTL
ng3nRc8pHELQYnxD9spFqQ7gQC8k3CXXpG6e93PYiIuQNcHJFrU4Ji17HAzHm6TN
qSDiv0ZuXVQmNYqmCy3MeECvdkeZE+ASAFxnQWEO1lPjHCafBsITYM1AIoOta3zy
UqTbhWnUoqVzQZ4Mn/3fkdggk37ziFSH2Uj1N7jInxd1eO55hyjUTCAnyyyH/TEY
9mY+C7YhMwuU+fdd393m/llfCajr6UN25g5ULj3Ub2kcW/rZHAw+FCswi0GGU+Ul
+USoPAbgK2dvDrodxenC2e4X8DEoEnye+uY7sWLZbHWCzj0VSLuA/4CI6Ny7ILcD
nvADi65hbfjX8QiZYksqsswp4MizEoY4/PYU7z6QOaDpuJipseAZaP7EwG02GkRR
3zUFE9nbUwHKETJORIjNF4NXiql6J6gtUPiJBUG3zV89/Rl5PQpR8JoMsL8UB0Ko
r/Nthkbsw/dG7WtWpJhpk6oD+8pHyHDtmTwgX0yblL8poZRA04OAUWxYgDg//5zu
++mjXSnUChwzp+1bwKZqBJeOh6M/UUmZnndk6WEysVS4a59wBPPV2KMai3ecXr3B
yDM8PgFQcu/6eCW7c/wz/w1NM1IiK2NrwwoxzDcPvcnk4hD3N6s=
=2umT
-----END PGP SIGNATURE-----

--Sig_/icC9x4JeX40aijVN6L5g1z1--

