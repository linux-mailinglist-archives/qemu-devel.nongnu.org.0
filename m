Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04064394AB0
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 08:02:06 +0200 (CEST)
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lms2v-0004g2-1V
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 02:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lms17-00028Y-4G; Sat, 29 May 2021 02:00:13 -0400
Received: from ozlabs.org ([203.11.71.1]:47407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lms12-0006gB-IQ; Sat, 29 May 2021 02:00:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FsW9T0XJLz9sW4; Sat, 29 May 2021 15:59:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622267997;
 bh=bH1OigSO63LWBd4ix9jXgYefPgNvbNYF7hCB11d/SOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XBYi1GfcsjISu2cV2Vq8kVngJiQzF243E3tY1z9wzyJlwjurXgYL/mRIdze1DKOGj
 KqkvgMjedRrXALMv4Cengxe+SIL8vBv8fjIcrAyDJkKGQuwBJPJtfAm7jdHTcO5O20
 0fxRPpYGL6pLrw1kBjWF5R5BJntDTpZHYAiPcaw4=
Date: Sat, 29 May 2021 15:46:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
Message-ID: <YLHVS60E8GFDt9Mi@yekko>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
 <YK7zwfSC7NGssEN5@yekko> <YK8hjhgPNK8yVfgm@yekko>
 <d952f573-6a12-27c7-98e4-a29e2a955ec5@eldorado.org.br>
 <20210527160152.625ca372@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PseP7EF0DCd//qb8"
Content-Disposition: inline
In-Reply-To: <20210527160152.625ca372@bahia.lan>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PseP7EF0DCd//qb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 04:01:52PM +0200, Greg Kurz wrote:
> On Thu, 27 May 2021 10:22:50 -0300
> Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> wrote:
>=20
> >=20
> > On 27/05/2021 01:35, David Gibson wrote:
> > > On Thu, May 27, 2021 at 11:20:01AM +1000, David Gibson wrote:
> > >> On Wed, May 26, 2021 at 05:21:01PM -0300, Bruno Larsen (billionai) w=
rote:
> > >>> This function requires surce code modification to be useful, which =
means
> > >>> it probably is not used often, and the move to using decodetree mea=
ns
> > >>> the statistics won't even be collected anymore.
> > >>>
> > >>> Also removed setting dump_statistics in ppc_cpu_realize, since it w=
as
> > >>> only useful when in conjunction with ppc_cpu_dump_statistics.
> > >>>
> > >>> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> > >>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.=
br>
> > >>> ---
> > >>>   target/ppc/cpu.h       |  1 -
> > >>>   target/ppc/cpu_init.c  |  3 ---
> > >>>   target/ppc/translate.c | 51 -------------------------------------=
-----
> > >>>   3 files changed, 55 deletions(-)
> > >>>
> > >>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > >>> index 203f07e48e..c3d1b492e4 100644
> > >>> --- a/target/ppc/cpu.h
> > >>> +++ b/target/ppc/cpu.h
> > >>> @@ -1256,7 +1256,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PP=
CVirtualHypervisorClass,
> > >>>   void ppc_cpu_do_interrupt(CPUState *cpu);
> > >>>   bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
> > >>>   void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> > >>> -void ppc_cpu_dump_statistics(CPUState *cpu, int flags);
> > >>>   hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> > >>>   int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int=
 reg);
> > >>>   int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *bu=
f, int reg);
> > >>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > >>> index f5ae2f150d..bd05f53fa4 100644
> > >>> --- a/target/ppc/cpu_init.c
> > >>> +++ b/target/ppc/cpu_init.c
> > >>> @@ -9250,9 +9250,6 @@ static void ppc_cpu_class_init(ObjectClass *o=
c, void *data)
> > >>>       cc->class_by_name =3D ppc_cpu_class_by_name;
> > >>>       cc->has_work =3D ppc_cpu_has_work;
> > >>>       cc->dump_state =3D ppc_cpu_dump_state;
> > >>> -#ifdef CONFIG_TCG
> > >>> -    cc->dump_statistics =3D ppc_cpu_dump_statistics;
> > >>> -#endif
> > >> This confuses me.  The ifdefs you're removing aren't present in my
> > >> tree, and AFAICT they never existed since your own patch created
> > >> cpu_init.c.
> > >>
> > >> So.. please rebase and check that.
> > > Duh, sorry, I looked at this set out of order with your latest !tcg
> > > patches.  Now that I've applied those, I've applied those one as well.
> > Let me just check, where do you keep your most updated tree? I'm=20
> > rebasing on your github tree, but ppc-for-6.1 there seems quite outdate=
d=20
> > (still the same as main)
>=20
> Try here:
>=20
> https://gitlab.com/dgibson/qemu/-/commits/ppc-for-6.1/

Right, I moved to gitlab a while back.  I sometimes push to the old
github tree as well, but I don't already remember.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PseP7EF0DCd//qb8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCx1UsACgkQbDjKyiDZ
s5KPwhAA56+xrGiaXUWPiiFxi5DGI2jQ63AgrOj28Dzmbv10cI4jKXq+KLV8xtvX
GLUgQOAp4OkwVEdPxxAUt6IRDoT5CvtSeGXBCh2hxNBf8CVu/fVWEd3N+UFjqc0f
JBTFZP4fbOhzszBdKf8RQgYJ3S+rgQBLQkhOFzatSIEJ2CVeqyVmaym4iDUIW5xA
n1FMjNEbXrhrswubNAPUmHQG2JfdyN9S1Uieo1s+u2Td5BG7vAJyX9OyepIMQ5rW
D6awPz9YZ/U7S5nGHipty1laUBm/MIjt6rh8x5VWpsYstnYug30fy16wEa+flH4t
8Ys8GgPycgsol7UhGmQT8ybYDJTOLiYXSjdxuqP33LA5yHc3HltwcciNAQfY4mGP
3P7QfR5skvsJLSrQmVrBOxvI4LMY1KOW1looaX4U2Aw/3tvzN2qfen64l6QyYaOr
v17PfA/ZTZU5eT1vZVxyeRmqmLME6GS23Q1+TdBRyMdw5xbJ8SjJEd0UkyA+CN9F
RCfxZPlMBHe20qKvfJxfK9Liym3n56t1pR3MlcbAR8uj6gKaurwGYnHgFSMAH9u2
FRYpXD3zKfAX1neR5hr6gSS1A9XHy0VFkfvAiGKT4N/LoKTFsbVtbkv6crAVaj8W
3nUoS7sauuMgOh2HmrpOWQmKTTQJIVSE9pj/X2MlHRjiWod4/Ds=
=DxXL
-----END PGP SIGNATURE-----

--PseP7EF0DCd//qb8--

