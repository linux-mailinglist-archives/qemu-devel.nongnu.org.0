Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C545213DC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 13:34:03 +0200 (CEST)
Received: from localhost ([::1]:53154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noO7u-0000tk-5K
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 07:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noO6A-0007he-0H
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:32:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1noO68-00065m-9P
 for qemu-devel@nongnu.org; Tue, 10 May 2022 07:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652182331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E1Sj3/UnWPZSjDXocsk5J3NJtDTzET+T+Zt+d122HB8=;
 b=fI4pQaWJ0W/SGOK6G14mzsaWSkDwY+6SMvEaagSkFt1YNEPQwXpPS8pWWsRsXrwmU3vZJ+
 eACWhUzRkKdiBDz8yoYnTZV1fUvjpNEUG/aNCvMhR40ospN0/enJGGCodL7Fr2ralSGjsB
 yeBP8CX3A8fTyHyeDCksOh4Zk5f1z4g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-Mh7DxzqTNxq3EcWxnUWgpg-1; Tue, 10 May 2022 07:32:10 -0400
X-MC-Unique: Mh7DxzqTNxq3EcWxnUWgpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D0DF85A5BC
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 11:32:09 +0000 (UTC)
Received: from localhost (unknown [10.40.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3169840CFD06;
 Tue, 10 May 2022 11:32:08 +0000 (UTC)
Date: Tue, 10 May 2022 13:32:08 +0200
From: Victor Toso <victortoso@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 4/8] qapi: golang: Generate qapi's union types in Go
Message-ID: <20220510113208.ndnw7q343rz2heyo@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <20220401224104.145961-5-victortoso@redhat.com>
 <Yno98HEL1oqzs0ZP@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4viv4mco26gi324q"
Content-Disposition: inline
In-Reply-To: <Yno98HEL1oqzs0ZP@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
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


--4viv4mco26gi324q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 10, 2022 at 11:26:56AM +0100, Daniel P. Berrang=E9 wrote:
> On Sat, Apr 02, 2022 at 12:41:00AM +0200, Victor Toso wrote:
> > This patch handles QAPI union types and generates the equivalent data
> > structures and methods in Go to handle it.
> >=20
> > At the moment of this writing, it generates 67 structures.
> >=20
> > The QAPI union type can be summarized by its common members that are
> > defined in a @base struct and a @value. The @value type can vary and
> > depends on @base's field that we call @discriminator. The
> > @discriminator is always a Enum type.
> >=20
> > Golang does not have Unions. The generation of QAPI union type in Go
> > with this patch, follows similar approach to what is done for QAPI
> > struct types and QAPI alternate types.
>=20
> The common way to approach unions in Go is to just use a struct
> where each union case is an optional field, and declare that
> only one field must ever be set. ie
>=20
>   type SocketAddressLegacy struct {
>         // Value based on @type, possible types:
>         Inet *InetSocketAddressWrapper
>         Unix *UnixSocketAddressWrapper
>         VSock *VsockSocketAddressWrapper
>         FD *StringWrapper
>   }

Like Alternates, I like this better.

> When deserializing from JSON we populate exactly one of the
> optional fields.
>=20
> When serializing to JSON process the first field that is
> non-nil.
>=20
> Note, you don't actually need to include the discriminator as a
> field at all, since it is implicitly determined by whichever
> case is non-nil.  Introducing the discriminator as a field just
> provides the possibility for the programmer to make
> inconsistent settings, for no gain.

Sounds reasonable. We still need to implement Marshal/Unmarshal
for unknow types (e.g: a new Type for SocketAddressLegacy was
introduced in 7.1 and we should be able to know that current
qapi-go version can't understand it).

Cheers,
Victor

--4viv4mco26gi324q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJ6TTgACgkQl9kSPeN6
SE8y0RAAsiX7Xua9wzNmGzn6HXuJxqpZFeueGNu1RKcjZlECP8Yy9SQb3c6sqOuf
CFpsSwSoMdHxxaE/Xh/boa8cWN7KFCaQMC+2uIsEfBJDvVO2LegyWMKCZbS2NI49
aJUt7LZK51Igfo5Dlw3HHB0eV9WYqTbKvEfQESuwTe5qNqHJtM6SXUssn0fzdo2Y
YkveIUVxpKLJY6Bzp5oTNvmczuyR4/Mg9O4wLQEBA3X34qIybxnmQTvuMUrbtj/h
jXH3FS51fUbwrAz3ooFgHGMjVLco09RC1KxAlf0yZTmyKsNw+c6lFFdrTsocE5tS
Be9ZCqXUGV8i9G1ur7NOQ4VQOUAIk/GS4OtL/t2P34n+M0496hqNsXMdcHFSWqXY
exJ6vHlxS0INKfoV0t3j8Jr8rcOiwn4JNqEIlZwKbAzbzfSwxM2zbrOTUguF1LoS
3YL8LJE5Xw2LteheWNFPuDCrH0FUj1YF6JBv7lPaERMsHrpeDrHhHbRgcuwzhr0K
Fb/biFGcKwB8fIVH+6CSd/ajCa97/+J3QyGE8jkQyP5pVQ2X0WP49yoA5uAcT2dN
rRMZgrZ+4ynJtXEhNzX1XkUWX3PsxY+DKL2hVo9gERUtCn4dbHXn00r1wnXqH7ws
6CUm0REuWeIALE9bkY8iYHkGRx9dzgJsFS7utNqTwojE/AFeaRE=
=2tsq
-----END PGP SIGNATURE-----

--4viv4mco26gi324q--


