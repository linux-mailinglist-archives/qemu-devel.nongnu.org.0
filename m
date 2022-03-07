Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5817B4D03CD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:15:44 +0100 (CET)
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRG1P-00083h-11
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:15:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRG02-0007Jt-FT
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:14:18 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=42542
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRG00-0001rk-TE
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:14:18 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id u10so12158972ybd.9
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c+kMBe2SWzoeWgrAmI5OtldNpHvUqJ83UOv4Up8k8Gs=;
 b=qr0p1u+nXGyB4zyZnXMRnVK1emChqF0mRGQW0L02F9vQWek8AJtJOtZZhs+9BDpktD
 uALWObIwZhU4opoqWDTlZVjqRw8bNdDou7Z9HUY1l8YAK3vOymX8hkA1XYVeltX0sEEe
 cMulltQvMWhL9IsLufmh8KSeVO3CibY9Wr9UxgdIM/uT6r7Bf1RqtLiEaI48Fna7bejN
 dzQAaxhe7xU4IR91JKofCWPV3EjF2WO/ugh/3g7htdmA7X4b5ZcWSKQcQJlUyyjVEA59
 tDasedeZXaDwN3mW2JkOMybSQm6QG2MlJqakR7ePTfxHl1BOH2w83ORfZHoQT4bJWVnO
 dFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c+kMBe2SWzoeWgrAmI5OtldNpHvUqJ83UOv4Up8k8Gs=;
 b=hHMUmhcN9vULkXxmYTjohq+lrzucJ2Tn+5CatLP7Fhhe2sULdh4haBeCrxZtRYb+r6
 9ZBpmbXb6VVkAxWW7Dk83k+NMyj9m1nmtGim+5JD/Zn604okaQPLv3sjGnF3rX1eqVK0
 z4YcJI+pHFxVQMmS7LSnz/z5OXUsZfTjDJZjxlBiF0sHx330q3UOn06Nv0/4ast7DvBM
 ygFzwnO7uA1fEcsTO1LxrIl5JNK4nlWWZ14/rHbBDgffleLxsX/6FLs1GR7PEtFLNJj6
 1q+KS+qvJzbit+90Zb6NaSLkY4kaCJm7r/QZoRDWCFy9TZ/SFuceMWJLGq04gERUmuOr
 peaQ==
X-Gm-Message-State: AOAM530skwlkZQvzyOQiyAyAkQvkJyiuSB9e6eWJnv1Y8xWcqze/Nw01
 UsthGJCUdcrOVMh36/I7hNRI91fjMLy1/8ZFvVW+vA==
X-Google-Smtp-Source: ABdhPJywZCGg8JXv0RYvRKIgcac1BbT/Vv3IzTqeaKmwd0kDu/VwAuHWHRJw9VsU7QYfKRD5la1Ce5mKLv5zXLahCm0=
X-Received: by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr7408491ybg.85.1646669655820; Mon, 07
 Mar 2022 08:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20220307151004.578069-1-pbonzini@redhat.com>
 <59f773ed-9a1f-10ff-637e-b41848aa534d@gmail.com>
In-Reply-To: <59f773ed-9a1f-10ff-637e-b41848aa534d@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 16:14:04 +0000
Message-ID: <CAFEAcA8XshU90eKJM_4+_mLRhUCN+ExWzCkPTveLht0bWBb8=w@mail.gmail.com>
Subject: Re: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 15:34, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> On 2022/03/08 0:10, Paolo Bonzini wrote:
> > Simplify the initialization dance by running qemu_init() in the main
> > thread before the Cocoa event loop starts.  The cocoa_display_init()
> > code that is post-applicationDidFinishLaunching: moves to the
> > application delegate itself, and the secondary thread only runs
> > the rest of qemu_main(), namely qemu_main_loop() and qemu_cleanup().
> >
> > This fixes a case where addRemovableDevicesMenuItems() calls
> > qmp_query_block() while expecting the main thread to still hold
> > the BQL.  The newly-introduced assertions in the block layer
> > complain about this.
>
> Hi,
>
> Thanks for this interesting suggestion. However I don't think this
> improves the situation much. The main contribution of this change is
> that elimination of display_init_sem but it is still necessary for
> command line usage of the executable.

The main benefit of Paolo's suggestion from my point of view is
that it entirely eliminates the odd situation where cocoa.m wants to
make calls back into QEMU code where it does not itself hold
the iothread lock in the current thread, but instead knows that
some other thread does and is waiting for it. Instead we end up
with a much more straightforward situation of "every time we
call into QEMU code we hold the iothread lock directly ourselves".

thanks
-- PMM

