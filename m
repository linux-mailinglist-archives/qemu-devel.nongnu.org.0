Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5804D4D8ABD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:25:07 +0100 (CET)
Received: from localhost ([::1]:38638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToRO-0006y5-5H
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:25:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nToPK-0004QH-SB
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:22:58 -0400
Received: from [2607:f8b0:4864:20::f36] (port=35600
 helo=mail-qv1-xf36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nToPJ-0005sb-DW
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:22:58 -0400
Received: by mail-qv1-xf36.google.com with SMTP id jx8so12583243qvb.2
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z3S8Y8rfGkVGQwdX82DkyXRWe5leMgMynzaESeW9nW8=;
 b=CsfoAclFp7hjeIhATBZfaNHbkIf8/JjAy6ZrBSjDH4dL5X/tUI9U+8Rqg0ZNB8Qr5f
 rGBQPk7TLcwvp+rpqI1W4h0OWfbN8H2I2lvGFVyQ4us3SBnTNg7izAmSzOfYZWrUFq/g
 cw0JEW+GkArOkwQpWbseWsNJTU0X+k7c6gMvBhZ+uK5UFvmevHvOKhR7y0JmDl+EASK6
 rXXAEzPvfMKHBHxLZdiOu+IhwlLx/PZy3hDDNj497IW7tb28JZOiZIWVPQDU5Jkr5XMI
 lkJ/upJZ+d4Uv6B1lqO/3BGfQSQ9Z3myGFULkXmRpXIZNpv/KtuvMImlIFmrQ/NOsz0y
 qqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z3S8Y8rfGkVGQwdX82DkyXRWe5leMgMynzaESeW9nW8=;
 b=v5+qbI9BKrqrGT43MP37T/HADOuGagN/FjIycsr06iD5KehVWdsnSRm3mRbQFuVshj
 3KI+MKtBH8YPZW/PFb8gbI1opG5J7/bSLhZlsSQipcLqon7BXgJHWCRjazNPgejxgpFk
 ukawIpJ33Y5mZOmLIFwNEZ3+1iWMl7PTxVcKhnhhqHZYwt4Msnb0Rnsj2dIxkcSVYhcA
 Caf2aOG50RVrdptjSYvyFBybrCrdJt6/zwmfXvVfsUN4R8EBp19PMiKI9ZumBzRN+jzR
 P6NpF8xeajhSpSvFou4HSe6+bG2UnEqbl6sHRYhyAkCt1974v91B2Y6a4R6S31byLV5A
 wanQ==
X-Gm-Message-State: AOAM531kCVwRaBxBWAA4O3pv2JvnKIzykAf+pbWADev7XfUzUtAj4Q0k
 +faquuk8ih62CA2sdooF4Bn7dzOVpjCtksxFiaE=
X-Google-Smtp-Source: ABdhPJwzBo8JRZ4dZiidWhXLd8Qc7+TsNXUkBrw2G93aSNC5OMlAPTg0f/AG8FVa/SmRMXCMiIFNQ1MVxC6vD+XxssY=
X-Received: by 2002:a05:6214:2465:b0:43e:9638:3584 with SMTP id
 im5-20020a056214246500b0043e96383584mr9751984qvb.110.1647278576175; Mon, 14
 Mar 2022 10:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220314170223.554679-1-raj.khem@gmail.com>
 <CAFEAcA_SCwN3LpdADuYs7gTqgravOqDan-D6BrcAW_tb0omP8g@mail.gmail.com>
In-Reply-To: <CAFEAcA_SCwN3LpdADuYs7gTqgravOqDan-D6BrcAW_tb0omP8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Mar 2022 10:22:30 -0700
Message-ID: <CAMKF1sqRQOnHVUcM3MUnTtLQ0W3Xyr3DUKfbsXb82bjYv6v+Aw@mail.gmail.com>
Subject: Re: [PATCH] ppc: Include asm/ptrace.h for pt_regs struct definition
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=raj.khem@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Mar 14, 2022 at 10:05 AM Peter Maydell <peter.maydell@linaro.org> w=
rote:
>
> On Mon, 14 Mar 2022 at 17:02, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Fixes
> > ../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: =
incomplete definition of type 'struct pt_regs'
> >     return uc->uc_mcontext.regs->nip;
> >            ~~~~~~~~~~~~~~~~~~~~^
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  linux-user/include/host/ppc/host-signal.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/inc=
lude/host/ppc/host-signal.h
> > index b80384d135..43ee2eee3b 100644
> > --- a/linux-user/include/host/ppc/host-signal.h
> > +++ b/linux-user/include/host/ppc/host-signal.h
> > @@ -11,6 +11,10 @@
> >  #ifndef PPC_HOST_SIGNAL_H
> >  #define PPC_HOST_SIGNAL_H
> >
> > +#if defined(__powerpc__)
>
> Why is this #if defined() needed ?

yeah the define is redundant. I will send a v2

>
> > +#include <asm/ptrace.h>
> > +#endif
>
> What host distro are you building with? We do test ppc64be at least
> in our CI, and that builds OK.

I have a custom distro building with Yocto which is using musl C
library instead of glibc.
may be adelie linux or alpine will exhibit same issue

>
> thanks
> -- PMM

