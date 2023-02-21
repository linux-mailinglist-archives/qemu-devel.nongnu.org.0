Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7148469DE85
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:12:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQYh-0001s5-VV; Tue, 21 Feb 2023 06:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUQYf-0001rQ-Jn
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:11:41 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUQYe-0007yS-5A
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:11:41 -0500
Received: by mail-pf1-x42d.google.com with SMTP id s15so754044pfg.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RCn9dlewBYXOYPyF98a8SDZT5t89n5Z3ir5OnS5z3o4=;
 b=aV8/tQHZyDR2Qts1lpT3OV7SX7Ov2+SpNr0og4OTzoKEwax/63vBjDrMJamPJGKhLK
 K1bzXt5FW7qeFHPYnEVMwwSyRHLt7jyqX2XzE65ZmbIqg8QrMHvNGM2EWfR66FKvi91I
 0XO6FUPYtqsWg7NG7WlDN4h+1wdi1CTz6xjQMipzfn7+b8VRFHBRWyuoW2cwylvNZ//M
 XJM33M7VuQwONY67BWIboqjFpWRho2ch5xxUCSnHZw5A5S6Tc06uy3mIrMtMXzLZtFrE
 bHsakhSjVhdDf5+xsLytDuxpi0yBj87uRw4e3pV46orRd7c6itl+ePEA9wrK8+yPM5+j
 9W9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RCn9dlewBYXOYPyF98a8SDZT5t89n5Z3ir5OnS5z3o4=;
 b=fEgFI7VFNZfZFRvFaSezVAM7F93nhgNmtq4Rt7JwqoloSgvUnpq5EJU3Z2hjnfHqEK
 n5qlNGfPzyaSmKCsUjtbrcn8Pnhi3K/bQJi3rXLG0Cyi+4d8laFcZQc0IBdhdqvP9P3u
 PVS4FqsqdzADt1n+ca93Rl+Cv/12zM9j3bYBowK7Yd4MJUGXl5T3xm1AeBCf9dEnGZd3
 sPzUJDuQHQ70UscTwCkOv2VrwCKMLx2Qc+lNnyIYN0gC13WCmi5lAa8Sq+wSRdborlyh
 fxY+fJajoZrgP7znT9kPO3GpjyNlQcDPjGZ2jzq1ErgSULMf/l4c0mlFzAFg46JCU3Hm
 bRSw==
X-Gm-Message-State: AO0yUKXp20dunUfqx69H8uOBnTkAGU2tB8p1zTuIs8b2FNEyOzUvZlQC
 NhoFaX0GSB6TIJwQjwwvqy/ui2EGnn4wL1vTQZWeSg==
X-Google-Smtp-Source: AK7set+n4WJD97r1ck6EHM2rcZaw7GQIBqsPoZXT5bXeFTp34NyIJ1G74HHgvGoDUaJtmGAnWl8VEGRUQdg+EJQsTIg=
X-Received: by 2002:a65:6d86:0:b0:4fb:952d:5164 with SMTP id
 bc6-20020a656d86000000b004fb952d5164mr578659pgb.1.1676977898231; Tue, 21 Feb
 2023 03:11:38 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-18-richard.henderson@linaro.org>
 <CAFEAcA9-ufibbm_Fp0spGK+iQKLgGcJfED=+c__q37mQFwAWxw@mail.gmail.com>
 <38422576-703c-7955-2f55-b9c8de922902@linaro.org>
In-Reply-To: <38422576-703c-7955-2f55-b9c8de922902@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 11:11:27 +0000
Message-ID: <CAFEAcA-LG0LKNQ9BJgsb6P-5rej73bSELu2UgpwntxmqWDf5tw@mail.gmail.com>
Subject: Re: [PATCH 17/22] target/arm: Use get_phys_addr_with_struct for stage2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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

On Mon, 20 Feb 2023 at 22:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/10/23 03:28, Peter Maydell wrote:
> > On Tue, 24 Jan 2023 at 00:01, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> This fixes a bug in which we failed to initialize
> >> the result attributes properly after the memset.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/arm/ptw.c | 13 +------------
> >>   1 file changed, 1 insertion(+), 12 deletions(-)
> >>
> >> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> >> index eaa47f6b62..3205339957 100644
> >> --- a/target/arm/ptw.c
> >> +++ b/target/arm/ptw.c
> >> @@ -32,12 +32,6 @@ typedef struct S1Translate {
> >>       void *out_host;
> >>   } S1Translate;
> >>
> >> -static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
> >> -                               uint64_t address,
> >> -                               MMUAccessType access_type,
> >> -                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
> >> -    __attribute__((nonnull));
> >
> > The definition of the function doesn't have the __attribute__,
> > so if we drop this forward declaration we need to move the attribute.
>
> Eh.  It was useful as an intermediary during one of the ptw reorgs, but now that we've
> eliminated the use case in which NULL had been passed, it can go away.  I assume you'd
> prefer that as a separate patch?

Yes, if we want to deliberately drop the attribute we should
do that separately with justification for why it's not needed.

thanks
-- PMM

