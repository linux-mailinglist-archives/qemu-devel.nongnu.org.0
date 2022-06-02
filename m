Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E965353B0E4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:08:39 +0200 (CEST)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZKI-0006p2-Qg
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ztong0001@gmail.com>)
 id 1nwZGb-0005Fd-H6
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:04:49 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ztong0001@gmail.com>)
 id 1nwZGa-0004nk-0w
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:04:49 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id g4so5771578ybf.12
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aRHZ2b7GchnNMEpcnNW9PNRCve29IKGCLlpfdviYqsY=;
 b=Y0DpKor/O8hQSkkjy6GijMtsCn+y2OK33ltAWeXU2oqXZiEA4sFcVEUqoi5wYkPPo2
 EM4klCTZUBlz1qWqGNwQzLsajYhelRq8ve8rejQXuWrIMlH51WD5k7FOMn4WCJwx26Yl
 qedisuGWWtBEUFS3HMdbwPUEo0QFIH+UTjBPKKpOHsuL69NPRUcsvgjC/OBfjb8OW67y
 1l28R7/mhaUiDRYrC8aTfTsxmZB1aIh+23XYRPhVm84i9YTraZFhhFY1P5sDHteZb0Y2
 mo//K7JC4JoFWoKIjSRE0KWIKuHOo1jJCBAmSi2ZgUzy5k3z15DMDwOvNpMsCXvDqXxf
 w2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aRHZ2b7GchnNMEpcnNW9PNRCve29IKGCLlpfdviYqsY=;
 b=zvkXLI0hjcs1xJgHHcqlll7rrlBga1m0sxYVTHUu3S3jr/iXshVc7fIdRfj6Kaw7EQ
 x17mP+mWrmKUg9DpfrH8TPpdMHSozXRIrQhzli3VIfsl6pnGQ4xne+gMNxuFqlqaeFnm
 VRJiAs2BjNS+7kN3iWe8Q1j5FXx8q6KcwrItV/OOlbdIWm7EfJsN0VR6F0bCSuYA7Qzf
 RpSUVirf6eQAvid0mEe33iZHDdregjl9LAUsJUs3xj+aY4JxMUyNp/JuaM9dFiHGltns
 eiV3KajiBs9iMi260BhFzAs5KSlDbmaN2XXZpXJYmAq2vdGT7ORGI3rfJR1NFX1yuexj
 +UIA==
X-Gm-Message-State: AOAM531r1OV8983kaFg8WIUms3ZJCS7IsuW9CAaApAmrcT4dhs2RqfxE
 KvkZVKWW90ZpQ/8JSJmPZBr5z/SGWEqYyUVDFq4=
X-Google-Smtp-Source: ABdhPJxTgwwnDprBVHaD6Vo7GJ37rVhAPXc+YvZhlBW8Aa8wHCHlIH51pdxbsELvBHA9Z3mQnM9JUrrWhPt9u+E6Xqo=
X-Received: by 2002:a25:868a:0:b0:65c:c463:24fc with SMTP id
 z10-20020a25868a000000b0065cc46324fcmr2837332ybk.393.1654131886612; Wed, 01
 Jun 2022 18:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220427205118uscas1p25031437c0cdd4363c104be13033f366a@uscas1p2.samsung.com>
 <20220427205056.2522-1-t.zhang2@samsung.com>
 <b675b817-7b7c-06ee-b971-3df2d7374622@redhat.com>
 <CAA5qM4ARbFV_cc+R6R-q_mdv0hbmki5pK03U5XGYH7xfvEoOMQ@mail.gmail.com>
 <0b54d6c7-f56d-1ad2-80b7-d75d1033d67e@redhat.com>
 <YpdoqgpGloiPIxBk@stefanha-x1.localdomain>
 <b7eff284-fb61-6a66-dd9a-893b64dd5311@redhat.com>
 <CAJSP0QUBJdmT47fvCQ=A6faL8sTFLHGgfNp5U8p7QiRY+EwGJA@mail.gmail.com>
In-Reply-To: <CAJSP0QUBJdmT47fvCQ=A6faL8sTFLHGgfNp5U8p7QiRY+EwGJA@mail.gmail.com>
From: Tong Zhang <ztong0001@gmail.com>
Date: Wed, 1 Jun 2022 18:04:35 -0700
Message-ID: <CAA5qM4AD-s9qxPy8QSgeCAXvVFC=zOKuawBHsSti7nzg3Gr=iA@mail.gmail.com>
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, Tong Zhang <t.zhang2@samsung.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Francisco Londono <f.londono@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=ztong0001@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Hi Stefan,

On Wed, Jun 1, 2022 at 6:56 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> > > This patch makes sense to me. Can you rephrase your concern?
> >
> > The locking is around dbs->io_func().
> >
> > aio_context_acquire(dbs->ctx);
> > dbs->acb = dbs->io_func()
> > aio_context_release(dbs->ctx);
> >
> >
> > So where exactly would the lock that's now still held stop someone from
> > modifying dbs->acb = NULL at the beginning of the function, which seems
> > to be not protected by that lock?
> >
> > Maybe I'm missing some locking magic due to the lock being a recursive lock.
>
> Tong Zhang: Can you share a backtrace of all threads when the
> assertion failure occurs?
>
Sorry I couldn't get the trace now -- but I can tell that we have some
internal code uses
this dma related code and will grab dbs->ctx lock in another thread
and could overwrite dbs->acb.

From my understanding, one of the reasons that the lock is required
here is to protect dbs->acb,
we could not reliably test io_func()'s return value after releasing
the lock here.

Since this code affects our internal code base and I did not reproduce
on master branch,
feel free to ignore it.

- Tong

> Stefan

