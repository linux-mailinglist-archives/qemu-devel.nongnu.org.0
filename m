Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEF13B6EEB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 09:41:11 +0200 (CEST)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly8Mm-0005CP-Lv
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 03:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ly8Lk-0004Pk-D9
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:40:04 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53218 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1ly8Lh-0000lk-JM
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:40:04 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr0FKztpgoy8aAA--.31445S3; 
 Tue, 29 Jun 2021 15:39:56 +0800 (CST)
Subject: Re: [PATCH 03/20] target/loongarch: Add core definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-4-git-send-email-gaosong@loongson.cn>
 <afb80d5f-0e0d-9fa2-337d-df828a7cdad7@amsat.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <6910155e-882a-2630-77c5-d02496f51374@loongson.cn>
Date: Tue, 29 Jun 2021 15:39:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <afb80d5f-0e0d-9fa2-337d-df828a7cdad7@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr0FKztpgoy8aAA--.31445S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw15AF48Wry8JFyfWrWrGrg_yoWxArykpr
 1UCF4rCr1UJFn7K3sIgrnYqFZ8Jrs7Awn0gwsxXrs5KrnY93Z5Cw4kA3Z3CF1jqr15GF1x
 Zw1Ut3ZFkF1IgaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r10
 6r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3
 Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On 06/29/2021 02:44 AM, Philippe Mathieu-Daudé wrote:
