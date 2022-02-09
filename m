Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBABD4AF000
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:35:37 +0100 (CET)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHlG4-0004RU-MN
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:35:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nHlCu-0002xS-Qo
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:32:20 -0500
Received: from [2607:f8b0:4864:20::231] (port=43823
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nHlCt-000726-4T
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:32:20 -0500
Received: by mail-oi1-x231.google.com with SMTP id t199so2081812oie.10
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W8y47BT++QZFlxt9QdLGDMGdGywec/j6ECeop08Bup8=;
 b=h+oADf0f/qn/lVJXI5h82S2fb9Ggac98eQoKwTw4uQoARjqh84824Ed7QNmRjK3GPB
 q4ifeJCdxvmXERh4orB3kUE1bXqYXMx0/k3IS1maGJ9CdUx+R4zLoXzY3YjX4xuanUKx
 V0lK4vgQGyhE4p4WxqYV8geVisOwJBEjdhhSdbE2ptvI4+ZjAFUHcwmyDkA0qtAF3Wso
 xKv9G+sIKHiE1sQi0e3kAq3x7L4DnFm3JWij1dvMQ/RtFjRRv1v3KeOwNcxymhloPaYy
 q+vGW1gcrMbNGaZ0Z5xpUnCF5paNiDhHiRR5WMVCESaegjjYHS/WD7V78fcyAz/8PQTO
 KWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W8y47BT++QZFlxt9QdLGDMGdGywec/j6ECeop08Bup8=;
 b=CzxxbN3CuLME/Cf1FaUMWFzuVhSom5P7WZEnL/pcdHu9t3b9k32YCKCj/QnU3KKen9
 t1KIrHRtR/nBLqNiJXRWrX2nE3SckSV7O026gq0amikBMnsPTcY8vwkg9YUElhbZHne7
 uRbCF8DlibrLhONPXpSj7hx2k4gqf+hKP8P5VERuMjNnM7QNPDpcNALqpOFr2dmuQw8E
 YOk9MU3RRD2nnRl0NU8dYY1s1rGoqIhogNuNF48MATAGp8EO329OO9cOGpZKmCvqJmrK
 4An9nfAf23jZIoHp1stMzV+xx8Ii8qbKBIPekJ3+9JR1lryYVTpA6099s8olu84KQizd
 t8/g==
X-Gm-Message-State: AOAM5312N+EeDzdNwpS5At0QZP0MsU7us04SMlfYpx3QanFnsKt0TmQw
 W9WiJeEtiK2eIrn2CSolhEeX6FL//i9yrWrEE9g=
X-Google-Smtp-Source: ABdhPJwLkVcfqA6JgLXtqLuGL7q4rwlTBXVnoAXMx0cTrfxzhOVAPo0sv4LHaDEVH20f32Pc7QYLnsgtzJcWdFkn4+I=
X-Received: by 2002:a05:6808:190f:: with SMTP id
 bf15mr1106980oib.40.1644406337992; 
 Wed, 09 Feb 2022 03:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20210616141910.54188-1-akihiko.odaki@gmail.com>
 <CAFEAcA8LFt5NpsVTE1dYpA3rW0RsjS1Nf9Q3iS307kaHjVS=1g@mail.gmail.com>
 <CAMVc7JXBn1uMkx=hj-DQo-TE777xrCZ98R8YxK+F5niUD6=nQA@mail.gmail.com>
 <CAFEAcA-_t+TVnqzgBk1ZM7xuq-ixAPxNNP3i-Z19HgmXs4EB=w@mail.gmail.com>
In-Reply-To: <CAFEAcA-_t+TVnqzgBk1ZM7xuq-ixAPxNNP3i-Z19HgmXs4EB=w@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 9 Feb 2022 20:32:07 +0900
Message-ID: <CAMVc7JWiuvn99mQTC81yGONGLUby-37aYbtqw2dg7YOjVmC48w@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Set UI information
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 9, 2022 at 3:07 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 5 Feb 2022 at 02:06, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >
> > On Sat, Feb 5, 2022 at 1:19 AM Peter Maydell <peter.maydell@linaro.org> wrote
>
> > > (1) A question for Akihiko:
> > > Are all the cocoa calls we make in updateUIInfo safe to
> > > make from a non-UI thread? Would it be preferable for this
> > > call in cocoa_switch() to be moved inside the dispatch_async block?
> > > (Moving it would mean that I wouldn't have to think about whether
> > > any of the code in it needs to have an autorelease pool :-))
> >
> > It is not safe. Apparently I totally forgot about threads when I wrote this.
> >
> > It should be moved in the dispatch_async block as you suggest. Should
> > I write a patch, or will you write one before you delete autorelease
> > pools?
>
> I'll write a patchset. If you have time to test it when I send it out
> that would be great.

Thanks, I will test the patchset soon after I receive it.

>
> Incidentally, I think the answer to my other question
> > > Is it safe to call dpy_set_ui_info() from a non-QEMU-main-thread?
>
> is "no, and so the body of updateUIInfo should be enclosed in a
> with_iothread_lock block".
>
> -- PMM

