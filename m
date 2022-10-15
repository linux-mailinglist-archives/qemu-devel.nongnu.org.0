Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5061F5FFA3C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 15:26:29 +0200 (CEST)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojhBL-0002kN-JP
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 09:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ojgth-0007Zs-Lk
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 09:08:13 -0400
Received: from mail-out-1a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:44]:47287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ojgtb-0000r0-6l
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 09:08:11 -0400
X-IPAS-Result: =?us-ascii?q?A2AXBQC8Q0Vj/5sagoZaHgEBCxIMQIZNhE6QZy4DgROcG?=
 =?us-ascii?q?IFoCwEBAQEBAQEBAQgBQgQBAYUFAoR1JjgTAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBIEchS9GhkIBAQEBAgEjBAsBBUEQCxIDAwICJgICSQ4GDQEFA?=
 =?us-ascii?q?gEBF4Jign4jrBp6fzOBAYx8gWUJAYEHLIhRh183gVVEgRUngkw3PoN8L4Nwg?=
 =?us-ascii?q?mYEmjkcJgQOAxkrHUACAQtCNRgDFAMFIQcDGQ8jDQ0EFgcMAwMFJQMCAhsHA?=
 =?us-ascii?q?gIDAgYTBQICTTQIBAgEKyQPBQIHLwUELwIeBAUGEQgCFgIGBAQEBBUCEAgCC?=
 =?us-ascii?q?CYXBxMYGxkBBTInDgkhHAoEGg0FBhMDIG8FCjgPKC9pKx0bB4EMKigVAwQEA?=
 =?us-ascii?q?wIGEwMgAg0pMRQEKRMPLQcpcQkCAyJlBQMDBCgsAwlABygkPAdYOgEEAwIQI?=
 =?us-ascii?q?jwGAwkDAiRZdS8RFQUDDRcmCAU3GwQIPAIFBlITAgoSAxIPBidJD0o+OxcIm?=
 =?us-ascii?q?1AbZgeBDgEbPy4oWjQUCkmReCQBjkegTjQHghuBRoFDBgyeVAZBg3aMUYYvk?=
 =?us-ascii?q?haXEaIGPoUCAgQCBAUCFoF4gX4zGiSDNlEXAg+OLBaOMHM7AgYBCgEBAwmIU?=
 =?us-ascii?q?4I3AQE?=
IronPort-Data: A9a23:98CJNKhJzhUS9Bb6tAODG8joX161PBEKZh0ujC45NGQN5FlHY01je
 htvDz+Eaa2PM2GgLYtyPI+2px8GsJfcyIIyHgU9qC43RnljpJueD7x1DKtR0wC6c5efFhI3t
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtHR7zml4
 LsemOWCfg74s9JIGjhMsfja8Eo25K6aVA4w5zTSW9ga5DcyqFFIVPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIKM0SWuSWukwRpukoNHKdGNR0H223hc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE6tdTEm1pD5Uh6/dKIGNzx
 6EeNmggV0XW7w626OrTpuhEvPsfDOTbebhF/1sm1y7FDbMvTdbPTs0m5/cBh2t235sWW6yAI
 ZNENFKDbzyZC/FLEksQApM3h6GygXT/djBcgEiKuapy6mHYzAF3lrTgWDbQUobXHJUOxxfAz
 o7A12aoUklAHtqj9TGIw3/9q8XimSOgfqtHQdVU8dYv2jV/3Fc7EBAKWEH9pPCohkO6X/pbK
 kod4C1oqrI9nGSyQ9zgGhG1vnOAlhgbXdVWDqs98g7l90bPyxyGGmgJXntaMpks8tUpWTxv3
 1PPk96B6SFTjYB5gEm1rt+8xQ5e8wBMRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:VvrpU6OvHsiMiMBcTvajsMiBIKoaSvp037Eqv3oBKiC9Afb4qy
 nIpoV86faUskd3ZJhOo7290cW7MBbhHNtOkO0s1NSZMDUO2lHDEGgK1+KLqAEIWReOlNK1vZ
 0QCpSWY+efMbEVt6bHCUWDfOrJl7K8gduVbLDlvg9QcT0=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,176,1661810400"; d="scan'208";a="25183190"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-1a.itc.rwth-aachen.de with ESMTP; 15 Oct 2022 15:07:50 +0200
