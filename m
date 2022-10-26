Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A3D60E3C4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 16:53:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onhlK-0007rt-TT; Wed, 26 Oct 2022 10:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1onhlJ-0007ff-4r
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 10:52:09 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1onhlB-0006fr-Qh
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 10:52:08 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id n130so19151394yba.10
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2ktY7KwejtSOSzuHGYnj7DOSQ7ZtFKFSqvt8QxG2pQ=;
 b=k0F5tc2f3ayulJmJPTXX45YEvEmXQ4ku/lK/b9tAfMIThrhwddkDPEJpPrE/ZCXGf6
 MD9mwo0dxU4lMDpzLCRUyOXvWKASL83q9POOSQz5SJ7xZcUibVXLeoXrabyfElplKTxv
 FLEEhdcjqhOJ2+J2prdrpECxqq8DePFXPCQdI75tryF01VqtI7fqhBCEmM1dQ8SKVUMH
 IRfHpOz8Sy3ZZcsHo3cbcnH73aPguwFcpuZ7rYUY5lYP2nNfYTOFNoOIZzIrepOjIeCm
 LDJBmaoDiMpNihieIebnOnuqNZuoX2fyLhRdb14nxKAAMQLJeBROsqB31Fx4f3KmjPLr
 qWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2ktY7KwejtSOSzuHGYnj7DOSQ7ZtFKFSqvt8QxG2pQ=;
 b=g811biRwohcbRcUie3aJct5IW0+t+gk0QrU/nFrmeOk0k+KShI3sjW50OAI6oyg21t
 VdITjLTFO8QAeYCwmY4J0o5WvTO/tfG6jbLgHG4CXzV/nvAHnwXAb94ifmizadHdq5sg
 3rN0/R9J5pCw+wPpyiDuhWHhc0Zge5qE0dK8DYmzo1N53g3adLby/73Z2hlcmYl8ygPo
 IR3krHTX03xwkKeTxXlXs/g+dqsPZFr0BOdFM1i61eSBFVBgWEeQcn3wS/cYGToU/ZD2
 Q+SPh/fetCTqT1OEJHhx536SK/rzQuG9CFljsDUw2aqSr3OYIKMvtWujf6deSaIYD9tR
 c69A==
X-Gm-Message-State: ACrzQf2FKWKA34whVXrZbDFE1n76CzUZewWMzQEEP8Eh/PAdXJmmq0+0
 +TVLZIoYm1W/bFEXWUaKnHviq5pSZAhYr1xvXyE=
X-Google-Smtp-Source: AMsMyM7Kn3a2kkeQDhYDzskoIbI1GXQKLH3OG7wHW/P84INfwc2ggNBpUqvYbE22zjcAmDVm4qPR8vERHn6YZZfgmuk=
X-Received: by 2002:a25:b098:0:b0:6ca:4484:486c with SMTP id
 f24-20020a25b098000000b006ca4484486cmr29796553ybj.209.1666795920492; Wed, 26
 Oct 2022 07:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 26 Oct 2022 10:51:48 -0400
Message-ID: <CAJSP0QW1wAhsYUV=WPhitKfC2LdAdGJnXoPGBAxPVPg0YZ4n6Q@mail.gmail.com>
Subject: Re: [PULL 00/30] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Oct 2022 at 12:51, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
> target-arm queue:
>  * Implement FEAT_E0PD
>  * Implement FEAT_HAFDBS

A second CI failure:

arm-linux-gnueabi-gcc -Ilibqemu-aarch64-softmmu.fa.p -I. -I..
-Itarget/arm -I../target/arm -Iqapi -Itrace -Iui -Iui/shader
-I/usr/include/pixman-1 -I/usr/include/capstone
-I/usr/include/spice-server -I/usr/include/spice-1
-I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabi/glib-2.0/include
-fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g
-isystem /builds/qemu-project/qemu/linux-headers -isystem
linux-headers -iquote . -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/arm -pthread -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
-isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
'-DCONFIG_TARGET=3D"aarch64-softmmu-config-target.h"'
'-DCONFIG_DEVICES=3D"aarch64-softmmu-config-devices.h"' -MD -MQ
libqemu-aarch64-softmmu.fa.p/target_arm_ptw.c.o -MF
libqemu-aarch64-softmmu.fa.p/target_arm_ptw.c.o.d -o
libqemu-aarch64-softmmu.fa.p/target_arm_ptw.c.o -c ../target/arm/ptw.c
../target/arm/ptw.c: In function =E2=80=98arm_casq_ptw=E2=80=99:
../target/arm/ptw.c:449:19: error: implicit declaration of function
=E2=80=98qemu_mutex_iothread_locked=E2=80=99; did you mean =E2=80=98qemu_mu=
tex_trylock=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
449 | bool locked =3D qemu_mutex_iothread_locked();
| ^~~~~~~~~~~~~~~~~~~~~~~~~~
| qemu_mutex_trylock
../target/arm/ptw.c:449:19: error: nested extern declaration of
=E2=80=98qemu_mutex_iothread_locked=E2=80=99 [-Werror=3Dnested-externs]
../target/arm/ptw.c:451:8: error: implicit declaration of function
=E2=80=98qemu_mutex_lock_iothread=E2=80=99; did you mean =E2=80=98qemu_mute=
x_lock__raw=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
451 | qemu_mutex_lock_iothread();
| ^~~~~~~~~~~~~~~~~~~~~~~~
| qemu_mutex_lock__raw
../target/arm/ptw.c:451:8: error: nested extern declaration of
=E2=80=98qemu_mutex_lock_iothread=E2=80=99 [-Werror=3Dnested-externs]
../target/arm/ptw.c:465:9: error: implicit declaration of function
=E2=80=98qemu_mutex_unlock_iothread=E2=80=99; did you mean =E2=80=98qemu_mu=
tex_unlock_impl=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
465 | qemu_mutex_unlock_iothread();
| ^~~~~~~~~~~~~~~~~~~~~~~~~~
| qemu_mutex_unlock_impl
../target/arm/ptw.c:465:9: error: nested extern declaration of
=E2=80=98qemu_mutex_unlock_iothread=E2=80=99 [-Werror=3Dnested-externs]

https://gitlab.com/qemu-project/qemu/-/jobs/3230968787

Stefan

