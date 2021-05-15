Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0101A381AE6
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 22:03:48 +0200 (CEST)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li0Vo-00066b-1E
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 16:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li0TD-0004HR-BI; Sat, 15 May 2021 16:01:07 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li0T6-0004WU-Pu; Sat, 15 May 2021 16:01:03 -0400
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MGQ85-1lhA2l1olR-00Gpyc; Sat, 15 May 2021 22:00:54 +0200
Subject: Re: [PATCH] linux-user/elfload: add s390x core dumping support
To: Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210413205608.22587-1-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9d65789b-895c-55e5-b2b7-09ed72171036@vivier.eu>
Date: Sat, 15 May 2021 22:00:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413205608.22587-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G2MSQKCC2qo+qCa+1xaT6kn/9IifOtDeMqL0NmzXtmI7AyRyVLE
 lRVSXRHdJ//PzZP8n7kkV1lQf9K33WBc7GtWV9qK2WQqOStBrmcWdK2ltaVLujljIpGXr8E
 HWthcm/0GtVmdykuHx9H8h2OqHlxR9Aj1+20Kpw91oHH/R6r7e57NTBCj5oOawnlMhXID1J
 Elw2V1NywfNqapfKGo9UA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vt2lFoyzdAE=:zOg7yTcbWyER2ZOCKW2GMV
 ehOtyiBXHneHgU4zFoV17IV4atghj9jj7FG6dv+YqnmxsqyYjZRHm1CFS43wBlshIdtacUQ4J
 VVm7cqmRTSfQA0Lxt+ab1yfAN/LoWTvhMShv48rm0HU+ZBxwC6cvlJpsaZyBtkJEQdO+MD3U1
 77oDHJrSh4gvpoB6bAnXYjheUCEZ9pket8ju8YhDUdQJWl8C281ooBsQK3Y2iky8tfhItiCUK
 Jf/2Pckr46KWyQd3/9idKAX36v+P4eWQXaHXYnsf0VqTtWyByz0yV8X/AskJ14Nn8mkuKDht6
 QfOvQtU/j3CHjmrlKc6rSmBZXmoluKIaHdRunGOglccjLO6FE+yEas1VCkazUFFCiTt2BQslt
 PHBty4oNQzeCfzsjwUyk9BB36zxyP+rqQjjDPXSnj+SyZCNa+MflENWPJ40IYK/bCAE9BbMJ8
 uXXz/nHa1uWJOWZ0pjwgRMzymd85RLIiC9309ep2oAV3MrdeFOoSjBdyWT0SC6KLiBab2YKO+
 B3JK4DYetUVkEo1ryC9uh4=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/04/2021 à 22:56, Ilya Leoshkevich a écrit :
> Provide the following definitions required by the common code:
> 
> * ELF_NREG: with the value of sizeof(s390_regs) / sizeof(long).
> * target_elf_gregset_t: define it like all the other arches do.
> * elf_core_copy_regs(): similar to kernel's s390_regs_get().
> * USE_ELF_CORE_DUMP.
> * ELF_EXEC_PAGESIZE.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  linux-user/elfload.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index c6731013fd..4e45bd1539 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1385,6 +1385,39 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
>      regs->gprs[15] = infop->start_stack;
>  }
>  
> +/* See linux kernel: arch/s390/include/uapi/asm/ptrace.h (s390_regs).  */
> +#define ELF_NREG 27
> +typedef target_elf_greg_t target_elf_gregset_t[ELF_NREG];
> +
> +enum {
> +    TARGET_REG_PSWM = 0,
> +    TARGET_REG_PSWA = 1,
> +    TARGET_REG_GPRS = 2,
> +    TARGET_REG_ARS = 18,
> +    TARGET_REG_ORIG_R2 = 26,
> +};
> +
> +static void elf_core_copy_regs(target_elf_gregset_t *regs,
> +                               const CPUS390XState *env)
> +{
> +    int i;
> +    uint32_t *aregs;
> +
> +    (*regs)[TARGET_REG_PSWM] = tswapreg(env->psw.mask);
> +    (*regs)[TARGET_REG_PSWA] = tswapreg(env->psw.addr);
> +    for (i = 0; i < 16; i++) {
> +        (*regs)[TARGET_REG_GPRS + i] = tswapreg(env->regs[i]);
> +    }
> +    aregs = (uint32_t *)&((*regs)[TARGET_REG_ARS]);
> +    for (i = 0; i < 16; i++) {
> +        aregs[i] = tswap32(env->aregs[i]);
> +    }
> +    (*regs)[TARGET_REG_ORIG_R2] = 0;
> +}
> +
> +#define USE_ELF_CORE_DUMP
> +#define ELF_EXEC_PAGESIZE 4096
> +
>  #endif /* TARGET_S390X */
>  
>  #ifdef TARGET_RISCV
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent



