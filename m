Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA83625A4
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:28:47 +0200 (CEST)
Received: from localhost ([::1]:39060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXRKo-0002HG-F8
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRJ0-0000eL-D1
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:26:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRIx-0000bT-SA
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618590411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z2nDTnhB4JMlgOMvwKnb/4ZGZIMaaPgWntHgrO1i3W4=;
 b=FinPxTZ8Qyoklu7GhI81UBDEAU6JxBrW+g0hMw2C5JLTg8EyiZYbmR7qyiNlBuyl9DFr8B
 +f7OVoiwnJtabIGdR1MOdUkR7QSN4dSbQuAbF8JSHdzgEf6QF73deLqHdDkWtgOsf+2jLW
 JZrXI4uqMrL3B8jGWY8dQSX1yWW54hU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-80M-E84oNveSLX6IxfewNw-1; Fri, 16 Apr 2021 12:26:48 -0400
X-MC-Unique: 80M-E84oNveSLX6IxfewNw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94AA4801814;
 Fri, 16 Apr 2021 16:26:47 +0000 (UTC)
Received: from localhost (ovpn-116-207.rdu2.redhat.com [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DCD35D6D3;
 Fri, 16 Apr 2021 16:26:37 +0000 (UTC)
Date: Fri, 16 Apr 2021 11:39:00 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/8] Acceptance Jobs: preserve the cache for pip on
 GitLab CI
Message-ID: <20210416153900.GA1914548@amachine.somewhere>
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-2-crosa@redhat.com>
 <af052ca5-aaaa-07f8-c2c0-e96132d4db5a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <af052ca5-aaaa-07f8-c2c0-e96132d4db5a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 05:56:10AM +0200, Thomas Huth wrote:
> On 15/04/2021 23.51, Cleber Rosa wrote:
> > The acceptance jobs (via `make check-venv`) will setup a virtual
> > environment, and after that install packages defined in
> > tests/requirements.txt via pip.
> >=20
> > Let's enable pip's default cache directory, so that we can save
> > a bit on time/bandwidth.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   .gitlab-ci.yml | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 52d65d6c04..9cc4676912 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -53,6 +53,7 @@ include:
> >       key: "${CI_JOB_NAME}-cache"
> >       paths:
> >         - ${CI_PROJECT_DIR}/avocado-cache
> > +      - ~/.cache/pip
>=20
> Did you check whether this works? AFAIK the cache directories have to be
> part of the project directory, see:
>=20
>  https://docs.gitlab.com/ee/ci/yaml/README.html#cache
>=20
> We already tried to cache ~/avocado/data/cache in the past, but it did no=
t
> work and we had to move the cache manually to the current working directo=
ry
> (see commit 5896c539547).
>=20
>  Thomas

You're absolutely right, it won't work like that.  My bad.

I was trying to avoid having to set variables or configurations, but
something like the following will be needed:

    before_script:
        - export PIP_CACHE_DIR=3D${CI_PROJECT_DIR}/pip-cache
        - mkdir -p ${CI_PROJECT_DIR}/pip-cache
    cache:
        paths:
            - ${CI_PROJECT_DIR}/pip-cache

Resulting in:

    Using cached avocado_framework-87.0-py3-none-any.whl (399 kB)

And the likes of:

    https://gitlab.com/cleber.gnu/democi/-/jobs/1186910932#L166

I'll change that on v2.

Thanks!
- Cleber.

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmB5r5EACgkQZX6NM6Xy
CfP+5hAApJ6gGMhrMmMyCzlUQUonRUcc/laCSIflgicuRTUhYalXsxspJkdnrrae
ythz7NxhKrOqbZqyt5zdJok4p6Fnh1QjeKFhvvAJUxec3WpNujsZgO0nv+E/V3TD
oIUYgF0ktR4fgE0vUTt+TzI3A5DuOtFzF244evVc8iB0/C1IrAI+MP4hCJ0uj81H
QJPt0GQLPS5IzjyCQ2l628F+DbK949ZxmrfxHOisJH6YlBD65UjJwmeQK3vnnmjb
zBgtjt0bgmA9QbbqVlDJQFLWdIo9pOEvyuoU8m/QE7fyjQZ95tgsG769a8t4YAv5
NAX0NqV6i7otr/dFA3xQcLNfhT5vok8qzZSaKPd/6kGIc2jb348rbLLfU01AxLDE
AxpKZulipCy6EcAVRVUKnEGAFi68VBT/0bFv9BOO3UMouIAdkDBM73Lz5dk13f+i
bPLf5Z2eUL5wuM2TZIq5st2RJH3eo2Y684eNccDcY9llnnBrWbOH5hc/rgR+T6/c
g81OyjTcrPuRe/tEQUA2P6uP54fxtd62NatB7kO152kTL3EpXdxcPSuFqEcwdm2h
Lz3x3J5eI+yanW5Bu3wORFXVKD+rfy/KQV/qu0qgTmzW//sUVqmTWlngY3gOpevv
5zJLCBr0kUvD5E6YgAbHeA1NfV8jFkoujtym8X1cmsL6uRaTPSA=
=q6Yc
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--


