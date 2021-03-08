Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6371E331680
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:48:54 +0100 (CET)
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKw1-0004Vh-DG
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJJlM-0007eL-R4
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:48 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:46217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJJkz-0007BZ-SU
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:48 -0500
Received: from [192.168.100.1] ([82.252.159.174]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPoTl-1l5kos451X-00MvNm; Mon, 08 Mar 2021 18:33:22 +0100
Subject: Re: [PATCH v2 2/3] target/m68k: reformat m68k_features enum
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210308121155.2476-1-mark.cave-ayland@ilande.co.uk>
 <20210308121155.2476-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <732e8cd1-60d3-915a-0c8c-dff5d9c20449@vivier.eu>
Date: Mon, 8 Mar 2021 18:33:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308121155.2476-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qGBsdG21ByL+hgtI1+7dn+qA2lRWz2iMMmRu5fCQTYAMrTIrWfE
 mpHIn2mh669C+Zr448nPyoUQXwxTCvRMkVv/pDXOhL2kWqWOy3xF8vMusrmzbsqqkIEI7g0
 JD9Yjvd/K9LexrmHznTud3YnVblh7mwnV0URK6eMw4waWKpVszDjkvAmI1X4GmRtJxNfZM9
 GcmKlp4rj7hTZjnc+Kbhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5j1Tr+6t2eQ=:dGxem9AxLuEgz9I7irrC7m
 8pcBJyHrs16sj363YzW8dLIuvmMC2xjRFr8xajvnQD5QZUfsoxPPFgEWHE16UQPXVK8KQJ0Vq
 gnIycO1OAn9YKFTzjX3CfAmDpqKEH1LPW5pf8EkA44zJa/P1WQHp2YnkgI7zCWphMpNHmhkyR
 3uaYMbNK6J1mrciSD4mfJLcFbTxvUKNr7rlk5MWT4FduSShliK1qclJxcOhSjqlwV2qEpUK1g
 0pSjfdCXsbogVDIjlQAnLczSXKnTYR7BbQUXKBHDf0W+0rG2EaU1R9PAzNkXZgovtXM/cebOs
 pGLXr31O0dQhVBGo3/NQqVveTWT9orYQTBqsLCe//lK0PWvAs1V3Xxr2zRuWCCraLUjX77vda
 QU9eCd6GxfcgYkY2yiX9PoAiOJHPJPPjkaCrsQt358BezBd3/pz261oTpZfM8
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/03/2021 à 13:11, Mark Cave-Ayland a écrit :
> Move the feature comment from after the feature name to the preceding line to
> allow for longer feature names and descriptions without hitting the 80
> character line limit.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  target/m68k/cpu.h | 66 +++++++++++++++++++++++++++++++----------------
>  1 file changed, 44 insertions(+), 22 deletions(-)
> 
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 7c3feeaf8a..ce558e9b03 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -475,36 +475,58 @@ void do_m68k_semihosting(CPUM68KState *env, int nr);
>   */
>  
>  enum m68k_features {
> -    M68K_FEATURE_M68000,   /* Base m68k instruction set */
> +    /* Base m68k instruction set */
> +    M68K_FEATURE_M68000,
>      M68K_FEATURE_M68010,
>      M68K_FEATURE_M68020,
>      M68K_FEATURE_M68030,
>      M68K_FEATURE_M68040,
>      M68K_FEATURE_M68060,
> -    M68K_FEATURE_CF_ISA_A, /* Base Coldfire set Rev A. */
> -    M68K_FEATURE_CF_ISA_B, /* (ISA B or C). */
> -    M68K_FEATURE_CF_ISA_APLUSC, /* BIT/BITREV, FF1, STRLDSR (ISA A+ or C). */
> -    M68K_FEATURE_BRAL, /* BRA with Long branch. (680[2346]0, ISA A+ or B). */
> +    /* Base Coldfire set Rev A. */
> +    M68K_FEATURE_CF_ISA_A,
> +    /* (ISA B or C). */
> +    M68K_FEATURE_CF_ISA_B,
> +    /* BIT/BITREV, FF1, STRLDSR (ISA A+ or C). */
> +    M68K_FEATURE_CF_ISA_APLUSC,
> +    /* BRA with Long branch. (680[2346]0, ISA A+ or B). */
> +    M68K_FEATURE_BRAL,
>      M68K_FEATURE_CF_FPU,
>      M68K_FEATURE_CF_MAC,
>      M68K_FEATURE_CF_EMAC,
> -    M68K_FEATURE_CF_EMAC_B,   /* Revision B EMAC (dual accumulate). */
> -    M68K_FEATURE_USP, /* User Stack Pointer. (680[012346]0, ISA A+, B or C).*/
> -    M68K_FEATURE_MSP, /* Master Stack Pointer. (680[234]0) */
> -    M68K_FEATURE_EXT_FULL,    /* 68020+ full extension word. */
> -    M68K_FEATURE_WORD_INDEX,  /* word sized address index registers. */
> -    M68K_FEATURE_SCALED_INDEX, /* scaled address index registers. */
> -    M68K_FEATURE_LONG_MULDIV, /* 32 bit mul/div. (680[2346]0, and CPU32) */
> -    M68K_FEATURE_QUAD_MULDIV, /* 64 bit mul/div. (680[2346]0, and CPU32) */
> -    M68K_FEATURE_BCCL,  /* Bcc with Long branches. (680[2346]0, and CPU32) */
> -    M68K_FEATURE_BITFIELD, /* BFxxx Bit field insns. (680[2346]0) */
> -    M68K_FEATURE_FPU,   /* fpu insn. (680[46]0) */
> -    M68K_FEATURE_CAS,   /* CAS/CAS2[WL] insns. (680[2346]0) */
> -    M68K_FEATURE_BKPT,  /* BKPT insn. (680[12346]0, and CPU32) */
> -    M68K_FEATURE_RTD,   /* RTD insn. (680[12346]0, and CPU32) */
> -    M68K_FEATURE_CHK2,  /* CHK2 insn. (680[2346]0, and CPU32) */
> -    M68K_FEATURE_MOVEP, /* MOVEP insn. (680[01234]0, and CPU32) */
> -    M68K_FEATURE_MOVEC, /* MOVEC insn. (from 68010) */
> +    /* Revision B EMAC (dual accumulate). */
> +    M68K_FEATURE_CF_EMAC_B,
> +    /* User Stack Pointer. (680[012346]0, ISA A+, B or C). */
> +    M68K_FEATURE_USP,
> +    /* Master Stack Pointer. (680[234]0) */
> +    M68K_FEATURE_MSP,
> +    /* 68020+ full extension word. */
> +    M68K_FEATURE_EXT_FULL,
> +    /* word sized address index registers. */
> +    M68K_FEATURE_WORD_INDEX,
> +    /* scaled address index registers. */
> +    M68K_FEATURE_SCALED_INDEX,
> +    /* 32 bit mul/div. (680[2346]0, and CPU32) */
> +    M68K_FEATURE_LONG_MULDIV,
> +    /* 64 bit mul/div. (680[2346]0, and CPU32) */
> +    M68K_FEATURE_QUAD_MULDIV,
> +    /* Bcc with Long branches. (680[2346]0, and CPU32) */
> +    M68K_FEATURE_BCCL,
> +    /* BFxxx Bit field insns. (680[2346]0) */
> +    M68K_FEATURE_BITFIELD,
> +    /* fpu insn. (680[46]0) */
> +    M68K_FEATURE_FPU,
> +    /* CAS/CAS2[WL] insns. (680[2346]0) */
> +    M68K_FEATURE_CAS,
> +    /* BKPT insn. (680[12346]0, and CPU32) */
> +    M68K_FEATURE_BKPT,
> +    /* RTD insn. (680[12346]0, and CPU32) */
> +    M68K_FEATURE_RTD,
> +    /* CHK2 insn. (680[2346]0, and CPU32) */
> +    M68K_FEATURE_CHK2,
> +    /* MOVEP insn. (680[01234]0, and CPU32) */
> +    M68K_FEATURE_MOVEP,
> +    /* MOVEC insn. (from 68010) */
> +    M68K_FEATURE_MOVEC,
>  };
>  
>  static inline int m68k_feature(CPUM68KState *env, int feature)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