Received: from [IPV6:2a02:908:1088:5920:14b1:d0dc:9fce:dda6]
 (2a02:908:1088:5920:14b1:d0dc:9fce:dda6) by RWTHEX-S2-B.rwth-ad.de
 (2a00:8a60:1:e500::26:155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Sat, 15 Oct
 2022 15:07:49 +0200
Message-ID: <505cf0d1-e02c-c899-d551-ee2c451e6bcb@rwth-aachen.de>
Date: Sat, 15 Oct 2022 15:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 7/9] target/arm: Add PMSAv8r registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
 <20220820141914.217399-8-tobias.roehmel@rwth-aachen.de>
 <CAFEAcA8o4GfuY0yB4A3FeADuyzbHdRYFL_402-RxkXBy5kh7-w@mail.gmail.com>
From: Tobias Roehmel <tobias.roehmel@rwth-aachen.de>
In-Reply-To: <CAFEAcA8o4GfuY0yB4A3FeADuyzbHdRYFL_402-RxkXBy5kh7-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:14b1:d0dc:9fce:dda6]
X-ClientProxiedBy: rwthex-w1-b.rwth-ad.de (2a00:8a60:1:e500::26:157) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:44;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-1a.itc.rwth-aachen.de
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.961,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you very much for the review!

I have a few questions:

