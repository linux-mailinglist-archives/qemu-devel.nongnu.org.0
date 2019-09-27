Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA89C05C6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 14:54:53 +0200 (CEST)
Received: from localhost ([::1]:49774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDpls-00035i-6m
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 08:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iDpgU-0006sp-H2
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 08:49:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iDpgR-0000n4-Iv
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 08:49:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35138)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iDpgR-0000mc-8u; Fri, 27 Sep 2019 08:49:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8B7D610DCC8F;
 Fri, 27 Sep 2019 10:55:05 +0000 (UTC)
Received: from [10.36.116.169] (ovpn-116-169.ams2.redhat.com [10.36.116.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B10055C21F;
 Fri, 27 Sep 2019 10:55:04 +0000 (UTC)
Subject: Re: [PATCH v3 10/18] target/s390: Return exception from mmu_translate
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190926162615.31168-1-richard.henderson@linaro.org>
 <20190926162615.31168-11-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <55bd537c-5d62-ee48-6636-b1b386adeee8@redhat.com>
Date: Fri, 27 Sep 2019 12:55:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926162615.31168-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 27 Sep 2019 10:55:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.09.19 18:26, Richard Henderson wrote:
> Do not raise the exception directly within mmu_translate,
> but pass it back so that caller may do so.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/internal.h    |  2 +-
>  target/s390x/excp_helper.c |  4 ++--
>  target/s390x/mem_helper.c  | 13 ++++++++++---
>  target/s390x/mmu_helper.c  | 36 ++++++++++++++----------------------
>  4 files changed, 27 insertions(+), 28 deletions(-)
>=20
> diff --git a/target/s390x/internal.h b/target/s390x/internal.h
> index c4388aaf23..c993c3ef40 100644
> --- a/target/s390x/internal.h
> +++ b/target/s390x/internal.h
> @@ -360,7 +360,7 @@ void probe_write_access(CPUS390XState *env, uint64_=
t addr, uint64_t len,
> =20
>  /* mmu_helper.c */
>  int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint=
64_t asc,
> -                  target_ulong *raddr, int *flags, bool exc);
> +                  target_ulong *raddr, int *flags, uint64_t *tec);
>  int mmu_translate_real(CPUS390XState *env, target_ulong raddr, int rw,
>                         target_ulong *addr, int *flags, uint64_t *tec);
> =20
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index 906b87c071..6a0728b65f 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -140,8 +140,8 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address,=
 int size,
>          if (!(env->psw.mask & PSW_MASK_64)) {
>              vaddr &=3D 0x7fffffff;
>          }
> -        fail =3D mmu_translate(env, vaddr, access_type, asc, &raddr, &=
prot, true);
> -        excp =3D 0; /* exception already raised */
> +        excp =3D mmu_translate(env, vaddr, access_type, asc, &raddr, &=
prot, &tec);
> +        fail =3D excp;

... so what about instruction fetches? I assume this works as designed
as we set  env->int_pgm_ilen =3D 2 in s390_cpu_tlb_fill() in case of
MMU_INST_FETCH. But the comment indicates that "we may remove this
entirely".

Can you paint me the big picture? :)


