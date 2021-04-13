Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0593535DA3D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:43:09 +0200 (CEST)
Received: from localhost ([::1]:50538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEdY-0008RE-4o
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWEU7-0001K2-20
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:33:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWEU3-0005Xw-Kx
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618302798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BWifntW60jiyeJq76Iy7n/COMlajPO3QsaaLcaTDJSo=;
 b=MP+FEggMPCMLuZiIBCCZv4yMVlBeEDQU7G8srbzktkGMeGAgAesO9kvupJyN0CEc2NAOJv
 ss6cUIvpogD5Qo8z2JyP2gUls7UWsrxRAAXkbHzAyEGsOcPXH2iV8X+4XQQPvhoBOIySrF
 1KX7zjFM7grrU/b/QUasUQ28f/dOunE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-uqAkrJ74OFCgOqwqmRiQZw-1; Tue, 13 Apr 2021 04:33:16 -0400
X-MC-Unique: uqAkrJ74OFCgOqwqmRiQZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37A9C6D24A;
 Tue, 13 Apr 2021 08:33:14 +0000 (UTC)
Received: from localhost (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8860860C5F;
 Tue, 13 Apr 2021 08:33:13 +0000 (UTC)
Date: Tue, 13 Apr 2021 09:33:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: trace_FOO_tcg bit-rotted?
Message-ID: <YHVXSJs6JpCnSvqw@stefanha-x1.localdomain>
References: <87eefnwd0l.fsf@linaro.org>
 <032cba5b-1b8a-ef47-dd3d-6e4caef1223b@vivier.eu>
 <87czv3s9i3.fsf@linaro.org>
 <YHRgkuNwPhiRz6vn@stefanha-x1.localdomain>
 <87r1jfmhnr.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87r1jfmhnr.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wiRjncqQ6piG0i3g"
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

--wiRjncqQ6piG0i3g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 08:06:57PM +0100, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > On Fri, Apr 09, 2021 at 05:29:08PM +0100, Alex Benn=E9e wrote:
> >>=20
> >> Laurent Vivier <laurent@vivier.eu> writes:
> >>=20
> >> > Le 06/04/2021 =E0 18:00, Alex Benn=E9e a =E9crit=A0:
> >> >> Hi,
> >> >>=20
> >> >> It's been awhile since I last played with this but I think we are
> >> >> suffering from not having some test cases for tracing code
> >> >> generation/execution in the tree. I tried adding a simple trace poi=
nt to
> >> >> see if I could track ERET calls:
> >> >>=20
> >> >> --8<---------------cut here---------------start------------->8---
> >> >> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.=
c
> >> >> index 0b42e53500..0d643f78fe 100644
> >> >> --- a/target/arm/translate-a64.c
> >> >> +++ b/target/arm/translate-a64.c
> >> >> @@ -36,6 +36,7 @@
> >> >>  #include "exec/log.h"
> >> >> =20
> >> >>  #include "trace-tcg.h"
> >> >> +#include "trace.h"
> >> >>  #include "translate-a64.h"
> >> >>  #include "qemu/atomic128.h"
> >> >> =20
> >> >> @@ -2302,6 +2303,9 @@ static void disas_uncond_b_reg(DisasContext *=
s, uint32_t insn)
> >> >>          default:
> >> >>              goto do_unallocated;
> >> >>          }
> >> >> +
> >> >> +        trace_eret_tcg(s->current_el, dst);
> >> >> +
> >> >>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> >> >>              gen_io_start();
> >> >>          }
> >> >> diff --git a/target/arm/trace-events b/target/arm/trace-events
> >> >> index 41c63d7570..2d4fca16a1 100644
> >> >> --- a/target/arm/trace-events
> >> >> +++ b/target/arm/trace-events
> >> >> @@ -1,5 +1,10 @@
> >> >>  # See docs/devel/tracing.txt for syntax documentation.
> >> >> =20
> >> >> +# translate-a64.c
> >> >> +# Mode: softmmu
> >> >> +# Targets: TCG(aarch64-softmmu)
> >> >> +tcg eret(int current_el, TCGv target_el) "trans_eret: from EL%d", =
"exec_eret: EL%d to EL%"PRId64
> >> >
> >> > If I read correctly, the name should be eret_tcg()
> >> > And I'm not sure TCGv will be accepted as a parameter type, use
> >> > uint64_t instead (and %PRIu64)
> >>=20
> >> This was my confusion. I thought the trace-events file was prefixed wi=
th
> >> tcg like guest_mem_before:
> >>=20
> >>   vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=3D%d", "v=
addr=3D0x%016"PRIx64" info=3D%d"
> >>=20
> >> and that signalled the tools to generate _trans, _exec and _tcg hooks =
in
> >> the generated files. The trace code (see other patch) also has logic t=
o
> >> translate natural TCG types into the natives types as well signalling
> >> which values are only visible for the _exec portion.
> >>=20
> >> Maybe I'm over thinking this. Perhaps all the TCG tracing use cases ar=
e
> >> just as easily supported with TCG plugins now and we should deprecate
> >> this unused bit of complexity. I certainly understand the plugin
> >> interactions better ;-)
> >
> > Llu=EDs: are you happy to deprecate tcg trace events in favor of TCG
> > plugins?
> >
> > My question is whether TCG plugins are really equivalent here. Will TCG
> > plugin users have to write their own log file output code to extract
> > this information from the QEMU process (i.e. reinventing tracing)?
>=20
> Yes - although there is no reason we couldn't expose the trace output as
> a helper. Currently there is:
>=20
>   /**
>    * qemu_plugin_outs() - output string via QEMU's logging system
>    * @string: a string
>    */
>   void qemu_plugin_outs(const char *string);
>=20
> which allows the user to echo to the log in conjunction with -d plugin
> on the command line. Plugins are of course free to do there own thing.
>=20
> > Is
> > the performance at least as good as tracing?
>=20
> Well like all things that depends ;-)
>=20
> Generally on the sort of events you tend to trace (like the example
> memory access) you usually either want to aggregate or filter your
> results. With trace output their is no way to do this and you end up
> post processing potentially very large files (smaller if you use the
> non-default binary format). I don't know if a similar thing is possible
> with uprobes and ebpf - I've only ever used the simple logging output in
> anger. The example plugins generally do things like count total
> accesses:
>=20
>   https://gitlab.com/qemu-project/qemu/-/blob/master/tests/plugin/mem.c
>=20
> (pretty fast in comparison to writing out reams of data)
>=20
> or aggregate the results:
>=20
>   https://gitlab.com/qemu-project/qemu/-/blob/master/contrib/plugins/hotp=
ages.c
>=20
> (probably slower while running QEMU, but faster overall because no post
> processing of log files required.)
>=20
> Of course plugins are a non-default build option because although light
> it does have a small performance impact on code generation even when no
> instrumentation is occurring. As a result you can't use it without
> building a version first.
>=20
> If we had test code in the build that used the TCG tracing abilities I
> wouldn't worry because at least we are defending the feature and we
> wouldn't run into problems like the above. At least if plugins get
> broken we'll know about it due to the fairly thorough workout on CI, e.g.=
:
>=20
>   https://gitlab.com/qemu-project/qemu/-/jobs/1172484753#L3458

