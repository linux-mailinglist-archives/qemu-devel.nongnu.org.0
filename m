Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE1A3E1281
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 12:21:13 +0200 (CEST)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBaUs-0005c2-05
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 06:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBaS1-0003PA-1s
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:18:09 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:38187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBaRy-0005Py-8m
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:18:08 -0400
Received: from [192.168.100.1] ([82.142.21.182]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MploR-1mwPrR0yNx-00qDgw; Thu, 05 Aug 2021 12:18:00 +0200
Subject: Re: [PATCH] linux-user/elfload: byteswap i386 registers when dumping
 core
To: Ilya Leoshkevich <iii@linux.ibm.com>
References: <20210803172013.148446-1-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9af74327-2e03-f1dd-6eec-4e8fc7154815@vivier.eu>
Date: Thu, 5 Aug 2021 12:17:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803172013.148446-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hB/O7J6oiw8oZ8VRGHIOXni2XFh+GqTlIi4/YPnI61KwdvwquqR
 neCpbvC1tx4UhC1aAoxB3gLge+l4O25GzUhs1zh4j9wvYTbe3yVYMEy8lQr3n+UDDa+8S8D
 J/dkWdnJdzCIVatzWdWKcLaK4Q0scmK+tTTK/QKSpEzBjhCfii4Y365dwe6+EEYoQwZLXQN
 OrB9VmDbhaTOBzPgHlllg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:io44q4C0mZA=:lwO/MTXm9x2FZPRMoxbThr
 SCw7MshMeSfkP8DbKx9FsFvQRd6jUGKSDmK1zsy9s+/5DSnGksznSDFZm9hrtBy/Pbq+xHq7+
 kYXaER7zkmRJ8IGFKdqfkhgTK+vPqQOXTSqJDEoaeH6UMbU1UMJT0Nn+ELGNK6EPBTaf366h8
 /aboT0TDoDngJvGMXYzvxEGnaqDiAs140rjiRfFS6od+EENEJibN6CQv3kkvPkYYHFdGjIcrI
 JWhkP2hedShLsdvj/0U7/79kCvUlonRRrPLg91aCFj73GOi2qxsJQyr90NiDGEvFUxV/hHWK0
 DP57il7qCXyR8L5jP6NbXQBgCYKnOp70nYX6/Fs9DbtGPU1BemfI6ukr2MZKBorq2flyQ4G8e
 nEVaSrWNGOs2gWLAp6alFC6o/8SUNbDxTgK26I2YH4yAa05lrooIq6mn/i61J3hsVIAfeKoDZ
 1V0u0yV92W4P/M2Og08TJrcxBEmrFwznSka++IxQt9E+a/izICq/oAXScOH7Prq0WuaXXUdAz
 0Argqi5ax5eWW7C21fZCfM7OqjpmwiqvdeKSP+Btfh2wAb4kMksm0ne+kn/UuvmJ4EHca4q5y
 xLArXJMaCHyYQrF4Gxbr8dQOPSWNWFGspUrMV0+aCvWBktda7N8opO4TTeiA1OAeeUBeuLcLG
 Y6YU9etUwK1Ij9n00hwEiaP6htwWYl2vzJg1I6t5EVRQPO9qSVl/2Ypa8M4GePXBOqTRt+o8g
 nNdBaUX0iX0o70wFGgcUhm28n36JNA7358lnrNWxsKVwN/ja+hLqWFcONMtcSWpcrjNjI4ZsE
 2wbRPpAXrfvJ7iiLfz2WS/pyyN414VWHRMEezRErEQoYDjqfJhCT5ZC4LkO+GhagVWKP+Y4
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/08/2021 à 19:20, Ilya Leoshkevich a écrit :
> Core dumps from emulating x86_64 on big-endian hosts contain incorrect
> register values.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  linux-user/elfload.c | 88 ++++++++++++++++++++++----------------------
>  1 file changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 42ef2a1148..01e9a833fb 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -172,33 +172,33 @@ typedef target_elf_greg_t  target_elf_gregset_t[ELF_NREG];
>   */
>  static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *env)
>  {
> -    (*regs)[0] = env->regs[15];
> -    (*regs)[1] = env->regs[14];
> -    (*regs)[2] = env->regs[13];
> -    (*regs)[3] = env->regs[12];
> -    (*regs)[4] = env->regs[R_EBP];
> -    (*regs)[5] = env->regs[R_EBX];
> -    (*regs)[6] = env->regs[11];
> -    (*regs)[7] = env->regs[10];
> -    (*regs)[8] = env->regs[9];
> -    (*regs)[9] = env->regs[8];
> -    (*regs)[10] = env->regs[R_EAX];
> -    (*regs)[11] = env->regs[R_ECX];
> -    (*regs)[12] = env->regs[R_EDX];
> -    (*regs)[13] = env->regs[R_ESI];
> -    (*regs)[14] = env->regs[R_EDI];
> -    (*regs)[15] = env->regs[R_EAX]; /* XXX */
> -    (*regs)[16] = env->eip;
> -    (*regs)[17] = env->segs[R_CS].selector & 0xffff;
> -    (*regs)[18] = env->eflags;
> -    (*regs)[19] = env->regs[R_ESP];
> -    (*regs)[20] = env->segs[R_SS].selector & 0xffff;
> -    (*regs)[21] = env->segs[R_FS].selector & 0xffff;
> -    (*regs)[22] = env->segs[R_GS].selector & 0xffff;
> -    (*regs)[23] = env->segs[R_DS].selector & 0xffff;
> -    (*regs)[24] = env->segs[R_ES].selector & 0xffff;
> -    (*regs)[25] = env->segs[R_FS].selector & 0xffff;
> -    (*regs)[26] = env->segs[R_GS].selector & 0xffff;
> +    (*regs)[0] = tswapreg(env->regs[15]);
> +    (*regs)[1] = tswapreg(env->regs[14]);
> +    (*regs)[2] = tswapreg(env->regs[13]);
> +    (*regs)[3] = tswapreg(env->regs[12]);
> +    (*regs)[4] = tswapreg(env->regs[R_EBP]);
> +    (*regs)[5] = tswapreg(env->regs[R_EBX]);
> +    (*regs)[6] = tswapreg(env->regs[11]);
> +    (*regs)[7] = tswapreg(env->regs[10]);
> +    (*regs)[8] = tswapreg(env->regs[9]);
> +    (*regs)[9] = tswapreg(env->regs[8]);
> +    (*regs)[10] = tswapreg(env->regs[R_EAX]);
> +    (*regs)[11] = tswapreg(env->regs[R_ECX]);
> +    (*regs)[12] = tswapreg(env->regs[R_EDX]);
> +    (*regs)[13] = tswapreg(env->regs[R_ESI]);
> +    (*regs)[14] = tswapreg(env->regs[R_EDI]);
> +    (*regs)[15] = tswapreg(env->regs[R_EAX]); /* XXX */
> +    (*regs)[16] = tswapreg(env->eip);
> +    (*regs)[17] = tswapreg(env->segs[R_CS].selector & 0xffff);
> +    (*regs)[18] = tswapreg(env->eflags);
> +    (*regs)[19] = tswapreg(env->regs[R_ESP]);
> +    (*regs)[20] = tswapreg(env->segs[R_SS].selector & 0xffff);
> +    (*regs)[21] = tswapreg(env->segs[R_FS].selector & 0xffff);
> +    (*regs)[22] = tswapreg(env->segs[R_GS].selector & 0xffff);
> +    (*regs)[23] = tswapreg(env->segs[R_DS].selector & 0xffff);
> +    (*regs)[24] = tswapreg(env->segs[R_ES].selector & 0xffff);
> +    (*regs)[25] = tswapreg(env->segs[R_FS].selector & 0xffff);
> +    (*regs)[26] = tswapreg(env->segs[R_GS].selector & 0xffff);
>  }
>  
>  #else
> @@ -244,23 +244,23 @@ typedef target_elf_greg_t  target_elf_gregset_t[ELF_NREG];
>   */
>  static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *env)
>  {
> -    (*regs)[0] = env->regs[R_EBX];
> -    (*regs)[1] = env->regs[R_ECX];
> -    (*regs)[2] = env->regs[R_EDX];
> -    (*regs)[3] = env->regs[R_ESI];
> -    (*regs)[4] = env->regs[R_EDI];
> -    (*regs)[5] = env->regs[R_EBP];
> -    (*regs)[6] = env->regs[R_EAX];
> -    (*regs)[7] = env->segs[R_DS].selector & 0xffff;
> -    (*regs)[8] = env->segs[R_ES].selector & 0xffff;
> -    (*regs)[9] = env->segs[R_FS].selector & 0xffff;
> -    (*regs)[10] = env->segs[R_GS].selector & 0xffff;
> -    (*regs)[11] = env->regs[R_EAX]; /* XXX */
> -    (*regs)[12] = env->eip;
> -    (*regs)[13] = env->segs[R_CS].selector & 0xffff;
> -    (*regs)[14] = env->eflags;
> -    (*regs)[15] = env->regs[R_ESP];
> -    (*regs)[16] = env->segs[R_SS].selector & 0xffff;
> +    (*regs)[0] = tswapreg(env->regs[R_EBX]);
> +    (*regs)[1] = tswapreg(env->regs[R_ECX]);
> +    (*regs)[2] = tswapreg(env->regs[R_EDX]);
> +    (*regs)[3] = tswapreg(env->regs[R_ESI]);
> +    (*regs)[4] = tswapreg(env->regs[R_EDI]);
> +    (*regs)[5] = tswapreg(env->regs[R_EBP]);
> +    (*regs)[6] = tswapreg(env->regs[R_EAX]);
> +    (*regs)[7] = tswapreg(env->segs[R_DS].selector & 0xffff);
> +    (*regs)[8] = tswapreg(env->segs[R_ES].selector & 0xffff);
> +    (*regs)[9] = tswapreg(env->segs[R_FS].selector & 0xffff);
> +    (*regs)[10] = tswapreg(env->segs[R_GS].selector & 0xffff);
> +    (*regs)[11] = tswapreg(env->regs[R_EAX]); /* XXX */
> +    (*regs)[12] = tswapreg(env->eip);
> +    (*regs)[13] = tswapreg(env->segs[R_CS].selector & 0xffff);
> +    (*regs)[14] = tswapreg(env->eflags);
> +    (*regs)[15] = tswapreg(env->regs[R_ESP]);
> +    (*regs)[16] = tswapreg(env->segs[R_SS].selector & 0xffff);
>  }
>  #endif
>  
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


