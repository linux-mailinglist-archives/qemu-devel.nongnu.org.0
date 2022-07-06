Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477CA567FAA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:19:19 +0200 (CEST)
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8zJd-00032X-Sr
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o8zGm-0002Cj-FO; Wed, 06 Jul 2022 03:16:20 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:33371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o8zGk-0001pa-OW; Wed, 06 Jul 2022 03:16:20 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id 76so10267680ybd.0;
 Wed, 06 Jul 2022 00:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XKqBn4LHqHQz+7eiTYx6Guo+XYS+/p+1Z90N9l9lsqc=;
 b=Xa8Xs+3KIfbAIuZ5qKrFg7h2ojPkVj4b0IbDW9UrgjzSQsGtCG/5Cq4UaOBwma6Ha4
 rwg6TtdtYujxjq9RCK2o4vC9Oz2pmRSAMqhqLJNSGodlYWKIQM1nQl6kT4LkdEkTsPQt
 ZYhFcyh0TX4fH6LearuPYG/u+u//9+cZLgo8WOA0S0f9ri7Pk1syR4gxXMghVGYwsPxk
 DjRf65Pc5rpUJKIG4/qznihl8VBCn77obuPS7S0hWUAhSEchgSUEAcf3AQccNR9lsFHT
 06P2LU4DI7zJDmBiEmC23fFwfgBEzy9VTwxTRwOZ2T1Co+mxrhWhzupm7xLxvNuUJ87D
 oQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XKqBn4LHqHQz+7eiTYx6Guo+XYS+/p+1Z90N9l9lsqc=;
 b=vHPjO6kfa+eRJH4BVs4FCAM8ECtfblrp7hsgiMXtloP9ejXpMf6Cns3yCdY9ZvwNoj
 ko0VCVx/70REbdBGIsTfCdVEYl/ABmU6zqiwuIaXWYQpzuzzWdPlm1l5A1iUvg90g6qu
 ZnPvrZfuel2Ys48pur9nrUyVPbSBGOP5LbYTMAoJgvv+q4rMbR9Z5aj7JqLIE3cjVYzy
 OQXugM+YGcVVbrEExVEAOgapzWkF+LRuk/pG7qZ/v4Y7kHKhbf2bVtlGYkBUHm6EHoRB
 Si266eXtXgYipCjBzzyemOYPOkN3OpHIEkexrmXPSVnA+7M3XPXEuubV+FKX00GYejdL
 h/QQ==
X-Gm-Message-State: AJIora+4Iv++NSl+O8okpjyQo7LvCJU46QqJOFqStjRTXBbqXAWQR5sh
 SDDJJzltygBeZQzkzyfy2VenMwbFy6ELlcUQTnE=
X-Google-Smtp-Source: AGRyM1uwinWDvG9yfzq/egIWqu32fFebRZsYA+tc+QZIO1OuEQtJlGxGvKZyYrLwZJQB4NWIyi3FVnfjB5Gcy1L09ss=
X-Received: by 2002:a25:f81e:0:b0:66e:30d4:a31 with SMTP id
 u30-20020a25f81e000000b0066e30d40a31mr21467901ybd.209.1657091775336; Wed, 06
 Jul 2022 00:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
 <20220630154921.ekl45dzer6x4mkvi@sgarzare-redhat>
 <Yr4pLwz5vQJhmvki@atmark-techno.com>
 <YsQ8aM3/ZT+Bs7nC@stefanha-x1.localdomain>
 <e9bbbeb5-c6b9-8d19-9593-b2c9187a5d98@kernel.dk>
In-Reply-To: <e9bbbeb5-c6b9-8d19-9593-b2c9187a5d98@kernel.dk>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 6 Jul 2022 08:16:02 +0100
Message-ID: <CAJSP0QWnw7q_TScW+3g+jwYpjRX922cL4KafUit5oFNWtqRvfA@mail.gmail.com>
Subject: Re: [PATCH v2] io_uring: fix short read slow path
To: Jens Axboe <axboe@kernel.dk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, 
 Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 qemu block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Filipe Manana <fdmanana@kernel.org>, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2f.google.com
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

On Tue, 5 Jul 2022 at 20:26, Jens Axboe <axboe@kernel.dk> wrote:
>
> On 7/5/22 7:28 AM, Stefan Hajnoczi wrote:
> > On Fri, Jul 01, 2022 at 07:52:31AM +0900, Dominique Martinet wrote:
> >> Stefano Garzarella wrote on Thu, Jun 30, 2022 at 05:49:21PM +0200:
> >>>> so when we ask for more we issue an extra short reads, making sure we go
> >>>> through the two short reads path.
> >>>> (Unfortunately I wasn't quite sure what to fiddle with to issue short
> >>>> reads in the first place, I tried cutting one of the iovs short in
> >>>> luring_do_submit() but I must not have been doing it properly as I ended
> >>>> up with 0 return values which are handled by filling in with 0 (reads
> >>>> after eof) and that didn't work well)
> >>>
> >>> Do you remember the kernel version where you first saw these problems?
> >>
> >> Since you're quoting my paragraph about testing two short reads, I've
> >> never seen any that I know of; but there's also no reason these couldn't
> >> happen.
> >>
> >> Single short reads have been happening for me with O_DIRECT (cache=none)
> >> on btrfs for a while, but unfortunately I cannot remember which was the
> >> first kernel I've seen this on -- I think rather than a kernel update it
> >> was due to file manipulations that made the file eligible for short
> >> reads in the first place (I started running deduplication on the backing
> >> file)
> >>
> >> The older kernel I have installed right now is 5.16 and that can
> >> reproduce it --  I'll give my laptop some work over the weekend to test
> >> still maintained stable branches if that's useful.
> >
> > Hi Dominique,
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
> In general we try very hard to avoid them, but if eg we get a short read
> or write from blocking context (eg io-wq), then io_uring does return
> that. There's really not much we can do here, it seems futile to retry
> IO which was issued just like it would've been from a normal blocking
> syscall yet it is still short.

Thanks! QEMU's short I/O handling is spotty - some code paths handle
it while others don't. For the io_uring QEMU block driver we'll try to
handle short all I/Os.

Stefan

