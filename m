Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E1A3A2849
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:30:52 +0200 (CEST)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrH1X-00065u-4B
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrH0F-00052a-Gx
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:29:31 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrH0D-00056q-RC
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:29:31 -0400
Received: by mail-ed1-x532.google.com with SMTP id u24so32151752edy.11
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 02:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tn1G0Psh9gBGfjtI+rLmwDa6qG5SqexuPEq6cTaj7mM=;
 b=zQbpmHF0pQYDIEw3RGq9mybvGmX454k3Tmvci7vLtU1uG9a9kIxDi/zvoP+w4od0jI
 4444dVAi/tJPxHrZxd7O17iTU18usP51i7UhPFeyJbvdCdGWGUsfy9r9hk8I4tH3SQ9x
 vZWwN1beVgrWOM+BlPmvKH0qwgOUY1usk5A0c4/1Db2AtGL6J23YD1yazmfVzfRmsbMR
 I2AXLFiMS6T3aahmjlKVqIG3GI1DFYBOziRpin9pRmnffDMOEgFmLCDXeSd4fRX648Z5
 e/gUfnUbPz0x6KJS03F2XNweiFRjBzOrT9qCLBHvGCUb6+8j3wP2Th4+VP8iYHl08bGj
 vrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tn1G0Psh9gBGfjtI+rLmwDa6qG5SqexuPEq6cTaj7mM=;
 b=c4QCFd4AieTl5bTes/UPb7XMw6X9yKnGhJF7/LL4mYvua7bivbFu9zGzGTnVJUJZqr
 bsbaJRG/CpU4xwl4U8fBzuUIR5vrCO2ir7OdEbuzIypZT+scK8ilCnonLHQxWY5g4YmA
 owQPemNL39Yz2E9SmqL9tKjCf+Ze4DRMYo4PqyqNdgyH8ILBsbaMZb5chhxUU4rmoVQO
 qDwRtER+GWN0b6afoGUxVImK2AvXQ0R3xI08f/9bzvOmG1McTw6y8eDQatEj9P3DJQ6+
 prHV8TVg3Z/SyIltd8pfpqJ/eZIUczHb735xmwq0a+7vZSyNSGCOC5wD6oco8hXgMCJ1
 D0bQ==
X-Gm-Message-State: AOAM532BdB5UkI7IRq+IXW1L9eNOVH/6tWRuxxKMxT0KX5glzqP4zGDx
 ytlkEgB4hKLtjHhzvohPnD2cBTFfvA6BaoVA2sYzzA==
X-Google-Smtp-Source: ABdhPJxm7S3SClIEa8haA53EXImHfLz3JMEYEe8msGZU8hfARA1ModSqS3yvwbR7bVZo3++1HOICb7iJilLXPpaj5No=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr3691868edt.100.1623317368085; 
 Thu, 10 Jun 2021 02:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-4-peter.maydell@linaro.org>
 <23ec05cc-55d3-f343-d834-aa40f7685b37@linaro.org>
In-Reply-To: <23ec05cc-55d3-f343-d834-aa40f7685b37@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 10:28:54 +0100
Message-ID: <CAFEAcA9AH+YGJ3qT2x29EebUNF_4LFmrqNwjuh=7NjzgfHMySg@mail.gmail.com>
Subject: Re: [PATCH 03/55] target/arm: Handle VPR semantics in existing code
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Jun 2021 at 22:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:57 AM, Peter Maydell wrote:
> > @@ -410,16 +415,19 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
> >       env->v7m.fpccr[is_secure] &= ~R_V7M_FPCCR_LSPACT_MASK;
> >
> >       if (ts) {
> > -        /* Clear s0 to s31 and the FPSCR */
> > +        /* Clear s0 to s31 and the FPSCR and VPR */
> >           int i;
> >
> >           for (i = 0; i < 32; i += 2) {
> >               *aa32_vfp_dreg(env, i / 2) = 0;
> >           }
> >           vfp_set_fpscr(env, 0);
> > +        if (cpu_isar_feature(aa32_mve, cpu)) {
> > +            env->v7m.vpr = 0;
> > +        }
>
> If the vpr does not exist without mve, is it cleaner to simply set vpr
> unconditionally?

I thought about that, but in the end went for the condition, just
to preserve the parallelism with the places where we do need
the condition. There didn't seem to me to be much in it.

-- PMM

