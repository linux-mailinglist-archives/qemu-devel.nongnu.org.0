Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD7057CAEF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:53:44 +0200 (CEST)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVgU-0007Ya-Mt
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEVYK-0005aL-Po
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:45:16 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:44844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEVYF-0007rH-LL
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:45:14 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31e7055a61dso15589807b3.11
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 05:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7fAbzGTmnfw22aCUOU6fD6t/bqESInd4QB8qmKm+vew=;
 b=rbhsh1YhdmgUwBCAGmWvijNWVESyagQmblZ38veEcuYcE6baUfDQjuWYN9QGrmgT76
 4ISfgRQWBur+wc9xe61IDKJA/p1LnAYeqZK2QBfNg2TPwd5UqXPGk2+wg3flwC3AzeH/
 enJCcz2567twgXn57tlrMjGRP5+rMn9jMoV2/OR5rfFwqllkS82gKSPJ+JAfSy0/zOf4
 eEfZGxjqCXsvLNYU5ih9NEzDec0u8gHPNR8Q3SbUMXZLMseu63zWvwQGJnHvKGz7V+Rb
 xs4QETQX3zUM7jAEywRzb0MxJ8kpN4xVWnxpN5ToilVM4hBaiwW/mwKapQAKzqrUnp7z
 nzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7fAbzGTmnfw22aCUOU6fD6t/bqESInd4QB8qmKm+vew=;
 b=RYCYw3HHVp1lvs/r5e4zqANdXlRxPSc3GxMhp80AGns0SpwQyawkQMPiQgD/tgOZqA
 L+sU6OGzl36/ybX/3gJyI3y0ytq3FAFRqk8pqF130gWz/TzIBNTT6Dygi6c0+ePbD6Ax
 tMJFyA1fdLbBeMVTwOcflCFeCj2kUeZgq6AY8QxLVFAAksyeJNonD7zFta6+y9jbsW0J
 Hw3hFlm/YS+G/EX5dtTkIQd8lX8x1scOmJeerJ5P4je4/+s2/sey2TGUPIzSeSyQWvRO
 qCDSKSkUPgdSz34BlFh+OVW7OgO0Iangh/sOy8EpNaC3EPTJEgOvh9d7gokHgSHzJbwX
 4cTQ==
X-Gm-Message-State: AJIora83l2vCKbzeHWf7Oc6reWeOQshHegKGZcwNAFcXJ+9pkZ1G5HtX
 DBiPscEMwGnkWrQqgnCFNa9VFSYZDoVpxLBCHv/Dtw==
X-Google-Smtp-Source: AGRyM1v30T5/KsLRMk5B3pL+bq8aoANZ5Cx5wI5TTovJ2TN4Eehr12D9rau35hXLAiWSH5jOpIAX27Hz97JZIzwqvPw=
X-Received: by 2002:a81:1116:0:b0:31e:7a03:5ea with SMTP id
 22-20020a811116000000b0031e7a0305eamr4029268ywr.455.1658407510223; Thu, 21
 Jul 2022 05:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220721115207.729615-1-peter.maydell@linaro.org>
 <20220721115207.729615-3-peter.maydell@linaro.org> <YtlBeDapF2xxtqbJ@work-vm>
In-Reply-To: <YtlBeDapF2xxtqbJ@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 13:44:30 +0100
Message-ID: <CAFEAcA9ooYEjhNYg5mWLDjHhq32_rYsWFrf7X+L8OLBJYiiM0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] migration: Define BLK_MIG_BLOCK_SIZE as unsigned long
 long
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 21 Jul 2022 at 13:07, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > When we use BLK_MIG_BLOCK_SIZE in expressions like
> > block_mig_state.submitted * BLK_MIG_BLOCK_SIZE, this multiplication
> > is done as 32 bits, because both operands are 32 bits.  Coverity
> > complains about possible overflows because we then accumulate that
> > into a 64 bit variable.
> >
> > Define BLK_MIG_BLOCK_SIZE as unsigned long long using the ULL suffix.
> > The only two current uses of it with this problem are both in
> > block_save_pending(), so we could just cast to uint64_t there, but
> > using the ULL suffix is simpler and ensures that we don't
> > accidentally introduce new variants of the same issue in future.
> >
> > Resolves: Coverity CID 1487136, 1487175
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > I haven't tried to analyse the code to see if the multiplications
> > could ever actually end up overflowing, but I would assume
> > probably not.
> >
> >  migration/block.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/migration/block.c b/migration/block.c
> > index 9e5aae58982..3577c815a94 100644
> > --- a/migration/block.c
> > +++ b/migration/block.c
> > @@ -28,7 +28,7 @@
> >  #include "sysemu/block-backend.h"
> >  #include "trace.h"
> >
> > -#define BLK_MIG_BLOCK_SIZE           (1 << 20)
> > +#define BLK_MIG_BLOCK_SIZE           (1ULL << 20)
>
> Is it a problem that this is passed to bdrv_create_dirty_bitmap that
> takes a uint32_t ?

Shouldn't be -- the constant value still fits within 32 bits.

-- PMM

