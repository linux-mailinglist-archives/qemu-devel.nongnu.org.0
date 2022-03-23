Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4965A4E5B8D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 23:54:34 +0100 (CET)
Received: from localhost ([::1]:58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX9s8-0002v2-U9
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 18:54:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nX9r8-0002Ei-Q6; Wed, 23 Mar 2022 18:53:30 -0400
Received: from [2a00:1450:4864:20::632] (port=33627
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nX9r7-0006t8-2u; Wed, 23 Mar 2022 18:53:30 -0400
Received: by mail-ej1-x632.google.com with SMTP id pv16so5844097ejb.0;
 Wed, 23 Mar 2022 15:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=kwDcV/aaDREP7n8UpzMyhaBgd10MXyYr+I9Fbl5j6hI=;
 b=pOkjAm1oPzfrm43bAqoes9r/9K7DyTrezieX7ardfytZjK9U2jXbqlLHlLzDjm7ssq
 jmPDeTAziptcXm2ffL91+Mb4/5lf7HM0E7qr8CPkpVaLM0mik6quCayWqORXWC15F746
 e4on3FIBkeDoxLMHF/GGudyY7hinyXLnnmkFUcPM24kPOljwABTaICzlwOT28fvR4etB
 hFuQwZsImz3g/h8b6OCrKHSrDcejJtOCPH8yFuzMsL8lBVNTDk9W7H/josFLD6M+9EcU
 5jtyS7D4hvpIS2MxmDPfY8IWliN6EHW7tJpgEg1GVmCwl4Tbu0J7JiFjb6nyBqKb/Mhl
 UYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=kwDcV/aaDREP7n8UpzMyhaBgd10MXyYr+I9Fbl5j6hI=;
 b=7Jrn6L6ieWgqZ4afn9b5RdNRELWZ49HTJfbriovJK/kjh9niwTztukkW9MjdKem5rF
 lEOeYrAi+E73AuGZFlTaTOfJLvAVG6JryXuw6BhkXuofYcyG/jjGX0mkDaB80B6B4+Mc
 wMS03S+dnfwOs2ZkYaJngqb9rQTvfp8I7X04mf0N+u4KYkrN+BQKzwGekxE84h71v7Bk
 BQ2HSzYpKMaOomjLiulFbpsbUeE4ND8UPol25eXzAKLxzSCAzZwfWZeDIkZB8LMLp3sa
 eWpmq9Wgf6wBDIzCm3eutNreSHlDFStxvmQivkPZRCVxp4hH6DGgneRoi317G2DXq+KN
 1VJA==
X-Gm-Message-State: AOAM530W4one4axarEAAEXcRwVhNv53aU7OH1tLzHNRZnNtF+aGhJ9Zr
 LAoWoc2iNIGm5d33crA23gI=
X-Google-Smtp-Source: ABdhPJzWhQOzpHFFO/Us3bFXcJx21uEbTWNWlPZx7XHnfrpp/SSQr+U0j7WVUnc1upPlOh5l6p5rgg==
X-Received: by 2002:a17:907:8a09:b0:6df:f1c6:bfc4 with SMTP id
 sc9-20020a1709078a0900b006dff1c6bfc4mr2667728ejc.550.1648076006720; 
 Wed, 23 Mar 2022 15:53:26 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-006-205.77.11.pool.telefonica.de.
 [77.11.6.205]) by smtp.gmail.com with ESMTPSA id
 u3-20020a17090657c300b006d01de78926sm441307ejr.22.2022.03.23.15.53.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Mar 2022 15:53:26 -0700 (PDT)
Date: Wed, 23 Mar 2022 22:53:24 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: Memory leak in via_isa_realize()
In-Reply-To: <4bd52c83-a4c8-ead6-1210-a5e464c32196@ilande.co.uk>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <89a014e0-8850-e628-dea5-76999513a18e@gmail.com>
 <067ebb15-593b-4b9e-26d6-a4d98db4fd5c@kaod.org>
 <CAFEAcA-hQt7fGU7Lm=N+jkXunsekJy15s=xVWBBnoEuDDM30yg@mail.gmail.com>
 <4bd52c83-a4c8-ead6-1210-a5e464c32196@ilande.co.uk>
Message-ID: <32991126-8264-43B9-9707-E79DAAAF65D0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philippe.mathieu.daude@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22=2E M=C3=A4rz 2022 08:23:09 UTC schrieb Mark Cave-Ayland <mark=2Ecave-=
ayland@ilande=2Eco=2Euk>:
>On 21/03/2022 20:35, Peter Maydell wrote:
>
>> On Mon, 21 Mar 2022 at 18:55, C=C3=A9dric Le Goater <clg@kaod=2Eorg> wr=
ote:
>>> I introduced quite a few of these calls,
>>>
>>>     hw/ppc/pnv_lpc=2Ec:    irqs =3D qemu_allocate_irqs(handler, lpc, I=
SA_NUM_IRQS);
>>>     hw/ppc/pnv_psi=2Ec:    psi->qirqs =3D qemu_allocate_irqs(ics_set_i=
rq, ics, ics->nr_irqs);
>>>     hw/ppc/pnv_psi=2Ec:    psi->qirqs =3D qemu_allocate_irqs(xive_sour=
ce_set_irq, xsrc, xsrc->nr_irqs);
>>>     hw/ppc/ppc=2Ec:    env->irq_inputs =3D (void **)qemu_allocate_irqs=
(&ppc6xx_set_irq, cpu,
>>>     hw/ppc/ppc=2Ec:    env->irq_inputs =3D (void **)qemu_allocate_irqs=
(&ppc970_set_irq, cpu,
>>>     hw/ppc/ppc=2Ec:    env->irq_inputs =3D (void **)qemu_allocate_irqs=
(&power7_set_irq, cpu,
>>>     hw/ppc/ppc=2Ec:    env->irq_inputs =3D (void **)qemu_allocate_irqs=
(&power9_set_irq, cpu,
>>>     hw/ppc/ppc=2Ec:    env->irq_inputs =3D (void **)qemu_allocate_irqs=
(&ppc40x_set_irq,
>>>     hw/ppc/ppc=2Ec:    env->irq_inputs =3D (void **)qemu_allocate_irqs=
(&ppce500_set_irq,
>>>     hw/ppc/spapr_irq=2Ec:    spapr->qirqs =3D qemu_allocate_irqs(spapr=
_set_irq, spapr,
>>>
>>> and may be I can remove some=2E What's the best practice ?
>>=20
>> The 'best practice' is that if you have an irq line it should be
>> because it is the input (gpio or sysbus irq) or output (gpio) of
>> some device, ie something that is a subtype of TYPE_DEVICE=2E
>>=20
>> For the ones in hw/ppc/ppc=2Ec: we used to need to write code like that
>> because CPU objects weren't TYPE_DEVICE; now they are, and so you
>> can give them inbound gpio lines using qdev_init_gpio_in(), typically
>> in the cpu initfn=2E (See target/riscv for an example, or grep for
>> that function name in target/ for others=2E) Then the board code
>> needs to wire up to those IRQs in the usual way for GPIO lines,
>> ie using qdev_get_gpio_in(cpudev, =2E=2E=2E), instead of directly
>> reaching into the CPU struct env->irq_inputs=2E (There's probably
>> a way to structure this change to avoid having to change the CPU
>> and all the board code at once, but I haven't thought it through=2E)
>>=20
>> For the spapr one: this is in machine model code, and currently machine=
s
>> aren't subtypes of TYPE_DEVICE=2E I'd leave this one alone for now;
>> we can come back and think about it later=2E
>>=20
>> For pnv_psi=2Ec: these appear to be because the PnvPsi device is
>> allocating irq lines which really should belong to the ICSState
>> object (and as a result the ICSState code is having to expose
>> ics->nr_irqs and the ics_set_irq function when they could be
>> internal to the ICSState code)=2E The ICSState's init function
>> should be creating these as qdev gpio lines=2E
>>=20
>> pnv_lpc=2Ec seems to be ISA related=2E hw/isa/lpc_ich9=2Ec is an
>> example of setting up IRQs for isa_bus_irqs() without using
>> qemu_allocate_irqs(), but there may be some more generalised
>> ISA cleanup possible here=2E
>
>The issue with PPC IRQs also affects the OpenPIC implementation: when I l=
ast looked a=20
>while back I didn't see any obvious issues against using gpio IRQs, but t=
he main=20
>blocker for me was not being able to test all the different PPC machine c=
onfigurations=2E
>
>Out of curiosity does anyone know how to test the KVM in-kernel OpenPIC=
=20
>implementation in hw/intc/openpic_kvm=2Ec? It seems to be used for e500 o=
nly=2E
>
>I think there is some good work to be done converting ISA devices over to=
 using GPIOs=20
>and improving the interaction with PCI, but it's something that still rem=
ains on my=20
>TODO list=2E Again the changes would be mostly mechanical with the main c=
oncern being=20
>over testing to ensure that there are no regressions=2E

If the changes would be mostly mechanical: wouldn't they make for some goo=
d, bite-sized junior jobs? That way, progress could also be stretched over =
time, allowing potential regressions to be ascribed more easily=2E

Moreover, I would be interested in converting hw/ide/piix=2Ec=2E AFAICS it=
 contains the only invocation of isa_get_irq() where NULL is passed for *de=
v=2E If this invocation could be moved and a meaningful non-NULL value be p=
assed, I think it'd be possible to remove the isabus global=2E This means t=
hat - in theory - we could create as many ISABuses as we'd like! Testing wo=
uld be easy, too, because the Malta board seems to use this code path (at l=
east it crashes when isa_get_irq() asserts dev !=3D NULL)=2E

Best regards,
Bernhard
>
>
>ATB,
>
>Mark=2E


