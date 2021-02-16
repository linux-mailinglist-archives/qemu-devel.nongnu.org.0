Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7731C5CA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 04:29:32 +0100 (CET)
Received: from localhost ([::1]:58714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBr3L-0005X3-Mc
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 22:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBr2C-00056N-EY
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 22:28:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBr2A-0000Jw-RC
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 22:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613446097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXEF87+zzCGppKRebIgovx1ean3PhekgdbEqB9u1H8I=;
 b=AvM/e3gIkmYNkzZ3RfVQ9pxDSHhsAM0VxEl/u/rKh1hog7iaMtgXqQH57jBPFMnTA1rZFA
 y9Iea8cheXjl/coiozHPJvb2VYP0WqJIl0lIv4CGL9ZHNVyWx1Pculk5Ll2izjLcPiHV2f
 gxp2yV868qBNKDnLXxwhQ83r1VjutCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-zvc-jhPBMkqAQpeR5ByE1w-1; Mon, 15 Feb 2021 22:28:13 -0500
X-MC-Unique: zvc-jhPBMkqAQpeR5ByE1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6D19107ACE3;
 Tue, 16 Feb 2021 03:28:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-2-24.rdu2.redhat.com [10.22.2.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D206310016FA;
 Tue, 16 Feb 2021 03:28:06 +0000 (UTC)
Date: Mon, 15 Feb 2021 22:28:04 -0500
From: Cleber Rosa <crosa@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 18/22] Acceptance Tests: set up existing ssh keys by
 default
Message-ID: <YCs7xMIPxHkB3qw9@localhost.localdomain>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-19-crosa@redhat.com>
 <CAJ+F1C+sB1+K47C-m74AX4OR0U-MgO-XXyOz4V3W2=TwE2VUQg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+sB1+K47C-m74AX4OR0U-MgO-XXyOz4V3W2=TwE2VUQg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Wl4IiimjMllaVqTm"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Wl4IiimjMllaVqTm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 02:15:32PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Wed, Feb 3, 2021 at 10:07 PM Cleber Rosa <crosa@redhat.com> wrote:
> >
> > It's questionable wether it's necessary to create one brand new pair
>=20
> whether
>

Yep, thanks!

> > for each test.  It's not questionable that it takes less time and
> > resources to just use the keys available at "tests/keys" that exist
> > for that exact reason.
> >
> > If a location for the public key is not given explicitly, the
> > LinuxTest will now set up the existing pair of keys as the default.
> > This removes the need for a lot of boiler plate code.
>=20
> boilerplate
>

You're right again.

> >
> > To avoid the ssh client from erroring on permission issues, a
> > directory with restricive permissions is created for the private key.
>=20
> restrictive
>

OK.



> > This should still be a lot cheaper than creating a new key.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
>=20
> Reviewed-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>

Thanks for the review,
- Cleber.

--Wl4IiimjMllaVqTm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmArO8IACgkQZX6NM6Xy
CfPI7g/8DCA6XzhhTNbJ3sr+EhRAbUnoEPriNxGQJ21o8nGyl3IdzcTyLfCWi0M3
jGCASYB99KmNvW2PHCbfA6jQ7ErVRBuz+5OqLhGTM28kptwlwKFdEzRN//9YYWyb
oqC0GUAGYUqhJsU/KJGM64l4GtSDlZxU5H5NIzY1AAgezUKc+ky6zo6WYHZBa8ll
Jls6syz66+0Jfw23+RKXPWlyw9V+JpZmmI8v1CgfFPMCSrNXSTXj+4l5cMeeoS7y
JSK1TKnrVSuaidDi/r+rlITgm6z9TIN95gCj8sTCqb+nQPsG2xhFCLI5l64fPBuE
JvbDI1D2lVQ9WgE9WkbOHr0mOvVjNF/Dsk3ciU9MHYdvo7MUaaHTZVMPjZD2ih5+
3atQ5uZm4g+5tAnjL8fHFLyPz3sFR+yWQ9Sb9H0SAzqSjnM0vHC2hh1GLxJTCBuN
a3O59+Rj6qtQwNX3+u0NGLSFGB6UfmWp7iGMptQz7+S5Z0Iy+b/RtbzujQxcfCYj
LBnbUWu/qg9CUrh3zVTwVVH555uNJMULNJcdorg+jiSKVgHrnaaXOL0Wza/BOVi4
7cqUYNZBrbtVzpZEPJvCdxcI5bujhoNrHRFq7jMqU3QCLOEfyFcTEyGQgBYa5ZTH
jLCFtkLJCbBbW9KflO+vaEZrAnYpMJjAoRwdAiiUOFbfL7Mj5uM=
=yc0T
-----END PGP SIGNATURE-----

--Wl4IiimjMllaVqTm--


