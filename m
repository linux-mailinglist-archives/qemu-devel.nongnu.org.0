Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C620F3D044F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:11:35 +0200 (CEST)
Received: from localhost ([::1]:35722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xxe-00038o-DA
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5xw7-0002LK-2v
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:09:59 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5xw4-0004UX-TQ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:09:58 -0400
Received: by mail-wr1-x435.google.com with SMTP id t5so27534949wrw.12
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VsO1GZKdV+0aq3L2OW6015Jw+2gFdGGaT2gzOE6OzRg=;
 b=Acb56/IsXYsywr6RVqYSRT3FdGBvxZm3fzkd4uIsEIdEjVZ+Bl3Y8gwdznhCZWTW3w
 Jl6yO7LccZyb7jkR4XWrKk5i0lsYnGBuRykNvYeaaEr9hprz6YuRQDzcsgbjzScJSeBR
 mKaSI9YA7rAD3l8H9TQQffBnoVmyc+HNZzu45LCMpUOwiDWxBJfIqvlvqAPNur1otEWq
 xnsqnIgtXs/8h+9leEyzULawx4pTyqQ8z+XnYn+WTkzaUSuM6aH6YJ3pCt4suf7Oe+Jz
 1/ku/hbhZz2qGkLgn9KcMGWMVC30sZkUGLwPTFNiwctrNrcNXvxI2sQnAkrQXQbrNMfR
 E1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VsO1GZKdV+0aq3L2OW6015Jw+2gFdGGaT2gzOE6OzRg=;
 b=j+DVuXJ4Z/bGrrrnoanTuvMg2WGi3fBx8LrDzpH9NDmYbgm9tLeyD7bSj0liEWsQLm
 CeoZBt3o+iEFK1SKKaKk3yx7q+eaczNBsXQ3ouMUSTEWZA4QHFEkpycUkhfGOJc0igMm
 XlPZVvUXVIWeIhKcvcLgARGWt9VXZDqB/UfxiHupKzuUJ2CgvRZPwG3opJRIDrF6OTOs
 DYeXw+rHIKWN4JRVcMQX5dRthM/Mn7inlcim0NrawF2dD9d74HmCjyjLi5fk4fs47q5M
 Zhav8I3O0ssDK95gOSJ3XpICb5j1Rr2UHibzokJAvObLoztYRwjarBPuojk/L0Gaamxk
 i9tg==
X-Gm-Message-State: AOAM531V0oxKTXWGVtNyWIu5nUqFQmPAF6twQwe3VIL3CIKXmyJaqWoO
 +N/Bo47qvZAYGOP79G6dXF0=
X-Google-Smtp-Source: ABdhPJwfkikAAtl7pUz6n8PnIsfB2V0bYTslWXH+RuG87EPcSQmxq9X0VyWRofjKGqR2DJHDdlZh1g==
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr38876021wro.330.1626818994584; 
 Tue, 20 Jul 2021 15:09:54 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id h130sm14364828wmh.1.2021.07.20.15.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 15:09:53 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v6 12/17] target/avr: Implement
 gdb_adjust_breakpoint
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d94b5d6e-4dfd-6c62-131e-9b6f476d126d@amsat.org>
Date: Wed, 21 Jul 2021 00:09:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720195439.626594-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 9:54 PM, Richard Henderson wrote:
> Ensure at registration that all breakpoints are in
> code space, not data space.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/cpu.h       |  1 +
>  target/avr/cpu.c       |  1 +
>  target/avr/gdbstub.c   | 13 +++++++++++++
>  target/avr/translate.c | 14 --------------
>  4 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> index d148e8c75a..93e3faa0a9 100644
> --- a/target/avr/cpu.h
> +++ b/target/avr/cpu.h
> @@ -162,6 +162,7 @@ hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int avr_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  int avr_print_insn(bfd_vma addr, disassemble_info *info);
> +vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr);
>  
>  static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
>  {
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 57e3fab4a0..ea14175ca5 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -223,6 +223,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
>      cc->disas_set_info = avr_cpu_disas_set_info;
>      cc->gdb_read_register = avr_cpu_gdb_read_register;
>      cc->gdb_write_register = avr_cpu_gdb_write_register;
> +    cc->gdb_adjust_breakpoint = avr_cpu_gdb_adjust_breakpoint;
>      cc->gdb_num_core_regs = 35;
>      cc->gdb_core_xml_file = "avr-cpu.xml";
>      cc->tcg_ops = &avr_tcg_ops;
> diff --git a/target/avr/gdbstub.c b/target/avr/gdbstub.c
> index c28ed67efe..1c1b908c92 100644
> --- a/target/avr/gdbstub.c
> +++ b/target/avr/gdbstub.c
> @@ -82,3 +82,16 @@ int avr_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>  
>      return 0;
>  }
> +
> +vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr)
> +{
> +    /*
> +     * This is due to some strange GDB behavior
> +     * Let's assume main has address 0x100:
> +     * b main   - sets breakpoint at address 0x00000100 (code)

I'd say hardware breakpoint is used here (using the Breakpoint
Unit via JTAG),

> +     * b *0x100 - sets breakpoint at address 0x00800100 (data)

while software breakpoint is used here (insert a BREAK instruction
at that address).

> +     *
> +     * Force all breakpoints into code space.
> +     */
> +    return addr % OFFSET_DATA;
> +}

From ATmega640 DS:

The Break Point Unit implements Break on Change of Program Flow,
Single Step Break, two Program Memory Break Points, and two combined
Break Points. Together, the four Break Points can be configured as
either:
  • 4 single Program Memory Break Points

  • 3 Single Program Memory Break Points
    + 1 single Data Memory Break Point

  • 2 single Program Memory Break Points
    + 2 single Data Memory Break Points

  • 2 single Program Memory Break Points
    + 1 Program Memory Break Point with mask (“range Break Point”)

  • 2 single Program Memory Break Points
    + 1 Data Memory Break Point with mask (“range Break Point”)

A debugger, like the AVR Studio, may however use one or more of
these resources for its internal purpose, leaving less flexibility
to the end-user.

[...]

All necessary execution commands are available in AVR Studio, both
on source level and on disassembly level.
The user can execute the program, single step through the code either
by tracing into or stepping over functions, step out of functions,
place the cursor on a statement and execute until the statement is
reached, stop the execution, and reset the execution target.
In addition, the user can have an unlimited number of code Break
Points (using the BREAK instruction) and up to two data memory Break
Points, alternatively combined as a mask (range) Break Point.

I wish we didn't have to add gdb_adjust_breakpoint() but we can
remove it later, so for this patch:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

