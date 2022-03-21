Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C7D4E3075
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 20:05:39 +0100 (CET)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWNLW-0000OA-1f
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 15:05:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWNJv-0007SV-0H; Mon, 21 Mar 2022 15:03:59 -0400
Received: from [2607:f8b0:4864:20::436] (port=36762
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWNJt-00019o-LP; Mon, 21 Mar 2022 15:03:58 -0400
Received: by mail-pf1-x436.google.com with SMTP id z16so16320276pfh.3;
 Mon, 21 Mar 2022 12:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jOk33/bASCdPCmMYOpiDvjjtRy77ov8ojeaQVsRcMt0=;
 b=NeM0CngQ61OvKFdZXHJe9mYkq9VXaLTpxRIfjZlemPDkWrYpX23QE0BJqIgWhl7mHZ
 QUDk0J+n8Cu7oVxd8jrJrHepl7qWMotf/laIiV4q3toBO3u0JC1YvpZsvv8w9umo+lZa
 1bE1V3+uwqIckMxUVQFFobCBQcgFUxSYPxfqKozafEzNj6tnxIENR8ogZFnYifrcNKen
 BUL43ZFMdH9FmQVATE7ewUTXEYOv1gsXBLAnWG8l2JfX2Ok9aa76DyY1vD2Ydshfqf8M
 ng1HI2yVT89KScAY4Ne1N8IMSZoHemkLW4JyTmR+lAsVXW3BR603ZAaNpCYgqAetTAMr
 43KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jOk33/bASCdPCmMYOpiDvjjtRy77ov8ojeaQVsRcMt0=;
 b=fQ9QdBGuh4EmNZrJCDXY5DRByv+OXLO2yAchapsAbiT7P17OApwOVg7lUdLrm5dOvN
 O96BMAzt/xQ9nntd+qzfVirpqF7/7s4F8ayjTTL7eRZ5elybJtCVTESnNbi/B0hr4hv1
 yRmxhhO1xeUS5xjiNo4lDHSEhNS/qR0D7qvZZX2CU6bqHbICGZ4HjhFnPdzcCK7+KD+9
 f05iD56XBur674XOgzOt0o0AdKICNEawnYOSCFOjvflk5PODIXoBbb7L4ZU1ivLp5W9v
 HZMLXHspCJcSaD2RTPyoH3UKU6h+vO5NjqTzNmONuliRb9qk92wuO0AbWtMCBnvUTUyJ
 BX3g==
X-Gm-Message-State: AOAM5324tU0Qab9jlO8FfyiXjVRH6zOw1x3XsO7t7pDjFgD+pOPd0tVf
 vPw/3+IhXQ6bj/fUGbSHKe8=
X-Google-Smtp-Source: ABdhPJwL49yWUBJhlZcejznKWpn+biMnbXdKu2RA6TlG1cgnbu0b0pnSMTtrTNWgOXQXFdEucFLc9g==
X-Received: by 2002:a63:1f55:0:b0:382:65eb:3073 with SMTP id
 q21-20020a631f55000000b0038265eb3073mr7799720pgm.624.1647889436117; 
 Mon, 21 Mar 2022 12:03:56 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 f14-20020a63380e000000b0038253c4d5casm6613027pga.36.2022.03.21.12.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 12:03:55 -0700 (PDT)
Message-ID: <506c2658-425d-38cb-87a9-1fb0bdbb995a@gmail.com>
Date: Mon, 21 Mar 2022 20:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: Memory leak in via_isa_realize()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <89a014e0-8850-e628-dea5-76999513a18e@gmail.com>
 <067ebb15-593b-4b9e-26d6-a4d98db4fd5c@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <067ebb15-593b-4b9e-26d6-a4d98db4fd5c@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 19:55, Cédric Le Goater wrote:
> On 3/21/22 14:04, Philippe Mathieu-Daudé wrote:
>> Cc'ing Bernhard who did a similar cleanup recently.

>>> Same problem happens with qemu-system-ppc64 and the pegasos2 machine.
>>>
>>> No clue how to properly fix this... is it safe to free the pointer
>>> at the end of the function?
> 
> I introduced quite a few of these calls,
> 
>    hw/ppc/pnv_lpc.c:    irqs = qemu_allocate_irqs(handler, lpc, 
> ISA_NUM_IRQS);
>    hw/ppc/pnv_psi.c:    psi->qirqs = qemu_allocate_irqs(ics_set_irq, 
> ics, ics->nr_irqs);
>    hw/ppc/pnv_psi.c:    psi->qirqs = 
> qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->nr_irqs);
>    hw/ppc/ppc.c:    env->irq_inputs = (void 
> **)qemu_allocate_irqs(&ppc6xx_set_irq, cpu,
>    hw/ppc/ppc.c:    env->irq_inputs = (void 
> **)qemu_allocate_irqs(&ppc970_set_irq, cpu,
>    hw/ppc/ppc.c:    env->irq_inputs = (void 
> **)qemu_allocate_irqs(&power7_set_irq, cpu,
>    hw/ppc/ppc.c:    env->irq_inputs = (void 
> **)qemu_allocate_irqs(&power9_set_irq, cpu,
>    hw/ppc/ppc.c:    env->irq_inputs = (void 
> **)qemu_allocate_irqs(&ppc40x_set_irq,
>    hw/ppc/ppc.c:    env->irq_inputs = (void 
> **)qemu_allocate_irqs(&ppce500_set_irq,
>    hw/ppc/spapr_irq.c:    spapr->qirqs = 
> qemu_allocate_irqs(spapr_set_irq, spapr,
> 
> and may be I can remove some. What's the best practice ?

I recommend looking at how Peter did it recently in commit 3391953660
("hw/sparc: Make grlib-irqmp device handle its own inbound IRQ lines")
and d9cd403972 ("hw/m68k/next-cube: Make next_irq GPIO inputs to NEXT_PC
device").

