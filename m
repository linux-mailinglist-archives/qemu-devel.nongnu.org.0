Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746D6648FA6
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 17:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42Rd-0006Sn-0o; Sat, 10 Dec 2022 11:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p42RR-0006SD-Ac
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 11:11:09 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p42RL-0004Sa-3N
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 11:11:09 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so11261878pjj.2
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 08:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=svS1jgou4gzKkdyGGBqNw+0FNwCtYxwSY4KCSX/3IVI=;
 b=AyYzLiW8sbKiDO7dej8VrmnczXwa6/QpR+vOy6KQQJS9gNIfpigroxOp6GJp05aDTg
 HYzxjz8fJ/woAWPD5DTJ2+26ed8KXle2Ne4Vd9FxgQ/OHkF0HnB1Vy6acUl7chI20tmv
 l80HiLeBpP9EEeWWQDCgwribdkBGsM4Chi4uKJr8eXL8ZAbP0zyZvRpTjH0R79/6pg7l
 hCRCL2jBmQ3V1YgTl3ZlLj4cjXcLZK6PJoox6mTqrHhYjkBbPlH8hZIhL5QdiPsnS/XL
 dH9DQbTUxruDlfMWM5u9DeIjJqqwZSvEaJyi4hxpPzV6hITu8veuUJSoNc1XmD8vv2A2
 rrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=svS1jgou4gzKkdyGGBqNw+0FNwCtYxwSY4KCSX/3IVI=;
 b=ChAyaBZsENnTbQ7yDytYcUOYcN20CQbGSb4gVA06x8BbxJ+PbtXV5JYXP5wLHD2KAr
 OtU7XqzECcsDIgKcJADH54ptNffg6LxfXlZU31DSi4Sw4FEqkMcR9rhw7JbC1u2xtYRJ
 6+w1pK3jIPElGWFTbHc++3S4D/xzt8jD3tlwvyXmN3EklO2B0v+RFCNJ7I5+AMtEDndd
 AJ2ltCsPqLx48Kz9XITBM9a2WzY6R4SVOnra8PLIUCqLj7GpKmhP1JZxHVK4kebW0jZM
 syc+06jCjzcA0uPhFEKV+yipI4QRJ6ZmAfBGoFpCFopHTLupsznVCQQgORJKSdkzae51
 zmzQ==
X-Gm-Message-State: ANoB5plXnhyDJ6EnwUE1MGa727X0hxjIhowM7NuVQwaewUwHZ0VVgeWp
 aoVS6LZHwRNBgvqwyViyi298I4ZC+ik=
X-Google-Smtp-Source: AA0mqf5WgdUxI+tlNOAJOHpQmuqvOVfDtL0DNpGtqgMnocBu2nqodx2K/s7CaKGHGzuuZjMn84NapQ==
X-Received: by 2002:a9d:6452:0:b0:667:20b:b999 with SMTP id
 m18-20020a9d6452000000b00667020bb999mr4718122otl.2.1670686066383; 
 Sat, 10 Dec 2022 07:27:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a9d7495000000b006705829996fsm1899149otk.56.2022.12.10.07.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 07:27:46 -0800 (PST)
Date: Sat, 10 Dec 2022 07:27:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, balaton@eik.bme.hu
Subject: Re: [PATCH v2] target/sh4: Fix TB_FLAG_UNALIGN
Message-ID: <20221210152744.GA2275483@roeck-us.net>
References: <20220901101509.145758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901101509.145758-1-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=groeck7@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On Thu, Sep 01, 2022 at 11:15:09AM +0100, Richard Henderson wrote:
> The value previously chosen overlaps GUSA_MASK.
> 
> Rename all DELAY_SLOT_* and GUSA_* defines to emphasize
> that they are included in TB_FLAGs.  Add aliases for the
> FPSCR and SR bits that are included in TB_FLAGS, so that
> we don't accidentally reassign those bits.
> 
> Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I noticed that my sh4 emulations crash randomly with qemu v7.2-rc4.
This happens with all Linux kernel versions. Testing shows that this
patch is responsible. Reverting it fixes the problem.

Some of the symptoms are attached below.

Guenter

---
Symptoms:

