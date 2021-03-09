Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC9C332F4A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:49:00 +0100 (CET)
Received: from localhost ([::1]:33150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiLj-0007pe-6t
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJhD4-0008Lx-Hq
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:35:59 -0500
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:48515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJhD2-0004bC-61
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:35:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 561D124762A;
 Tue,  9 Mar 2021 19:35:44 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 19:35:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00108c9f55c-deb4-4a90-9ee5-eef682ffcb3f,
 5BB0FC21D60CBA87691D752E0F3295FDC8BC83A3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 9 Mar 2021 19:35:42 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 1/4] vhost-user: Introduce nested event loop in
 vhost_user_read()
Message-ID: <20210309193542.1d64eeec@bahia.lan>
In-Reply-To: <YEeOGE7x7QJNITxd@stefanha-x1.localdomain>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-2-groug@kaod.org>
 <YEeOGE7x7QJNITxd@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U+7xs.LKyp5GYvToy1MyD.A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 53d5104a-8a84-49c7-8f87-91f957dae23f
X-Ovh-Tracer-Id: 13835058055920064931
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelgffgfeeugedugeekveeiveevjeffhfduvdegffetkeeiveeufefgledtgfeiteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehmshhtsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=groug@kaod.org;
 helo=8.mo52.mail-out.ovh.net
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/U+7xs.LKyp5GYvToy1MyD.A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Mar 2021 15:02:48 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Mon, Mar 08, 2021 at 01:31:38PM +0100, Greg Kurz wrote:
> > A deadlock condition potentially exists if a vhost-user process needs
> > to request something to QEMU on the slave channel while processing a
> > vhost-user message.
> >=20
> > This doesn't seem to affect any vhost-user implementation so far, but
> > this is currently biting the upcoming enablement of DAX with virtio-fs.
> > The issue is being observed when the guest does an emergency reboot whi=
le
> > a mapping still exits in the DAX window, which is very easy to get with
> > a busy enough workload (e.g. as simulated by blogbench [1]) :
> >=20
> > - QEMU sends VHOST_USER_GET_VRING_BASE to virtiofsd.
> >=20
> > - In order to complete the request, virtiofsd then asks QEMU to remove
> >   the mapping on the slave channel.
> >=20
> > All these dialogs are synchronous, hence the deadlock.
> >=20
> > As pointed out by Stefan Hajnoczi:
> >=20
> > When QEMU's vhost-user master implementation sends a vhost-user protocol
> > message, vhost_user_read() does a "blocking" read during which slave_fd
> > is not monitored by QEMU.
> >=20
> > As a preliminary step to address this, split vhost_user_read() into a
> > nested even loop and a one-shot callback that does the actual reading.
>=20
> In case you respin:
> s/even/event/
>=20

Fixed.

> > +static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
> > +{
> > +    struct vhost_user *u =3D dev->opaque;
> > +    CharBackend *chr =3D u->user->chr;
> > +    GMainContext *prev_ctxt =3D chr->chr->gcontext;
> > +    GMainContext *ctxt =3D g_main_context_new();
> > +    GMainLoop *loop =3D g_main_loop_new(ctxt, FALSE);
> > +    struct vhost_user_read_cb_data data =3D {
> > +        .dev =3D dev,
> > +        .loop =3D loop,
> > +        .msg =3D msg,
> > +        .ret =3D 0
> > +    };
> > +
> > +    /* Switch context and add a new watch to monitor chardev activity =
*/
> > +    qemu_chr_be_update_read_handlers(chr->chr, ctxt);
> > +    qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb,=
 &data);
>=20
> This comment could be expanded to explain why the nested event loop is
> necessary. The goal is to monitor the slave_fd while waiting for chr
> I/O so we'll need an event loop. prev_ctxt cannot be run nested since
> its fd handlers may not be prepared (e.g. re-entrancy).

Ok, will do.

--Sig_/U+7xs.LKyp5GYvToy1MyD.A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBHv/4ACgkQcdTV5YIv
c9aYIA/9Hd0RtBb14oWfMoRvgGxHP7fZcM/b1q2DLxh1+4X9dfa8oTpC96GTyCLa
lASYZPPaJ8clJrBVaKNW7kWre5BX31PdE8KNH84dEcfQ3WFSZVkdy8v0pM7bGbkd
TrQn7flPYE1cB70MFqjgZ83kzwr5N72zvITuOfnW/NO86qb/J8PWD1YErWiFhaQb
sukxF5TPCXkKRwn3Jc7br6v9/QkaMhE2KS6N/5FkTnSbTPeo5wNtiQDfdaP8MIKS
n1aHjMHSofKcuqImKmzVN+QbBHZ1PXotQ9hLHDhhzhY9Gy1fM+D81A3GK1eEewnZ
G9QxI9uxMPgFpMhRKe8UGgp45vuxpwgL51+3RhLkLXduEQH8WlRvlHbk4XCok8rp
jToutKKMfHI2CgtEqaiHHwgy2Hewa8z2c66bZzZyT7ayXHtOOr2Vi/jFtVhrCYxF
BawF8qT228VVX83JkBTtzgQlbXPzkEVORuQ6u9wlumKaH+cGe+K0ZsvJlX7talpr
qKOnBfJ4vkJlSS4LeJ138kdEmdHbY12TcTbybVRoHMu7GeGKKr874venJj2RoQPT
4e6IOjS1dO1tycrkp2B0OqIx/pH7+9fsNlkj/FTOK8CyjASFPJen1COlUpD7igmj
Dbki72e+zQ+HdZhut7xJeiURNG7UkK6tfos/XE1Okk2yhTqj4ww=
=EouX
-----END PGP SIGNATURE-----

--Sig_/U+7xs.LKyp5GYvToy1MyD.A--

