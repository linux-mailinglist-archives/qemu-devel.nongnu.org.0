Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF18831C5C5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 04:22:46 +0100 (CET)
Received: from localhost ([::1]:56486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqwo-0004H3-0z
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 22:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBqve-0003q6-JG
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 22:21:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBqvd-0005sb-0O
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 22:21:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613445690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/pfYHT+3QnW1z7fKX6VJRZaDsnldOn6YcPQlaB6VDFY=;
 b=R6HzSubN7AG/g8y98BqXaiHSCW9x8piy/D6UTh3UFgfu/XYrJuI2v3lA5Fuc9yq2tNn1hE
 BWv4vWmVV7+V8mdPLaPKU4Z39t7PuFjq/RIWUexweMzBtoaehbPhpk7PGJq1TIDq2l2/a8
 WZU35VvjgUPw8kZvEvpmh+VDd0clPXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-rqtFXjZ1OVmerl8UoZL_nw-1; Mon, 15 Feb 2021 22:21:27 -0500
X-MC-Unique: rqtFXjZ1OVmerl8UoZL_nw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B5931E561;
 Tue, 16 Feb 2021 03:21:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-2-24.rdu2.redhat.com [10.22.2.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 503431F0;
 Tue, 16 Feb 2021 03:21:18 +0000 (UTC)
Date: Mon, 15 Feb 2021 22:21:16 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Willian Rampazzo <wrampazz@redhat.com>
Subject: Re: [PATCH 14/22] Acceptance Tests: introduce LinuxTest base class
Message-ID: <YCs6LDyh5dtzrqE2@localhost.localdomain>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-15-crosa@redhat.com>
 <CAKJDGDbjy3z6XRc+_cag4FzRTjU==eqLkDkVh1rDv+Z2gXQXbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbjy3z6XRc+_cag4FzRTjU==eqLkDkVh1rDv+Z2gXQXbw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q6QDgBNaCibT2IEG"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--q6QDgBNaCibT2IEG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 04:06:45PM -0300, Willian Rampazzo wrote:
> On Wed, Feb 3, 2021 at 2:24 PM Cleber Rosa <crosa@redhat.com> wrote:
> >
> > This is basically the infrastructure around "boot_linux.py" tests, but
> > now made into a base class for general use.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  tests/acceptance/avocado_qemu/__init__.py | 87 +++++++++++++++++++++
> >  tests/acceptance/boot_linux.py            | 94 ++---------------------
> >  tests/acceptance/virtiofs_submounts.py    |  6 +-
> >  3 files changed, 94 insertions(+), 93 deletions(-)
> >
> > diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptan=
ce/avocado_qemu/__init__.py
> > index bf54e419da..b06692a59d 100644
> > --- a/tests/acceptance/avocado_qemu/__init__.py
> > +++ b/tests/acceptance/avocado_qemu/__init__.py
>=20
> I found it not so intuitive to have the base class defined here. I see
> the number of base classes for the tests growing in the future. A
> common place for base classes for tests would be better, just like the
> `qemu.utils` you are defining somewhere else. Anyway, this is a design
> decision that can be changed later, so
>

Hi Willian,

I tend to agree, and my medium/long term vision is similar.  What I
expect to be able to do soon (this is connected to John's work) is to
have "avocado_qemu" as something like "qemu.testing.functional" which
describe its Avocado (and other) dependencies.

A "qemu.test.other" could describe its own dependencies (which may
not include Avocado).

> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>=20
>=20

Thanks for the review,
- Cleber.

--q6QDgBNaCibT2IEG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmArOikACgkQZX6NM6Xy
CfOakQ/+PHo1D1FOr3f520aIqVzW/h78P9kitXa6mr53TuMhhJwKx6u8Rdgbt0KF
oTmvmV9pUadAvEi3ggh6C4AJAzQMx9OLdIv4Q0I7YR+lBNNmwXD4cq0dMFY56W7Y
o+1Wkg8QPD8NpCfSxmQHKholZCirXqKKr3zuIqmDChcC00/Ka0Kep4qoU0CoMquX
HMq/lCyq3wg80si/doniGaw9c3oztzoquDxrjXbjw591/hhDUxyophOtQ5rQLsBH
gw3dkaDDjb+SObdaeWySSYRXTVfSTWqa4B4qrvVYgATzU3inBOMJqwVHUERiXvnb
gLQtfcVUiLXiJSIjQy93DjSrKob8rXLWNR+smUzn9FN5bLvQv9XIbuUCSlio2fik
f4EWczjyDKRW8AXGL91ZDwX/oyDtxu23XIAlGWAy+k/wvi27xFmXkGyFjVGHf1P0
dV3MmF2zMQihrWL0+hweddg4MuzyH8yb+pt6yAVRlN0AeydSxD/V7FHmwC5jPM9f
unoYU3feBhgHtmhc8yv+oPHwX7dGTJXXe7J3mATZLjMgbfs2w46uRy02o5UTEZ6j
B/u3R9LDOIe4i/JNc3JrdJkeu6/eFhGuSQ2DGeT1n0radEjFCsmSDx9CcpPZvY4M
ix16IA7AT1ekrqYsPknZzce/yjNmueWRXVzLYooRApXl0BWzO8M=
=4XHU
-----END PGP SIGNATURE-----

--q6QDgBNaCibT2IEG--


