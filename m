Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A08638B50
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:35:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYqV-0005xY-4s; Fri, 25 Nov 2022 08:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyYqS-0005vn-3q
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:34:21 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyYqP-0004sa-9P
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:34:18 -0500
Received: by mail-pl1-x636.google.com with SMTP id d6so4009531pll.7
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QxdZaK4tWCXBw3Lg5RReVTuLn2B8J8wFQxJu6ipe15o=;
 b=O0EMV661zYLLq48gL1zlw/lNZx8CbuWnsB5Zjx8CZiINlyEF1pkz33mxWfAMsQIoPu
 y7EerT0lp1fVL1wm8b95WWc9EQuyWPAbrapj34kv1nauGaYBZHMtli3+IqxXEgc62hDm
 HNei4kmjcHZxAFHroRa90yaA3RHGqIpviNHr2BPfxU1TFO89RQIgIglBVk3Yp0GLZspK
 AR670BnmWF0lfD253mLyBkuVm4bDPcYLDzrFGspC6gvE+7i74ItzAzY8cpI8hSy2HCEN
 9xOUi8K2hHIcQrgLpWOQMtc1hU81slXSd7HEQ1mTp8RosYK/1kYff5oZK+UMC8uzRHsn
 BhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QxdZaK4tWCXBw3Lg5RReVTuLn2B8J8wFQxJu6ipe15o=;
 b=cnWLWVBI+MV3frb8GK77DwQMHl2y+y6ohrGa4R4H1AT8ZAazRH1ldQBOqMWAjr1KS8
 2KDYRqybf/rOUGoGe3DzYUFx+CMPw2Rmv7fK4vUrdEqXirX9CgCjtpUvQltU+dW9YD6q
 WV8NsEuw17+k8YOLTmkqfm1Jh7vA79RZ/C70Fb+hqBOBlod6AakkUpf09YmRwHjAqKUv
 S7Qi1iy8bH0yZD89BjV7nE20fmSgtt58eX5FiBttY/vvCHLbetocuOpQwHP0T8ykDPUQ
 5UT6zcThefRTKxIKHLlWUW2Wy+eYKc1nCittOC0WZpqpWXQ7CFBqDqnKhXNNBqO8Qdt2
 d53Q==
X-Gm-Message-State: ANoB5pmwM9qduVTLjLtHqoSuc5KG7IhU+czyeOsasJ31hxAXJgpmxt/M
 yorZMZ7yjiviT0kjMeGDQgquqAOWimPG//B/v5m/pA==
X-Google-Smtp-Source: AA0mqf6JoiDrLRfsd5KzYhfXWyeVDkOD0DSrLsey0ecJdjcYWnZxqQq2XTEQ29aqHC+2IPhF4TOadEAdeHWJf4+88pU=
X-Received: by 2002:a17:90a:460f:b0:218:c47f:ed9a with SMTP id
 w15-20020a17090a460f00b00218c47fed9amr21449291pjg.19.1669383252080; Fri, 25
 Nov 2022 05:34:12 -0800 (PST)
MIME-Version: 1.0
References: <AM9P193MB168473D99B761E204E032095D40D9@AM9P193MB1684.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <AM9P193MB168473D99B761E204E032095D40D9@AM9P193MB1684.EURP193.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Nov 2022 13:34:00 +0000
Message-ID: <CAFEAcA_BN2EwTQwb2F8YxN0sz8t_D-o5cUQKacS5QoHuYB0TSQ@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber
 advertisement
To: Luke Starrett <lukes@xsightlabs.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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

On Tue, 22 Nov 2022 at 18:31, Luke Starrett <lukes@xsightlabs.com> wrote:
>
> The ARM GICv3 TRM describes that the ITLinesNumber field of GICD_TYPER
> register:
>
> "indicates the maximum SPI INTID that the GIC implementation supports"
>
> As SPI #0 is absolute IRQ #32, the max SPI INTID should have accounted
> for the internal 16x SGI's and 16x PPI's.  However, the original GICv3
> model subtracted off the SGI/PPI.  Cosmetically this can be seen at OS
> boot (Linux) showing 32 shy of what should be there, i.e.:
>
>     [    0.000000] GICv3: 224 SPIs implemented
>
> Though in hw/arm/virt.c, the machine is configured for 256 SPI's.  ARM
> virt machine likely doesn't have a problem with this because the upper
> 32 IRQ's don't actually have anything meaningful wired. But, this does
> become a functional issue on a custom use case which wants to make use
> of these IRQ's.  Additionally, boot code (i.e. TF-A) will only init up
> to the number (blocks of 32) that it believes to actually be there.

Nice bricktext commit message :-)

> Signed-off-by: Luke Starrett <lukes@xsightlabs.com>
> ---
>  hw/intc/arm_gicv3_dist.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index eea0368118..d599fefcbc 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -390,9 +390,9 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
>           * MBIS == 0 (message-based SPIs not supported)
>           * SecurityExtn == 1 if security extns supported
>           * CPUNumber == 0 since for us ARE is always 1
> -         * ITLinesNumber == (num external irqs / 32) - 1
> +         * ITLinesNumber == (((max SPI IntID + 1) / 32) - 1)
>           */
> -        int itlinesnumber = ((s->num_irq - GIC_INTERNAL) / 32) - 1;
> +        int itlinesnumber = (s->num_irq / 32) - 1;
>          /*
>           * SecurityExtn must be RAZ if GICD_CTLR.DS == 1, and
>           * "security extensions not supported" always implies DS == 1,

I always find interrupt number counting confusing because
there are multiple ways to do it...

In QEMU's GICv3 model, s->num_irq is the total number of interrupts,
including both PPIs and SPIs. So if s->num_irq is 256 that means
"the maximum SPI INTID is 255". The virt board code agrees with this:
it defines NUM_IRQS as 256 and sets the GIC num-irq property to
NUM_IRQS + 32.

The GICv3 spec says that if this GICR_TYPER.ITLinesNumber field
is N, then the maximum SPI INTID is 32(N+1)-1. Rearranging:
   max SPI intid == num_irq - 1 = 32 * (N+1) - 1
   num_irq = 32 * (N+1)
   num_irq / 32 = N + 1
   N = num_irq / 32 - 1

(We enforce that num_irq is a multiple of 32 in
arm_gicv3_common_realize(), so the division is fine.)

So yes, the setting of this field is wrong and the patch is correct.
I've applied the patch to my target-arm-for-8.0 branch and it
will go in once 7.2 is out in a few weeks' time. (This doesn't
seem to me like a release-critical bug because we've behaved this
way forever.)

Interestingly, we got this right in GICv2:

        if (offset == 4) {
            /* GICD_TYPER byte 0 */
            return ((s->num_irq / 32) - 1) | ((s->num_cpu - 1) << 5);
        }

but obviously got confused when doing GICv3...

thanks
-- PMM

