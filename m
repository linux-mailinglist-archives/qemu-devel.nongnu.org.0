Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99EA4401BC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 20:11:06 +0200 (CEST)
Received: from localhost ([::1]:53318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgWLJ-0004p2-BT
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 14:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgWBr-0006Us-3F
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:01:19 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgWBp-0000Vf-GW
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:01:18 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b12so13146914wrh.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 11:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ye00b5/h5Z9cO//D1VOZ/inxt3iCdH7OYYFk30XgjFA=;
 b=B80qWjQA/1URYMRD0StAQHtWdg4+ub7vAXqX2PDIRlPSYJ52dpLI/Ur9SyddcYsSKL
 x5FyIG+UabJZEnoYrDr9Oy66+uXEjCa/hEPSSmMJ9tJC4ykH9Jt6sWdUpu7+g4TBudGg
 /ZRoKUb9kjdSBKwnFd9InmxvwV7j5Px0RmVDDJ0vESPMHpf7qnLOnSU9eD/96+ZCnouc
 3yxRe+FaYmlsEmuwkSJb8ABrpKWfKx1qMQK4PUi0KnYJ3AdNjMhdWxCuHgXA8eJHOohe
 1V+lsdissN7GqfDB5l9WG/U4iAtJVwcYkmDvQj9m32FV22qb/Ch1ylpdlDze/vSzR8XW
 P83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ye00b5/h5Z9cO//D1VOZ/inxt3iCdH7OYYFk30XgjFA=;
 b=IljfCIE0tN2ThmHbqDdzSe0LS9m17PD2MvtzyMAdyd9clbC3ky96Ogo5qlcY8tAuEO
 xvuh+gicyPveudoMTiatL6sfiSqHUkyTHx0agQ0BgHovGgNXVik2JxvKDDJRIjeJcNl8
 zEy4lEIxBaez6+ACFtcXjBReSjM5KO32feZCUhZ0gdePVqVTdmBh08xODxB3uH1Qukvs
 6mXqHlMP/NSS9olrJmGSWpl6gjP3X4Rp9tenMqojewEDvah6coXw/YTIHyYNomL4T2E3
 DYe/GN79QlRn1yxXHMyKZlEPLK4xroejgB3MGTPt+K5fZBl7EEYRy+hSSFoBa9zd1L72
 z5HA==
X-Gm-Message-State: AOAM530dMBBOBkQGfnj1RBGsx8vCOxrn7D0EGW9mwNVSCtGRHJrG2p8H
 AuiqvDsuPpZ71fvfmHfljtrC1E14yEM=
X-Google-Smtp-Source: ABdhPJzntInqS4WNtAh+jBNjnQs9YqgMDBjg90IaNARC9CcMmOwRACJXJeVwjTZftJ+g6mECQl66Ww==
X-Received: by 2002:a7b:c103:: with SMTP id w3mr21417723wmi.145.1635530475744; 
 Fri, 29 Oct 2021 11:01:15 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m8sm6379831wri.33.2021.10.29.11.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 11:01:15 -0700 (PDT)
Message-ID: <936b4765-ba9a-0f0a-b6f6-281be08c84bb@amsat.org>
Date: Fri, 29 Oct 2021 20:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] target/mips: Fix Loongson-3A4000 MSAIR config register
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211026180920.1085516-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026180920.1085516-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 20:09, Philippe Mathieu-Daudé wrote:
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
> MSAIR bits 17 and 18 are "reserved" per the spec revision 1.12,
> so mask them out, and set MSAIR=0x0140 for the Loongson-3A4000
> CPU model added in commit af868995e1b.
> 
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Mask out bits 17/18
> ---
>  target/mips/cpu-defs.c.inc | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to mips-next.

