Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137DC4CBF69
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:02:42 +0100 (CET)
Received: from localhost ([::1]:45108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPm2S-0002Y4-NG
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:02:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPm0H-0000Nd-Qj
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:00:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPm0D-0001q3-Bb
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646316018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t25P6on/kFjQFy8PZPARYwKdTWa54hMWVt8wt4lOAJ4=;
 b=W584UPaFqRWgJnwT3LNGfJ1pG4evfiE5V8N05coIUBE+g/X1+laVCqowMPcoo2stysdVma
 uTHcjOXs47JJ1aHrEPpRNksGEg/p0vV4G9TYvvh5j2Mc5Ttn/VFCEMfR4ftUjxjwGxgLmZ
 wrxKMpSGfHOc2ArjYdtJhTEoBq1anLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-IDVusmr2Nfy-xLbwwt4I_g-1; Thu, 03 Mar 2022 09:00:13 -0500
X-MC-Unique: IDVusmr2Nfy-xLbwwt4I_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C30078145F7;
 Thu,  3 Mar 2022 14:00:11 +0000 (UTC)
Received: from localhost (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A5717C127;
 Thu,  3 Mar 2022 14:00:03 +0000 (UTC)
Date: Thu, 3 Mar 2022 13:59:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v5 0/4] tls: add macros for coroutine-safe TLS variables
Message-ID: <YiDJxKoUAWjI+7ug@stefanha-x1.localdomain>
References: <20220222140150.27240-1-stefanha@redhat.com>
 <YiCvmr1Ri/kwDCyF@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MtYfv/RHvA6zRXq1"
Content-Disposition: inline
In-Reply-To: <YiCvmr1Ri/kwDCyF@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Florian Weimer <fweimer@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MtYfv/RHvA6zRXq1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 01:07:54PM +0100, Kevin Wolf wrote:
> Am 22.02.2022 um 15:01 hat Stefan Hajnoczi geschrieben:
> > v5:
> > - Added explicit "#include "qemu/coroutine-tls.h" in patch 4 [Philippe]
> > - Updated patch 1 commit description and comments to describe the curre=
nt
> >   noinline plus asm volatile approach [Peter]
> > v4:
> > - Dropped '[RFC]'.
> > - Dropped inline asm for now. -fPIC versions of the code are missing an=
d I
> >   hit several issues including a clang LTO bug where thread local varia=
bles are
> >   incorrectly discarded because inline asm is not analyzed to find symb=
ol
> >   dependencies (Serge Guelton is aware).
> > - Fixed CI failures.
> > v3:
> > - Added __attribute__((weak)) to get_ptr_*() [Florian]
> > - Replace rdfsbase with mov %%fs:0,%0 [Florian]
> >=20
> > This patch series solves the coroutines TLS problem. Coroutines re-ente=
red from
> > another thread sometimes see stale TLS values. This happens because com=
pilers
> > may cache values across yield points, so a value from the previous thre=
ad will
> > be used when the coroutine is re-entered in another thread.
> >=20
> > Serge Guelton developed a portable technique, see the first patch for d=
etails.
> >=20
> > I have audited all __thread variables in QEMU and converted those that =
can be
> > used from coroutines. Most actually look safe to me.
>=20
> Hm, what about the ones in the coroutine implementation itself?
>=20
> static __thread CoroutineUContext leader;
> static __thread Coroutine *current;
>=20
> Both of them are used in qemu_coroutine_self(), which is a
> coroutine_fn, and in qemu_in_coroutine(), which may be called from
> coroutine context.
>=20
> And I seem to remember I've seen crashes related to this in one of the
> bug reports we got, where the stack trace clearly showed that one of
> these functions had returned a wrong result.
>=20
> I'm applying this series anyway, it doesn't make the patches incorrect.
> But it feels incomplete, so we may need a follow-up patch.

Thanks for pointing this out. I will send a patch.

current is always the address of our own Coroutine, regardless of which
thread it's executing in. Using the old value is fine because it's
identical to the new value.

However, if the compiler caches the address of current and loads from
the old address then the value will be wrong.

leader could be stale if LTO inlines multiple calls to
coroutine-ucontext.c functions.

So overall it looks unsafe to me.

Stefan

--MtYfv/RHvA6zRXq1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIgycQACgkQnKSrs4Gr
c8i47wgAtexcpsw1+2GC9nTimDOAp/mqxW9AzIMybILgWgKr9v/jMMWLYls4s+ON
HbRTBGKWtNxqsXGImI+iek4QCbl0Y4ACwkuLhAvYS/sjPhzFqD5G/hz1HhJqF0SI
USVhNRl9H5p7AYj/mxO5FYfb2nCBv0N7ILCzKEemwZ0bi3TYOtwE+0jYSBXwEPZ0
nyqNgVlaHm/h0PPRLrAduk9DGAlpFsFqgs9JEa1SQvPQFROl63jJnHJNhuxGRtwx
sqVdsuZR5PJavmid1ge6YQvdrA40lsCS6V49K4WI+PV7BgmLQFmOHY4QkbztKcy2
pGZEWNm0nw9qLHHVllLz7+rG913TUA==
=hmbc
-----END PGP SIGNATURE-----

--MtYfv/RHvA6zRXq1--


