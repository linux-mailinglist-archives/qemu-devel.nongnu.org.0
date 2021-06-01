Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B93976E5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:39:49 +0200 (CEST)
Received: from localhost ([::1]:45274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6Ue-0001fy-GY
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lo6Sb-00074o-7s
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lo6SY-0000xr-1K
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622561856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=szecfycQic/z2nlf63kzJCJklixt5rCBbXoGh8sQCLo=;
 b=X9bno+M/Qu/7PH0eTVCcSFACmzS5MEa7UVPpGuOLWeHoZvZMwxk59Iiy/LAEGMsAcU+LwB
 AgKGzNWu2oUTAVFaM7/g98FeB/ZvyrrzsmICoTgFZwPU4BRAi2J28iHZecGC2wAlOXcwLl
 EkNDe4Z6tSza83OOJgwNs21BZm7GHcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-CVlKstqqPPSm8XliNE_oYQ-1; Tue, 01 Jun 2021 11:37:32 -0400
X-MC-Unique: CVlKstqqPPSm8XliNE_oYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD48A100A5FE;
 Tue,  1 Jun 2021 15:36:39 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A82060C0F;
 Tue,  1 Jun 2021 15:36:39 +0000 (UTC)
Date: Tue, 1 Jun 2021 16:36:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/3] vhost-user-blk-test: fix Coverity open(2) false
 positives
Message-ID: <YLZUBlJpZaGFAr6+@stefanha-x1.localdomain>
References: <20210526091248.434459-1-stefanha@redhat.com>
 <20210526091248.434459-2-stefanha@redhat.com>
 <CAFEAcA9pDJghSDEkugtA9m_OA3ov799hJyDEdQNitj+ddf3iow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9pDJghSDEkugtA9m_OA3ov799hJyDEdQNitj+ddf3iow@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C1xYmM3ywdmnhRNt"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--C1xYmM3ywdmnhRNt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 30, 2021 at 08:05:49PM +0100, Peter Maydell wrote:
> On Wed, 26 May 2021 at 10:16, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
> >
> > Coverity checks that the file descriptor return value of open(2) is
> > checked and used. Normally this is helpful in identifying real bugs but
> > vhost-user-blk-test opens /dev/null as stdin and stdout after fork.
> >
> > In this case we don't need to look at the return value because these
> > open(2) calls cannot fail in any reasonable environment. We already kno=
w
> > their return values ahead of time since we closed stdin and stdout
> > previously. open(2) is guaranteed to pick the lowest available fd
> > number.
> >
> > Silence Coverity by introducing code that checks what we already know t=
o
> > be true.
>=20
> > diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user=
-blk-test.c
> > index 8796c74ca4..581e283a03 100644
> > --- a/tests/qtest/vhost-user-blk-test.c
> > +++ b/tests/qtest/vhost-user-blk-test.c
> > @@ -910,14 +910,18 @@ static void start_vhost_user_blk(GString *cmd_lin=
e, int vus_instances,
> >                     storage_daemon_command->str);
> >      pid_t pid =3D fork();
> >      if (pid =3D=3D 0) {
> > +        int fd;
> > +
> >          /*
> >           * Close standard file descriptors so tap-driver.pl pipe detec=
ts when
> >           * our parent terminates.
> >           */
> >          close(0);
> > +        fd =3D open("/dev/null", O_RDONLY);
> > +        g_assert_cmpint(fd, =3D=3D, 0);
> >          close(1);
> > -        open("/dev/null", O_RDONLY);
> > -        open("/dev/null", O_WRONLY);
> > +        fd =3D open("/dev/null", O_WRONLY);
> > +        assert(fd =3D=3D 1);
>=20
>=20
> Why use a different assert type for the two asserts?

Thanks for pointing this out. I will send a v2 that consistently uses
g_assert_cmpint().

Stefan

--C1xYmM3ywdmnhRNt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC2VAYACgkQnKSrs4Gr
c8jrYwf/cBkLUon+wrsYCJU6B91PSv/KTJ717wY/jR8vE1+1QkgI+6jWI6S9DQia
hpT/2/6XNcVpixOZ6jqC1GRj5L6SroPKJXAzX6zEfsrreZEmJtV1LOIk4eNzibH6
HyUcbgEHr+4ydXIxg+p9qFE74uBQ69u1qTeDUKdHEgtB2fSUFcAfcIYkAleWeJvm
KHqpXz5Tsb9duWK1JfMEa+ecgXqCyjYsZhKKgLvub9XGtDA8gNlZqUvSr7x3UNxB
X9sRngpoj7l8TbtqBvQOFqVTgCDKEpdr+LSXSsrEL8HVXKVwIzvcx+4xgYvWs7bb
MFgJ7UBiQWDTlID5Q31pcvK3PG6u/w==
=Atx+
-----END PGP SIGNATURE-----

--C1xYmM3ywdmnhRNt--


