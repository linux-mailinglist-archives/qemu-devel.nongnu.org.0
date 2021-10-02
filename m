Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCA141FC8D
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:39:23 +0200 (CEST)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWgAc-0002hr-LT
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mWg9T-0001JX-8u
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:38:11 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:44763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mWg9R-00078W-Dy
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:38:10 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id s64so23943236yba.11
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XAfXUpfnAA5KQ0Tz629TTVXqRk7eZHj4YJTBFJA+t/M=;
 b=lbLtGFaeg2SWmNVS7zVSrUizpJxle4CAfRSy6TiW2WkQ+Ar7Wp1kNlF+/7shzJpNIj
 XJaGZ1Eo3+vjm9CmI7DHuXQmOZ5l9/DbSXSoR2DMgCXNSVJD0bvmSvZCHxjqP4HIgo+p
 tTnIWjzcHVu2YDZYstl06ET0zmW4Xsy0Jix1C6SiAn/d5kfUdZ7c6lzm350TIeaHxWI9
 sCUAxAy/mcCZXOwoGZQqyWB3+bxqZxwjMtcLuhxkWoGQwJBkotFgATfK+BaiaBXQQqlP
 FolGXb5AFQFhYWuYlmkTMTg2xJe2PZk8qu6DM+R/h6CuT1YRBP+kPHcUWexJ2kHVvIKS
 lBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XAfXUpfnAA5KQ0Tz629TTVXqRk7eZHj4YJTBFJA+t/M=;
 b=5HixKrQgE3/ihfCKysC2yVSRqWSNjsmfF5WPBysmVpI2JDFMQ1ur4isJn/DwnL1/9n
 ko2Bj/g72nLkFSsjM5ErdvDgY8lIA8Eysd447RxVgAsBXsSzuHeQXCV/XGXfNvnMGlq0
 QAS/AizqnZBsN+DQFT7smDzI6uZZBPFVCkYpgrRm9+AEgcIFTF4E3Shqcw6ouSTFfpSx
 gWYHwDY4gzZhUYXlBvpXQ6seiBUM/m9JQzu1tfMzoIjJxaRJT0cNnI0R/+V8FBMGCYRO
 8uwxBqR4EaNDjVrkmzZNuwQ9Fu6q45kQVhmr26q029kBTM42KzOrH9Lyle5ccMKC0u1L
 QVig==
X-Gm-Message-State: AOAM533NnWEyIILUNYxU9I832mPFPJ4AG09tUCPAF3cAA3VMc5FO1WXl
 Jt+EG8goFWaeBcGUY6yEGIIGJUi4SJ1k0Z95+ko=
X-Google-Smtp-Source: ABdhPJzQN6bkBaD1y8i/J0XuBtN0tJRG/L3OOEMBRrh/j86ttNRVeMGVgB2d0E3I4YWZ0a73YNgy5PXuIAz66EezAXA=
X-Received: by 2002:a25:6c1:: with SMTP id 184mr3671131ybg.453.1633185487755; 
 Sat, 02 Oct 2021 07:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210906122020.5793-1-bmeng.cn@gmail.com>
 <54817618-59b9-d6e6-f903-f7d6938c17ba@redhat.com>
 <YTkF99YYW8cwa77F@t490s> <b52319f1-3c4c-a098-7581-5d976b3160c1@redhat.com>
In-Reply-To: <b52319f1-3c4c-a098-7581-5d976b3160c1@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 2 Oct 2021 22:37:57 +0800
Message-ID: <CAEUhbmVWarddL5qduk2uJ8+ETu5JhKqrbWAybspmf7D0NipT9g@mail.gmail.com>
Subject: Re: [PATCH] docs/devel: memory: Document MemoryRegionOps requirement
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 9, 2021 at 4:17 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 9/8/21 8:50 PM, Peter Xu wrote:
> > On Mon, Sep 06, 2021 at 03:01:54PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> On 9/6/21 2:20 PM, Bin Meng wrote:
> >>> It's been a requirement that at least one function pointer for read
> >>> and one for write are provided ever since the MemoryRegion APIs were
> >>> introduced in 2012.
> >>>
> >>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >>> ---
> >>>
> >>>  docs/devel/memory.rst | 5 +++++
> >>>  1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
> >>> index 5dc8a12682..7b589b21d2 100644
> >>> --- a/docs/devel/memory.rst
> >>> +++ b/docs/devel/memory.rst
> >>> @@ -344,6 +344,11 @@ based on the attributes used for the memory tran=
saction, or need
> >>>  to be able to respond that the access should provoke a bus error
> >>>  rather than completing successfully; those devices can use the
> >>>  ->read_with_attrs() and ->write_with_attrs() callbacks instead.
> >>> +The requirement for a device's MemoryRegionOps is that at least
> >>> +one callback for read and one for write are provided. If both
> >>> +->read() and ->read_with_attrs() are provided, the plain ->read()
> >>> +version takes precedence over the with_attrs() version. So does
> >>> +the write callback.
> >>
> >> What about also adding a runtime check?
> >>
> >> -- >8 --
> >> diff --git a/softmmu/memory.c b/softmmu/memory.c
> >> index bfedaf9c4df..8ab602d3379 100644
> >> --- a/softmmu/memory.c
> >> +++ b/softmmu/memory.c
> >> @@ -1516,6 +1516,17 @@ MemTxResult
> >> memory_region_dispatch_write(MemoryRegion *mr,
> >>      }
> >>  }
> >>
> >> +static void memory_region_set_ops(MemoryRegion *mr, const
> >> MemoryRegionOps *ops)
> >> +{
> >> +    if (ops) {
> >> +        assert(ops->valid.accepts || (ops->read || ops->read_with_att=
rs));
> >> +        assert(ops->valid.accepts || (ops->write ||
> >> ops->write_with_attrs));
> >
> > Curious why accepts() matters.. Say, if there's only accepts() provided=
 and it
> > returned true, then I think we still can't avoid the coredump when read=
/write?
>
> Good point :(
>
> > I'm also curious what's the issue that Paolo mentioned here:
> >
> > https://lore.kernel.org/qemu-devel/8da074de-7dff-6505-5180-720cf2f47c70=
@redhat.com/
> >
> > I believe Paolo was referring to this series from Prasad:
> >
> > https://lore.kernel.org/qemu-devel/20200811114133.672647-10-ppandit@red=
hat.com/
> >
> > We may need to solve that issue then maybe we can consider revive Prasa=
d's
> > patchset?

It looks this patch is not applied. Given it's a doc improvement for
current implementation, I think we should apply this, and future
enhancement should be done in separate series?

Regards,
Bin

