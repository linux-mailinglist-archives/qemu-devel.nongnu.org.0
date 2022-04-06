Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D886B4F6617
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 18:59:12 +0200 (CEST)
Received: from localhost ([::1]:49620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc8zv-00043F-Nc
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 12:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc8yZ-0003O0-JT
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 12:57:47 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:34639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc8yW-0001Dc-SF
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 12:57:47 -0400
Received: by mail-qt1-x831.google.com with SMTP id c4so5402090qtx.1
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=jIeKXHgCB7dWBMNCehR5Vy4uTF7KgqfXtOQC5KMYi7M=;
 b=E2SnPhXxq0LWHG4EFgBau0+kmV+hJC9+RFXXl/SjZ9EG3ayleh68GkrB9mES7em1Hs
 nqA9eBEySyeuziaT/E9rztc58j6mc1h1urxVYNHpS5GFsFlYHtHatrGutuGQi8NGk5QY
 Ts4rvE9kSgtftD1Cj20Mecgo++qSRcGgtAdY77maI7Sud5fo+/7HAAYtKgfvg34awoKl
 ud5AM3E753otcAStl29PhGEiyDSARZPFawg0gYSgDC5deyOdhCGN7hVPR1Dku68fL+zA
 CCgpY8tQl7wtF8UH4Ul6yTPhG7NmwN7lPBfsPQZ/CyYAl89aL2hAJvxi03qpqPphS8Hn
 cEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jIeKXHgCB7dWBMNCehR5Vy4uTF7KgqfXtOQC5KMYi7M=;
 b=c6P3jftC77/OcpNbRLM0A21wbGM6iViuGKa+EIjA507iQAWw0JWR/LIYjzu7unEbQO
 4k9bk23b4y9gN9nS6Ug5SxKyL8Bf5ApK7DyOSoFhZqDBLexkRvn6AxPe23AUH/DYYgWO
 MPsXSO5DhBWnUWTixq+adXyDJudQfJIcWjlwLuakqAAWQ8mJP0arpMGnL2Ld3IeYNkRQ
 cnDCoMAZTVz7vOmUX1GuwRUTVyFCYe+BBmbP9dyEZHc3+68XlUcDj2ynDjEDZhspgZUt
 uaoSu1b3mp0rfrFr6QWrcmb/KnGSuwM7wE5MV9Y5ubGk3C43TnPVbdeLpYXJlyTI2geS
 k7xw==
X-Gm-Message-State: AOAM533k+7u3c1o0PLnqxsYxF3rgyI1vJXPH9l6somjWYzgLhYZ5LYEy
 sVuQOOwxkqUymlvkeiMTaxn1Hw==
X-Google-Smtp-Source: ABdhPJwXsFz1NIC3ecw6Te7AC5Mqh8smjADJdrfXN4VXh00RbWGYmqojpBpt4qt2Y7g2+bLf5W9vBw==
X-Received: by 2002:a05:620a:2a05:b0:67d:2fb0:b292 with SMTP id
 o5-20020a05620a2a0500b0067d2fb0b292mr6540576qkp.343.1649264263568; 
 Wed, 06 Apr 2022 09:57:43 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 q123-20020a378e81000000b0067eb3d6f605sm9997070qkd.0.2022.04.06.09.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 09:57:42 -0700 (PDT)
Message-ID: <0fe68d69-1b9c-2bac-4fd4-5e31e84eaac2@linaro.org>
Date: Wed, 6 Apr 2022 11:57:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [BUG]QEMU jump into interrupt when single-stepping on aarch64
Content-Language: en-US
To: Shuai Xue <xueshuai@linux.alibaba.com>, qemu-devel@nongnu.org
References: <3dc5add1-1353-584b-b655-a9546743df1c@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3dc5add1-1353-584b-b655-a9546743df1c@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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

On 4/6/22 09:30, Shuai Xue wrote:
> Dear, folks,
> 
> I try to debug Linux kernel with QEMU in single-stepping mode on aarch64 platform,
> the added breakpoint hits but after I type `step`, the gdb always jumps into interrupt.
> 
> My env:
> 
> 	gdb-10.2
> 	qemu-6.2.0
> 	host kernel: 5.10.84
> 	VM kernel: 5.10.84
> 
> The steps to reproduce:
> 	# host console: run a VM with only one core, the import arg: <qemu:arg value='-s'/>
> 	# details can be found here: https://www.redhat.com/en/blog/debugging-kernel-qemulibvirt
> 	virsh create dev_core0.xml
> 	
> 	# run gdb client
> 	gdb ./vmlinux
> 
> 	# gdb client on host console
> 	(gdb) dir ./usr/src/debug/kernel-5.10.84/linux-5.10.84-004.alpha.ali5000.alios7.aarch64
> 	(gdb) target remote localhost:1234
> 	(gdb) info b
> 	Num     Type           Disp Enb Address            What
> 	1       breakpoint     keep y   <MULTIPLE>
> 	1.1                         y   0xffff800010361444 mm/memory-failure.c:1318
> 	1.2                         y   0xffff800010361450 in memory_failure
>                                                     at mm/memory-failure.c:1488
> 	(gdb) c
> 	Continuing.
> 
> 	# console in VM, use madvise to inject a hwposion at virtual address vaddr,
> 	# which will hit the b inmemory_failur: madvise(vaddr, pagesize, MADV_HWPOISON);
> 	# and the VM pause
> 	./run_madvise.c
> 
> 	# gdb client on host console
> 	(gdb)
> 	Continuing.
> 	Breakpoint 1, 0xffff800010361444 in memory_failure () at mm/memory-failure.c:1318
> 	1318                    res = -EHWPOISON;
> 	(gdb) n
> 	vectors () at arch/arm64/kernel/entry.S:552
> 	552             kernel_ventry   1, irq                          // IRQ EL1h

The 'n' command is not a single-step: use stepi, which will suppress interrupts.
Anyway, not a bug.

r~

