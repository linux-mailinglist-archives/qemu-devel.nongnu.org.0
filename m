Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037FD134663
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 16:37:50 +0100 (CET)
Received: from localhost ([::1]:45828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipDP3-0002eV-0x
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 10:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ipDOG-00028b-Dd
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 10:37:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ipDOE-0000LM-Tt
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 10:37:00 -0500
Received: from 20.mo7.mail-out.ovh.net ([46.105.49.208]:40191)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ipDOE-0000K0-OJ
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 10:36:58 -0500
Received: from player762.ha.ovh.net (unknown [10.108.16.187])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 635F0148D01
 for <qemu-devel@nongnu.org>; Wed,  8 Jan 2020 16:36:56 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id 1C49BDFD64C4;
 Wed,  8 Jan 2020 15:36:51 +0000 (UTC)
Subject: Re: [PATCH 6/7] target/ppc: add support for Hypervisor Facility
 Unavailable Exception
To: David Gibson <david@gibson.dropbear.id.au>
References: <20191128134700.16091-1-clg@kaod.org>
 <20191128134700.16091-7-clg@kaod.org> <20191219051246.GF2321@umbus.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6673b3eb-9dad-5e55-2013-d5edfde718d9@kaod.org>
Date: Wed, 8 Jan 2020 16:36:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219051246.GF2321@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
X-Ovh-Tracer-Id: 17804699654592564120
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehkedgjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefheenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.49.208
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

On 12/19/19 6:12 AM, David Gibson wrote:
> On Thu, Nov 28, 2019 at 02:46:59PM +0100, C=E9dric Le Goater wrote:
>> The privileged message send and clear instructions (msgsndp & msgclrp)
>> are privileged, but will generate a hypervisor facility unavailable
>> exception if not enabled in the HFSCR and executed in privileged
>> non-hypervisor state.
>>
>> Add checks when accessing the DPDES register and when using the
>> msgsndp and msgclrp isntructions.
>>
>> Based on previous work from Suraj Jitindar Singh.
>>
>> Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
>> ---
>>  target/ppc/cpu.h                |  6 ++++++
>>  target/ppc/helper.h             |  1 +
>>  target/ppc/excp_helper.c        |  9 +++++++++
>>  target/ppc/misc_helper.c        | 24 ++++++++++++++++++++++++
>>  target/ppc/translate.c          |  4 ++++
>>  target/ppc/translate_init.inc.c | 18 ++++++++++++++++++
>>  6 files changed, 62 insertions(+)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 8ffcfa0ea162..52608dfe6ff4 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -397,6 +397,10 @@ typedef struct ppc_v3_pate_t {
>>  #define PSSCR_ESL         PPC_BIT(42) /* Enable State Loss */
>>  #define PSSCR_EC          PPC_BIT(43) /* Exit Criterion */
>> =20
>> +/* HFSCR bits */
>> +#define HFSCR_MSGP     PPC_BIT(53) /* Privileged Message Send Facilit=
ies */
>> +#define HFSCR_IC_MSGP  0xA
>> +
>>  #define msr_sf   ((env->msr >> MSR_SF)   & 1)
>>  #define msr_isf  ((env->msr >> MSR_ISF)  & 1)
>>  #define msr_shv  ((env->msr >> MSR_SHV)  & 1)
>> @@ -1333,6 +1337,8 @@ void cpu_ppc_set_vhyp(PowerPCCPU *cpu, PPCVirtua=
lHypervisor *vhyp);
>>  #endif
>> =20
>>  void store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask);
>> +void gen_hfscr_facility_check(DisasContext *ctx, int facility_sprn, i=
nt bit,
>> +                              int sprn, int cause);
>> =20
>>  static inline uint64_t ppc_dump_gpr(CPUPPCState *env, int gprn)
>>  {
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index 76518a1df6f0..14c9a30a45c9 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -643,6 +643,7 @@ DEF_HELPER_3(store_dcr, void, env, tl, tl)
>> =20
>>  DEF_HELPER_2(load_dump_spr, void, env, i32)
>>  DEF_HELPER_2(store_dump_spr, void, env, i32)
>> +DEF_HELPER_4(hfscr_facility_check, void, env, i32, i32, i32)
>>  DEF_HELPER_4(fscr_facility_check, void, env, i32, i32, i32)
>>  DEF_HELPER_4(msr_facility_check, void, env, i32, i32, i32)
>>  DEF_HELPER_FLAGS_1(load_tbl, TCG_CALL_NO_RWG, tl, env)
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 5a247945e97f..17dad626b74e 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -469,6 +469,15 @@ static inline void powerpc_excp(PowerPCCPU *cpu, =
int excp_model, int excp)
>>      case POWERPC_EXCP_FU:         /* Facility unavailable exception  =
        */
>>  #ifdef TARGET_PPC64
>>          env->spr[SPR_FSCR] |=3D ((target_ulong)env->error_code << 56)=
;
>> +#endif
>> +        break;
>> +    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable E=
xception */
>> +#ifdef TARGET_PPC64
>> +        env->spr[SPR_HFSCR] |=3D ((target_ulong)env->error_code << FS=
CR_IC_POS);
>> +        srr0 =3D SPR_HSRR0;
>> +        srr1 =3D SPR_HSRR1;
>> +        new_msr |=3D (target_ulong)MSR_HVB;
>> +        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
>>  #endif
>>          break;
>>      case POWERPC_EXCP_PIT:       /* Programmable interval timer inter=
rupt    */
>> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
>> index a0e7bd9c32d3..0cd44c6edd82 100644
>> --- a/target/ppc/misc_helper.c
>> +++ b/target/ppc/misc_helper.c
>> @@ -41,6 +41,17 @@ void helper_store_dump_spr(CPUPPCState *env, uint32=
_t sprn)
>>  }
>> =20
>>  #ifdef TARGET_PPC64
>> +static void raise_hv_fu_exception(CPUPPCState *env, uint32_t bit,
>> +                                  uint32_t sprn, uint32_t cause,
>> +                                  uintptr_t raddr)
>> +{
>> +    qemu_log("Facility SPR %d is unavailable (SPR HFSCR:%d)\n", sprn,=
 bit);
>=20
> That looks overly verbose.  Leftover debugging?

No. It's inherited from raise_fu_exception(). Should we remove them ?
or use mask CPU_LOG_INT ?


>=20
>> +    env->spr[SPR_HFSCR] &=3D ~((target_ulong)FSCR_IC_MASK << FSCR_IC_=
POS);
>> +
>> +    raise_exception_err_ra(env, POWERPC_EXCP_HV_FU, cause, raddr);
>> +}
>> +
>>  static void raise_fu_exception(CPUPPCState *env, uint32_t bit,
>>                                 uint32_t sprn, uint32_t cause,
>>                                 uintptr_t raddr)
>> @@ -55,6 +66,17 @@ static void raise_fu_exception(CPUPPCState *env, ui=
nt32_t bit,
>>  }
>>  #endif
>> =20
>> +void helper_hfscr_facility_check(CPUPPCState *env, uint32_t bit,
>> +                                 uint32_t sprn, uint32_t cause)
>> +{
>> +#ifdef TARGET_PPC64
>> +    if ((env->msr_mask & MSR_HVB) && !msr_hv &&
>> +                                     !(env->spr[SPR_HFSCR] & (1UL << =
bit))) {
>> +        raise_hv_fu_exception(env, bit, sprn, cause, GETPC());
>> +    }
>> +#endif
>> +}
>> +
>>  void helper_fscr_facility_check(CPUPPCState *env, uint32_t bit,
>>                                  uint32_t sprn, uint32_t cause)
>>  {
>> @@ -108,6 +130,8 @@ void helper_store_pcr(CPUPPCState *env, target_ulo=
ng value)
>> =20
>>  target_ulong helper_load_dpdes(CPUPPCState *env)
>>  {
>> +    helper_hfscr_facility_check(env, HFSCR_MSGP, SPR_DPDES,
>> +                                HFSCR_IC_MSGP);
>>      if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) {
>>          return 1;
>>      }
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index ba759ab2bb0f..e9e70ca149fd 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -6652,6 +6652,8 @@ static void gen_msgclrp(DisasContext *ctx)
>>      GEN_PRIV;
>>  #else
>>      CHK_SV;
>> +    gen_hfscr_facility_check(ctx, SPR_HFSCR, HFSCR_MSGP, 0,
>> +                             HFSCR_IC_MSGP);
>>      gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
>=20
> Calling a helper for the facility check, then another helper for the
> actual instruction is a bit yucky.  I'd prefer if you either call out
> for the facility check within the instruction helper, or generate the
> instructions necessary for the HFSCR check

OK. I will take a look.=20

C.

>=20
>>  #endif /* defined(CONFIG_USER_ONLY) */
>>  }
>> @@ -6662,6 +6664,8 @@ static void gen_msgsndp(DisasContext *ctx)
>>      GEN_PRIV;
>>  #else
>>      CHK_SV;
>> +    gen_hfscr_facility_check(ctx, SPR_HFSCR, HFSCR_MSGP, 0,
>> +                             HFSCR_IC_MSGP);
>>      gen_helper_book3s_msgsndp(cpu_gpr[rB(ctx->opcode)]);
>>  #endif /* defined(CONFIG_USER_ONLY) */
>>  }
>> diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_in=
it.inc.c
>> index 7c74a763ba66..154e01451270 100644
>> --- a/target/ppc/translate_init.inc.c
>> +++ b/target/ppc/translate_init.inc.c
>> @@ -468,11 +468,15 @@ static void spr_write_pcr(DisasContext *ctx, int=
 sprn, int gprn)
