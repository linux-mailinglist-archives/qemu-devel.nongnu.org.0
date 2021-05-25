Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5631C390AB3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:48:59 +0200 (CEST)
Received: from localhost ([::1]:49958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldz0-0004bs-Dc
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldxG-0002tx-OR
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:47:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldxD-0001Bm-Lw
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621975626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vqXug8r+WGhWftGh7jmaY6f6lFf9pHOxrmkZssJw6QM=;
 b=HAzi/OkVYURFgVNvCuSqCQlqW2y03knua1gAylmOdQSRVaTNB4XkDVzNKf3wXA84HfM5FI
 P70jecoIa1yH5E4qNb/PNs/CRTZcJgLJaEGJfaNgsFTLhZFPB7tlrEuT4tvVIsv40nottv
 33uMQWt1nwOsFa1qZgcQtHdhcUSpbdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-xM-KumIVNpCahuktBNAV5A-1; Tue, 25 May 2021 16:47:04 -0400
X-MC-Unique: xM-KumIVNpCahuktBNAV5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60AB08042AA;
 Tue, 25 May 2021 20:47:03 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 473B25D723;
 Tue, 25 May 2021 20:46:54 +0000 (UTC)
Date: Tue, 25 May 2021 16:46:49 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 25/25] python: add tox support
Message-ID: <20210525204649.GH1567491@amachine.somewhere>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-26-jsnow@redhat.com>
 <YK1ayNF0VTSJKa6O@localhost.localdomain>
 <9a50d093-9eea-850c-3d5d-bd44b0f45551@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9a50d093-9eea-850c-3d5d-bd44b0f45551@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U3BNvdZEnlJXqmh+"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--U3BNvdZEnlJXqmh+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 04:25:37PM -0400, John Snow wrote:
> On 5/25/21 4:15 PM, Cleber Rosa wrote:
> > On Wed, May 12, 2021 at 07:12:41PM -0400, John Snow wrote:
> > > This is intended to be a manually run, non-CI script.
> > >=20
> > > Use tox to test the linters against all python versions from 3.6 to
> > > 3.9. This will only work if you actually have those versions installe=
d
> > > locally, but Fedora makes this easy:
> > >=20
> > > > sudo dnf install python36 python37 python38 python39
> > >=20
> > > Unlike the pipenv tests (make venv-check), this pulls "whichever"
> > > versions of the python packages, so they are unpinned and may break a=
s
> > > time goes on. In the case that breakages are found, setup.cfg should =
be
> > > amended accordingly to avoid the bad dependant versions, or the code
> > > should be amended to work around the issue.
> > >=20
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   python/README.rst |  2 ++
> > >   python/.gitignore |  1 +
> > >   python/Makefile   |  7 ++++++-
> > >   python/setup.cfg  |  1 +
> > >   python/tox.ini    | 13 +++++++++++++
> > >   5 files changed, 23 insertions(+), 1 deletion(-)
> > >   create mode 100644 python/tox.ini
> > >=20
> >=20
> > This works as intended for me.  A couple of notes / suggestions
> > for future improvements:
> >=20
> >   * `dnf install tox` pulled all the Python versions available (I
> >     assume as suggestions) automatically
> >=20
> >   * tox.ini can be folded into setup.cfg
> >=20
>=20
> Done!
>

Nice!

> >   * a custom container image with all those Python versions may be
> >     handy for running both the pipenv based job (along with the
> >     suggestions on the previous patch) and an on-demand,
> >     "allow_failure" tox based CI job.
> >=20
>=20
> Yeah, I was thinking this would be good, too!
>=20
> I think at this point, it's going to be a follow-up, though. Because
> ideally, yes, this SHOULD pass -- it's just that it needs a fairly
> particular environment to run in, which is annoying, so it's here as an
> optional-ish thing for now.
>=20
> Maybe I'll make a new fedora:latest container that's meant solely for
> testing python stuff, because it's just such a convenient distro for it.
>=20
> Later, though.
>

Sure.

> > Other than those suggestions, this LGTM!
> >=20
> > Reviewed-by: Cleber Rosa <crosa@redhat.com>
> > Tested-by: Cleber Rosa <crosa@redhat.com>
> >=20
>=20
> =F0=9F=8E=89

\o/ (with 3 characters, because I'm unable to find the right codepoint)

--U3BNvdZEnlJXqmh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtYjgACgkQZX6NM6Xy
CfNcFA/7BHkbVFL+0Ka754ykOyTwsRTDMfbbmPMgv2UKErZKdifuuu7Xepc8DGBH
VachItQujKxyR5v7LUTlsZo2lILLJ7pBUwAxbZlEJkFK6iiIDCX7tS/OeP+E/A4q
vnxnZsLW19n5l/Ia+kYwV9CeNQxyB6r1v8j4ismsnP/QOxEof1EJH7zhefjjxGIG
nMJPF5w9WBjMvKKUg0e4j/cAuMhKiS31A1odLOxEeRppyn1QI3r4KELomImU293B
KRNeKtZY8r1K0EQu0CDBbfwwW9p3Q1TZhK53FSDquL7+bBv7dgMmomEaglH95Rq9
xzOvRp0toMXFFRjXYfyrUGCZq1xlIj/zoQIMBRQcdGB1+o0CntgQd8bqeeHYaWHC
8MSncCJWMjEhEK9f8K5UzPz1Q8Juil4kt6rKQ67qToPeXFXmjks/EllIMcHeKgeM
3DEP/CobhD0nI4LQPpN/HDYNXQbhZACqal+XPN8zgsbyzDxL75bMuu5rYg+iWtaG
lKDjfd16uEZBMOIOy7QSSTYGCtJ51pNPlG9P9w8+dKnPif3qBe0qvxNOCfTsurqx
PdApE4p4oiRBIC8fXHl5ZZ5VrhtT04+DvD9bY+fBgq0W7j7h60HFL3ibweHboecg
wylILDYbGydlmqYkAYKDuoMb9TYGVWJC7y53exUVY+lkQWig884=
=0+0Y
-----END PGP SIGNATURE-----

--U3BNvdZEnlJXqmh+--


