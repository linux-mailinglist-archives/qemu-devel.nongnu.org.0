Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35865382347
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 06:12:23 +0200 (CEST)
Received: from localhost ([::1]:44564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liUc9-0006z6-MA
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 00:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liUa9-0004YA-NJ; Mon, 17 May 2021 00:10:17 -0400
Received: from ozlabs.org ([203.11.71.1]:42081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liUa6-000280-Mx; Mon, 17 May 2021 00:10:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fk5JK1j42z9sWW; Mon, 17 May 2021 14:10:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621224609;
 bh=27DcE6iZaCeFmEqdC/V+07BePuY+u/uE3FVcoS4/zvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lmZAoRt919XoNGjFNh6pDZS52a6Hmc1D6KvraFRblmrW0SPCCQzNgPt+HtJQYmSNC
 fZ+whM0rIQQE73InLbfSV1sTD/CtFa8yb50IpULJpI9tlbydO1ULsT9EW3wL7rEKGS
 LE+hcWgPCIl+N5ovvfEX3xvEFUpHYEzT18uI5aQY=
Date: Mon, 17 May 2021 14:00:38 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH 08/11] target/ppc: wrapped some TCG only logic with
 ifdefs
Message-ID: <YKHqZrd4n1iNZTnG@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-9-bruno.larsen@eldorado.org.br>
 <40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org>
 <4aab8498-580c-cdb3-9c87-b47d5e1ff33d@eldorado.org.br>
 <b5d3e93f-8324-c21f-4ec3-feb162be455b@eldorado.org.br>
 <81666d8f-e261-d13d-3f10-af52ea0edfa9@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qCXjNPv+bll2WOuQ"
Content-Disposition: inline
In-Reply-To: <81666d8f-e261-d13d-3f10-af52ea0edfa9@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qCXjNPv+bll2WOuQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 09:44:36AM -0500, Richard Henderson wrote:
> On 5/14/21 8:29 AM, Bruno Piazera Larsen wrote:
> >=20
> > On 12/05/2021 15:57, Bruno Piazera Larsen wrote:
> > > On 12/05/2021 15:33, Richard Henderson wrote:
> > > > On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> > > > > diff --git a/include/exec/helper-proto.h b/include/exec/helper-pr=
oto.h
> > > > > index ba100793a7..ce287222ee 100644
> > > > > --- a/include/exec/helper-proto.h
> > > > > +++ b/include/exec/helper-proto.h
> > > > > @@ -38,7 +38,9 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1),
> > > > > dh_ctype(t2), dh_ctype(t3), \
> > > > > =A0 #define IN_HELPER_PROTO
> > > > > =A0 =A0 #include "helper.h"
> > > > > +#ifdef CONFIG_TCG
> > > > > =A0 #include "trace/generated-helpers.h"
> > > > > +#endif
> > > > > =A0 #include "accel/tcg/tcg-runtime.h"
> > > > > =A0 #include "accel/tcg/plugin-helpers.h"
> > > >=20
> > > > Um.. this file is exclusively TCG already.
> > > > Are you missing some use of helper_foo()?
> > > A lot of files that we are compiling (mainly mmu-*, excp_helper and
> > > gdbstub IIRC). We could comb through all of them and remove all
> > > declarations of helpers and wrap the inclusion of helper-proto
> > > itself in ifdefs, but it felt unnecessarily long. If it is
> > > preferable, we can do it.
> > >=20
> > So, I just looked and we'd need to change excp_helper.c and
> > mmu-hash64.c, encasing 14 and 8 helper_foo() declarations. Is it better
> > to work on those 2 files, or to change helper-proto?
>=20
> Let's work on excp_helper.c and mmu-hash64.c.
>=20
> For excp_helper.c, ideally everything in there would be tcg related.  Eit=
her
> explicitly as helper_foo() or by being one of the TCGCPUOps functions like
> ppc_cpu_exec_interrupt.
>=20
> For mmu-hash64.c... I guess the easiest thing in the short term is to put
> big ifdefs around helper_slbi{a,e,eg}.  Or they could be moved to
> mmu_helper.c, with slb_lookup declared in mmu-hash64.h.

I think the ifdefs are the lesser evil here.  I created mmu-hash64.*
because I think dividing things by MMU family is much more useful than
dividing by how it fits into the TCG/SOFTMMU model which how things
kind of were done historically (and still are for the many MMU familes
I've never had time or knowledge to rework).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qCXjNPv+bll2WOuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCh6mYACgkQbDjKyiDZ
s5LSSRAAhtld+9CFh4KQbsdZ9A8yBFjg6GgufvCMXTugqX0nYnlGaDqtkxihITG6
qoxiRyk1d/bjFO6JZb5bH3kJSz04m5Gj4zcbbQp/70q8UYwtG6q23JmEqjAclccg
dw4TNbzLtgMGCmfph6bDiykg0ZZ2hBqSItFRiR2+Ym6jtRzsgs53sW0+1DsXky4g
yHye0W005770rqOMizu3YnP9YxY+yD0PQD4DpklBiE8Gz24j7a5YcY7gdXrZ02IV
tx+IR1ook5H+9lZC+/D8FBXB/ygkHoOnKAL8v0EIBG66hCE3LcWk3zbEZfXIFOFD
pwszwFTL92vLsS9uKNvMXcfBQ6Kbjo0zbjKHmTd1AKPwgTjpDr1nT+4qD9AITWph
mZcY6lTGzAXPRM/G1ZfOdXtcdfGaIu7ewr5pmEQ9dSqhZsRqNlMHz6EHYdPvVbgH
obIOytWY4z14XTauIQz/6BU7FAFQQ+hVThnZSCZ1aMBIYfTUJr3sooWjOH8lqkfZ
htLusWNGJrNYtzUTskgS956EijAbqsIKZFAF4QZ+wRcbuvX6rhVcYJHF5o044Yw4
jwhEorcCsx1WvA4YslFVMFpevvp2Rh0dbyX01dDwLxPtAPC93jIHG5Y+TdqYOF+h
htQMxqzL4RUnd5PwxT7kvx54pl68MZwjdAIYLjPY/fUWfs9exes=
=Eii0
-----END PGP SIGNATURE-----

--qCXjNPv+bll2WOuQ--

