Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E00330DE49
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:37:24 +0100 (CET)
Received: from localhost ([::1]:60290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KDb-0002jV-9b
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7KCB-00024F-2a
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:35:55 -0500
Received: from 5.mo52.mail-out.ovh.net ([188.165.45.220]:57739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7KC9-0008IV-3w
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:35:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id A9E2323CF92;
 Wed,  3 Feb 2021 16:35:49 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Feb 2021
 16:35:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00471591eb9-1802-49d1-9f51-1fec12b65bc4,
 14764A637080470E006017DF0F40374BD57DCD59) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 3 Feb 2021 16:35:42 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtiofsd: vu_dispatch locking should never fail
Message-ID: <20210203163542.7ee6ed68@bahia.lan>
In-Reply-To: <20210203145723.GF74271@stefanha-x1.localdomain>
References: <20210129155312.595980-1-groug@kaod.org>
 <20210203145723.GF74271@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0HusfHrR//NUI7AGm.2esoP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 9971d9f6-e8e6-42e8-bf1e-67d5fb1d6895
X-Ovh-Tracer-Id: 14039127415367965152
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrgedvgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelgffgfeeugedugeekveeiveevjeffhfduvdegffetkeeiveeufefgledtgfeiteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepughgihhlsggvrhhtsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=188.165.45.220; envelope-from=groug@kaod.org;
 helo=5.mo52.mail-out.ovh.net
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
Cc: qemu-devel@nongnu.org, Vivek Goyal <vgoyal@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/0HusfHrR//NUI7AGm.2esoP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Feb 2021 14:57:23 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Fri, Jan 29, 2021 at 04:53:12PM +0100, Greg Kurz wrote:
> > pthread_rwlock_rdlock() and pthread_rwlock_wrlock() can fail if a
> > deadlock condition is detected or the current thread already owns
> > the lock. They can also fail, like pthread_rwlock_unlock(), if the
> > mutex wasn't properly initialized. None of these are ever expected
> > to happen with fv_VuDev::vu_dispatch_rwlock.
> >=20
> > Some users already check the return value and assert, some others
> > don't. Introduce rdlock/wrlock/unlock wrappers that just do the
> > former and use them everywhere.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
>=20
> What is the purpose of this commit:
> 1. Code cleanup/consistency?
> 2. Helps debug an issue that doesn't occur in production but you hit
>    during development?
> 3. Needed to diagnose a real-world issue? How do you reproduce it?
>=20
> I wanted to check to make sure I'm not missing an issue you found with
> production workloads.
>=20

I would have provided more details if that came from an actual issue,
but you're definitely right to ask : this falls more under 1.

> > @@ -645,8 +662,7 @@ static void *fv_queue_thread(void *opaque)
> >              break;
> >          }
> >          /* Mutual exclusion with virtio_loop() */
> > -        ret =3D pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwl=
ock);
> > -        assert(ret =3D=3D 0); /* there is no possible error case */
> > +        vu_dispatch_wrlock(qi->virtio_dev);
>=20
> s/vu_dispatch_wrlock/vu_dispatch_rdlock/ ?

Oops... definitely...

--Sig_/0HusfHrR//NUI7AGm.2esoP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmAaws4ACgkQcdTV5YIv
c9bmaQ//VLqPJO18eOHPrsuwaO0V4CcrXTAEOj2CIS/JvCGkRlVXJGcsOwW29igs
tK3QVKxVSrHLgKlLTTcTaVO25vDmW/XLwHbyPf8zbB2e1854ojsEGuR5Dyiyi7R8
w75pNYaX54Yne0ipl4hUAso4xWX4NuRFo+mpbzvXnH91k/+MJsF+btuOZGNWMO6Q
HUijCrUfJkhGrf4niQWx+f6GCMqVpjyjsQ9wQiI1Pk2cVRhzxuVzACFXhkkaAU2B
RLMz0kXgylTJTMx5ZA5u6BZJ+OU/TB8T/icGlHMUqCZoVVSChFVVuNdnvf3oNnUL
gaIhdtnJ4Wu7qyf8TwohG9/48ZnaVmD7SbghrE+9ci4FKXuV2xRBnM7vPWrGgzfr
7I7rd2C0hVm76km7tYwCBrPwt39tgU8tQj/TZ0TnAj9le24LUsXUE9S62D2FuKrK
5riS5k46+ytoGV8/Kytnq0TLOLhs6lnvEjoxcoEDiRRiwomT5IIor1wUZvFPmWuA
uoz2p4WcWFzkHddX+rIyTuv8QCX9/PSYisJdWxNB7NbUk7+DK4/BgSaPnJEKEKe+
Mqyrw1kPFzgqZTsYQS3eLXOL21T6RfAjnjmYGYK/3MxIusKcafMlZe3M7HIrMeE1
GWNY28FTKPdKwPxdU6UadZQb/hJcfxOxJPWKvOhgkl07sS91K4I=
=OzVG
-----END PGP SIGNATURE-----

--Sig_/0HusfHrR//NUI7AGm.2esoP--

