Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2505213A2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 13:23:57 +0200 (CEST)
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noNy8-0004lb-Ea
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 07:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noNvq-0003P3-Sb
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:21:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noNvp-0004Je-1k
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652181692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CzimICNixUywf1riMtukqDIbnFveuswDqCIbka0CSGk=;
 b=JMkbM/ZlxWkqSYXXBMpR0C4MEhTlgIvIdw1AA4vVw7gK3TIClWQIXujXA6nfppa8YoZJY0
 eglnsUSbeEFBAawccb6zyo5LWrVxcrGruMSIS8crA7vzCkB5T+i+5+jMZYXYYmgCbxX24+
 6omlCH6z9NmyiByiy5B9EXApaHLKXl0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-4_jAbt2nNumNpT70WdXG-w-1; Tue, 10 May 2022 07:21:31 -0400
X-MC-Unique: 4_jAbt2nNumNpT70WdXG-w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF9A2866DF4
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 11:21:30 +0000 (UTC)
Received: from localhost (unknown [10.40.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67193438BE9;
 Tue, 10 May 2022 11:21:30 +0000 (UTC)
Date: Tue, 10 May 2022 13:21:29 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 2/8] qapi: golang: Generate qapi's alternate types
 in Go
Message-ID: <20220510112129.befwqkqtkdhyah5h@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <20220401224104.145961-3-victortoso@redhat.com>
 <Yno6Jb1Y9GmgD5wr@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bt3keowquelf6fyq"
Content-Disposition: inline
In-Reply-To: <Yno6Jb1Y9GmgD5wr@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bt3keowquelf6fyq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 10, 2022 at 11:10:45AM +0100, Daniel P. Berrang=E9 wrote:
> On Sat, Apr 02, 2022 at 12:40:58AM +0200, Victor Toso wrote:
> > This patch handles QAPI alternate types and generates data
> > structures in Go that handles it.
> >=20
> > At this moment, there are 5 alternates in qemu/qapi, they are:
> >  * BlockDirtyBitmapMergeSource
> >  * Qcow2OverlapChecks
> >  * BlockdevRef
> >  * BlockdevRefOrNull
> >  * StrOrNull
> >=20
> > Alternate types are similar to Union but without a
> > discriminator that can be used to identify the underlying
> > value on the wire. It is needed to infer it. That can't be
> > easily mapped in Go.
>=20
> I don't buy that. Given this example:
>=20
>   type BlockdevRef struct {
>         // Options are:
>         // * definition (BlockdevOptions): defines a new block device inl=
ine
>         // * reference (string): references the ID of an existing block d=
evice
>         Value Any
>   }
>=20
> What is the problem with having this Go struct:
>=20
>   type BlockdevRef struct {
>         Definition *BlockdevOptions
> 	      Reference  *string
>   }

=2E.. this is better.

> when deserializing from JSON, we know exactly which one of
> these two fields to populate. The programmer consuming this can
> look at which field is non-nil.
>=20
> When serializing to JSON, we serialize which ever field is
> non-nil.
>=20
> If both fields are non-nil that's a programmer bug. Either
> ignore it and only serialize the first non-nil field, or raise
> an error.

It would be a programmer bug if they set a Value of a type not
allowed by Type's spec, but it would be a *runtime* error. Your
suggestion is more type safe.

Thanks.

>=20
> >=20
> > For each Alternate type, we will be using a Any type to hold the
> > value. 'Any' is an alias type for interface{} (similar to void* in C).
> >=20
> > Similarly to the Enum types (see previous commit), we will implement
> > Marshaler and Unmarshaler interfaces for the Alternate types and in
> > those MarshalJSON() and UnmarshalJSON() methods is where we are going
> > to put the logic to read/set alternate's value.
> >=20
> > Note that on UnmarshalJSON(), a helper function called StrictDecode()
> > will be used. This function is the main logic to infer if a given JSON
> > object fits in a given Go struct. Because we only have 5 alternate
> > types, it is not hard to validate the unmarshaling logic but we might
> > need to improve it in the future if Alternate with branches that have
> > similar fields appear.
> >=20
> > Examples:
> >  * BlockdevRef
> > ```go
> >     // Data to set in BlockdevOptions
> >     qcow2 :=3D BlockdevOptionsQcow2{}
> >     // BlockdevRef using a string
> >     qcow2.File =3D BlockdevRef{Value: "/some/place/my-image"}
> >     opt :=3D BlockdevOptions{}
> >     opt.Driver =3D BlockdevDriverQcow2
> >     opt.Value =3D qcow2
> >=20
> >     b, _ :=3D json.Marshal(data.s)
> >     // string(b) =3D=3D `{"driver":"qcow2","file":"/some/place/my-image=
"}`
> > ```
> >=20
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > ---
> >  scripts/qapi/golang.py | 157 ++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 155 insertions(+), 2 deletions(-)
>=20
> With regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>=20

--bt3keowquelf6fyq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJ6SrkACgkQl9kSPeN6
SE8pEA//fmxRvEcQkJIItMo3dlEHGzs0SNqPlN7NtOcWfUH6Z4tq+UrEAhMZq15Q
Kt/a6kj+oQKLRKWigB8M73YpsCaGT9mYCwfs4NvgyQsB4H0IaQIbERXvPLFDIU+l
BbD+cTudZ3ra/QE5CRuwHVUiG1Cv4vIol0UVDr2/x7xt7M5X/AShcGOkYzWm/OqT
wykf1MtGpQWtgwDQpu2FpDBvOzgMEeEvAuOJkNrmA5TlcHSkgwrs7bIRBXHsAaRu
rnzRobGv9ZBVw+UJHXtkhoQR0pWItXdhmDCHXia/HFq01k1/yOra+HKQLzXljMgb
zfMwi+/8gs1IuE+2652off2O4WlYy8sbxBW+4vBXaQln4YFfun6UjK487cL/dKlW
bpecCUl2Frv9BebBzkZMLSXLXLJXH1m0qmt9QGD5wKyjmhRG62eh91ktaH+tmzh2
ntJ5MuUP0s5K7Dgmw2UQMtoMF0t8eYZ2NQwr6Wkzl19Ve3s1VHXmH5+DDOk6sKvh
TqWC7BiuH4KaMv4eXmKxU9+rl5x59GdR0xdKoreAnRHPnxX27uzQeRa75tiCyUBF
VF/25N2gcCTmuEJLYkJqfFax28cDPQKi+CjF1FsP0Hbqf8rlLnLQZmgIiJyWk+Mz
LDHRmc5e2AZKUKUMB4jm1tPoJnuSeKVCgmkpAfd838WlxTNZxAU=
=0AOa
-----END PGP SIGNATURE-----

--bt3keowquelf6fyq--


