Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23743B335
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 15:33:12 +0200 (CEST)
Received: from localhost ([::1]:47150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfMZj-0004Ek-Ec
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 09:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfMWv-0002pQ-Cj
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfMWs-0005ni-08
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635255012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZqEu0SeUInyUrcY4Twe704Ja3bO16BF0Wf0EeoL2QiU=;
 b=A21RcuuyFhCOsAiEkGXUg/OEQ8RyXvSg+iQfO8W8bLKLEZQfsxGyPIOz6b7xaPWTI3R4Tn
 TBQ3qB0jU/9wgIdxjazrabdDc46V0Kr7Vz+MYNtbcZZtRJ3OOeB5MJ4iJKEUpi8IlRktqS
 gydSZLXTwi+4CTr7GNUFEO6yXsmE68Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-P3Rk9Yl-O--wfWp3c4zIqg-1; Tue, 26 Oct 2021 09:30:08 -0400
X-MC-Unique: P3Rk9Yl-O--wfWp3c4zIqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A14DE8144EA;
 Tue, 26 Oct 2021 13:30:02 +0000 (UTC)
Received: from localhost (unknown [10.39.195.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B93E860FFD;
 Tue, 26 Oct 2021 13:30:01 +0000 (UTC)
Date: Tue, 26 Oct 2021 14:30:00 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC 1/2] tls: add macros for coroutine-safe TLS variables
Message-ID: <YXgC2N+sc76WNhLE@stefanha-x1.localdomain>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <20211025140716.166971-2-stefanha@redhat.com>
 <fea06711-f4dd-9932-5b2d-06a408c7adf6@linaro.org>
MIME-Version: 1.0
In-Reply-To: <fea06711-f4dd-9932-5b2d-06a408c7adf6@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JvPs4EL5PdP3A9jS"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--JvPs4EL5PdP3A9jS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 10:19:04AM -0700, Richard Henderson wrote:
> On 10/25/21 7:07 AM, Stefan Hajnoczi wrote:
> > Compiler optimizations can cache TLS values across coroutine yield
> > points, resulting in stale values from the previous thread when a
> > coroutine is re-entered by a new thread.
> ...
> >   include/qemu/tls.h | 142 ++++++++++++++++++++++++++++++++++++++++++++=
+
>=20
> Better as qemu/coroutine-tls.h, since it is needed for no other purpose.
>=20
> > +#define QEMU_DEFINE_TLS(type, var) \
> > +    __thread type qemu_tls_##var; \
> > +    type get_##var(void) { return qemu_tls_##var; } \
> > +    void set_##var(type v) { qemu_tls_##var =3D v; }
>=20
> You might as well make the variable static, since it may only be referenc=
ed
> by these two functions.

Oops, that's a bug. It should be declared extern. QEMU_DEFINE_TLS() is
meant for use in header files.

>=20
> > +#define QEMU_DEFINE_STATIC_TLS(type, var) \
> > +    static __thread type qemu_tls_##var; \
> > +    static __attribute__((noinline)) type get_##var(void); \
> > +    static type get_##var(void) { return qemu_tls_##var; } \
> > +    static __attribute__((noinline)) void set_##var(type v); \
> > +    static void set_##var(type v) { qemu_tls_##var =3D v; }
>=20
> You don't need separate function declarations; you can fold them together=
.
>=20
> If would be nice to inline this when possible,
>=20
> #if defined(__aarch64__)
> #define QEMU_COROUTINE_TLS_ADDR(RET, VAR)                       \
>     asm volatile("mrs %0, tpidr_el0\n\t"                        \
>                  "add %0, %0, #:tprel_hi12:"#VAR", lsl #12\n\t" \
>                  "add %0, %0, #:tprel_lo12_nc:"#VAR             \
>                  : "=3Dr"(RET))
> #elif defined(__powerpc64__)
> #define QEMU_COROUTINE_TLS_ADDR(RET, VAR)                       \
>     asm volatile("addis %0,13,"#VAR"@tprel@ha\n\t"              \
>                  "add   %0,%0,"#VAR"@tprel@l"                   \
>                  : "=3Dr"(RET))
> #elif defined(__riscv)
> #define QEMU_COROUTINE_TLS_ADDR(RET, VAR)                       \
>     asm volatile("lui  %0,%%tprel_hi("#VAR")\n\t"               \
>                  "add  %0,%0,%%tprel_add("#VAR")\n\t"           \
>                  "addi %0,%0,%%tprel_lo("#VAR")"                \
>                  : "=3Dr"(RET))
> #elif defined(__x86_64__)
> #define QEMU_COROUTINE_TLS_ADDR(RET, VAR)                       \
>     asm volatile("mov %%fs:"#VAR"@tpoff, %0" : "=3Dr"(RET))
> #endif
>=20
> #ifdef QEMU_COROUTINE_TLS_ADDR
> #define QEMU_COROUTINE_TLS_DECLARE(TYPE, VAR)                   \
>     extern __thread TYPE co_tls_##VAR;                          \
>     static inline TYPE get_##VAR(void)                          \
>     { TYPE *p; QEMU_COROUTINE_TLS_ADDR(p, co_tls_##VAR); return *p; } \
>     static inline void set_##VAR(TYPE v)                        \
>     { TYPE *p; QEMU_COROUTINE_TLS_ADDR(p, co_tls_##VAR); *p =3D v; }
> #else
>     etc
> #endif

Nice. That makes me wonder if it's possible to write a portable version:

  static inline TYPE get_##VAR(void) \
  { volatile TYPE *p =3D &co_tls_##VAR; return *p; }

But the trouble is we need &co_tls_##VAR to be "volatile" and I don't
think there is a way to express that?

Stefan

--JvPs4EL5PdP3A9jS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF4AtgACgkQnKSrs4Gr
c8hrNggAsKRQXpIwzSn/9X07ao+Ci4Zxl+zJmDsGYON+771V5RB6hS6wgGVRka7q
8Mb6NTNFay5Rmr+jrJGpAghTi0k03amZlSUQCsGOIPhfMFyRinaS6xB5cYr/NWg3
5AU0+K8E+lHdIppmv33fvrvXgCu/rDMdjof96d0SlAoJpP5Q3Uhh4jBVmd7N/lRS
Q+zJoKgfHi9ojEK2kVPHz3GpAYfGfQquLJKWyFWeYEgT1MhgzdQ6S28RxnYKeYMA
ixkSeyDtq+k2qjegr2/ct4RHCsq4aJD6xn42l5U5oiDth24a0v5dV4Dx680ULRWJ
rmsrq/i48jUNL+ZYaX4QoAbiGQiAHg==
=eJrE
-----END PGP SIGNATURE-----

--JvPs4EL5PdP3A9jS--


