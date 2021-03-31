Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9DF350469
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:23:47 +0200 (CEST)
Received: from localhost ([::1]:58978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRddC-0002KB-3h
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lRdb0-0000v7-28
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:21:31 -0400
Received: from 3.mo52.mail-out.ovh.net ([178.33.254.192]:60327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lRdar-0004r8-HR
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:21:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.102])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id C6F1E256309;
 Wed, 31 Mar 2021 18:21:15 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 31 Mar
 2021 18:21:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002f026a236-8a11-4168-ad20-2c2e546a71b6,
 9D8442807461E38AC8E896D56D3346AE12FD8989) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 31 Mar 2021 18:21:13 +0200
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 3/8] virtio: Add API to batch set host notifiers
Message-ID: <20210331182113.580c8854@bahia.lan>
In-Reply-To: <YGSLkVHI/JzevSLl@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-4-groug@kaod.org>
 <YGIKIUIJbkNTfXKC@stefanha-x1.localdomain>
 <20210330121740.73825957@bahia.lan>
 <YGMt3t3WNVxUDMnE@stefanha-x1.localdomain>
 <20210330161732.1ee55325@bahia.lan>
 <YGSLkVHI/JzevSLl@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0zwqZMoP7+j3YaExi0LOHE8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: e81b56b6-4d30-457e-b30f-49ab071d4f88
X-Ovh-Tracer-Id: 11635894065222293807
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeivddguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelgffgfeeugedugeekveeiveevjeffhfduvdegffetkeeiveeufefgledtgfeiteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.254.192; envelope-from=groug@kaod.org;
 helo=3.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/0zwqZMoP7+j3YaExi0LOHE8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 31 Mar 2021 15:47:45 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Tue, Mar 30, 2021 at 04:17:32PM +0200, Greg Kurz wrote:
> > On Tue, 30 Mar 2021 14:55:42 +0100
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > > On Tue, Mar 30, 2021 at 12:17:40PM +0200, Greg Kurz wrote:
> > > > On Mon, 29 Mar 2021 18:10:57 +0100
> > > > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > > > On Thu, Mar 25, 2021 at 04:07:30PM +0100, Greg Kurz wrote:
> > > > > > @@ -315,6 +338,10 @@ static void virtio_bus_unset_and_cleanup_h=
ost_notifiers(VirtioBusState *bus,
> > > > > > =20
> > > > > >      for (i =3D 0; i < nvqs; i++) {
> > > > > >          virtio_bus_set_host_notifier(bus, i + n_offset, false);
> > > > > > +    }
> > > > > > +    /* Let address_space_update_ioeventfds() run before closin=
g ioeventfds */
> > > > >=20
> > > > > assert(memory_region_transaction_depth =3D=3D 0)?
> > > > >=20
> > > >=20
> > > > Hmm... appart from the fact that memory_region_transaction_depth is
> > > > a memory internal thing that shouldn't be exposed here, it seems to
> > > > me that memory_region_transaction_depth can be !=3D 0 when, e.g. wh=
en
> > > > batching is used... or I'm missing something ?
> > > >=20
> > > > I was actually thinking of adding some asserts for that in the
> > > > memory_region_*_eventfd_full() functions introduced by patch 1.
> > > >=20
> > > >     if (!transaction) {
> > > >         memory_region_transaction_begin();
> > > >     }
> > > >     assert(memory_region_transaction_depth !=3D 0);
> > >=20
> > > In that case is it safe to call virtio_bus_cleanup_host_notifier()
> > > below? I thought it depends on the transaction committing first.
> > >=20
> >=20
> > Yes because the transaction ends...
> >=20
> > > >=20
> > > > > > +    virtio_bus_set_host_notifier_commit(bus);
> > ...                here ^^
> >=20
> > > > > > +    for (i =3D 0; i < nvqs; i++) {
> > > > > >          virtio_bus_cleanup_host_notifier(bus, i + n_offset);
> > > > > >      }
> > > > > >  }
>=20
> That contradicts what you said above: "it seems to me that
> memory_region_transaction_depth can be !=3D 0 when, e.g. when batching is
> used".
>=20
> If memory_region_transaction_depth can be !=3D 0 when this function is
> entered then memory_region_transaction_commit() will have no effect:
>=20
>   void memory_region_transaction_commit(void)
>   {
>       AddressSpace *as;
>=20
>       assert(memory_region_transaction_depth);
>       assert(qemu_mutex_iothread_locked());
>=20
>       --memory_region_transaction_depth;
>       if (!memory_region_transaction_depth) {

memory_region_transaction_depth should be equal to 1 when
entering the function, not 0... which is the case when
batching.

>           ^--- we won't take this branch!
>=20
> So the code after memory_region_transaction_commit() cannot assume that
> anything was actually committed.
>=20

Right and nothing in the current code base seems to prevent
memory_region_*_eventfd() to be called within an ongoing
transaction actually. It looks that we might want to fix that
first.

> That's why I asked about adding assert(memory_region_transaction_depth
> =3D=3D 0) to guarantee that our commit takes effect immediately so that i=
t's
> safe to call virtio_bus_cleanup_host_notifier().
>=20

Yes, it was just misplaced and I didn't get the intent at first :)

> Stefan


--Sig_/0zwqZMoP7+j3YaExi0LOHE8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBkoXkACgkQcdTV5YIv
c9bHqQ//Xi0ATAHU5QcxxAusI1PaVhF2LtEXE+p1JAUqhKi9bzXZ5Nqj5MWIdaau
pgQbd3KrPdKX5+gsE/UMHy/C8kCg0Gu2/ZLZq6opxmn1CSwZrh88EC4XyWfzMlqg
tArJjOn2vezBUAYl06naNi3MigL80uW72P3o1+YdcAGtn8wHQs+Xpf1VyVLfc1sv
ZWG6yswepcm+Xozogol0MR3pt7XHcZ6qeB+XAQy+LAU0cK9oIPb+IVoSKGaZXgzE
sS2lwKAL0trtzZQTBQaqiFAoc0DXUeFqA03djwXDI1RzdcNfHRMjVLqB6l+zg29r
dQGBncBsu2s84STc5qF7mZ9Yu/bu/P/DF5anA5uLraBRKIYOsr/HscdeRwwivcKw
Gy4n4eQC0FQXxPtbUAoikWO6s/nym6c2eSPiAKu0/WLYgBk1J0Fckt6tZ2y3uh2W
bMFSqSMo7VDQ+ueyM3zn5M43T7XhjkYQ5ILwP0OucEb3dwVd9nyhCKMSrIrqMKHI
7sfo/Kimgfw8boFHnWgtXTowfiOxKvWi2Ji6U1dhGwHpCUORn2S9sL74ScsdLSe5
fGFjjSyyvP3Ys17qio8emxaSkNZs8MuXeTP21j4u9iuRoXyduRpXVN5BadzFIenr
mDQ1hki+nZapj1U3cy+p5IVAdAXkQ8CFb7oUZfuHEb7hmvyArJI=
=Cmns
-----END PGP SIGNATURE-----

--Sig_/0zwqZMoP7+j3YaExi0LOHE8--

