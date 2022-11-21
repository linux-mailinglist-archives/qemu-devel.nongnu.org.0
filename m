Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15861632E69
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 22:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxDwl-00015P-C0; Mon, 21 Nov 2022 16:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oxDwj-00014n-AC
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:03:17 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oxDwh-0002wf-Pw
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:03:17 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id k84so15061333ybk.3
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 13:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p2sV52KeZuavoir9vz2DMrqTlJqoJ4d6GrbK+gwYvEw=;
 b=NYLQK1Mk59kaABXomFYSZPvAeGlLDCCpq0RRNB4fVuT/j/xxo74hl5CuT2sWz+/ff6
 t95fBjRGDJecGKkRP7XDygdOdFd8VEtBGvSDFe/95nKyWYkNMV6m0wLXaYR+x88dBlLA
 /rcEg1pIQSEaL7A9xzlGP/Kwo/r/o7hOHdB2+dN6E9YX2dxMyMluKw4hIIVsqgHS48I8
 LpsoSsRuJRl6ctUsrV76GTAPtKyYR4IBXlSH6GaSpjYzrG4ZUEILRAja0HMKK/jJMY4p
 mLYlrHTSGFWSox9gJEjwXwaudQMbLcHTdH9vr0pcqqjV8jRja9EqizHoxBNPuM0SNJn8
 2Ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p2sV52KeZuavoir9vz2DMrqTlJqoJ4d6GrbK+gwYvEw=;
 b=3GeHEDjucRWV/U0XNN2uO4u021T/Pa7Oj8+L15nC11IQ/O+deKrD8YD7+X4uJ8VCD2
 jmYEAd7RVnBK2UHBi8ABRv6pkVXjJcnhdJVwrmUskPDOYW27z4sS8CUQ6B4RvZltjmFh
 tEFVKT8lL4f5jRWFco4J7jTpxJntfJOAAvyiO88HnQrUepLnPU8mbjIH4bvnr8XgR5GM
 zHl9mYjN/YexDrB8kepH8DMYdEEhMOv19IQEkxY61nZCG1Cb7QHcgnkLoHFxEUT8EbyU
 QZEfJA29tLE//QgI86Yt7M3KxTsHHNQEY5S6PJ9hXqCZyFsHP4sZ8gd4K8VCHw+GfD2X
 HocQ==
X-Gm-Message-State: ANoB5pmSMApCuWE+TZTemm8hFYTmK7DB0SqsF3jqXI5l0IyaofWy80K4
 QG+XMDZnuqDLFd/bKjeoohLZH4pURAgaiCz32hY=
X-Google-Smtp-Source: AA0mqf7xSkEDwp91Tz38FYyH67PL8TK+ybi4aSVeDcbKwE+0IFdldVOHxPGIVgkO9s15lSOE6xhrCJVxQRu6wlkWmEQ=
X-Received: by 2002:a25:cf8d:0:b0:6d7:5e6f:2a46 with SMTP id
 f135-20020a25cf8d000000b006d75e6f2a46mr3127113ybg.118.1669064594254; Mon, 21
 Nov 2022 13:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20221121162132.00007540@huawei.com>
 <CAJSP0QVVt9911ZxCq9K5QeOBX2fhKSs372Qzqvg694-QkDnqGQ@mail.gmail.com>
 <20221121172919.000039f0@huawei.com>
In-Reply-To: <20221121172919.000039f0@huawei.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 21 Nov 2022 16:03:02 -0500
Message-ID: <CAJSP0QXEXEms32eHM39d9B+srpcJ3XguPFZtPO9E4=X_pt+ODQ@mail.gmail.com>
Subject: Re: Null dereference in bdrv_unregister_buf() probably
 memory-backend-file related?
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 linuxarm@huawei.com, 
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 21 Nov 2022 at 12:29, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Mon, 21 Nov 2022 11:47:48 -0500
> Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> > On Mon, 21 Nov 2022 at 11:22, Jonathan Cameron via
> > <qemu-devel@nongnu.org> wrote:
> > >
> > > First CC list is a guess as I haven't managed to root cause where things are
> > > going wrong yet.
> > >
> > > Originally hit this whilst rebasing some CXL patches on v7.2.0-rc1.
> > > CXL makes extensive use of memory-backends and most my tests happen
> > > to use memory-backend-file
> > >
> > > Issue seen on arm64 and x86 though helpfully on x86 the crash appears in an entirely
> > > unrelated location (though the 'fix' works).
> > >
> > > Fairly minimal test command line.
> > >
> > > qemu-system-aarch64 \
> > >     -M virt  \
> > >     -drive if=none,file=full.qcow2,format=qcow2,id=hd \
> > >     -device virtio-blk,drive=hd \
> > >     -object memory-backend-file,id=cxl-mem1,mem-path=/tmp/cxltest.raw,size=256M,align=256M \
> > >
> > > Powerdown the machine or ctrl-c during boot gives a segfault.
> > > On arm64 it was in a stable location that made at least some sense in that
> > > bs in the below snippet is NULL.
> > >
> > > I added the follow work around and the segfault goes away...
> > >
> > >  [PATCH] temp
> > >
> > > ---
> > >  block/io.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/block/io.c b/block/io.c
> > > index b9424024f9..750e1366aa 100644
> > > --- a/block/io.c
> > > +++ b/block/io.c
> > > @@ -3324,6 +3324,9 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host, size_t size)
> > >  {
> > >      BdrvChild *child;
> > >
> > > +    if (!bs) {
> > > +        return;
> > > +    }
> > >      GLOBAL_STATE_CODE();
> > >      if (bs->drv && bs->drv->bdrv_unregister_buf) {
> > >          bs->drv->bdrv_unregister_buf(bs, host, size);
> >
> > bdrv_*() APIs generally don't accept NULL bs arguments.
> >
> > I think blk_unregister_buf() needs to handle the blk_bs() NULL return
> > value. Can you confirm that the parent function is
> > blk_unregister_buf()?
> >
> > This bug may have been introduced by commit baf422684d73 ("virtio-blk:
> > use BDRV_REQ_REGISTERED_BUF optimization hint").
> Got it in one. I just bisected to exactly that patch
>
> + using the below change indeed works just as well as the above.
> Now I'd send this as a patch, but I don't yet sufficiently understand what that change you
> referenced did to break things Seems it registered a notifier that is getting
> called for all ram blocks, not just the one virtio-blk ones?
>
> Perhaps better if you send a fix with an explanation :)

Sure, no problem. I have reproduced the bug and will send a patch.

Thanks,
Stefan

