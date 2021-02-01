Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2560430A66B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:23:38 +0100 (CET)
Received: from localhost ([::1]:37418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XIv-0007jM-4U
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6XHx-00073Y-H7
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:22:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6XHs-0005DM-Rc
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612178550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dbVtnUNKynoPbXfwO4i6N84knzeV7GzBlTrpLZwOiuc=;
 b=PX0TsMVjAjL4rc24/2cjyFU7iWRfY8VAV49jsPcyrRKq4cwLjb8FaqCdubLDtQzuip1sHP
 70g9/lxZJIs6MmN5pN+j1u+/hV4cTwToraPZ015QEnFn9U1ben6hYLAXhF2LT0LwDHbA8P
 2Id53VUFywhT8675Tjs1C4kKNgefAfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-ZkZ0cL7tMgezIpyFxtsWUQ-1; Mon, 01 Feb 2021 06:22:28 -0500
X-MC-Unique: ZkZ0cL7tMgezIpyFxtsWUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B4D49CC0B;
 Mon,  1 Feb 2021 11:22:27 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB3E45DA30;
 Mon,  1 Feb 2021 11:22:26 +0000 (UTC)
Date: Mon, 1 Feb 2021 11:22:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
Message-ID: <20210201112225.GA160382@stefanha-x1.localdomain>
References: <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
 <f13a4aac-2d9a-9762-2664-3e3e09376f4d@redhat.com>
 <b06344f0-892f-4ff0-782f-1d55862a2c2b@redhat.com>
 <1cd6e449-cdde-adf6-a3ef-b2e95cd04add@redhat.com>
 <95abf7c3-4338-1659-8c83-e4fb886794b7@eik.bme.hu>
 <20f2dbbf-638c-4c3f-0513-0c7f1afed15d@redhat.com>
 <20210114140217.GD292902@stefanha-x1.localdomain>
 <6bf62c67-7dff-11e2-37e8-a0e67da89bb2@eik.bme.hu>
 <5b620b0a-a21a-e1c4-8f4f-f16bc5b484aa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5b620b0a-a21a-e1c4-8f4f-f16bc5b484aa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--huq684BweRXVnRxX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 10:31:49AM -0600, Eric Blake wrote:
> On 1/14/21 8:18 AM, BALATON Zoltan wrote:
>=20
> >> I wasn't aware of the fact that some of the utilities are sensitive to
> >> '--' vs '-'! I'm in favor of consistently using '--' in documentation
> >> but allowing both for backwards compatibility where '-' is currently
> >> supported.
> >>
> >> If we are in agreement, then let's:
> >>
> >> 1. Add a section to CODING_STYLE.rst or other developer documentation
> >> =A0 documenting this.
>=20
> Seems reasonable to me.
>=20
> >=20
> > I'd be more in favour of documenting that QEMU accepts - options but
> > also -- as alternative and fixing the tools that currently use
> > getopt_long to use getopt_long_only to keep it consistent with main QEM=
U
> > executable. Otherwise this will get more and more inconsistent with new
> > options added with -- and old ones only exist in - form so to keep
> > consistency we should standardise on - not --.
>=20
> I've got less practical experience with getopt_long_only(); I know there
> are some utilities like gcc that have to use it, but GNU coding
> standards prefer getopt_long() over getopt_long_only().  I think one of
> the reasons is the potential for ambiguity: if you have a program that
> accepts a series of short options without arguments, you can combine
> them together (think 'ls -lF'), but what happens when your combination
> of letters then resembles a long option?  A bit contrived, but 'ls --no'
> is short for 'ls --no-group' (aka 'ls -G'), while 'ls -no' is the same
> as 'ls -n -o', which has different behavior.  ls uses getopt_long(),
> hence the use of -- matters; but if it were to use getopt_long_only(),
> you would have changed the behavior of 'ls -no' (it would now favor
> --no-group over -n -o).
>=20
> That's not to say we can't switch qemu-img, qemu-storage-daemon,
> qemu-io, and friends to use getopt_long_only(), but merely that we have
> to be careful of what it will do to their command line parsing, and
> whether it will introduce any unintended regressions.
>=20
> So the conservative answer from me is to prefer documenting '--' options
> everywhere, rather than trying to figure out when '-' is acceptable with
> long option names.
>=20
> >=20
> >> 2. Convert existing documentation to use '--'. This will make it more
> >> =A0 consistent and also avoid confusion about '-' vs '--'.
> >=20
> > You could still use -- in documentation but what's the problem with - i=
f
> > -- is also accepted if one wants to type that?
>=20
> Supporting lazy typists is one thing, but our documentation should stick
> to the preferred form, even when shorter forms are possible.

I lost track of this email thread.

Do we have agreement on that QEMU documentation should consistently use
'--' for long options?

Stefan

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAX5HEACgkQnKSrs4Gr
c8gWbgf/Y18NgMkUWV9yuqTiJDkU1CrjbnCrY0Og4gcuo/RIZpjXuLjwVc254w0A
N1qDbto5PC6LdbPzAjE12m+80D3JX6dUT5/N9sNNAlIgu/LNom+iCpxpTwmCVIwV
OWZvq9VwGEjMVaZRDUigKdS4o98627JOsiKoxNNW1RSZpOS/JznuLeez2HW2j+aM
j1vhVnGyYmaba/YYwhDw7fmsA6X7gtocw5nlUKdhu87KIkeglHEqRlvZ8MNiWQoW
rbZSU0VcQmbSo+FajMPiBcR+pAv7iuG3+hH1JRsLIX79IjNdbUl1C8ouqPzCagG/
sN6AaPC7ZTgXUtfZh1PvJkov9Jljzw==
=tYB3
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--


