Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22AD3BA9E3
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 19:46:55 +0200 (CEST)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzjjC-0004jU-8D
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 13:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzji7-00042r-VX
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 13:45:48 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzji4-00079S-5k
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 13:45:47 -0400
Received: by mail-ej1-x633.google.com with SMTP id gn32so21913615ejc.2
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 10:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=222Tafy6baRTNx86pMHJkTuPazSpRwNpCuqWe5vt5bg=;
 b=sRUIZlpDocrETyUG6QGXExlYv7gnceA+oEkw8CdlNQPMCZz1iC1W4EtF/+0WF74m1D
 1ccYadK2/3CSKZhBEBBnt/rFc5CkXeTkdcic5maC1W25xnBwIgSGAngT+at00HAnsnPf
 lT1xhJ1KC0Q3YYD0c5IlJ9DwHlXhLTqBLotEF8oS5n60Jk6PrI5UsQr77R9I7eAZSlk7
 HchUm0mI38yCPJwznpqCP+DAk0ALSLVhTk/m5Gi+eknlUDY9XocHbgWNusTzGwA1pFQN
 5P5DByo5QwjpJCxgnJGy8sMzWK7Q306vKhQzqPmxpY7Bh9vF7tDlYhYANA/s+27TJC8z
 uF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=222Tafy6baRTNx86pMHJkTuPazSpRwNpCuqWe5vt5bg=;
 b=QmDgX2WjTZBTnvXknOtcgmrS6QabpurObZN5pFvMxDeDvztQCa6m0nqh9Owq6k+buA
 uJLRjh8jq7034xQ2SNf6k72bGWX1PF2zil7khZEtQmccOxpDaJeQSCFl1rqSGsgNUsj0
 PcgYCCzRrpEArpCcbtxYPB8jhFwsyFGsoGQV/R34D780duedZJjHb9M9jvCjfa5AaDyR
 GdGAODpwLiY7NGgwRDhueD6BXRCwVSgCHBXKrNSHOI8L1l/gE4pLEWY4NZ1i/p3VbUrT
 xVc3MvRgbou08HY9u/tpLeeWsgzBOL1ajVuzpSgGNG/ixFhXTliybEGwT6bgV799/1qg
 4CaA==
X-Gm-Message-State: AOAM530gnQst4HTlvYCf6zYx8zewTpalZPmXDtX/AdA4rEMOH5G6BXvs
 tJlzsQSPSKBWK66O38GO64aoOa10Oa3aaA3cBkaEGw==
X-Google-Smtp-Source: ABdhPJzIe9JULa0GB7GzljL42sIhZM2McsHTbIxS1ILqxBXj5r3aHKhpoWp9q7NSPBuGKDmdMZ0r7fZdzWyzfyQFwWw=
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr5430702ejc.382.1625334341072; 
 Sat, 03 Jul 2021 10:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <abc8f7fe-2afe-0f5d-d391-6277db6e6f42@redhat.com>
In-Reply-To: <abc8f7fe-2afe-0f5d-d391-6277db6e6f42@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 3 Jul 2021 18:45:03 +0100
Message-ID: <CAFEAcA_jRNB=b2FS+9yrYX6r5YcnT0n9ooDH5Bnskzn9PwSKhw@mail.gmail.com>
Subject: Re: clang build error on i686
To: Cole Robinson <crobinso@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 3 Jul 2021 at 15:37, Cole Robinson <crobinso@redhat.com> wrote:
>
> Hi, I'm hitting build errors with clang on i686 userspace on x86_64
> kernel. Affects both qemu 6.0.0 and qemu.git, tested with fedora
> clang-12.0.1~rc3-1.fc35.i686.
>
> Full build log from the 6.0.0 build:
> https://gist.githubusercontent.com/crobinso/7b1206044eac7326490b2adce829e861/raw/9dddef968051fd6383ba7adb9e595081ad4f8fa4/gistfile1.txt
>
> Lots of errors like:
>
> /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
> function `helper_atomic_cmpxchgq_le_mmu':
> /builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:86:
> undefined reference to `__atomic_compare_exchange_8'
> /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
> function `helper_atomic_xchgq_le_mmu':
> /builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:134:
> undefined reference to `__atomic_exchange_8'
>
> Also warnings like:
>
> /builddir/build/BUILD/qemu-6.0.0/include/qemu/stats64.h:58:21: warning:
> misaligned atomic operation may incur significant performance penalty;
> the expected alignment (8 bytes) exceeds the actual alignment (4 bytes)
> [-Watomic-alignment]
>     uint64_t orig = qatomic_read__nocheck(&s->value);
>                     ^
> /builddir/build/BUILD/qemu-6.0.0/include/qemu/atomic.h:129:5: note:
> expanded from macro 'qatomic_read__nocheck'
>     __atomic_load_n(ptr, __ATOMIC_RELAXED)

I think at least part of what is happening here is that this compiler/host
doesn't support native 64-bit atomics, but configure has selected
CONFIG_ATOMIC64 anyway. I've cc'd Paolo and Richard who 'git blame'
suggests have touched the configure test and the stats64.h code in the past.

(The compiler provides fallbacks in libatomic for the 64-bit atomics,
but we deliberately do not link against libatomic because we do not
want to use them.)

thanks
-- PMM

