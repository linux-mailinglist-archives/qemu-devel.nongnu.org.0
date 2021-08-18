Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F4D3EFD39
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 08:57:15 +0200 (CEST)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGFVi-0005VJ-9K
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 02:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mGFS4-0004aW-TT; Wed, 18 Aug 2021 02:53:29 -0400
Received: from ozlabs.org ([203.11.71.1]:37811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mGFS1-0002mZ-Ji; Wed, 18 Aug 2021 02:53:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GqJWX23JVz9sWq; Wed, 18 Aug 2021 16:53:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629269592;
 bh=70q13497A2d0j+IXM1QMCpJczlqGQa6rHrg5vVX4boE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p74I9uzndcb7GY4lAW4Cwge71zOyfip0yPEISeXEQ7u8zwA9ff5zKYYGYD0RS+j2B
 WMfgL0GO5Q6rUjtbMNtCX/kcez+xZn3b6CdG4fC089OUUIoQduKKr/9MaE6JGu/3Be
 PF8gOh0PhVwuhnUHDJSyLh47KL+hKUv3ZwZWNKdQ=
Date: Wed, 18 Aug 2021 15:48:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 04/19] target/ppc: PMU Book3s basic insns count for
 pseries TCG
Message-ID: <YRyfE6tjnZADd9A8@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-5-danielhb413@gmail.com>
 <YRH05uCNwvjS5Nws@yekko>
 <7937bc84-b516-ee7b-296d-2a38191dc056@gmail.com>
 <YRsmEN2C3LDInZyS@yekko>
 <729ff025-ca1e-21ce-0683-5bac9d138292@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1e8y9qjUNQbtNQ5c"
Content-Disposition: inline
In-Reply-To: <729ff025-ca1e-21ce-0683-5bac9d138292@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1e8y9qjUNQbtNQ5c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 06:30:37AM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/16/21 11:59 PM, David Gibson wrote:
> > On Mon, Aug 16, 2021 at 02:53:13PM -0300, Daniel Henrique Barboza wrote:
> > >=20
> > >=20
> > > On 8/10/21 12:39 AM, David Gibson wrote:
> > > > On Mon, Aug 09, 2021 at 10:10:42AM -0300, Daniel Henrique Barboza w=
rote:
> > > > > The PMCC (PMC Control) bit in the MMCR0 register controls whether=
 the
> > > > > counters PMC5 and PMC6 are being part of the performance monitor
> > > > > facility in a specific time. If PMCC allows it, PMC5 and PMC6 will
> > > > > always be used to measure instructions completed and cycles,
> > > > > respectively.
> > > > >=20
> > > > > This patch adds the barebones of the Book3s PMU logic by enabling
> > > > > instruction counting, using the icount framework, using the perfo=
rmance
> > > > > monitor counters 5 and 6. The overall logic goes as follows:
> > > > >=20
> > > > > - a helper is added to control the PMU state on each MMCR0 write.=
 This
