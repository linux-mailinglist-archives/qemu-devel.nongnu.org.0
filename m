Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D412EAE0F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 16:16:40 +0100 (CET)
Received: from localhost ([::1]:39628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwo4d-0004GP-QC
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 10:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwo2j-0003ag-Hs
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:14:41 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwo2e-0002yr-It
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:14:38 -0500
Received: by mail-wm1-x32a.google.com with SMTP id y23so3397218wmi.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 07:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n8wxZqed5AUobsiDm4bNOoFDW1b3eZQ5Z/U0Af9kF1Q=;
 b=vhQZ4xEvFF/QdTgURtUfaDZIcy/CGbanH4AQKwHpzEN885phAYA7UV72NzK/U921fO
 rbE88ZFUAPFbwKqQrnPUoNrwEMw2CQiRPI+5NkC9NXVMYAVtUakj+jk+5W/3d2Fe/Eyr
 6x/5oTu2zIUuUsaSTZI3AZoEiSidRWigwsTbUWaQafiU77u8OptcPKdyrKTw6sAbDyki
 jKQ5GfSPD24LWlXtx0Rf+WB7LHbxb55cWfhvzfZmySbL3qcncBIfwXctF/20saEaH3zD
 LlEFTuIG3hQ1ay4uskTaFOT+FrYM4tjP4EY2Pn+SciWsqR1iB1OI30+0YejoLxUA/5NX
 o3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n8wxZqed5AUobsiDm4bNOoFDW1b3eZQ5Z/U0Af9kF1Q=;
 b=SOmtvBBbBAZSI+y2qRJeWQrg3bsTuArxuKUPOtmR3bVLapHjTy1uz9rklNjOGf5dPb
 gM9CSwe+Kehw1yO5wLdIInAb8ysJW4J79mvMKxTPDSGiBu2UQDfc/MiFyAZrYWkdj9tv
 AA/ZRLNjBwv1O1hSl15T3jysICDikAdJ/8hhm1anUzPF6xMyJHolvkA/HjwMgX3SDOnW
 J0kKUySPIru1YdCD+M15Jx5dtG1eqOAs7FxDyMMpUFrbkiZv3KQh/eRsOomJNsCQAeRz
 DvWDVtBhgZpNZ43oYxT4QGfcXhHaspzPZAMDoVhp60ecIhAOuXoc+T3xpnV8S3rNLK2F
 Osfg==
X-Gm-Message-State: AOAM530ebDB5HoOA2/wzMAv50Gk3enwea1EaKuj1XJyGt0PFOCvrCxIr
 GPv+C0kukSWwq5P1kWM0hLI=
X-Google-Smtp-Source: ABdhPJyCRMkMvXYWYx189ADpbkkiaegbVrRrZ3fMa6ypxgkmI5/Kkbb11CH16X13JYDKLruhfUw5dg==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr3915889wmb.112.1609859674581; 
 Tue, 05 Jan 2021 07:14:34 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s133sm4508760wmf.38.2021.01.05.07.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 07:14:33 -0800 (PST)
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Emilio G. Cota" <cota@braap.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
 <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
 <790b031a-2be6-82d0-565d-f7595e95c077@amsat.org>
 <CAAdtpL53Ngj3zc0ZtxEvHed0hAxYN0RZ7G2eiL_izuTSWBMM2A@mail.gmail.com>
 <CAFEAcA-mTCyahsvVaD3PsOA4P8erDXmbLJCDtWaUFFoFiR4r=Q@mail.gmail.com>
 <47b22eb2-8600-b34f-371f-517804b9cb49@amsat.org>
 <07a865e0-d535-9a19-cf29-f90984bcd510@amsat.org>
 <CAFEAcA_S1yAdY7uRYygC4uTxLQpYf22zrcfr9-JkFfhOj1N44g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f8a0d65d-90e7-f036-544c-eb1cd46ff1f4@amsat.org>
Date: Tue, 5 Jan 2021 16:14:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_S1yAdY7uRYygC4uTxLQpYf22zrcfr9-JkFfhOj1N44g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 2:17 PM, Peter Maydell wrote:
> On Tue, 5 Jan 2021 at 09:36, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> 4/ libatomic on 32-bit hosts (i386, riscv32? arm?)
>>
>> While compiling succeed, linking fails:
>>
>> [850/2216] Linking target tests/test-hbitmap
>> FAILED: tests/test-hbitmap
>> clang  -o tests/test-hbitmap tests/test-hbitmap.p/test-hbitmap.c.o
>> tests/test-hbitmap.p/iothread.c.o -Wl,--as-needed -Wl,--no-undefined
>> -pie -Wl,--whole-archive libblock.fa libcrypto.fa libauthz.fa libqom.fa
>> libio.fa -Wl,--no-whole-archive -Wl,--warn-common -fsanitize=undefined
>> -fsanitize=address -Wl,-z,relro -Wl,-z,now -m32 -ggdb
>> -fstack-protector-strong -Wl,--start-group libqemuutil.a
>> subprojects/libvhost-user/libvhost-user-glib.a
>> subprojects/libvhost-user/libvhost-user.a libblock.fa libcrypto.fa
>> libauthz.fa libqom.fa libio.fa @block.syms -lgio-2.0 -lgobject-2.0
>> -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -pthread -lutil -lgnutls
>> -lm -lgthread-2.0 -lglib-2.0 /usr/lib/i386-linux-gnu/libglib-2.0.so
>> -liscsi -lgthread-2.0 -lglib-2.0 -laio -lcurl
>> /usr/lib/i386-linux-gnu/libz.so -lrbd -lrados -lnettle -lgnutls
>> -Wl,--end-group
>> libblock.fa(block_io.c.o): In function `stat64_max':
>> include/qemu/stats64.h:58: undefined reference to `__atomic_load_8'
>> include/qemu/stats64.h:60: undefined reference to
>> `__atomic_compare_exchange_8'
>> libblock.fa(block_qapi.c.o): In function `stat64_get':
>> include/qemu/stats64.h:40: undefined reference to `__atomic_load_8'
>> libqemuutil.a(util_qsp.c.o): In function `qatomic_set_u64':
>> include/qemu/atomic.h:478: undefined reference to `__atomic_store_8'
>> libqemuutil.a(util_qsp.c.o): In function `qatomic_read_u64':
>> include/qemu/atomic.h:468: undefined reference to `__atomic_load_8'
>> clang: error: linker command failed with exit code 1 (use -v to see
>> invocation)
> 
> Historically we have not linked against libatomic on purpose,
> on the theory that QEMU should not be trying to use atomic
> operations that the compiler cannot directly open-code as
> native atomic instructions. (This is because we want things
> to work even if the code in another thread that might also be
> doing atomic operations on the data is TCG.) libatomic might
> choose to use a mutex under the hood, if my understanding/memory
> is correct, which obviously TCG won't.
> 
> In particular this means that code that can run on 32-bit hosts
> is not supposed to be doing 64-bit atomic operations. For the
> code in stat64_max/stat64_get, this is guarded by CONFIG_ATOMIC64,
> which configure should only be setting if we can do 64-bit atomics
> without libatomic, so looking at whether that got set and if the
> test is doing the wrong thing would be my first suggestion.

That makes sense.

So on a Ubuntu 18.04 i386 host, "configure --cc=clang-10
--enable-sanitizers' sets atomic64=yes (__ATOMIC_RELAXED
is also defined).

The ./configure check is simple. There is a lot of ifdef'ry
to follow in "qemu/osdep.h" and "qemu/compiler.h" so it is
hard to figure out what changes "qemu/atomic.h" that it doesn't
match with ./configure.

Maybe a issue with the sanitizer code?

Cc'ing Stefan, Emilio & Marc-André too :)

