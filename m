Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092C533343B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:11:48 +0100 (CET)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqCI-00050S-J9
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAW-0003Md-20; Tue, 09 Mar 2021 23:09:56 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40853 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAT-0003qZ-67; Tue, 09 Mar 2021 23:09:55 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJW52CP2z9sWL; Wed, 10 Mar 2021 15:09:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349377;
 bh=MMNcaLH+e+VRnDa5zNm2J8ZRbtY7sAMiIMfw5fWCPf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sem4zH7ywUZoqeOGnbHZpU7pCFGzPHMIGxXtkJtlQAqt+mzi8aC3qS639xf7WH8NC
 MplzhZavfG++8bGCBwk0l7HpTWO8oOU0ww60aUfyKVz+tW/A3T6TCZtjMtJ5NcwcRb
 xpLbIJn4sgLzMl6haM7DWbsSVHihIRLSHYqVHCWY=
Date: Wed, 10 Mar 2021 13:40:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v14] spapr: Implement Open Firmware client interface
Message-ID: <YEgxqV0pNPmBZrIk@yekko.fritz.box>
References: <20210224054130.4540-1-aik@ozlabs.ru>
 <YD2yd42dv/7/m94f@yekko.fritz.box>
 <08781378-b4ba-12bf-2ae8-f3da9db9342c@ozlabs.ru>
 <YEcHxEvVPPO85BGE@yekko.fritz.box>
 <19bc153a-027c-d5ca-6849-ae33315c62af@ozlabs.ru>
 <d7edd653-4923-fea5-e14-cd4ab871e324@eik.bme.hu>
 <80852df2-667a-871f-1f6a-e74723117e01@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0a/FGs4bPoW5Ayxx"
Content-Disposition: inline
In-Reply-To: <80852df2-667a-871f-1f6a-e74723117e01@ozlabs.ru>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0a/FGs4bPoW5Ayxx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 12:55:07PM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 10/03/2021 01:00, BALATON Zoltan wrote:
> > On Tue, 9 Mar 2021, Alexey Kardashevskiy wrote:
> > > On 09/03/2021 16:29, David Gibson wrote:
> > > > > > > +struct ClientArchitectureSupportClass {
> > > > > > > +=A0=A0=A0 InterfaceClass parent;
> > > > > > > +=A0=A0=A0 target_ulong (*cas)(CPUState *cs, target_ulong vec=
);
> > > > > > > +=A0=A0=A0 void (*quiesce)(void);
> > > > > >=20
> > > > > > Is there actually any real connection of quiesce behaviour to c=
as
> > > > > > behaviour?=A0 Basically, I'm wondering if this is not so much a=
bout
> > > > > > client-architecture-support fundamentally as just about
> > > > > > machine-specific parts of the VOF behaviour.=A0 Which would be =
fine, but
> > > > > > suggests a different name for the interface.
> > > > >=20
> > > > > The most canonical way would be having 2 interfaces.
> > > >=20
> > > > Why?=A0 I don't see any reason these shouldn't be a single interfac=
e, it
> > > > just has a bad name.
> > >=20
> > > I renamed it to SpaprVofInterface for now.
> > >=20
> > >=20
> > > > [snip]
> > > > > > > +typedef int size_t;
> > > > > > > +typedef void client(void);
> > > > > > > +
> > > > > > > +/* globals */
> > > > > > > +extern void _prom_entry(void); /* OF CI entry point
> > > > > > > (i.e. this firmware) */
> > > > > > > +
> > > > > > > +void do_boot(unsigned long addr, unsigned long r3,
> > > > > > > unsigned long r4);
> > > > > > > +
> > > > > > > +/* libc */
> > > > > > > +int strlen(const char *s);
> > > > > > > +int strcmp(const char *s1, const char *s2);
> > > > > > > +void *memcpy(void *dest, const void *src, size_t n);
> > > > > > > +int memcmp(const void *ptr1, const void *ptr2, size_t n);
> > > > > > > +void *memmove(void *dest, const void *src, size_t n);
> > > > > > > +void *memset(void *dest, int c, size_t size);
> > > > > > > +
> > > > > > > +/* Prom */
> > > > > > > +typedef unsigned long prom_arg_t;
> > > > > > > +int call_prom(const char *service, int nargs, int nret, ...);
> > > > > >=20
> > > > > > AIUI this isn't so much about calling the PROM, since this *is*=
 the
> > > > > > PROM code, but rather about calling the parts that are implemen=
ted on
> > > > > > the qemu side.=A0 Different names might clarify that.
> > > > >=20
> > > > > "call_ci"?
> > > >=20
> > > > Works for me.
> > >=20
> > > call_ci() it is then.
> > >=20
> > > About builtins such as memcmp() - turns out these are not really
> > > builtins as they are not inlined and gcc/ld still want to link
> > > against libc which is trickier for such firmware (not quite sure how
> > > to do this and keep it small and not pull other libc stuff in), gcc
> > > just knows about them a bit more. This is different from, for
> > > example, __builtin_ctz which is inlined. So I am keeping my libc.o
> > > for now.
> >=20
> > Do they really want libc or they are in libgcc for which there's
> > --static-libgcc I think to avoid needing it in runtime but not sure what
> > clang has for these.
>=20
> I was getting "unresolved symbol `memcmp`" when I tried calling memcmp() =
or
> __builtin_memcmp() and "-lc" did not help (installed some multilib packag=
es,

Yeah, you'll need -lgcc rather than -lc, libgcc is the one with the
builtin helpers.

> did not help either). I figured if I cannot get it compile in 3 minutes, I
> should not probably be posting this and better off simply keeping the
> existing small libc.

Fair point.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0a/FGs4bPoW5Ayxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBIMaMACgkQbDjKyiDZ
s5KDfQ//awY01ePExEISlmEZPsIhbxiHijcSul+Kh4rMmHaPE2kEU+Izp496/CSg
cxyjKS0UOXJEb/1QURFDUxUJMQyOlyeNh1aysyMKqGOccpLM5WIhQVGAq1+51oOP
QQ5wNj5i4+7BAvK9MkM/uAmhKCqa7Zsehuf1mSIO+L59X6WlxAlconyAwcamNfU6
0VlBfNiENw8oWtaXnlWCZH/wfWr5FVBms9qGJX9sq1FnF4Mf6otUlyIGEsxmqjJI
HPuC5MrpU64s/WwSeHfnEmC/k+2e5okoiCyURipO4AWwcCOBq92RF1cd83ZuaH/j
KmmMKdENIyciwb2lZx4fBB8grMs+upaPw76CizfTXrZjTan3qibrOAHHgnnG5Cy2
Ba/9ruVCVQWQJ7358i9lYd0Do6DTe4CGTrAxT869S4s0hh9mugysK8bAyps/faWs
kOhltyS7DLdx0o1ul1CA0yZdAj0yHIqkAMSEe7/mZX0Ygpm8PoJz43vXMcCsBcCN
97176w+f/3PQkY+3xEj1caPI1raGEzdOx+n5WdGKIka675Tf957Upa0/Hi0bMiz4
U/ho3HYh8xIxjyLNq6TIZIFPJBzAGk/AOjc0+H8YRkSSzCW2FOXBRRzJ3IV8G0Tr
gxJl4bwhyUVjmjRFA9A/nIAPaPHU8rIX67fElLXLvZ/zl3OAttw=
=Stsd
-----END PGP SIGNATURE-----

--0a/FGs4bPoW5Ayxx--