> > > > > allows for the PMU to start/stop as quick as possible;
> > > >=20
> > > > Um.. why does a helper accomplish that goal?
> > > >=20
> > > > >=20
> > > > > - only PMC5 and PMC6 are being set. PMC6 (cycles) is default to 4=
*insns
> > > > > (for cycles per instruction) for now;
> > > >=20
> > > > What's the justification for that value?  With a superscalar core, =
I'd
> > > > expect average (median) cycles per instruction to be < 1 a lot of t=
he
> > > > time.  Mean cycles per instruction could be higher since certain
> > > > instructions could take a lot.
> > > >=20
> > > > > - the intended usage is to freeze the counters by setting MMCR0_F=
C, do
> > > > > any additional setting via MMCR1 (not implemented yet) and setting
> > > > > initial counter values,  and enable the PMU by zeroing MMCR0_FC. =
Software
> > > > > must freeze counters to read the results - on the fly reading of =
the PMCs
> > > > > will return the starting value of each one.
> > > >=20
> > > > Is that the way hardware behaves?  Or is it just a limitation of th=
is
> > > > software implementation?  Either is fine, we should just be clear on
> > > > what it is.
> > > >=20
> > > > >=20
> > > > > Since there will be more PMU exclusive code to be added next, let=
's also
> > > > > put the PMU logic in its own helper to keep all in the same place=
=2E The
> > > > > code is also repetitive and not really extensible to add more PMC=
s, but
> > > > > we'll handle this in the next patches.
> > > > >=20
> > > > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > > > ---
> > > > >    target/ppc/cpu.h               |  4 ++
> > > > >    target/ppc/cpu_init.c          |  4 +-
> > > > >    target/ppc/helper.h            |  1 +
> > > > >    target/ppc/meson.build         |  1 +
> > > > >    target/ppc/pmu_book3s_helper.c | 78 ++++++++++++++++++++++++++=
++++++++
> > > > >    target/ppc/translate.c         | 14 ++++--
> > > > >    6 files changed, 97 insertions(+), 5 deletions(-)
> > > > >    create mode 100644 target/ppc/pmu_book3s_helper.c
> > > > >=20
> > > > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > > > index 4d96015f81..229abfe7ee 100644
> > > > > --- a/target/ppc/cpu.h
> > > > > +++ b/target/ppc/cpu.h
> > > > > @@ -1175,6 +1175,10 @@ struct CPUPPCState {
> > > > >        uint32_t tm_vscr;
> > > > >        uint64_t tm_dscr;
> > > > >        uint64_t tm_tar;
> > > > > +
> > > > > +    /* PMU registers icount state */
> > > > > +    uint64_t pmc5_base_icount;
> > > > > +    uint64_t pmc6_base_icount;
> > > > >    };
> > > > >    #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
> > > > > diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > > > > index 71062809c8..fce89ee994 100644
> > > > > --- a/target/ppc/cpu_init.c
> > > > > +++ b/target/ppc/cpu_init.c
> > > > > @@ -6822,7 +6822,7 @@ static void register_book3s_pmu_sup_sprs(CP=
UPPCState *env)
> > > > >        spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
> > > > >                         SPR_NOACCESS, SPR_NOACCESS,
> > > > >                         &spr_read_pmu_generic, &spr_write_pmu_gen=
eric,
> > > > > -                     KVM_REG_PPC_MMCR0, 0x00000000);
> > > > > +                     KVM_REG_PPC_MMCR0, 0x80000000);
> > > > >        spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
> > > > >                         SPR_NOACCESS, SPR_NOACCESS,
> > > > >                         &spr_read_pmu_generic, &spr_write_pmu_gen=
eric,
> > > > > @@ -6870,7 +6870,7 @@ static void register_book3s_pmu_user_sprs(C=
PUPPCState *env)
> > > > >        spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
> > > > >                     &spr_read_pmu_ureg, &spr_write_pmu_ureg,
> > > > >                     &spr_read_ureg, &spr_write_ureg,
> > > > > -                 0x00000000);
> > > > > +                 0x80000000);
> > > > >        spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
> > > > >                     &spr_read_pmu_ureg, &spr_write_pmu_ureg,
> > > > >                     &spr_read_ureg, &spr_write_ureg,
> > > > > diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> > > > > index 4076aa281e..5122632784 100644
> > > > > --- a/target/ppc/helper.h
> > > > > +++ b/target/ppc/helper.h
> > > > > @@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
> > > > >    DEF_HELPER_1(hrfid, void, env)
> > > > >    DEF_HELPER_2(store_lpcr, void, env, tl)
> > > > >    DEF_HELPER_2(store_pcr, void, env, tl)
> > > > > +DEF_HELPER_2(store_mmcr0, void, env, tl)
> > > > >    #endif
> > > > >    DEF_HELPER_1(check_tlb_flush_local, void, env)
> > > > >    DEF_HELPER_1(check_tlb_flush_global, void, env)
> > > > > diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> > > > > index b85f295703..bf252ca3ac 100644
> > > > > --- a/target/ppc/meson.build
> > > > > +++ b/target/ppc/meson.build
> > > > > @@ -14,6 +14,7 @@ ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
> > > > >      'int_helper.c',
> > > > >      'mem_helper.c',
> > > > >      'misc_helper.c',
> > > > > +  'pmu_book3s_helper.c',
> > > > >      'timebase_helper.c',
> > > > >      'translate.c',
> > > > >    ))
> > > > > diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book=
3s_helper.c
> > > > > new file mode 100644
> > > > > index 0000000000..fe16fcfce0
> > > > > --- /dev/null
> > > > > +++ b/target/ppc/pmu_book3s_helper.c
> > > >=20
> > > > I'd prefer to call this just book3s_pmu.c.  Or better yet
> > > > "powerX_pmu.c", where X is the specific PMU model you're implementi=
ng
> > > > since IIRC the particulars of the PMU vary quite a lot from POWER7
> > > > through to POWER10.
> > >=20
> > > I'll go with book3s_pmu.c because this PMU implementation will not go
> > > deep enough to touch the differences between POWER processors.
> >=20
> > I think you are mistaken.
> >=20
> > > The only aspects that will be implementation specific will be 2 perf
> > > events (0x2 and 0x1E) that the kernel has been using for a long time
> > > and only recently migrated to architected events. We'll support all
> > > architected events that are related to those events so that newer
> > > kernels - and other non-IBM processors - will use the PMU without
> > > the need of having to know about 0x2 and 0x1E.
> >=20
> > So, possibly in the last few POWER chips, the only differences are the
> > table of event keys.  That is definitely not the case for the whole
> > POWER line though.  I remember from my time at IBM, the PMU underwent
> > huge changes much deeper than the event table.  Some had different
> > numbers of PMCs, different bit fields in the MMCRs, different methods
> > of event selection (in some cases through insanely compplex chains of
> > multiplexers).  And everything from POWER4 onwards could reasonably be
> > described as "book3s".  So we definitely need a different
> > name... working out what it should be is harder though.
> >=20
> > If the modern core structure of the PMU got codified in a particular
> > BookS architecture version we could name it after that version, maybe?
>=20
>=20
> What about just 'pmu_helper.c'? That way we can have a file with most of
> the PMU logic contained in it, without implying nothing about the support
> with the filename alone. If time goes by and more specialized coded starts
> to being added in there (code like "this helper implements something that
> is only valid in PPC chip X") then we can split into more specific files.
>=20
> Yet another alternative in line with what you suggested could be
> "power9_pmu.c", perhaps even "power8_pmu.c". The chip version would mean
> "the oldest IBM TCG PPC64 chip that we tested with this PMU code". I'm
> testing with POWER9 most of the time, POWER10 works fine, so 'power9_pmu.=
c'
> is viable. I can do some tests with POWER8 to see how it goes. I'm not
> sure if it's worth the trouble testing with anything older than P8
> though.

Right.  I much prefer either of these to pmu_helper.c

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1e8y9qjUNQbtNQ5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEcnxEACgkQbDjKyiDZ
s5J58RAA2k6j7eRVDnlvmBFhxcbK4Cmhl+F02J4wlJ72dX4vmv7P7ITQpoOsnBBc
Emy5VTplZyW3ewPtTtCEjQL7+4LXWl0BvxukE/OFEvtjcUuTNBUCyVuRCJniGjih
8DkIhxUOR3z+ErT9DH6GwSPgixnzZiHEu+l6EnMTIVdfAbxVCqK792USCorzxsmQ
jWTsm17wRd2Rz6I6O2UYdJczezdjn1DbDaEsuVHM2mhda12i2F8dr9EsZeyItFNt
hzqlgVv1hNt5vm6YgahOOHOgazz/dGZIH8uW8rYglK+T/sBJ+UQSw3qFI+RXOpnk
+aCuUjQGRVCyVgr8C+saG4zsABhSuQAmW9lE4dvBQTHOO7JKhJvru8zFQ1AKGrMB
A6sY2mWuMGOO8OhorD9I9Kqpa/rPHYK73GYIB7KeAzeGh5N83mx0ePxS/8MP/T9M
+eUX6fC9kE0VFVB6agay4cX0nrdSBM8IWbx+6zug1eKgVuLekUrAHH08v/mKR9P4
JJ4i07+RKKH7WmmS8dKAaMUgApdv850WEVTrV1yIeGDusQ9rcMq5rBDWZqhExp0B
mm058RIVIqIzdohtc/4WyFJXJOcw2sObteEs8n6tPxMMGcXjRm4jMKgec+hnJYuV
8e7cszKvVwWpRF8iVthxM4PDzJEL68E+ull3IHI4qiaH5B464Rc=
=VUOh
-----END PGP SIGNATURE-----

--1e8y9qjUNQbtNQ5c--

