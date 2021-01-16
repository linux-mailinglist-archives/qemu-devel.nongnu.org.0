Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F3B2F8E40
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 18:22:52 +0100 (CET)
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0pHm-0007ei-HH
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 12:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0pGh-000789-RS
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 12:21:43 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0pGe-0005QI-Ue
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 12:21:43 -0500
Received: by mail-pg1-x532.google.com with SMTP id z21so8178244pgj.4
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 09:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bVxsI6wCQi5l1f0F+hFe7ec/qjDpAfa+cZv4+7SW3DM=;
 b=gfQQX/+HQ5/W7ZDV7Xkremt7eaI0IZKvSzz2Kn/Wf+eXlQbnLA3SCtPlLc30ld5HSJ
 EkdW66gfDf95QSf/oVwmtRozXwSSULRGVv4j64YUQlheQ8i54z+xSPd3eqeKjjMASZQ1
 KrSL4esfDIVkD0EDsfNLQKX70crXvAsHXcntT2Yg0qc6KuAWd8722NAqwxqgiCmasxAw
 CPethIfWS8vAlO6NdWMrwXuvVpx1OLj343SheU8t+PSvc9TrBXlsQM1DB3xc0XqpdY0+
 nyPeXeY6VQzUBYv/pQ+Rk0nIg5CFGbV3k1Z26LDmDqNvDl8a+qeuIagRoiAujgKFkmgi
 i0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bVxsI6wCQi5l1f0F+hFe7ec/qjDpAfa+cZv4+7SW3DM=;
 b=swUtv9gMqE78zr6zy9EfAYH1BGSKhrKA3HxT4wSTbitVUfgRNFy5nK234pg/rJj2dE
 BWgAA9aMygWhcLn3oXCnrfAh4j3Yrt5PVxTbc69Wmz9psIohOfwhM8GPG71/rdRXDcs7
 VscMJN2rixUa9PN1S/EEgLxV8a6K+bWzXlpYaQcFlXZdupPfzBsvzaR1/ZGaP3hjjWHi
 wH3v2ajv5HeN2kL8IiX7JQQXUYq2GbMatC3Bff+3aoGo4TRIFgihW72jyNuF1lzcJnHR
 9lNJb42/HPOfhi1lCetQ83SSZItU2uyznzQtWAzBZmSBuLrpyJV/uuGVLBqlUznWZj0M
 hp4A==
X-Gm-Message-State: AOAM531Bxaf7xR5GxbG2pTZuKFXa55kcXfYagKr9swPCwlbAmfpou97B
 Il76uwGGgtZmIUPKvQm+24vHJQ==
X-Google-Smtp-Source: ABdhPJzuY8plAlelC47kpNqyXGMN7/keFqJvVqoGZs67dmqDntz6MymvSzTM+fcFJPJdvXwWwaKujg==
X-Received: by 2002:a65:6207:: with SMTP id d7mr18823134pgv.92.1610817698864; 
 Sat, 16 Jan 2021 09:21:38 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id gx21sm11782609pjb.31.2021.01.16.09.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 09:21:38 -0800 (PST)
Subject: Re: Recent TCG commit breaks PPC
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cd52c38c-4b9-791d-fca0-87f99bb0a011@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1934d78f-c349-e2ae-fcf8-d34f83a71c88@linaro.org>
Date: Sat, 16 Jan 2021 07:21:34 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cd52c38c-4b9-791d-fca0-87f99bb0a011@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.039,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/21 4:38 AM, BALATON Zoltan wrote:
> Hello,
> 
> Commit 8fe35e0444be (tcg/optimize: Use tcg_constant_internal with constant
> folding) seems to break PPC emulation for me:
> 
> Thread 3 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
> [Switching to Thread 0x7ffff51e7700 (LWP 22636)]
> 0x0000555555afd4ee in ts_are_copies (ts2=0x7fff8c008f90, ts1=0x7fff8c001510) at
> ../tcg/optimize.c:68
> 68        return ts_info(ts)->next_copy != ts;

Ok, riscv32 seems to have the same problem.  I'm on it.
I'll note that check-acceptance passes, so this points out a hole in our testing...


r~

> (gdb) bt
> #0  0x0000555555afd4ee in ts_are_copies (ts2=0x7fff8c008f90,
> ts1=0x7fff8c001510) at tcg/optimize.c:68
> #1  0x0000555555afd4ee in tcg_opt_gen_mov
>     (s=s@entry=0x7fff8c000b60, op=op@entry=0x7fff8c6b2348, dst=140735542203664,
> src=140735542235024) at tcg/optimize.c:191
> #2  0x0000555555afe05a in tcg_opt_gen_movi
>     (s=s@entry=0x7fff8c000b60, temps_used=temps_used@entry=0x7ffff51e63c0,
> op=op@entry=0x7fff8c6b2348, dst=<optimized out>,
>     val=<optimized out>) at include/tcg/tcg.h:731
> #3  0x0000555555aff79f in tcg_optimize (s=s@entry=0x7fff8c000b60) at
> tcg/optimize.c:1189
> #4  0x0000555555b13c39 in tcg_gen_code (s=0x7fff8c000b60,
> tb=tb@entry=0x7fffb3181380 <code_gen_buffer+4088659>) at tcg/tcg.c:4490
> #5  0x0000555555b1b485 in tb_gen_code
>     (cpu=cpu@entry=0x55555651c870, pc=pc@entry=4287582720,
> cs_base=cs_base@entry=0, flags=flags@entry=24576, cflags=-16777216,
>     cflags@entry=0) at accel/tcg/translate-all.c:1952
> #6  0x0000555555b7c303 in tb_find (cf_mask=0, tb_exit=0, last_tb=0x0, cpu=0x0)
> at accel/tcg/cpu-exec.c:454
> #7  0x0000555555b7c303 in cpu_exec (cpu=cpu@entry=0x55555651c870) at
> accel/tcg/cpu-exec.c:810
> #8  0x0000555555ab5ea2 in tcg_cpus_exec (cpu=cpu@entry=0x55555651c870) at
> accel/tcg/tcg-cpus.c:57
> #9  0x0000555555ab7a03 in rr_cpu_thread_fn (arg=arg@entry=0x55555651c870) at
> accel/tcg/tcg-cpus-rr.c:217
> #10 0x0000555555cc355a in qemu_thread_start (args=<optimized out>) at
> util/qemu-thread-posix.c:521
> #11 0x00007ffff6cc004c in start_thread () at /lib64/libpthread.so.0
> #12 0x00007ffff6bf13af in clone () at /lib64/libc.so.6
> 
> This can be reproduced for example with booting AROS as described here:
> 
> http://zero.eik.bme.hu/~balaton/qemu/amiga/#aros
> 
> The segfault happens during boot.
> 
> Regards,
> BALATON Zoltan


