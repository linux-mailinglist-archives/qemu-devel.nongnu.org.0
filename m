Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78A559802
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 12:39:44 +0200 (CEST)
Received: from localhost ([::1]:37072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4gj1-0002aa-FI
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 06:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ghN-0001mj-Pn
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:38:05 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:43971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ghH-00049x-DV
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:38:00 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id q132so3767088ybg.10
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 03:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mZQDTU1JIyifz04VzKTm3VJAL4ZxnYEePIYFHxsRw2E=;
 b=EpyQrXwQ7mQqIEbz3zG4BAsOci0ZwvHsdS5NlDQEBhJuplyEG+LdJwtiFeG2CcJZ/j
 iIghmEebQs01H6DIOoJuclyPr9lXViD4lLQOybe3XRQ4R/KFwN+YgtEzd836vuy3lkrH
 CuXW3iDrpsfftEOaKcbWy+GEiW0IliWsAUIfe+SHXoVfutwk+9QX4xLgbTfiQECAjZhV
 ME9+HfsMXD2gl6BvZm5GCy4Do3iEIV43SlKNHQIrp4Ri+FFZYsq9ztmCKpIZGEBiuZrE
 XNh/LaW8Rj2LGdsT3Xf/Mq3BjV7DeWDyH/gKpevycfei6H+TzY/Rzf9xq0mqUs0vEDb9
 14kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mZQDTU1JIyifz04VzKTm3VJAL4ZxnYEePIYFHxsRw2E=;
 b=aH6oDP9j923b9xREXgOuI9gRxzj+QE2YUyatU1Dc7nyUL/h7jXf95LtItGQ9grFFHo
 hox90kvxsNB8SIVPdWpy08qrgAnAXFGLP+gxIrUkCt5voejkEV7Xmlh94/LPFpcxnYGY
 OAnsWutIEHsTRYt4Niny1hQkV4NtUVxtUAto5EUBtVSWEfjKXOKd6Lph6D8CyvEqGcb5
 VvO+XsKBbtlqaZU2UikE9b8z9iv+2H2vRSegqSJOxOC58HCBajZ3yj163fgRTn1tj8zv
 ZO2DPBgFWitx+T7nHTl4nvbgaKoBijYGRAeJCvlmVPbITm4ndFnBVBXTJnwe5EIFd3lS
 tyUQ==
X-Gm-Message-State: AJIora/GRzcw27hM62rbTIJEWxY2Xb3v8HI6yLFyxbJJpnv/foTPa1wm
 jVIiwcJTFG0X8fVEFR1qyCgzxI/SZA6QnNvqC43AVw==
X-Google-Smtp-Source: AGRyM1vWvhul2VOroVNn6b68QKU7lXHFi7KBC1Abi/35KhH7jRP2BNTM9fuL8nnyhc69xPdlgfsW+AkjjznRGxP45IM=
X-Received: by 2002:a25:7ec2:0:b0:669:b7ad:8806 with SMTP id
 z185-20020a257ec2000000b00669b7ad8806mr4303781ybc.85.1656067072442; Fri, 24
 Jun 2022 03:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220528195344.4160516-1-ben@thefarbeyond.com>
In-Reply-To: <20220528195344.4160516-1-ben@thefarbeyond.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 11:37:14 +0100
Message-ID: <CAFEAcA8CVN2JRO0MXKbt2Zw0XsmrtVN3ndwNLiORiOmCRyzOcA@mail.gmail.com>
Subject: Re: [PATCH] Updating gdbstub to allow safe multithreading in usermode
 emulation
To: Ben Cohen <ben@thefarbeyond.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Sat, 28 May 2022 at 21:11, Ben Cohen <ben@thefarbeyond.com> wrote:
>
> I was testing some multi-threaded code in qemu's usermode and ran into
> issues with the gdbstub because the user mode qemu emulation spawns new
> threads when the process tries to make a new thread but the gdbstub does
> not handle the threads well. The current gdbstub has a single global
> struct which contains all the state data, and multiple threads can write
> to this struct simultaneously, causing gdb packets to be corrupted. The
> different threads can also try to read off the gdb socket at the same
> time causing the packet to be devided between threads. This patch is
> designed to add a single separate thread for the usermode gdbstub which
> will handle all the gdb comms and avoid the multithreading issues.
>
> To demonstrate that the mutlithreading was not working properly before
> and that it hopefully works properlly now, I wrote a small test program
> with some gdb scripts that can be found here:
> http://url6163.thefarbeyond.com/ls/click?upn=3DdUoerjbXT3NK9PiRMHEMD5Fm1R=
mJf0eUWTDkIDLODGZSRXu94ynuiGwQ-2FCFcimw5rndUfJbozecGKoOE5zbdfRVgadbVSeCrgP5=
IlB2UqPU-3DUBT-_E8SO-2FEypfU855L0ybQoiQY4Xaj8Z6NYzBoBK89OH-2BiIJOE8-2BoeEre=
lzsKKZyRONZN5M7Gzw0Zs4K0tnG4gxJSOWW89OLEjRW7ISHPWO2lT6fJJUM88-2BLL6sh4Bfexc=
L-2FKt7KhnEpzqyb9bd5UZ-2FR2iPVIjp7zfshwPtjJEHAHaIGeNZbI4nFw81hhs0N1tt9sAcC1=
ALVazbgnC5E-2F5ZChA-3D-3D

Thanks for this patch. I don't have time to do a full review of it,
but it sounds like you've definitely identified a bug. However
I'm not sure this is the right way to fix it.

Is signal handling really the only place where we need to be more careful
about the gdbstub handling for a multithreaded guest program?
How about other bits of gdbstub activity ?

Some more specific comments:

> +        /*
> +         * This mutex is first locked here to ensure that it is in a loc=
ked
> +         * state before the gdb_signal_handler_loop handles the next sig=
nal
> +         * and unlocks it.
> +         */
> +        qemu_mutex_lock(&signal_done_mutex);
> +        waiting_signal =3D &signal;
> +        /*
> +         * The thread locks this mutex again to wait until the
> +         * gdb_signal_handler_loop is finished handling the signal and h=
as
> +         * unlocked the mutex.
> +         */
> +        qemu_mutex_lock(&signal_done_mutex);

This code is locking the same mutex twice in a row. That's not
guaranteed to do anything sensible, so it's not a valid thing to do.

> +        /*
> +         * Finally, unlock this mutex in preparation for the next call t=
o
> +         * this function
> +         */
> +        qemu_mutex_unlock(&signal_done_mutex);
> +        sig =3D signal_result;
> +        if (!cpu->singlestep_enabled) {
> +            /*
> +             * If this thread is not stepping and is handling its signal
> +             * then it can always safely unlock this mutex.
> +             */
> +            qemu_mutex_unlock(&another_thread_is_stepping);
> +        } else {
> +            /*
> +             * If this thread was already stepping it will already be ho=
lding
> +             * this mutex so here try to lock instead of waiting on a lo=
ck.
> +             * This lock will prevent other non-stepping threads from ha=
ndling
> +             * a signal until stepping is done.
> +             */
> +            qemu_mutex_trylock(&another_thread_is_stepping);
> +        }
> +    }
> +    /*
> +     * Unlock here to because we are done handling the signal and
> +     * another thread can now start handling a pending signal.
> +     */
> +    qemu_mutex_unlock(&signal_wait_mutex);
> +    return sig;
> +}

