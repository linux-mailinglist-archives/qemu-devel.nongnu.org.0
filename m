Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE06B3C5F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:36:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa68-000869-Lg; Fri, 10 Mar 2023 05:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paa5y-0007yP-0P
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:35:31 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paa5u-0005Vw-95
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:35:29 -0500
Received: by mail-pg1-x532.google.com with SMTP id h31so2777537pgl.6
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/t2AkPVEumQueIu7TjgCAEWJq4tBNCmJzAusKZ7o2A=;
 b=Mp77f+TMm8CUzXM8Lljp6ejM+Drp1SoGdYHZ51kV6c9tg+E3+k4hcfcjmeVYz3/TDO
 lG2Y10O3jXzf6GLc+dyQ3noCQ79fgMtPvwhOknyp4wdjFP5oSlOMej0xTIZ7Antpy5dF
 spVB5OOal7mrE3YipC62EiQo0bTAV15UZA0AFK9Y5SBY9OsnHKMD1XS0CvIk7HgljBcg
 igJR45DFLVWjjVq5wItV7RE4ddRVVt5FceQBWkNvzutd4ngs8W0t48k4r7/VhKmU8+RT
 QwRw9s0kZEdLX4gEWtJZQEQxG+qImwFgKLDLPf2GoBURZbU5lzxrGcCri8Ab3FDcivlC
 Hxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/t2AkPVEumQueIu7TjgCAEWJq4tBNCmJzAusKZ7o2A=;
 b=34/0c5HK9kOzo3H14L3ec+RMi4CPlICB+mU+3J1NRFvF97J7ts3Kz9RTIcv+Al2iSx
 ugThGzNgqOTkEFcM+j5Px+ltasbHzULtlxZFkT53P/90V2rfogA3JuoGEOScfmG6aGqM
 alyKB/hpYFWagw8ysXPo0/GnRjPPFyLzSPXn4hD9a8ffuy4EO4peCy93ZXxzJBvbRb5+
 Qvyoka/Q083m6BBfvMIBBD+L6PJFpl97G9yw8IhL0KI7BfaVB4bhTAyqMe2CtE0qddol
 RqE27bu4eemqKeqlCwxnQScZZ4LYgLv5UbGkqTqHgJieM2tcLo+b5Xrn0+PacOSmwXVQ
 jI1w==
X-Gm-Message-State: AO0yUKWT/4qvpyCFZdxOavKaPbX5ZQ9BpXJi6Lv62Kx+0RnMNsVgHN1p
 Cnqjkw95GrjUm0Krqcethg1FPRS7/D7fez9aiX+RpLTO4TApbo79
X-Google-Smtp-Source: AK7set85E5cwrb0WBntfmtAKamfimrXjcwV/56NLPvbNnWMBLrbyyvwtJdRGTxSTo6wsBUznq+TNrCFqNrUhaBJ1oJo=
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr8776774pgb.9.1678444523285; Fri, 10
 Mar 2023 02:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20230308132857.161793-1-laurent@vivier.eu>
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 10:35:11 +0000
Message-ID: <CAFEAcA-FKZ2DCTXmi6TaqXKaU1r2SUXLGXt5-QrG0rpMsd-z+g@mail.gmail.com>
Subject: Re: [PULL 00/28] Linux user for 8.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 8 Mar 2023 at 13:29, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 817fd33836e73812df2f1907612b57750fcb94=
91:
>
>   Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/q=
emu into staging (2023-03-06 14:06:06 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-8.0-pull=
-request
>
> for you to fetch changes up to 6d0df648e2671ddb354eb3c545780b64472770f4:
>
>   linux-user: fix bug about incorrect base addresss of gdt on i386 and x8=
6_64 (2023-03-07 19:43:28 +0100)
>
> ----------------------------------------------------------------
> Pull request linux-user 20230308
>
> Fix gdt on i386/x86_64
> Handle traps on sparc
> Add translation for argument of msync
> Emulate CLONE_PIDFD flag in clone
> handle netlink flag NLA_F_NESTED
> fix sockaddr_in6 endianness
> Fix brk() to release pages
> fill out task state in /proc/self/stat
> add support for xtensa FDPIC
> Fix unaligned memory access in prlimit64 syscall
> add target to host netlink conversions
> fix timerfd read endianness conversion
> Fix access to /proc/self/exe
> Add strace for prlimit64() syscall

Compile failure on one of our CI jobs:
https://gitlab.com/qemu-project/qemu/-/jobs/3907923577

../linux-user/strace.c:1119:18: error: =E2=80=98CLONE_PIDFD=E2=80=99 undecl=
ared here
(not in a function); did you mean =E2=80=98CLONE_FILES=E2=80=99?
FLAG_GENERIC(CLONE_PIDFD),
             ^~~~~~~~~~~
../linux-user/strace.c:53:30: note: in definition of macro =E2=80=98FLAG_GE=
NERIC=E2=80=99
#define FLAG_GENERIC(name) { name, #name }
                             ^~~~

-- PMM

