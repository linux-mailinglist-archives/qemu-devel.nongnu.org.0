Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE8D307D7C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:12:00 +0100 (CET)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Blv-0006Uo-UD
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5Bg8-0001x5-5s
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:06:02 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5Bg5-0008Td-I4
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:05:59 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c2so7658209edr.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 10:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Re1RwwGUNB5sg+yEG415P4GxdiDQT4tR/tMFlPyz+vE=;
 b=Y1mvluxVx6smKiNIA8DguWYEPvuHNmTuQ/61ZyeJH2wuucsfccF+9JI4aKKzzXQLki
 Im+/JgUYGrgapTljYUmpC1zXbDFW6tRfXFbzTZyHgB70AD1/CrEmCHiaQTPZBVa8pod9
 b96oc1YtU9YCcZeoTioSTKQ2VSPweuU9frytlZa70FcYEhXw/yxu9gQoHSwDXqs3vU8p
 /W+gOePp5YTx0d0EP6655RRNCOB2tvjUuOt7e/qp3qc5xX7DtQ9J+IuNEgC5kNTD8kT0
 RlYWZv6abf/H91G+9RzT7QhqWfJfLgb4thahG6/pCj3dT0/Q2Ox6bG1SVxq20byMwaSz
 vmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Re1RwwGUNB5sg+yEG415P4GxdiDQT4tR/tMFlPyz+vE=;
 b=NkX0mNr2+ePjUNkSBB7mHomLCaq5eWZUvhL7dWloEUhf8Cce8SCtalIvljnUDWFFlo
 m4aNgBS+RVV2e9S6WuNPrrDAJWjfTusBfZSiSrbaz8r65Y2xfzwgAMkPeX3SxnlSaEGc
 +mh8K1wtVhyzv1KlkOStdsBhRzwuACoWE/jCWVaYk+Hb0DgywCXbeZYuTHBYv38TD+T1
 oTuKBAJv/NPlVXGZ8UXH1OFOVNZRrtn7WtUBnkrnd4PAbXj5u0AaA5v6HYw64c8WBHz4
 gKd79uY41+jB2rQQH6urIUWg4x6g+PNOB4f17JywOKac6p2gFspgvy+3U2qURRRO+Mek
 r5Qw==
X-Gm-Message-State: AOAM530FcdGdZQVX3HEDjyl9lgVROl4uhtmErLGXufxvTqajozBkkhn4
 iMH5OUx57TazedQFbU3ZZkxGuHumlTruDhbEUjJudg==
X-Google-Smtp-Source: ABdhPJxgf0UpLoEfNPFcp6Uw5+EkWJ03Q6G3dfgQjyiuSmjORfaABwmFZCWKsKXWBI7vMyNzQ0RmzmCJCCGV5v9FSGw=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr908986edd.52.1611857152771; 
 Thu, 28 Jan 2021 10:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20210128161417.3726358-1-philmd@redhat.com>
 <20210128171811.jlnevikw4wgywjks@mozz.bu.edu>
 <82de6c97-d13b-01b9-e9ad-3b20f00adc5e@redhat.com>
In-Reply-To: <82de6c97-d13b-01b9-e9ad-3b20f00adc5e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 18:05:41 +0000
Message-ID: <CAFEAcA_PDyyH0yRiVWt27LoqhOq9MNysE7D7KWdsJN_8rV0VLg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gic: Allow to use QTest without crashing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Luc Michel <luc@lmichel.fr>,
 Darren Kenny <darren.kenny@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm <qemu-arm@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 17:46, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 1/28/21 6:18 PM, Alexander Bulekov wrote:
> > On 210128 1714, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Alexander reported an issue in gic_get_current_cpu() using the
> >> fuzzer. Yet another "deref current_cpu with QTest" bug, reproducible
> >> doing:
> >>
> >>   $ echo readb 0xf03ff000 | qemu-system-arm -M npcm750-evb,accel=3Dqte=
st -qtest stdio
> >>   [I 1611849440.651452] OPENED
> >>   [R +0.242498] readb 0xf03ff000
> >>   hw/intc/arm_gic.c:63:29: runtime error: member access within null po=
inter of type 'CPUState' (aka 'struct CPUState')
> >>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/intc/arm_=
gic.c:63:29 in
> >>   AddressSanitizer:DEADLYSIGNAL
> >>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>   =3D=3D3719691=3D=3DERROR: AddressSanitizer: SEGV on unknown address =
0x0000000082a0 (pc 0x5618790ac882 bp 0x7ffca946f4f0 sp 0x7ffca946f4a0 T0)
> >>   =3D=3D3719691=3D=3DThe signal is caused by a READ memory access.
> >>       #0 0x5618790ac882 in gic_get_current_cpu hw/intc/arm_gic.c:63:29
> >>       #1 0x5618790a8901 in gic_dist_readb hw/intc/arm_gic.c:955:11
> >>       #2 0x5618790a7489 in gic_dist_read hw/intc/arm_gic.c:1158:17
> >>       #3 0x56187adc573b in memory_region_read_with_attrs_accessor soft=
mmu/memory.c:464:9
> >>       #4 0x56187ad7903a in access_with_adjusted_size softmmu/memory.c:=
552:18
> >>       #5 0x56187ad766d6 in memory_region_dispatch_read1 softmmu/memory=
.c:1426:16
> >>       #6 0x56187ad758a8 in memory_region_dispatch_read softmmu/memory.=
c:1449:9
> >>       #7 0x56187b09e84c in flatview_read_continue softmmu/physmem.c:28=
22:23
> >>       #8 0x56187b0a0115 in flatview_read softmmu/physmem.c:2862:12
> >>       #9 0x56187b09fc9e in address_space_read_full softmmu/physmem.c:2=
875:18
> >>       #10 0x56187aa88633 in address_space_read include/exec/memory.h:2=
489:18
> >>       #11 0x56187aa88633 in qtest_process_command softmmu/qtest.c:558:=
13
> >>       #12 0x56187aa81881 in qtest_process_inbuf softmmu/qtest.c:797:9
> >>       #13 0x56187aa80e02 in qtest_read softmmu/qtest.c:809:5
> >>
> >> current_cpu is NULL because QTest accelerator does not use CPU.
> >>
> >> Fix by skipping the check and returning the first CPU index when
> >> QTest accelerator is used, similarly to commit c781a2cc423
> >> ("hw/i386/vmport: Allow QTest use without crashing").
> >>
> >> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> >
> > Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> >
> > For reference, some older threads about similar issues in the GDB stub
> > and monitor:
> > https://bugs.launchpad.net/qemu/+bug/1602247
>
> This one is different. I thought this issue was fixed by
> the series around commit 7cf48f6752e ("gdbstub: add multiprocess
> support to (f|s)ThreadInfo and ThreadExtraInfo").
>
> When using physical addresses with gdbstub, we should be able to
> select a particular address space.

Yes, but the problem with the GIC device is that it does not
use AddressSpaces to identify which CPU is accessing it.
We would either need to make it do that, or else add
support for using the MemTxAttrs requester_id to identify
which CPU is making a memory access and get the GIC to use
that instead. (This is more or less how the h/w does it.)

> Maybe this fixes pmemsave accessing MMIO here:
> https://bugs.launchpad.net/qemu/+bug/1751674

Nope, because the monitor pmemsave command goes via
cpu_physical_memory_rw(), which does an access to
address_space_memory. So unlike the gdbstub it's not
even trying to say which CPU it cares about. (The monitor
does have a "current CPU" concept, via mon_get_cpu(). But
it's not used in the pmemsave codepath.)

gdbstub direct-physical-memory-access is also via
cpu_physical_memory_rw(), incidentally.

thanks
-- PMM

