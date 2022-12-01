Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C4963F1D9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 14:39:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0jlj-0005d0-T2; Thu, 01 Dec 2022 08:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0jli-0005ck-D8
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 08:38:26 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0jlg-0000CW-Nn
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 08:38:26 -0500
Received: by mail-pj1-x102d.google.com with SMTP id cm20so1893246pjb.1
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 05:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A9Xl7JJt3cGvKQFaqzBe5CpXzKcVs7FNwu+S7egGOoE=;
 b=mA/v1bvDhLRKp7M1jS1wdT6ChjgcFzzB+FdSYRWNuoY/eMSKt91klemf0O/rNlQ7ts
 djeM5wzhVVles0Zk/t+sXth77xH5/zDklWcK8En1PQvW2t29VbG84fTghHNUZIQJVBz3
 JUyHHQlHQXSOo9GahUVTazregwL6U6DHILbvwJN+iPN8pc2cE88ZSbiYT7/8L1FfspV0
 pizoR8xL/Nm5nSFViIMqKCfgHMaaXsF8RBeuY+m/mXFXbCBAqHcrog/Hij11RF5wHpLZ
 9GDQtqbMElf+xD9bst89i3Tx2rX+T63a1hxIuUMFyw5nQm05rnJ2lml5jJBFWH6r4rot
 /zrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A9Xl7JJt3cGvKQFaqzBe5CpXzKcVs7FNwu+S7egGOoE=;
 b=3n+qc7BDpncL3TbQijjiWB/bcQEf0u93GXpEVnK+Ji2Les/ySbQlAQFHOgLPFGdm6k
 5qQJd15sLFzXMN3JQcsMxRYMksRUD3CrX+ThyFCQaAmjgh9I3uajkaRHqQStlYWbA7M+
 gksLx+cBpD8el1cjOUDXRZ57W3I2cPkoQ6L7vFY185irl9XTpk679FApaTvfx04PYxQe
 J1Ndj+WLW5cCqNTk+3unjEwfUw/bbZLy7KZBBtWuEVGjszlN06cbcB+xLNgde4ys75Mw
 WCA4F5OdTRIpD4YrJZ6dkGaYyW/JJFYOasu/QEqv5X8gcN1uBRCysmVQ3XpYnvxSNspQ
 YsOg==
X-Gm-Message-State: ANoB5pmFKzYbu0+vNpL0VwmLYrQezrRVQRSJ4COYW48quFwa6AUqW0rN
 avS0ZM0yvVe7cXyRr68Ky1Xxe1RtTMnv57RTYwzOkg==
X-Google-Smtp-Source: AA0mqf78MP1bQwjYIB5W2Vc8iHUf6YK9xicBObbTeLJY/ePMj+FsiJlunt0Anul3iwQuRABtzt912OzLbWhWealMbp8=
X-Received: by 2002:a17:90a:ce01:b0:219:58de:e1ce with SMTP id
 f1-20020a17090ace0100b0021958dee1cemr11437844pju.215.1669901902984; Thu, 01
 Dec 2022 05:38:22 -0800 (PST)
MIME-Version: 1.0
References: <CACKEeROyAvp+rjRZxExQ1kX_Fb_Yn1h-4DHpp7ryGKYJ0TcCAw@mail.gmail.com>
In-Reply-To: <CACKEeROyAvp+rjRZxExQ1kX_Fb_Yn1h-4DHpp7ryGKYJ0TcCAw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Dec 2022 13:38:11 +0000
Message-ID: <CAFEAcA9P2-v94p8H8+ktnf-Yf-rucbGySXE6AGPdwvDxXfP=ZA@mail.gmail.com>
Subject: Re: cortex-a55/a75/a76 MPIDR_EL1 specifica
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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

On Thu, 1 Dec 2022 at 10:55, Timofey Kutergin <tkutergin@gmail.com> wrote:
> After submitting a patch for cortex-a55 support and trying
> to run SMP on odroid-c4 I have found concern about mpidr_el1 register.
>
> cortex-a55 (and also a75/76/78) seem to be considered SMT CPUs
> with single SMT thread. As a result, they publish core numbers
> in AFF1 rather than in AFF0 and AFF0 is always zero. In the
> cortex-a55 TRM:
>
> Aff1, [11:8] Part of Affinity level 1. Third highest level affinity field.
>   CPUID. Identification number for each CPU in the Cortex-A55 cluster:
>   0x0 MP1: CPUID: 0. to
>   0x7 MP8: CPUID: 7.
> Aff0, [7:0]
>   Affinity level 0. The level identifies individual threads within a multi-threaded core. The
>   Cortex-A55 core is single-threaded, so this field has the value 0x00.
>
> Plus MT (bit 24) is set to 1.
>
> But it seems that qemu does not take it into account. Is this
> intentional? Does it make sense to change this behaviour to
> something closer to real CPU ?

I don't think it's intentional, it's just that when we wrote
the code to handle the MPIDR all the CPUs we emulated were
MT==0 and put their CPU number in the Aff0 field, so that's all
that the mpidr_read_val() function handles.

Of the CPUs we currently emulate, these ones set MT==1:
 * Cortex-A55
 * Cortex-A76
 * Neoverse-N1
(I don't know about the a64fx but would guess it is MT==0.)

Since we already have a couple of CPU models which we don't
get this right for, I don't think this needs to block the A55
support, but it would I think be nice to implement it correctly.
I guess I would do this via a bool ARMCPU::cpuid_in_aff1 similar to
the existing ARMCPU::mp_is_up, and making mpidr_read_val()
act appropriately. The awkward part is that this would mean
that across migration from an older QEMU version the guest
would see the MPIDR value change, which is probably bad.
So I guess we need a CPU property to suppress that and to
set that in the hw_compat_7_2 array (which will appear when
the 8.0 board types get added after 7.2 releases).

Did you see any guest-visible behaviour issues because of this
value being wrong ?

thanks
-- PMM

