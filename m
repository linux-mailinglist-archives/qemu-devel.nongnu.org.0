Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2F3EA4F6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 14:55:57 +0200 (CEST)
Received: from localhost ([::1]:36254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEAFY-0001MA-9Q
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 08:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEAEY-0000gn-LT
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 08:54:54 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEAEW-0001vF-Ub
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 08:54:54 -0400
Received: by mail-ej1-x630.google.com with SMTP id gs8so11307900ejc.13
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 05:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NSA3OHEWq63xjE8y1gk4b6gWMhjPHyfDq7jLbw/SXXM=;
 b=R/33qRMy/2DhNWFuwwWxlPP0ZSGH+7V9ghNcMCTPOXVxXiJZ9fXwRTrD+dLMPmVlQx
 uJVq8PvJzMMi77uAd+hGInKKmMtb0LCjt4VfD880aek5siKEqBsUs9IjLbgDwvpMzF2a
 qANZhjp2SJ90Yz0uw52X7pUVmbGYoxL577YUblvHb8dORafRnfXI8tE39IvwxU09haBt
 DGDEB8oHLuRl+qu7PVa1+sloz7a/TSzXeVBJpR9+3+p+i+xPSvRUtTskSFLsGfxy2tQX
 B1uiS7pK+fqtAScPXdusgbsNYFBIKM0uYz/mmcXxySy28jPzv7i5g816GW1uPv6sO8So
 FsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NSA3OHEWq63xjE8y1gk4b6gWMhjPHyfDq7jLbw/SXXM=;
 b=NRzrllvjt7YjFiHWqTzn94715TZKyjmdXX8UXebb245C1Oqi3gLScpIdMOrm4V8MkP
 XaEJiexgXjcHqz6gq4AuYfttqPSxsHVbHs9BdWPGGAXTDaNF7sk17QXrnD1A2icB7vFh
 cGfR9ZRw4DrHJErIKCAB8W9Qjrij4S3qVWHjXEXG90Yd071qge63heA9YsnClj+6eLrT
 9k58CPHQ9Hh9S11TmlWVydwoXv2zrHtezoQv4og+AgwzdPidzbKrbWNy+sKzcY49K4n6
 f0zaEwQmdXEPoV/BDk6M6iQaecyKPLCnCktEsOF4XSoxZcQnDsi9SSoAm9ZzIoQtnFtg
 Z4CA==
X-Gm-Message-State: AOAM531ahzSORcoJQ7OBy78NNJYhKJr9sN1ChAPZADT79XXDH/NcgzNE
 UFaHV4HM+BZvMh3OPLbGTnHYDy+3k9WCGFBZESV6EQ==
X-Google-Smtp-Source: ABdhPJzRnZp2qaxsXycxBA+Q2rHfglP83WjpM+NE2j/QuHXSkOf6NWYKiIwogSZ0+8W0crj1eoEtEc6TtWAwNx/Z/4w=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr3598869ejb.4.1628772891259; 
 Thu, 12 Aug 2021 05:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210812111056.26926-1-laramglazier@gmail.com>
 <1cdc5ffe-adc5-41ac-e588-b8eab62ecc76@amsat.org>
In-Reply-To: <1cdc5ffe-adc5-41ac-e588-b8eab62ecc76@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 13:54:06 +0100
Message-ID: <CAFEAcA9BwJ4A8bBDZ6cbrW5NHxPHrp5GLZgNVSa=xzZjQyXygQ@mail.gmail.com>
Subject: Re: [PATCH-for-6.1?] target/i386: Fixed size of constant for Windows
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Lara Lazier <laramglazier@gmail.com>,
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 12:38, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 8/12/21 1:10 PM, Lara Lazier wrote:
> > ~0UL has 64 bits on Linux and 32 bits on Windows.
>
> > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/512".
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/512
> Fixes: 3407259b20c ("target/i386: Added consistency checks for CR3")
>
> > Reported-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> > Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> > ---
> >  target/i386/tcg/sysemu/misc_helper.c | 2 +-
> >  target/i386/tcg/sysemu/svm_helper.c  | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sys=
emu/misc_helper.c
> > index 0a7a58ca9a..91b0fc916b 100644
> > --- a/target/i386/tcg/sysemu/misc_helper.c
> > +++ b/target/i386/tcg/sysemu/misc_helper.c
> > @@ -97,7 +97,7 @@ void helper_write_crN(CPUX86State *env, int reg, targ=
et_ulong t0)
> >          break;
> >      case 3:
> >          if ((env->efer & MSR_EFER_LMA) &&
> > -                (t0 & ((~0UL) << env_archcpu(env)->phys_bits))) {
> > +                (t0 & ((~0ULL) << env_archcpu(env)->phys_bits))) {
>
> Maybe safer to use extract64()? I'm not sure how many bits you want
> to check, so used TARGET_LONG_BITS:
>
>             extract64(t0, env_archcpu(env)->phys_bits,
>                       TARGET_LONG_BITS - env_archcpu(env)->phys_bits) {

The repetition of the 'phys_bits' expression in both the shift and the
length field is pretty awkward. Maybe

  t0 & ~MAKE_64BIT_MASK(0, env_archcpu(env)->phys_bits)

But for this bugfix I think just fixing the suffix is fine.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

> >              cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> >          }
> >          if (!(env->efer & MSR_EFER_LMA)) {
> > diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/syse=
mu/svm_helper.c
> > index 3891f4e4a8..42cd5053e5 100644
> > --- a/target/i386/tcg/sysemu/svm_helper.c
> > +++ b/target/i386/tcg/sysemu/svm_helper.c
> > @@ -290,7 +290,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int =
next_eip_addend)
> >      }
> >      new_cr3 =3D x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, =
save.cr3));
> >      if ((env->efer & MSR_EFER_LMA) &&
> > -            (new_cr3 & ((~0UL) << cpu->phys_bits))) {
> > +            (new_cr3 & ((~0ULL) << cpu->phys_bits))) {
> >          cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> >      }
> >      new_cr4 =3D x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, =
save.cr4));
> >
>
> Any idea how to avoid that class of bug? Some CFLAG or plain checkpatch?

In general the 'UL' is often dubious and worth checking --
either 'U' suffices or you wanted 'ULL'. But in a few places
where you're actually working with 'unsigned long' it's what
you need, so I'm not sure a checkpatch rule would be possible.

-- PMM

