Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CA834EA29
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:20:53 +0200 (CEST)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFEi-0006qx-Ei
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lRFBf-0004zE-Jx; Tue, 30 Mar 2021 10:17:43 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lRFBd-0001A1-87; Tue, 30 Mar 2021 10:17:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.179])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 93E3C95EEBC3;
 Tue, 30 Mar 2021 16:17:35 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 30 Mar
 2021 16:17:34 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0041b1e4aae-72e2-49cc-bd54-0830ee67f4fe,
 ACC3036D4A0BACA70991A0E48D5F19CB1CCAE693) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 30 Mar 2021 16:17:32 +0200
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 3/8] virtio: Add API to batch set host notifiers
Message-ID: <20210330161732.1ee55325@bahia.lan>
In-Reply-To: <YGMt3t3WNVxUDMnE@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-4-groug@kaod.org>
 <YGIKIUIJbkNTfXKC@stefanha-x1.localdomain>
 <20210330121740.73825957@bahia.lan>
 <YGMt3t3WNVxUDMnE@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/daE9IVCkIjG_P2OJoQiwr/b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: f24fb89b-a36b-41f4-80ce-5606413c4fc3
X-Ovh-Tracer-Id: 3674655824941521199
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/daE9IVCkIjG_P2OJoQiwr/b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Mar 2021 14:55:42 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Tue, Mar 30, 2021 at 12:17:40PM +0200, Greg Kurz wrote:
> > On Mon, 29 Mar 2021 18:10:57 +0100
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > On Thu, Mar 25, 2021 at 04:07:30PM +0100, Greg Kurz wrote:
> > > > @@ -315,6 +338,10 @@ static void virtio_bus_unset_and_cleanup_host_=
notifiers(VirtioBusState *bus,
> > > > =20
> > > >      for (i =3D 0; i < nvqs; i++) {
> > > >          virtio_bus_set_host_notifier(bus, i + n_offset, false);
> > > > +    }
> > > > +    /* Let address_space_update_ioeventfds() run before closing io=
eventfds */
> > >=20
> > > assert(memory_region_transaction_depth =3D=3D 0)?
> > >=20
> >=20
> > Hmm... appart from the fact that memory_region_transaction_depth is
> > a memory internal thing that shouldn't be exposed here, it seems to
> > me that memory_region_transaction_depth can be !=3D 0 when, e.g. when
> > batching is used... or I'm missing something ?
> >=20
> > I was actually thinking of adding some asserts for that in the
> > memory_region_*_eventfd_full() functions introduced by patch 1.
> >=20
> >     if (!transaction) {
> >         memory_region_transaction_begin();
> >     }
> >     assert(memory_region_transaction_depth !=3D 0);
>=20
> In that case is it safe to call virtio_bus_cleanup_host_notifier()
> below? I thought it depends on the transaction committing first.
>=20

Yes because the transaction ends...

> >=20
> > > > +    virtio_bus_set_host_notifier_commit(bus);
...                here ^^

> > > > +    for (i =3D 0; i < nvqs; i++) {
> > > >          virtio_bus_cleanup_host_notifier(bus, i + n_offset);
> > > >      }
> > > >  }


--Sig_/daE9IVCkIjG_P2OJoQiwr/b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBjMvwACgkQcdTV5YIv
c9YFGBAAyD3nvnm9h35HOvfAaBIOLW2M9P9tK1azMJaN7JmXaFUOijMj7b29myOZ
Bh+yYshKVBFok9DDRF4zSU4G94ram5DnfcZk4U3ruuy4BUL4+RtiCJmoeC7nPkxI
NAYkMyvz64JEOAxeVS/n3QhJnNbgKBpj7mEsqowf2JH+WclTVkmMj6fbGSBNP4Z3
zlkAn6bTruqwabE8tL2MHxhlVSAfz4oRwPBq6RDrkSveA6+oEpOqzxaYIOVpIisD
Ty3VSU633FWB5e5BQD1Aa0MOHjVFKKKGERh2jDatnFxkVQtfqxlpA3kVogsWusNk
Cudyxzg+SgaIPLRPWXUC6fbsECMo1a2cRjyYhM3Kt7mVyJCwQJYJx8Cxn6WGjqEB
jIKvFa1kma1MxkFu+wYIh9SIP8qh3KelUKyH3jFx2+Cdy9pez312FbVjyZMRwx2S
Mrx8HT3dCTK6+y/30mr7Y5SAghZWFteQnwfFLXnJn1HwhD1N60vYUzHeq2bbJdX/
Axm5eO1Y1oKVWS0B+7/mcpWgACQbJMATwwR4QWoYBIR1I9GgVWtyCKDh2qBIlQ7x
5h/Vu+KQXuc6gsZCbYa/ONnJP1pBZ2Edl6lQ4F33PBoVTIYYIxO2n6dV7gbPfFj9
KWAOpQL/xoCLtvrwEhAgLvy9Sslg/sjc5c1MTbTavkKLuo7hNVU=
=TS3X
-----END PGP SIGNATURE-----

--Sig_/daE9IVCkIjG_P2OJoQiwr/b--

