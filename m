Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B3B64BE99
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:38:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cye-0007MJ-EU; Tue, 13 Dec 2022 16:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5CyW-0007K7-8s
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:38:08 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5CyU-0007Wi-Ia
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:38:08 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 fa4-20020a17090af0c400b002198d1328a0so2493454pjb.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UhzG6Cec3m6/jKF2cXCB/FDkyZ9MOe6Qh5VreeKxtes=;
 b=PjnJeFKDOASbiw9LB5kIsNidi/jyiekKd8iQcKlELYdAypzy2P5i9Azu/Si/KzO0du
 uVTyoGfDgj8dI6TOGmuJm3BAhu9c/8hMzRSqIwQwuvcIsMYAYIle9il6jE07zacrYpye
 Lp55HFER6FkN3CWKtxi7aTj3uQyvPXZygbbOgFDBgtBTFdStf77I1Zz0HnhjEOPrXX0G
 vTL/Mx/ZfIs/0dWwnbNk9zJaY5O9bEVwHMn/vYjZH3w/KS6f9s+/1+P8uTRiQ5fH/LN9
 dPA9TR/mDvd8/ga8AK8VHdDU/ihfeELiCNQ5+0sERM1UGFhF3NfJx5v/VgepI2mqKmMO
 Etog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UhzG6Cec3m6/jKF2cXCB/FDkyZ9MOe6Qh5VreeKxtes=;
 b=TTVeA0RZMKP616KxDzWsAfYCWh3h+Zg0mJVGXRSqp3/ATsYezhYhvvbjQD3nSIHKO6
 EK9PmxlHnfqUF0FSqJNR6HlK7opnyK2ZWoRkGTd/bX5h3k1WJY0ahB2MiQepfNTO7lHO
 5664D2x+qBs1Ajm8/pMdX9Lz8N1DzoF4d0zVA1iM/wZztbftuH1WL+Xk6Q7yqlj9N9Z2
 pEoyDNZbggBtRiWNUBodkWeTII+lAIE0cbGiKMi/O96lBtOnvtsfB57/w/eqD5SRRsPo
 t/Q0MrrbVGBtOhLDYIg3DSPhTU4+RIzHpZFhIA62PPUXmDIQn3QJJRv+gadyP5jZZGF8
 BMBA==
X-Gm-Message-State: ANoB5plwV8W49I5OHKUO8Nqz4MhfT5eeHb1jX9tv208supLUMVC0If2B
 KJZGCuZ4ZDd4+WlKUp8MweCJg7mFTXH44J4mC0vyZw==
X-Google-Smtp-Source: AMrXdXtr2rfLDYOy9vdxqlH0+QiwA+v+PSjDCFYdWjIAbBkpVi/IN2b3N7aKAtZ2hGQ6/mgqegiYmIqdr9GAGPtG6eI=
X-Received: by 2002:a17:90a:ff13:b0:219:9874:c7d3 with SMTP id
 ce19-20020a17090aff1300b002199874c7d3mr16570pjb.221.1670967484740; Tue, 13
 Dec 2022 13:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
 <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
 <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
 <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
 <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
 <e3ce4608-c516-568b-df37-8446fbe6735b@eik.bme.hu>
In-Reply-To: <e3ce4608-c516-568b-df37-8446fbe6735b@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 21:37:53 +0000
Message-ID: <CAFEAcA_NR4XW5DNL4nq7vnH4XRH5UWbhQCxuLyKqYk6_FCBrAA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 13 Dec 2022 at 18:11, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> I can't remember the details but I think I've had no tswap in sam460ex
> first but that did not work and had to add it but I've probably looked at
> other examples and did not really understand why this was needed. I tested
> on x86_64 so not matching host. The board firmware has some reference to
> this magic value in:
>
> qemu/roms/u-boot-sam460ex/arch/powerpc/lib/bootm.c::boot_jump_linux()
>
> I don't know what it does with it but I think kernel expects it in big
> endian and what we put there should match what U-Boor does (if this is
> actually used on sam460ex which I'm not sure about).

Thanks. That u-boot code uses the same value for EPAPR_MAGIC
as we do (0x45504150), and it puts it in r6 (by doing a function
call), and being native code the register will get that exact
value, not a byte-swapped version.

So to match that we should delete the tswap32() that we
currently have in our hw/ppc/sam460ex.c code.

My guess is that (as with the virtex kernel in our test suite)
the Debian/Ubuntu kernel you tested with worked because it
doesn't actually check the value of the magic number, it only
cares that it gets the FDT address in r3. The giveaway that
the tswap32() is wrong is that we're only swapping one of the
4 things we pass to the guest code in registers -- either
we should need to swap all of them, or none (unless our
magic number value was pre-byteswapped, which it isn't).

-- PMM

