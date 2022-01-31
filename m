Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F934A539C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 00:58:34 +0100 (CET)
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEgZ7-0002nM-BD
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 18:58:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgX8-0001kV-R8
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:56:30 -0500
Received: from [2607:f8b0:4864:20::102b] (port=51819
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgX7-0003Ch-3F
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:56:30 -0500
Received: by mail-pj1-x102b.google.com with SMTP id q63so15470586pja.1
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 15:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f3iHHCnn8H9uuqEtKLQHBRG4wYfQTR0Q0RiGxWVxc/s=;
 b=Wbf+//kjFptgI2wYBXZYuONgFZ4Tj3wjtY8cZOvsSfpoDHsdtq5YKjXxAj71lOgoDk
 gBiole5uOrXHSXoW4/j3TvcEwa26iYgMTpqq5UjZ9UsQZxUD1jdZ+x4Z6ir3XJ+uLb/M
 fI1l8dm9gkObCELI2eGtJoWwKgJXTmQ7oqMF6ysQmc+43vAQM+Y0E9EZwz5CksCVQYVG
 0jgR6U/YvehQ8QqWNV7j6KCSQjGARczQqFqhgiv9H4TmjwXqXnJdUfq2gSF6se9KX90P
 0XD7UQl4qOhgeOEVIKXo/9NTbJL+iYOvP3uqlZJWAcWtBUyZ2dXsztRwOW9ppRCc90f3
 u2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f3iHHCnn8H9uuqEtKLQHBRG4wYfQTR0Q0RiGxWVxc/s=;
 b=TVNt0OvIE7x2Nk/gE+SMKnpqtdqj6h/R+k+CONRRD2tsqynz8D+aJuEccpC1gDAUlu
 ZwqvdYV7aKGiK7NeaAcvMvme8UMWSCHa8LQhrHkFsdTNl5kURLYakD8Gw4Yf6Ti9H+Fl
 DmByqr6DcDnksKShNZcrWjujCWv0s54eGdH/UGiXtFBPQvFz6ZyQR+SHNByF+dbPk2Tr
 3jEXSAHPFKf0ghBtDLMPKLcHVyiNPboDra1CkkNLnQQprWGegc37vZPDDv5LzXol9NRP
 4fEZ6oMBZudoYqkLA8xcQk2oB+H8XdERY82jyIqF1/L31KxKeWwjs9gzs3s7qn2xD7CV
 0FnA==
X-Gm-Message-State: AOAM532oxweEMrgfQjuNvgr9x3rXjMmRRr28xuj0bwvv4oiFhWO4Ibjs
 7jPULiaD7YSXRye1QiEnOiQ=
X-Google-Smtp-Source: ABdhPJx00I3bhZVnoqdyICy/U84727lryXcM0sTCzgd517On31Q7R7tSgMVnAV9v5pwgT/1NJXHHKQ==
X-Received: by 2002:a17:90a:df0e:: with SMTP id
 gp14mr27351741pjb.57.1643673387567; 
 Mon, 31 Jan 2022 15:56:27 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id e3sm15170603pgc.41.2022.01.31.15.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:56:27 -0800 (PST)
Message-ID: <c6f9b777-4b6f-a71a-ce90-c08e5313e2a8@amsat.org>
Date: Tue, 1 Feb 2022 00:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/6] hppa: Add support for an emulated TOC/NMI button.
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Sven Schnelle <svens@stackframe.org>
References: <20220131213529.17404-1-deller@gmx.de>
 <20220131213529.17404-4-deller@gmx.de>
In-Reply-To: <20220131213529.17404-4-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 31/1/22 22:35, Helge Deller wrote:
> Almost all PA-RISC machines have either a button that is labeled with 'TOC' or
> a BMC/GSP function to trigger a TOC.  TOC is a non-maskable interrupt that is
> sent to the processor.  This can be used for diagnostic purposes like obtaining
> a stack trace/register dump or to enter KDB/KGDB in Linux.
> 
> This patch adds support for such an emulated TOC button.
> 
> It wires up the qemu monitor "nmi" command to trigger a TOC.  For that it

s/qemu/QEMU/ (few others).

> provides the hppa_nmi function which is assigned to the nmi_monitor_handler
> function pointer.  When called it raises the EXCP_TOC hardware interrupt in the
> hppa_cpu_do_interrupt() function.  The interrupt function then calls the
> architecturally defined TOC function in SeaBIOS-hppa firmware (at fixed address
> 0xf0000000).
> 
> According to the PA-RISC PDC specification, the SeaBIOS firmware then writes
> the CPU registers into PIM (processor internal memmory) for later analysis.  In

Typo "memory".

