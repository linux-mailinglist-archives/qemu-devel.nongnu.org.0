Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A34677B24
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:38:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJw55-0004Xz-Sc; Mon, 23 Jan 2023 07:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=8ZYY=5U=zx2c4.com=Jason@kernel.org>)
 id 1pJw53-0004XX-Fy
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:37:45 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=8ZYY=5U=zx2c4.com=Jason@kernel.org>)
 id 1pJw51-0008HU-AC
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:37:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 71260B80CB1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 12:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EC5C4339C
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 12:37:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="F4Y8Xr0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1674477453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L3miQvQC0cZlIZi6tyTVnWDly9nWp+4Dd9TAq9R8CDw=;
 b=F4Y8Xr0ojToFRfRSnQpsVyFFLkDQV3FV+olu+UOpTxgk295GxxvOIOmxqBfg7+Mvve9ZYj
 AmRXljNpxMvf34Wsp3JJgnpwBIAkVYsmwk/Gus28fjrz3lNvvtu0cf0K8GtBvQYtJLU6f/
 V05Lg/HXdwmya/lwoF6dqtIydpPuHN0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 34c6d90d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 23 Jan 2023 12:37:33 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-4fd37a1551cso144613097b3.13
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 04:37:33 -0800 (PST)
X-Gm-Message-State: AFqh2krKkmIqmGV9HV27Pv5glhVsv3iaQTKY7209Gu+b2bdhUHfXpIqu
 xCuFV4dhIrnUw63Qy5Mq4GX6P7JBOqHmTNPTywI=
X-Google-Smtp-Source: AMrXdXtR9UhOqU7K6MuJdZEkZJsgFbTCVEcgedPwnSE79WpNZOkqUxwN43hiS7wpa/l2KTcBMK0Qg3uVXGSy8CRIS2I=
X-Received: by 2002:a0d:dd4f:0:b0:501:4be5:7457 with SMTP id
 g76-20020a0ddd4f000000b005014be57457mr1239128ywe.79.1674477452485; Mon, 23
 Jan 2023 04:37:32 -0800 (PST)
MIME-Version: 1.0
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
 <Y72FmQlNwBsp8Ntc@zx2c4.com> <20230110125005-mutt-send-email-mst@kernel.org>
 <Y84LSgtrq1Rq3ItD@sol.localdomain>
 <20230123071128-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230123071128-mutt-send-email-mst@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Jan 2023 06:37:21 -0600
X-Gmail-Original-Message-ID: <CAHmME9qXnA=0tBwXe=S=X_LzdBa0irDbWNSNnTdUHSQYJkfPpQ@mail.gmail.com>
Message-ID: <CAHmME9qXnA=0tBwXe=S=X_LzdBa0irDbWNSNnTdUHSQYJkfPpQ@mail.gmail.com>
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 pbonzini@redhat.com, 
 Mathias Krause <minipli@grsecurity.net>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=8ZYY=5U=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 23, 2023 at 6:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sun, Jan 22, 2023 at 08:21:30PM -0800, Eric Biggers wrote:
> > Hi Michael,
> >
> > On Tue, Jan 10, 2023 at 12:50:42PM -0500, Michael S. Tsirkin wrote:
> > > On Tue, Jan 10, 2023 at 04:34:49PM +0100, Jason A. Donenfeld wrote:
> > > > Hi Michael,
> > > >
> > > > Could you queue up this patch and mark it as a fix for 7.2.1? It is a
> > > > straight-up bug fix for a 7.2 regression that's now affected several
> > > > users.
> > >
> > > OK. In the future pls cc me if you want me to merge a patch. Thanks!
> > >
> > > > - It has two Tested-by tags on the thread.
> > > > - hpa, the maintainer of the kernel side of this, confirmed on one of
> > > >   the various tributary threads that this approach is a correct one.
> > > > - It doesn't introduce any new functionality.
> > > >
> > > > For your convenience, you can grab this out of lore here:
> > > >
> > > >   https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/
> > > >
> > > > Or if you want to yolo it:
> > > >
> > > >   curl https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/raw | git am -s
> > > >
> > > > It's now sat silent on the mailing list for a while. So let's please get
> > > > this committed and backported so that the bug reports stop coming in.
> > > >
> >
> > This patch still isn't on QEMU's master branch.  What happened to it?
> >
> > - Eric
>
> Indeed though I remember picking it up. Tagged again now. Thanks!

Thanks. What branch is this in? I didn't see it on:
https://gitlab.com/mstredhat/qemu/-/branches/active
https://github.com/mstsirkin/qemu/branches

