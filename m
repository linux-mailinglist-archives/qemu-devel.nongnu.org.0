Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D41567FAF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:20:31 +0200 (CEST)
Received: from localhost ([::1]:60304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8zKo-0004PL-4P
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o8zIM-00031h-Kq; Wed, 06 Jul 2022 03:17:59 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o8zIK-00032b-C8; Wed, 06 Jul 2022 03:17:57 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-317a66d62dfso131126407b3.7; 
 Wed, 06 Jul 2022 00:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDHTdM4H5Ec/fs1JKO+lzsSXVN2A2uCcsN1/QQB/f8A=;
 b=Tiv0usmVgwJsGsdC53WYWI/67yyTEDgZzIUS62504w/Z7akuDBys7lNPuyyNO57r+a
 I0Ar54m1eN7cgq6ZdGXoepjthh6Va/8k8pE2HiZlvBSrdtbXdJJ3205Jxs/ZYSRObcxc
 hXyBWerPlyI7KmCZ3Q3nxQHH35nfxUfeNgm6yXada/6V+aPQMeOle74I4gIzwmUuqkpH
 gsQZcmy5Hr3/izifPRK11eBiLfrtIcWBjOWhkE9yDvHgcjWE80wPyeKXA/T3SB++Kbck
 CyY6z3mKUOvuoboyK2j3Mq4tq8bSrbQeviZAnfGWwbXRqVyyDbb7ZjNEXnqTvdsW3hun
 InVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDHTdM4H5Ec/fs1JKO+lzsSXVN2A2uCcsN1/QQB/f8A=;
 b=7Ldn1o+oumLnwxYZx6S9Pit+jdDq9uvfcf9dmM87umo0RqNhCvwUDcX5IieZVeUqjH
 KTWP/DM5kzAx/9rvg2C0X2muvpUZvTbKS/YbUMiiuGve0aR2TZbvWrcvvIfU0/VNAvT6
 tNYlrN0Ht1WM0QsOAHCQIji73hCOPJUQ8i+oJoSgDuJfWXfU2ju4WEaklh5o2uAwlKMp
 wky+sOoLbXG6t7pLx/mAqtGP6X6ppXcofSmyN9pIcni927Q8DT1Q94TTpcPPfMvKfNG7
 ftakn2rZxtnYPspD2RB2uOxrybvorAd1JGumBfrWxqgCBqaUUEU8dX5iF/h5KXe3xcd9
 oj8A==
X-Gm-Message-State: AJIora/bLI37O694UDo+VtZC4H/K354BHpU1IU9aDAHtlPrASeDO0/2M
 enHmUxeHvJTdiK2ns2aJSAp9Cy/M6BY8+tkS5APfBueJ3DE=
X-Google-Smtp-Source: AGRyM1uHIYYTBwWG0GBYC6oLCOnAUYcu74NeU1Y9GYD0TT4aukgOP7RdblGANfnPOIwhFDMxV4Kc4L/iHmBnzhHlCqA=
X-Received: by 2002:a0d:d993:0:b0:31c:b46e:ee9c with SMTP id
 b141-20020a0dd993000000b0031cb46eee9cmr11939100ywe.296.1657091874010; Wed, 06
 Jul 2022 00:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
 <20220630154921.ekl45dzer6x4mkvi@sgarzare-redhat>
 <Yr4pLwz5vQJhmvki@atmark-techno.com>
 <YsQ8aM3/ZT+Bs7nC@stefanha-x1.localdomain>
 <YsTAxtvpvIIi8q7M@atmark-techno.com>
In-Reply-To: <YsTAxtvpvIIi8q7M@atmark-techno.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 6 Jul 2022 08:17:42 +0100
Message-ID: <CAJSP0QUg5g6SDCy52carWRbVUFBhrAoiezinPdfhEOAKNwrN3g@mail.gmail.com>
Subject: Re: [PATCH v2] io_uring: fix short read slow path
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, 
 Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 qemu block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Filipe Manana <fdmanana@kernel.org>, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 5 Jul 2022 at 23:53, Dominique Martinet
<dominique.martinet@atmark-techno.com> wrote:
>
> Stefan Hajnoczi wrote on Tue, Jul 05, 2022 at 02:28:08PM +0100:
> > > The older kernel I have installed right now is 5.16 and that can
> > > reproduce it --  I'll give my laptop some work over the weekend to test
> > > still maintained stable branches if that's useful.
> >
> > Linux 5.16 contains commit 9d93a3f5a0c ("io_uring: punt short reads to
> > async context"). The comment above QEMU's luring_resubmit_short_read()
> > claims that short reads are a bug that was fixed by Linux commit
> > 9d93a3f5a0c.
> >
> > If the comment is inaccurate it needs to be fixed. Maybe short writes
> > need to be handled too.
> >
> > I have CCed Jens and the io_uring mailing list to clarify:
> > 1. Are short IORING_OP_READV reads possible on files/block devices?
> > 2. Are short IORING_OP_WRITEV writes possible on files/block devices?
>
> Jens replied before me, so I won't be adding much (I agree with his
> reply -- linux tries hard to avoid short reads but we should assume they
> can happen)
>
> In this particular case it was another btrfs bug with O_DIRECT and mixed
> compression in a file, that's been fixed by this patch:
> https://lore.kernel.org/all/20220630151038.GA459423@falcondesktop/
>
> queued here:
> https://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux.git/commit/?h=dio_fixes&id=b3864441547e49a69d45c7771aa8cc5e595d18fc
>
> It should be backported to 5.10, but the problem will likely persist in
> 5.4 kernels if anyone runs on that as the code changed enough to make
> backporting non-trivial.
>
>
> So, WRT that comment, we probably should remove the reference to that
> commit and leave in that they should be very rare but we need to handle
> them anyway.
>
>
> For writes in particular, I haven't seen any and looking at the code
> qemu would blow up that storage (IO treated as ENOSPC would likely mark
> disk read-only?)
> It might make sense to add some warning message that it's what happened
> so it'll be obvious what needs doing in case anyone falls on that but I
> think the status-quo is good enough here.

Great! I've already queued your fix.

Do you want to send a follow-up that updates the comment?

Thanks,
Stefan

