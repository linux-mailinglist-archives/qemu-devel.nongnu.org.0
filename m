Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0833A55B998
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 14:52:06 +0200 (CEST)
Received: from localhost ([::1]:36942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5oDk-0000m9-Jg
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 08:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o5oAa-0007Ie-LL
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 08:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1o5oAW-0000NZ-Jy
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 08:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656334123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D5AhM5eo3HZAjHn2jBUUuT6qhJrdVJF8JGtCkDe/5Es=;
 b=Vi1Wi3QBpWaMuA85ZF2CgsXxb0LGSKrBwC/6KNWeomenp8bdwI8cntTT1c5pZ1bdM7BuLm
 D+Q1avEvvAIqU6hBic3bXw24eAd/n1a+C2PaMfjds5E5PgIbQCKEaQHg2dzUHG7tubBQL1
 0lrPbHM0M9vtpEIFhgC5AEnQmIVvvxs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-GrQ_7hgoPLyb8b91PfxidA-1; Mon, 27 Jun 2022 08:48:41 -0400
X-MC-Unique: GrQ_7hgoPLyb8b91PfxidA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03F6E2803025
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:48:41 +0000 (UTC)
Received: from localhost (unknown [10.40.194.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C588415F5E;
 Mon, 27 Jun 2022 12:48:40 +0000 (UTC)
Date: Mon, 27 Jun 2022 14:48:39 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] qapi: add generator for Golang interface
Message-ID: <20220627124839.fliskdn4twbazqqk@tapioca>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <87fsjq60gm.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mnsoslogsu7shf7n"
Content-Disposition: inline
In-Reply-To: <87fsjq60gm.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--mnsoslogsu7shf7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Markus,

On Mon, Jun 27, 2022 at 09:15:53AM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>=20
> > Hi,
> >
> > This is the second iteration of RFC v1:
> >   https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00226.html
> >
> >
> > # What this is about?
> >
> > To generate a simple Golang interface that could communicate with QEMU
> > over QMP. The Go code that is generated is meant to be used as the bare
> > bones to exchange QMP messages.
> >
> > The goal is to have this as a Go module in QEMU gitlab namespace,
> > similar to what have been done to pyhon-qemu-qmp
> >   https://gitlab.com/qemu-project/python-qemu-qmp
>=20
> Aspects of review:
>=20
> (1) Impact on common code, if any
>=20
>     I care, because any messes made there are likely to affect me down
>     the road.

For the first version of the Go generated interface, my goal is
to have something that works and can be considered alpha to other
Go projects.

With this first version, I don't want to bring huge changes to
the python library or to the QAPI spec and its usage in QEMU.
Unless someone finds that a necessity.

So I hope (1) is simple :)

> (2) The generated Go code
>=20
>     Is it (close to) what we want long term?  If not, is it good enough
>     short term, and how could we make necessary improvements?
>=20
>     I'd prefer to leave this to folks who actually know their Go.
> (3) General Python sanity
>=20
>     We need eyes, but not necessarily mine.  Any takers?
>=20
> [...]
>=20
> >  scripts/qapi/golang.py | 765 +++++++++++++++++++++++++++++++++++++++++
> >  scripts/qapi/main.py   |   2 +
> >  2 files changed, 767 insertions(+)
> >  create mode 100644 scripts/qapi/golang.py
>=20
> This adds a new generator and calls it from generate(), i.e.
> review aspect (1) is empty.  "Empty" is a quick & easy way to
> get my ACK!
>=20
> No tests?

I've added tests but on the qapi-go module, those are the files
with _test.go prefix on them. Example for commands:

    https://gitlab.com/victortoso/qapi-go/-/blob/main/pkg/qapi/commands_tes=
t.go

Should the generator itself have tests or offloading that to the
qapi-go seems reasonable?

> No documentation?

Yes, this iteration removed the documentation of the generated
types. I'm a bit sad about that. I want to consume the
documentation in the QAPI files to provide the latest info from
types/fields but we can't 'copy' it, the only solution is 'refer'
to it with hyperlink, which I haven't done yet.

Cheers,
Victor

--mnsoslogsu7shf7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmK5pyYACgkQl9kSPeN6
SE8pWhAAhcIyh9A/3JipFVuFlTNvfTi55g7TP+/hNhl/+ozQJIWzsijU2BKtWRej
VR/e0qbQLcY3KWOthvGnSG0D524TykS/83dnJ/DP3oLL7sFZs9J3a4A7723V2Nn8
6jxH7GXRFWg5FrRJB6+XW202s8THS1d7oZVJw5KEag1+kcotKkR4d8ezc9bWu5yr
MSIOkzQ58U2+Ii79Ac7aXC0RMAEDs+ZfLA0JjCiS4SyFBNyScSbs296yZryB9KDJ
iHLLsPDQAN08O5gWXl44kIfId6M0hTrPcsInoWo1jrLg+eziLI6bg+k6O/DfhoSX
mDReQARHdKNfWtZ0injC3veDGhRRD8ObzbdvX+NZHupQL1j8CCeP64Gs3+fPPmqD
t5Otexdv/0J/B1/jQZoQd7Ny4Tz1zHkW4f+wSvKcJFdfh/PBwqECCA092WNyXO/U
JB0NjzHSyabd36ZJiew3QQQhYBkk7OvIWB5scjrsWwkwSifuok69QUzIIPz3mflh
fhaqX8jbafp1q+t7NLmNpOR0M6OYUxT0LGqCIUjX4WntmM+gwLykbwUiWCPqRsuG
93TufiIQFFCkquI6JnNV1ES0a72vJpscUh1WgZVCJ7sgHwfoRt5ueqFWf/q3K0CE
2LWUt8bVNknWX+Lmn1a73vK30AvZYRgD7rRuGT06eXzzfMBCfrU=
=di2f
-----END PGP SIGNATURE-----

--mnsoslogsu7shf7n--


