Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348AB66C34E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:08:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHR5H-0002O6-OO; Mon, 16 Jan 2023 10:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHR5C-0002Np-JL
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:07:34 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHR5A-0004hf-Lc
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:07:34 -0500
Received: by mail-pf1-x42b.google.com with SMTP id y5so21163137pfe.2
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 07:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXE9FNtnfHXKj5cYwi/yeG+YApNm6u+zGFbpowuYUDo=;
 b=Fw+XDtMX9Lp6TO0dOnKf4UkqShw06aPa2K9ivG8HAMz8CME1yyRTWbiBapYYpMm0w+
 uiVwpzEotGxGldkP9KSRAYIivUxUjZMvhd+F3JArIIE/sMrcQrukcwCpAFJMOKTl4Eyi
 PHSVWScpj5AZk8jYAzKTIXHkRNEqZCRProwsQv9eps9oeUTOboa/RlYSF8aaDwDoD0qV
 7aI8JO0mv31Qj+H3IxZnnfnMGhKlkQNksx/lh8zPZy/g0fWLS8iK3EO03+p78hR85RBW
 SYfeQQH8Kelghd/vM4guttVlRM2EvG82+ypC0h2Qyqiq5PhaK8RHDzlc5mtTi4oa3gNN
 wMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sXE9FNtnfHXKj5cYwi/yeG+YApNm6u+zGFbpowuYUDo=;
 b=4XfaYfUqnI17wLHNIOEQBlOwuoR1sOWkJcEKGK5MBDS9gnuLWiL+QKQlCoE7esuCDH
 LMT97x9CpH/Wy6RgQ9viNKLnWi2UC+D7h3fJZ5L/aaECtR1uunYu2YqMPgcTRg0+mPDa
 m7ysJfCphgdG790C0wt7x37oWcW9Y0gwsNGqQpZPPWT6Gey6Me2hBZkWMfOTFObDiGl4
 qtwLtjwuLaHDS4/ODJk2ERTkSmIJEyAjZCPMYamFkM5gRoa0OHQQJRLvcwI6PW49FH9E
 Oazxe+cBjf0sN9xDhw0k0YS8lfUyKNUmVzO+BUlVQwuX6pxDpfF5YCxJdJqSSWNpg6Pj
 m5Jg==
X-Gm-Message-State: AFqh2kqaG/Vl+VVO2AiCKnL/xAhaN/dKvnrNVQJsSQ5zaU5CRi5hxfpW
 1Jn4DjtOX4D1dMEQM1UUFngc7pkQPTCDwNq4sdA8tw==
X-Google-Smtp-Source: AMrXdXu+5R0te2aOJWcVG0dFG1zQpZYtZ2hv+GWoWGX7RjeY9wC7oBSaEAVHBoLRB8PLhegoCy5ILSAmipqHSJoKH8o=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr1875616pgd.192.1673881650989; Mon, 16
 Jan 2023 07:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-5-richard.henderson@linaro.org>
 <CAFEAcA_viCsMxSjcpFtxL+hj-n5TTff0npg1RjOnLUpwGu47DA@mail.gmail.com>
 <87pmbil5rn.fsf@linaro.org> <a2ebe5dd-29a2-4c94-f3da-9c7f5dc7979f@linaro.org>
In-Reply-To: <a2ebe5dd-29a2-4c94-f3da-9c7f5dc7979f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2023 15:07:19 +0000
Message-ID: <CAFEAcA_sZ7QbkhOHYJt-DPxh-NS6XnBg8MNJh=oe8X6KmuAYjg@mail.gmail.com>
Subject: Re: [PATCH 4/4] tests/tcg/multiarch: add vma-pthread.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, iii@linux.ibm.com,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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

On Mon, 16 Jan 2023 at 12:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 13/1/23 18:10, Alex Benn=C3=A9e wrote:
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> >> On Sat, 24 Dec 2022 at 15:19, Richard Henderson
> >> <richard.henderson@linaro.org> wrote:
> >>>
> >>> From: Ilya Leoshkevich <iii@linux.ibm.com>
> >>>
> >>> Add a test that locklessly changes and exercises page protection bits
> >>> from various threads. This helps catch race conditions in the VMA
> >>> handling.
> >>>
> >>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> >>> Message-Id: <20221223120252.513319-1-iii@linux.ibm.com>
> >>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >>
> >> I've noticed that this newly added vma-pthread test seems to
> >> be flaky. Here's an example from a clang-user job:
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3600385176
> >>
> >> TEST vma-pthread-with-libbb.so on aarch64
> >> fail indirect write 0x5500b1eff0 (Bad address)
> >> timeout: the monitored command dumped core
> >> Aborted
> >> make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libbb.so] Erro=
r 134
> >>
> >> and another from a few days earlier:
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3572970612
> >>
> >> TEST vma-pthread-with-libsyscall.so on s390x
> >> fail indirect read 0x4000999000 (Bad address)
> >> timeout: the monitored command dumped core
> >> Aborted
> >> make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libsyscall.so]=
 Error 134
>
> Yet again:
> https://gitlab.com/qemu-project/qemu/-/jobs/3608436731

Yep. Could somebody write a patch to disable this test while
we figure out why it's flaky, please?

thanks
-- PMM

