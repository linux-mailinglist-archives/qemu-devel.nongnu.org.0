Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC91509E01
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:49:36 +0200 (CEST)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUNT-0007Yg-Qj
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhTz2-00073b-BL
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:24:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhTz0-000142-Tw
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650536658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ABSSVlO3VE6wiSBguGbUxWx0H0QiXYIDKYm9jqsjDNQ=;
 b=JJelfaa0bl0h10O6qzuWJ0BQbC9GpYdFvxrm17ZrrAmaoXIgTqk2aRe613hbTeSKxUZq/f
 JFkD4xGHjkpq5R7GCkSI2xMaNIrbQK7JUqQodjvllkHkW1Mzy+C8SdLbgi4SA71Cg8NDRH
 p8dF3CIWoeb7wM9tbwWrOqwiOa5EZZM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-930zb0t-MQaV9I64It19JQ-1; Thu, 21 Apr 2022 06:24:14 -0400
X-MC-Unique: 930zb0t-MQaV9I64It19JQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 726A6185A7BA;
 Thu, 21 Apr 2022 10:24:14 +0000 (UTC)
Received: from localhost (unknown [10.39.194.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDBD9415F30;
 Thu, 21 Apr 2022 10:24:13 +0000 (UTC)
Date: Thu, 21 Apr 2022 12:24:12 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 02/26] qcow2: remove incorrect coroutine_fn annotations
Message-ID: <YmEwzOZ36npM1QZJ@stefanha-x1.localdomain>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-3-pbonzini@redhat.com>
 <20220419180643.hhzredj3qfazd4a3@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="flaXSq0jbSuNMcGl"
Content-Disposition: inline
In-Reply-To: <20220419180643.hhzredj3qfazd4a3@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, hreitz@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--flaXSq0jbSuNMcGl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 01:07:19PM -0500, Eric Blake wrote:
> On Fri, Apr 15, 2022 at 03:18:36PM +0200, Paolo Bonzini wrote:
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
>=20
> Again, a sentence on why this is correct would be helpful.
>=20
> >  block/qcow2-refcount.c | 4 ++--
> >  block/qcow2.h          | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> > index b91499410c..b6f90b2702 100644
> > --- a/block/qcow2-refcount.c
> > +++ b/block/qcow2-refcount.c
> > @@ -1206,7 +1206,7 @@ void qcow2_free_any_cluster(BlockDriverState *bs,=
 uint64_t l2_entry,
> >      }
> >  }
> > =20
> > -int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
> > +int qcow2_write_caches(BlockDriverState *bs)
> >  {
> >      BDRVQcow2State *s =3D bs->opaque;
> >      int ret;
> > @@ -1226,7 +1226,7 @@ int coroutine_fn qcow2_write_caches(BlockDriverSt=
ate *bs)
> >      return 0;
> >  }
> > =20
> > -int coroutine_fn qcow2_flush_caches(BlockDriverState *bs)
> > +int qcow2_flush_caches(BlockDriverState *bs)
> >  {
> >      int ret =3D qcow2_write_caches(bs);
>=20
> Both of these eventually hit qcow2_cache_write, which is not marked
> coroutine, so these should not be either.

coroutine_fn may call non-coroutine_fn, so this alone is not a reason
for removing it from qcow2_write_caches().

There must be a call chain where qcow2_write_caches() and
qcow2_flush_caches() are is invoked from outside coroutine_fn.

Stefan

--flaXSq0jbSuNMcGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJhMMwACgkQnKSrs4Gr
c8i+bwgAqnG1r/vOEVI4wjDIh3p1FAuUGqOu5LqINhuuO9BZKsznSgqeiZ8qyl88
BQGmvYNbwJ25e4mVGgYQxkxwvcNpOQyWr7MTIcZaVP+bXXaJUe7ynaPZK4MBSgTh
GagTQEz2vpoA61Auzxl/NjiRY1r/E+sKVpynfR9IkL9izl6zQioAzJ+FFnY57g+s
u+b9R73aiEj20Xu9hQ9y3TZnzZJVSw8n/4KaDcO+omWzqePp1aXu58Y81OViyg2y
2bRQ4H1BmGwoqyzBq0mxrjnLiyRJLSNMb8QAbplXA5XtOIIH7BcJeT7gHqDkOg+J
3Z+XtpQXD2KNFx435vubRoHyGGdDoA==
=kjV5
-----END PGP SIGNATURE-----

--flaXSq0jbSuNMcGl--


