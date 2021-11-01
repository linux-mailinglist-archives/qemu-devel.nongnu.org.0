Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FADE442305
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:07:46 +0100 (CET)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfSz-0004qf-41
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhfPZ-0002sH-D5
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:04:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhfPU-0008Bi-2a
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:04:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so732276wmz.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XupQSTm2K4VlC+FrUb7XbaO2acsGsTXsWvde+V5kim8=;
 b=nmZRwz7LIzVP623j0rEleDaJ/M2Vx/02mRZQFUiLigM/oUCnHK2KuCj1pGQA8YEQOi
 pICgQuD4awTnVoSbeUIuY4nO3jc4qaRJxS1L5UHtnRdAhd4nlfIGpcBDiOw1ibju/RGS
 +glDqgYueE/m/5P7lO5fBJGVpsfteW7H2p3ZewIcX23PsB39X3ZeqGvFNysyRjtgeIiH
 UuDgK5/nS0mDRxPzowvKbI5LdM6oLpjjANxYsCXgawMKpQZHCVKmDarm4rARRLpG57EQ
 ljdQ3y57/l4VmmMorTCzzRy29keTE/4VjHfaMNmoIdKl6T8pkC/lpKIi4ajPeyAxADxj
 bXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XupQSTm2K4VlC+FrUb7XbaO2acsGsTXsWvde+V5kim8=;
 b=r83cRBH1f8k8zkM6GC6AaaRrAmYWpJXImm3oglM/bW3K4KT0Bd0bLcJx3sGRIDxflH
 UH6LMPXuuatePXJrkkWpu4pCZnP81QMrMN6CZiNNuLI0HcUNXhC4KCqaitBNdmWSxBj8
 LP0TOE6lXHD23YPQMZzUCwVYf7BX8Gu3DTAM3sZH3ooRhtRd+PhkQ0Dge2f9xno8SlnM
 vsG+1eM1io/3kbyHlX7vamUqvF9L4GOXOhyXkpHiF/pYl7VYJ4clrvuV3wCRSt9UHZTo
 S7jTvx931Fr4fhKwjsFtCYut5WpXVhHmaSUYCy0FVBkhS0WXBdd3cKievrl1uTWkZ03b
 4w2A==
X-Gm-Message-State: AOAM5322jfhJugWOHRUKj+WwJHiBPipn+SOf5BMkX9YwYpOwN8CO09HV
 Sr+LF4NqAbsrjPuntxF8HoA=
X-Google-Smtp-Source: ABdhPJxHGpyvxzJ/eAZsZfEmfDFgGUjvB6P9N1yGkOQYeYRCn/prSGh7ACoVhesjAWHs15P34ac4ew==
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr1991659wme.38.1635804246501; 
 Mon, 01 Nov 2021 15:04:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d3sm17757432wrb.36.2021.11.01.15.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 15:04:06 -0700 (PDT)
Message-ID: <78b6efd1-9fc5-6bed-19bd-14a882e5db04@amsat.org>
Date: Mon, 1 Nov 2021 23:04:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] Revert "elf: Relax MIPS' elf_check_arch() to accept
 EM_NANOMIPS too"
Content-Language: en-US
To: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211101114800.2692157-1-f4bug@amsat.org>
 <PSAPR03MB527055869102C6798B291CEBE28A9@PSAPR03MB5270.apcprd03.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <PSAPR03MB527055869102C6798B291CEBE28A9@PSAPR03MB5270.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 22:40, Vince Del Vecchio wrote:
> Philippe said:
> 
>> So far QEMU only support the MIPS o32 / n32 / n64 ABIs. The p32 ABI is not implemented, therefore we can not run any nanoMIPS binary.
> 
> We use it internally to run nanoMIPS binaries every day.  I had thought everything relevant was completed and upstreamed, but perhaps there is a gap somewhere.  Let us investigate a little and get back to you.

I could wait few days until QEMU hard freeze and queue this patch as a
bug fix, but I doubt there is much you can do in that time frame, since
tomorrow is the soft freeze deadline.

Here I am simply changing the code to reject p32 binaries to avoid
users to waste their time trying to run a nanoMIPS binary. I am not
removing any of the nanoMIPS emulation code.

> Were you trying to run a bare metal executable or was it linux?

While I tested both toolchains (bare metal and musl/linux), here I am
only referring to the musl/linux one, since it is related to user-mode
emulation (files under linux-user/ directory).

The system emulation part is left unchanged (you can still boot a
nanoMIPS kernel if you select the proper CPU type).

> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+vince.delvecchio=mediatek.com@nongnu.org> On Behalf Of Philippe Mathieu-Daudé
> Sent: Monday, November 1, 2021 7:48 AM
> To: qemu-devel@nongnu.org
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>; Richard Henderson <richard.henderson@linaro.org>; Laurent Vivier <laurent@vivier.eu>; Philippe Mathieu-Daudé <f4bug@amsat.org>; Petar Jovanovic <petar.jovanovic@syrmia.com>; Aurelien Jarno <aurelien@aurel32.net>
> Subject: [PATCH] Revert "elf: Relax MIPS' elf_check_arch() to accept EM_NANOMIPS too"
> 
> Per the "P32 Porting Guide" (rev 1.2) [1], chapter 2:
> 
>   p32 ABI Overview
>   ----------------
> 
>   The Application Binary Interface, or ABI, is the set of rules
>   that all binaries must follow in order to run on a nanoMIPS
>   system. This includes, for example, object file format,
>   instruction set, data layout, subroutine calling convention,
>   and system call numbers. The ABI is one part of the mechanism
>   that maintains binary compatibility across all nanoMIPS platforms.
> 
>   p32 improves on o32 to provide an ABI that is efficient in both
>   code density and performance. p32 is required for the nanoMIPS
>   architecture.
> 
> So far QEMU only support the MIPS o32 / n32 / n64 ABIs. The p32 ABI is not implemented, therefore we can not run any nanoMIPS binary.
> 
> Revert commit f72541f3a59 ("elf: Relax MIPS' elf_check_arch() to accept EM_NANOMIPS too").
> 
> See also the "ELF ABI Supplement" [2].
> 
> [1] http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_p32_ABI_Porting_Guide_01_02_DN00184.pdf
> [2] http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_ABI_supplement_01_03_DN00179.pdf
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/elfload.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c index f9b82616920..5da8c02d082 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -925,8 +925,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en  #endif
>  #define ELF_ARCH    EM_MIPS
>  
> -#define elf_check_arch(x) ((x) == EM_MIPS || (x) == EM_NANOMIPS)
> -
>  #ifdef TARGET_ABI_MIPSN32
>  #define elf_check_abi(x) ((x) & EF_MIPS_ABI2)  #else
> --
> 2.31.1

