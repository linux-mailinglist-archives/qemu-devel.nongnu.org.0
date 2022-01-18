Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E1492186
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 09:44:45 +0100 (CET)
Received: from localhost ([::1]:60002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9k6e-0001sa-8L
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 03:44:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9jpN-0005yA-Cy
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:26:54 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:34487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9joz-0005Gw-AC
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:26:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9F663217B9;
 Tue, 18 Jan 2022 08:26:19 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 09:26:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0024d1762b2-9a18-4f9a-8d70-6bd2f2ae0243,
 78124C4340FA50D00486B2609A05927D7A7C6ABE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <15515c05-dc59-c66d-5144-03ad2bd9dcc2@kaod.org>
Date: Tue, 18 Jan 2022 09:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: Finish removal of 401/403 CPUs
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20220117091541.1615807-1-clg@kaod.org>
 <YeYNaZCC+kj7b5iK@yekko.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YeYNaZCC+kj7b5iK@yekko.fritz.box>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1cc4c819-ddb4-48f0-b22c-193f42aeb160
X-Ovh-Tracer-Id: 8767101101694815200
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvgdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 01:44, David Gibson wrote:
> On Mon, Jan 17, 2022 at 10:15:41AM +0100, Cédric le Goater wrote:
>> Commit c8f49e6b938e ("target/ppc: remove 401/403 CPUs") left a few
>> things behind.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> 
> .. although I'm not sure "finish" is totally accurate since env->pb is
> still there.

True. I will rephrase in a v2 adding more cleanups.

Thanks,

C.

> 
>> ---
>>   target/ppc/helper.h      |  1 -
>>   target/ppc/cpu-models.c  |  1 -
>>   target/ppc/machine.c     | 23 -----------------------
>>   target/ppc/misc_helper.c |  9 ---------
>>   target/ppc/translate.c   | 16 +---------------
>>   5 files changed, 1 insertion(+), 49 deletions(-)
>>
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index f9c72dcd504d..d318837ea5cc 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -703,7 +703,6 @@ DEF_HELPER_FLAGS_2(store_hdecr, TCG_CALL_NO_RWG, void, env, tl)
>>   DEF_HELPER_FLAGS_2(store_vtb, TCG_CALL_NO_RWG, void, env, tl)
>>   DEF_HELPER_FLAGS_2(store_tbu40, TCG_CALL_NO_RWG, void, env, tl)
>>   DEF_HELPER_2(store_hid0_601, void, env, tl)
>> -DEF_HELPER_3(store_403_pbr, void, env, i32, tl)
>>   DEF_HELPER_FLAGS_1(load_40x_pit, TCG_CALL_NO_RWG, tl, env)
>>   DEF_HELPER_FLAGS_2(store_40x_pit, TCG_CALL_NO_RWG, void, env, tl)
>>   DEF_HELPER_FLAGS_2(store_40x_tcr, TCG_CALL_NO_RWG, void, env, tl)
>> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
>> index c9fcb6119f40..96fec9c2e501 100644
>> --- a/target/ppc/cpu-models.c
>> +++ b/target/ppc/cpu-models.c
>> @@ -750,7 +750,6 @@
>>   /* PowerPC CPU aliases                                                     */
>>   
>>   PowerPCCPUAlias ppc_cpu_aliases[] = {
>> -    { "403", "403gc" },
>>       { "405", "405d4" },
>>       { "405cr", "405crc" },
>>       { "405gp", "405gpd" },
>> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
>> index 756d8de5d8dd..ea0a0d4e4c7a 100644
>> --- a/target/ppc/machine.c
>> +++ b/target/ppc/machine.c
>> @@ -709,25 +709,6 @@ static bool tlbemb_needed(void *opaque)
>>       return env->nb_tlb && (env->tlb_type == TLB_EMB);
>>   }
>>   
>> -static bool pbr403_needed(void *opaque)
>> -{
>> -    PowerPCCPU *cpu = opaque;
>> -    uint32_t pvr = cpu->env.spr[SPR_PVR];
>> -
>> -    return (pvr & 0xffff0000) == 0x00200000;
>> -}
>> -
>> -static const VMStateDescription vmstate_pbr403 = {
>> -    .name = "cpu/pbr403",
>> -    .version_id = 1,
>> -    .minimum_version_id = 1,
>> -    .needed = pbr403_needed,
>> -    .fields = (VMStateField[]) {
>> -        VMSTATE_UINTTL_ARRAY(env.pb, PowerPCCPU, 4),
>> -        VMSTATE_END_OF_LIST()
>> -    },
>> -};
>> -
>>   static const VMStateDescription vmstate_tlbemb = {
>>       .name = "cpu/tlb6xx",
>>       .version_id = 1,
>> @@ -742,10 +723,6 @@ static const VMStateDescription vmstate_tlbemb = {
>>           /* 403 protection registers */
>>           VMSTATE_END_OF_LIST()
>>       },
>> -    .subsections = (const VMStateDescription*[]) {
>> -        &vmstate_pbr403,
>> -        NULL
>> -    }
>>   };
>>   
>>   static const VMStateDescription vmstate_tlbmas_entry = {
>> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
>> index c33f5f39b90b..1bcefa7c843c 100644
>> --- a/target/ppc/misc_helper.c
>> +++ b/target/ppc/misc_helper.c
>> @@ -226,15 +226,6 @@ void helper_store_hid0_601(CPUPPCState *env, target_ulong val)
>>       }
>>   }
>>   
>> -void helper_store_403_pbr(CPUPPCState *env, uint32_t num, target_ulong value)
>> -{
>> -    if (likely(env->pb[num] != value)) {
>> -        env->pb[num] = value;
>> -        /* Should be optimized */
>> -        tlb_flush(env_cpu(env));
>> -    }
>> -}
>> -
>>   void helper_store_40x_dbcr0(CPUPPCState *env, target_ulong val)
>>   {
>>       /* Bits 26 & 27 affect single-stepping. */
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index abbc3a5bb9f0..059956bc59b3 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -911,22 +911,8 @@ void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
>>   }
>>   #endif
>>   
>> -/* PowerPC 403 specific registers */
>> -/* PBL1 / PBU1 / PBL2 / PBU2 */
>> +/* PIR */
>>   #if !defined(CONFIG_USER_ONLY)
>> -void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
>> -{
>> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
>> -                  offsetof(CPUPPCState, pb[sprn - SPR_403_PBL1]));
>> -}
>> -
>> -void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
>> -{
>> -    TCGv_i32 t0 = tcg_const_i32(sprn - SPR_403_PBL1);
>> -    gen_helper_store_403_pbr(cpu_env, t0, cpu_gpr[gprn]);
>> -    tcg_temp_free_i32(t0);
>> -}
>> -
>>   void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
>>   {
>>       TCGv t0 = tcg_temp_new();
> 


