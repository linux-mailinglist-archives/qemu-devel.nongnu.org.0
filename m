Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B076533DB5F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:48:27 +0100 (CET)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDnu-0002F3-J6
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMDQK-0007Yn-Vl
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:24:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMDQI-0002cd-Jk
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1cML5ZXwvytO1LQoo0OeT4jrxWnsFgoTc9r/2N+ydWQ=;
 b=Czw47eR5oLhykNueCH6ApmpE5qFgmK7N+Td/kbIRlMg+3acqPbZyjJucZbmZ/78WZY+FKd
 11yfPrnZKOJMLkicw3OLe3QmaV4SbsBPKlKdAQ1Agwd9b3doIf4Za1QsQjJAxSQLKIZLYw
 N5ENlfYlNjfwFhqhFE/MZfYcWm3I+7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-kNMgB7_lNVqhIZDancNgZA-1; Tue, 16 Mar 2021 13:23:59 -0400
X-MC-Unique: kNMgB7_lNVqhIZDancNgZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7276DDF8A0;
 Tue, 16 Mar 2021 17:23:58 +0000 (UTC)
Received: from localhost (ovpn-115-62.ams2.redhat.com [10.36.115.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 145B319D61;
 Tue, 16 Mar 2021 17:23:57 +0000 (UTC)
Date: Tue, 16 Mar 2021 17:23:57 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 8/8] tools/virtiofsd: Replacing malloc-like calls with
 GLib's variants
Message-ID: <YFDprYgY8Mu6MtSy@stefanha-x1.localdomain>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-9-ma.mandourr@gmail.com>
 <YE8wZ7WWdtqIW/kt@stefanha-x1.localdomain>
 <CAD-LL6gzDC5KcN3BNa-xULywRLmWFSTHyWCM-5851EY0Pum04g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD-LL6gzDC5KcN3BNa-xULywRLmWFSTHyWCM-5851EY0Pum04g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0U6xtpIhgNkwft12"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0U6xtpIhgNkwft12
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:29PM +0200, Mahmoud Mandour wrote:
> On Mon, Mar 15, 2021 at 12:01 PM Stefan Hajnoczi <stefanha@redhat.com>
> wrote:
>=20
> > On Sun, Mar 14, 2021 at 05:23:24AM +0200, Mahmoud Mandour wrote:
> > > @@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct
> > fuse_session *se)
> > >  {
> > >      struct fuse_req *req;
> > >
> > > -    req =3D (struct fuse_req *)calloc(1, sizeof(struct fuse_req));
> > > +    req =3D g_try_new(struct fuse_req, 1);
> >
> > g_try_new0() since the original call was calloc(3)?
> >
> > > @@ -411,7 +411,7 @@ static int lo_map_grow(struct lo_map *map, size_t
> > new_nelems)
> > >          return 1;
> > >      }
> > >
> > > -    new_elems =3D realloc(map->elems, sizeof(map->elems[0]) * new_ne=
lems);
> > > +    new_elems =3D g_realloc_n(map->elems, new_nelems,
> > sizeof(map->elems[0]));
> >
> > g_try_realloc_n() since failure is handled below?
> >
> > Stefan
> >
>=20
> Hello Mr. Stefan,
>=20
> You're correct. I'm really sorry for such small and strangely obvious
> errors.
> If the patch is going to be ACKed, will you edit those problems or shall =
I
> fix them and
> resend the patch again alone?

Hi,
Don't worry, it happens to everyone! Please resend.

Stefan

--0U6xtpIhgNkwft12
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBQ6awACgkQnKSrs4Gr
c8hOZggAj+rFNhxgY9m6eRBoJkNSONqB+2XaAzOyZ3Lbk+DS2uoomBa0RN95WQPN
d4fbfpdtj3nIj3BQwF1cs8LNNFGj8GS+O1ct4a09heVXlnjK/TxN35y2P7ltLUBK
IBlhjVk+EzJfqdSmzisae0UVLQGeyPimdpwu9GdwnKb84kdrPC+8R3vHcNm4vpzB
GffFTGdk2dsnAHh1nfWAVKgy8lkU0bUjAKwQo8UCu4Fpy2v813AM/JdXOkLhwHvY
rgwsdbf1ErZpf8JSreoRs9uV6X6ZoM3ErtIvRjzIdceBSBdC/KrS2xloGqejTSYC
OO2INEVFUBtkUMyZbyuXrMQCHxVLmQ==
=haNP
-----END PGP SIGNATURE-----

--0U6xtpIhgNkwft12--


