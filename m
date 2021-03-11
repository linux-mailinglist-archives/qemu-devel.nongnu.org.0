Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65613336AB2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 04:29:29 +0100 (CET)
Received: from localhost ([::1]:59492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKC0u-00043M-8H
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 22:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wanghonghao@bytedance.com>)
 id 1lKBz1-0003ab-Hp
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:27:31 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wanghonghao@bytedance.com>)
 id 1lKByr-0005AT-NS
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:27:27 -0500
Received: by mail-pl1-x630.google.com with SMTP id a8so3021187plp.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 19:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6eXsuZnL5N1GEkwAWWBnCvrbtBj07xx4IQrgT0CvCdM=;
 b=wBHSXFBYf/RL7a3/qmbp9CqLzLvTfoQm6dF+axQaP3/gZKIH1bxmDa3ZA27nIo4Y3A
 XrGmJrfCncxd47VuVZlwkMEmnpWS6kA0+05gGk9xqbw7QilzhNXPBwBpgTMZduy4o6+i
 HlYIKoWm7kOe6KkuMBkwKSrRW1NRpG3/MU5rUiRcnit7gtHds0NdrWo3QZeCocicDk2L
 ovWm4p8QtvW5YiPNRiy/XJUz7NHzFMByPhFAhTlRkl7E8SBsypUdlOZXUEZJGDa/d3SJ
 cfpZl/EUDamQB3sFeyBLYwdkfoBa+jQ2iUPAWnO5RY/6okKD6aNReS3e/nDDxPtiAB8c
 f4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6eXsuZnL5N1GEkwAWWBnCvrbtBj07xx4IQrgT0CvCdM=;
 b=GiK+PM5jQC9AFdAcrbtxX+SXafp+3ivOivL/ZeVxyO1fW8bJHgTNRQWQymH6k2HhZ8
 mafShYiCXci1jGoDq6XI4FvWKHIwalEFzOaODA8aggE2QGMv+HKs0JTov36c93yI+q28
 qAD4JrxwDSiW2Flr6cUhs0rwkfKZfLgyoQaTS7xGHG8qj1Yf41CsS3LFZq+580sbLeHm
 ihx0XdW1YzAsnvIeZlnfik7gDMJ4GLyJCV2moZy5XlE0W5hUaWzFPfvYhObjdAl9urRl
 ZPl+tA/XPklMRISs+agD7RKQIPMUyqfEVoAFE+pQXJu3OVkRB4O10nLLiuXqtxh3NVWO
 bcCg==
X-Gm-Message-State: AOAM533OHLzcjdHa8YB3WnuDXmwZfzPCn9Zpc5qmlIsILiUCpqp0asHP
 AHTR9r0CgeycZ2b1h1J2BDIhPOIcixwMfFTwXmYE8w==
X-Google-Smtp-Source: ABdhPJy0pbhqeia4UEiIkcBCjX82RK9FyYnFyukFLtUVRSdL299oL7zegHmIOxRoidNvzTzS96PhNU98RS69dMacdZU=
X-Received: by 2002:a17:902:6b84:b029:e5:d94f:d317 with SMTP id
 p4-20020a1709026b84b02900e5d94fd317mr5985738plk.22.1615433237050; Wed, 10 Mar
 2021 19:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20201016112640.91141-1-wanghonghao@bytedance.com>
 <20201016112640.91141-2-wanghonghao@bytedance.com>
 <YEX8HlJXUgfPYlQk@stefanha-x1.localdomain>
In-Reply-To: <YEX8HlJXUgfPYlQk@stefanha-x1.localdomain>
From: =?UTF-8?B?546L5rSq5rWp?= <wanghonghao@bytedance.com>
Date: Thu, 11 Mar 2021 11:27:06 +0800
Message-ID: <CADzM5uQL8_8va=AmZp3PfMHqMr5tRtxDm16gGOFUj4ip+_Mxfg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 2/2] coroutine: take exactly one batch
 from global pool at a time
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=wanghonghao@bytedance.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will do, thanks!

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2021=E5=B9=B43=E6=9C=888=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=886:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Oct 16, 2020 at 07:26:40PM +0800, wanghonghao wrote:
> > This patch replace the global coroutine queue with a lock-free stack of=
 which
> > the elements are coroutine queues. Threads can put coroutine queues int=
o the
> > stack or take queues from it and each coroutine queue has exactly
> > POOL_BATCH_SIZE coroutines. Note that the stack is not strictly LIFO, b=
ut it's
> > enough for buffer pool.
> >
> > Coroutines will be put into thread-local pools first while release. Now=
 the
> > fast pathes of both allocation and release are atomic-free, and there w=
on't
> > be too many coroutines remain in a single thread since POOL_BATCH_SIZE =
has been
> > reduced to 16.
> >
> > In practice, I've run a VM with two block devices binding to two differ=
ent
> > iothreads, and run fio with iodepth 128 on each device. It maintains ar=
ound
> > 400 coroutines and has about 1% chance of calling to `qemu_coroutine_ne=
w`
> > without this patch. And with this patch, it maintains no more than 273
> > coroutines and doesn't call `qemu_coroutine_new` after initial allocati=
ons.
> >
> > Signed-off-by: wanghonghao <wanghonghao@bytedance.com>
> > ---
> >  util/qemu-coroutine.c | 63 ++++++++++++++++++++++++++++---------------
> >  1 file changed, 42 insertions(+), 21 deletions(-)
>
> Hi,
> I noticed this patch received no reviews. If you would still like to get
> it merged, please rebase to qemu.git/master and resend the patch series.
>
> Feel free to reply to your patches to remind maintainers if they have
> not reviewed it after a few days.
>
> Thanks,
> Stefan

