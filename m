Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3E40ABA6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:28:11 +0200 (CEST)
Received: from localhost ([::1]:49596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5fe-0006Ep-IJ
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ5cQ-0003OS-9f
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:24:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ5cO-000204-I5
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:24:49 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q26so19325582wrc.7
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 03:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VsxTFIF2rtUAE6NPKqCBBTbO6I0q1/3R1GVdv49xhxE=;
 b=oaNdLHfI3/tMZFzuNF6NcF7Q3oc5KlQAVnVrkeeficQjkkgrTGGRnx8FXQQerQ60id
 6BnUvRa0YmZHVHToJEsZKzbu1mK4QEbEuW0ilq6Jsam3CYFLQQqGSKzgX+6c/m95PDdL
 K2TwfdPPgJVXYrUZHMh4fQERTYaOBm+l+Ttxc/zLiAMd5sRRUhsZBU6SWoLLSXuIX0VJ
 AmSC9rtUd2533NYdZygkP7u20I8k44UsddFTk4DY2lOKWEJi0MzfQI4ljmlbdnZxudfA
 LFeEnz3mCAx6n/Bv9A0q6G3CceZg0Le0ozEjvOpI2UYdy80UmPGId6YyRVnOoAHIPl//
 IDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VsxTFIF2rtUAE6NPKqCBBTbO6I0q1/3R1GVdv49xhxE=;
 b=qWmuS0VTuVZHRlNWSC2IBuaj8OmGWJ4iqjeeAMzjzUQuwce537SMe0S1tvdq72WHdX
 vc6bvacBr3K0pOWnCMh61SkqwvOVgJ61xLuJYpAF95+QESo2J2GrKBCO1/Yg7JVr+xtW
 clwaJIBfKK+WHy6fpWuLNtiPylA1CXQelKM9xeqHfAJrVTqJRuFzVKyoul8SQecHvRyW
 rUftXTmD3wuAEnoTZDl+w3/jZJDR4kP/+2QYt46nf+YezAvAxXpbbQHYewEEWhe7+I7g
 YFGpUTOBtfAqzzv92WzwtY6h+MIFxVi/DCyU9dfheYUoaOF/QR84efhkdYW5r+7w9TVl
 91oQ==
X-Gm-Message-State: AOAM531w2xfg6QTm9j5R/QfGBUpUhzsh/QhQJD+RTPUiqZ7Wg1ndOJkz
 UKP3XadE85ovkp09qPSYrqDW4cuYGo7xXUwjtWkgzw==
X-Google-Smtp-Source: ABdhPJxQlDW35vF0jAqSAfS0N0KXW5Qpl/XYV/arvp5Oz5sH830DBeSbrFtpFBs0QIdovKswuWucJcTltX+G0aiQMwg=
X-Received: by 2002:adf:f185:: with SMTP id h5mr18140573wro.302.1631615087009; 
 Tue, 14 Sep 2021 03:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210914085404.3889441-1-clg@kaod.org>
 <CAFEAcA9epGAoHPNV=N+x2TWbFoRPgQSUML-RCDkMhvtYK5SEFQ@mail.gmail.com>
 <45fca4ca-55ed-b75c-e1d6-f0903562c1e6@kaod.org>
In-Reply-To: <45fca4ca-55ed-b75c-e1d6-f0903562c1e6@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 11:23:56 +0100
Message-ID: <CAFEAcA9pV1vAmrEc6vSBvjLomrDfHGXM+C7as=8-DfMq=Kpxmg@mail.gmail.com>
Subject: Re: [PATCH v2] target/ppc: Fix 64-bit decrementer
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sept 2021 at 10:47, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 9/14/21 11:19 AM, Peter Maydell wrote:
> > On Tue, 14 Sept 2021 at 09:56, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
> >>
> >> The current way the mask is built can overflow with a 64-bit decrement=
er.
> >> Use sextract64() instead.
> >>
> >> Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
> >> Fixes: a8dafa525181 ("target/ppc: Implement large decrementer support =
for TCG")
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> ---
> >>
> >>  v2: replaced MAKE_64BIT_MASK by sextract64
> >>
> >>  hw/ppc/ppc.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> >> index 7375bf4fa910..4f14464c9220 100644
> >> --- a/hw/ppc/ppc.c
> >> +++ b/hw/ppc/ppc.c
> >> @@ -876,7 +876,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, =
uint64_t *nextp,
> >>      bool negative;
> >>
> >>      /* Truncate value to decr_width and sign extend for simplicity */
> >> -    value &=3D ((1ULL << nr_bits) - 1);
> >> +    value =3D sextract64(value, 0, nr_bits);
> >>      negative =3D !!(value & (1ULL << (nr_bits - 1)));
> >>      if (negative) {
> >>          value |=3D (0xFFFFFFFFULL << nr_bits);
> >
> > I think these lines that say "if negative then force all the
> > high bits to one" are also no longer required. That is, this
> > entire section of code:
> >     value &=3D ((1ULL << nr_bits) - 1);
> >     negative =3D !!(value & (1ULL << (nr_bits - 1)));
> >     if (negative) {
> >         value |=3D (0xFFFFFFFFULL << nr_bits);
> >     }
> >
> > is an open-coded sign-extension, which can all be replaced with
> > the single line
> >     value =3D sextract64(value, 0, nr_bits);
>
> 'negative' is used for more tests afterwards but you are right. I will re=
spin
> with more changes.

After the sign-extension you can set 'negative' with
  negative =3D ((target_long)value) < 0;

PS: passing a negative value into muldiv64() to set the next
timer event (as the existing code does in some cases) seems a bit
odd; this probably ends up with an arithmetic overflow and setting
the next timeout to something unintended. But that's a separate
issue from the bug you're dealing with here.

-- PMM

