Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B814361220
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 20:31:47 +0200 (CEST)
Received: from localhost ([::1]:53772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX6mI-0003wO-0f
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 14:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX6hz-0002Ye-Nw
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 14:27:20 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:42658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX6ht-0002Wh-LR
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 14:27:19 -0400
Received: by mail-ed1-x52c.google.com with SMTP id d21so9138279edv.9
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 11:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IIOzYFRrEszkfGJ4+in91ZapLj8ZvMtzVIZl/whfyEY=;
 b=sk6enY2YzsbCpYgnDNlKM+FfFdItaQDK14ZEr2xChKOfocQ4jd9eJAr3ok9iLlB7zl
 P1gDqpr9UMiyVdzvpUKePZKhrmYPp6NSGL3XA0qTc9aJU0ONnClTdgO5ov2EuNSKnv1Z
 bJPhuGuqbZP4XvW5dR5AQDi9UmC3CGTNbbPOGoJrVDLSaGdqLcD8auFJinwdVB95xWiK
 z1xiZFoUqcOihLs9jWuCCYWa1MgCpRAPE6ghfgIrDkmrBebNonKWOhlfnEOC4K8D1sjm
 QzIt07b6JQp7lXq5n3PrbUibVpNYI3g8W2x3XAzVDhHluvddBHx1L6MrI/wjjqnO+5dW
 7MxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IIOzYFRrEszkfGJ4+in91ZapLj8ZvMtzVIZl/whfyEY=;
 b=PNfhLTFWBtTk53yQi36P354j5JZGxi1Uw8BBytcN3KwxcEzTIPTQ9/v7iYjp1GknZ7
 Vu51z9IWktr1Fri3943q0YyVwWRkn79L70CNEZdED1/xJHCnIhXpiDVjcOzHUepHxx2H
 ZEOpLoqx1ZIUYz1tOkGkSOkJZVOOH4BVLiJZCcIMq2aF8Xsh5Q71ntVFZTuqPQF1xdAJ
 waEqH5j9fTalp6W0Vs66+G0sSatycf4SdQlsiDiU95oceNte4cJ+Mh2DdItT+gKnpx9m
 iNOIufMzNghFmzn+fBBWsEmbn3Koqq9+CZnKJI4F2HuXxiSncfVjzt4pRByKgb1kmjTf
 B+yg==
X-Gm-Message-State: AOAM532f3v5KmQM0LCbvNMel1fS+sbiVyuu65eFDgLn/Qti9YrWAhZtB
 z620VvsTbXcESqj+cLnbv+Ia76E+yGJiX4a9b3X3iw==
X-Google-Smtp-Source: ABdhPJzeUddC+8UrkTG65PgQaslu8ijg6iGS97FHHXNa9Z9ZJP969FaXa0mGyyjkmmm/PVCZlifYEgkw3dCVp+h7qdU=
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr2545743edd.52.1618511230798; 
 Thu, 15 Apr 2021 11:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210415162454.22056-1-alex.bennee@linaro.org>
 <CAFEAcA9vizqToQKBkMBfsk2SEKrgDo6F1KqET5vpntWUBY0Yrg@mail.gmail.com>
 <875z0nl8lo.fsf@linaro.org>
In-Reply-To: <875z0nl8lo.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 19:26:23 +0100
Message-ID: <CAFEAcA8E-+fn5VyfMLcMPZRPbCxeg4oMXFRjkEAhjEaO6fHxrw@mail.gmail.com>
Subject: Re: [RFC PATCH] accel/tcg: avoid re-translating one-shot instructions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 at 19:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 15 Apr 2021 at 17:25, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> By definition a single instruction is capable of being an IO
> >> instruction. This avoids a problem of triggering a cpu_io_recompile on
> >> a non-recorded translation which then fails because it expects
> >> tcg_tb_lookup() to succeed unconditionally. The normal use case
> >> requires a TB to be able to resolve machine state.
> >>
> >> The other users of tcg_tb_lookup() are able to tolerate a missing TB
> >> if the machine state has been resolved by other means - which in the
> >> single-shot case is always true because machine state is synced at the
> >> start of a block.
> >>
> >> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> ---
> >>  accel/tcg/translate-all.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> >> index ba6ab09790..b12d0898d0 100644
> >> --- a/accel/tcg/translate-all.c
> >> +++ b/accel/tcg/translate-all.c
> >> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
> >>
> >>      if (phys_pc =3D=3D -1) {
> >>          /* Generate a one-shot TB with 1 insn in it */
> >> -        cflags =3D (cflags & ~CF_COUNT_MASK) | 1;
> >> +        cflags =3D (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
> >>      }
> >>
> >>      max_insns =3D cflags & CF_COUNT_MASK;
> >> --
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Are you going to apply this directly or do you want it through a tree?

For the moment I've just added it to the list of "not fixed in 6.0 but
not quite meriting an rc4" items on the Planning page. If we need an rc4
I can apply it directly. (Though if you did whatever testing you'd do on
a pullreq that's beyond just "run it through gitlab" that would be
useful I think.)

thanks
-- PMM