> order to write all registers it needs to know the contents of the CPU "shadow
> registers" and the IASQ- and IAOQ-back values. The IAOQ/IASQ values are
> provided by qemu in shadow registers when entering the SeaBIOS TOC function.
> This patch adds a new aritificial opcode "getshadowregs" (0xfffdead2) which

Typo "artificial".

> restores the original values of the shadow registers. With this opcode SeaBIOS
> can store those registers as well into PIM before calling an OS-provided TOC
> handler.
> 
> To trigger a TOC, switch to the qemu monitor with Ctrl-A C, and type in the
> command "nmi".  After the TOC started the OS-debugger, exit the qemu monitor
> with Ctrl-A C.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   hw/hppa/machine.c        | 35 ++++++++++++++++++++++++++++++++++-
>   target/hppa/cpu.c        |  2 +-
>   target/hppa/cpu.h        |  5 +++++
>   target/hppa/helper.h     |  1 +
>   target/hppa/insns.decode |  1 +
>   target/hppa/int_helper.c | 19 ++++++++++++++++++-
>   target/hppa/op_helper.c  |  7 ++++++-
>   target/hppa/translate.c  | 10 ++++++++++
>   8 files changed, 76 insertions(+), 4 deletions(-)
> +static const TypeInfo machine_hppa_machine_init_typeinfo = {
> +    .name = ("hppa" "-machine"),

        .name = MACHINE_TYPE_NAME("hppa"),

> +    .parent = "machine",
> +    .class_init = machine_hppa_machine_init_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_NMI },
> +        { }
> +    },
> +};

> diff --git a/target/hppa/helper.h b/target/hppa/helper.h
> index 0a629ffa7c..fe8a9ce493 100644
> --- a/target/hppa/helper.h
> +++ b/target/hppa/helper.h
> @@ -80,6 +80,7 @@ DEF_HELPER_FLAGS_0(read_interval_timer, TCG_CALL_NO_RWG, tr)
>   #ifndef CONFIG_USER_ONLY
>   DEF_HELPER_1(halt, noreturn, env)
>   DEF_HELPER_1(reset, noreturn, env)
> +DEF_HELPER_1(getshadowregs, void, env)
>   DEF_HELPER_1(rfi, void, env)
>   DEF_HELPER_1(rfi_r, void, env)
>   DEF_HELPER_FLAGS_2(write_interval_timer, TCG_CALL_NO_RWG, void, env, tr)
> diff --git a/target/hppa/insns.decode b/target/hppa/insns.decode
> index d4eefc0d48..c7a7e997f9 100644
> --- a/target/hppa/insns.decode
> +++ b/target/hppa/insns.decode
> @@ -111,6 +111,7 @@ rfi_r           000000 ----- ----- --- 01100101 00000
>   # They are allocated from the unassigned instruction space.
>   halt            1111 1111 1111 1101 1110 1010 1101 0000
>   reset           1111 1111 1111 1101 1110 1010 1101 0001
> +getshadowregs   1111 1111 1111 1101 1110 1010 1101 0010
> 

> diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
> index 1b86557d5d..b0dec4ebf4 100644
> --- a/target/hppa/op_helper.c
> +++ b/target/hppa/op_helper.c
> @@ -694,7 +694,7 @@ void HELPER(rfi)(CPUHPPAState *env)
>       cpu_hppa_put_psw(env, env->cr[CR_IPSW]);
>   }
> 
> -void HELPER(rfi_r)(CPUHPPAState *env)
> +void HELPER(getshadowregs)(CPUHPPAState *env)
>   {
>       env->gr[1] = env->shadow[0];
>       env->gr[8] = env->shadow[1];
> @@ -703,6 +703,11 @@ void HELPER(rfi_r)(CPUHPPAState *env)
>       env->gr[17] = env->shadow[4];
>       env->gr[24] = env->shadow[5];
>       env->gr[25] = env->shadow[6];
> +}
> +
> +void HELPER(rfi_r)(CPUHPPAState *env)
> +{
> +    helper_getshadowregs(env);
>       helper_rfi(env);
>   }
>   #endif
> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
> index c6195590f8..5c0b1eb274 100644
> --- a/target/hppa/translate.c
> +++ b/target/hppa/translate.c
> @@ -2393,6 +2393,16 @@ static bool trans_reset(DisasContext *ctx, arg_reset *a)
>   #endif
>   }
> 
> +static bool trans_getshadowregs(DisasContext *ctx, arg_getshadowregs *a)
> +{
> +    CHECK_MOST_PRIVILEGED(EXCP_PRIV_OPR);
> +#ifndef CONFIG_USER_ONLY
> +    nullify_over(ctx);
> +    gen_helper_getshadowregs(cpu_env);
> +    return nullify_end(ctx);
> +#endif
> +}

Why not add getshadowregs opcode in a preliminary patch? That would be
easier to review.

Preferably split and using MACHINE_TYPE_NAME():
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

