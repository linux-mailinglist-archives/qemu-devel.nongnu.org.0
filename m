Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B4A5F42B3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 14:09:22 +0200 (CEST)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofgjh-0001G2-Q2
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 08:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofggj-00073L-JR
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:06:17 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofggh-000224-IN
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:06:17 -0400
Received: by mail-ej1-x629.google.com with SMTP id v22so508452ejw.8
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 05:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=dc/HQVcdyiNoDBDGtEqc+AZUdjJ6nEogJs3TtwPWF30=;
 b=M43vmVLOuj+1WCSh6yBIwXSWN2Z9y+0XG9neGs372kFv9BUwOXrkm9f9b+PDJgjizP
 HXclHTOWVdOvC59VWZ9two6e9QUX85q3R3558r73gPTBE/ELxSKnoq612Oge7qwWl+GS
 h+B2ljVjL3C4z3LwXqGmxSGk8odeRpeTjo1u9QmGhl4dUW9F8jp0dhr8xxLpx+gFdrrH
 0fJktqhtWJ1CWGKqHjY7XUwosHOfKj1GxSdSdDS0xP6a5kO49Cinb2CiMNvc7wPgFx1G
 NxEnM2PBGI54Nu6feirwlvwjAjtNXfsRO0BYNSlQFrMhvft8olQu625jvaeQ4IjB2u3k
 v94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dc/HQVcdyiNoDBDGtEqc+AZUdjJ6nEogJs3TtwPWF30=;
 b=D3R+K7pWj9OnS9OVASMZuMzUsSS+SlZmONAHBAwodd/XS8ei/zqFGBUXDrsLegOE6y
 ovvyQz/7fUEK8Pn45JGaBAaJMMOD4tHVo4LmDGgEDsUne+oGd7SmcnGBfVJLtiekHFPQ
 PMpVkKa4/V4jlh05YZtv41IYy7L9AWtBsjHxCzwttwe0a7ZB/sHC/zsbMSE2dk6tS4JS
 kF8kK0EGGKjQ48V8b504h3QleBaDGjY+0gopd6Qe1080ykq0D8EKa4Hqzel4ZuJr7QZW
 I9PNH//zL6EV9b8zs6fqam/T5SMc02XwQoGk5aqv1vsXHNufmqQlyrDg3vmwobpS1Sda
 5evw==
X-Gm-Message-State: ACrzQf2XYGssBEPdkN2qJ+06cUJ0RJfSWBDbDpYk4vo79ypFt6XY3MY9
 VR5NVogd5B9zwpZY5M2d6GtA9KvNrqZe+6WYooaFsyDpg4c=
X-Google-Smtp-Source: AMsMyM6OKYfYxL6/ub2xOPeFcVVQch090FpEUl7/VSBx/VZwr1mWH+jPDI9T45RNgeWe2r9NQ+3IyeFqlFDb97LzhtA=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr18399167ejc.619.1664885170187; Tue, 04
 Oct 2022 05:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221004120047.857591-1-berrange@redhat.com>
In-Reply-To: <20221004120047.857591-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 13:05:58 +0100
Message-ID: <CAFEAcA-u929TDTdq4F4o80mA-RxBKBVjO751_pP--3FMSLSEWQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user,bsd-user: re-exec with G_SLICE=always-malloc
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, ncopa@alpinelinux.org,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 4 Oct 2022 at 13:00, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> The g_slice custom allocator is not async signal safe with its
> mutexes. When a multithreaded program running in the qemu user
> emulator forks, it can end up deadlocking in the g_slice
> allocator
>
>   Thread 1:
>   #0 syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
>   #1 0x00007f54e190c77c in g_mutex_lock_slowpath (mutex=3Dmutex@entry=3D0=
x7f54e1dc7600 <allocator+96>) at ../glib/gthread-posix.c:1462
>   #2 0x00007f54e190d222 in g_mutex_lock (mutex=3Dmutex@entry=3D0x7f54e1dc=
7600 <allocator+96>) at ../glib/gthread-posix.c:1486
>   #3 0x00007f54e18e39f2 in magazine_cache_pop_magazine (countp=3D0x7f5428=
0e6638, ix=3D2) at ../glib/gslice.c:769
>   #4 thread_memory_magazine1_reload (ix=3D2, tmem=3D0x7f54280e6600) at ..=
/glib/gslice.c:845
>   #5 g_slice_alloc (mem_size=3Dmem_size@entry=3D40) at ../glib/gslice.c:1=
058
>   #6 0x00007f54e18f06fa in g_tree_node_new (value=3D0x7f54d4066540 <code_=
gen_buffer+419091>, key=3D0x7f54d4066560 <code_gen_buffer+419123>) at ../gl=
ib/gtree.c:517
>   #7 g_tree_insert_internal (tree=3D0x555556aed800, key=3D0x7f54d4066560 =
<code_gen_buffer+419123>, value=3D0x7f54d4066540 <code_gen_buffer+419091>, =
replace=3D0) at ../glib/gtree.c:517
>   #8 0x00007f54e186b755 in tcg_tb_insert (tb=3D0x7f54d4066540 <code_gen_b=
uffer+419091>) at ../tcg/tcg.c:534
>   #9 0x00007f54e1820545 in tb_gen_code (cpu=3D0x7f54980b4b60, pc=3D274906=
407438, cs_base=3D0, flags=3D24832, cflags=3D-16252928) at ../accel/tcg/tra=
nslate-all.c:2118
>   #10 0x00007f54e18034a5 in tb_find (cpu=3D0x7f54980b4b60, last_tb=3D0x7f=
54d4066440 <code_gen_buffer+418835>, tb_exit=3D0, cf_mask=3D524288) at ../a=
ccel/tcg/cpu-exec.c:462
>   #11 0x00007f54e1803bd9 in cpu_exec (cpu=3D0x7f54980b4b60) at ../accel/t=
cg/cpu-exec.c:818
>   #12 0x00007f54e1735a4c in cpu_loop (env=3D0x7f54980bce40) at ../linux-u=
ser/riscv/cpu_loop.c:37
>   #13 0x00007f54e1844b22 in clone_func (arg=3D0x7f5402f3b080) at ../linux=
-user/syscall.c:6422
>   #14 0x00007f54e191950a in start_thread (arg=3D<optimized out>) at pthre=
ad_create.c:477
>   #15 0x00007f54e19a52a3 in clone () at ../sysdeps/unix/sysv/linux/x86_64=
/clone.S:95
>
> The only known workaround for this problem is to disable the g_slice
> custom allocator, in favor of system malloc which is believed to be
> async signal safe on all platforms QEMU officially targets.
>
> g_slice uses a one-time initializer to check the G_SLICE env variable
> making it hard for QEMU to set the env before any GLib API call has
> triggered the initializer. Even attribute((constructor)) is not
> sufficient as QEMU has many constructors and there is no ordering
> guarantee between them.
>
> This patch attempts to workaround this by re-exec()ing the QEMU user
> emulators if the G_SLICE env variable is not already set. This means
> the env variable will be inherited down the process tree spawned
> from there onwards. There is a possibility this could have unexpected
> consequences, but this has to be balanced against the real known
> problem of QEMU user emulators randomly deadlocking.
>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/285
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>
> Can't say I especially like this but I'm out of other ideas for how
> to guarantee a solution. Users can't set env vars prior to launching
> QEMU user emulators when using binfmt.
>
> NB, I tested the linux-user impl and it stops the hangs in my
> testing. I've not even compiled tested the bsd-user impl, just
> blindly copied the linux-user code.

I suspect a simple re-exec won't play nicely with all the possible
ways you can use binfmt-misc...

-- PMM

