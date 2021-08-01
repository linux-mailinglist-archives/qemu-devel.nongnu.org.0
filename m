Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB7D3DCC94
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Aug 2021 18:04:31 +0200 (CEST)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mADwz-0006QC-Vq
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 12:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mADtL-00028B-Ow
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 12:00:43 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mADtK-0007jP-1i
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 12:00:43 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gs8so26672037ejc.13
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aqUAk9IULCu1NM/jI3zUIJC1RgG1ZIcUNPFpbjDo1b8=;
 b=vAwHnv1jejWGX4pyHK5r4eUZF4Hb09VWOJ4QfbsiqetWidkyaFH0/Efjyfex/B40lm
 baNYWCqLYXYyjRfOypYXewBGamkNKjdBUCScAQ11rlrOiRBG9vMspbIBvTqmqVk+14AX
 4lZUO8By3qD3Gutv1MxHp0he71I/GKUctfcwnIf2MJ0HW8nsfS9Vl9EbC2dz0jou5Bue
 ugIAdvBeXYLk8yWlBGsfXYDLo+iT1MfumpeYMsxlTKjA0ZnhcIgxVRhYsJ/+QxHigFTx
 w0IdV+LY5D8xjVkRRPC1WEatQxGW/XwYWiBGYLUf1Og425BtzyfLnFlqLYVw743UpJIf
 92dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aqUAk9IULCu1NM/jI3zUIJC1RgG1ZIcUNPFpbjDo1b8=;
 b=Wiq1ULPtnvZseDbi49+N7/XzM19YMG46LvNJmpUKG7B1L8Www3kH8re0xoDBQbqs+a
 lFB3D06VFXIEWPFzF43QvlCAMs9uThw6HcTRthXbpEGCEL7PFwov2Zz3qeB9/heU5wF7
 711z971UwoHzicEVn5avMY8JIXKjDgpmVrxQWRN2Q/Me7naTy/Eg2g5PBZzqQkxjVBgD
 MpdLixL/WbLZOiE2dgdbJlYSem4dIvxC/6WhSpW6xZIjc7xBkyKldkuHOtXywLr5FUA1
 BAMjYl5/lYNE8vO49UTUKJuYerSMOz69A/ZOBPNTvMPGp2UW0DAMmH7dLBzjAfyaiVqs
 qv1Q==
X-Gm-Message-State: AOAM531eaVucuMvNW8sGs9JqdkCKft9Ni/VuWgKXLEBAyCIEIlVmfpej
 y42q4PEfCXfTzlmc1TU2BHxXpxOh1mREYtLJlXcHAQ==
X-Google-Smtp-Source: ABdhPJzjIHJKmgOwYjRZCXvQvZ8OWkRiWyZMozFyGFvPJPPRYlQTAz0LfVVmC5pUuWxirBy0Y1MK879n0GSqzVH4jps=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr11577459ejy.407.1627833639558; 
 Sun, 01 Aug 2021 09:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-15-richard.henderson@linaro.org>
 <CAFEAcA8izWZrXSjQ5i-JB=YEtEYQODLi1fQdsf9GMrU7PyhHzw@mail.gmail.com>
 <563efaa1-6e18-75ac-7884-913ec045802f@ilande.co.uk>
In-Reply-To: <563efaa1-6e18-75ac-7884-913ec045802f@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 1 Aug 2021 16:59:56 +0100
Message-ID: <CAFEAcA-LweAa6NjvvW7xWCcP9fEc4+GemENTAKPf=9qgHND-UQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 14/43] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 1 Aug 2021 at 16:56, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 29/07/2021 15:51, Peter Maydell wrote:
>
> > On Thu, 29 Jul 2021 at 02:01, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> We ought to have been recording the virtual address for reporting
> >> to the guest trap handler.  Mirror the SFSR FIXME from the sparc64
> >> version of get_physical_address_data.
> >>
> >> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/sparc/ldst_helper.c | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
> >> index 974afea041..7367b48c8b 100644
> >> --- a/target/sparc/ldst_helper.c
> >> +++ b/target/sparc/ldst_helper.c
> >> @@ -1963,6 +1963,14 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> >>       SPARCCPU *cpu = SPARC_CPU(cs);
> >>       CPUSPARCState *env = &cpu->env;
> >>
> >> +#ifdef TARGET_SPARC64
> >> +    /* FIXME: ASI field in SFSR must be set */
> >> +    env->dmmu.sfsr = SFSR_VALID_BIT; /* Fault status register */
> >> +    env->dmmu.sfar = addr;           /* Fault address register */
> >> +#else
> >> +    env->mmuregs[4] = addr;
> >> +#endif
> >> +
> >>       cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
> >>   }
> >>   #endif
> >
> > The architecture manual seems to be gratuitously opaque about
> > whether and where the fault address for an alignment fault gets
> > recorded, but Linux at least for 64-bit seems to pull it out of the
> > sfar, so I guess that's right.
>
> Yeah, this part is actually contained within the UltraSPARC II specification - it can
> be found in section 6.4 "MMU-Related Faults and Traps" table 6-3 which indicates that
> for *_mem_address_not_aligned traps the D-SFSR and SFAR registers within the MMU are
> updated.

Do you know what 32-bit CPUs do? The Linux kernel sources don't help
here because they don't bother to report the fault address...

thanks
-- PMM

