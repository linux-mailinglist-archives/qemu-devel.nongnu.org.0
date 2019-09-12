Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90842B0D34
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 12:50:41 +0200 (CEST)
Received: from localhost ([::1]:60852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8MgS-0003w5-Mq
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 06:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i8MfJ-0003DZ-6T
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:49:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i8MfH-0003mm-Vl
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:49:28 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41510)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i8MfH-0003mQ-Qo
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:49:27 -0400
Received: by mail-oi1-x242.google.com with SMTP id w17so3502530oiw.8
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 03:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q5VTwor9a7Dn86swCsiRvDfmvYRINwG/MuN+Q6rb6c0=;
 b=ZFVuNOhdWOMGw4vLRYoYmn6zZW5WNqbVlhCU7CpekwVTc9opa75uXKNsgrtUHSMlF0
 g4LOScCdvxw1aLY+n8mTdea1HQDxJtju92JAxv+U4/uW6yvEvUDstRlaWS+JCmHrGFZA
 j4AXRUBB405apnV406Hi/Cdtal7JJ5DcHc8rgGVwlAeBZko8e3OQX2bb6Nbffa+TMbMl
 RhzrECkr8/NpJGmh+kKvzJfL2zyRKExJDYInuf6IP0Ud/t8whi4mhA2Akje2DCgGfuqH
 jF6EPhFjAOSr3le44xjLaYDHlClER5QHylD8980Acpnyr6ep10TwHfILvLTBggVmBJAj
 1T4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q5VTwor9a7Dn86swCsiRvDfmvYRINwG/MuN+Q6rb6c0=;
 b=DtdPZ1Zt8OB37RRMJgzL/P29q8CiCUo0qqXBFJozJa9rbtwIzyZcSBsKjId8cLFq9Y
 0PfG0hgCS3VNcVUiUVxtGoqNS92191XE5YEVOoJfzSI8miaVpAr9FZiJxx3LxL9w52Kw
 ls/rK8DkIEqB1q0bHKbKK+3Gci9Xqh2r4R5qUOZPtgpFPH84AWun6DRij4ab22U8BYMb
 8m3jyf/Fj3Qv42ttfJuTJ/quawKkhNC0I5LyAwWTAuxb8VQPY728A/BAdeA9Zte4oKAf
 vtkfqnSsJXQbzi9jTlRQaQjv1aDtEkNvsqOHVG8BhqQ8x+J0DLAyWTmhjC6jBhS55TpR
 Csyg==
X-Gm-Message-State: APjAAAXP4uOOPmUNILOlyqAEZpNd6u+MIMOIdbq0QnQkkyuMzVsMqB9q
 WjCzLtuUYuUESSbDpjurGXPCozZVzxSsuOB4bA2z+g==
X-Google-Smtp-Source: APXvYqybicLU/HyCGtPQ+nT6kvw/451OvMd03DBcgSH5JLghhjpvI5LIPGkn/S7A7SktuGPoKPWGE+pyzrEF/rXO5xc=
X-Received: by 2002:aca:b48a:: with SMTP id d132mr8067340oif.98.1568285366213; 
 Thu, 12 Sep 2019 03:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-2-peter.maydell@linaro.org> <87sgp1ztll.fsf@linaro.org>
In-Reply-To: <87sgp1ztll.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 11:49:15 +0100
Message-ID: <CAFEAcA_J6i_ui4ZOUxDy5U-O1zCt+1wCDwU6O3T+c7ZzF10drA@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 01/13] target/arm/arm-semi:
 Capture errno in softmmu version of set_swi_errno()
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

On Thu, 12 Sep 2019 at 11:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The set_swi_errno() function is called to capture the errno
> > from a host system call, so that we can return -1 from the
> > semihosting function and later allow the guest to get a more
> > specific error code with the SYS_ERRNO function. It comes in
> > two versions, one for user-only and one for softmmu. We forgot
> > to capture the errno in the softmmu version; fix the error.
> >
> > (Semihosting calls directed to gdb are unaffected because
> > they go through a different code path that captures the
> > error return from the gdbstub call in arm_semi_cb() or
> > arm_semi_flen_cb().)
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > NB that a later commit will put in some cleanup of TaskState
> > that will let us reduce the duplication between the two
> > implementations of this function.
> > ---
> >  target/arm/arm-semi.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> > index 90423a35deb..03e60105c05 100644
> > --- a/target/arm/arm-semi.c
> > +++ b/target/arm/arm-semi.c
> > @@ -114,8 +114,13 @@ static inline uint32_t set_swi_errno(TaskState *ts=
, uint32_t code)
> >      return code;
> >  }
> >  #else
> > +static target_ulong syscall_err;
> > +
>
> I appreciate that this is just moving things around but this will be
> broken for -smp > 1 if two vCPUs make a syscall at the same time. For
> linux-user this information is kept in ts->swi_errno which is
> per-thread. Either we need a __thread version or find somewhere in
> CPUARMState to store it.

The semihosting API has no concept of errno being per-CPU at all.
(It really predates SMP entirely, so nobody was thinking about
that, and in any case it's a debug API, not a serious-work one).
The assumption is that the guest is handling this somehow.

The errno interface is not very useful anyway since it doesn't
actually define any errno values, and it's even worse in our
implementation because we use the host errno values rather
than defining some clean target-specific set of values...

thanks
-- PMM

