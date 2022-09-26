Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FE05EAB32
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:34:25 +0200 (CEST)
Received: from localhost ([::1]:43696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocq7j-00018z-Q9
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocpsI-0000oF-KF
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:18:27 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocpsF-0003nm-0n
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:18:25 -0400
Received: by mail-ej1-x62a.google.com with SMTP id rk17so1626647ejb.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=9AJQA7mWwz22PtirPnEVg3grxJXEJnpC25c2pUFl7aI=;
 b=KcYHCEpZwp0xn94iFllcDLYwJvCUxyJ2k/lH9eBvoNq2xeWz10M2gFnZu+qUiiaXoZ
 bmtTgRPSzn/lNwvaSM5SY6msLFgZfqhBEIfs6mRFizrh9UWNP1PlBRNTQdHolpCyhcGl
 xwBQwGmmlLlkkWliiCaBq8LVmr8sC3/CrfrtjtCjLTZMcHW8wY7JePjFsIlkorwq3HXr
 pLOZj2OpqZRQdf8rXGmEkHqLzItEQ/mYktI0bkIlkoHZMeGCW2pgT527LOb8T7cFXmyt
 FPWs09Zng6RgKBzbxUtLh694P8KPa8A6St0Lph2+M94Ufw3Cc/CBeuZcHU8BX6SSQb4B
 iF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9AJQA7mWwz22PtirPnEVg3grxJXEJnpC25c2pUFl7aI=;
 b=lKTbru2+m7xhiJHf5dYjVL4MWNeQeXL0bFsJjIbPHaf4UVN8V4uXkpzrDBPFSt17se
 mVBi72wJDjURtnbXN7gmCryytyZ1UZ5sAiJXN9g1Em8Z0HU+cO8lD2yIf6+KR8O+lMIN
 b+UL6pTz/HKeTIgMbQIOkv2zcdlb/o5AtvteY84nEHsXp7lhowWKzHOxWg08I8RoH2oN
 eT/7DTa8FhmQT+8P0JX0Y5I4ncBSkxjVlHYdH1A9tgznUudNfzQii9iN83cpzMJblCKi
 EP6OKL5ugtTS/esAUQMK3JWcUiZwYngJbU111WSV8IkWdCaohPQPvNWqoiyU79hWn6n9
 W6OQ==
X-Gm-Message-State: ACrzQf21jOHuanHKflLg5SQn6Ax7Musz7Saqs3zQ70ECv6AY0+4ZWhZV
 rzc0XZLrtmfm6FcUnt8hE6D54nq+5N2EAOst0+3s8g==
X-Google-Smtp-Source: AMsMyM7WlsHkQoIiqJ6N9guZsFR2xPImZM0TYSeymk4JDQx2ewQxsTMvc4z8cu5jB5HbhWLI9geUa1FQAeyKiSHZiYA=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr17941073ejc.504.1664205498790; Mon, 26
 Sep 2022 08:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-6-alex.bennee@linaro.org>
 <CAFEAcA_u8TQW5EoX5bBZGKhhaS6PYaYZGyqMrhB1Tsa6eTXCyQ@mail.gmail.com>
 <87leq641id.fsf@linaro.org>
In-Reply-To: <87leq641id.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 16:18:07 +0100
Message-ID: <CAFEAcA8D_SzU35DB-RvaegYkwkJHD0Y3stx7P=Jh=QC6LOqDZA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 26 Sept 2022 at 16:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >> -static inline int gic_get_current_cpu(GICState *s)
> >> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
> >>  {
> >> -    if (!qtest_enabled() && s->num_cpu > 1) {
> >> -        return current_cpu->cpu_index;
> >> -    }
> >> -    return 0;
> >> +    /*
> >> +     * Something other than a CPU accessing the GIC would be a bug as
> >> +     * would a CPU index higher than the GICState expects to be
> >> +     * handling
> >> +     */
> >> +    g_assert(attrs.requester_type =3D=3D MEMTXATTRS_CPU);
> >> +    g_assert(attrs.requester_id < s->num_cpu);
> >
> > Would it be a QEMU bug, or a guest code bug ? If it's possible
> > for the guest to mis-program a DMA controller to do a read that
> > goes through this function, we shouldn't assert. (Whether that
> > can happen will depend on how the board/SoC code puts together
> > the MemoryRegion hierarchy, I think.)
>
> Most likely a QEMU bug - how would a DMA master even access the GIC?

If it's mapped into the system address space, the same way
as it does any memory access. For instance on the virt board
we just map the distributor MemoryRegion straight into the
system address space, and any DMA master can talk to it.
This is of course not how the hardware really works (where
the GIC is part of the CPU itself), but, as noted in previous
threads, up-ending the MemoryRegion handling in order to be
able to put the GIC only in the address space(s) that the CPU
sees would be a lot of work, which is why we didn't try to
solve the "how do you figure out which CPU is writing to the
GIC" problem that way.

thanks
-- PMM

