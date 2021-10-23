Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6021743824E
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 10:09:28 +0200 (CEST)
Received: from localhost ([::1]:42138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meC5n-0005VO-Ga
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 04:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meBcH-00033f-W4
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 03:38:58 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meBcE-0004Am-Ee
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 03:38:56 -0400
Received: by mail-wr1-x429.google.com with SMTP id d3so4589909wrh.8
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3eLMRWFsC205HSeEI83gBHAhc4dUUxSz3vI6/+UuFe8=;
 b=h6od3FmoURGj34DF0g2cXxFMxhWPjei82vAcCxS7VkheeTw4XLArsx5tYj1PkqKbyC
 YgYq4DcdrVOdEOm8UPnANyufFatDILG6uKIl64kvBxknMHYwTc2EGVm6hkOVO3s9FSd8
 fkSI/mFaChVvPsc4jeicuiHQOO0GnetSpyBRQ78OHBWeqpUbRgGuy1gDznkwJQQHXrhg
 mvOQELqRWUtV9LVjbgfonNjiH7454s3T/1w3QZFuf7uHEUc6SVU3EMYPlfmkv05KlqCW
 gip9FFpUnKR7Y85PqGVIu+PqqZttBGOZeWRp7SmVi68kpAsBSg7z+7mi60E+ofiQrCWP
 yEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3eLMRWFsC205HSeEI83gBHAhc4dUUxSz3vI6/+UuFe8=;
 b=q5xEBIPrPk0rrKs2ZyIu8ZaoxOAiczvcys2JPzl9hjIk+9vpPAUK8gXUL1BeokM6Js
 MyreEyr/Eb1cXf31YFMuHqmAymHPpfX1/cc5AjgRqOmFkKLLMWrX5FK0HNjYaQtlCnSc
 +sRhlbUvuOVaHgbJ16EGreF71xeo4MZ16L2GqrIIENsh341POstS06M8KcL0ot2AoDlU
 TfoFq6PjhFB/YzHccyjalqwXGL2eXaLy1vNxg3kpoBMuTiy/NZSrrJ8BiRxNAQo0F1Mq
 J6L42Urh9mg0ZF+NiESwhBqQaEJGLZ01GH3A/xLdisCKpYJHJ99Ik0M7c04ZEfiSMMXN
 yxtA==
X-Gm-Message-State: AOAM530TeMAE252HCV++D1CtBCLRaVSgDO16MzAu9cH/1rCpQM8MCOF5
 8j1LtsHjssUzRD8fr8xYMxI8pvfmQtA=
X-Google-Smtp-Source: ABdhPJwK1b/87jis30k9Ge5nJIHNk4CNk3NU3JRvUJfeAAgDI+rAfA76bprpEr3s/3LasZRhLdA/3Q==
X-Received: by 2002:a5d:4002:: with SMTP id n2mr5952297wrp.420.1634974730460; 
 Sat, 23 Oct 2021 00:38:50 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id w1sm12672551wmc.19.2021.10.23.00.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 00:38:49 -0700 (PDT)
Message-ID: <358fa312-0cc6-5cda-e48b-9a8059870f90@amsat.org>
Date: Sat, 23 Oct 2021 09:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/3] target/mips: Fix Loongson-3A4000 MSAIR config register
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211022174550.36937-1-f4bug@amsat.org>
 <20211022174550.36937-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211022174550.36937-4-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 19:45, Philippe Mathieu-Daudé wrote:
> When using the Loongson-3A4000 CPU, the MSAIR is returned with a
> zero value (because unimplemented). Checking on real hardware,
> this value appears incorrect:
> 
>   $ cat /proc/cpuinfo
>   system type     : generic-loongson-machine
>   machine         : loongson,generic
>   cpu model       : Loongson-3 V0.4  FPU V0.1
>   model name      : Loongson-3A R4 (Loongson-3A4000) @ 1800MHz
>   isa             : mips1 mips2 mips3 mips4 mips5 mips32r1 mips32r2 mips64r1 mips64r2
>   ASEs implemented        : vz msa loongson-mmi loongson-cam loongson-ext loongson-ext2
>   ...
> 
> Checking the CFCMSA opcode result with gdb we get 0x60140:
> 
>   Breakpoint 1, 0x00000001200037c4 in main ()
>   1: x/i $pc
>   => 0x1200037c4 <main+52>:  cfcmsa       v0,msa_ir
>   (gdb) si
>   0x00000001200037c8 in main ()
>   (gdb) i r v0
>   v0: 0x60140
> 
> So set MSAIR=0x60140 for the Loongson-3A4000 CPU model added in
> commit af868995e1b ("target/mips: Add Loongson-3 CPU definition").
> 
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/cpu-defs.c.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
> index cbc45fcb0e8..f43a8e7c9d9 100644
> --- a/target/mips/cpu-defs.c.inc
> +++ b/target/mips/cpu-defs.c.inc
> @@ -886,6 +886,7 @@ const mips_def_t mips_defs[] =
>                      (0x1 << FCR0_D) | (0x1 << FCR0_S),
>          .CP1_fcr31 = 0,
>          .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
> +        .MSAIR = (0x601 << MSAIR_ProcID) | (0x40 << MSAIR_Rev),

Rev and ProcID are 8-bit, then only bit 16 is defined in the spec
(WRP: Vector Registers Partitioning). Bits 17 and 18 are "reserved"
per the spec revision 1.12.

Changing that by

           .MSAIR = (1 << MSAIR_ProcID),

or

           .MSAIR = (1 << MSAIR_ProcID) | (0x40 << MSAIR_Rev),

allows guests to see non-zero Implementation ProcessorID.