>>  /* DPDES */
>>  static void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn)
>>  {
>> +    gen_hfscr_facility_check(ctx, SPR_HFSCR, HFSCR_MSGP, sprn,
>> +                             HFSCR_IC_MSGP);
>>      gen_helper_load_dpdes(cpu_gpr[gprn], cpu_env);
>>  }
>> =20
>>  static void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn)
>>  {
>> +    gen_hfscr_facility_check(ctx, SPR_HFSCR, HFSCR_MSGP, sprn,
>> +                             HFSCR_IC_MSGP);
>>      gen_helper_store_dpdes(cpu_env, cpu_gpr[gprn]);
>>  }
>>  #endif
>> @@ -7523,6 +7527,20 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *dat=
a)
>>  #define POWERPC970_HID5_INIT 0x00000000
>>  #endif
>> =20
>> +void gen_hfscr_facility_check(DisasContext *ctx, int facility_sprn, i=
nt bit,
>> +                              int sprn, int cause)
>> +{
>> +    TCGv_i32 t1 =3D tcg_const_i32(bit);
>> +    TCGv_i32 t2 =3D tcg_const_i32(sprn);
>> +    TCGv_i32 t3 =3D tcg_const_i32(cause);
>> +
>> +    gen_helper_hfscr_facility_check(cpu_env, t1, t2, t3);
>> +
>> +    tcg_temp_free_i32(t3);
>> +    tcg_temp_free_i32(t2);
>> +    tcg_temp_free_i32(t1);
>> +}
>> +
>>  static void gen_fscr_facility_check(DisasContext *ctx, int facility_s=
prn,
>>                                      int bit, int sprn, int cause)
>>  {
>=20


