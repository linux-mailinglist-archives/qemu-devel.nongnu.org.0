Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1A4B9248
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:31:05 +0100 (CET)
Received: from localhost ([::1]:59108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQx5-0007td-82
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:31:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nKQvE-0006pD-Dl
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:29:08 -0500
Received: from [2607:f8b0:4864:20::102d] (port=53882
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nKQvC-0004zf-9v
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:29:08 -0500
Received: by mail-pj1-x102d.google.com with SMTP id qe15so3528721pjb.3
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 12:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dguwGe1Kncim4kPjBAcoO7mVk/iTb1YdxWmSRpZq2zQ=;
 b=MzahiiT2Rf4BTNA1p8sGuRZluJI8iyyK9ol7DjxWZFZGfawBM3H6FnVfnCH8rrpkG+
 +R9YYHUJ+EqPPkcUDq+CH56pX5D4G7M7yto9Y14F1jJ+G9hoaPsvU+iTgxMEDnGELApD
 kCbuNvyOol/4hz6b89O4QIGXprWZLsElWDHquPZ7RqV8zlTzBpkEHXMT3dXbLHtfK90J
 nrpMEfVP8enI50uR7/HO75pfmgmB3jN9r+qbzYbTEnfxMDbet742kh09/5NFG7TQgsIm
 CjeYhC/cNiSldRdqche5jg4nKVo1aT4Psp9lqgCooocZvH3SMimIQxgFE+pWwhLzt6yd
 ix2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dguwGe1Kncim4kPjBAcoO7mVk/iTb1YdxWmSRpZq2zQ=;
 b=0XumpqIlPPYafQRS3OCg3flYsqh+albaJAkB3kfudz4cq+ncuQGBokzg/bIbMdEyp2
 Zha0mg/pMsp/PX/D/UDDz0cQwbpJ3+UCnyAsnu2mSsfVn4n8tmuu4w97PG+zBhUP8ghF
 G7bAGNsKeR2Aii6Uk2vpZKB/+UZEjCHb8tVOaVzMNElzfEb1wuSrZBHybnfgVH84CVMH
 jGKGOHJRrvmrP0SQerYHoZJEZ/hN5N1m0R9j1XvnS6Yv/IMhdAu6RRdJWukeq9PdGzuH
 WTrn0JPJZE0+hwtHbRtW3EgnKWHTFchG6+9zd7TLTNBmH+wcjLF8C5OcytbZbo0rwPZJ
 TADw==
X-Gm-Message-State: AOAM533PSNBuy7VxRu1IGJ+aqpFI7lPBg6NMjne2hPflJ1vVgteSsfHU
 TECMpXq9ToxVXpDuUK3+HIp0BGOp7QpktzsmGCE=
X-Google-Smtp-Source: ABdhPJwlU4nXS8PSag2zvEeLWHqPWtF6QQFmIEhIto7m9IzkBX5Xsv52ld7hw78Ks3ij1Qu9A3JslZZrffQdju8MGXI=
X-Received: by 2002:a17:90b:4ad2:b0:1b8:e050:c7e3 with SMTP id
 mh18-20020a17090b4ad200b001b8e050c7e3mr3747492pjb.83.1645043338167; Wed, 16
 Feb 2022 12:28:58 -0800 (PST)
MIME-Version: 1.0
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
In-Reply-To: <87leyaznm6.fsf@oldenburg.str.redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 16 Feb 2022 20:28:47 +0000
Message-ID: <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
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

On Wed, 16 Feb 2022 at 18:14, Florian Weimer <fweimer@redhat.com> wrote:
>
> * Stefan Hajnoczi:
>
> > I've been trying to make the inline asm that gets the address of a TLS
> > variable for QEMU coroutines pass QEMU's GitLab CI.
> > https://gitlab.com/stefanha/qemu/-/blob/coroutine-tls-fix/include/qemu/coroutine-tls.h#L89
> >
> > The code isn't -fPIC-friendly (R_X86_64_TPOFF32 relocations aren't
> > allowed in -fPIC shared libraries) so builds fail with ./configure
> > --enable-modules. While I was tackling this I stumbled on this:
> >
> >   void *dst_ptr;
> >   asm volatile("" : "=r"(dst_ptr) : "0"(&tls_var))
> >
> > What's nice about it:
> > - It's portable, there are no arch-specific assembly instructions.
> > - It works for both -fPIC and non-PIC.
> >
> > However, I wonder if the compiler might reuse a register that already
> > contains the address. Then we'd have the coroutine problem again when
> > qemu_coroutine_yield() is called between the earlier address calculation
> > and the asm volatile statement.
> >
> > Thoughts?
>
> Sorry, I don't see why this isn't equivalent to a plain &tls_var.
> What exactly are you trying to achieve?

&tls_var, except forcing the compiler to calculate the address from scratch.

The goal is to avoid stale TLS variable addresses when a coroutine
yields in one thread and is resumed in another thread.

Stefan

