Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A9530966
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 08:18:35 +0200 (CEST)
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt1Oj-0004um-Uj
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 02:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nt1Ka-00046P-Jp
 for qemu-devel@nongnu.org; Mon, 23 May 2022 02:14:18 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:60591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nt1KY-0001WB-F6
 for qemu-devel@nongnu.org; Mon, 23 May 2022 02:14:16 -0400
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQNF3-1oEpbE3iyn-00MOYB; Mon, 23 May 2022 08:14:10 +0200
Message-ID: <c39724b6-7d16-927c-f487-f7ac8be55cc4@vivier.eu>
Date: Mon, 23 May 2022 08:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] linux-user: Clean up arg_start/arg_end confusion
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20220427025129.160184-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220427025129.160184-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IFx/SemDo8qqh6McInTwDE0SrIsUSYmuTljM00/h/73d2DS/Y2O
 c7JcKTICuLQ3gr5/TU/1Qdr4vph2dmXadfuJ5InqvquqCU/wjoD9bXXUd0Nxwc99AGSUuPX
 66NpoTpnf+LLT90WGL/NwyXYxvrcfZqYqkxVnxvfK98MD8m9cQ3rBobuJfS0qVQQDMnCU3+
 B94Ll9Y7n2cNbIbnb6OAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cy1yOjxawq0=:2OjoC7XqTLVBCBhWQWpjyz
 LAPwukA17GCalt6J5rQCWEb61ABHyYBGeEUxacPP9sNk25O6eVi2V4P+tiWmzO6OUd4qaCiNz
 kBsPj4IOdQsT5jvmr4k1gcUIB9lOzcvaRfTVpw8l09i86TnIelwaFEBJwtHIaAo5cLwGcARbP
 KbW6YOBFemewFqf9Lp2jVuQZ9uhu2UCItwo7uSR3eBQ/RROMwdh7v1tgVYvR1GD7UIV0iaKvt
 8NMvcmWaiyFmGylzsR/fbuEI+SdwECqNS0nMOC2Xo9lPnd8R/rPC0CRbt95zTTDXxU51N1PH7
 PnPd8nJErrnCekA9Tyo5Glq7b7/CALCXPaYM0QLTmczMszlg5eNtkFPCsOACnLlp7S2zmQmf8
 Tg7bnHR7EEo1+x+gAvZQYPvDFxT6+0zOSwpQ1KJ+5XSG06aIasVsl404gDr5+GFdJ1NHM01FE
 wPY7Y4UgzjO9yPooJBcNVpsC2mpAO5hRz7PqfgQro1kLQP0pd/hOfgR2JJWyjvdT4T2r/s9SB
 3goF1kTl6D/6LesH+yUUT1qGTmBjjmljOL69Ieme3gQgqSr/cZzuJA1QFWxUb52oGHrKkNcn7
 AuoTCzDn15fDzfByqDg/WkpbbywfA/aE0F11wyhOJUQMpT2M85ZP3+mGmAYnLi6a9jJW6fqsT
 7xIPPQwZAr+RoS26TaImPPRDp/kHsUIBnFs73O46iw2YD7LAKC9wqE7L76dQwcAsvXVnCYbQk
 fXQrcc/kDLVfwJDB564uXZ0j76m/qJXMtaRk+A==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 27/04/2022 à 04:51, Richard Henderson a écrit :
