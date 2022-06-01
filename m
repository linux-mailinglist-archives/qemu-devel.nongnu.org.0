Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2260F539A57
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 02:22:54 +0200 (CEST)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwC8S-0002fm-Mr
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 20:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ztong0001@gmail.com>)
 id 1nwC6O-0001xc-L3
 for qemu-devel@nongnu.org; Tue, 31 May 2022 20:20:44 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:44482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ztong0001@gmail.com>)
 id 1nwC6A-0003Jh-L9
 for qemu-devel@nongnu.org; Tue, 31 May 2022 20:20:44 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-30ec2aa3b6cso1801647b3.11
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 17:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YyocxuZ3gIOE9E53oVRN/zfshiHMA8NVQVAnlP7fNrM=;
 b=cHrRi3e1bmkBOmlWVr5wdMHOgUrfeCW/J1nnK1QYhVnIh/8gktxjtuCWTM7u9Cf04d
 zUA4C6cggKpe5BfW9SzMObY7YRxmfqU9poiNBoKS1GaL8fWR3jZHEexXPBtXnyNwHCv9
 UtpjpsT7JiKcXu/cXl6IwZHyhBh8TBuXtJzIQGNIVwyPV6lw0EXm0PWXZVkaV109kj+3
 EiNhNc+wGthYn+JMPNMQSg37ZDmc5duRC3w8tLuBeFaoLm7vta+ItYfNSCLenAYI+Fa5
 Oju2uOEjaMkkxgIG/Fdvr/Fk3yLTAtF3C36VmnjuKsXt3oQNDuSBxMJrNAFn+9/jMxxa
 zQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YyocxuZ3gIOE9E53oVRN/zfshiHMA8NVQVAnlP7fNrM=;
 b=X4NBYXTcRYGfb/7dJAK25PywJnZRxPowetuDgQ9Jz/udx2WOl9ShQpAiSogLMpMopf
 RR2OCQvKguzYDxjsad+xKgt3+qMT+54YMcNeUbddQp2VQSJ+0iFGi7hvOJ08Dg/fgLTP
 ucQs9qvCnTdKQ2G4L0/S5VOnPC4jpzvAzXqjiPJrkFLlBoKE3nKOyfQf5Qq0dazUsrhr
 cpCWwKszP5d3IPmkmX/mUSAg83w7jH5E7Y2iHu7r0SVzY7/FwC+ahxK+FdhOh/5N5hXx
 LTwrs94jNZ/eLBbR/eeeNvZNbp0NPb78vs+8HKMzNVOR/LRsMpKX9GBdPxM4qKESuUIG
 +a3g==
X-Gm-Message-State: AOAM531u1qmfaJso9XmOK3FeBYW25E02JjSH8jWiVIQz1KekvA2A6J20
 Zs+/0hSaRAJXH2Wwe6qjVidv291qsomVn1KlAeY=
X-Google-Smtp-Source: ABdhPJwfaih/3apd2bW2nhCAq2RS8h1SCimAMmg8nz+r/KpTRgOMXLgQwNo4ZphCFJr1Ak6A5D06QHBxTspFp9V5L1U=
X-Received: by 2002:a81:6d93:0:b0:30c:3f88:506f with SMTP id
 i141-20020a816d93000000b0030c3f88506fmr15876387ywc.92.1654042829162; Tue, 31
 May 2022 17:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220427205118uscas1p25031437c0cdd4363c104be13033f366a@uscas1p2.samsung.com>
 <20220427205056.2522-1-t.zhang2@samsung.com>
 <b675b817-7b7c-06ee-b971-3df2d7374622@redhat.com>
In-Reply-To: <b675b817-7b7c-06ee-b971-3df2d7374622@redhat.com>
From: Tong Zhang <ztong0001@gmail.com>
Date: Tue, 31 May 2022 17:20:18 -0700
Message-ID: <CAA5qM4ARbFV_cc+R6R-q_mdv0hbmki5pK03U5XGYH7xfvEoOMQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
To: David Hildenbrand <david@redhat.com>
Cc: Tong Zhang <t.zhang2@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Francisco Londono <f.londono@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=ztong0001@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi David,

On Mon, May 30, 2022 at 9:19 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 27.04.22 22:51, Tong Zhang wrote:
> > assert(dbs->acb) is meant to check the return value of io_func per
> > documented in commit 6bee44ea34 ("dma: the passed io_func does not
> > return NULL"). However, there is a chance that after calling
> > aio_context_release(dbs->ctx); the dma_blk_cb function is called before
> > the assertion and dbs->acb is set to NULL again at line 121. Thus when
> > we run assert at line 181 it will fail.
> >
> >   softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
> >
> > Reported-by: Francisco Londono <f.londono@samsung.com>
> > Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
> > ---
> >  softmmu/dma-helpers.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > index 7820fec54c..cb81017928 100644
> > --- a/softmmu/dma-helpers.c
> > +++ b/softmmu/dma-helpers.c
> > @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
> >      aio_context_acquire(dbs->ctx);
> >      dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
> >                              dma_blk_cb, dbs, dbs->io_func_opaque);
> > -    aio_context_release(dbs->ctx);
> >      assert(dbs->acb);
> > +    aio_context_release(dbs->ctx);
> >  }
> >
> >  static void dma_aio_cancel(BlockAIOCB *acb)
>
> I'm fairly new to that code, but I wonder what prevents dma_blk_cb() to
> run after you reshuffled the code?
>

IMO if the assert is to test whether io_func returns a non-NULL value
shouldn't it be immediately after calling io_func.
Also... as suggested by commit 6bee44ea346aed24e12d525daf10542d695508db
  >     dma: the passed io_func does not return NULL

Thanks,
- Tong

> After all, acquire/release is only around the dbs->io_func() call, so I
> don't immediately see how it interacts with re-entrance?
>
> --
> Thanks,
>
> David / dhildenb
>

