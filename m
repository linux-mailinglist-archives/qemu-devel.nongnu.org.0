Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06005A7F38
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:50:12 +0200 (CEST)
Received: from localhost ([::1]:58916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTO6Y-0006G1-9b
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTO4Q-0004r7-Oh
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:47:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTO4N-0002Lc-1G
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661953669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fv0qHHXhU11VQYc1TwhTUSkwBz+0E+alqYb2rjwGJnE=;
 b=EM6pZ8cYbxsB/6cWBDRYsAa6fALqQMQ8L8X9c4GD799nXEPzkP13InGtKlXKHWCy/zoIeq
 sKtLi4IN7cFiSv8ptybdurSTPzZ6tBwb6D0tlignh7f0CmtrkDntvn4DDp9N1aKb4oz4LS
 l00k1Jv5d1I+ezxk446rYdP14MLHC64=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-FQa0jfeqOD-wtM2YljO1iQ-1; Wed, 31 Aug 2022 09:47:45 -0400
X-MC-Unique: FQa0jfeqOD-wtM2YljO1iQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88EBD1C0E042;
 Wed, 31 Aug 2022 13:47:27 +0000 (UTC)
Received: from localhost (unknown [10.40.195.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2081C40CF8EE;
 Wed, 31 Aug 2022 13:47:26 +0000 (UTC)
Date: Wed, 31 Aug 2022 15:47:25 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v1 12/16] qapi: fix example of blockdev-add command
Message-ID: <20220831134725.j7lsf7nzt2tc3glr@tapioca>
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-13-victortoso@redhat.com>
 <87zgfkabel.fsf@pond.sub.org>
 <20220831124512.ngotphuwnsx6pyqn@tapioca>
 <87pmgg8se1.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dzdzrrabw7wyow65"
Content-Disposition: inline
In-Reply-To: <87pmgg8se1.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--dzdzrrabw7wyow65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 31, 2022 at 03:16:54PM +0200, Markus Armbruster wrote:
> Cc: Kevin for an improved chance of getting any nonsense I might write
> corrected.
>
> Victor Toso <victortoso@redhat.com> writes:
>
> > Hi,
> >
> > On Wed, Aug 31, 2022 at 01:40:50PM +0200, Markus Armbruster wrote:
> >> Victor Toso <victortoso@redhat.com> writes:
> >>
> >> > The example output is setting optional member "backing" with null.
> >> > This has no runtime impact. Remove it.
> >> >
> >> > Problem was noticed when using the example as a test case for Go
> >> > bindings.
> >>
> >> "Fix example" and "problem" implies there's something wrong.
> >> "No runtime impact" sounds like it's redundant, but not wrong.
> >> Wrong or not wrong?
> >
> > I take your comment is more about the wording which is confusing.
> >
> > Would it be better if I change to:
> > '''
> >    The example output is setting optional member "backing" with
> >    null. While this has no runtime impact, setting optional
> >    members with empty value should not be encouraged. Remove it.
> > '''
> >
> > While I think the above is true, my main reason for proposing
> > this change is to re-use the example as a test case, but I'm not
> > sure if adding anything related to it would make it better (only
> > more confusing!).
>=20
> I had a closer look at the schema.
>=20
> The definition of backing is
>=20
>     ##
>     # @BlockdevOptionsGenericCOWFormat:
>     #
>     # Driver specific block device options for image format that have no =
option
>     # besides their data source and an optional backing file.
>     #
>     # @backing: reference to or definition of the backing file block
>     #           device, null disables the backing file entirely.
>     #           Defaults to the backing file stored the image file.
>     #
>     # Since: 2.9
>     ##
>     { 'struct': 'BlockdevOptionsGenericCOWFormat',
>       'base': 'BlockdevOptionsGenericFormat',
>       'data': { '*backing': 'BlockdevRefOrNull' } }
>=20
> Meaning, if I remember correctly (with some help from commit
> c42e8742f52's message):
>=20
> 1. Present @backing
>=20
> 1.a. of type 'str' means use the existing block device with this ID as
>      backing image
>=20
> 1.b. of type 'BlockdevOptions' means use the new block device defined by
>      it as backing image
>=20
> 1.c. that is null means use no backing image
>
> 2. Absent @backing means default to the backing file named in the COW
>    image.

Over the wire, how you get the difference between 1.c and 2? Are
you saying that for optional member "backing" we should be
explicit sending null over the wire?

> Therefore, ...
>
> >
> > Cheers,
> > Victor
> >
> >> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> >> > ---
> >> >  qapi/block-core.json | 4 +---
> >> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >> >
> >> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> >> > index dcc6d41494..302164d575 100644
> >> > --- a/qapi/block-core.json
> >> > +++ b/qapi/block-core.json
> >> > @@ -1542,9 +1542,7 @@
> >> >  #      "arguments": { "driver": "qcow2",
> >> >  #                     "node-name": "node1534",
> >> >  #                     "data-file": { "driver": "file",
> >> > -#                                    "filename": "hd1.qcow2" },
> >> > -#                     "backing": null } }
> >> > -#
> >> > +#                                    "filename": "hd1.qcow2" } } }
> >> >  # <- { "return": {} }
> >> >  #
> >> >  # -> { "execute": "blockdev-snapshot",
> >>
>
> ... your patch changes the example from 1.c. to 2.  Which is probably
> not what you intended.

Yep, you are correct but not just with my patch. It is confusing
that an optional member must be set to JSON Null over the wire..
I'll need to think a bit more on this.

Many many thanks for your review. Really appreciate it.

Cheers,
Victor

--dzdzrrabw7wyow65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmMPZm0ACgkQl9kSPeN6
SE//1w//YWyJGIbf5oyOtL8rM+RA1bq5qYijAOAlHSaWR+1qYX0YG0XuwULGiF5i
qkgq75wlLTHuD4E8pyYGfJE/g084PuWTwTZ1aT6ACoD5Hok1blNRXxXShFszrJUg
LHfx3uPioS7S6PgpngALUxXSNI5z7IPfmeAlciZhFLDUQEeQOU5QhyV+l6jdIJxI
q6mshye0UI+rYJ3XmjiUs02xdwjK+Vq+nSDQ4PgYkivIAFes8DeODQfyhX0372Pg
1YgmsBdCf4uvKpnnXJptlM5hUXj3OtjxbtbXiIDzecq8ZJMFq/34qFq4/eDKxKar
7STVO1ysdNPkHj7GgVW5uNLpN1TULj+ci/qGSqiEqcKtv9VmhuXN/aAs4zxTEBJN
0RRrJ5AykKGrki9kM7f/fmszbT6YZzTnvhXRzlEiOZpoUnJfzV1BHpnJXEvj0rfI
RO5r4dGFXqbU6v1evXqFsMmDZTTMtNY9EK7hSW3PxltotVJnfonfSr4A04jC++92
wxJiStrJauQvyM4AZONIJSytr67XKV+rfwUWHpwwdjJ7h0VFY9lMIeecP2Zhlk+3
NAT4GBvmnYHkxP7Ey3+pOyo9vbLR/cPYTRv9H0Ma7Ne9eUI1c0CLGG8CurkA9mMG
lnKhDgogA4aDgAtCEWuP2LuRzWMwWmQnGbQbbcGstrjztu5gD/g=
=vNIX
-----END PGP SIGNATURE-----

--dzdzrrabw7wyow65--