On 27.09.22 15:50, Peter Maydell wrote:
> On Sat, 20 Aug 2022 at 15:19, <tobias.roehmel@rwth-aachen.de> wrote:
>> From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
>>
>> Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
>> ---
>>   target/arm/cpu.h    |  10 +++
>>   target/arm/helper.c | 171 ++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 181 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 86e06116a9..632d0d13c6 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -726,8 +726,18 @@ typedef struct CPUArchState {
>>            */
>>           uint32_t *rbar[M_REG_NUM_BANKS];
>>           uint32_t *rlar[M_REG_NUM_BANKS];
>> +        uint32_t prbarn[255];
>> +        uint32_t prlarn[255];
>> +        uint32_t hprbarn[255];
>> +        uint32_t hprlarn[255];
> Don't use magic constants, please. In fact, don't use
> fixed size arrays at all here. The v8R PRBAR/PRLAR
> register arrays are exactly the same format as the v8M
> pmsav8.rbar[] and pmsav8.rlar[], so please use the same
> state fields that does. (You'll need to add equivalent
> new arrays to handle the HPRBAR/HPRLAR.)

Is there a way to find out whether I'm in secure mode while accessing a 
co-processor register?
The banks for rbar etc. are used to model the secure non-secure banks. 
The access mechanism
here is via a device which allows the use of the mmu index to find out 
if we are in secure mode.
I'm struggling to find a good solution in the co-processor register case.

>
>>           uint32_t mair0[M_REG_NUM_BANKS];
>>           uint32_t mair1[M_REG_NUM_BANKS];
>> +        uint32_t prbar;
>> +        uint32_t prlar;
> You should not need separate prbar/prlar fields, as those
> registers only indirectly access the state for thecurrently
> selected region. Similarly hprbar, hprlar below.
>
>> +        uint32_t prselr;
> PRSELR is just a renamed PMSAv7 RGNR, for which we already
> have a state field, pmsav7.rnr[M_REG_NS] (and indeed a cpreg
> struct).
I changed it to use the rnr field, but I think I can't reuse the cpreg 
since it has a different encoding.
>
>> +        uint32_t hprbar;
>> +        uint32_t hprlar;
>> +        uint32_t hprselr;
>>       } pmsav8;
> Some of this new state must be handled for migration.
> Where state is directly accessed via a coprocessor
> register that will be migrated for you. However, where
> there is state that is not directly accessible, i.e. for
> the rbar/rlar arrays, you need to add code/vmstate structs
> to target/arm/machine.c to migrate them. vmstate_pmsav8
> already does this for rbar and rlar, but you'll need to
> add something similar for the hyp versions. (Watch out that
> you maintain migration compat for the existing CPUs -- you
> can't just add new fields to existing VMStateDescription
> structs. Ask if you need advice.)
I need some help here. Do I need new subsections?
>
> The arrays will also need explicit handling in reset.
> Again, look at how PMSAv7 is doing it.
>
>>       /* v8M SAU */
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 23461397e0..1730383f28 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -7422,6 +7422,78 @@ static CPAccessResult access_joscr_jmcr(CPUARMState *env,
>>       return CP_ACCESS_OK;
>>   }
>>
>> +static void prbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                          uint64_t value)
>> +{
>> +    env->pmsav8.prbarn[env->pmsav8.prselr] = value;
>> +}
>> +
>> +static void prlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                          uint64_t value)
>> +{
>> +    env->pmsav8.prlarn[env->pmsav8.prselr] = value;
>> +}
> For writes you will need to do some kind of tlb flush.
> Compare pmsav7_write().
>
>> +
>> +static uint64_t prbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
>> +{
>> +    return env->pmsav8.prbarn[env->pmsav8.prselr];
>> +}
>> +
>> +static uint64_t prlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
>> +{
>> +    return env->pmsav8.prlarn[env->pmsav8.prselr];
>> +}
>> +
>> +static void hprbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                          uint64_t value)
>> +{
>> +    env->pmsav8.hprbarn[env->pmsav8.hprselr] = value;
>> +}
>> +
>> +static void hprlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                          uint64_t value)
>> +{
>> +    env->pmsav8.hprlarn[env->pmsav8.hprselr] = value;
>> +}
>> +
>> +static void hprenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                          uint64_t value)
>> +{
>> +    uint32_t n;
>> +    ARMCPU *cpu = env_archcpu(env);
>> +    for (n = 0; n < (int)cpu->pmsav7_dregion; ++n) {
> What's the cast for here ?
>
> The architecture allows EL1 and EL2 MPUs to have different
> numbers of regions, so this loop bound shouldn't be on
> pmsav7_dregion, which is (I assume) the number of
> EL1 MPU regions.
>
> You need to also bound n to less than 32, to avoid
> undefined behaviour.
>
>> +        if (value & (1 << n)) {
>> +            env->pmsav8.hprlarn[n] |= 0x1;
>> +        } else {
>> +            env->pmsav8.hprlarn[n] &= (~0x1);
> Brackets unnecessary.
>
>> +        }
> Consider replacing this if() with
>
>         bit = extract32(value, n, 1);
>         env->pmsav8.hprlarn[n] = deposit32(env->pmsav8.hprlarn[n], 0, 1, bit);
>
>> +    }
>> +}
>> +
>> +static uint64_t hprbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
>> +{
>> +    return env->pmsav8.hprbarn[env->pmsav8.hprselr];
>> +}
>> +
>> +static uint64_t hprlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
>> +{
>> +    return env->pmsav8.hprlarn[env->pmsav8.hprselr];
>> +}
>> +
>> +static uint64_t hprenr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>> +{
>> +    uint32_t n;
>> +    uint32_t result = 0x0;
>> +    ARMCPU *cpu = env_archcpu(env);
>> +
>> +    for (n = 0; n < (int)cpu->pmsav7_dregion; ++n) {
>> +        if (env->pmsav8.hprlarn[n] & 0x1) {
>> +            result |= (0x1 << n);
>> +        }
>> +    }
>> +    return result;
>> +}
>> +
>>   static const ARMCPRegInfo jazelle_regs[] = {
>>       { .name = "JIDR",
>>         .cp = 14, .crn = 0, .crm = 0, .opc1 = 7, .opc2 = 0,
>> @@ -8249,6 +8321,46 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>>                 .access = PL1_R, .type = ARM_CP_CONST,
>>                 .resetvalue = cpu->pmsav7_dregion << 8
>>           };
>> +        /* PMSAv8-R registers*/
>> +        ARMCPRegInfo id_pmsav8_r_reginfo[] = {
>> +            { .name = "HMPUIR",
>> +              .cp = 15, .crn = 0, .crm = 0, .opc1 = 4, .opc2 = 4,
>> +              .access = PL2_R, .type = ARM_CP_CONST,
>> +              .resetvalue = cpu->pmsav7_dregion},
>> +             /* PMSAv8-R registers */
>> +            { .name = "PRBAR",
>> +              .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 0,
>> +              .access = PL1_RW, .resetvalue = 0,
>> +              .readfn = prbar_read, .writefn = prbar_write,
>> +              .fieldoffset = offsetof(CPUARMState, pmsav8.prbar)},
>> +            { .name = "PRLAR",
>> +              .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 1,
>> +              .access = PL1_RW, .resetvalue = 0,
>> +              .readfn = prlar_read, .writefn = prlar_write,
>> +              .fieldoffset = offsetof(CPUARMState, pmsav8.prlar)},
>> +            { .name = "PRSELR", .resetvalue = 0,
>> +              .cp = 15, .opc1 = 0, .crn = 6, .crm = 2, .opc2 = 1,
>> +              .access = PL1_RW, .accessfn = access_tvm_trvm,
>> +              .fieldoffset = offsetof(CPUARMState, pmsav8.prselr)},
>> +            { .name = "HPRBAR", .resetvalue = 0,
>> +              .readfn = hprbar_read, .writefn = hprbar_write,
>> +              .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 0,
>> +              .access = PL2_RW, .resetvalue = 0,
>> +              .fieldoffset = offsetof(CPUARMState, pmsav8.hprbar)},
>> +            { .name = "HPRLAR",
>> +              .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 1,
>> +              .access = PL2_RW, .resetvalue = 0,
>> +              .readfn = hprlar_read, .writefn = hprlar_write,
>> +              .fieldoffset = offsetof(CPUARMState, pmsav8.hprlar)},
>> +            { .name = "HPRSELR", .resetvalue = 0,
>> +              .cp = 15, .opc1 = 4, .crn = 6, .crm = 2, .opc2 = 1,
>> +              .access = PL2_RW, .accessfn = access_tvm_trvm,
>> +              .fieldoffset = offsetof(CPUARMState, pmsav8.hprselr)},
>> +            { .name = "HPRENR",
>> +              .cp = 15, .opc1 = 4, .crn = 6, .crm = 1, .opc2 = 1,
>> +              .access = PL2_RW, .resetvalue = 0,
>> +              .readfn = hprenr_read, .writefn = hprenr_write},
>> +        };
> Unless you need to write into some of the fields of this array
> at runtime, make it a static const file-level global. (Compare
> others, like eg pmsav7_cp_reginfo[].)
>
> I think you are missing the VSCTLR register.
>
>>           static const ARMCPRegInfo crn0_wi_reginfo = {
>>               .name = "CRN0_WI", .cp = 15, .crn = 0, .crm = CP_ANY,
>>               .opc1 = CP_ANY, .opc2 = CP_ANY, .access = PL1_W,
>> @@ -8292,6 +8404,65 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>>           define_arm_cp_regs(cpu, id_cp_reginfo);
>>           if (!arm_feature(env, ARM_FEATURE_PMSA)) {
>>               define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
>> +        } else if (arm_feature(env, ARM_FEATURE_V8_R)) {
>> +            uint32_t i = 0;
>> +            char hprbar_string[] = "HPRBAR%u";
>> +            char hprlar_string[] = "HPRLAR%u";
>> +
>> +            char prbar_string[] = "PRBAR%u";
>> +            char prlar_string[] = "PRLAR%u";
>> +            char tmp_string[50];
> Don't use fixed arrays and sprintf(), please, and don't define
> the format string in a variable either. Look at eg the handling
> of RES_0_C0_C%d_X -- use of g_autofree and g_strdup_printf() is
> usually the clearest approach.
>
>> +            define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
>> +            define_arm_cp_regs(cpu, id_pmsav8_r_reginfo);
>> +            for (i = 0; i < cpu->pmsav7_dregion; ++i) {
> This needs to be bounded so it doesn't go above 31, because
> only the first 32 regions get these aliases.
>
>> +                uint8_t crm = 0b1000 | ((i & 0b1110) >> 1);
>> +                uint8_t opc2 = (i & 0x1) << 2;
>> +
>> +                sprintf(tmp_string, hprbar_string, i);
>> +                ARMCPRegInfo tmp_hprbarn_reginfo = {
>> +                    .name = tmp_string,
>> +                    .cp = 15, .opc1 = 4, .crn = 6, .crm = crm, .opc2 = opc2,
>> +                    .access = PL2_RW, .resetvalue = 0,
>> +                    .accessfn = access_tvm_trvm,
>> +                    .fieldoffset = offsetof(CPUARMState, pmsav8.hprbarn)
>> +                    + i * sizeof(env->pmsav8.hprbarn[0])
>> +                };
>> +                define_one_arm_cp_reg(cpu, &tmp_hprbarn_reginfo);
>> +
>> +                sprintf(tmp_string, prbar_string, i);
>> +                ARMCPRegInfo tmp_prbarn_reginfo = {
>> +                    .name = tmp_string,
>> +                    .cp = 15, .opc1 = 0, .crn = 6, .crm = crm, .opc2 = opc2,
>> +                    .access = PL1_RW, .resetvalue = 0,
>> +                    .accessfn = access_tvm_trvm,
>> +                    .fieldoffset = offsetof(CPUARMState, pmsav8.prbarn)
>> +                    + i * sizeof(env->pmsav8.prbarn[0])
>> +                };
>> +                define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);
>> +
>> +                opc2 = (i & 0x1) << 2 | 0x1;
>> +                sprintf(tmp_string, hprlar_string, i);
>> +                ARMCPRegInfo tmp_hprlarn_reginfo = {
>> +                    .name = tmp_string,
>> +                    .cp = 15, .opc1 = 4, .crn = 6, .crm = crm, .opc2 = opc2,
>> +                    .access = PL2_RW, .resetvalue = 0,
>> +                    .accessfn = access_tvm_trvm,
>> +                    .fieldoffset = offsetof(CPUARMState, pmsav8.hprlarn)
>> +                    + i * sizeof(env->pmsav8.hprlarn[0])
>> +                };
>> +                define_one_arm_cp_reg(cpu, &tmp_hprlarn_reginfo);
>> +
>> +                sprintf(tmp_string, prlar_string, i);
>> +                ARMCPRegInfo tmp_prlarn_reginfo = {
>> +                    .name = tmp_string,
>> +                    .cp = 15, .opc1 = 0, .crn = 6, .crm = crm, .opc2 = opc2,
>> +                    .access = PL1_RW, .resetvalue = 0,
>> +                    .accessfn = access_tvm_trvm,
>> +                    .fieldoffset = offsetof(CPUARMState, pmsav8.prlarn)
>> +                    + i * sizeof(env->pmsav8.prlarn[0])
>> +                };
> These registers all need to be marked as ARM_CP_ALIAS,
> because they're just aliases into a different register which is
> handling the migration and reset.
>
>> +                define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
>> +            }
>>           } else if (arm_feature(env, ARM_FEATURE_V7)) {
>>               define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
>>           }
>> --
> thanks
> -- PMM

