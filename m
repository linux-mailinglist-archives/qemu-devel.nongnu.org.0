Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2CD1409E3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 13:44:18 +0100 (CET)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isQz3-00059c-IW
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 07:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43333)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1isQy2-0004Bk-DY
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 07:43:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1isQxy-0003hD-5p
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 07:43:14 -0500
Received: from 5.mo179.mail-out.ovh.net ([46.105.43.140]:58433)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1isQxx-0003cB-R9
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 07:43:10 -0500
Received: from player715.ha.ovh.net (unknown [10.108.16.135])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id C5AFC156C01
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 13:43:03 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 1A9D4E277A80;
 Fri, 17 Jan 2020 12:42:57 +0000 (UTC)
Subject: Re: [PATCH 1/2] target/ppc: Add privileged message send facilities
To: David Gibson <david@gibson.dropbear.id.au>
References: <20200109163346.23062-1-clg@kaod.org>
 <20200109163346.23062-2-clg@kaod.org> <20200117094645.GA54439@umbus>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f724368e-e84e-421d-f163-22da87921ebe@kaod.org>
Date: Fri, 17 Jan 2020 13:42:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200117094645.GA54439@umbus>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
X-Ovh-Tracer-Id: 12382365704281230232
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtdejgdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.43.140
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/20 10:46 AM, David Gibson wrote:
> On Thu, Jan 09, 2020 at 05:33:45PM +0100, C=E9dric Le Goater wrote:
>> The Processor Control facility POWER8 processors and later provides
>> a mechanism for the hypervisor to send messages to other threads
>> in the system (msgsnd instruction) and cause hypervisor-level
>> exceptions. Privileged non-hypervisor programs are also able to
>> send messages (msgsndp instruction) but are restricted to the
>> threads of the same core and cause privileged-level exceptions.
>>
>> The Directed Privileged Doorbell Exception State (DPDES) register
>> reflects the state of pending privileged doorbell exceptions and can
>> also be used to modify that state. The register can be used to read
>> and modify the state of privileged doorbell exceptions for all threads
>> of a subprocessor and thus is a shared facility for that subprocessor.
>> The register can be read/written by the hypervisor and read by the
>> supervisor if enabled in the HFSCR, otherwise a hypervisor facility
>> unavailable exception is generated.
>>
>> The privileged message send and clear instructions (msgsndp & msgclrp)
>> are used to generate and clear the presence of a directed privileged
>> doorbell exception, respectively. The msgsndp instruction can be used
>> to target any thread of the current subprocessor, msgclrp acts on the
>> thread issuing the instruction. These instructions are privileged, but
>> will generate a hypervisor facility unavailable exception if not
>> enabled in the HFSCR and executed in privileged non-hypervisor
>> state. The HV facility unavailable exception will be addressed in
>> other patch.
>>
>> Add and implement this register and instructions by reading or
>> modifying the pending interrupt state of the cpu.
>>
>> Note that TCG only supports one thread per core and so we only need to
>> worry about the cpu making the access.
>>
>> Based on previous work from Suraj Jitindar Singh.
>>
>> Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
>> [clg: took ownership due to the amount of changes ]
>=20
> Hrm, I think this need's Suraj's S-o-b as well.  AIUI the primary
> purpose of S-o-b lines isn't about credit or ownership, but about
> tracking where code came from in case of questions of providence.  So
> even if you've taken ownership and reworked substantially, it would
> retain the original author's S-o-b.

ok. I was just tired of adding lines of changes. I can keep the
S-o-b. np.


