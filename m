Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FCA3C3E8E
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 19:52:16 +0200 (CEST)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2dcl-0006OE-E4
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 13:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2dbx-0005j6-AR
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:51:25 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:44821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2dbv-00084N-OS
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:51:25 -0400
Received: by mail-ed1-x52b.google.com with SMTP id l1so1757640edr.11
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=85Tyf47oMTF6NYZBPZJvFo8SO6euSQuGzhLSoGuC9i8=;
 b=CD0OVY+rx7ou3Yd8JBW/Tb2wy/AU5au1JqbJ7Cae4c2DhiUe8m/4iGNct9VWImv/LP
 AgVjgzzwDHDCaMLbohiUfJDvm56QZyB0yxKbSFH8lzqxUVeQQgYvjTyjTexobSexaFkj
 3FqNvTslb3EfBB+gCbLoVXq6Lt95asaVEDxXEtNBFx/4xNnZStGEW24xwY8QsTDO+tJr
 Zux7s99yP/jn3jBHmfacbsG10QED+Ulg/4Nqhv4245oxL6EKTepJCnIrQoHjVjJuekzQ
 xcQbyuk5sTUG9j/4aeNA6JItt4CxA5X6jno+SHSdoSzop8P9/SGrd0MMMt1p4Nx1OnVq
 EI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=85Tyf47oMTF6NYZBPZJvFo8SO6euSQuGzhLSoGuC9i8=;
 b=ghD11RatQwiIstOV64BZ2eXEEoTmQt60NBrOFZx1pzcRXlbi/O3Pr8Bpnq3FEMR88r
 jQQNylqMuECVnjTZVwzyZEChQ2og8n6MWMU4+J6n5AsPfK3wuJJCsfIDIc1KJOZ3w79T
 N41SudIMaYMMJDuggqjJnDt8E6IZuzj8QJNzFWlvq8g0Zlr7hvtlmr0RtGMK80IcLvHB
 uZAHazrFfsCygQcnlbG22o0gj3c3ha8CjtrQlfPGy5G5uD9K7E/8rYczxL3q5Om7+ZBS
 QkRR0KRkgcMsx+22gugEnzpDtfYJdIbQB9nqFV9gxUi9ru5EyxYc2/BimerurW6Y8YzJ
 NT3g==
X-Gm-Message-State: AOAM533pCVVc7JiVPTTKaxgn0a2pVaEeE+yp8EPXMXYKvDKV7ubaJnwW
 VSFV8pT4XcDFgiR0Otdow7I79ZhpsN+0ozVat4fx0Q==
X-Google-Smtp-Source: ABdhPJy8wAjia0uiun8FW339Ui/ZrfUxDYA5M40Dplz0lb99qX0uzXDJ7tvn3+y7/DoOQ9/fgv/xahJbGq4cpaqhwwQ=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr58790366edt.100.1626025882307; 
 Sun, 11 Jul 2021 10:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <abc8f7fe-2afe-0f5d-d391-6277db6e6f42@redhat.com>
 <CAFEAcA_jRNB=b2FS+9yrYX6r5YcnT0n9ooDH5Bnskzn9PwSKhw@mail.gmail.com>
 <aa6e3eba-1cbd-1951-2811-36856b3a1816@linaro.org>
In-Reply-To: <aa6e3eba-1cbd-1951-2811-36856b3a1816@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Jul 2021 18:50:43 +0100
Message-ID: <CAFEAcA8NN3RKScgCgZ_E0fHich1vc-QJibsMzA3wbdVkMKLYMQ@mail.gmail.com>
Subject: Re: clang build error on i686
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 11 Jul 2021 at 16:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/3/21 10:45 AM, Peter Maydell wrote:
> > On Sat, 3 Jul 2021 at 15:37, Cole Robinson <crobinso@redhat.com> wrote:
> >>
> >> Hi, I'm hitting build errors with clang on i686 userspace on x86_64
> >> kernel. Affects both qemu 6.0.0 and qemu.git, tested with fedora
> >> clang-12.0.1~rc3-1.fc35.i686.
> >>
> >> Full build log from the 6.0.0 build:
> >> https://gist.githubusercontent.com/crobinso/7b1206044eac7326490b2adce829e861/raw/9dddef968051fd6383ba7adb9e595081ad4f8fa4/gistfile1.txt
> >>
> >> Lots of errors like:
> >>
> >> /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
> >> function `helper_atomic_cmpxchgq_le_mmu':
> >> /builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:86:
> >> undefined reference to `__atomic_compare_exchange_8'
> >> /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
> >> function `helper_atomic_xchgq_le_mmu':
> >> /builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:134:
> >> undefined reference to `__atomic_exchange_8'
> >>
> >> Also warnings like:
> >>
> >> /builddir/build/BUILD/qemu-6.0.0/include/qemu/stats64.h:58:21: warning:
> >> misaligned atomic operation may incur significant performance penalty;
> >> the expected alignment (8 bytes) exceeds the actual alignment (4 bytes)
> >> [-Watomic-alignment]
> >>      uint64_t orig = qatomic_read__nocheck(&s->value);
> >>                      ^
> >> /builddir/build/BUILD/qemu-6.0.0/include/qemu/atomic.h:129:5: note:
> >> expanded from macro 'qatomic_read__nocheck'
> >>      __atomic_load_n(ptr, __ATOMIC_RELAXED)
> >
> > I think at least part of what is happening here is that this compiler/host
> > doesn't support native 64-bit atomics, but configure has selected
> > CONFIG_ATOMIC64 anyway.
>
> Not true.  The host certainly supports it.
>
> This is a new alignment warning in clang-12 wrt the alignment of the atomic operation.
> Which may be complicated by the fact that the i386 abi does not normally align structures
> beyond 4 bytes.
>
> We may need to disable this warning for i386 (but not x86_64).

The first part of the problem isn't just a warning, though -- it's clang
actually emitting calls to libatomic.

-- PMM

