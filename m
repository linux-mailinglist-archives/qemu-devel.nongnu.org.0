Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95C466464
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 14:17:57 +0100 (CET)
Received: from localhost ([::1]:52178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mslyG-0000Uf-Bz
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 08:17:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mslqZ-000492-DF
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 08:09:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mslqU-0002qu-SV
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 08:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638450593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VJFmFgZWijjqZ1vLiWqCNq53yRJ3jve1LaxzjyofiCY=;
 b=UL0RQyWQww+mLAAcGXnKXNBX13LQg9NW28TzW2/GzciyPkIZf0V4fjjkREf3rr2w3ALOdR
 Bkv7gWJQL7I5bvR8Gy/UrCODTjfSaykh25MSwpx1Br7x/IhED0pbqX/UeUcWgtyJtjc6I2
 Y2WmbpMWk/+9zcowor1PDGA9sSJ3peI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-7ReE4e9dOsqwug8aZHM3ew-1; Thu, 02 Dec 2021 08:09:49 -0500
X-MC-Unique: 7ReE4e9dOsqwug8aZHM3ew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 569761017975;
 Thu,  2 Dec 2021 13:09:27 +0000 (UTC)
Received: from localhost (unknown [10.39.195.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48D4A5F4E7;
 Thu,  2 Dec 2021 13:09:26 +0000 (UTC)
Date: Thu, 2 Dec 2021 09:53:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [RFC v2 1/4] tls: add macros for coroutine-safe TLS variables
Message-ID: <YaiXqkhGy6X7/jYw@stefanha-x1.localdomain>
References: <20211201170120.286139-1-stefanha@redhat.com>
 <20211201170120.286139-2-stefanha@redhat.com>
 <87h7bs6v4u.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87h7bs6v4u.fsf@oldenburg.str.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6k52yperlv9oiYuO"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.719, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6k52yperlv9oiYuO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 07:24:33PM +0100, Florian Weimer wrote:
> * Stefan Hajnoczi:
>=20
> > +#elif defined(__x86_64__)
> > +#define QEMU_CO_TLS_ADDR(ret, var)                              \
> > +    asm volatile("rdfsbase %0\n\t"                              \
> > +                 "lea "#var"@tpoff(%0), %0" : "=3Dr"(ret))
> > +#endif
>=20
> RDFSBASE needs quite recent kernels.  I think you should use
>=20
>   movq %%fs:0, %0
>=20
> instead, which is equivalent for the x86-64 psABI.

Nice trick! I remember reading that the address of the thread data is
stored in the first element of the thread data itself, so this makes
sense :).

Stefan

--6k52yperlv9oiYuO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGol6oACgkQnKSrs4Gr
c8iRkwgAw7jsrVxpQZ3JOnD4YDBvXZrlt9FjnsT+e7KNbPiIFmv64y7TXU3fbFe8
usTM6mcqIpZmtTvmBBxB3JYHibaYtV+9nsa2RS6iy4RbCUbVL0P8JucQ3WV5TcdU
lv8eb69ylAIJXa7BZ5lNCFXBan2hXwxK02GHw+XU4RG0UOhsfswsz3aRJGk4fRpV
ZSd6Gr+7iaIeGCDivAewB4UQRBiZpGiP1KLXyvQ/AX125N9rc/8hvLXE5OdYWF67
JX3y9VZOX9RORjxP/eqouv+PVBWX99pL+rjnfw3dj5qHcxnM2cTTGaiotx1GfZZB
UiWQA1J4ucClyQH/mEkiFYTjhFhhoA==
=Yvk4
-----END PGP SIGNATURE-----

--6k52yperlv9oiYuO--


