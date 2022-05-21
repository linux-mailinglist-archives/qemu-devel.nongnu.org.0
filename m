Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AB752F8DE
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 07:22:00 +0200 (CEST)
Received: from localhost ([::1]:34464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsHYs-00079k-NQ
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 01:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsHX3-0006Kr-CW
 for qemu-devel@nongnu.org; Sat, 21 May 2022 01:20:05 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsHX1-00032t-99
 for qemu-devel@nongnu.org; Sat, 21 May 2022 01:20:04 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 202so2311415pfu.0
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 22:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=PvfgWPofwt00a+aTb52vdWHH4BrmdLERKUMG6e2p6eM=;
 b=T6kkyPgcAYQEsOdFMhqqA6RrHXGOPpsUFXyWz2m+oBhQwyGYewwITbE0WOgaaetW3L
 w37/ZclH30mB30/RN9eRDG6FlNYzc+bNPis6wZc9yXTqaZTu6WIsAL+jEYmFj/ay4p7x
 F9rFExBXwSl71nbDmxI1fOI+mqQQKc5mrIYN0CeVZDuP7BvX+y79hAVFdtPkZIyvSMa5
 IGbZaYjbz8WQNDIDQKp2KVmo648Qlgbj8CA8w/tOpab8Whdndkn3BrnbflHqumV/6BQ7
 Z4amKY2rUF1I5e5AnVDqp3fHvnlxM3qkUeU9Efrv2VVFVhXSM9dbjoMVmSKejoYnDsNw
 WBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=PvfgWPofwt00a+aTb52vdWHH4BrmdLERKUMG6e2p6eM=;
 b=nQLYQLps4GRIQSsWpYA0Qvt1rZI4BoA6ETYjWba1WtmcDq4m1e8lPowt9JomcBv7Bk
 8shslbf4+tk40qj3TJbCQLup8KmWnwvTinV9d7lningrWSaRvAkP9X//s+j2SwQR4k9e
 QEJD9Tt5OHIivSZZ4K9ccoJ4/BE6vvy9Lasv7d8do6Exv1udJTa7yIMZQR2Xp120wwtY
 r8pN36anvqtl+vKf8EDaqZWv3eWp1C6LM32+wKKIsJHXeuCQxd3MsIOYFrPmzoA25g7i
 VIsRc1ENvsG6nAZ6LzJzGrNf6kodYoChALTwDHGZXzd7bnushq/iLgfTdWaNP/afGTpp
 AWxw==
X-Gm-Message-State: AOAM533yg6EyT3tnFFDDdq09QN/HOADf7FQCU7lxf2TZ/WgZtaJUN4pD
 wbA0YhZ8+MJx6/OomSflCIQWVAD0s5GnDw==
X-Google-Smtp-Source: ABdhPJxyBbqjxhsv/7RZsj+TcvdcI62I/ZWl9eF8KzUrDZws1YNZNDCfG7ei3GkACAm0162a2FfXKg==
X-Received: by 2002:a62:ed0e:0:b0:4fa:11ed:2ad1 with SMTP id
 u14-20020a62ed0e000000b004fa11ed2ad1mr13543643pfh.34.1653110401354; 
 Fri, 20 May 2022 22:20:01 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a62c311000000b0050dc76281a6sm2668967pfg.128.2022.05.20.22.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 22:20:00 -0700 (PDT)
Message-ID: <60e20149-493d-4a09-1297-2519d60e996c@linaro.org>
Date: Fri, 20 May 2022 22:19:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] linux-user: Clean up arg_start/arg_end confusion
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, peter.maydell@linaro.org
References: <20220427025129.160184-1-richard.henderson@linaro.org>
In-Reply-To: <20220427025129.160184-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Ping?

r~

On 4/26/22 19:51, Richard Henderson wrote:
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


