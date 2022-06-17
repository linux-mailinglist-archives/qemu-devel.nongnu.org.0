Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8AF54FA2B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 17:25:28 +0200 (CEST)
Received: from localhost ([::1]:37050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Dqh-0000ib-Ek
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 11:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Dp7-00083X-HF
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 11:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o2Dp3-00054a-Ks
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 11:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655479424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zc65QO/oAdyI9nMsCTpvhRZaaGT06FrIdtAWNITdmUk=;
 b=bU1CU5iVEfXFQUmLcRVl7zPBgh7DzCLgPE5+VGlCt5/qNYTGPwOBElyGsBA4/LMC2ChRvc
 j8zaXruJZDNwbZJ4d7b/RzMtFE+WyaD2uzNZWUUeclhx/0Axp4YF8QTQMm8b1YtwRDjYj1
 07KkuaNabBbM9C0V7QPAGuN6VcqV2w8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-BoiwQByWOD21feMBcrCDfg-1; Fri, 17 Jun 2022 11:23:43 -0400
X-MC-Unique: BoiwQByWOD21feMBcrCDfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D824785A583
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 15:23:41 +0000 (UTC)
Received: from localhost (unknown [10.40.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2F84010E4D;
 Fri, 17 Jun 2022 15:23:41 +0000 (UTC)
Date: Fri, 17 Jun 2022 17:23:40 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>
Subject: Re: [RFC PATCH v2 3/8] qapi: golang: Generate qapi's struct types in
 Go
Message-ID: <20220617152340.vopda4oneidcozaq@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-4-victortoso@redhat.com>
 <YqySho/9/orXWT7j@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4vyxhlofeemmighv"
Content-Disposition: inline
In-Reply-To: <YqySho/9/orXWT7j@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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


--4vyxhlofeemmighv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 17, 2022 at 03:41:10PM +0100, Daniel P. Berrang=E9 wrote:
> On Fri, Jun 17, 2022 at 02:19:27PM +0200, Victor Toso wrote:
> > This patch handles QAPI struct types and generates the equivalent
> > types in Go.
> >=20
> > At the time of this writing, it generates 388 structures.
> >=20
> > The highlights of this implementation are:
> >=20
> > 1. Generating an Go struct that requires a @base type, the @base type
> >    fields are copied over to the Go struct. The advantage of this
> >    approach is to not have embed structs in any of the QAPI types.
> >    The downside are some generated Types that are likely useless now,
> >    like InetSocketAddressBase from InetSocketAddress.
> >=20
> > 2. About the Go struct's fields:
> >=20
> >   i) They can be either by Value or Reference.
> >=20
> >   ii) Every field that is marked as optional in the QAPI specification
> >   are translated to Reference fields in its Go structure. This design
> >   decision is the most straightforward way to check if a given field
> >   was set or not.
> >=20
> >   iii) Mandatory fields are always by Value with the exception of QAPI
> >   arrays, which are handled by Reference (to a block of memory) by Go.
> >=20
> >   iv) All the fields are named with Uppercase due Golang's export
> >   convention.
> >=20
> >   v) In order to avoid any kind of issues when encoding ordecoding, to
> >   or from JSON, we mark all fields with its @name and, when it is
> >   optional, member, with @omitempty
> >=20
> > Example:
> >=20
> > qapi:
> >   | { 'struct': 'BlockdevCreateOptionsFile',
> >   |   'data': { 'filename':             'str',
> >   |             'size':                 'size',
> >   |             '*preallocation':       'PreallocMode',
> >   |             '*nocow':               'bool',
> >   |             '*extent-size-hint':    'size'} }
> >=20
> > go:
> >   | type BlockdevCreateOptionsFile struct {
> >   |         Filename       string        `json:"filename"`
> >   |         Size           uint64        `json:"size"`
> >   |         Preallocation  *PreallocMode `json:"preallocation,omitempty=
"`
> >   |         Nocow          *bool         `json:"nocow,omitempty"`
> >   |         ExtentSizeHint *uint64       `json:"extent-size-hint,omitem=
pty"`
> >   | }
>=20
> One thing to bear in mind here
>=20
> At the QAPI level, changing a field from mandatory to optional has
> been considered a backwards compatible change by QEMU maintainers,
> because any existing caller can happily continue passing the
> optional field with no downside.
>=20
> With this Go design, changing a field from mandatory to optional
> will be an API breakage, because the developer will need to change
> from passing a literal value, to a pointer to the value, when
> initializing the struct.
>=20
> IOW, this Go impl provides weaker compat guarantees than even
> QAPI does, and QAPI compat guarantees were already weaker than
> I would like as an app developer.

I think the current draft should be considered an interface that
can work with the QEMU version this was generated from. That is
the first thing we should get right.

> If we want to make ourselves future proof, we would have to
> make all struct fields optional from the start, even if they
> are mandatory at QAPI level. This would make the code less
> self-documenting though, so that's not very appealing either.
=20
> If we want to avoid this, we would need the same approach I
> suggested wrt support multiple versions of the API
> concurrently. Namely have versioned structs, so every time
> there's a field change of any kind, we introduce a new struct
> version.

That's more or less what I had in mind. I mentioned it in the
item 8 of the cover-letter. I just did not want to address it at
before deciding what the structs should look like first, for the
version we are generating from.

Just to clarify, so far I plan to follow the suggestion:
    https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg02147.html

Of course, If there are other ideas, we can discuss it too.

Cheers,
Victor

--4vyxhlofeemmighv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmKsnHwACgkQl9kSPeN6
SE/ERQ/+NrnGq0iVL5ld68cF6Vdwp4AVp3R+8l1TIpZrzMUOhRf7YNgeJqLE+7Tf
2gwjDPJyn9GEQacFMDl8nHL7wh7P6eG8UdrdYm67PvZnV0ySYwd5PvkXXLPeFOED
hAFMO156Ia3JWBRazY5AVjkHPdSqvVosSL+82VoFI63Rbxh+U91NULPlcaMmms/V
jySV3mmzI0as3kTvCZnqlgWvJ1ZHIvHphld1altXxKU8Yfid1MI1ffL8EXqsp+l6
qw4pinaizKQIAt96Q1yjgjZOTmciZHMunGdoyFbh0+qoJAdKuJBzGlN/E9pAXnAZ
o3319FrcJAUdegfcvGqEFTwbrtHbpb3q5oPWRSb33jARIg8M2xxA3gJviAj0Ndng
z/teOT5tXgeOyA4snsJvXK9FvOWFAE1ZucFhhXYGw+5BHa3aeBxRWR++Uq7pHD9f
8bAFXbpMztJha7PYWcQKzoZdIXD+Pz7LUV80hPxsA4ph52TE/qLo7tcvDNNthsYW
FkFw3IZLLobCqdEk0YVvuJetXc2OhMJWcRC1YBmWkSBLgzSFgnoHO7y9ckb0hJ1x
4nVZsxL80iC1qJ+kKQomP88XCQ2G+loqxfzkm+PuZMD6BS8eg8Ni52Anw3ZWDnwi
c+2iF68uVKOnvg2vap8ECcZw+swuQ9nkVTG9NOlP7DSYlu/4kgk=
=4fHK
-----END PGP SIGNATURE-----

--4vyxhlofeemmighv--