>      } else if (mmu_idx =3D=3D MMU_REAL_IDX) {
>          /* 31-Bit mode */
>          if (!(env->psw.mask & PSW_MASK_64)) {
> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
> index 7d2a652823..e15aa296dd 100644
> --- a/target/s390x/mem_helper.c
> +++ b/target/s390x/mem_helper.c
> @@ -2364,8 +2364,8 @@ uint64_t HELPER(lra)(CPUS390XState *env, uint64_t=
 addr)
>      CPUState *cs =3D env_cpu(env);
>      uint32_t cc =3D 0;
>      uint64_t asc =3D env->psw.mask & PSW_MASK_ASC;
> -    uint64_t ret;
> -    int old_exc, flags;
> +    uint64_t ret, tec;
> +    int old_exc, flags, exc;
> =20
>      /* XXX incomplete - has more corner cases */
>      if (!(env->psw.mask & PSW_MASK_64) && (addr >> 32)) {
> @@ -2373,7 +2373,14 @@ uint64_t HELPER(lra)(CPUS390XState *env, uint64_=
t addr)
>      }
> =20
>      old_exc =3D cs->exception_index;
> -    if (mmu_translate(env, addr, 0, asc, &ret, &flags, true)) {
> +    exc =3D mmu_translate(env, addr, 0, asc, &ret, &flags, &tec);
> +    if (exc) {
> +        /*
> +         * We don't care about ILEN or TEC, as we're not going to
> +         * deliver the exception -- thus resetting exception_index bel=
ow.
> +         * TODO: clean this up.
> +         */
> +        trigger_pgm_exception(env, exc, ILEN_UNWIND);

Yeah, this needs a cleanup.

>          cc =3D 3;
>      }
>      if (cs->exception_index =3D=3D EXCP_PGM) {
> diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
> index ed6570db62..a9219942b1 100644
> --- a/target/s390x/mmu_helper.c
> +++ b/target/s390x/mmu_helper.c
> @@ -349,17 +349,15 @@ static void mmu_handle_skey(target_ulong addr, in=
t rw, int *flags)
>   * @return       0 if the translation was successful, -1 if a fault oc=
curred
>   */
>  int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint=
64_t asc,
> -                  target_ulong *raddr, int *flags, bool exc)
> +                  target_ulong *raddr, int *flags, uint64_t *tec)
>  {
> -    /* Code accesses have an undefined ilc, let's use 2 bytes. */
> -    const int ilen =3D (rw =3D=3D MMU_INST_FETCH) ? 2 : ILEN_AUTO;

Now I realize that this ilen currently gets overwritten in
s390_cpu_tlb_fill().

> -    uint64_t tec =3D (vaddr & TARGET_PAGE_MASK) | (asc >> 46) |
> -                   (rw =3D=3D MMU_DATA_STORE ? FS_WRITE : FS_READ);
>      uint64_t asce;
>      int r;
> =20
> -
> +    *tec =3D (vaddr & TARGET_PAGE_MASK) | (asc >> 46) |
> +            (rw =3D=3D MMU_DATA_STORE ? FS_WRITE : FS_READ);
>      *flags =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +
>      if (is_low_address(vaddr & TARGET_PAGE_MASK) && lowprot_enabled(en=
v, asc)) {
>          /*
>           * If any part of this page is currently protected, make sure =
the
> @@ -371,10 +369,7 @@ int mmu_translate(CPUS390XState *env, target_ulong=
 vaddr, int rw, uint64_t asc,
>           */
>          *flags |=3D PAGE_WRITE_INV;
>          if (is_low_address(vaddr) && rw =3D=3D MMU_DATA_STORE) {
> -            if (exc) {
> -                trigger_access_exception(env, PGM_PROTECTION, ILEN_AUT=
O, 0);
> -            }
> -            return -EACCES;
> +            return PGM_PROTECTION;
>          }
>      }
> =20
> @@ -404,20 +399,14 @@ int mmu_translate(CPUS390XState *env, target_ulon=
g vaddr, int rw, uint64_t asc,
>      /* perform the DAT translation */
>      r =3D mmu_translate_asce(env, vaddr, asc, asce, raddr, flags, rw);
>      if (unlikely(r)) {
> -        if (exc) {
> -            trigger_access_exception(env, r, ilen, tec);
> -        }
> -        return -1;
> +        return r;
>      }
> =20
>      /* check for DAT protection */
>      if (unlikely(rw =3D=3D MMU_DATA_STORE && !(*flags & PAGE_WRITE))) =
{
> -        if (exc) {
> -            /* DAT sets bit 61 only */
> -            tec |=3D 0x4;
> -            trigger_access_exception(env, PGM_PROTECTION, ilen, tec);
> -        }
> -        return -1;
> +        /* DAT sets bit 61 only */
> +        *tec |=3D 0x4;
> +        return PGM_PROTECTION;
>      }
> =20
>  nodat:
> @@ -441,9 +430,12 @@ static int translate_pages(S390CPU *cpu, vaddr add=
r, int nr_pages,
>      int ret, i, pflags;
> =20
>      for (i =3D 0; i < nr_pages; i++) {
> -        ret =3D mmu_translate(env, addr, is_write, asc, &pages[i], &pf=
lags, true);
> +        uint64_t tec;
> +
> +        ret =3D mmu_translate(env, addr, is_write, asc, &pages[i], &pf=
lags, &tec);
>          if (ret) {
> -            return ret;
> +            trigger_access_exception(env, ret, ILEN_AUTO, tec);
> +            return -EFAULT;
>          }
>          if (!address_space_access_valid(&address_space_memory, pages[i=
],
>                                          TARGET_PAGE_SIZE, is_write,
>=20


--=20

Thanks,

David / dhildenb

