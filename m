Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6269C31379E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:29:25 +0100 (CET)
Received: from localhost ([::1]:32850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98TZ-0008Kx-9Y
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l93Lq-0002rU-9i
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:01:12 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l93LP-0004P2-6h
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:00:53 -0500
Received: by mail-ej1-x62a.google.com with SMTP id jj19so23635638ejc.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 02:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CTfLLalfLGT1L809WxY3rB0l35OmZLNoIkqzZXMwvdc=;
 b=WRjPmWvImZYJPctaNtG9sU0huupgpSVtIBtotMiex403r1h5/pMprofHljOZNlBc2P
 SA/mOjA0iiwDn2l5IeTLB924wcvDsiEq3y0IM0acNjiy4XBfl6z8K2y8IQbxPoc61eOF
 WGF7gwieD7Op611yMQPPgaLFYgDmj8y4W0+oPCXsBy9o8qbx+SUMHqqshP0cSeMA6CQO
 dNGo5tFd4AhXZo6wgzx0CHuVF7b6He37TX0kZxA5QGgVkXUmGOIEG9gJJXeVzduwOUa8
 1Xetl3duzz5TIFsKldlg3JstMPRY8D+p43Mxs8rIV1aXkhSDUVnzxDbm4e0SwFO9LjBS
 rTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CTfLLalfLGT1L809WxY3rB0l35OmZLNoIkqzZXMwvdc=;
 b=riFQWYTT5PJX4ep5Ps0s/f40Jkk1gAkXTsPlWnVvaOlJkH7N9qknngoADPR40e0PBP
 7Ttp/4ABJV0A0gH9exDuX8RPbQYUt+U+ZDtLDyFKfI44F2mXDAaqHJTW+4v1ke8omwS4
 3ci6JsDv+JOJRQhctk7OGKRLItdAqWch/pM7W5XVe2NfzWsd0AQbcWZRo9WQN/V1hbtA
 vG4HOOb9fy5THXXTofnJHZSTIXMABZ/vR0wZmUHPx1CdoWCfe/W2DWk0nywD2Iapc5Mn
 RX3Dm8lYDFiGp7qx4UsVpBc4AgWO2UxsQQYWeTjLxNS+4O8qze90WchaS+M8op01aAix
 HUmw==
X-Gm-Message-State: AOAM530rAc2bgrW4vZmjf2MeWHiH1GMwTaJN9C65i8E29sRxf2lMHFza
 RV3mxvUybKR/xfI3jGmmGpwgOVA7PjoOslwa+bgjkg==
X-Google-Smtp-Source: ABdhPJwG4uOQRPTiyXooXr9LRJd1hBDXI9lWm7l75Vj92ebeJvheGw3g9G5+Rx1Br6VFPx4zKkmJHebCcZ7HlVEbanw=
X-Received: by 2002:a17:906:3a89:: with SMTP id
 y9mr16043918ejd.4.1612778427956; 
 Mon, 08 Feb 2021 02:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20201022120830.5938-1-peter.maydell@linaro.org>
 <d258bc62-1a17-aeed-13ac-b61297e01a04@amsat.org>
 <CAFEAcA_T=HyjZWSXUpP1-07rwUsUsQs0rLOjQKNsm-cUAo1FEA@mail.gmail.com>
 <3431522a-982a-7780-5ef7-c6261aad4c69@amsat.org>
In-Reply-To: <3431522a-982a-7780-5ef7-c6261aad4c69@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 10:00:16 +0000
Message-ID: <CAFEAcA-wf7yvyPyOzA8k7juFvW0tYZJXFZ6bm-zwAWQwJyfQ+w@mail.gmail.com>
Subject: Re: [PATCH] migration: Drop unused VMSTATE_FLOAT64 support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 09:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> +Eduardo/Richard.
>
> On 2/7/21 8:43 PM, Peter Maydell wrote:
> > On Sun, 7 Feb 2021 at 17:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> >>
> >> On 10/22/20 2:08 PM, Peter Maydell wrote:
> >>> Commit ef96e3ae9698d6 in January 2019 removed the last user of the
> >>> VMSTATE_FLOAT64* macros. These were used by targets which defined
> >>> their floating point register file as an array of 'float64'.
> >>
> >> Similar candidate: VMSTATE_CPUDOUBLE_ARRAY()
> >
> > Isn't that still used by target/sparc ?
>
> Sorry, I meant CPU_DoubleU could be a similar to the removal of float64
> in commit ef96e3ae969 ("target/ppc: move FP and VMX registers into
> aligned vsr register array"), so we can remove VMSTATE_CPUDOUBLE_ARRAY()
> later.
>
> But I could be wrong and this is a legit use, as CPU_DoubleU contains
> either a float64 or a uint64_t.

CPU_DoubleU and friends are there to provide host-endian-independent
access to the different parts of a larger-than-word-size value (which is
why they're defined in bswap.h). They happen to use 'float64 d' as one
of the union subtypes as well as 'uint64_t ll', because they pre-date
the decision that we shouldn't really care about the distinction
between float64 and uint64_t except for documentation purposes in
helper function prototypes. But the core reason they're present is
to provide conversion between 'd' or 'll' and ('upper', 'lower').

There is some cleanup that could be done of these types now that we
don't try to distinguish float64 and uint64_t:

(1) CPU_FloatU is now entirely unnecessary, and uses like this (alpha):

static inline uint64_t float32_to_s(float32 fa)
{
    CPU_FloatU a;
    a.f =3D fa;
    return float32_to_s_int(a.l);
}

could just be written:

static inline uint64_t float32_to_s(float32 fa)
{
    return float32_to_s_int(fa);
}

(and then rename float32_to_s_int() to float32_to_s() and drop
the wrapper entirely)

(2) Where CPU_DoubleU is being used only for transitions between 'd'
and 'll', like this (ppc):

uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
{
    CPU_DoubleU farg;
    float32 f32;

    farg.ll =3D arg;

    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
        float_invalid_op_vxsnan(env, GETPC());
    }
    f32 =3D float64_to_float32(farg.d, &env->fp_status);
    farg.d =3D float32_to_float64(f32, &env->fp_status);

    return farg.ll;
}

we can drop the use of CPU_DoubleU and just pass 'arg'
directly where 'farg.d' was being passed, and similarly
just return the result of float32_to_float64() without
passing it through the union.

But at least some uses of these types will remain after that, I think.
(We could look again at what those remaining uses are after the
first round of cleanup and whether there are better ways to write
that code; personally I find these unions a bit ugly and wouldn't be
sorry to see them go away.)

thanks
-- PMM

