Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC48E3304C4
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 22:03:47 +0100 (CET)
Received: from localhost ([::1]:60636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ0Z0-00073s-Hq
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 16:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJ0UR-0002xz-CW
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 15:59:03 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:45731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJ0UP-0007Ia-NG
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 15:59:03 -0500
Received: from [192.168.100.1] ([82.252.159.174]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MXp1Q-1lFiBs0CgW-00YCvZ; Sun, 07 Mar 2021 21:59:00 +0100
Subject: Re: [PATCH 2/2] target/m68k: add M68K_FEATURE_NO_DALIGN feature
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210307202607.27745-1-mark.cave-ayland@ilande.co.uk>
 <20210307202607.27745-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <115a6a16-4b7a-8ed3-7dec-51262855b545@vivier.eu>
Date: Sun, 7 Mar 2021 21:58:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210307202607.27745-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zfJe70xci0QSTkBQHNUpw6LZBsZiAcdRtCdrxzyHLGj+w5nursW
 CEaPUpzH6eMkbPzr1UIn+jyBC+sJWU4sPmadHVvhzDho+Of71HC/S12ZrZpbOxmbn9VopNC
 W8CFCu/fnNpZnSLTF7ANOcf2fBUD4JUR3xnTO2l5mHvkhRd2+Yuu5/qzaPqmNx/v2LACQuE
 gBRAHMV/gkWZBXcKnKVPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TgfhOieJi7U=:TUOl87Jl+K16s3c0Kgl1q5
 68rm69up3dADSXwdjyFxzAEFUb/5JyxkyYGjjMameGiXF2bU43n+vbifmLPxHhcQ4yPPE/l3F
 PktYHoLPSErjtiaunN0o46IaVS0EaGkV6e07ldBVWdWcGu0g2tacBBFdAeBURge0jpmH3pW89
 LMLKRXXD3OYsHKM5gyI+itgkS6ejCaEWT1U9kOQY3mNo+0eI4lV9wdBrf2X+/NFFcqkMOm7hY
 O7p3TIwTC0dBIyrDhp+xBEzQDFz5VSNTUV7nyCbKwHn/3pIIvZ5Na1VW0jTbUKJ8MpSbb6XhS
 Hlieu7/biBwvXO7cPa/HpSAnJMBQ195RCjNESeOL548EjzRYFbAb3w0OrEve/SQyZk3TgiEjn
 LJrhsWVchiLy0FLUhbOM8dRKrAvfR+P4l8Lk9AIeAgxOV9c1Pasc1BeYLxdvmRdzTamagKKst
 u0BLdrctJw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

Le 07/03/2021 à 21:26, Mark Cave-Ayland a écrit :
> According to the M68040UM Appendix D the requirement for data accesses to be
> word aligned is only for the 68000, 68008 and 68010 CPUs. Later CPUs from the
> 68020 onwards will allow unaligned data accesses but at the cost of being less
> efficient.
> 
> Add a new M68K_FEATURE_NO_DALIGN feature to specify that data accesses are not
> required to be word aligned, and don't perform the alignment on the stack
> pointer when taking an exception if this feature is not selected.
> 
> This is required because the MacOS DAFB driver attempts to call an A-trap
> with a byte-aligned stack pointer during initialisation and without this the
> stack pointer is off by one when the A-trap returns.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  target/m68k/cpu.c       | 1 +
>  target/m68k/cpu.h       | 1 +
>  target/m68k/op_helper.c | 5 ++++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 37d2ed9dc7..ea51753eb0 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -161,6 +161,7 @@ static void m68020_cpu_initfn(Object *obj)
>      m68k_set_feature(env, M68K_FEATURE_CAS);
>      m68k_set_feature(env, M68K_FEATURE_CHK2);
>      m68k_set_feature(env, M68K_FEATURE_MSP);
> +    m68k_set_feature(env, M68K_FEATURE_NO_DALIGN);
>  }
>  
>  /*
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 7c3feeaf8a..1e0876bba8 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -505,6 +505,7 @@ enum m68k_features {
>      M68K_FEATURE_CHK2,  /* CHK2 insn. (680[2346]0, and CPU32) */
>      M68K_FEATURE_MOVEP, /* MOVEP insn. (680[01234]0, and CPU32) */
>      M68K_FEATURE_MOVEC, /* MOVEC insn. (from 68010) */
> +    M68K_FEATURE_NO_DALIGN, /* Unaligned data accesses (680[2346]0) */
>  };
>  
>  static inline int m68k_feature(CPUM68KState *env, int feature)
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index 59a6448296..71b3df0910 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -348,7 +348,10 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
>      cpu_m68k_set_sr(env, sr);
>      sp = env->aregs[7];
>  
> -    sp &= ~1;
> +    if (!m68k_feature(env, M68K_FEATURE_NO_DALIGN)) {
> +        sp &= ~1;
> +    }
> +
>      if (cs->exception_index == EXCP_ACCESS) {
>          if (env->mmu.fault) {
>              cpu_abort(cs, "DOUBLE MMU FAULT\n");
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

