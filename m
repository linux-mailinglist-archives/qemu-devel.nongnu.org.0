Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72BF4B9263
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:36:04 +0100 (CET)
Received: from localhost ([::1]:35966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKR1v-0003HX-50
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:36:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nKQzp-0001iA-VE
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:33:53 -0500
Received: from [2607:f8b0:4864:20::102d] (port=34807
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nKQzn-0005g0-VR
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:33:53 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 ki18-20020a17090ae91200b001b8be87e9abso4607786pjb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 12:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RbJRqWsddi9IfiBeXdggswwK+0sptc3tHrNIVoFIZTI=;
 b=WlnoD2lLYhypFOr0ihmW3+gWHS1gh0g6cD02ewEpn8ytLrzdK3zxpZjekJ1x82ma3m
 iXlEvzEZImaokJz84tFOQOQLvZUO2TK7FfPWBRio+JeiZGk4M3jX6sK1ESCxFtSn52bs
 KvX7nxkIOeFvXJq1C+GzzPvSHz64YVhmFuMUAjzno6uJdNqnhVfrmGZNw1OpvNVVOELV
 j9I+vnnm5xyKgQA7VsUQvXDTAaq2gDzpE8e1hwUt7fCByCVzIOwO3WSvXjVca+2PJVGC
 zr8jyC163pmsdEEpTbVCJ3mdYtPOqkDp7R5J/C7Jjh2ghgtxc0V2plK3bBFztvXpPz60
 2J8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RbJRqWsddi9IfiBeXdggswwK+0sptc3tHrNIVoFIZTI=;
 b=2Br/wOFDR//Gu0K0TzlVZAdAOB3nBQ5TydFcwYppY7F/p71oPBWpat29n0xeVxDSm3
 kBq4HhSGvxBh5mcceMS3Y6DbZWvLLat8W6i86BvfNq4agJp4z8NwugqFeqI+dUWa/7Wg
 vXSZ5qEsUOuoI3vFVcN+XJg6gdXwkDp/rCuDO8lwVkMjwODS35XR1Q+XWt3N6Rs0Pdi1
 OES7MP5NaLKtn6BidO2GIuWaV2OqIJ94ppYjW0fNkMY597gbgfb3egxJ9VY6GHgBcMBg
 18Do2Z1hE8FiicXtwodORgcCn40vqGuM5PrqITAkSl1CUVf9RzLgv/6IPoTjQsmqpdU1
 zDqg==
X-Gm-Message-State: AOAM530qd07VfhFO7Teo9riCj6rJ3N2laPOVWnxwStHNfrK27y8ZQSOQ
 FObOOHUg3Cg8w8JLF9GRv9wHOKtAj7kjgjdV3j0f6W/k
X-Google-Smtp-Source: ABdhPJx9KQE1PcNnRTww5WYMF4XZLdISLLDiOu/0OPEVS5xwX/GH81qeyuvJY7CG7CTYz+4r0ZO1F83LiH9CIa3WP8o=
X-Received: by 2002:a17:902:bc82:b0:14f:2b9c:4aa with SMTP id
 bb2-20020a170902bc8200b0014f2b9c04aamr538933plb.145.1645043630756; Wed, 16
 Feb 2022 12:33:50 -0800 (PST)
MIME-Version: 1.0
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
In-Reply-To: <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 16 Feb 2022 20:33:39 +0000
Message-ID: <CAJSP0QUOXwwBzXpBNhGb_uuxM8AqP2mOD_7tSSWoEhErdVnHNw@mail.gmail.com>
Subject: Re: Portable inline asm to get address of TLS variable
To: Florian Weimer <fweimer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Feb 2022 at 20:28, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Wed, 16 Feb 2022 at 18:14, Florian Weimer <fweimer@redhat.com> wrote:
> >
> > * Stefan Hajnoczi:
> >
> > > I've been trying to make the inline asm that gets the address of a TLS
> > > variable for QEMU coroutines pass QEMU's GitLab CI.
> > > https://gitlab.com/stefanha/qemu/-/blob/coroutine-tls-fix/include/qemu/coroutine-tls.h#L89
> > >
> > > The code isn't -fPIC-friendly (R_X86_64_TPOFF32 relocations aren't
> > > allowed in -fPIC shared libraries) so builds fail with ./configure
> > > --enable-modules. While I was tackling this I stumbled on this:
> > >
> > >   void *dst_ptr;
> > >   asm volatile("" : "=r"(dst_ptr) : "0"(&tls_var))
> > >
> > > What's nice about it:
> > > - It's portable, there are no arch-specific assembly instructions.
> > > - It works for both -fPIC and non-PIC.
> > >
> > > However, I wonder if the compiler might reuse a register that already
> > > contains the address. Then we'd have the coroutine problem again when
> > > qemu_coroutine_yield() is called between the earlier address calculation
> > > and the asm volatile statement.
> > >
> > > Thoughts?
> >
> > Sorry, I don't see why this isn't equivalent to a plain &tls_var.
> > What exactly are you trying to achieve?
>
> &tls_var, except forcing the compiler to calculate the address from scratch.
>
> The goal is to avoid stale TLS variable addresses when a coroutine
> yields in one thread and is resumed in another thread.

I'm basically asking whether the &tls_var input operand is treated as
volatile and part of the inline assembly or whether it's just regular
C code that the compiler may optimize with the surrounding function?

Stefan

