Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB1A3379D1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:46:49 +0100 (CET)
Received: from localhost ([::1]:60802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOSW-0004kU-Ps
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lKOCL-0000hO-FY; Thu, 11 Mar 2021 11:30:05 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:43891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lKOCF-00077h-Uo; Thu, 11 Mar 2021 11:30:05 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 753488EF72B7;
 Thu, 11 Mar 2021 17:29:55 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 11 Mar
 2021 17:29:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00492906a4c-56ec-4b98-b602-794b0826a2a4,
 58A3AAFCCF725AA0952C8F912993319916779E2B) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 11 Mar 2021 17:29:54 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] spapr.c: remove 'ibm,chip-id' from DT
Message-ID: <20210311172954.26e2b10d@bahia.lan>
In-Reply-To: <20210311151557.705863-1-danielhb413@gmail.com>
References: <20210311151557.705863-1-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 0858053e-a121-415d-998b-470d15558f90
X-Ovh-Tracer-Id: 5008847212230383910
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvtddgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 12:15:57 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> The attribute 'ibm,chip-id' does not exist in PAPR. This alone would be
> enough reason to remove it from the spapr DT, but before doing that,
> let's give a brief context on how and why it was introduced.
>=20
> 'ibm,chip-id' was added in the spapr DT by commit 10582ff83279. This
> commit references kernel commit 256f2d4b463d ("powerpc: Use ibm, chip-id
> property to compute cpu_core_mask if available"). In this kernel commit,
> the 'ibm,chip-id' DT attribute is being used to calculate the
> cpu_core_mask in traverse_siblings_chip_id(). This function still need
> to consider 'ibm,chip-id' not being available as well to avoid breaking
> older guests.
>=20
> Later on, kernel commit df52f6714071 ("powerpc/smp: Rework CPU topology
> construction") removed traverse_siblings_chip_id() and its callers,
> making the CPU topology calculation independent of the 'ibm,chip-id'
> attribute. Today, the kernel uses 'ibm,chip-id' for PowerNV related code
> only - the pseries kernel does not rely on it.
>=20

Thanks for the archaeology ! So this means that the pseries kernel used
to rely on it up to kernel v4.14, right ?

> All that said, since it's not in PAPR and the pseries kernel does not
> rely on it, let's remove ibm,chip-id from the DT.
>=20

Even if it isn't part of PAPR, this is something that we've been
exposing to guests with existing machine types and someone could
have found a use for it or still using a pre-4.14 kernel, e.g.
debian stretch still relies on 4.9.

In theory we should change this behavior in the default machine only.
But in case David is okay to merge the patch anyway,

Reviewed-by: Greg Kurz <groug@kaod.org>

> CC: Alexey Kardashevskiy <aik@ozlabs.ru>
> Suggested-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 85fe65f894..d2e448fd9c 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -657,7 +657,6 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int=
 offset,
>      uint32_t page_sizes_prop[64];
>      size_t page_sizes_prop_size;
>      unsigned int smp_threads =3D ms->smp.threads;
> -    uint32_t vcpus_per_socket =3D smp_threads * ms->smp.cores;
>      uint32_t pft_size_prop[] =3D {0, cpu_to_be32(spapr->htab_shift)};
>      int compat_smt =3D MIN(smp_threads, ppc_compat_max_vthreads(cpu));
>      SpaprDrc *drc;
> @@ -744,9 +743,6 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int=
 offset,
> =20
>      spapr_dt_pa_features(spapr, cpu, fdt, offset);
> =20
> -    _FDT((fdt_setprop_cell(fdt, offset, "ibm,chip-id",
> -                           cs->cpu_index / vcpus_per_socket)));
> -
>      _FDT((fdt_setprop(fdt, offset, "ibm,pft-size",
>                        pft_size_prop, sizeof(pft_size_prop))));
> =20


