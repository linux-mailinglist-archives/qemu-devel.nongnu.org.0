Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133532D55FB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:01:12 +0100 (CET)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knHp1-0000xz-2Z
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:01:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1knHie-00068X-7B
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:54:36 -0500
Received: from 3.mo52.mail-out.ovh.net ([178.33.254.192]:45906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1knHic-0006kB-BP
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:54:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.53])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id A543C220298;
 Thu, 10 Dec 2020 09:54:30 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Dec
 2020 09:54:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0064de7f0a3-a0c8-4984-8449-abf2adaba063,
 7F90A86A4359BCD1ACB0618936AE64BD6AD86209) smtp.auth=groug@kaod.org
Date: Thu, 10 Dec 2020 09:54:28 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/6] spapr: Add an "spapr" property to sPAPR CPU core
Message-ID: <20201210095428.5996f0ba@bahia.lan>
In-Reply-To: <20201210035302.GM2555@yekko.fritz.box>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-2-groug@kaod.org>
 <de3d6170-3e28-ce78-41a3-59eca3cb6b67@redhat.com>
 <20201209184225.1b544523@bahia.lan>
 <d0f7cde7-c550-4a6c-8730-c3422002516c@redhat.com>
 <b8474a48-5dcd-343e-ef29-531c628b2ff2@redhat.com>
 <20201209182617.GV1289986@habkost.net>
 <20201210035302.GM2555@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ycvz4_kT4uHW/.D+aLtkc8Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: cbd052d3-0421-4113-9c68-4c85481e137a
X-Ovh-Tracer-Id: 16304438028702882211
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejledguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhfffgjeelfeeggffgteehfedtvefhhedtgeegheffudetudduuefgvdelleeuteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=groug@kaod.org;
 helo=3.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-ppc@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1E?= =?UTF-8?B?YXVkw6k=?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/ycvz4_kT4uHW/.D+aLtkc8Q
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Dec 2020 14:53:02 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Dec 09, 2020 at 01:26:17PM -0500, Eduardo Habkost wrote:
> > On Wed, Dec 09, 2020 at 07:11:40PM +0100, Philippe Mathieu-Daud=C3=A9 w=
rote:
> > [...]
> > > >>>> @@ -200,7 +199,7 @@ static void spapr_cpu_core_reset(DeviceState=
 *dev)
> > > >>>>      int i;
> > > >>>> =20
> > > >>>>      for (i =3D 0; i < cc->nr_threads; i++) {
> > > >>>> -        spapr_reset_vcpu(sc->threads[i]);
> > > >>>> +        spapr_reset_vcpu(sc->threads[i], sc->spapr);
> > > >>>
> > > >>> Why reset() needs access to the machine state, don't
> > > >>> you have it in realize()?
> > > >>>
> > > >>
> > > >> This is for the vCPU threads of the sPAPR CPU core. They don't hav=
e the
> > > >> link to the machine state.
> > > >=20
> > > > They are created by spapr_create_vcpu() + spapr_realize_vcpu() in
> > > > spapr_cpu_core_realize(), which has sc->spapr set... Am I missing
> > > > something?
> > >=20
> > > Anyhow, from a QOM design point of view, resetfn() is not the correct
> > > place to set a property IMHO, so Cc'ing Eduardo.
> >=20
> > This patch is not setting the property on resetfn(), it is
> > setting it on CPU core pre_plug().
>=20
> Well, also machine reset, but the point is it's not the resetfn() of
> the cpu.
>=20
> Basically what this is doing is machine specific (rather than just cpu
> specific) initialization of the cpu state - we need that because the
> pseries machine is implementing an explicitly paravirtualized platform
> which starts things off in a state a bit different from the "raw" cpu
> behaviour.
>=20
> So, although it's working on a CPU's state, this function actually
> belongs to the machine, rather than the cpu.
>=20
> > This is more complex than simply using qdev_get_machine() and I
> > don't see why it would be better, but I don't think it's wrong.
>=20
> But, yeah, this...
>=20
> I've applied some of the later patches in this series, but I'm not
> convinced on this one or 2/6.  It seems like they're just replacing
> one ugly (access to qdev_machine_state() as a global) with a different
> ugly (duplicating something which has to equal the global machine
> pointer as properties in a bunch of other objects).
>=20
> Both 1/6 and 2/6 are altering explicitly spapr specific devices, they
> have interactions with the overall platform model which mean they have
> to sit in that environment, so I think trying to add a property here
> implies an abstraction that can't actually be used in practice.
>=20

Eduardo and you convinced me that 1/6 and 2/6 might not be an
improvement in the end, but rather making things more complex
than simply calling qdev_get_machine() when needed.

--Sig_/ycvz4_kT4uHW/.D+aLtkc8Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl/R4kQACgkQcdTV5YIv
c9YaqxAApUYxq2Awkl4paalG30k3PavdFlHSV3v09K0X5i9xjOaK9DoYRFyWyH2Q
ogNoMra2119GP1LqqhYQ+fSSGPn/SBEujPR3aHsxSnhTojAy2ad1MLH6yLhfdPZ7
FDZePx4G6xIGC6saKSuU5lmiMvA1St44j6Z4alfJkHlQC3hBAVfu1nBn//jyX2Pv
wGj9SPoOss6sbyRIj6QeESscxjW2uJhaAKAcOPZqg215VnkcQ8AF9zBhb+90jhCn
bDWCpq0q4EF/FXiWOhxItVMFG2tpbhXFxg2CfBtMSspiLBAaY3HzxtlI8kdo526k
UyBjmaHWsZwk5yK4mfyL4sqynAamHx0GWsdZ51Qv1btrhwhut2QMPs7iI1qJo/aW
1AdS0BaCGbR0HVY+OQtUNT5gYxa3Tu8MUBd1aXruBo0dX5+g0WMDvXMz96eERP3T
izylhKBorWZSKl4mkMjNnne/5lLDtnZp5gINak6XX5+6+emCYDF5d8ZDFN3TPjIM
MJK6eZn3U3cV+pMMGypQrS6MAC7rC1okih9elWhLZm9zH85PWjGTRPfAZbZydmlb
n7LSTvEXLOYYt/4X0cUNS5aZoZswxa74ZPvtqlCkZyEZy7WjMCCaaC+WHDii79IF
LVyvlzuy0KVndg7kwNYzTQnmClGsztRbxH2JGSD9/HumTe5r76E=
=xkjD
-----END PGP SIGNATURE-----

--Sig_/ycvz4_kT4uHW/.D+aLtkc8Q--

