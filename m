Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528813F3A3F
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 12:40:57 +0200 (CEST)
Received: from localhost ([::1]:52786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHOQp-0008Ta-T9
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 06:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHOPY-00079H-Nw
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 06:39:36 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHOPX-0005Ih-3U
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 06:39:36 -0400
Received: by mail-ej1-x635.google.com with SMTP id gr13so25490929ejb.6
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 03:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e+EFPTql9m4mx5Kzri8EsI2edhXh4GndoB43QSSm7o0=;
 b=iXRO2C+y8lYu0SBa/V4tPiwmITKRv+aWrpSQG0H9vlTubVjaH1VV+9Vql582smQhEQ
 roBk7uW/VFyyeUhAhA3txNP77gXIR3FJpW1ghDk4hdTMqsM/va5x3MVFBxxCmhk/QQDZ
 IHzO0z44jKFCsYbTrKnzTtYKCbdQ0eLWvuADqi9C+HY3r4jjVa0HoudYpGFAc/jERjUa
 iTvbBcGs+dgL0EOLkXhmUvPjyJ+qiVFy5PF9LTidIGF5G9yjBDwTbQN/eSpb8JU15bTw
 9HhhZNLqlOKbidHTAfjYdzQFdZvrjtExWjqqLE1Z0JETTLNKEdIWyCvLOy47Am9JYPJV
 IS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+EFPTql9m4mx5Kzri8EsI2edhXh4GndoB43QSSm7o0=;
 b=kCh3gFFbZAp51uCkL2xwU/pcwSne55VsB6Spb92TNuIsxX23uKxfh+QCu6q6JhZoWY
 /izn9uMRAWeGhnp3gkKOi1L/7gGznmM+IQzPr5svGycByMXJKnEtgbKUrgK9QNAexFCR
 u7FrcufNedDUZDl1GkOEdw2z0U9sQi+JvkRZSMbQytMoCe+p6llyGfpKCWON6qngS21n
 wBfvH2Jg+b7A+9ZQ4mqpQcA4WdYR+ExEGrOj015mSjjFpNZsvzxRV0fDbXJH8qQi9T2R
 TPGk5ibU29VGzGMbq29knnO+6d3F5GlBzyQGHMLRC/M4vAHZ/NjthzP/e3qs8D905Lfw
 QzZg==
X-Gm-Message-State: AOAM532kABi5Fp+8ulO31UYcAHW9lp+EqbWih3CdU0enCf6ba0tr9MFi
 Qz0pOxTQaT968jY2M3/BjO3sJFVsfGtoyTuR35ovFA==
X-Google-Smtp-Source: ABdhPJw70L00P5N9YJCyjTuywHljNNoylq0rfhRT3NpaRRHTew9Du8kq7rbur7Hv8kKwaDYbYYr1QVrmViUnLjeTpyY=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr26559898ejz.250.1629542373574; 
 Sat, 21 Aug 2021 03:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-14-richard.henderson@linaro.org>
 <CAFEAcA81XmmHFtVfA9U307y5D41NzuHZNTFXgHe2-1Y+ZEhjSg@mail.gmail.com>
 <47d219b3-72fb-f9bf-d420-cd08bc781119@linaro.org>
In-Reply-To: <47d219b3-72fb-f9bf-d420-cd08bc781119@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Aug 2021 11:38:47 +0100
Message-ID: <CAFEAcA-GM2B_bTj8a=xTwPLrXQNft=Vm0F-cHRhBJ8vYUGccmA@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] tcg/arm: Reserve a register for guest_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Aug 2021 at 19:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/20/21 2:03 AM, Peter Maydell wrote:
> >> -        } else if (datalo != addend) {
> >> +        } else if (scratch_addend) {
> >>               tcg_out_ld32_rwb(s, COND_AL, datalo, addend, addrlo);
> >>               tcg_out_ld32_12(s, COND_AL, datahi, addend, 4);
> >>           } else {
> >
> > I don't understand this change. Yes, we can trash the addend
> > register, but if it's the same as 'datalo' then the second load
> > is not going to DTRT... Shouldn't this be
> >    if (scratch_addend && datalo != addend)
> > ?
>
> Previously, addend was *always* a scratch register, TCG_REG_TMP or such.
> Afterward, addend may be TCG_REG_GUEST_BASE, which should not be modified.
> At no point is there overlap between addend and data{hi,lo}.

So the old "datalo == addend" code path was dead code ?

Perhaps if the function now assumes that scratch_addend implies
that datalo != addend it would be worth assert()ing that, in case
some future callsite doesn't realize the restriction ?

thanks
-- PMM