> On 6/28/21 2:04 PM, Song Gao wrote:
>> This patch add target state header,target definitions
>> and initialization routines.
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  target/loongarch/cpu-param.h |  21 ++
>>  target/loongarch/cpu-qom.h   |  41 ++++
>>  target/loongarch/cpu.c       | 451 +++++++++++++++++++++++++++++++++++++++++++
>>  target/loongarch/cpu.h       | 245 +++++++++++++++++++++++
>>  target/loongarch/internal.h  |  74 +++++++
>>  5 files changed, 832 insertions(+)
>>  create mode 100644 target/loongarch/cpu-param.h
>>  create mode 100644 target/loongarch/cpu-qom.h
>>  create mode 100644 target/loongarch/cpu.c
>>  create mode 100644 target/loongarch/cpu.h
>>  create mode 100644 target/loongarch/internal.h
> 
>> +#define LOONGARCH_CONFIG1                                                   \
>> +((0x8 << CSR_CONF1_KSNUM_SHIFT) | (0x2f << CSR_CONF1_TMRBITS_SHIFT) |       \
>> + (0x7 << CSR_CONF1_VSMAX_SHIFT))
>> +
>> +#define LOONGARCH_CONFIG3                                                   \
>> +((0x2 << CSR_CONF3_TLBORG_SHIFT) | (0x3f << CSR_CONF3_MTLBSIZE_SHIFT) |     \
>> + (0x7 << CSR_CONF3_STLBWAYS_SHIFT) | (0x8 << CSR_CONF3_STLBIDX_SHIFT))
>> +
>> +#define LOONGARCH_MCSR0                                                     \
>> +((0x0UL << MCSR0_GR32_SHIFT) | (0x1UL << MCSR0_GR64_SHIFT) |                \
>> + (0x1UL << MCSR0_PAGING_SHIFT) | (0x1UL << MCSR0_IOCSR_SHIFT) |             \
>> + (0x2fUL << MCSR0_PABIT_SHIFT) | (0x2fUL << MCSR0_VABIT_SHIFT) |            \
>> + (0x1UL << MCSR0_UAL_SHIFT) | (0x1UL << MCSR0_RI_SHIFT) |                   \
>> + (0x1UL << MCSR0_EXEPROT_SHIFT) | (0x1UL << MCSR0_RPLVTLB_SHIFT) |          \
>> + (0x1UL << MCSR0_HUGEPG_SHIFT) | (0x1UL << MCSR0_IOCSR_BRD_SHIFT) |         \
>> + (0x0UL << MCSR0_INT_IMPL_SHIFT) | MCSR0_PRID)
>> +
>> +#define LOONGARCH_MCSR1                                                     \
>> +((0x1UL << MCSR1_FP_SHIFT) | (0x1UL << MCSR1_FPSP_SHIFT) |                  \
>> + (0x1UL << MCSR1_FPDP_SHIFT) | (0x1UL << MCSR1_FPVERS_SHIFT) |              \
>> + (0x1UL << MCSR1_LSX_SHIFT) | (0x1UL << MCSR1_LASX_SHIFT) |                 \
>> + (0x1UL << MCSR1_COMPLEX_SHIFT) | (0x1UL << MCSR1_CRYPTO_SHIFT) |           \
>> + (0x0UL << MCSR1_VZ_SHIFT) | (0x0UL << MCSR1_VZVERS_SHIFT) |                \
>> + (0x1UL << MCSR1_LLFTP_SHIFT) | (0x1UL << MCSR1_LLFTPVERS_SHIFT) |          \
>> + (0x0UL << MCSR1_X86BT_SHIFT) | (0x0UL << MCSR1_ARMBT_SHIFT) |              \
>> + (0x0UL << MCSR1_LOONGARCHBT_SHIFT) | (0x1UL << MCSR1_LSPW_SHIFT) |         \
>> + (0x1UL << MCSR1_LAMO_SHIFT) | (0x1UL << MCSR1_CCDMA_SHIFT) |               \
>> + (0x1UL << MCSR1_SFB_SHIFT) | (0x1UL << MCSR1_UCACC_SHIFT) |                \
>> + (0x1UL << MCSR1_LLEXC_SHIFT) | (0x1UL << MCSR1_SCDLY_SHIFT) |              \
>> + (0x1UL << MCSR1_LLDBAR_SHIFT) | (0x1UL << MCSR1_ITLBT_SHIFT) |             \
>> + (0x1UL << MCSR1_ICACHET_SHIFT) | (0x4UL << MCSR1_SPW_LVL_SHIFT) |          \
>> + (0x1UL << MCSR1_HPFOLD_SHIFT))
>> +
>> +#define LOONGARCH_MCSR2                                                     \
>> +((0x1UL << MCSR2_CCMUL_SHIFT) | (0x1UL << MCSR2_CCDIV_SHIFT) | CCFREQ_DEFAULT)
>> +
>> +#define LOONGARCH_MCSR3                                                     \
>> +((0x1UL << MCSR3_PMP_SHIFT) | (0x1UL << MCSR3_PAMVER_SHIFT) |               \
>> + (0x3UL << MCSR3_PMNUM_SHIFT) | (0x3fUL < MCSR3_PMBITS_SHIFT) |             \
>> + (0x1UL << MCSR3_UPM_SHIFT))
>> +
>> +
>> +#define LOONGARCH_MCSR8                                                     \
>> +((0x1UL << MCSR8_L1IUPRE_SHIFT)   | (0x0 << MCSR8_L1IUUNIFY_SHIFT) |        \
>> + (0x1UL << MCSR8_L1DPRE_SHIFT)    | (0x1UL << MCSR8_L2IUPRE_SHIFT) |        \
>> + (0x1UL << MCSR8_L2IUUNIFY_SHIFT) | (0x1UL << MCSR8_L2IUPRIV_SHIFT) |       \
>> + (0x0 << MCSR8_L2IUINCL_SHIFT)    | (0x0 << MCSR8_L2DPRE_SHIFT) |           \
>> + (0x0 << MCSR8_L2DPRIV_SHIFT)     | (0x0 << MCSR8_L2DINCL_SHIFT) |          \
>> + (0x1UL << MCSR8_L3IUPRE_SHIFT)   | (0x1UL << MCSR8_L3IUUNIFY_SHIFT) |      \
>> + (0x0 << MCSR8_L3IUPRIV_SHIFT)    | (0x1UL << MCSR8_L3IUINCL_SHIFT) |       \
>> + (0x0 << MCSR8_L3DPRE_SHIFT)      | (0x0 < MCSR8_L3DPRIV_SHIFT) |           \
>> + (0x0 << MCSR8_L3DINCL_SHIFT)     | (0x3UL << MCSR8_L1I_WAY_SHIFT) |        \
>> + (0x8UL << MCSR8_L1I_IDX_SHIFT)   | (0x6UL << MCSR8_L1I_SIZE_SHIFT))
>> +
>> +#define LOONGARCH_MCSR9                                                     \
>> +((0x3UL << MCSR9_L1D_WAY_SHIFT) | (0x8UL << MCSR9_L1D_IDX_SHIFT) |          \
>> + (0x6UL << MCSR9_L1D_SIZE_SHIFT) | (0xfUL << MCSR9_L2U_WAY_SHIFT) |         \
>> + (0x8UL << MCSR9_L2U_IDX_SHIFT) |  (0x6UL << MCSR9_L2U_SIZE_SHIFT))
>> +
>> +#define LOONGARCH_MCSR10                                                    \
>> +((0xfUL << MCSR10_L3U_WAY_SHIFT) | (0xfUL << MCSR10_L3U_IDX_SHIFT) |        \
>> + (0x6UL << MCSR10_L3U_SIZE_SHIFT))
>> +
>> +#define LOONGARCH_MCSR24                                                    \
>> +((0x0 << MCSR24_MCSRLOCK_SHIFT) | (0x0 << MCSR24_NAPEN_SHIFT) |             \
>> + (0x0 << MCSR24_VFPUCG_SHIFT) | (0x0 << MCSR24_RAMCG_SHIFT))
>> +
>> +/* LoongArch CPU definitions */
>> +const loongarch_def_t loongarch_defs[] = {
>> +    {
>> +        .name = "Loongson-3A5000",
>> +
>> +        /* for LoongArch CSR */
>> +        .CSR_PRCFG1 = LOONGARCH_CONFIG1,
>> +        .CSR_PRCFG2 = 0x3ffff000,
>> +        .CSR_PRCFG3 = LOONGARCH_CONFIG3,
>> +        .CSR_CRMD = (0 << CSR_CRMD_PLV_SHIFT) | (0 << CSR_CRMD_IE_SHIFT) |
>> +                    (1 << CSR_CRMD_DA_SHIFT) | (0 << CSR_CRMD_PG_SHIFT) |
>> +                    (1 << CSR_CRMD_DACF_SHIFT) | (1 << CSR_CRMD_DACM_SHIFT),
>> +        .CSR_ECFG = 0x7 << 16,
>> +        .CSR_STLBPGSIZE  = 0xe,
>> +        .CSR_RVACFG = 0x0,
>> +        .CSR_MCSR0 = LOONGARCH_MCSR0,
>> +        .CSR_MCSR1 = LOONGARCH_MCSR1,
>> +        .CSR_MCSR2 = LOONGARCH_MCSR2,
>> +        .CSR_MCSR3 = 0,
>> +        .CSR_MCSR8 = LOONGARCH_MCSR8,
>> +        .CSR_MCSR9 = LOONGARCH_MCSR9,
>> +        .CSR_MCSR10 = LOONGARCH_MCSR10,
>> +        .CSR_MCSR24 = LOONGARCH_MCSR24,
>> +        .FCSR0 = 0x0,
>> +        .FCSR0_MASK = 0x1f1f03df,
>> +        .PABITS = 48,
>> +        .INSN_FLAGS = CPU_LA64 | INSN_LOONGARCH,
>> +        .MMU_TYPE = MMU_TYPE_LS3A5K,
>> +    },
>> +    {
>> +        .name = "host",
>> +
>> +        /* for LoongArch CSR */
>> +        .CSR_PRCFG1 = LOONGARCH_CONFIG1,
>> +        .CSR_PRCFG2 = 0x3ffff000,
>> +        .CSR_PRCFG3 = LOONGARCH_CONFIG3,
>> +        .CSR_CRMD = (0 << CSR_CRMD_PLV_SHIFT) | (0 << CSR_CRMD_IE_SHIFT) |
>> +                    (1 << CSR_CRMD_DA_SHIFT) | (0 << CSR_CRMD_PG_SHIFT) |
>> +                    (1 << CSR_CRMD_DACF_SHIFT) | (1 << CSR_CRMD_DACM_SHIFT),
>> +        .CSR_ECFG = 0x7 << 16,
>> +        .CSR_STLBPGSIZE  = 0xe,
>> +        .CSR_RVACFG = 0x0,
>> +        .CSR_MCSR0 = LOONGARCH_MCSR0,
>> +        .CSR_MCSR1 = LOONGARCH_MCSR1,
>> +        .CSR_MCSR2 = LOONGARCH_MCSR2,
>> +        .CSR_MCSR3 = 0,
>> +        .CSR_MCSR8 = LOONGARCH_MCSR8,
>> +        .CSR_MCSR9 = LOONGARCH_MCSR9,
>> +        .CSR_MCSR10 = LOONGARCH_MCSR10,
>> +        .CSR_MCSR24 = LOONGARCH_MCSR24,
>> +        .FCSR0 = 0x0,
>> +        .FCSR0_MASK = 0x1f1f03df,
>> +        .PABITS = 48,
>> +        .INSN_FLAGS = CPU_LA64 | INSN_LOONGARCH,
>> +        .MMU_TYPE = MMU_TYPE_LS3A5K,
>> +    },
>> +};
>> +
>> +const int loongarch_defs_number = ARRAY_SIZE(loongarch_defs);
> 
> You seem to have followed the MIPS pattern we are hardly trying to
> move away. Better would be to follow the ARM pattern, which seems the
> state of the art to add new CPU features.
> 
OK, We will do it according to your suggestion.

thanks


