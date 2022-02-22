Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0FE4BF9C5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 14:49:03 +0100 (CET)
Received: from localhost ([::1]:59020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMVXJ-0005bE-Ob
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 08:49:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMVSr-0002sp-FA
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:44:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMVSj-0001da-0X
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645537454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w7YOik7Cd8HMXLfYHgyBt3/nMDch9NuXSl9gUxg6UHs=;
 b=MgG4zsbYa9gSjDd4pFVy/qo0T66oSYL04RNpOV8Vm9udwy4mKVQFfKhuDgmWZKYCgQzt07
 enBPUPWT3JDyCzsHkQA466J3uAnCzHpJrb+JjMt7FwRoh2OBBzSAH3/3Dl0PVIk0F30gqW
 jQuTFDFPYz7lq4OBCDOKIgwrdgYZTHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-4QULIFP0OXO12hZ0zaFzsw-1; Tue, 22 Feb 2022 08:44:13 -0500
X-MC-Unique: 4QULIFP0OXO12hZ0zaFzsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11D801006AA5;
 Tue, 22 Feb 2022 13:44:12 +0000 (UTC)
Received: from localhost (unknown [10.39.195.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB274797E3;
 Tue, 22 Feb 2022 13:44:10 +0000 (UTC)
Date: Tue, 22 Feb 2022 13:44:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 1/4] tls: add macros for coroutine-safe TLS variables
Message-ID: <YhToqZ/nlq/t67gn@stefanha-x1.localdomain>
References: <20220221142907.346035-1-stefanha@redhat.com>
 <20220221142907.346035-2-stefanha@redhat.com>
 <CAFEAcA-4p1rrDY3ynmwwYWpkeSqNEv2ak1fM2CYLbTddXOevjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Wv+lJej4ZTAz/AqR"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-4p1rrDY3ynmwwYWpkeSqNEv2ak1fM2CYLbTddXOevjA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Wv+lJej4ZTAz/AqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 03:16:22PM +0000, Peter Maydell wrote:
> On Mon, 21 Feb 2022 at 14:29, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > Compiler optimizations can cache TLS values across coroutine yield
> > points, resulting in stale values from the previous thread when a
> > coroutine is re-entered by a new thread.
> >
> > Serge Guelton developed an __attribute__((noinline)) wrapper and tested
> > it with clang and gcc. I formatted his idea according to QEMU's coding
> > style and wrote documentation.
>=20
> The commit message says "attribute noinline" but the code
> opts for "attribute noinline plus asm-volatile barrier":
>=20
> > +/*
> > + * To stop the compiler from caching TLS values we define accessor fun=
ctions
> > + * with __attribute__((noinline)) plus asm volatile("") to prevent
> > + * optimizations that override noinline. This is fragile and ultimatel=
y needs
> > + * to be solved by a mechanism that is guaranteed to work by the compi=
ler (e.g.
> > + * stackless coroutines), but for now we use this approach to prevent =
issues.
> > + */
>=20
> I thought we'd determined previously that noinline + asm-volatile wasn't
> sufficient?
>=20
> https://lore.kernel.org/qemu-devel/YbdUDkTkt5srNdW+@stefanha-x1.localdoma=
in/
>=20
> This version of the patchset does seem to include the asm input operand
> you describe there (in one of the three wrappers, anyway), but if that's
> necessary then we should document it in the comment here.

Sorry, the message/comments are outdated. I'll change them to reflect
the current approach.

Stefan

--Wv+lJej4ZTAz/AqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIU6KgACgkQnKSrs4Gr
c8hlQQgAhKiZpbh9i2ghRq178g4o7tG8Zcbzz2A+zJ9mRZVJmzwyUeDXV2G/RzbU
qQ2q4+Ghvpyt8NyQFsUjJVdwF6c5RhUK5n3NuQoHId4FpAv7c5UvxSFV9Z9yS8Uh
XeZxhkoC6q+ueETfgZBbOaabhy2t05eNe3GgRfnSvc88beSk4+0u1JwuSbk9zqFb
+mG3iy0cyTL8ZeCuL6YND765blUWeMhSNYPB+BkJL7J7iAPeZYUedFxD3BDzG80t
dKmUgdpEYwtSin33BpZvaq3tctVJY7hbFV/bs+YqObYBd5TJjfois706jT1ySSmZ
tvjbrreUTracyv8Jpvkj/EP0VDD6Wg==
=OgxX
-----END PGP SIGNATURE-----

--Wv+lJej4ZTAz/AqR--


