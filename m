Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D98F3331C8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 23:57:55 +0100 (CET)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJlIY-0006YX-2o
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 17:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJlH9-00066z-Mm
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:56:27 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:49983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJlH7-00016w-Pz
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:56:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0E2678E35A3C;
 Tue,  9 Mar 2021 23:56:23 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 23:56:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004847b9d16-fa2e-41c1-8fec-119da0d2142e,
 5BB0FC21D60CBA87691D752E0F3295FDC8BC83A3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 9 Mar 2021 23:56:21 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 3/4] vhost-user: Monitor slave channel in vhost_user_read()
Message-ID: <20210309235621.1fac4655@bahia.lan>
In-Reply-To: <YEeR4H8n7SUYVVlW@stefanha-x1.localdomain>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-4-groug@kaod.org>
 <YEeR4H8n7SUYVVlW@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2.xRrPqX8iDwhw_4YEQj5iB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: aff9ba86-006b-4754-96a1-530fbf7d52e1
X-Ovh-Tracer-Id: 18236763744150591907
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgudeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegueejvedvfeeileffieeigfduudfgheevgefhheevjeejuefgjeekieekveejleenucffohhmrghinhepghhnohhmvgdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepmhhsthesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/2.xRrPqX8iDwhw_4YEQj5iB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Mar 2021 15:18:56 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Mon, Mar 08, 2021 at 01:31:40PM +0100, Greg Kurz wrote:
> > @@ -363,8 +367,30 @@ static int vhost_user_read(struct vhost_dev *dev, =
VhostUserMsg *msg)
> >      qemu_chr_be_update_read_handlers(chr->chr, ctxt);
> >      qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb,=
 &data);
> > =20
> > +    if (u->slave_ioc) {
> > +        /*
> > +         * This guarantees that all pending events in the main context
> > +         * for the slave channel are purged. They will be re-detected
> > +         * and processed now by the nested loop.
> > +         */
> > +        g_source_destroy(u->slave_src);
> > +        g_source_unref(u->slave_src);
> > +        u->slave_src =3D NULL;
> > +        slave_src =3D qio_channel_add_watch_source(u->slave_ioc, G_IO_=
IN,
>=20
> Why does slave_ioc use G_IO_IN while chr uses G_IO_IN | G_IO_HUP?

Oops my bad... this is copy&paste of the change introduced in
vhost_setup_slave_channel() by patch 2, which is lacking G_IO_HUP.

It should even actually be G_IO_IN | G_IO_HUP | G_IO_ERR to match
what was done before when calling qemu_set_fd_handler() and which
is recommended by the glib documentation:

https://developer.gnome.org/glib/stable/glib-The-Main-Event-Loop.html#GPoll=
FD

So I'm now wondering why callers of qemu_chr_fe_add_watch() never pass
G_IO_ERR... I'll sort this out for v2.

--Sig_/2.xRrPqX8iDwhw_4YEQj5iB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBH/RUACgkQcdTV5YIv
c9bK+xAArA/eD0bJsXj2dHkdTGlO6eQtrMotGTUWIth/SMgtTLaXDyQwU8O9X78D
N/2MQliUyv+sTZVDs/uGuDQDsl7I4Wnd1V0mlnr2rMapn9Kkr9QCghw00U/jpvl8
XHXxaqoGyVbyKGwyqOH4uj+OaCBoRrvEtYqWFmqxcXBj5lzF1kYj37XKoF++M1iY
cOyS6nvCKKuMFcGolXy8jsrbR34/fOtr2ajmNKBx8ozQjriRkjmI7EsH2cB8UZyy
h038zk2Z+UCc24TgiPZkrpGlpJeURI5EqHNoZV6p9NIT313uyyzlQfGO1zfGGMMc
UeHMUrpVJZmeiofbf0xnJZrKIv45YEVmjVEpiVT1xUllCNHt2fjpr7WrG0iLmXMt
t7wb+p3y7ThDWQAwni8aJYOscEumRPa8eaWNFKKVn6KyVQpZ/09qbv1C6UFfvyRk
tOAh3cFTu4LNdCZ06mYwmVXRqEPyc1fBe4fgSEvHowiWcx5zzs/rrbOdNelGbe3X
/yJH9L57N8o3Uwjss7GaBkDLn6LZUZgKWiulIBKqFJmmZv7jlgfuf5TRhS6F+wX0
xLczCTwfCEyp0CM8dEWJG2ByzpPt/yi+SdFTa9R3Ob2YXsl7+67xfGXYaAMmqAph
EpFIAxyt1sXo7dr9Crkd3iPE4RCY6ix7kUOmKpBVcrPdrlaKDmY=
=N6Ag
-----END PGP SIGNATURE-----

--Sig_/2.xRrPqX8iDwhw_4YEQj5iB--

