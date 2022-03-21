Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B64E2518
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 12:15:53 +0100 (CET)
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWG0u-0001d6-1J
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 07:15:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWFxg-0000oq-Nr
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:12:32 -0400
Received: from [2607:f8b0:4864:20::1132] (port=42103
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWFxf-0003OY-2h
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:12:32 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e612af95e3so39391507b3.9
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 04:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L/+iLVf04UcPMPazh9HAFp7deMGx+P1IUgGSi0uh/08=;
 b=BaaCr6lsTPjtOv99BlmOfkUlKNckPoC2/F6pwBt239ifbE+9cbFbkXwbzqb3CziMPY
 Zf14rEdpVX4sdcFCAm71sk1hO4SFMHM34kuU/NsNLKzZVgv4Lni5rJjkHz818y6pfwE0
 DOQ5KZj8wbSyPAcrHkIdlkj+HZlC+UvZTcOkvj7kfEZZX6BJIamuPCcZnnuZVn/BMwbW
 eAES8SV1kmFHMQkoyPHFlOJooD3CwbrsPS21pi1niRRy+9dBvT38Mc+NCz1CRRpOLNGy
 0ePwnp6wR3Ak6qb/QV4YWvXUSNfzVJZMZfDoqZNs/GbAb6oymZC/N4ww+Lph1ioN8h6j
 dW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/+iLVf04UcPMPazh9HAFp7deMGx+P1IUgGSi0uh/08=;
 b=HDMk2iOgXDdC8hTkBbBUKOHvW4KfN9yZVaZQsdD/+v1pS9ZL2HTPzX8f5Fmb+ygDXI
 W4nMQZxwTYyKURJKMBKeLjBHujc59goz+i3ppzR57MtDKnaH7Tf2bCVt0e9va8S/oQYw
 FuasqSkfKQjiqaxK79f2TFEjHfXPGaHO6NV/GiZFAHmIhtYAZ2RkZpf7QQR1OyPh3Ocx
 FEXt3zPrBrUksasDTuYaz+NXxCszyWaS4Cl4T9+bSfBqGnVKwXBzA1XK1RImsFOsjwjz
 2Ni/FIxavIAujsCJwQ/OZ0RyC7WLr3LkQZ0NTjae5TdMVfongYATk4LZV53cummBuyH9
 s5CQ==
X-Gm-Message-State: AOAM530wfeVdvFKBdXBWFTJb7NKHn2kP8naERx46QELraarplcT9wD4a
 x1y5LedQjfFZ8lhgS6+op2RNtDsCcCOCNIGJrRYWPw==
X-Google-Smtp-Source: ABdhPJwRmjBLP6CAltDYxfhG3TAPNKewUiP2vc+4Ldwz3RJRHhNic0EUburkomVaNxQF4ul2jBoXXL24btHdXhwf4pY=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr22599802ywh.329.1647861149520; Mon, 21
 Mar 2022 04:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
In-Reply-To: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Mar 2022 11:12:16 +0000
Message-ID: <CAFEAcA-jEqnpUdtfgqMFUn_ghwoYM+8UyceLUz+Uo07FuH+S-Q@mail.gmail.com>
Subject: Re: Memory leak in via_isa_realize()
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 at 10:31, Thomas Huth <thuth@redhat.com> wrote:
> FYI, I'm seeing a memory leak in via_isa_realize() when building
> QEMU with sanitizers enabled or when running QEMU through valgrind:
> Same problem happens with qemu-system-ppc64 and the pegasos2 machine.
>
> No clue how to properly fix this... is it safe to free the pointer
> at the end of the function?

This is because the code is still using the old function
qemu_allocate_irqs(), which is almost always going to involve
it leaking memory. The fix is usually to rewrite the code to not use
that function at all, i.e. to manage its irq/gpio lines differently.
Probably the i8259 code should have a named GPIO output line
rather than wanting to be passed a qemu_irq in an init function,
and the via code should have an input GPIO line which it connects
up to the i8259. It looks from a quick glance like the i8259 and
its callers have perhaps not been completely QOMified.

In this specific case, though, it seems like the only thing that
the via_isa_request_i8259_irq() function does is pass the interrupt
signal through to its own s->cpu_intr, so I think a relatively
self-contained way to deal with the leak is to pass s->cpu_intr
into i8259_init() and drop the isa_irq allocated irq and its
associated helper function entirely. (There might be some subtlety
I'm missing that means that wouldn't work, of course.)

-- PMM

