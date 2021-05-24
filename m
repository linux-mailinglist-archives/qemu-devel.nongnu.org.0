Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062A338E1BB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 09:33:26 +0200 (CEST)
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll55Z-0002DD-3o
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 03:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll54k-00019s-K7; Mon, 24 May 2021 03:32:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38911 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll54f-0001Cb-VW; Mon, 24 May 2021 03:32:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpTSV1QPzz9sPf; Mon, 24 May 2021 17:32:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621841546;
 bh=nnjsJsi5ueI3o60jI8qzte54diIVCXUxjGLq3GGPn8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JRAvQiMqH8i3oAuHbQ3QizFLCC4Z93aR7qawnprnmaYbkk4EDfjZnWUy9oEVydXZv
 Air5t9/1AHBuU/MizxXBDCmM24eGBzDwrhI22hjWYTJw396b6GKgsgKgCU/pa4Z22R
 5AZXXmdyjRvBMq6p/jc/QyxiOBVqIdnhn9lDmIRE=
Date: Mon, 24 May 2021 17:32:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [RFC PATCH v3] ppc/spapr: Add support for
 H_SCM_PERFORMANCE_STATS hcall
Message-ID: <YKtWhEi/xa5IVqiR@yekko>
References: <20210515073759.10505-1-vaibhav@linux.ibm.com>
 <YKIL/Gqc50GO+UTk@yekko> <87sg2fjvg1.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3Uao4y2jD90mCvAj"
Content-Disposition: inline
In-Reply-To: <87sg2fjvg1.fsf@vajain21.in.ibm.com>
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, aneesh.kumar@linux.ibm.com,
 qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org, groug@kaod.org,
 shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org, bharata@linux.vnet.ibm.com,
 imammedo@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3Uao4y2jD90mCvAj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 22, 2021 at 09:01:26AM +0530, Vaibhav Jain wrote:
