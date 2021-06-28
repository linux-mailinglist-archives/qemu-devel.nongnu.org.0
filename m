Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71103B68A8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 20:45:56 +0200 (CEST)
Received: from localhost ([::1]:47694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxwGZ-0000vO-NK
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 14:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxwF0-000052-Il
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:44:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxwEy-0004VF-Qs
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:44:18 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u11so22428286wrw.11
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 11:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6KHoxRytGaAOEvU685H6bGd6aQYc1koGoFqgjPZYoNM=;
 b=LQIUahm7GgYPn+D8UtXKH10c83bj/yIVmHygjlh3Dp1duXPNOu7Fg2eubOpJL7P7zX
 cbwC2nbqYki9ZkXKldx4+IbFIhiFo3xzc9/xNkGsk8nyzHM3xZnknz39XymUxXrVOawf
 HhjpKCPQUT63ArNlQQC7rq75epxRaJYek1ABvC5Y7VCSaDsRz79LbgQjpzFNwTdogjq5
 Pg+WI0lcRIMN/lv4JARlswnE/+9qXT+Cd2gXx8bs+vpZcAEtm+8Gshgt1mELS/Khz872
 47vQzjef5ar+KcrkWEZgHDBVt+vvA8Y9WJyxi1bHPcb8IN7Y2wokN82tHHKHkbz5J2qy
 8x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6KHoxRytGaAOEvU685H6bGd6aQYc1koGoFqgjPZYoNM=;
 b=fSrVT5AVr7fhJsG8Gsi4i1selytpFS+M5nK2lA490sbSfKSfx/gpg3F+cc433PbhAT
 fkdQYC00L0SfpRpUg1uy0ErArGMd47xyYAuO7Pjo1ta5W02EtN8+aGWuuF10S7tKz0Dw
 6ynPqv57d9YHlJWBj3019B4V5SX4O7VY+3VnPKl3Rt+TFpKF65gv7csZEPKPeZhF/xUX
 FWFMtwfD+QAISG6ttlzEzCEDEhb51C4Se3Odpnyaxlw9fFnSLILSC0UeUsxN4qYtM8GS
 uCMzhRYWZVOluAm4DAGDFVBRKzpaEtaBZiJcCfW6NHCB9RgmLk+3SojubrFTrNP2iZM5
 WtfA==
X-Gm-Message-State: AOAM533tXUo8bosGsiyUSGpYtv7S7xJLcbpqUcxPtjMGDUmJPaOX1vJN
 pItBMQEA25nOMiIxrHgqbcs=
X-Google-Smtp-Source: ABdhPJyxOaKi2OWf17gvMY68cgTj5naNd6BQ4rgLb9PAdn4xil9mgHV9Q6xxihQ1q6sUMhu+la9bfQ==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr28273972wrs.128.1624905855422; 
 Mon, 28 Jun 2021 11:44:15 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w9sm15499936wru.3.2021.06.28.11.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 11:44:14 -0700 (PDT)
Subject: Re: [PATCH 03/20] target/loongarch: Add core definition
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-4-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <afb80d5f-0e0d-9fa2-337d-df828a7cdad7@amsat.org>
Date: Mon, 28 Jun 2021 20:44:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624881885-31692-4-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/28/21 2:04 PM, Song Gao wrote:
> This patch add target state header,target definitions
> and initialization routines.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  target/loongarch/cpu-param.h |  21 ++
>  target/loongarch/cpu-qom.h   |  41 ++++
>  target/loongarch/cpu.c       | 451 +++++++++++++++++++++++++++++++++++++++++++
>  target/loongarch/cpu.h       | 245 +++++++++++++++++++++++
>  target/loongarch/internal.h  |  74 +++++++
>  5 files changed, 832 insertions(+)
>  create mode 100644 target/loongarch/cpu-param.h
>  create mode 100644 target/loongarch/cpu-qom.h
>  create mode 100644 target/loongarch/cpu.c
>  create mode 100644 target/loongarch/cpu.h
>  create mode 100644 target/loongarch/internal.h

> +#define LOONGARCH_CONFIG1                                                   \
> +((0x8 << CSR_CONF1_KSNUM_SHIFT) | (0x2f << CSR_CONF1_TMRBITS_SHIFT) |       \
> + (0x7 << CSR_CONF1_VSMAX_SHIFT))
> +
> +#define LOONGARCH_CONFIG3                                                   \
> +((0x2 << CSR_CONF3_TLBORG_SHIFT) | (0x3f << CSR_CONF3_MTLBSIZE_SHIFT) |     \
> + (0x7 << CSR_CONF3_STLBWAYS_SHIFT) | (0x8 << CSR_CONF3_STLBIDX_SHIFT))
> +
> +#define LOONGARCH_MCSR0                                                     \
> +((0x0UL << MCSR0_GR32_SHIFT) | (0x1UL << MCSR0_GR64_SHIFT) |                \
> + (0x1UL << MCSR0_PAGING_SHIFT) | (0x1UL << MCSR0_IOCSR_SHIFT) |             \
> + (0x2fUL << MCSR0_PABIT_SHIFT) | (0x2fUL << MCSR0_VABIT_SHIFT) |            \
> + (0x1UL << MCSR0_UAL_SHIFT) | (0x1UL << MCSR0_RI_SHIFT) |                   \
> + (0x1UL << MCSR0_EXEPROT_SHIFT) | (0x1UL << MCSR0_RPLVTLB_SHIFT) |          \
> + (0x1UL << MCSR0_HUGEPG_SHIFT) | (0x1UL << MCSR0_IOCSR_BRD_SHIFT) |         \
> + (0x0UL << MCSR0_INT_IMPL_SHIFT) | MCSR0_PRID)
> +
> +#define LOONGARCH_MCSR1                                                     \
> +((0x1UL << MCSR1_FP_SHIFT) | (0x1UL << MCSR1_FPSP_SHIFT) |                  \
> + (0x1UL << MCSR1_FPDP_SHIFT) | (0x1UL << MCSR1_FPVERS_SHIFT) |              \
> + (0x1UL << MCSR1_LSX_SHIFT) | (0x1UL << MCSR1_LASX_SHIFT) |                 \
> + (0x1UL << MCSR1_COMPLEX_SHIFT) | (0x1UL << MCSR1_CRYPTO_SHIFT) |           \
> + (0x0UL << MCSR1_VZ_SHIFT) | (0x0UL << MCSR1_VZVERS_SHIFT) |                \
> + (0x1UL << MCSR1_LLFTP_SHIFT) | (0x1UL << MCSR1_LLFTPVERS_SHIFT) |          \
> + (0x0UL << MCSR1_X86BT_SHIFT) | (0x0UL << MCSR1_ARMBT_SHIFT) |              \
> + (0x0UL << MCSR1_LOONGARCHBT_SHIFT) | (0x1UL << MCSR1_LSPW_SHIFT) |         \
> + (0x1UL << MCSR1_LAMO_SHIFT) | (0x1UL << MCSR1_CCDMA_SHIFT) |               \
> + (0x1UL << MCSR1_SFB_SHIFT) | (0x1UL << MCSR1_UCACC_SHIFT) |                \
> + (0x1UL << MCSR1_LLEXC_SHIFT) | (0x1UL << MCSR1_SCDLY_SHIFT) |              \
> + (0x1UL << MCSR1_LLDBAR_SHIFT) | (0x1UL << MCSR1_ITLBT_SHIFT) |             \
> + (0x1UL << MCSR1_ICACHET_SHIFT) | (0x4UL << MCSR1_SPW_LVL_SHIFT) |          \
> + (0x1UL << MCSR1_HPFOLD_SHIFT))
> +
> +#define LOONGARCH_MCSR2                                                     \
> +((0x1UL << MCSR2_CCMUL_SHIFT) | (0x1UL << MCSR2_CCDIV_SHIFT) | CCFREQ_DEFAULT)
> +
> +#define LOONGARCH_MCSR3                                                     \
> +((0x1UL << MCSR3_PMP_SHIFT) | (0x1UL << MCSR3_PAMVER_SHIFT) |               \
> + (0x3UL << MCSR3_PMNUM_SHIFT) | (0x3fUL < MCSR3_PMBITS_SHIFT) |             \
> + (0x1UL << MCSR3_UPM_SHIFT))
> +
> +
> +#define LOONGARCH_MCSR8                                                     \
> +((0x1UL << MCSR8_L1IUPRE_SHIFT)   | (0x0 << MCSR8_L1IUUNIFY_SHIFT) |        \
> + (0x1UL << MCSR8_L1DPRE_SHIFT)    | (0x1UL << MCSR8_L2IUPRE_SHIFT) |        \
> + (0x1UL << MCSR8_L2IUUNIFY_SHIFT) | (0x1UL << MCSR8_L2IUPRIV_SHIFT) |       \
> + (0x0 << MCSR8_L2IUINCL_SHIFT)    | (0x0 << MCSR8_L2DPRE_SHIFT) |           \
> + (0x0 << MCSR8_L2DPRIV_SHIFT)     | (0x0 << MCSR8_L2DINCL_SHIFT) |          \
> + (0x1UL << MCSR8_L3IUPRE_SHIFT)   | (0x1UL << MCSR8_L3IUUNIFY_SHIFT) |      \
> + (0x0 << MCSR8_L3IUPRIV_SHIFT)    | (0x1UL << MCSR8_L3IUINCL_SHIFT) |       \
> + (0x0 << MCSR8_L3DPRE_SHIFT)      | (0x0 < MCSR8_L3DPRIV_SHIFT) |           \
> + (0x0 << MCSR8_L3DINCL_SHIFT)     | (0x3UL << MCSR8_L1I_WAY_SHIFT) |        \
> + (0x8UL << MCSR8_L1I_IDX_SHIFT)   | (0x6UL << MCSR8_L1I_SIZE_SHIFT))
> +
> +#define LOONGARCH_MCSR9                                                     \
> +((0x3UL << MCSR9_L1D_WAY_SHIFT) | (0x8UL << MCSR9_L1D_IDX_SHIFT) |          \
> + (0x6UL << MCSR9_L1D_SIZE_SHIFT) | (0xfUL << MCSR9_L2U_WAY_SHIFT) |         \
> + (0x8UL << MCSR9_L2U_IDX_SHIFT) |  (0x6UL << MCSR9_L2U_SIZE_SHIFT))
> +
> +#define LOONGARCH_MCSR10                                                    \
> +((0xfUL << MCSR10_L3U_WAY_SHIFT) | (0xfUL << MCSR10_L3U_IDX_SHIFT) |        \
> + (0x6UL << MCSR10_L3U_SIZE_SHIFT))
> +
> +#define LOONGARCH_MCSR24                                                    \
> +((0x0 << MCSR24_MCSRLOCK_SHIFT) | (0x0 << MCSR24_NAPEN_SHIFT) |             \
> + (0x0 << MCSR24_VFPUCG_SHIFT) | (0x0 << MCSR24_RAMCG_SHIFT))
> +
> +/* LoongArch CPU definitions */
> +const loongarch_def_t loongarch_defs[] = {
> +    {
> +        .name = "Loongson-3A5000",
> +
> +        /* for LoongArch CSR */
> +        .CSR_PRCFG1 = LOONGARCH_CONFIG1,
> +        .CSR_PRCFG2 = 0x3ffff000,
> +        .CSR_PRCFG3 = LOONGARCH_CONFIG3,
> +        .CSR_CRMD = (0 << CSR_CRMD_PLV_SHIFT) | (0 << CSR_CRMD_IE_SHIFT) |
> +                    (1 << CSR_CRMD_DA_SHIFT) | (0 << CSR_CRMD_PG_SHIFT) |
> +                    (1 << CSR_CRMD_DACF_SHIFT) | (1 << CSR_CRMD_DACM_SHIFT),
> +        .CSR_ECFG = 0x7 << 16,
> +        .CSR_STLBPGSIZE  = 0xe,
> +        .CSR_RVACFG = 0x0,
> +        .CSR_MCSR0 = LOONGARCH_MCSR0,
> +        .CSR_MCSR1 = LOONGARCH_MCSR1,
> +        .CSR_MCSR2 = LOONGARCH_MCSR2,
> +        .CSR_MCSR3 = 0,
> +        .CSR_MCSR8 = LOONGARCH_MCSR8,
> +        .CSR_MCSR9 = LOONGARCH_MCSR9,
> +        .CSR_MCSR10 = LOONGARCH_MCSR10,
> +        .CSR_MCSR24 = LOONGARCH_MCSR24,
> +        .FCSR0 = 0x0,
> +        .FCSR0_MASK = 0x1f1f03df,
> +        .PABITS = 48,
> +        .INSN_FLAGS = CPU_LA64 | INSN_LOONGARCH,
> +        .MMU_TYPE = MMU_TYPE_LS3A5K,
> +    },
> +    {
> +        .name = "host",
> +
> +        /* for LoongArch CSR */
> +        .CSR_PRCFG1 = LOONGARCH_CONFIG1,
> +        .CSR_PRCFG2 = 0x3ffff000,
> +        .CSR_PRCFG3 = LOONGARCH_CONFIG3,
> +        .CSR_CRMD = (0 << CSR_CRMD_PLV_SHIFT) | (0 << CSR_CRMD_IE_SHIFT) |
> +                    (1 << CSR_CRMD_DA_SHIFT) | (0 << CSR_CRMD_PG_SHIFT) |
> +                    (1 << CSR_CRMD_DACF_SHIFT) | (1 << CSR_CRMD_DACM_SHIFT),
> +        .CSR_ECFG = 0x7 << 16,
> +        .CSR_STLBPGSIZE  = 0xe,
> +        .CSR_RVACFG = 0x0,
> +        .CSR_MCSR0 = LOONGARCH_MCSR0,
> +        .CSR_MCSR1 = LOONGARCH_MCSR1,
> +        .CSR_MCSR2 = LOONGARCH_MCSR2,
> +        .CSR_MCSR3 = 0,
> +        .CSR_MCSR8 = LOONGARCH_MCSR8,
> +        .CSR_MCSR9 = LOONGARCH_MCSR9,
> +        .CSR_MCSR10 = LOONGARCH_MCSR10,
> +        .CSR_MCSR24 = LOONGARCH_MCSR24,
> +        .FCSR0 = 0x0,
> +        .FCSR0_MASK = 0x1f1f03df,
> +        .PABITS = 48,
> +        .INSN_FLAGS = CPU_LA64 | INSN_LOONGARCH,
> +        .MMU_TYPE = MMU_TYPE_LS3A5K,
> +    },
> +};
> +
> +const int loongarch_defs_number = ARRAY_SIZE(loongarch_defs);

You seem to have followed the MIPS pattern we are hardly trying to
move away. Better would be to follow the ARM pattern, which seems the
state of the art to add new CPU features.

