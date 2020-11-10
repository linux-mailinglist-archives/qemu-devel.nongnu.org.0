Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E57E2AD332
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:10:19 +0100 (CET)
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQbS-0001AU-BH
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshavardhan.unnibhavi@gmail.com>)
 id 1kcQZD-0000fj-0a; Tue, 10 Nov 2020 05:07:59 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:35745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <harshavardhan.unnibhavi@gmail.com>)
 id 1kcQZ9-0007Gn-Vs; Tue, 10 Nov 2020 05:07:58 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id m188so11124241ybf.2;
 Tue, 10 Nov 2020 02:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w8FIob+hxvS0SMrZUA6PvBmAt6Tg6sReX26vXUNa24Y=;
 b=Nx82qpGgvxwbuGUqCkE4vsqqtBf0tGsMNR8iWEs2Bi9f+cGU5zKgs7L0L+/7mvWLgB
 VYmGZ1p5OCM4b+bbUw8ShNnJFAvOxk5wzT4cr94rLvYn4gwzyWSM+EZkRI5bYeHSXqjm
 4yPwT6WX1OOQgdv4C8OVFeGJvpI2lslRlaWm09nAVCiDjLNlDIb0kNWLuS76iyWata1/
 W6hRQ8A8u8Axe/ZyWRQKzEKJtMHHCNEo+qupoZSWs331UcBalCq5NdFincj3uFUk3Qwr
 3+GcSfijSe3+dLs569voX322rQdX6D36VXWL8ZJL0by81IrhAESxZ3iy4ZbrHDnO1ZiJ
 O/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w8FIob+hxvS0SMrZUA6PvBmAt6Tg6sReX26vXUNa24Y=;
 b=bFhHFAX1zjqe6uWZ/pu7cBOC+HhfOMmLS87estD97Mh+QarcaQb+4K2KpZGyFG6s6g
 aWr6jRjnh6AqduRsqAdIGhlDKB/pf157QKmh7dQoqXHpVUZNUpegGXkJhPxsk1FAVi3+
 iSGO7BKtdSAwOkGPnzWldD7IOg49sUTEB7DVf/hCoXVPdWrceQ15s5VUDnIjZxF9NUOw
 om72ffs8msI2ZNmogbQtLt+3zDKlIPZi+5GTSOqMYyvaX9u2H8Y4rOlmKJNSDaGfM1ed
 w45dsUVryC3Hhc2KsB+CbPUP0ol7jU5PVt75W0s1BkvZjkFWiOVPzE5Ycj0WF5yVJLYz
 ZaaA==
X-Gm-Message-State: AOAM531D8xIttUMD9VoqB2MNrTKPAzZqLmYhyDAc/CLQINkofvKKR/PM
 vyhlssmbt0fpfBshQa5Q7hCtBuEgNe2+Rw3HFxw=
X-Google-Smtp-Source: ABdhPJwyIERgEvHkQUzgt11GkETgM2VnK3fZTAAYKLf/RYck+cSgE0qm7VYEFgCH4FyA/2zA2hv16SWkAqaqrc8+T2k=
X-Received: by 2002:a25:d34e:: with SMTP id e75mr20223654ybf.106.1605002874202; 
 Tue, 10 Nov 2020 02:07:54 -0800 (PST)
MIME-Version: 1.0
References: <CA+8xkr4ABLeYam6EPBdMKkX=HB3gik079zxUyo1TF91sCXmoQg@mail.gmail.com>
 <e84575ae-4eee-ca5a-e4ca-9b1660a8799d@redhat.com>
 <CA+8xkr4t4s8=dCp6MjcH59y_6KPO0a7-pNi0-A-8Ft14kP6F2Q@mail.gmail.com>
 <20201109101729.GD783516@stefanha-x1.localdomain>
In-Reply-To: <20201109101729.GD783516@stefanha-x1.localdomain>
From: Harshavardhan Unnibhavi <harshavardhan.unnibhavi@gmail.com>
Date: Tue, 10 Nov 2020 10:07:44 +0000
Message-ID: <CA+8xkr7YSv7v0=SquA-bdOOivqsBEnuUEa35BXzLsRuNte8xqQ@mail.gmail.com>
Subject: Re: Qemu first time contribution
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=harshavardhan.unnibhavi@gmail.com; helo=mail-yb1-xb2f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

This looks interesting, let me take a look at it. Thank you!

Best,
Harsha

On Mon, Nov 9, 2020 at 10:17 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Sun, Nov 08, 2020 at 12:21:33PM +0000, Harshavardhan Unnibhavi wrote:
> > Thank you for the reply! Yes, I understand that gsoc is over for 2020,
> > and projects for 2021 will come up next year. I was thinking of
> > contributing outside of gsoc(for which I won't be eligible anyways for
> > next year). Anyway, I will work on some of the bite sized tasks, and
> > get back to you for some other concrete project ideas that require
> > somebody to work on, in qemu.
>
> Hi Harsha,
> Here is an idea you could explore:
>
> The Linux AIO API was extended to support fsync(2)/fdatasync(2) in the
> following commit from 2018:
>
>   commit a3c0d439e4d92411c2b4b21a526a4de720d0806b
>   Author: Christoph Hellwig <hch@lst.de>
>   Date:   Tue Mar 27 19:18:57 2018 +0200
>
>       aio: implement IOCB_CMD_FSYNC and IOCB_CMD_FDSYNC
>
> QEMU's Linux AIO code does not take advantage of this feature yet.
> Instead it invokes the traditional fdatasync(2) system call from a
> thread pool because it assumes the Linux AIO API doesn't support the
> operation. The function where this happens is
> block/file-posix.c:raw_co_flush_to_disk().
>
> The goal is to implement IO_CMD_FDSYNC support in block/linux-aio.c
> using io_prep_fdsync() and update
> block/file-posix.c:raw_co_flush_to_disk() to use this when the feature
> is available. See <libaio.h> for the Linux AIO library API.
>
> Keep in mind that old host kernels may not support IO_CMD_FDSYNC. In
> that case QEMU should continue to use the thread pool.
>
> Taking advantage of the Linux AIO API means QEMU will spawn fewer
> worker threads and disk flush performance may improve. You can benchmark
> performance using the fio(1) tool. Configure it with ioengine=pvsync2
> rw=randwrite direct=1 fdatasync=1 bs=4k to measure the peformance of 4
> KB writes followed by fdatasync. For more information about disk I/O
> benchmarking, including example fio jobs, see:
> https://blog.vmsplice.net/2017/11/common-disk-benchmarking-mistakes.html
>
> Stefan

