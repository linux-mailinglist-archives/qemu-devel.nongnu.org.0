Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285CF53A73E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 15:59:21 +0200 (CEST)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwOsa-0001H4-3u
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 09:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwOpQ-0007Bl-Hl
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:56:04 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:44566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwOpO-0005Sr-NW
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:56:04 -0400
Received: by mail-oi1-x22c.google.com with SMTP id i66so2707549oia.11
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6C5JLVDiqpCl6oFWfBe/CKuPrkjOksmDo4BSfEo9Fs4=;
 b=RX+j5W8peOhxqFQ7xQgy9jtxYkR/yZ7w3kZMyviguJPGl9aZyhTxiIh9/M1De7WAxz
 t7s7eENUdYMK85zgsBR32dVbJofwYK4JRZHFx0/rvESVcSbTvtPTrsv1u+xoS/uf42dV
 C9+uBizFQ6qkHy7N6bjKFpnqgHwPjihTsRKQ+nrBsvE75TeT3fzGp5M9hbyj2/78mJmL
 N7Bh20HQpwyorrSR3fbCOnYRp1HehFxbg3KX9/0615yPYxtK0iqi1Om/KKufBgP6lnzx
 EJhp5bsA3DAKfuKW79CrsHTBeqlu48jBOQJJP9LrWoxqpsL2FaN40xKEGl0GIMrneGYD
 Fxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6C5JLVDiqpCl6oFWfBe/CKuPrkjOksmDo4BSfEo9Fs4=;
 b=aH1siSZrO6KsaCb1ud/diMo+bR/szkb5gtq27B9G7QCAnkw9Nik6Ad4IPrD6kyHVap
 pgnTyLyTkGWEdLPZIGQdqCY4xSrKBujsWztSgR8xPwQLbgikWfTgMy8HtCqtLSq0ztIL
 5kh0BLASfCBqWfA+fI07AWd0b+AYermf1pAYFHWY0OUbr7o3paEwD+7DNg8kuZxXUxRv
 tv2qZdSmSara/yQL5rD7nYRh4W8AM8kGmZVNPYS07M8BxDD1k4MdRcW01lomXikaBZUk
 +E2fC6TUHq2UnzqRNMXygNB/bbXepPoi9rx18jFPWdwsMg+sEDYAoKfjNG/DrBklFJfc
 q96w==
X-Gm-Message-State: AOAM533CoxtCLyZzw/sMGYU73oNganAFyW8HXz9ukLI30P+868uFmKbB
 DaNEjrUkood+DhG1yuj7Zm+W4tMUgqI+MH+A/yU=
X-Google-Smtp-Source: ABdhPJy0iNJu57CNVxqda28Bl46qctjRQqio6I/tZH5ZKEs4XGtTbRlWKlHkWFGQW15zl1Pd0N38JEFII86N/LGzpoI=
X-Received: by 2002:a05:6808:3099:b0:32b:30de:d14e with SMTP id
 bl25-20020a056808309900b0032b30ded14emr18785oib.212.1654091761574; Wed, 01
 Jun 2022 06:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220427205118uscas1p25031437c0cdd4363c104be13033f366a@uscas1p2.samsung.com>
 <20220427205056.2522-1-t.zhang2@samsung.com>
 <b675b817-7b7c-06ee-b971-3df2d7374622@redhat.com>
 <CAA5qM4ARbFV_cc+R6R-q_mdv0hbmki5pK03U5XGYH7xfvEoOMQ@mail.gmail.com>
 <0b54d6c7-f56d-1ad2-80b7-d75d1033d67e@redhat.com>
 <YpdoqgpGloiPIxBk@stefanha-x1.localdomain>
 <b7eff284-fb61-6a66-dd9a-893b64dd5311@redhat.com>
