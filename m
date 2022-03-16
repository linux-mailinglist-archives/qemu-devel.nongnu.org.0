Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8F74DAD7A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 10:28:33 +0100 (CET)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUPxI-0007D8-Ry
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 05:28:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUPvF-0006FX-7r
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:26:25 -0400
Received: from [2607:f8b0:4864:20::112a] (port=33681
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUPvD-0003tl-GZ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:26:24 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2dbd8777564so16468977b3.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DiMqpjCe3RrI9JjqSM6hjybRDZv5hg0w/tVESSO+83M=;
 b=vkoqNC8GZ/mNSmV+SDwzV+hNUMivVftuvwEwBCkM78PyDXQJwcry8+EgdUWptBqcDO
 MLhtWFbcGU76GHSwI+OpX7nx7J3vc1Hxx78HY7UtF44vD+k7h/CYw4e2Gd9Hr4/nP6Aw
 UDKfYRTcsBof2NxseZi8CynaRqwmURmT7x/dGKuUzqMNCtONZbP6NEMHydKdcRzl43LS
 8RtjODRMxoBzyNLCyKx8ELQWn6l0o0JS6/+EVH6TxFXGKrimCCuzzej1o4wA78v72oSs
 1pAn0BDfL8bIBWUmyx9rl87tpIeJ5QeFruwSN9wOLu/WRvnDyy/Mzo72rm3FDVOwndiI
 NXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DiMqpjCe3RrI9JjqSM6hjybRDZv5hg0w/tVESSO+83M=;
 b=0CVR8tTM/6Y4tsCMSxEGMHqvtTtNIM4AoqXzjsK5+2GYzNmuovkbssIVG2wPSXbfWx
 o52ggb1MKYWw9GeViyuQcjplkOFyPdgIFk3HheNfXNfwDXeu6FGFLtB9dxY+dcTMk330
 6Uyb+i3PXd9VyeFUEnurY8Z0neZYFAh4wcRuCpAt+81AeyIvVD2/qzM86amEVZofau31
 eyTi8Ik2zbLHCNgt44Vzbqfi9XSJI6wjxxzKYw4f6uTSaYmtM8rLI+En/W185oBGko29
 pcCqSoFOB2Xk6pJ0ahhKlbj4bMUCXb7nqxKZr5fDzkGmsq7JD+I1d0SOZ3WZfz/pXGJh
 3gog==
X-Gm-Message-State: AOAM532R32zns220wAD7rUuQQeaRQfGO/VYe+jHv3fe/nMz/ayIiSzE+
 Tfa/WSzqnDBnLqRXbCxIot+RBTXECxe4C7WoQy16Tw==
X-Google-Smtp-Source: ABdhPJxyiKf1oGuSX3XEZC9nmqVMiDQRfV7gXXpWlUs8/SxwruoEw5D9zIYhAFI0VUXM6eC1mNTxv6L1MW84BthzgUQ=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr28337592ywh.329.1647422782353; Wed, 16
 Mar 2022 02:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220316040405.4131-1-adeason@sinenomine.net>
 <9c36fe6b-39e1-0bfc-d2bb-97b106828ee1@redhat.com>
In-Reply-To: <9c36fe6b-39e1-0bfc-d2bb-97b106828ee1@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2022 09:26:10 +0000
Message-ID: <CAFEAcA96=yDKOknYmCKriWDJe4g-q07+b8yL3tFUf9=G-o84zA@mail.gmail.com>
Subject: Re: [PATCH] softmmu/physmem: Use qemu_madvise
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Deason <adeason@sinenomine.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 at 07:53, David Hildenbrand <david@redhat.com> wrote:
>
> On 16.03.22 05:04, Andrew Deason wrote:
> > We have a thin wrapper around madvise, called qemu_madvise, which
> > provides consistent behavior for the !CONFIG_MADVISE case, and works
> > around some platform-specific quirks (some platforms only provide
> > posix_madvise, and some don't offer all 'advise' types). This specific
> > caller of madvise has never used it, tracing back to its original
> > introduction in commit e0b266f01dd2 ("migration_completion: Take
> > current state").
> >
> > Call qemu_madvise here, to follow the same logic as all of our other
> > madvise callers. This slightly changes the behavior for
> > !CONFIG_MADVISE (EINVAL instead of ENOSYS, and a slightly different
> > error message), but this is now more consistent with other callers
> > that use qemu_madvise.
> >
> > Signed-off-by: Andrew Deason <adeason@sinenomine.net>
> > ---
> > Looking at the history of commits that touch this madvise() call, it
> > doesn't _look_ like there's any reason to be directly calling madvise vs
> > qemu_advise (I don't see anything mentioned), but I'm not sure.
> >
> >  softmmu/physmem.c | 12 ++----------
> >  1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> > index 43ae70fbe2..900c692b5e 100644
> > --- a/softmmu/physmem.c
> > +++ b/softmmu/physmem.c
> > @@ -3584,40 +3584,32 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
> >                           rb->idstr, start, length, ret);
> >              goto err;
> >  #endif
> >          }
> >          if (need_madvise) {
> >              /* For normal RAM this causes it to be unmapped,
> >               * for shared memory it causes the local mapping to disappear
> >               * and to fall back on the file contents (which we just
> >               * fallocate'd away).
> >               */
> > -#if defined(CONFIG_MADVISE)
> >              if (qemu_ram_is_shared(rb) && rb->fd < 0) {
> > -                ret = madvise(host_startaddr, length, QEMU_MADV_REMOVE);
> > +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_REMOVE);
> >              } else {
> > -                ret = madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
> > +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
>
> posix_madvise(QEMU_MADV_DONTNEED) has completely different semantics
> then madvise() -- it's not a discard that we need here.
>
> So ram_block_discard_range() would now succeed in environments (BSD?)
> where it's supposed to fail.
>
> So AFAIKs this isn't sane.

But CONFIG_MADVISE just means "host has madvise()"; it doesn't imply
"this is a Linux madvise() with MADV_DONTNEED". Solaris madvise()
doesn't seem to have  MADV_DONTNEED at all; a quick look at the
FreeBSD manpage suggests its madvise MADV_DONTNEED is identical
to its posix_madvise MADV_DONTNEED.

If we need "specifically Linux MADV_DONTNEED semantics" maybe we
should define a QEMU_MADV_LINUX_DONTNEED which either (a) does the
right thing or (b) fails, and use qemu_madvise() regardless.

Certainly the current code is pretty fragile to being changed by
people who don't understand the undocumented subtlety behind
the use of a direct madvise() call here.

-- PMM

