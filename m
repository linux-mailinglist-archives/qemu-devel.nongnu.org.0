Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61636518882
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:27:15 +0200 (CEST)
Received: from localhost ([::1]:53368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nluQk-0002IX-DI
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluOX-0000QD-Jl
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:24:57 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:41694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluOV-0003Fv-Tf
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:24:57 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ebf4b91212so183624807b3.8
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4yDxlLpfXlIR3iRjgtf5ag1l2Z/Knqle08/xN4PWEkc=;
 b=SWo3/2KRaPxW87cPuVCma4DHRz0Gd7ovuUErFMiKZiSbz+y+EeUUBqJozqnTtItFHL
 pH6jp3BXXCRZ4m+tJcEi8izm5hV7Sg2d8yRwE6xPbDtxTdzmVJ4i2xoxpV5nhPT4zehH
 LqC7xlBy2/TQ+BznF24YbcmV5S20dDWqNSzOINbpCyjK3BEZ94rIJEQv9ZBqK2xICPlN
 xGsXD58WRQv2WcDZUrZmBTfsmYUC+jGWXG9T12vNqJh9tp4AXVaVXKbnoHne4KrW6FUH
 jXVANoiGMwvvrSP35Oy6f/u2maeqF7JiVSmNLBNdwOIoeXnlBy1kBMF8jW92OXKiJLf8
 ieSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4yDxlLpfXlIR3iRjgtf5ag1l2Z/Knqle08/xN4PWEkc=;
 b=YLSp8ARkqcA2Yc5y/vVeNqhOJSCfNRThliP3CFIQMvZqPYbatj0zIKmYRMArdaHy1u
 IuPNKTINMZB6mN+MlXBRxDJ9R63JP5+9HSzwhM5EErmULHfnzH3IGinAhGXg2oOzWXAC
 IWW3Zr5W5tPm9hIMKEOoPsCQYtiH5tnHLWwiriqGOe5f41TREhTU7pocmrXPNOvercx2
 W/4RtaRddEENLIcvY4wlNlH7Jz5flmbv+AlR/kxfKO9ah8qNOgOll5Si2q8OtFgVwQ8V
 ZnGkimXHZiGuhknzGrxUA2TXaC/PgXx88ReBicyEXyk6JaaXuft+vMHgEKRnjA4jtw17
 IWUA==
X-Gm-Message-State: AOAM530QjYPi7XHFbzr6C8Im41IHbc2hGJzPQmhKDBr8F9HbBp7ngW1I
 WY5+ZAbHAlM8uvnvabsN4t4DBdxxFVmb/h7j5ABgmw==
X-Google-Smtp-Source: ABdhPJzILNfJJ8QZrO7H21jYPGXLzPytiyqQKcWHMtdhxyHIYD+vYBwm4WqqdrsmWb2lIacMiT0AP0kr3eTVMX9KpWw=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr3090612ywd.10.1651591494685; Tue, 03
 May 2022 08:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220427042312.294300-1-richard.henderson@linaro.org>
 <CAFEAcA-636wFtzEF56y8PcjcZy2J9RuNaw1nHMQ4Nsn_55ndCw@mail.gmail.com>
 <40272c05-c2d5-756e-5096-a05f53367095@linaro.org>
In-Reply-To: <40272c05-c2d5-756e-5096-a05f53367095@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 16:24:43 +0100
Message-ID: <CAFEAcA_twqKhn2CttPSx78W21UXoOrm8hfoObQ9a9ejPJqPJ-A@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Enable SCTLR_EL1.BT0 for aarch64-linux-user
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Apr 2022 at 16:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/28/22 05:56, Peter Maydell wrote:
> > On Wed, 27 Apr 2022 at 05:23, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> This controls whether the PACI{A,B}SP instructions trap with BTYPE=3
> >> (indirect branch from register other than x16/x17).  The linux kernel
> >> sets this in bti_enable().
> >>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/998
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> >> --- a/tests/tcg/aarch64/Makefile.target
> >> +++ b/tests/tcg/aarch64/Makefile.target
> >> @@ -26,11 +26,11 @@ run-plugin-pauth-%: QEMU_OPTS += -cpu max
> >>   endif
> >>
> >>   # BTI Tests
> >> -# bti-1 tests the elf notes, so we require special compiler support.
> >> +# bti-1 test the elf notes, so we require special compiler support.
> >
> > Did you intend to edit this comment line ?
> >
> > Otherwise
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Oops, no.  At one point I had bti-3 sharing this line, and following code, but it didn't work.

OK; applied to target-arm.next with that line fixed up, thanks.

-- PMM

