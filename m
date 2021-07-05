Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF73BC1A8
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:28:43 +0200 (CEST)
Received: from localhost ([::1]:33622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RSc-0005b2-SK
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0RPs-0002qt-Bf
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0RPp-0001Wv-Gz
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625502348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHuhQEtD72b/x60uCr118jJJJuK73EYhme+kYKgVNMk=;
 b=UUKs9Oy6ZHf75vvmhu3zwPeV1kn2TPk+nRVUY/DYBR9wxiZ0zFAW0quUogYefBeNaePgpT
 30f+hwqaQydqFLyxT/+yxX7v8S1PgnZgZCXFu+E1LkcQc/XA0tzAkWI9KJYD0Ax1UTH59Z
 kQhUvLb7CbnMn0n44dab9RdwHTsEfcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-sqYKF-D-OWafQu_gq5Y8-w-1; Mon, 05 Jul 2021 12:25:47 -0400
X-MC-Unique: sqYKF-D-OWafQu_gq5Y8-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC5EA18A0F24;
 Mon,  5 Jul 2021 16:25:45 +0000 (UTC)
Received: from localhost (ovpn-114-164.ams2.redhat.com [10.36.114.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D8D960583;
 Mon,  5 Jul 2021 16:25:45 +0000 (UTC)
Date: Mon, 5 Jul 2021 17:25:43 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PULL 0/2] Libslirp patches
Message-ID: <YOMyh9fu5ZEAlGHN@stefanha-x1.localdomain>
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
 <CAJ+F1CK-S+diFf8fGXe-Drfz6JoNSXzxzmYQ6muRuQw76TRHkA@mail.gmail.com>
 <CAFEAcA9x3w3jvbGoZ66Xs2dhgJDnkyDVnqy45tpCjYv1uq0vYQ@mail.gmail.com>
 <CAJ+F1CLxaLHgLCM=7V=uaGyBSpCMqrD-Ktn2UsiNQHf8=CWNfg@mail.gmail.com>
 <CAFEAcA_kTthg=Y3152r4+eN=iunZy3vGq9J9vFKTog1rmsHsfA@mail.gmail.com>
 <CAJ+F1C+H7aw+_2+FspPv0nLtfbM=anBrhCaBWVYVhP6o8nqSDg@mail.gmail.com>
 <4b3021c2-ac50-d763-4113-10a200bdc9ac@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4b3021c2-ac50-d763-4113-10a200bdc9ac@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9fQyG8qGrNC/PE8W"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--9fQyG8qGrNC/PE8W
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 05, 2021 at 12:31:01PM +0200, Philippe Mathieu-Daud=E9 wrote:
> +Richard/Stefan for "atomic" error.
...
> > [2363/9207] Linking target qemu-system-aarch64
> > FAILED: qemu-system-aarch64
> > clang++ @qemu-system-aarch64.rsp
> > libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
> > `helper_atomic_cmpxchgq_le_mmu':
> > /tmp/tmp.VkWONZ62bA/build/../accel/tcg/atomic_template.h:86: undefined
> > reference to `__atomic_compare_exchange_8'
> > libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
> > `helper_atomic_xchgq_le_mmu':
> > /tmp/tmp.VkWONZ62bA/build/../accel/tcg/atomic_template.h:134: undefined
> > reference to `__atomic_exchange_8'
> > libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
> > `helper_atomic_fetch_addq_le_mmu':

According to docs/devel/atomics.rst:

  These operations are polymorphic; they operate on any type that is as
  wide as a pointer or smaller.

It looks like the compiler doesn't support 8-bit atomics here?

Stefan

--9fQyG8qGrNC/PE8W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDjMocACgkQnKSrs4Gr
c8gr+QgApVilV2PK2t2/t9ORYmtEOF1/6GydL6HLFGuDQjK4rOMGRUCPFbzq7bK+
E8rMh/kDVdhIde+1Jj8Zbd2sAg4zfcSy+K/qDvAukUQgb2QagfW/4vrrRLriAFQO
zpiR5vJAQUs8QKzfA+Mlb/DjRcQfutow4JJeDYF0IPIG7YDtyN1g/XvZXdMGz3Od
qt8sdIU1CmsEvaTd6tNa2A2HwFUARWm71APxGvwdOlyqbvPhK7CcqXW0/eK8DWHi
+FudeReceruSIINQQe4IPX/Nj0WETLqEKSqw2cnRKpFveV73loQMEWeTzROj8lJl
xYJZXxkQTB8CYlXNUHy7+p/+mrxdFQ==
=X9BA
-----END PGP SIGNATURE-----

--9fQyG8qGrNC/PE8W--


