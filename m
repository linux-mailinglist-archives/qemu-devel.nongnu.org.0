Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F66A53B305
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 07:32:47 +0200 (CEST)
Received: from localhost ([::1]:43840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwdRt-0003Y6-RQ
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 01:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwdOi-0002ci-W6
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 01:29:30 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:37391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwdOh-0006OA-CR
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 01:29:28 -0400
Received: by mail-oi1-x231.google.com with SMTP id s188so5354964oie.4
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 22:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F5fBRFrnBVpf+JbDoEEehlTAd2av/mXWMuYJ9gzbg+w=;
 b=fQm070U+14OCOGDLw9jrFAAphCHXkurJkuFlhlavxQWSHb+41m0/GB/9Qf1LdANNon
 2hnmv0OpRb/I/M6e/g2mMy3uB0pf/427HNOemr2LdWEM4/EFobmxhSxZYpEVqaP5zW73
 LgtHP4KKhXKy9v2mQTlhgPNNvWTbOF7LwkE1ivdhE22bslNNxddjZ9ATBU1WtBXwODYv
 LlQ6Ar1ytAGJT5/PCLQvKiOAgALrKugSyuPZ/ObkEIeiGyG8EHVqK9F/O4IVLxSqH3xd
 s6GXWvrLnn5FympAYaeIKU1ZIhjeXHEqhy3JL06/76tMMuY6328XnU9uFni3gVwKQ4lC
 c6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F5fBRFrnBVpf+JbDoEEehlTAd2av/mXWMuYJ9gzbg+w=;
 b=GMXKL0Gr2ay+YLSxswSS3TnZDA3tw1gv+p7IpsjvGUCNjIQKXC++yRkwdG70N0EY1f
 Q/JDbK82dQZg1KjZdzyRaw2s9ToSDabHAiV0A7oWA8KlVwyTedSyBNEgFqAVR/TiSr77
 hp60qVmVzVv9NfM5QUnPkhIbiKaHa2lrUG1gbsvisO5UlAQMEnpAY8IghCFToEhyVJF0
 YhUr2NqUyD3eDo3FC8GIa+fjWolisCd5/d8kEKi4jrVIAF4vcqLlpepcYMrNiL0ioa4W
 EmHnruK1O6Q8nnFRk44LfJqaSz6R8ceqtHDlkhVm+NP82i5z69kqbIWLMA2WWGpLt98f
 NvGw==
X-Gm-Message-State: AOAM533tMqSMwtR5Qv63BvsZqY3kGwEKZjb+oXSm4T+V/ROwzsOABv2v
 08oCEY40F6rezylp6c61GdQ2JEtceScWodzBqNM=
X-Google-Smtp-Source: ABdhPJzi/u2hz32g6oxdQhdOxmtgz8tKZP15gpRfp65VbPNsq0mD67SrU9Y0y8DtqnDP27CND+MIAmlypieGVBMzf7Y=
X-Received: by 2002:a05:6808:3099:b0:32b:30de:d14e with SMTP id
 bl25-20020a056808309900b0032b30ded14emr1589931oib.212.1654147765382; Wed, 01
 Jun 2022 22:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220427205118uscas1p25031437c0cdd4363c104be13033f366a@uscas1p2.samsung.com>
 <20220427205056.2522-1-t.zhang2@samsung.com>
 <b675b817-7b7c-06ee-b971-3df2d7374622@redhat.com>
 <CAA5qM4ARbFV_cc+R6R-q_mdv0hbmki5pK03U5XGYH7xfvEoOMQ@mail.gmail.com>
 <0b54d6c7-f56d-1ad2-80b7-d75d1033d67e@redhat.com>
 <YpdoqgpGloiPIxBk@stefanha-x1.localdomain>
 <b7eff284-fb61-6a66-dd9a-893b64dd5311@redhat.com>
 <CAJSP0QUBJdmT47fvCQ=A6faL8sTFLHGgfNp5U8p7QiRY+EwGJA@mail.gmail.com>
 <CAA5qM4AD-s9qxPy8QSgeCAXvVFC=zOKuawBHsSti7nzg3Gr=iA@mail.gmail.com>
In-Reply-To: <CAA5qM4AD-s9qxPy8QSgeCAXvVFC=zOKuawBHsSti7nzg3Gr=iA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 2 Jun 2022 06:29:12 +0100
Message-ID: <CAJSP0QW396RY_g8LS1mncDZcOv5GamURy+xv+s8zMcdq03OOMA@mail.gmail.com>
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
To: Tong Zhang <ztong0001@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, Tong Zhang <t.zhang2@samsung.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Francisco Londono <f.londono@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=stefanha@gmail.com; helo=mail-oi1-x231.google.com
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

On Thu, Jun 2, 2022, 02:04 Tong Zhang <ztong0001@gmail.com> wrote:
>
> Hi Stefan,
>
> On Wed, Jun 1, 2022 at 6:56 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> > > > This patch makes sense to me. Can you rephrase your concern?
> > >
> > > The locking is around dbs->io_func().
> > >
> > > aio_context_acquire(dbs->ctx);
> > > dbs->acb = dbs->io_func()
> > > aio_context_release(dbs->ctx);
> > >
> > >
> > > So where exactly would the lock that's now still held stop someone from
> > > modifying dbs->acb = NULL at the beginning of the function, which seems
> > > to be not protected by that lock?
> > >
> > > Maybe I'm missing some locking magic due to the lock being a recursive lock.
> >
> > Tong Zhang: Can you share a backtrace of all threads when the
> > assertion failure occurs?
> >
> Sorry I couldn't get the trace now -- but I can tell that we have some
> internal code uses
> this dma related code and will grab dbs->ctx lock in another thread
> and could overwrite dbs->acb.
>
> From my understanding, one of the reasons that the lock is required
> here is to protect dbs->acb,
> we could not reliably test io_func()'s return value after releasing
> the lock here.
>
> Since this code affects our internal code base and I did not reproduce
> on master branch,
> feel free to ignore it.

If this patch is unnecessary on qemu.git/master it raises the question
whether aio_context_acquire/release() should be removed from
dma_blk_cb(). It was added by:

commit 1919631e6b5562e474690853eca3c35610201e16
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Mon Feb 13 14:52:31 2017 +0100

    block: explicitly acquire aiocontext in bottom halves that need it

Paolo: Is dma_blk_cb() called without the AioContext lock (by
virtio-scsi or any code path with IOThreads)? David pointed out that
if that's the case then the dbs->acb is accessed without the lock at
the start of dma_blk_cb().

Stefan