>=20
>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
>> ---
>>  target/ppc/cpu.h                |  1 +
>>  target/ppc/helper.h             |  4 ++
>>  target/ppc/excp_helper.c        | 68 +++++++++++++++++++++++++++-----=
-
>>  target/ppc/misc_helper.c        | 36 +++++++++++++++++
>>  target/ppc/translate.c          | 26 +++++++++++++
>>  target/ppc/translate_init.inc.c | 20 ++++++++--
>>  6 files changed, 140 insertions(+), 15 deletions(-)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 103bfe9dc274..d175ec9a641d 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -935,6 +935,7 @@ enum {
>>  #define DBELL_PIRTAG_MASK              0x3fff
>> =20
>>  #define DBELL_PROCIDTAG_MASK           PPC_BITMASK(44, 63)
>> +#define DBELL_TIRTAG_MASK              PPC_BITMASK(57, 63)
>> =20
>>  #define PPC_PAGE_SIZES_MAX_SZ   8
>> =20
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index cd0dfe383a2a..cfb4c07085ca 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -657,6 +657,10 @@ DEF_HELPER_FLAGS_1(load_601_rtcu, TCG_CALL_NO_RWG=
, tl, env)
>>  DEF_HELPER_FLAGS_1(load_purr, TCG_CALL_NO_RWG, tl, env)
>>  DEF_HELPER_FLAGS_2(store_purr, TCG_CALL_NO_RWG, void, env, tl)
>>  DEF_HELPER_2(store_ptcr, void, env, tl)
>> +DEF_HELPER_FLAGS_1(load_dpdes, TCG_CALL_NO_RWG, tl, env)
>> +DEF_HELPER_FLAGS_2(store_dpdes, TCG_CALL_NO_RWG, void, env, tl)
>> +DEF_HELPER_2(book3s_msgsndp, void, env, tl)
>> +DEF_HELPER_2(book3s_msgclrp, void, env, tl)
>>  #endif
>>  DEF_HELPER_2(store_sdr1, void, env, tl)
>>  DEF_HELPER_2(store_pidr, void, env, tl)
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 5752ed4a4d83..343f3a6b30c4 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -900,7 +900,11 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>>          }
>>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) =
{
>>              env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DOORBEL=
L);
>> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DOORI);
>> +            if (env->insns_flags & PPC_SEGMENT_64B) {
>=20
> I don't love detecting this based on insns_flags this way, but there
> are lots of places we do similarly ugly things, so it's probably the
> most expedient way forward in the short term.

we should be using the is_book3s_arch2x() introduced by Greg in :
d0db7caddb19 ("target/ppc: Consolidate 64-bit server processor detection=20
in a helper")

>=20
>> +                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_SDOOR=
);
>> +            } else {
>> +                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DOORI=
);
>> +            }
>>              return;
>>          }
>>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDOORBELL))=
 {
>> @@ -1221,7 +1225,7 @@ void helper_msgsnd(target_ulong rb)
>>  }
>> =20
>>  /* Server Processor Control */
>> -static int book3s_dbell2irq(target_ulong rb)
>> +static int book3s_dbell2irq(target_ulong rb, bool hv_dbell)
>>  {
>>      int msg =3D rb & DBELL_TYPE_MASK;
>> =20
>> @@ -1230,12 +1234,16 @@ static int book3s_dbell2irq(target_ulong rb)
>>       * message type is 5. All other types are reserved and the
>>       * instruction is a no-op
>>       */
>> -    return msg =3D=3D DBELL_TYPE_DBELL_SERVER ? PPC_INTERRUPT_HDOORBE=
LL : -1;
>> +    if (msg =3D=3D DBELL_TYPE_DBELL_SERVER) {
>> +        return hv_dbell ? PPC_INTERRUPT_HDOORBELL : PPC_INTERRUPT_DOO=
RBELL;
>> +    }
>> +
>> +    return -1;
>>  }
>=20
> This function kind of seems like overkill, and also doesn't have a
> great name.  Mostly it just tests if we're dealing with a doorbell at
> all.  Selecting the right irq number here is a bit weird, since its
> based only on hv_dbell, which is a literal parameter for all callers,
> so they might as well just use the right doorbell irq inline.

I Agree.=20