- Random crashes, such as

Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
CPU: 0 PID: 1 Comm: init Not tainted 5.10.158 #1
Stack: (0x8c821e60 to 0x8c822000)
1e60: 8c436726 00000000 8c5db1fc 8c011a64 8ca7aa80 8c821e9c ab2577ac 8c021fca 
1e80: 8c011a64 8c81dde0 00020000 8c81dda0 00000000 0000000b 8c81f8e0 0000000b 
1ea0: 8c81f8e0 00000001 00000000 8c81fb9c 00000000 8c821eb0 8c821f5c 8c821fa4 
1ec0: 8c81fa5c 8c81fc1c 000000cd 00000000 00000000 00000000 ab2577ac 8c022af8 
1ee0: 8c81dda0 8c81dde0 00020000 8c821f5c 8c81dde0 8c81dda0 0000000b 8c02b1e8 
1f00: 8c821f5c 400004d8 8c821f48 8c011a64 0000000a 0000000a 8c81ca60 8c012db4 
1f20: 29558c9c 00000406 295f9294 8c821fe4 8c57702c 8c821fa4 09000002 8c821f68 
1f40: 8c011a64 295f9294 8c02b0d2 29558c9c 00000406 8c57702c 0000000b 0000000b 
1f60: 00000000 00000001 00000008 00000000 00000000 00000000 00000000 00000000 
1f80: ab2577ac 8c0150f8 29558c9c 00000406 295f9294 00000000 40008000 8c0150ec 
1fa0: 8c820000 7bfcfadc ffffffff 00000040 000080f0 cfffffff 00000000 00000000 
1fc0: 8c820000 295fae80 0d39ad3d 295fae80 295630ee 295f9294 00000406 29558c9c 
1fe0: 7bfcfadc 295af5ac 295af6ea 00008100 295fafbc 00000000 0d39acf0 ffffffff 

Call trace:
 [<8c436d88>] printk+0x0/0x48
 [<8c011a64>] arch_local_irq_restore+0x0/0x24
 [<8c021fca>] do_exit+0x8a6/0x8f0
 [<8c011a64>] arch_local_irq_restore+0x0/0x24
 [<8c022af8>] do_group_exit+0x34/0x90
 [<8c02b1e8>] get_signal+0xd8/0x5f8
 [<8c011a64>] arch_local_irq_restore+0x0/0x24
 [<8c012db4>] do_notify_resume+0x6c/0x54c
 [<8c011a64>] arch_local_irq_restore+0x0/0x24
 [<8c02b0d2>] force_sig_fault_to_task+0x3a/0x6c
 [<8c0150f8>] resume_userspace+0x0/0x10
 [<8c0150ec>] ret_from_exception+0x0/0xc

Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b^M
^M
CPU: 0 PID: 1 Comm: init Not tainted 4.14.301 #1^M
Stack: (0x8fc19e08 to 0x8fc1a000)^M
...

- Alleged FPU use

BUG: FPU is used in kernel mode.
------------[ cut here ]------------
kernel BUG at arch/sh/kernel/cpu/fpu.c:60!
Kernel BUG: 003e [#1]
Modules linked in:

CPU: 0 PID: 1166 Comm: sh Not tainted 4.14.301-rc2-00084-gdd6fc0ede260 #1
task: 8ff38800 task.stack: 8f40e000
PC is at fpu_state_restore+0x60/0x88
PR is at fpu_state_restore+0x60/0x88
PC  : 8c01969c SP  : 8fc2be6c SR  : 400080f1
TEA : 004382e8
R0  : 00000020 R1  : 8c4f21a4 R2  : 8c4f21a4 R3  : 8c011be8
R4  : 000000f0 R5  : 00000000 R6  : 00000023 R7  : 8c1b97e0
R8  : 8fc2bec0 R9  : 8ff38800 R10 : 8c0196c4 R11 : 00000000
R12 : 8c011be0 R13 : 8ff38800 R14 : 8f40fe24
MACH: 000003de MACL: 00000184 GBR : 295fafbc PR  : 8c01969c

Call trace:
 [<8c0196d0>] fpu_state_restore_trap_handler+0xc/0x18
 [<8c0196c4>] fpu_state_restore_trap_handler+0x0/0x18
 [<8c0150ec>] ret_from_exception+0x0/0xc
 [<8c0150ec>] ret_from_exception+0x0/0xc
 [<8c3cb1dc>] __schedule+0x1bc/0x50c
 [<8c011be0>] arch_local_save_flags+0x0/0x8
 [<8c017016>] save_fpu+0x16/0x80
 [<8c011fd6>] __switch_to+0x5a/0x8c
 [<8c3cb1dc>] __schedule+0x1bc/0x50c
 [<8c011be0>] arch_local_save_flags+0x0/0x8
 ...

- Alleged unhandled unaligned access errors in different locations
  (varies per run)

Fixing up unaligned userspace access in "S40network" pid=1111 pc=0x0043761e ins=0x112d
Fixing up unaligned userspace access in "S40network" pid=1111 pc=0x0043761e ins=0x112d
Sending SIGBUS to "S40network" due to unaligned access (PC 43761e PR 295b6796)
Bus error

Fixing up unaligned userspace access in "sh" pid=1122 pc=0x295b1714 ins=0x1123
Fixing up unaligned userspace access in "sh" pid=1122 pc=0x295b1714 ins=0x1123
Sending SIGBUS to "sh" due to unaligned access (PC 295b1714 PR 295b170c)

Fixing up unaligned userspace access in "klogd" pid=1084 pc=0x295ac464 ins=0x2922
Fixing up unaligned userspace access in "klogd" pid=1084 pc=0x295ac464 ins=0x2922
Sending SIGBUS to "klogd" due to unaligned access (PC 295ac464 PR 295ac45c)


