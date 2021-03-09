Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AC1332FD9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:26:52 +0100 (CET)
Received: from localhost ([::1]:39870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiwN-0000Ft-GQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJiKl-0007vV-60
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:47:59 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:57991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJiKh-0000KJ-ED
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:47:58 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MtfRv-1lbOfo03aB-00v96n; Tue, 09 Mar 2021 20:47:51 +0100
Subject: Re: [PATCH v2 3/3] target/m68k: add M68K_FEATURE_UNALIGNED_DATA
 feature
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210308121155.2476-1-mark.cave-ayland@ilande.co.uk>
 <20210308121155.2476-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <691abea3-7bd7-e0f6-5abe-d2742fd41a5f@vivier.eu>
Date: Tue, 9 Mar 2021 20:47:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308121155.2476-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3wo4qwqNaMuVxcCdYYpBiVXy3NW0BEnPjn/7zeNN6J+74kTS5W8
 5x88Ajv7OnlUvKUBbxyO/WsRSBuoeshpIpuL/SgTmP+CwyMwKyMQg93fwlVvGo2bC/nqXwn
 oonSwG1lwCwy0/JuljX5Ffhlxsnmauuur2dnAWbdwS7RE1FNUq6FbfVbkjulIB/KVX7xrJA
 FGzaTDSQXYTrlK0vQbwUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FeGBCF+VpDc=:NDbMbVu3ew1wwZJHDEZJxw
 XDJuvOFtYc9pG7kS8hxzVBIKu2C+dM4PNEGRQHd9jwfTZyzuGMOHh1r0ESLEuOsSnzIr0OtqW
 BWCS0ZcVUTc0AA3gay0bUz2P4EUPqwsIW+Z05LUsxq+i7SXPS9FjHzpKRsiOf4xa5PiHmxn1I
 /zIO1h5Kv+WbdSb9Yi4hk5fu6q70SNOZqPWDBGwEdRrWqGujNkpacCh9HgkVvcVo1wXQ3+RR+
 KlWV5ci0CxdaMjKJfYtsla0Z6Bxt5+btFq41gSXK4/5rDS2kDVNCj/mQn03rKaz0r6VeJdMUf
 7PGzl38cga/0HnwLbRl/AibNFvJhn7TpxxjaVSdiChDWBEkBgtvG80qeA/xV5D7RrBgyCR46U
 pMiFWbLm7UqBpp/ALo/Gll5s5efbqimmNBtmgShcg/VyTe8TEMHn1P3ivibtVW9riDNgfjoGd
 TU9OigseFA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
> According to the M68040UM Appendix D the requirement for data accesses to be
> word aligned is only for the 68000, 68008 and 68010 CPUs. Later CPUs from the
> 68020 onwards will allow unaligned data accesses but at the cost of being less
> efficient.
> 
> Add a new M68K_FEATURE_UNALIGNED_DATA feature to specify that data accesses are
> not required to be word aligned, and don't perform the alignment on the stack
> pointer when taking an exception if this feature is not selected.
> 
> This is required because the MacOS DAFB driver attempts to call an A-trap
> with a byte-aligned stack pointer during initialisation and without this the
> stack pointer is off by one when the A-trap returns.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  target/m68k/cpu.c       | 1 +
>  target/m68k/cpu.h       | 2 ++
>  target/m68k/op_helper.c | 5 ++++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 37d2ed9dc7..a14874b4da 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -161,6 +161,7 @@ static void m68020_cpu_initfn(Object *obj)
>      m68k_set_feature(env, M68K_FEATURE_CAS);
>      m68k_set_feature(env, M68K_FEATURE_CHK2);
>      m68k_set_feature(env, M68K_FEATURE_MSP);
> +    m68k_set_feature(env, M68K_FEATURE_UNALIGNED_DATA);
>  }
>  
>  /*
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index ce558e9b03..402c86c876 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -527,6 +527,8 @@ enum m68k_features {
>      M68K_FEATURE_MOVEP,
>      /* MOVEC insn. (from 68010) */
>      M68K_FEATURE_MOVEC,
> +    /* Unaligned data accesses (680[2346]0) */
> +    M68K_FEATURE_UNALIGNED_DATA,
>  };
>  
>  static inline int m68k_feature(CPUM68KState *env, int feature)
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index 59a6448296..3fa7b7e19e 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -348,7 +348,10 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
>      cpu_m68k_set_sr(env, sr);
>      sp = env->aregs[7];
>  
> -    sp &= ~1;
> +    if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
> +        sp &= ~1;
> +    }
> +
>      if (cs->exception_index == EXCP_ACCESS) {
>          if (env->mmu.fault) {
>              cpu_abort(cs, "DOUBLE MMU FAULT\n");
> 

Applied to my m68k-for-6.0 branch

Thanks,
Laurent


