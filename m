Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA1428BD4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 13:16:18 +0200 (CEST)
Received: from localhost ([::1]:39172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZtI0-0005f3-Uz
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 07:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZtEN-00029r-Gh
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZtEL-0000XJ-L5
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633950748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7PUZTn5hboyFe3usEPaWmJbEF5/hC0t1dRgeNEuHC2Q=;
 b=Ks4rljj8o9VQzrpkt+tSODqoqvP1ifsGfajd8Fl4CqVp4NOIAd2HALrju2XjTIrXeq8cA8
 HOiPSu4PdV8qdgOLZhu5CQDhzmGQt7v+7wdGOCS6VXTKpFdMwzvr8dowpN9Icgo4EcLXM9
 ArJyOb0Th1akyQPPcJBpWje0Ya6/TiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-_fWCqruzMQqfIIzoEw02Hg-1; Mon, 11 Oct 2021 07:12:25 -0400
X-MC-Unique: _fWCqruzMQqfIIzoEw02Hg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D11B801AA7;
 Mon, 11 Oct 2021 11:12:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBD7810190CA;
 Mon, 11 Oct 2021 11:12:14 +0000 (UTC)
Date: Mon, 11 Oct 2021 12:12:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 24/25] job.h: split function pointers in JobDriver
Message-ID: <YWQcDSBWlseLLd3q@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-25-eesposit@redhat.com>
 <YV8KMVycKfU/Zr6r@stefanha-x1.localdomain>
 <25d0ba31-6a97-7595-ed32-b712bfaf29e0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <25d0ba31-6a97-7595-ed32-b712bfaf29e0@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7/DMxlQL1fDCaf6j"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7/DMxlQL1fDCaf6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 08, 2021 at 12:48:26PM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> On 07/10/2021 16:54, Stefan Hajnoczi wrote:
> > On Tue, Oct 05, 2021 at 10:32:14AM -0400, Emanuele Giuseppe Esposito wr=
ote:
> > > The job API will be handled separately in another serie.
> > >=20
> > > Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > > ---
> > >   include/qemu/job.h | 31 +++++++++++++++++++++++++++++++
> > >   1 file changed, 31 insertions(+)
> > >=20
> > > diff --git a/include/qemu/job.h b/include/qemu/job.h
> > > index 41162ed494..c236c43026 100644
> > > --- a/include/qemu/job.h
> > > +++ b/include/qemu/job.h
> > > @@ -169,12 +169,21 @@ typedef struct Job {
> > >    * Callbacks and other information about a Job driver.
> > >    */
> > >   struct JobDriver {
> > > +
> > > +    /* Fields initialized in struct definition and never changed. */
> > > +
> > >       /** Derived Job struct size */
> > >       size_t instance_size;
> > >       /** Enum describing the operation */
> > >       JobType job_type;
> > > +    /*
> > > +     * I/O API functions. These functions are thread-safe, and there=
fore
> > > +     * can run in any thread as long as they have called
> > > +     * aio_context_acquire/release().
> > > +     */
> >=20
> > This comment described the block layer well but job.h is more generic. =
I
> > don't think these functions are necessarily thread-safe (they shouldn't
> > be invoked from multiple threads at the same time). It's just that they
> > are run without regard to the BQL and may run in an arbitrary thread.
>=20
> Ok, in this instance I will change it to:
>=20
> /*
>  * Functions run without regard to the BQL and may run in any
>  * arbitrary thread.
>  */

It's not clear from that comment whether the functions need to be
thread-safe (re-entrancy safe) or not. I think the answer is "no" since
the caller ensures they are called from one thread at a time.

Stefan

--7/DMxlQL1fDCaf6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFkHA0ACgkQnKSrs4Gr
c8iBOwf+J7+1P0oLi2VrmfoY570n5aHDatfoRJfVJmMtNQXkiRtceaUElywj17yv
e9/oqymFML2LWAEGr9e5ix2ceV4NBG/Jh3oIQYtX9p5xVnwxZo84lYtcou1Zoqi7
NED+F3Bf4xfcnB1RO6eoZrwOl8SJEq15+fnpwv+BknSlfitR6rma8aDfgxYZU1EN
AegsXFyslGw2b0Yrlx7DnVip+5+xdNNWa7oLl+wSrAUYOdR6V3EE4wTY7qYAh+Bh
N463s3I67pmxpWLK+1jo3Ochg/+aMUbC7oYu2V1tyRwN0/2ttY9hj0u5d+ZXfMrq
QqbwXv8Q/nY7qoBmPtckJ1BYsaUK+A==
=Q2/y
-----END PGP SIGNATURE-----

--7/DMxlQL1fDCaf6j--


