Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F3160A79F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 14:54:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omwme-000446-Lt; Mon, 24 Oct 2022 08:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omwmP-0003zt-Ep
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:42:11 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omwmN-0002eY-L1
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:42:09 -0400
Received: by mail-pl1-x62a.google.com with SMTP id io19so3378118plb.8
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qTr133cApcDhUIDFePNd5/4WLcRJ8ypsmdR449zH3us=;
 b=K0SCnOQDzo25CeMUHsVXAeHVzIw9isGX7v0dmxRhgo781fyHXQSBsHuw27JzOUXrAe
 ybGiop568pEm9UQWqpm4qcoPfBm7wSSfuozkE9UDIuyA4FEGE1nGR6HYAyqo14/iuXpC
 vECgYuOtYphyr6Q2Uqa1PZCxaZi7D1uTxDv+lF63bV/Df9rQrU4yXED+8tp+5Vjy30z8
 PLbsNxC2BJ7hduICSerNYCUg4U2iTPa1lAPwErX3JmnhvXyzEOhYsQIxp9R4rjjjqHmC
 7OjxYCgFblPIfEc6818o0wKmtj73+EsPFjf9auexX28RQskr4AbSOIsNLuFp1gVIUGYf
 loyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qTr133cApcDhUIDFePNd5/4WLcRJ8ypsmdR449zH3us=;
 b=cZOXzaqvB21oCtJ1U4w2/PViq8KFOU9j4N4J7Oo3fsW2hmuD1GQrms8kTbGasBjElb
 iZ0Hq/r1AyI850xOyWoH1p1lzi/fKhVOf5p+fF1thSAONCxnYDvx9OeMJ9teW76IEQWi
 71XTk5cNhIHwY4bEWBVZW9F/D8tJRQjit8l8xoGj1Wwn4g+w35aAR0UkhQVnZyQl1eRj
 0dAbNNpB9mEfviKanV7t5p1nedyEOVVAMHhr9GHvj6enQ6+pxdgjpJ9apnNH5Vfgf/QC
 XP1vIg37p+Uae/wEwBZBjzeA66cwYCXOEC9QxelLaBFlQN8mi98mm25hOV26pfbnpBhZ
 M+QQ==
X-Gm-Message-State: ACrzQf1lrMyA2l6scq/6jHttrAnhgqRBgVe1qWOD168tB0orgF3+g86F
 uZu1uvpmRXOjMM8CTYwwmcCIR69p5CHObIfIoIR0oWevIxahlQ==
X-Google-Smtp-Source: AMsMyM4ulwgkzNic4tVgBT2XCF0U1j42VvUNaq5RrzXUKU+Vi2C0fPmmIJoS3+F2N80temQT/N5PpFxZe61VqhvwDpk=
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr257287pjb.19.1666615326078; Mon, 24 Oct
 2022 05:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <166636579128.26670.11954825054446993916-0@git.sr.ht>
 <CAFEAcA_szmT55giak4NNkTaZoGU=xJSaa1zz+h-ZR8bxPdCSTA@mail.gmail.com>
In-Reply-To: <CAFEAcA_szmT55giak4NNkTaZoGU=xJSaa1zz+h-ZR8bxPdCSTA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2022 13:41:54 +0100
Message-ID: <CAFEAcA-dgYMFM8Kb2pkoVaLncSzMtw-p2je5TRRUph3oU7wzKg@mail.gmail.com>
Subject: Re: [PATCH qemu.git] target/imx: reload cmp timer outside of the
 reload ptimer transaction
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Oct 2022 at 13:37, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 21 Oct 2022 at 20:18, ~axelheider <axelheider@git.sr.ht> wrote:
> >
> > From: Axel Heider <axel.heider@hensoldt.net>
> >
> > Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> > ---
> > See https://gitlab.com/qemu-project/qemu/-/issues/1263
> > When running the seL4 tests
> > (https://docs.sel4.systems/projects/sel4test), on the sabrelight
> > platform the timer test fails (and thus it's disabled by default).
> > Investigation has shown that the arm/imx6 EPIT timer interrupt does not
> > fire properly, instead of a second in can take up to a minute to finally
> > see the interrupt.

Oh yes, this sort of information should ideally be in the commit
message proper -- the commit message is the place to explain what
you're changing and why. You can make the gitlab issue auto-close
by putting a line

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1263

into the commit message.

thanks
-- PMM

