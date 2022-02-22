Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F004BF982
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 14:34:53 +0100 (CET)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMVJc-00019X-2H
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 08:34:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMVB6-0004t0-DY
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:26:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMVB2-0006uP-Op
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645536360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=31kPzqgOQwg446LhFg8ucOW9NW+H3bfnkRHQ7OGFDS4=;
 b=Nud5/MnCn6JxplSRgQQOOIG9pfub5mmelCd84n1bgk4oAihqjqADNECoBo+L1DH3htB0eu
 +CITu8g6nmIgooj5Twpmhok1CXv5LgVT7WecLMzcb2GtEQkvEUcMVbdgYKdJka1HKsezc/
 VfNxs2WSs0ft4cl+hE86f9HvuaHMxug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-iwl3oXSePgCRxouOlw9o8g-1; Tue, 22 Feb 2022 08:25:56 -0500
X-MC-Unique: iwl3oXSePgCRxouOlw9o8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B02E835DE0;
 Tue, 22 Feb 2022 13:25:55 +0000 (UTC)
Received: from localhost (unknown [10.39.195.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61D817BCCB;
 Tue, 22 Feb 2022 13:25:46 +0000 (UTC)
Date: Tue, 22 Feb 2022 13:25:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v4 4/4] cpus: use coroutine TLS macros for iothread_locked
Message-ID: <YhTkWZCdHvSOTZsy@stefanha-x1.localdomain>
References: <20220221142907.346035-1-stefanha@redhat.com>
 <20220221142907.346035-5-stefanha@redhat.com>
 <33126ecf-e70d-ce9f-1933-af781b5dc166@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5mGxn91M0MLI2tvr"
Content-Disposition: inline
In-Reply-To: <33126ecf-e70d-ce9f-1933-af781b5dc166@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5mGxn91M0MLI2tvr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 04:09:06PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 21/2/22 15:29, Stefan Hajnoczi wrote:
> > qemu_mutex_iothread_locked() may be used from coroutines. Standard
> > __thread variables cannot be used by coroutines. Use the coroutine TLS
> > macros instead.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   softmmu/cpus.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> > index 035395ae13..005a5c31ef 100644
> > --- a/softmmu/cpus.c
> > +++ b/softmmu/cpus.c
> > @@ -473,11 +473,11 @@ bool qemu_in_vcpu_thread(void)
> >       return current_cpu && qemu_cpu_is_self(current_cpu);
> >   }
> > -static __thread bool iothread_locked =3D false;
> > +QEMU_DEFINE_STATIC_CO_TLS(bool, iothread_locked)
>=20
> While "qemu/coroutine-tls.h" is indirectly included by "rcu.h",
> please include it explicitly.

Thanks, will fix.

Stefan

--5mGxn91M0MLI2tvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIU5FkACgkQnKSrs4Gr
c8g4vAf9FYPhvNMOUwoJX7bxZr1fSbOER4T03JQxLMxMH5mbEXmuVkxZjcAjivSX
ygK5sCvuQHzCB6QHDi+txki9OKcEU7iJImpsEjmJU/jx4hqXZaJju3j8xcmPtW5X
I/5kfC5bNnhNRktE0Moy6Yp/SjTxBF/T8RWUWSXzseIka5uuQ6px9YRxJOS+i5O3
V4Lnu8EtDQU4yPsiaGyALZk4mCpyf7kUFLo6HPcCDdTBPkRfYmcodykl0POKm46a
RGmJKRc0beOKaM4NAex8JqSKMrifVICgTqLfNTDZkqNBnPlY+hvF7+O+e3KMgg5O
tkP7wyjmlqNFXz+WzcafH7QrYyK7Zw==
=NZn0
-----END PGP SIGNATURE-----

--5mGxn91M0MLI2tvr--