>> =20
>>  void helper_book3s_msgclr(CPUPPCState *env, target_ulong rb)
>>  {
>> -    int irq =3D book3s_dbell2irq(rb);
>> +    int irq =3D book3s_dbell2irq(rb, true);
>> =20
>>      if (irq < 0) {
>>          return;
>> @@ -1244,16 +1252,10 @@ void helper_book3s_msgclr(CPUPPCState *env, ta=
rget_ulong rb)
>>      env->pending_interrupts &=3D ~(1 << irq);
>>  }
>> =20
>> -void helper_book3s_msgsnd(target_ulong rb)
>> +static void book3s_msgsnd_common(int pir, int irq)
>>  {
>> -    int irq =3D book3s_dbell2irq(rb);
>> -    int pir =3D rb & DBELL_PROCIDTAG_MASK;
>>      CPUState *cs;
>> =20
>> -    if (irq < 0) {
>> -        return;
>> -    }
>> -
>>      qemu_mutex_lock_iothread();
>>      CPU_FOREACH(cs) {
>>          PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>> @@ -1267,6 +1269,50 @@ void helper_book3s_msgsnd(target_ulong rb)
>>      }
>>      qemu_mutex_unlock_iothread();
>>  }
>> +
>> +void helper_book3s_msgsnd(target_ulong rb)
>> +{
>> +    int pir =3D rb & DBELL_PROCIDTAG_MASK;
>> +    int irq =3D book3s_dbell2irq(rb, true);
>> +
>> +    if (irq < 0) {
>> +        return;
>> +    }
>> +
>> +    book3s_msgsnd_common(pir, irq);
>> +}
>> +
>> +#if defined(TARGET_PPC64)
>> +void helper_book3s_msgclrp(CPUPPCState *env, target_ulong rb)
>> +{
>> +    int irq =3D book3s_dbell2irq(rb, false);
>> +
>> +    if (irq < 0) {
>> +        return;
>> +    }
>> +
>> +    env->pending_interrupts &=3D ~(1 << irq);
>> +}
>> +
>> +/*
>> + * sends a message to other threads that are on the same
>> + * multi-threaded processor
>> + */
>> +void helper_book3s_msgsndp(CPUPPCState *env, target_ulong rb)
>> +{
>> +    int irq =3D book3s_dbell2irq(rb, false);
>> +    int pir =3D env->spr_cb[SPR_PIR].default_value;
>> +
>> +    if (irq < 0) {
>> +        return;
>> +    }
>> +
>> +    pir &=3D ~DBELL_TIRTAG_MASK;
>> +    pir |=3D rb & DBELL_TIRTAG_MASK;
>=20
> This seems overkill since we don't actually support > 1 thread/core.
> Won't the answer always be equal to pir?

yes but the mask is different from instruction msgsnd() and if SMT > 1
is support one day, it will be correct.=20

>=20
>> +
>> +    book3s_msgsnd_common(pir, irq);
>> +}
>> +#endif
>>  #endif
>> =20
>>  void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
>> index 2318f3ab45b2..66b5b0824208 100644
>> --- a/target/ppc/misc_helper.c
>> +++ b/target/ppc/misc_helper.c
>> @@ -105,6 +105,42 @@ void helper_store_pcr(CPUPPCState *env, target_ul=
ong value)
>> =20
>>      env->spr[SPR_PCR] =3D value & pcc->pcr_mask;
>>  }
>> +
>> +/*
>> + * DPDES register is shared. Each bit reflects the state of the
>> + * doorbell interrupt of a thread of the same core.
>> + */
>> +target_ulong helper_load_dpdes(CPUPPCState *env)
>> +{
>> +    target_ulong dpdes =3D 0;
>> +
>> +    /* TODO: TCG supports only one thread */
>> +    if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) {
>> +        dpdes |=3D (env->spr_cb[SPR_PIR].default_value & DBELL_TIRTAG=
_MASK);
>=20
> Likewise, won't this just be 0 or 1?  I dislike half-measures to
> achieve something we don't actually support at this stage.

OK then. I will simplify and keep the TODOs.

Thanks,

C.

>=20
>> +    }
>> +
>> +    return dpdes;
>> +}
>> +
>> +void helper_store_dpdes(CPUPPCState *env, target_ulong val)
>> +{
>> +    PowerPCCPU *cpu =3D env_archcpu(env);
>> +    CPUState *cs =3D CPU(cpu);
>> +
>> +    /* TODO: TCG supports only one thread */
>> +    if (val & ~0x1) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid DPDES register value =
"
>> +                      TARGET_FMT_lx"\n", val);
>> +        return;
>> +    }
>> +
>> +    if (val & 0x1) {
>> +        env->pending_interrupts |=3D 1 << PPC_INTERRUPT_DOORBELL;
>> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>> +    } else {
>> +        env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_DOORBELL);
>> +    }
>> +}
>>  #endif /* defined(TARGET_PPC64) */
>> =20
>>  void helper_store_pidr(CPUPPCState *env, target_ulong val)
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index f5fe5d06118a..a3a4a95cdf53 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -6645,6 +6645,28 @@ static void gen_msgsnd(DisasContext *ctx)
>>  #endif /* defined(CONFIG_USER_ONLY) */
>>  }
>> =20
>> +#if defined(TARGET_PPC64)
>> +static void gen_msgclrp(DisasContext *ctx)
>> +{
>> +#if defined(CONFIG_USER_ONLY)
>> +    GEN_PRIV;
>> +#else
>> +    CHK_SV;
>> +    gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
>> +#endif /* defined(CONFIG_USER_ONLY) */
>> +}
>> +
>> +static void gen_msgsndp(DisasContext *ctx)
>> +{
>> +#if defined(CONFIG_USER_ONLY)
>> +    GEN_PRIV;
>> +#else
>> +    CHK_SV;
>> +    gen_helper_book3s_msgsndp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
>> +#endif /* defined(CONFIG_USER_ONLY) */
>> +}
>> +#endif
>> +
>>  static void gen_msgsync(DisasContext *ctx)
>>  {
>>  #if defined(CONFIG_USER_ONLY)
>> @@ -7187,6 +7209,10 @@ GEN_HANDLER(vmladduhm, 0x04, 0x11, 0xFF, 0x0000=
0000, PPC_ALTIVEC),
>>  GEN_HANDLER_E(maddhd_maddhdu, 0x04, 0x18, 0xFF, 0x00000000, PPC_NONE,
>>                PPC2_ISA300),
>>  GEN_HANDLER_E(maddld, 0x04, 0x19, 0xFF, 0x00000000, PPC_NONE, PPC2_IS=
A300),
>> +GEN_HANDLER2_E(msgsndp, "msgsndp", 0x1F, 0x0E, 0x04, 0x03ff0001,
>> +               PPC_NONE, PPC2_ISA207S),
>> +GEN_HANDLER2_E(msgclrp, "msgclrp", 0x1F, 0x0E, 0x05, 0x03ff0001,
>> +               PPC_NONE, PPC2_ISA207S),
>>  #endif
>> =20
>>  #undef GEN_INT_ARITH_ADD
>> diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_in=
it.inc.c
>> index d33d65dff702..9e2396a7b5a1 100644
>> --- a/target/ppc/translate_init.inc.c
>> +++ b/target/ppc/translate_init.inc.c
>> @@ -464,6 +464,17 @@ static void spr_write_pcr(DisasContext *ctx, int =
sprn, int gprn)
>>  {
>>      gen_helper_store_pcr(cpu_env, cpu_gpr[gprn]);
>>  }
>> +
>> +/* DPDES */
>> +static void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn)
>> +{
>> +    gen_helper_load_dpdes(cpu_gpr[gprn], cpu_env);
>> +}
>> +
>> +static void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn)
>> +{
>> +    gen_helper_store_dpdes(cpu_env, cpu_gpr[gprn]);
>> +}
>>  #endif
>>  #endif
>> =20
>> @@ -8238,10 +8249,11 @@ static void gen_spr_power8_dpdes(CPUPPCState *=
env)
>>  {
>>  #if !defined(CONFIG_USER_ONLY)
>>      /* Directed Privileged Door-bell Exception State, used for IPI */
>> -    spr_register(env, SPR_DPDES, "DPDES",
>> -                 SPR_NOACCESS, SPR_NOACCESS,
>> -                 &spr_read_generic, SPR_NOACCESS,
>> -                 0x00000000);
>> +    spr_register_kvm_hv(env, SPR_DPDES, "DPDES",
>> +                        SPR_NOACCESS, SPR_NOACCESS,
>> +                        &spr_read_dpdes, SPR_NOACCESS,
>> +                        &spr_read_dpdes, &spr_write_dpdes,
>> +                        KVM_REG_PPC_DPDES, 0x00000000);
>>  #endif
>>  }
>> =20
>=20


