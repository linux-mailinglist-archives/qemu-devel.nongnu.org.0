Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799A2406EB6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 18:06:24 +0200 (CEST)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOj2l-0005DK-2g
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 12:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOixi-0007yM-QG
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 12:01:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOixc-00058F-1V
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 12:01:10 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1816175wmb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9X+1s7d8lRGjDDZpM979YKkRx8eSsSi/aQ2KCCGTpA=;
 b=d70sKalx6K9m3FECC2zANbLra1Qd7DdhkX+ZxDOEyCvYXNnaInyLiDm3BinGd3zugl
 5+aFZdg7Ta2WzrkDDX+5eiVJI0J3SwkwCLl8ZlfJ0WSeA0u/LZMRrsjZsvVUo5TQs5Ou
 lqqrx4q8ZKGFFZj1TMEiGa9iyP9ZVFhywXA0+1tVdHKyimPn31nCtzB5h3XAhUyZr3Ey
 cmyPkC6+XjxKAOPjlzYDYt5o/kvbBp5UahlZrWJJrAVCYHBHiqrVQCiu/aeqc+LcbQad
 DWty9pNlJXVrFFnW28XjYgptMZjEy92acexMyduJwxf+9a06JVdFu2mZufDnIxBGrvQG
 jxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9X+1s7d8lRGjDDZpM979YKkRx8eSsSi/aQ2KCCGTpA=;
 b=b+qNdktHenzDt55NzjC8FmB2+MvfVtu98gzqqa0pDv1kIFPUPcmX/7NwVtq1ypKi4c
 KazPvOpWZO9d4hkpSyEv14/OxKly26tsSdQAqcvID/ucLrpIN4Inw0+Q8WiQ1w+JfYeG
 8Q65SKLydAxKNJ/rfRj9H2KNKYdclHp2rgL0iHF2gxklZlBvG651b8WT0F6IzP6WY6W9
 bM0sgDv4z0abE0aoWChIwhFC13ttkxoH/bBLL9r3HcDBquKG5RPMiRGrzJ39TPE8VxZl
 Z0xJiLrL6qQcMAv3NyWSlBh/LFXJ3HqTDJgyzYw1dsE8HrzE2UqsXWw4b1ZDgntRYxfY
 q2eQ==
X-Gm-Message-State: AOAM5321SuUomiMbOlfVgyYOFZRLL0DbQmJy2irLpVtYw847XE+UhweG
 F3RdTIb9LlwTnWT+HWFWfzhxBHOUm0t0Ato6KGb1Mg==
X-Google-Smtp-Source: ABdhPJy21YHvs89PO7WpOwOgeU5JHZfVFc67pJu+B32806GRXR40BMRpnkKORh3jps7Ie0yXzJvcXANpt6yS4EdpV7E=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr9174872wmj.37.1631289662370;
 Fri, 10 Sep 2021 09:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA8EoyaCSzA1vL_SHY50T6Fxjm420_pYgXx1_+E-nV-MBA@mail.gmail.com>
 <906c738e-904c-99ba-b6ab-2556e9262c87@linaro.org>
 <CAFEAcA8-wj4TEQ+VKhVk8JuUW3xKA2NuJ2AnU=2ZTDdMfieuGA@mail.gmail.com>
 <dc5b66b4-4d34-6da9-ceb6-00eb524a070f@linaro.org>
In-Reply-To: <dc5b66b4-4d34-6da9-ceb6-00eb524a070f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 17:00:12 +0100
Message-ID: <CAFEAcA92sxy7bBQBH1A6oM36xVm1mpJMHGaS8KPB_0gW7vk30A@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 15:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
> >   * gen_update_fp_context() -- this function gets called for pretty
> >     much every FP/MVE insn (as part of vfp_access_check), and it
> >     can in rare cases update the FPSCR.LTPSIZE and the VPR. I guess
> >     this means we really do need to end the TB
> >     if (MVE && s->v7m_new_fp_ctxt_needed) (ie the comment in
> >     gen_update_fp_context "We don't need to arrange to end the TB,
> >     because [we don't cache FPSCR in TB flags]" is no longer true).
> >     That seems likely to be painful because some of the insns that
> >     do a vfp_access_check do complicated things with the TB exits
> >     (eg WLSTP, LETP) that are going to override a naive setting of
> >     is_jmp in gen_update_fp_context()...
>
> Well, we could let gen_goto_tb see that is_jmp is already UPDATE_NOCHAIN, and suppress the
> goto_tb in that case.  That would seem to take care of any entry into gen_jmp(_tb).

We actually already have code that sets is_jmp (to DISAS_UPDATE_EXIT)
from gen_preserve_fp_state() -- we do that if we're using icount,
setting DISAS_UPDATE_EXIT to force this to be the last insn in the TB.

Do icount IO instructions need to avoid a possible goto_tb ?
I suppose we do want them to go back to the main loop.

This suggests that we need to make gen_goto_tb() look at
the is_jmp value anyway, regardless of this series.

-- PMM

