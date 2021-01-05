Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A17F2EABC4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 14:21:28 +0100 (CET)
Received: from localhost ([::1]:51580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwmH9-0006Zj-CQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 08:21:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwmDJ-0004iC-H3
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:17:29 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwmDH-0007Xt-92
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:17:29 -0500
Received: by mail-ed1-x532.google.com with SMTP id b2so31067101edm.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 05:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KJwNodaMPjeMVWslCrSKg8fJpdWRzNy+KYhdgc+pZZM=;
 b=Z5aqflqC6IMbVkYIIVlnADpY5tHL2EX11liZfztUhlY9kRYFUups9UNj4mdjx0ec+U
 J4kRQR/03TW108pUnR/3aSdu7/iDiB8dTe/yYB/U4+DQ/r+qcixfiGNvC2UUmFesiEIb
 K0MinPI4QT8pCbYof7y7iIjqzphCRssyuIQ9vo1VxUTX68kgVqJvWjpqosJce3Npz49M
 ETGzDWf6dQ65yZZAZGCUlVzddH660nHlyqxA/xBvLewRZ7KRBOJg8vVvpN4b5BV0yblk
 HfvWsuTbMdwcYNcOghQfUhRQPXrYDWM/FcXkv8EUud4nFMUy/SL7RMZ6XmJCYrfD/8bh
 OufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KJwNodaMPjeMVWslCrSKg8fJpdWRzNy+KYhdgc+pZZM=;
 b=cZykiukMZ4AuAEF3Q3aNlUdvALk955WauLhaE0wN2IefnMt/taB9w3GAO63FJUur8S
 xoEVJyAIJcjtfPOm5+XReC05lpzrDRwZQ5bOmb8Pf7CepqqRpHFgo6BObHi2AS//myic
 DsNuif7SxP0nsr26hJxGmYXLnobj58aAnUeIeNe0D49vUAiJVncKWWMItBleaR2ZOPri
 JOPpmeyHWfEJygw7VNkUzhZQLqCb5mKNOs6VyMyb8PzgxPOIxsw3Rfu07QSwZ08+vAVM
 RaeUoxDEasj3U6Fu+faBlRaiUaTaEjjpGi/9hdldPPeiMnN3ENmowaxbr7Ej5fftuKM/
 yyCQ==
X-Gm-Message-State: AOAM5319N+5qiDuksSmPWA9p/DUX6C3+iAV4KFkKVONzPz6btMWKOvSh
 MP9eI9QmFiYH1kescdPMMU2jk3851dOfolsjTAUPxA==
X-Google-Smtp-Source: ABdhPJwkxBFdB7HDSEcZSxnQE+ZgIxrsZ9VVHi8YYiPrfsTELjvdpNvckl3pjHPXQIrZu+sG3v9Sk9mib13ot8M9JoQ=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr23913502edr.251.1609852645250; 
 Tue, 05 Jan 2021 05:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
 <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
 <790b031a-2be6-82d0-565d-f7595e95c077@amsat.org>
 <CAAdtpL53Ngj3zc0ZtxEvHed0hAxYN0RZ7G2eiL_izuTSWBMM2A@mail.gmail.com>
 <CAFEAcA-mTCyahsvVaD3PsOA4P8erDXmbLJCDtWaUFFoFiR4r=Q@mail.gmail.com>
 <47b22eb2-8600-b34f-371f-517804b9cb49@amsat.org>
 <07a865e0-d535-9a19-cf29-f90984bcd510@amsat.org>
In-Reply-To: <07a865e0-d535-9a19-cf29-f90984bcd510@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jan 2021 13:17:14 +0000
Message-ID: <CAFEAcA_S1yAdY7uRYygC4uTxLQpYf22zrcfr9-JkFfhOj1N44g@mail.gmail.com>
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Jan 2021 at 09:36, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> 4/ libatomic on 32-bit hosts (i386, riscv32? arm?)
>
> While compiling succeed, linking fails:
>
> [850/2216] Linking target tests/test-hbitmap
> FAILED: tests/test-hbitmap
> clang  -o tests/test-hbitmap tests/test-hbitmap.p/test-hbitmap.c.o
> tests/test-hbitmap.p/iothread.c.o -Wl,--as-needed -Wl,--no-undefined
> -pie -Wl,--whole-archive libblock.fa libcrypto.fa libauthz.fa libqom.fa
> libio.fa -Wl,--no-whole-archive -Wl,--warn-common -fsanitize=3Dundefined
> -fsanitize=3Daddress -Wl,-z,relro -Wl,-z,now -m32 -ggdb
> -fstack-protector-strong -Wl,--start-group libqemuutil.a
> subprojects/libvhost-user/libvhost-user-glib.a
> subprojects/libvhost-user/libvhost-user.a libblock.fa libcrypto.fa
> libauthz.fa libqom.fa libio.fa @block.syms -lgio-2.0 -lgobject-2.0
> -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -pthread -lutil -lgnutls
> -lm -lgthread-2.0 -lglib-2.0 /usr/lib/i386-linux-gnu/libglib-2.0.so
> -liscsi -lgthread-2.0 -lglib-2.0 -laio -lcurl
> /usr/lib/i386-linux-gnu/libz.so -lrbd -lrados -lnettle -lgnutls
> -Wl,--end-group
> libblock.fa(block_io.c.o): In function `stat64_max':
> include/qemu/stats64.h:58: undefined reference to `__atomic_load_8'
> include/qemu/stats64.h:60: undefined reference to
> `__atomic_compare_exchange_8'
> libblock.fa(block_qapi.c.o): In function `stat64_get':
> include/qemu/stats64.h:40: undefined reference to `__atomic_load_8'
> libqemuutil.a(util_qsp.c.o): In function `qatomic_set_u64':
> include/qemu/atomic.h:478: undefined reference to `__atomic_store_8'
> libqemuutil.a(util_qsp.c.o): In function `qatomic_read_u64':
> include/qemu/atomic.h:468: undefined reference to `__atomic_load_8'
> clang: error: linker command failed with exit code 1 (use -v to see
> invocation)

Historically we have not linked against libatomic on purpose,
on the theory that QEMU should not be trying to use atomic
operations that the compiler cannot directly open-code as
native atomic instructions. (This is because we want things
to work even if the code in another thread that might also be
doing atomic operations on the data is TCG.) libatomic might
choose to use a mutex under the hood, if my understanding/memory
is correct, which obviously TCG won't.

In particular this means that code that can run on 32-bit hosts
is not supposed to be doing 64-bit atomic operations. For the
code in stat64_max/stat64_get, this is guarded by CONFIG_ATOMIC64,
which configure should only be setting if we can do 64-bit atomics
without libatomic, so looking at whether that got set and if the
test is doing the wrong thing would be my first suggestion.

thanks
-- PMM

