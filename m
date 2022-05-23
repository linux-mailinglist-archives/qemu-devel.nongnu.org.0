Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0656531526
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 19:00:43 +0200 (CEST)
Received: from localhost ([::1]:56016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntBQ9-0003jn-JO
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 13:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntBNz-0002Ih-MB
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:58:27 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:41453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntBNx-0001q7-CQ
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:58:26 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ff53d86abbso136005127b3.8
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 09:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EA6rV519QgbUNFJOh812VdHsM185mNz8b8JcTXpakM0=;
 b=LwiWYWEmYq+P3RTO2brQ7JqUEsyLVa61vyUtSeOSQsEm4EC+zHtU4GlpLfYsO9ji6N
 Mtw7T8i4GCJuRWh07zI4UJwLWSRJdpoVLhmg7RsMF+XYGS6htiGUIMbS7Jx0uO9Kf8Wt
 Qup2nDTRpNPrvaE5ieWeYJiMd1n1ZmVUv2CUZFhhtjc2Zpndz82ygNIg49gDC4jX43MT
 X9GGQPqvwhyEDnK6cz56Y+AvoznM7JnhD58/i5AFQnWUfRLwTZPxIm/EzJGf/0QZmNaW
 r88eCRKBjv0ww764TrjxVhFFJWgE09kdcyZIvT/y6zif5VFW35chKIzUb4NYwFzYZODy
 Kv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EA6rV519QgbUNFJOh812VdHsM185mNz8b8JcTXpakM0=;
 b=Nm9NxDlG33JMnHboYD+4O2rIMDTSyriBCt0h/H4mQO3GIS81ii1DcP1856S2pefaOY
 A2No7cvN3pu8qqtOxTQachKt8zKAPpc204U4z9wNT7MsnLUYW7KVm1lspdQdEUyw5aAd
 yrNUZRgBew1D0yvx8I8+8xJR51wyfsvS3umLarrHFODrBhJNgLxUocRtOb2TcMZtuBLO
 ArvBd/w7BD6W4HIFqI4ZVsEEaDchT66OiqgZ/B/UHkomHI8tZyu8DTz6wJRCds12CaE1
 gmoWeO5eRBo4NU2sKE5eEgdN7kdicUdXsqnp4jr+k78JgelStJ2Y+jWTF8+Kn1+6fa0e
 Z+Sw==
X-Gm-Message-State: AOAM531ualf6iO6iky9Ac+ZdJiIvo0h7vVv9k7bHjJ0yu9HrGgzHHcw2
 GTUty+xrMKvLKNR+lIttJxuJ7vpV5O4voEQIUJ/NeQ==
X-Google-Smtp-Source: ABdhPJz+yEsNApT+Nb8rBGcBIAjlLKHAc1n12FHJ2+KrHW2F/mOMgBgdY2k4VH0dxhLMAsdvRcoNlvpOMB84nOm+/EQ=
X-Received: by 2002:a0d:e903:0:b0:2ff:43a3:90c8 with SMTP id
 s3-20020a0de903000000b002ff43a390c8mr23984488ywe.455.1653325104264; Mon, 23
 May 2022 09:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-9-richard.henderson@linaro.org>
 <CAFEAcA8oja0sCwyCZgmCMW-y7fXTGhYrOvZAyz4LHtPH9CKzLw@mail.gmail.com>
 <763bccc7-ca4e-aa6d-730f-90e0cc806cf4@linaro.org>
In-Reply-To: <763bccc7-ca4e-aa6d-730f-90e0cc806cf4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 17:58:13 +0100
Message-ID: <CAFEAcA_dswJ4Eu5ej+Fd-tVEFoGcTnpmoZXV_z3On0bP3rnBcw@mail.gmail.com>
Subject: Re: [PATCH v3 08/49] semihosting: Inline set_swi_errno into
 common_semi_cb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Mon, 23 May 2022 at 15:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/23/22 03:58, Peter Maydell wrote:
> > On Sat, 21 May 2022 at 01:04, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Do not store 'err' into errno only to read it back immediately.
> >> Use 'ret' for the return value, not 'reg0'.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   semihosting/arm-compat-semi.c | 19 ++++++++++---------
> >>   1 file changed, 10 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> >> index c6bfd4d1ba..b00ed2c6d1 100644
> >> --- a/semihosting/arm-compat-semi.c
> >> +++ b/semihosting/arm-compat-semi.c
> >> @@ -290,28 +290,29 @@ static target_ulong common_semi_syscall_len;
> >>
> >>   static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
> >>   {
> >> -    target_ulong reg0 = common_semi_arg(cs, 0);
> >> -
> >>       if (ret == (target_ulong)-1) {
> >> -        errno = err;
> >> -        set_swi_errno(cs, -1);
> >> -        reg0 = ret;
> >> +#ifdef CONFIG_USER_ONLY
> >> +        TaskState *ts = cs->opaque;
> >> +        ts->swi_errno = err;
> >> +#else
> >> +        syscall_err = err;
> >> +#endif
> >>       } else {
> >>           /* Fixup syscalls that use nonstardard return conventions.  */
> >> +        target_ulong reg0 = common_semi_arg(cs, 0);
> >
> > This should be "ret = ", right? (Otherwise I think this fails to
> > compile. I assume that some later patch has this fix in it.)
>
> Eh?  No, we're extracting argument reg 0, and then switching on it.
> Why would it not compile -- I've moved the whole declaration down.

Yes, you're right -- I misread the diff as doing a rename of
'reg0' to 'ret', but these are different variables and both
present both before and after the change.

-- PMM

