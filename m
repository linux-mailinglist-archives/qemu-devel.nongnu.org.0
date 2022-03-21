Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77144E31EC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:38:03 +0100 (CET)
Received: from localhost ([::1]:34534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOmw-0003mZ-RO
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:38:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWOky-0008QS-Nn
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:36:00 -0400
Received: from [2607:f8b0:4864:20::b32] (port=43711
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWOku-0007FF-GM
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:36:00 -0400
Received: by mail-yb1-xb32.google.com with SMTP id v35so30167780ybi.10
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hfmllXyMo0LrF7L8k37BzIKyUioiY04wybsRuxIuAxc=;
 b=aRyRR0M3Zm+4FlJATDUPG4FKldjGLbmHmXOKm3D5OOZhu1rpkWPS+qJ+IAuPdsmrG2
 KHyuB70N8FkiqWXl/FJHwFugZPnyKk1aV1A02jt3j1Vt8JJHUI8jzBi3rwRV75Kgial2
 fDe7vYgXCf4VDRy/VRIkbn02+4Q2QDIM09pppvVpwDrhXsfuatCdIx4ueX5VE1vOS/Ml
 Mw6MEdkeeLqGbTDY2gNnN4ZcOiXhARTg+UqhUYvzDRejv7R+nJYmKzymqCpC6TiI1bMM
 CPjp/WPx1VLpWYdmmbz3P5R1mgQ7taaf+ahvJYeneG7hDNZpdPjjH+eHGrrg7N1MHYpy
 qdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hfmllXyMo0LrF7L8k37BzIKyUioiY04wybsRuxIuAxc=;
 b=bPY0v/STf2eKXgHio97TPBikQInJ1V5c5FEdF0hMovlGESUrvXpxNF0QRlDfyAFz4a
 LqQKqlDOYqW7+KR6sezrZnJ8Amw7izESw5H6q1IOORX3AynDbRV94ipawIFDbOTArjZ0
 XCrU0E2BcLpax6udZtjIFhoiECziIBHIX3oQ5uKXLgzM/hpKhLIrevEBqPUrgyqU2s1+
 vEiXo6zTnoHQtwCozgXr7TlXCTL9JjYadtZc3xxlTnsApsSFLaBHTjEximyVRIVGmxUM
 BhZvABEyDlVgudcqD7d7liQFqHkjjTewj2f/vPRkkTClIyOYGfyKZ0hG9IFXGDnB+zpx
 2GTQ==
X-Gm-Message-State: AOAM532PkYv7rlE3vBYGD/eNrz8ZvG2YfHlwKs8vq2SYQUvLsyX680Tr
 vcGDexU5KUy7v+gmAx9Cj9jhjDgBlqYBFASKfxoTnA==
X-Google-Smtp-Source: ABdhPJworv9iMfZYLqDVHa+5uMsPGzpkDQ+BGNTxLGMUFziLIsV/ynh5sNTFmsoTi8a242lx1Th2stPY3m+T1XOo8gQ=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr23832368ybq.479.1647894954830; Mon, 21
 Mar 2022 13:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <89a014e0-8850-e628-dea5-76999513a18e@gmail.com>
 <067ebb15-593b-4b9e-26d6-a4d98db4fd5c@kaod.org>
In-Reply-To: <067ebb15-593b-4b9e-26d6-a4d98db4fd5c@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Mar 2022 20:35:42 +0000
Message-ID: <CAFEAcA-hQt7fGU7Lm=N+jkXunsekJy15s=xVWBBnoEuDDM30yg@mail.gmail.com>
Subject: Re: Memory leak in via_isa_realize()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 at 18:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> I introduced quite a few of these calls,
>
>    hw/ppc/pnv_lpc.c:    irqs =3D qemu_allocate_irqs(handler, lpc, ISA_NUM=
_IRQS);
>    hw/ppc/pnv_psi.c:    psi->qirqs =3D qemu_allocate_irqs(ics_set_irq, ic=
s, ics->nr_irqs);
>    hw/ppc/pnv_psi.c:    psi->qirqs =3D qemu_allocate_irqs(xive_source_set=
_irq, xsrc, xsrc->nr_irqs);
>    hw/ppc/ppc.c:    env->irq_inputs =3D (void **)qemu_allocate_irqs(&ppc6=
xx_set_irq, cpu,
>    hw/ppc/ppc.c:    env->irq_inputs =3D (void **)qemu_allocate_irqs(&ppc9=
70_set_irq, cpu,
>    hw/ppc/ppc.c:    env->irq_inputs =3D (void **)qemu_allocate_irqs(&powe=
r7_set_irq, cpu,
>    hw/ppc/ppc.c:    env->irq_inputs =3D (void **)qemu_allocate_irqs(&powe=
r9_set_irq, cpu,
>    hw/ppc/ppc.c:    env->irq_inputs =3D (void **)qemu_allocate_irqs(&ppc4=
0x_set_irq,
>    hw/ppc/ppc.c:    env->irq_inputs =3D (void **)qemu_allocate_irqs(&ppce=
500_set_irq,
>    hw/ppc/spapr_irq.c:    spapr->qirqs =3D qemu_allocate_irqs(spapr_set_i=
rq, spapr,
>
> and may be I can remove some. What's the best practice ?

The 'best practice' is that if you have an irq line it should be
because it is the input (gpio or sysbus irq) or output (gpio) of
some device, ie something that is a subtype of TYPE_DEVICE.

For the ones in hw/ppc/ppc.c: we used to need to write code like that
because CPU objects weren't TYPE_DEVICE; now they are, and so you
can give them inbound gpio lines using qdev_init_gpio_in(), typically
in the cpu initfn. (See target/riscv for an example, or grep for
that function name in target/ for others.) Then the board code
needs to wire up to those IRQs in the usual way for GPIO lines,
ie using qdev_get_gpio_in(cpudev, ...), instead of directly
reaching into the CPU struct env->irq_inputs. (There's probably
a way to structure this change to avoid having to change the CPU
and all the board code at once, but I haven't thought it through.)

For the spapr one: this is in machine model code, and currently machines
aren't subtypes of TYPE_DEVICE. I'd leave this one alone for now;
we can come back and think about it later.

For pnv_psi.c: these appear to be because the PnvPsi device is
allocating irq lines which really should belong to the ICSState
object (and as a result the ICSState code is having to expose
ics->nr_irqs and the ics_set_irq function when they could be
internal to the ICSState code). The ICSState's init function
should be creating these as qdev gpio lines.

pnv_lpc.c seems to be ISA related. hw/isa/lpc_ich9.c is an
example of setting up IRQs for isa_bus_irqs() without using
qemu_allocate_irqs(), but there may be some more generalised
ISA cleanup possible here.

thanks
-- PMM

