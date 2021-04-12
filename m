Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9B35C95B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 17:02:43 +0200 (CEST)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVy5K-0005ZX-93
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 11:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVy3Q-0004w5-3E
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:00:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVy3O-0005xB-0i
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618239641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xUx8qIMkhHGJDevWBA83I2Ot+pCTQWBYItZFDO7wU8U=;
 b=QS5MdQTBZrFIhst6YHbRgMbBOwRzszoqXKmSZRSKujrWYZBkcrpiAtv4VUnd4NaasDUQLN
 DHWU+l3KoitwbqbpGIV8AqirRfbL2drlWlwLiej/k2/qQqXLothtbzJJ/iqn3nSxDt41Eo
 57ZORuZawWmVlCxUqSWn05SfuMKNDk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-wYp6kwavNX69LlFm4k9DDg-1; Mon, 12 Apr 2021 11:00:37 -0400
X-MC-Unique: wYp6kwavNX69LlFm4k9DDg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2820A6878;
 Mon, 12 Apr 2021 15:00:35 +0000 (UTC)
Received: from localhost (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44F3D60BD8;
 Mon, 12 Apr 2021 15:00:35 +0000 (UTC)
Date: Mon, 12 Apr 2021 16:00:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: trace_FOO_tcg bit-rotted?
Message-ID: <YHRgkuNwPhiRz6vn@stefanha-x1.localdomain>
References: <87eefnwd0l.fsf@linaro.org>
 <032cba5b-1b8a-ef47-dd3d-6e4caef1223b@vivier.eu>
 <87czv3s9i3.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87czv3s9i3.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KZuCRDh14091mBuN"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: qemu-devel@nongnu.org, matheus.ferst@eldorado.org.br,
 Laurent Vivier <laurent@vivier.eu>,
 =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KZuCRDh14091mBuN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 05:29:08PM +0100, Alex Benn=E9e wrote:
>=20
> Laurent Vivier <laurent@vivier.eu> writes:
>=20
> > Le 06/04/2021 =E0 18:00, Alex Benn=E9e a =E9crit=A0:
> >> Hi,
> >>=20
> >> It's been awhile since I last played with this but I think we are
> >> suffering from not having some test cases for tracing code
> >> generation/execution in the tree. I tried adding a simple trace point =
to
> >> see if I could track ERET calls:
> >>=20
> >> --8<---------------cut here---------------start------------->8---
> >> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> >> index 0b42e53500..0d643f78fe 100644
> >> --- a/target/arm/translate-a64.c
> >> +++ b/target/arm/translate-a64.c
> >> @@ -36,6 +36,7 @@
> >>  #include "exec/log.h"
> >> =20
> >>  #include "trace-tcg.h"
> >> +#include "trace.h"
> >>  #include "translate-a64.h"
> >>  #include "qemu/atomic128.h"
> >> =20
> >> @@ -2302,6 +2303,9 @@ static void disas_uncond_b_reg(DisasContext *s, =
uint32_t insn)
> >>          default:
> >>              goto do_unallocated;
> >>          }
> >> +
> >> +        trace_eret_tcg(s->current_el, dst);
> >> +
> >>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> >>              gen_io_start();
> >>          }
> >> diff --git a/target/arm/trace-events b/target/arm/trace-events
> >> index 41c63d7570..2d4fca16a1 100644
> >> --- a/target/arm/trace-events
> >> +++ b/target/arm/trace-events
> >> @@ -1,5 +1,10 @@
> >>  # See docs/devel/tracing.txt for syntax documentation.
> >> =20
> >> +# translate-a64.c
> >> +# Mode: softmmu
> >> +# Targets: TCG(aarch64-softmmu)
> >> +tcg eret(int current_el, TCGv target_el) "trans_eret: from EL%d", "ex=
ec_eret: EL%d to EL%"PRId64
> >
> > If I read correctly, the name should be eret_tcg()
> > And I'm not sure TCGv will be accepted as a parameter type, use
> > uint64_t instead (and %PRIu64)
>=20
> This was my confusion. I thought the trace-events file was prefixed with
> tcg like guest_mem_before:
>=20
>   vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=3D%d", "vadd=
r=3D0x%016"PRIx64" info=3D%d"
>=20
> and that signalled the tools to generate _trans, _exec and _tcg hooks in
> the generated files. The trace code (see other patch) also has logic to
> translate natural TCG types into the natives types as well signalling
> which values are only visible for the _exec portion.
>=20
> Maybe I'm over thinking this. Perhaps all the TCG tracing use cases are
> just as easily supported with TCG plugins now and we should deprecate
> this unused bit of complexity. I certainly understand the plugin
> interactions better ;-)

Llu=EDs: are you happy to deprecate tcg trace events in favor of TCG
plugins?

My question is whether TCG plugins are really equivalent here. Will TCG
plugin users have to write their own log file output code to extract
this information from the QEMU process (i.e. reinventing tracing)? Is
the performance at least as good as tracing?

Stefan

--KZuCRDh14091mBuN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB0YJIACgkQnKSrs4Gr
c8iOnAf9E/vQ+gqWnJIazfE5CbUpR0PH/agFZ0kcxt9g900InUQQd1/YTb8euFGT
EsKRT7qOwTIzRZkt6LNVFf21x/qAQJEIn+kaxc0ZDKztx9BIJE36bG9hs4K1tM93
1sl0Ekl12YjiFKuUVsMik5EhYAj7NOHC2MajYZKGgrwvWreXGcuocN3qQVKg1hYx
ageXg70d8FT/Ec9t9q9AJf/qFSNTRfzmVKsPFcdYQi+7dlrVzez7768NQRL/vk7a
xJJuJUFJrDmjlYt8J1QpN0TwefXZuhWTdF83FHdA6IWCWhpI4VGnpLgnMG+FzD9x
gTNAzTzVVUB/cRQ3LhHr8d6sB84Wow==
=uGQg
-----END PGP SIGNATURE-----

--KZuCRDh14091mBuN--


