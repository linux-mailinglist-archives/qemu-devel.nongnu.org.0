Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0CE64BAEA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 18:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58zy-0007x7-7p; Tue, 13 Dec 2022 12:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p58zx-0007wr-2F
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 12:23:21 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p58zv-0004WZ-At
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 12:23:20 -0500
Received: by mail-pl1-x62e.google.com with SMTP id 17so552528pll.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 09:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r6Zcpq2s8VpF6eJ1dPsGB/2R2qJRfZgfoCzYv+ByQpQ=;
 b=qK/5KUG1yHm3L3t36D1EChGRR8/MfDZnQOW8VXN35M6g/9z8crlEpuD8+n08NANL8Z
 SwK1XRscQBaCs7VijfgCtg6iIybnHcc/d92ieDaDXtj414kzxNl1DLKWKF07kEjDwXMu
 9tNzi7HbraljOVBTxdv7IiPqewk3myIvGQbTEqx/KUHSTBiofrO0y3AqYwG4MVS3rfT9
 x+YyjYLmtqHiRwytq1P78yor4A0m5ZXhgnT5GZ6O/1ziWxHMowdjA0H12lLNlXjj5jBW
 inCFSX/RGJh2d4XPdNRidibOXreJBnxSIqegTfaK4MRBmXg+1wd83ZWLTctKwC8E+XV0
 CJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r6Zcpq2s8VpF6eJ1dPsGB/2R2qJRfZgfoCzYv+ByQpQ=;
 b=F/4oXqMdxpzkoTpKO4ToWyWu0BVNX8vW7aFeWxp5ZNyYI4/h5cE/GwSWB2Sz9ngEvo
 Z35slfEPpvF2H5BRMlgz4VdBkrK6JDwyS57sAOGHwRH9GnDC4rlU27BXX06yhGEC1psT
 fld64ICazeFi8X94MWXyH0ayHqz6v/7xaie66h5rnK0zoNU/IFbvF3glIk/Ai6o1/oTx
 ifZPtaDjGtqQ3I/vH7faeQPoLX1Voh/rtRvJwsJikbcaRM08HBHQRqIxl0J5bYrhEesN
 9qbKnave48X8JL/uhwTgJmp6zifF8povuL4PQqBuwo5zwGw9ykez6tdCy76JwJCE0LBl
 cOkQ==
X-Gm-Message-State: ANoB5plRxHYVmDCNwKBduLyQZN8aDQhJdz18ERRtafE4cdsFwcGNAT6V
 YoDa5FP1xHYHrN8P7ZfLiQTTLuPwDjDXY4EGODocdg==
X-Google-Smtp-Source: AA0mqf6quY/yd0EZ3LkHHd+lZKc5MyeFAI2oqpza+bqWkzJTzQB8aSGl9UGFpDZth8cDAaPaKeff2NtdCdykBT6TkUw=
X-Received: by 2002:a17:90a:7c4d:b0:219:9874:c7d3 with SMTP id
 e13-20020a17090a7c4d00b002199874c7d3mr462459pjl.221.1670952197532; Tue, 13
 Dec 2022 09:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
 <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
 <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
 <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
In-Reply-To: <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 17:23:06 +0000
Message-ID: <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
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

On Tue, 13 Dec 2022 at 16:53, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 12/13/22 17:27, Richard Henderson wrote:
> > On 12/13/22 10:21, Peter Maydell wrote:
> >> It does seem odd, though. We have a value in host endianness
> >> (the EPAPR_MAGIC constant, which is host-endian by virtue of
> >> being a C constant). But we're storing it to env->gpr[], which
> >> is to say the CPUPPCState general purpose register array. Isn't
> >> that array *also* kept in host endianness order?
> >
> > Yes indeed.
> >
> >> If so, then the right thing here is "don't swap at all",
> >
> > So it would seem...
> >
> >> i.e. just "env->gpr[6] =3D EPAPR_MAGIC;". But that would imply
> >> that the current code is setting the wrong value for the GPR
> >> on little-endian hosts, which seems a bit unlikely...
> >
> > ... unless this board has only been tested on matching hosts.
>
> But these are register default values. Endianness doesn't apply
> there. Doesn't it ?

Any time you have a value that's more than 1 byte wide,
endianness applies in some sense :-) We choose for our
emulated CPUs typically to keep register values in struct
fields and variables in the C code in host endianness. This
is the "obvious" choice given that you want to be able to
do things like do a simple host add to emulate a guest CPU
add, but in theory you could store the values the other
way around if you wanted (then "store register into RAM"
would be trivial, and "add 1 to register" would require
extra effort; currently it's the other way round.)

Anyway, I think that in the virtex_ml507 and sam460ex code
the use of tswap32() should be removed. In hw/ppc/e500.c
we get this right:
    env->gpr[6] =3D EPAPR_MAGIC;

We have a Linux kernel boot test in the avocado tests for
virtex_ml507 -- we really do set up this magic value wrongly
afaict, but it seems like the kernel doesn't check it (the
test passes regardless of whether we swap the value or not).

I think what has happened here is that this bit of code is
setting up CPU registers for an EPAPR style boot, but the
test kernel at least doesn't expect that. It boots via the
code in arch/powerpc/kernel/head_44x.S. That file claims
in a comment that it expects
 *   r3 - Board info structure pointer (DRAM, frequency, MAC address, etc.)
 *   r4 - Starting address of the init RAM disk
 *   r5 - Ending address of the init RAM disk
 *   r6 - Start of kernel command line string (e.g. "mem=3D128")
 *   r7 - End of kernel command line string

but actually it only cares that r3 =3D=3D device-tree-blob.

Documentation/powerpc/booting.rst says the expectation
(for a non-OpenFirmware boot) is:
                r3 : physical pointer to the device-tree block
                (defined in chapter II) in RAM

                r4 : physical pointer to the kernel itself. This is
                used by the assembly code to properly disable the MMU
                in case you are entering the kernel with MMU enabled
                and a non-1:1 mapping.

                r5 : NULL (as to differentiate with method a)

which isn't the same as what the kernel code actually cares about
or what the kernel's comment says it cares about...

So my guess about what's happening here is that the intention
was that these boards should be able to boot both kernels built
to be entered directly in the way booting.rst says, and also
kernels and other guest programs built to assume boot by
EPAPR firmware, but this bug means that we're only currently
supporting the first of these two categories. The reason nobody's
noticed before is presumably that in practice nobody's trying to
boot the "built to boot from EPAPR firmware" type binary on
these two boards.

TLDR: we should drop the "tswap32()" entirely from both files.

thanks
-- PMM

