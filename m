Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C8E33301D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:42:35 +0100 (CET)
Received: from localhost ([::1]:53114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjBa-0001Yv-Kh
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJiJr-00077n-HB
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:47:03 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:37947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJiJp-0008Ny-Lc
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:47:03 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MkHd3-1m3XeX0KUL-00khV1; Tue, 09 Mar 2021 20:47:00 +0100
Subject: Re: [PATCH v2 2/3] target/m68k: reformat m68k_features enum
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210308121155.2476-1-mark.cave-ayland@ilande.co.uk>
 <20210308121155.2476-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <77f52641-6fe2-4ce5-c2d2-a0756c416fe5@vivier.eu>
Date: Tue, 9 Mar 2021 20:46:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308121155.2476-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WZ1VqF4VIIqOuHLXvcu2X5x0MYg/Sl2bRhLEF1eoJTz8xvHY8YU
 HTx74WW3co1ooMcXMZiSwmN1B6L/Irk+eOlntI8EkLmmWd+Nr+dQcfWkkAjZw792cY8k+di
 bOPLdM9gNw7FzCDaYFNqBWlGgLud9sOvHlp8NV9iwro2SzUdZerjSIJWImgAw6gLIjouxRd
 MMYdByi4XTohrRqNFVvhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hWOe76I726U=:2nJajv0sxOta8CRrsA0W8D
 4foftDTtiBpCXnI9+dv+ehwpzSI9Wpq6kn1oS1eYaCF6ITgA/0c2xUIc2q0it4CUnmn+GPhdZ
 //MHiDt9R7ezmkbTz0Gh5R9xFSxY9uWMWAAnvapPx4x+QUVVifXlz5+wIjrOLcS8WWzXlrH95
 81rgZ3ub1dDQfGrfh8S4T7S0wf+DH7sAmU/b+2bPjBT0xPIDqqAZBJLNvHxvK9wteAJiF6NtY
 Nz2BaD677uQ9TDYeJNrqAt70hKT+B6rxXFumF5+mH5i19wb5rGu4dHOxaIVlshf/jWfYQ1OXr
 40iAAxFO9NqgSP9sY3ZPV+Y7aO6Dh9gcAD1zkwU7wsL2ZmiDwSnQuvSvthUxBZWZwNoxwq9WW
 VxPKQkB+4S/3Vfq/ynY/ecxY3AUIA3v7x9BjNRffhG3h8dQq3BJmE/S5TmCJiiadMhcTz3ZEf
 a3A/55lhyg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Applied to my m68k-for-6.0 branch

Thanks,
Laurent


