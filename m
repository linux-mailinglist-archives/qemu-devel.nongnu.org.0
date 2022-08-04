Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED38B589F22
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 18:09:42 +0200 (CEST)
Received: from localhost ([::1]:55358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJdPp-0001M1-Bk
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 12:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJdIg-0003Iv-7a
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:02:18 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJdIa-0004tm-IQ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:02:17 -0400
Received: by mail-pf1-x432.google.com with SMTP id h28so13381671pfq.11
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4oxpUDNfX7fWAV1GelVhLOjEWm03EY9uQJGAovBBZIw=;
 b=g4WwPO2xV44Qg023g1PlMLqqgXd7ZnxtLu7jJ3q3unsKXS2/uS9YaePkd93M0aXB1a
 nTdQSP9F6p5IuHuhB1hMe8Odo7crdb9ZhIvwKBL/g0weFUYGCEAiW1uTYEW5QTZrLKxM
 cR6fk+gpEz/m/DPNfbT5hHsCpN1i3xwRxRWg5ETEDTFz7NtwXHWjZiPQc3SoAoaMwVyj
 noC5qFspUXqsuDzJtfJpvrFuJ9pxNNME5BBfOwMnXN8Fg/ZQXTfK6P7zR9AGEbLDirjb
 UP0l/0ydI9PKZzRSn5cPCKukxv0ObYqOiqtC0uQTu2XdevojzAYOjAgqh2gv3TqkSxhe
 DN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4oxpUDNfX7fWAV1GelVhLOjEWm03EY9uQJGAovBBZIw=;
 b=J8IlmRcvHgDJjWeofzqoOo9l43L6TlzBxqCb5Uh8QmaF4yaqC8QZdVehNtZHQZ+b28
 3rQAmqfAZh5JdLpwdnbKvo10euQvcSjFksxRoNbuhRX1WIqZ5hoy6z1nBHl83xG2ow74
 bq/Zg0GcJqoByvuhKjESUcX07P3jltkjml0QdgwWiZe5wWMbsP7yekqygJfbL2SEcIZO
 c4BriAa0iHL37xh1CPKFi4ihtR4qTdCdnNlicAwbO3WGqsDQLL+JTVloBiu2r7d09kOP
 O7QVbxHW95YLMmyEDoAtxrfbnnlD1Xtu9Yw0Uw0X/9maqZuu+0lUAfD9gxxFVKWAb3xz
 xz2Q==
X-Gm-Message-State: ACgBeo0NxuAiuq6/1otmIW9Wgudo1oGXUY9QO9CzEn3xkBLYeI9O1XtW
 Dq510nVM2XmFCQ5qvjN3PcQeYg==
X-Google-Smtp-Source: AA6agR5U1+Y84wmoaasmtRpyXRUv3k9T5O07m7LsIbR3KHPZigtvD8a3RTiCwmr8v1SUu7vNzZLClw==
X-Received: by 2002:a63:904c:0:b0:41c:d5aa:1302 with SMTP id
 a73-20020a63904c000000b0041cd5aa1302mr2150351pge.13.1659628930951; 
 Thu, 04 Aug 2022 09:02:10 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:c349:7b49:2925:a0a?
 ([2602:ae:154e:e201:c349:7b49:2925:a0a])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a170902784f00b0016eecdf8978sm1184589pln.106.2022.08.04.09.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 09:02:10 -0700 (PDT)
Message-ID: <f67a0ffb-088c-d8a6-28a7-b8c29677620e@linaro.org>
Date: Thu, 4 Aug 2022 09:02:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 2/5] target/loongarch: add gdb_arch_name()
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220804130213.1364164-1-gaosong@loongson.cn>
 <20220804130213.1364164-3-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220804130213.1364164-3-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

On 8/4/22 06:02, Song Gao wrote:
> LoongArch gdb_arch_name() is "Loongarch64", Dump from GDB.
> 
> GNU gdb (GDB) 13.0.50.20220519-git
> Copyright (C) 2022 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
> Type "show copying" and "show warranty" for details.
> This GDB was configured as "loongarch64-unknown-linux-gnu".
> Type "show configuration" for configuration details.
> For bug reporting instructions, please see:
> <https://www.gnu.org/software/gdb/bugs/>.
> Find the GDB manual and other documentation resources online at:
>      <http://www.gnu.org/software/gdb/documentation/>.
> 
> For help, type "help".
> Type "apropos word" to search for commands related to "word".
> (gdb) show architecture
> The target architecture is set to "auto" (currently "Loongarch64").
> (gdb)
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>

Matches bfd/cpu-loongarch.c, bfd_loongarch_arch.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> ---
>   target/loongarch/cpu.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index d84ec38cf7..94d5617639 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -661,6 +661,11 @@ static const struct SysemuCPUOps loongarch_sysemu_ops = {
>   };
>   #endif
>   
> +static gchar *loongarch_gdb_arch_name(CPUState *cs)
> +{
> +    return g_strdup("Loongarch64");
> +}
> +
>   static void loongarch_cpu_class_init(ObjectClass *c, void *data)
>   {
>       LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
> @@ -686,6 +691,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
>       cc->gdb_num_core_regs = 35;
>       cc->gdb_core_xml_file = "loongarch-base64.xml";
>       cc->gdb_stop_before_watchpoint = true;
> +    cc->gdb_arch_name = loongarch_gdb_arch_name;
>   
>   #ifdef CONFIG_TCG
>       cc->tcg_ops = &loongarch_tcg_ops;