In-Reply-To: <b7eff284-fb61-6a66-dd9a-893b64dd5311@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 1 Jun 2022 14:55:49 +0100
Message-ID: <CAJSP0QUBJdmT47fvCQ=A6faL8sTFLHGgfNp5U8p7QiRY+EwGJA@mail.gmail.com>
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
To: David Hildenbrand <david@redhat.com>
Cc: Tong Zhang <ztong0001@gmail.com>, Tong Zhang <t.zhang2@samsung.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Francisco Londono <f.londono@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=stefanha@gmail.com; helo=mail-oi1-x22c.google.com
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

On Wed, 1 Jun 2022 at 14:29, David Hildenbrand <david@redhat.com> wrote:
>
> On 01.06.22 15:24, Stefan Hajnoczi wrote:
> > On Wed, Jun 01, 2022 at 10:00:50AM +0200, David Hildenbrand wrote:
> >> On 01.06.22 02:20, Tong Zhang wrote:
> >>> Hi David,
> >>>
> >>> On Mon, May 30, 2022 at 9:19 AM David Hildenbrand <david@redhat.com> wrote:
> >>>>
> >>>> On 27.04.22 22:51, Tong Zhang wrote:
> >>>>> assert(dbs->acb) is meant to check the return value of io_func per
> >>>>> documented in commit 6bee44ea34 ("dma: the passed io_func does not
> >>>>> return NULL"). However, there is a chance that after calling
> >>>>> aio_context_release(dbs->ctx); the dma_blk_cb function is called before
> >>>>> the assertion and dbs->acb is set to NULL again at line 121. Thus when
> >>>>> we run assert at line 181 it will fail.
> >>>>>
> >>>>>   softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
> >>>>>
> >>>>> Reported-by: Francisco Londono <f.londono@samsung.com>
> >>>>> Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
> >>>>> ---
> >>>>>  softmmu/dma-helpers.c | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> >>>>> index 7820fec54c..cb81017928 100644
> >>>>> --- a/softmmu/dma-helpers.c
> >>>>> +++ b/softmmu/dma-helpers.c
> >>>>> @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
> >>>>>      aio_context_acquire(dbs->ctx);
> >>>>>      dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
> >>>>>                              dma_blk_cb, dbs, dbs->io_func_opaque);
> >>>>> -    aio_context_release(dbs->ctx);
> >>>>>      assert(dbs->acb);
> >>>>> +    aio_context_release(dbs->ctx);
> >>>>>  }
> >>>>>
> >>>>>  static void dma_aio_cancel(BlockAIOCB *acb)
> >>>>
> >>>> I'm fairly new to that code, but I wonder what prevents dma_blk_cb() to
> >>>> run after you reshuffled the code?
> >>>>
> >>>
> >>> IMO if the assert is to test whether io_func returns a non-NULL value
> >>> shouldn't it be immediately after calling io_func.
> >>> Also... as suggested by commit 6bee44ea346aed24e12d525daf10542d695508db
> >>>   >     dma: the passed io_func does not return NULL
> >>
> >> Yes, but I just don't see how it would fix the assertion you document in
> >> the patch description. The locking change to fix the assertion doesn't
> >> make any sense to me, and most probably I am missing something important :)
> >
> > The other thread will invoke dma_blk_cb(), which modifies dbs->acb, when
> > it can take the lock. Therefore dbs->acb may contain a value different
> > from our io_func()'s return value by the time we perform the assertion
> > check (that's the race).
> >
> > This patch makes sense to me. Can you rephrase your concern?
>
> The locking is around dbs->io_func().
>
> aio_context_acquire(dbs->ctx);
> dbs->acb = dbs->io_func()
> aio_context_release(dbs->ctx);
>
>
> So where exactly would the lock that's now still held stop someone from
> modifying dbs->acb = NULL at the beginning of the function, which seems
> to be not protected by that lock?
>
> Maybe I'm missing some locking magic due to the lock being a recursive lock.

Tong Zhang: Can you share a backtrace of all threads when the
assertion failure occurs?

Stefan