I have not analysed the code in detail but I get the impression that
maybe you're trying to use some of these mutexes to do jobs that
would be better done with a semaphore ?

> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index c35d7334b4..15bfb76cca 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -47,6 +47,19 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const=
 char *fmt, va_list va);
>  int use_gdb_syscalls(void);
>
>  #ifdef CONFIG_USER_ONLY
> +/**
> + * gdb_thread_handle_signal
> + * @cpu_env: The guest thread's cpu env
> + * @sig: The signal being handled for the guest thread
> + *
> + * This function is a layer in between the gdb_handlesig function and th=
e
> + * guest cpu threads. Instead of directly handling signals in the guest
> + * threads, this function passes off a signal to a handler loop thread r=
unning
> + * in the gdbstub that will handle each thread's signal atomically to av=
oid
> + * having races between threads to read and send data on the gdb socket.=
 The
> + * function returns the signal value from gdb_handlesig
> + */
> +int gdb_thread_handle_signal(CPUState *cpu_env, int sig);
>  /**
>   * gdb_handlesig: yield control to gdb
>   * @cpu: CPU
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 8d29bfaa6b..a252791217 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -1068,7 +1068,11 @@ static void handle_pending_signal(CPUArchState *cp=
u_env, int sig,
>      /* dequeue signal */
>      k->pending =3D 0;
>
> +#ifdef CONFIG_USER_ONLY
> +    sig =3D gdb_thread_handle_signal(cpu, sig);
> +#else
>      sig =3D gdb_handlesig(cpu, sig);
> +#endif

You might as well have left the function name alone and changed
the implementation of it, which would avoid changing this file.
In particular, for linux-user/ code, as the name suggests,
CONFIG_USER_ONLY will always be set, so the #else here is
unnecessary. Plus you would need to change bsd-user/ if you
change the function name.

thanks
-- PMM

