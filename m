Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A483572866
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:18:04 +0200 (CEST)
Received: from localhost ([::1]:49772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNGd-00010d-86
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBNCZ-0005gQ-W7; Tue, 12 Jul 2022 17:13:52 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:33777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBNCY-0001Ox-9c; Tue, 12 Jul 2022 17:13:51 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 e2-20020a4ab982000000b004354ba9a591so971564oop.0; 
 Tue, 12 Jul 2022 14:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FP6n+UtPuxnzSupCAl6T5WXi0/ujl65rruhoN1xYxsM=;
 b=jTXI7vlpKiAFLlQ/GJRG1UtpAfkYXERed5ogx27JgpIiH8+AHPeW8qP2FTPUDTcQ+W
 T47lNO+aFsKafi43mtv2LJliUjTQd72No5gF1yWOpPVEUz5AiU9e7cqNziav+tsgoxsx
 yjyhTR6uIIl+N//dhz0rNW7T3lG4UQAa17sa2whZ6AEvopOlMx0kbW+Lh1jbDGKHKa8z
 y9VscQuAV8xjqQdGM80s7TvmtfH1EGiR0F3g8rOGFNoEg+OgsHGIB22EwYoUGp/bxG7J
 2oU79wpwQUsouH7KMxRijjLmSayLlnwv6hLkr9V+XK0Ddw55AgcOCxyPe7uO4NT2OPc1
 I54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FP6n+UtPuxnzSupCAl6T5WXi0/ujl65rruhoN1xYxsM=;
 b=geY9eMlJ4eEC4dPnpbO3lWCSv1xn/3qNKP+TachtY0NwBcvhop6ejCZgwMiUB3AWMQ
 EH/N4gDpW/A27Cg5bBeQz8BKH5sH13SN4j5vBGIpyLgqntp/SCarvRWEQI3jOR4+a0o7
 WNeks6iGxwyBXfmv2ZURgQJ5YvcZtaoNoGpVTv6eKmA2tKdg/0028Gv5yFKrmB/PTf08
 W8qVsu/GsqBSnOWHVScidwLgUQ3a9MQhzqkdRwRg6FtYqDwKjbQufAi2GnyV6p9BPheo
 usHsrxF2QdxIG9qTp9sPKhpWSkRi5JWEZDqwu5TSwrbeagZ24N3ErGmf28Fd3pp09H3j
 jpDA==
X-Gm-Message-State: AJIora+0ez7zCSts1LZZFMkK3e+2WwlxBVmEgs7UpNMu5AujYXeR65gQ
 vJ40HHSRMNzWBgHorw05UGI=
X-Google-Smtp-Source: AGRyM1tnEpT7kzRCXfpgmg0WqswYjv2p4fMLapHwQ6/x0QVOaZFYOnTIj2GT1tt/9WGhhtMWy8EkqA==
X-Received: by 2002:a4a:3388:0:b0:434:dc05:c22c with SMTP id
 q130-20020a4a3388000000b00434dc05c22cmr47638ooq.58.1657660428818; 
 Tue, 12 Jul 2022 14:13:48 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 m8-20020a9d7ac8000000b0061c47c0f918sm3031676otn.16.2022.07.12.14.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 14:13:48 -0700 (PDT)
Message-ID: <59ca7363-455a-0181-afc0-63a391cdd19d@gmail.com>
Date: Tue, 12 Jul 2022 18:13:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH] target/ppc: don't print TB in ppc_cpu_dump_state if
 it's not initialized
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
References: <20220712192505.127375-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220712192505.127375-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 7/12/22 16:25, Matheus Ferst wrote:
> When using "-machine none", env->tb_env is not allocated, causing the
> segmentation fault reported in issue #85 (launchpad bug #811683). To
> avoid this problem, check if the pointer != NULL before calling the
> methods to print TBU/TBL/DECR.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/85
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> This patch fixes the reported problem, but may be an incomplete solution
> since many other places dereference env->tb_env without checking for
> NULL. AFAICS, "-machine none" is the only way to trigger this problem,
> and I'm not familiar with the use-cases for this option.

The "none"  machine type is mainly used by libvirt to do instrospection
of the available options/capabilities of the QEMU binary. It starts a QEMU
process like the following:

./x86_64-softmmu/qemu-system-x86_64 -S -no-user-config -nodefaults \
       -nographic -machine none,accel=kvm:tcg -daemonize

And then it uses QMP to probe the binary.

Aside from this libvirt usage I am not aware of anyone else using -machine
none extensively.


> 
> Should we stop assuming env->tb_env != NULL and add checks everywhere?
> Or should we find a way to provide Time Base/Decrementer for
> "-machine none"?
> ---

Are there other cases where env->tb_env can be NULL, aside from the case
reported in the bug?

I don't mind the bug fix, but I'm not fond of the idea of adding additional
checks because of this particular issue. I mean, the bug is using  the 'prep'
machine that Thomas removed year ago in b2ce76a0730. If there's no other
foreseeable problem, that we care about, with env->tb_env being NULL, IMO
let's fix the bug and move on.



Thanks,


Daniel




>   target/ppc/cpu_init.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 86ad28466a..7e96baac9f 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7476,18 +7476,18 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>                    "%08x iidx %d didx %d\n",
>                    env->msr, env->spr[SPR_HID0], env->hflags,
>                    cpu_mmu_index(env, true), cpu_mmu_index(env, false));
> -#if !defined(NO_TIMER_DUMP)
> -    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
> +    if (env->tb_env) {
> +        qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>   #if !defined(CONFIG_USER_ONLY)
> -                 " DECR " TARGET_FMT_lu
> +                     " DECR " TARGET_FMT_lu
>   #endif
> -                 "\n",
> -                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
> +                     "\n",
> +                     cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
>   #if !defined(CONFIG_USER_ONLY)
> -                 , cpu_ppc_load_decr(env)
> -#endif
> -        );
> +                     , cpu_ppc_load_decr(env)
>   #endif
> +            );
> +    }
>       for (i = 0; i < 32; i++) {
>           if ((i & (RGPL - 1)) == 0) {
>               qemu_fprintf(f, "GPR%02d", i);