> Thanks for looking into this patch David and Groug,
>=20
> David Gibson <david@gibson.dropbear.id.au> writes:
> > On Sat, May 15, 2021 at 01:07:59PM +0530, Vaibhav Jain wrote:
> >> Add support for H_SCM_PERFORMANCE_STATS described at [1] for
> >> spapr nvdimms. This enables guest to fetch performance stats[2] like
> >> expected life of an nvdimm ('MemLife ') etc and display them to the
> >> user. Linux kernel support for fetching these performance stats and
> >> exposing them to the user-space was done via [3].
> >>=20
> >> The hcall semantics mandate that each nvdimm performance stats is
> >> uniquely identied by a 8-byte ascii string encoded as an unsigned
> >> integer (e.g 'MemLife ' =3D=3D 0x4D656D4C69666520) and its value be a
> >> 8-byte unsigned integer. These performance-stats are exchanged with
> >> the guest in via a guest allocated buffer called
> >> 'requestAndResultBuffer' or rr-buffer for short. This buffer contains
> >> a header descibed by 'struct papr_scm_perf_stats' followed by an array
> >> of performance-stats described by 'struct papr_scm_perf_stat'. The
> >> hypervisor is expected to validate the rr-buffer header and then based
> >> on the request copy the needed performance-stats to the array of
> >> 'struct papr_scm_perf_stat' following the header.
> >>=20
> >> The patch proposes a new function h_scm_performance_stats() that
> >> services the H_SCM_PERFORMANCE_STATS hcall. After verifying the
> >> validity of the rr-buffer header via scm_perf_check_rr_buffer() it
> >> proceeds to fill the rr-buffer with requested performance-stats. The
> >> value of individual stats is retrived from individual accessor
> >> function for the stat which are indexed in the array
> >> 'nvdimm_perf_stats'.
> >>=20
> >> References:
> >> [1] "Hypercall Op-codes (hcalls)"
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/powerpc/papr_hcalls.rst#n269
> >> [2] Sysfs attribute documentation for papr_scm
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/ABI/testing/sysfs-bus-papr-pmem#n36
> >> [3] "powerpc/papr_scm: Fetch nvdimm performance stats from PHYP"
> >> https://lore.kernel.org/r/20200731064153.182203-2-vaibhav@linux.ibm.com
> >>=20
> >> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> >> ---
> >> Changelog
> >>=20
> >> Since RFC-v2:
> >> * s/SCM_STATS_MAX_OUTPUT_BUFFER/SCM_STATS_MIN_OUTPUT_BUFFER/ thats the
> >>   minimum size buffer needed to return all supported performance
> >>   stats. Value for this is derived from size of array 'nvdimm_perf_sta=
ts'
> >> * Added SCM_STATS_MAX_OUTPUT_BUFFER to indicate maximum supported
> >>   rr-buffer size from a guest. Value for this is derived from hard
> >>   limit of SCM_STATS_MAX_STATS.
> >> * Updated scm_perf_check_rr_buffer() to add a check for max size of
> >>   rr-buffer. [David]
> >> * Updated scm_perf_check_rr_buffer() to removed a reduntant check for
> >>   min size of rr-buffer [David]
> >> * Updated h_scm_performance_stats() to have a single allocation for
> >>   rr-buffer and copy it back to guest memory in a single shot. [David]
> >>=20
> >> Since RFC-v1:
> >> * Removed empty lines from code [ David ]
> >> * Updated struct papr_scm_perf_stat to use uint64_t for
> >>   statistic_id.
> >> * Added a hard limit on max number of stats requested to 255 [ David ]
> >> * Updated scm_perf_check_rr_buffer() to check for rr-buffer header
> >>   size [ David ]
> >> * Removed a redundant check from nvdimm_stat_getval() [ David ]
> >> * Removed a redundant call to address_space_access_valid() in
> >>   scm_perf_check_rr_buffer() [ David ]
> >> * Instead of allocating a minimum size local buffer, allocate a max
> >>   possible size local rr-buffer. [ David ]
> >> * Updated nvdimm_stat_getval() to set 'val' to '0' on error. [ David ]
> >> * Updated h_scm_performance_stats() to use a canned-response method
> >>   for simplifying num_stats=3D=3D0 case [ David ].
> >> ---
> >>  hw/ppc/spapr_nvdimm.c  | 222 +++++++++++++++++++++++++++++++++++++++++
> >>  include/hw/ppc/spapr.h |  19 +++-
> >>  2 files changed, 240 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> >> index 252204e25f..287326b9c0 100644
> >> --- a/hw/ppc/spapr_nvdimm.c
> >> +++ b/hw/ppc/spapr_nvdimm.c
> >> @@ -35,6 +35,19 @@
> >>  /* SCM device is unable to persist memory contents */
> >>  #define PAPR_PMEM_UNARMED PPC_BIT(0)
> >> =20
> >> +/* Minimum output buffer size needed to return all nvdimm_perf_stats =
*/
> >> +#define SCM_STATS_MIN_OUTPUT_BUFFER  (sizeof(struct papr_scm_perf_sta=
ts) + \
> >> +                                      sizeof(struct papr_scm_perf_sta=
t) * \
> >> +                                      ARRAY_SIZE(nvdimm_perf_stats))
> >
> > MIN_OUTPUT_BUFFER is a better name, but still not great.  I think we
> > can get rid of this define completely in a neat way, though.  See below.
> >
> >
> Not sure how we can get rid of it since we still need to advertise to
> the guest how much rr-buffer size we expect to return all
> perf-stats. Sorry but I didnt make out of  any suggestions below that
> could get rid of this define.



>=20
>=20
> >> +/* Maximum number of stats that we can return back in a single stat r=
equest */
> >> +#define SCM_STATS_MAX_STATS 255
> >
> > Although it's technically allowed, I'm still not convinced there's
> > actually any reason to allow the user to request the same stat over
> > and over.
> >
> Matching the PowerVM behaviour here which doesnt enforce any limitations
> on the how many times a single perf-stat can appear in rr-buffer.

Hm, I guess matching PowerVM is worthwhile.  Still can't imagine any
case where a client would actually want to do so.

>=20
> >> +/* Maximum possible output buffer to fulfill a perf-stats request */
> >> +#define SCM_STATS_MAX_OUTPUT_BUFFER  (sizeof(struct papr_scm_perf_sta=
ts) + \
> >> +                                      sizeof(struct papr_scm_perf_sta=
t) * \
> >> +                                      SCM_STATS_MAX_STATS)
> >> +
> >>  bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice =
*nvdimm,
> >>                             uint64_t size, Error **errp)
> >>  {
> >> @@ -502,6 +515,214 @@ static target_ulong h_scm_health(PowerPCCPU *cpu=
, SpaprMachineState *spapr,
> >>      return H_SUCCESS;
> >>  }
> >> =20
> >> +static int perf_stat_noop(SpaprDrc *drc, uint64_t unused, uint64_t *v=
al)
> >> +{
> >> +    *val =3D 0;
> >> +    return H_SUCCESS;
> >> +}
> >> +
> >> +static int perf_stat_memlife(SpaprDrc *drc, uint64_t unused, uint64_t=
 *val)
> >> +{
> >> +    /* Assume full life available of an NVDIMM right now */
> >> +    *val =3D 100;
> >> +    return H_SUCCESS;
> >> +}
> >> +
> >> +/*
> >> + * Holds all supported performance stats accessors. Each performance-=
statistic
> >> + * is uniquely identified by a 8-byte ascii string for example: 'MemL=
ife '
> >> + * which indicate in percentage how much usage life of an nvdimm is r=
emaining.
> >> + * 'NoopStat' which is primarily used to test support for retriving p=
erformance
> >> + * stats and also to replace unknown stats present in the rr-buffer.
> >> + *
> >> + */
> >> +static const struct {
> >> +    char stat_id[8];
> >
> > So using a char[] here, but a uint64_t in the request structure makes
> > it pretty hard to follow if you're doing the right thing
> > w.r.t. endianness, especially since you effectively memcmp() directly
> > between u64s and char[]s.  You really want to use a consistent type
> > for the ids.
> >
> Though the PAPR-SCM defines stat-ids as u64 they are essentially 8-byte
> ascii strings encoded in a u64.

Yes, I got that.  The typing should still be consistent.

> The guest kernel and this proposed qemu
> patch doesnt do any math operations on them which might be effected by
> their endianess.

You do however return it in a register in at least one case, so you
need to be careful about how that's loaded or stored.

> The switch from u64->char[8] is done only for a more convinent
> ASCII representation stats-ids in nvdimm_pref_stats[].

Sounds like it would make more sense to use char[8] everywhere, then.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3Uao4y2jD90mCvAj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrVoQACgkQbDjKyiDZ
s5L4yg/6AsH+PXfGD1Ld3RFpAND3tRZqMMDURiBuXHDLiWcxmlaNnI9CL3N9TDkm
zaro77yiIFf1D4nsukiMUDdeVm1jctByOS+sy5IcBHsnxs26GXvGh0RAvKPOB01f
06R2gQap0U4/duvpNx/RX2z1jV8X2ltrAbyU3SsIabdZdbtWJgBM6ZkwM8YA5cuL
eCObKQH4ddje3yLCdvYoo9Co3z1ywZzNuMOaoZwwy1OhXXqQ9klB3Tp0Wnqe5u5k
udBiS9x/yJ619U2KR7nb3tEOfVpmTOrQkCmKTjJ5GG/fBKs47byCTO6+JIm2ntlD
kMu3QErf0OWC4cGfVPLq5nIdLSC6GqCZQH+YTQ8ifUjq+SstpwDTJZwkg6jsgk1A
yuNyy4jewR0EXBoEfGSJL27ET8eUU67kYCjoB3UzhkibzLHsj36vPkkPXrTJhe+u
T2SmezfHwgcvD6R599Sxfojdn0CroaJRNeOzl7/KE7RSX9lR/DrVwyDGC27YyjEM
zwKURTzIfgMA/LWCCuqBfr6GSb4cQgSb/mWO1EWMPQMEFRUrxOPVLFpuqnjAkHG8
EH6YoRxe/RCUPi81CAESW2N3Wenypl7Sz3vBsv+YNHIo8VIXNikWHtC+idsCZ2fO
7Q28RocvCTtFbX+DVxYOFriyEkZBAR8RSYu2l61kGaEUzTttnCI=
=hQKD
-----END PGP SIGNATURE-----

--3Uao4y2jD90mCvAj--