> We had two sets of variables: arg_start/arg_end, and
> arg_strings/env_strings.  In linuxload.c, we set the
> first pair to the bounds of the argv strings, but in
> elfload.c, we set the first pair to the bounds of the
> argv pointers and the second pair to the bounds of
> the argv strings.
> 
> Remove arg_start/arg_end, replacing them with the standard
> argc/argv/envc/envp values.  Retain arg_strings/env_strings
> with the meaning we were using in elfload.c.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/714
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/qemu.h             | 12 ++++++++----
>   linux-user/elfload.c          | 10 ++++++----
>   linux-user/linuxload.c        | 12 ++++++++++--
>   linux-user/main.c             |  4 ++--
>   semihosting/arm-compat-semi.c |  4 ++--
>   5 files changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 46550f5e21..7d90de1b15 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -40,15 +40,19 @@ struct image_info {
>           abi_ulong       data_offset;
>           abi_ulong       saved_auxv;
>           abi_ulong       auxv_len;
> -        abi_ulong       arg_start;
> -        abi_ulong       arg_end;
> -        abi_ulong       arg_strings;
> -        abi_ulong       env_strings;
> +        abi_ulong       argc;
> +        abi_ulong       argv;
> +        abi_ulong       envc;
> +        abi_ulong       envp;
>           abi_ulong       file_string;
>           uint32_t        elf_flags;
>           int             personality;
>           abi_ulong       alignment;
>   
> +        /* Generic semihosting knows about these pointers. */
> +        abi_ulong       arg_strings;   /* strings for argv */
> +        abi_ulong       env_strings;   /* strings for envp; ends arg_strings */
> +
>           /* The fields below are used in FDPIC mode.  */
>           abi_ulong       loadmap_addr;
>           uint16_t        nsegs;
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 61063fd974..8c0765dd4b 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1516,8 +1516,8 @@ static inline void init_thread(struct target_pt_regs *regs,
>       regs->iaoq[0] = infop->entry;
>       regs->iaoq[1] = infop->entry + 4;
>       regs->gr[23] = 0;
> -    regs->gr[24] = infop->arg_start;
> -    regs->gr[25] = (infop->arg_end - infop->arg_start) / sizeof(abi_ulong);
> +    regs->gr[24] = infop->argv;
> +    regs->gr[25] = infop->argc;
>       /* The top-of-stack contains a linkage buffer.  */
>       regs->gr[30] = infop->start_stack + 64;
>       regs->gr[31] = infop->entry;
> @@ -2120,8 +2120,10 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>       u_envp = u_argv + (argc + 1) * n;
>       u_auxv = u_envp + (envc + 1) * n;
>       info->saved_auxv = u_auxv;
> -    info->arg_start = u_argv;
> -    info->arg_end = u_argv + argc * n;
> +    info->argc = argc;
> +    info->envc = envc;
> +    info->argv = u_argv;
> +    info->envp = u_envp;
>   
>       /* This is correct because Linux defines
>        * elf_addr_t as Elf32_Off / Elf64_Off
> diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
> index 2ed5fc45ed..745cce70ab 100644
> --- a/linux-user/linuxload.c
> +++ b/linux-user/linuxload.c
> @@ -92,6 +92,11 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
>       envp = sp;
>       sp -= (argc + 1) * n;
>       argv = sp;
> +    ts->info->envp = envp;
> +    ts->info->envc = envc;
> +    ts->info->argv = argv;
> +    ts->info->argc = argc;
> +
>       if (push_ptr) {
>           /* FIXME - handle put_user() failures */
>           sp -= n;
> @@ -99,19 +104,22 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
>           sp -= n;
>           put_user_ual(argv, sp);
>       }
> +
>       sp -= n;
>       /* FIXME - handle put_user() failures */
>       put_user_ual(argc, sp);
> -    ts->info->arg_start = stringp;
> +
> +    ts->info->arg_strings = stringp;
>       while (argc-- > 0) {
>           /* FIXME - handle put_user() failures */
>           put_user_ual(stringp, argv);
>           argv += n;
>           stringp += target_strlen(stringp) + 1;
>       }
> -    ts->info->arg_end = stringp;
>       /* FIXME - handle put_user() failures */
>       put_user_ual(0, argv);
> +
> +    ts->info->env_strings = stringp;
>       while (envc-- > 0) {
>           /* FIXME - handle put_user() failures */
>           put_user_ual(stringp, envp);
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 7ca48664e4..651e32f5f2 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -878,9 +878,9 @@ int main(int argc, char **argv, char **envp)
>               fprintf(f, "entry       0x" TARGET_ABI_FMT_lx "\n",
>                       info->entry);
>               fprintf(f, "argv_start  0x" TARGET_ABI_FMT_lx "\n",
> -                    info->arg_start);
> +                    info->argv);
>               fprintf(f, "env_start   0x" TARGET_ABI_FMT_lx "\n",
> -                    info->arg_end + (abi_ulong)sizeof(abi_ulong));
> +                    info->envp);
>               fprintf(f, "auxv_start  0x" TARGET_ABI_FMT_lx "\n",
>                       info->saved_auxv);
>               qemu_log_unlock(f);
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 7a51fd0737..b6ddaf863a 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -1106,7 +1106,7 @@ target_ulong do_common_semihosting(CPUState *cs)
>   #else
>               unsigned int i;
>   
> -            output_size = ts->info->arg_end - ts->info->arg_start;
> +            output_size = ts->info->env_strings - ts->info->arg_strings;
>               if (!output_size) {
>                   /*
>                    * We special-case the "empty command line" case (argc==0).
> @@ -1146,7 +1146,7 @@ target_ulong do_common_semihosting(CPUState *cs)
>                   goto out;
>               }
>   
> -            if (copy_from_user(output_buffer, ts->info->arg_start,
> +            if (copy_from_user(output_buffer, ts->info->arg_strings,
>                                  output_size)) {
>                   errno = EFAULT;
>                   status = set_swi_errno(cs, -1);

Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent


