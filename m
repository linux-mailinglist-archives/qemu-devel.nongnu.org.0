Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22FB30AD69
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:09:10 +0100 (CET)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6chJ-00012r-Rt
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6caG-0002LA-Du
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:01:52 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6caD-00010k-QF
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:01:52 -0500
Received: by mail-ed1-x529.google.com with SMTP id n6so19665940edt.10
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 09:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QAW7ifalcqXdWdfDVvXtuF1viTQdpBmOEoOU3hkH4ok=;
 b=zmGsj6mlj+M/GF0KK5CHF2rpuRKMViKSI1fhGq5796v0YQ358Cj4SPUkAox6qJfplu
 3LRzQkdIXoAelNJXT02emZZ2kilweBqfNnek6UCp47PFc5yl+SCWxuPQ3rjFeVzvskYB
 AUHBbQQQGPjHCcUZxgHTKabX45GEV8tnULHyjLnl0VryZm86DnxEl0BCiknWyUgbxVUt
 P0E6/UXW8vDulwWiFq4WFgq0CgNVXoyb3gwr/QA9wWBsQbAuAO4s35GtkPpLmuULVsh5
 SOrvg+5K7vSSuCQPPX+uJQOz45kmipRJvDr1u9OEmRRapmzI1mTpPnWRb6CRtgeZjtDR
 nwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QAW7ifalcqXdWdfDVvXtuF1viTQdpBmOEoOU3hkH4ok=;
 b=k1G3oxkF2Gx8TP45saidu2AFtQW5YNBRNmxgGlobMvJOHbUvvNtUKc8ur3otEszgbo
 IjXHfvaI0XFsZuvkB+to9DPctr4NIb1JE87OGzxF/UP/EcB3Sac2StJqILJOCR89QJ6v
 HnPZxXaV8wW6niIpCvRsnrz2skAwKux1bcB8utDEqgApXpB4Orrq2mqClXS33lo65fL8
 s41AL6Xcr//xnAqdaqzocwSh2ToixHDHYhHviKdJGXFN34vweoBnDd/2EAYjT9g6SNBv
 Q7bxo/q9SEmd1UtXyNicFLcd7AAOVlyTQC30C6P9+pP5vWg+4nyyUrUL7NqCeFbw0vQC
 Wozg==
X-Gm-Message-State: AOAM531gXh6kbScUO2U9KHmxw/YE/fV73Vb5fmh69RuaiRUFaUj1bheu
 T7TZJa66pFiUhVJDr6MLOfzBrWK683klk/70VKBVww==
X-Google-Smtp-Source: ABdhPJzEcJOe+tpxygBWKYCZYZsHQuqPMfilUCM2VqDecVoYA0RuTsxwKzuAr3ocUvK1NeVpPS+gm3AyNvqc2//Cn98=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr11777378edc.146.1612198907939; 
 Mon, 01 Feb 2021 09:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20210128161417.3726358-1-philmd@redhat.com>
In-Reply-To: <20210128161417.3726358-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 17:01:36 +0000
Message-ID: <CAFEAcA9bfmSOPZErogT=z0PURd21K6q2n_67=sAwK+Cdko40kg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gic: Allow to use QTest without crashing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 16:14, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Alexander reported an issue in gic_get_current_cpu() using the
> fuzzer. Yet another "deref current_cpu with QTest" bug, reproducible
> doing:
>
>   $ echo readb 0xf03ff000 | qemu-system-arm -M npcm750-evb,accel=3Dqtest =
-qtest stdio
>   [I 1611849440.651452] OPENED
>   [R +0.242498] readb 0xf03ff000
>   hw/intc/arm_gic.c:63:29: runtime error: member access within null point=
er of type 'CPUState' (aka 'struct CPUState')
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/intc/arm_gic=
.c:63:29 in
>   AddressSanitizer:DEADLYSIGNAL
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   =3D=3D3719691=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x0=
000000082a0 (pc 0x5618790ac882 bp 0x7ffca946f4f0 sp 0x7ffca946f4a0 T0)
>   =3D=3D3719691=3D=3DThe signal is caused by a READ memory access.
>       #0 0x5618790ac882 in gic_get_current_cpu hw/intc/arm_gic.c:63:29
>       #1 0x5618790a8901 in gic_dist_readb hw/intc/arm_gic.c:955:11
>       #2 0x5618790a7489 in gic_dist_read hw/intc/arm_gic.c:1158:17
>       #3 0x56187adc573b in memory_region_read_with_attrs_accessor softmmu=
/memory.c:464:9
>       #4 0x56187ad7903a in access_with_adjusted_size softmmu/memory.c:552=
:18
>       #5 0x56187ad766d6 in memory_region_dispatch_read1 softmmu/memory.c:=
1426:16
>       #6 0x56187ad758a8 in memory_region_dispatch_read softmmu/memory.c:1=
449:9
>       #7 0x56187b09e84c in flatview_read_continue softmmu/physmem.c:2822:=
23
>       #8 0x56187b0a0115 in flatview_read softmmu/physmem.c:2862:12
>       #9 0x56187b09fc9e in address_space_read_full softmmu/physmem.c:2875=
:18
>       #10 0x56187aa88633 in address_space_read include/exec/memory.h:2489=
:18
>       #11 0x56187aa88633 in qtest_process_command softmmu/qtest.c:558:13
>       #12 0x56187aa81881 in qtest_process_inbuf softmmu/qtest.c:797:9
>       #13 0x56187aa80e02 in qtest_read softmmu/qtest.c:809:5
>
> current_cpu is NULL because QTest accelerator does not use CPU.
>
> Fix by skipping the check and returning the first CPU index when
> QTest accelerator is used, similarly to commit c781a2cc423
> ("hw/i386/vmport: Allow QTest use without crashing").
>
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