I can see the trade-offs being acceptable for TCG instrumentation use
cases. There is a lot of overlap between the two approaches and if Llu=EDs
agrees we could remove the TCG trace event functionality in favor of TCG
plugins. If any documentation is missing to explain how to solve these
types of problems using TCG plugins then that should be added.

That said, I haven't used the TCG trace event functionality and maybe
I'm missing something obvious that Llu=EDs will point out :).

Stefan

--wiRjncqQ6piG0i3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB1V0gACgkQnKSrs4Gr
c8gsbQf/XkieqGm2NU2cCVF4QwzfY4TFQWySEzocINxSdSEuAYfSapOAqZw5FQwa
Uor9N8CyG9/2OEbr3E6mctcYaZZgQ2cL81wuhaUxX7B5b4pEuHTiCCfyNPExQNxg
uWVMwnr5jRTXI8zq/OEU7maFwYDBdwxGx+pZWx3MdXcXVpPs5KBzkCfc79nC/pxe
LL9OVRO5RwM2tOxcx9EHT/pvyIMdTbO2ub0i0sHxB6o0Y3cM8dDPiie7dPV2Jtxm
+5KYufmo12wcF12Jt5+NxvzmrrQJs1FmCa5OtjJTNww3JRPKZyEnBdXBpxd2DwZp
7jt4DaNfdoSFSipen/IYwJjO4TPVSg==
=4A+Y
-----END PGP SIGNATURE-----

--wiRjncqQ6piG0i3g--


