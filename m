Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31104D8B56
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:08:05 +0100 (CET)
Received: from localhost ([::1]:34526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTp6y-0003bo-WD
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:08:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTp5H-00025B-Ke
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:06:23 -0400
Received: from [2607:f8b0:4864:20::b29] (port=38878
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTp5F-0004Ca-SI
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:06:19 -0400
Received: by mail-yb1-xb29.google.com with SMTP id u3so32430154ybh.5
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 11:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qUNtbjsVM7lx7mPI0zLuooqVyF2NBF2Y7O7bzc7kyfg=;
 b=mOZ1EsG5rlupI9QaqKz+XEBjHb39kdlNSfBcFBqneoO3UclpcmCT+TWKqs0nqfltGs
 ZkLTLszF8HpYRQTuvdQHlU4euzyOyqNIhVUIFMJ6yY06+IX5KlbSd0Go3lb9z3BzqaEJ
 OhYrjldTegXY4N8V2c2jSGWOw11yj+h/AofpgKdOvGn3caQ8+PEdDPKtdRzpp1s+BkbA
 xAmV9wOqEoqGUr91O9nSQoalReTUUEuDNIzuMfgsn/nDpipwh6npOaiBA4v5lJtpvwn4
 KRhRaDnyTNObzR3Q8+j8BNSylk/1eT/AS/w5zdk/DQG9eFn+nqWMwivkD87F81Y+5NwT
 14uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qUNtbjsVM7lx7mPI0zLuooqVyF2NBF2Y7O7bzc7kyfg=;
 b=tuNbm8AAai3cma+39ZLWEEg8V9DgZI0lskO5O4jmAqm87qXEwoNoB43pRppnscjSX3
 DRrEEpKUlGCXAlDesn3FEOzlwpV6ErRhpxN0O1S42zE/g4Q+VUDEMxtS+ZLc6kPFZY3R
 BCUfOV+gqxg+zDIWvmO3TjjBlVD5dFiewiTp48I7mpWds843GQvy0L0ufICGyFFP6CGe
 dw8rPKNp4wOq7SdQAnBykzbZLFr39Mg8ncfaO7RCvVl61D/F4mhiz0j/Hnz5d42FR49t
 bIupkK1WhWQ5ARpaol6+4XBxUBUTINM+iY7vxCXWtY/eJQ/28XlMcBWarfg76TU8mK8f
 VSQQ==
X-Gm-Message-State: AOAM533CgmPOR3Omz0cNJ3JTepyPghzhV6M+nBsKOF+MLCFLuA0doXyk
 gWDAnsJ7nepOOd/VAbDk/NwakDdwikCCgTeO7s81/Q==
X-Google-Smtp-Source: ABdhPJzwHzjMOwNr9smD/F4DHizcT3+GfRCyVL78szVEDZ0pYPSTXU7yKZ6HlnKzbPM5FFZGg9vmaFZ5b9Tl5HxFswU=
X-Received: by 2002:a25:b11c:0:b0:62c:16d9:c028 with SMTP id
 g28-20020a25b11c000000b0062c16d9c028mr19401843ybj.288.1647281176626; Mon, 14
 Mar 2022 11:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220314170223.554679-1-raj.khem@gmail.com>
 <CAFEAcA_SCwN3LpdADuYs7gTqgravOqDan-D6BrcAW_tb0omP8g@mail.gmail.com>
 <CAMKF1sqRQOnHVUcM3MUnTtLQ0W3Xyr3DUKfbsXb82bjYv6v+Aw@mail.gmail.com>
In-Reply-To: <CAMKF1sqRQOnHVUcM3MUnTtLQ0W3Xyr3DUKfbsXb82bjYv6v+Aw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 18:06:05 +0000
Message-ID: <CAFEAcA87zZ8JoSk-1b6R8DYs255BzjNeP=HVbFEAs8yXByhQ6w@mail.gmail.com>
Subject: Re: [PATCH] ppc: Include asm/ptrace.h for pt_regs struct definition
To: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 17:22, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Mar 14, 2022 at 10:05 AM Peter Maydell <peter.maydell@linaro.org>=
 wrote:
> >
> > On Mon, 14 Mar 2022 at 17:02, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Fixes
> > > ../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error=
: incomplete definition of type 'struct pt_regs'
> > >     return uc->uc_mcontext.regs->nip;
> > >            ~~~~~~~~~~~~~~~~~~~~^
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > Cc: Richard Henderson <richard.henderson@linaro.org>
> > > ---
> > >  linux-user/include/host/ppc/host-signal.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/i=
nclude/host/ppc/host-signal.h
> > > index b80384d135..43ee2eee3b 100644
> > > --- a/linux-user/include/host/ppc/host-signal.h
> > > +++ b/linux-user/include/host/ppc/host-signal.h
> > > @@ -11,6 +11,10 @@
> > >  #ifndef PPC_HOST_SIGNAL_H
> > >  #define PPC_HOST_SIGNAL_H
> > >
> > > +#if defined(__powerpc__)
> >
> > Why is this #if defined() needed ?
>
> yeah the define is redundant. I will send a v2
>
> >
> > > +#include <asm/ptrace.h>
> > > +#endif
> >
> > What host distro are you building with? We do test ppc64be at least
> > in our CI, and that builds OK.
>
> I have a custom distro building with Yocto which is using musl C
> library instead of glibc.

Ah, musl. I found this gcc mailing list post from one of the musl
upstream developers:
https://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg281012.html

where he suggests a different approach involving uc_regs->gregs[32]
for ppc32 and uc_mcontext.gp_regs[32] for ppc64.

Richard: any opinion on that idea ?

-- PMM

