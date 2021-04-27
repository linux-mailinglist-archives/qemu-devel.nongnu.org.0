Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B28936C40C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 12:33:12 +0200 (CEST)
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbL1j-0004Or-9c
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 06:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lbKvo-0000I1-VZ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:27:06 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lbKvl-0004yZ-ID
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:27:04 -0400
Received: by mail-ej1-x62f.google.com with SMTP id zl7so9082938ejb.6
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 03:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q3mBVTiSqeU5xRl9Jd+E2iplPCQ9gGfyh3WuX2ivYUg=;
 b=Jd1jbpvw/OJ+Q0zgO3P/BLRyJbkb1bD2Y6TdbhN5+tw8B2WnWVXAUU3FB717cn/KoK
 Okplts3sWiKqshV1NqvjMYzknAQd9zN/1Cb2G5Ayxqr4EqRlESEubdslW/ErcYZ/N1E4
 LRntQK0dxq384gO+JIovdZYwIwMKe1deLMOILUrqvoAGgqBryZcJCv2PSZ1CdECclAe7
 r7klAT27TzTt+lNlG46pbHLbiZe3nFaytgA1VCmYWnY52UZx8Znq19MoY2S0kwiJoNrh
 WMlKWYjrwZBg7cR0/YwrZn5opNHreKWK9npY5I4QB5ZisGfB1o6dR9WpNXC4GaGldI4M
 P1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q3mBVTiSqeU5xRl9Jd+E2iplPCQ9gGfyh3WuX2ivYUg=;
 b=MrcEwVETPgQla4XaVVhsdd9WhNDX7/WYP3TnYUp9qnAUz1m3QsC0XEsyW43EXw4HLS
 vOUe12H5PhTiylGIbNKDLGZD+0EgJ3SsV9syPzuGdLltqNM8rlF3PHksOzgsq4qif02q
 M3xTluN86CoFZmZFnG3Q+tN9ELm794F4p9uqDhc1Jp/ngYqWtBra41nTNQks10aZB1Gi
 Bemn3sBoiBkXrzkjC8y+aQ/ugTWxWBwcUl1eeyWO2e0RCxaqUFGnykb7tz7dNMcfVVLa
 bcE6vjOsLDpdZLGfwHxgzpgiEfudmqSGbm1+DbdAA9KE576ZmiBTSWX0BXmQ4+TnVGr3
 +r6w==
X-Gm-Message-State: AOAM533SKirSPDSiJbm1OX3d6Wo+EDyR0eWGVbL+TqgXkpgQpEljiPQh
 jiJFL0eLC/bQNuAUXdzGxexG01lIV8FvGBGrLwjS
X-Google-Smtp-Source: ABdhPJwEz/qqADvHixCjD1EqSgZ5nEmIgDjvaiKgumxbcdxSiLd0N5+65Zmdpm9nFnQGKJ6wOa5VikIJNvtWBb3k3/s=
X-Received: by 2002:a17:906:1a0d:: with SMTP id
 i13mr22061694ejf.197.1619519219355; 
 Tue, 27 Apr 2021 03:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <20210408101252.552-3-xieyongji@bytedance.com>
 <YIbS6UJSJtS/IVCq@stefanha-x1.localdomain>
In-Reply-To: <YIbS6UJSJtS/IVCq@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 27 Apr 2021 18:26:48 +0800
Message-ID: <CACycT3tCZ7kC+_daMhd86j1yZ7AzWZ6YhpaMj+y3Qd+Dgm5D2Q@mail.gmail.com>
Subject: Re: Re: [PATCH 2/3] vhost-blk: Add vhost-blk-common abstraction
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62f.google.com
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
Cc: kwolf@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, mreitz@redhat.com, changpeng.liu@intel.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 26, 2021 at 10:49 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, Apr 08, 2021 at 06:12:51PM +0800, Xie Yongji wrote:
> > diff --git a/hw/block/vhost-blk-common.c b/hw/block/vhost-blk-common.c
> > new file mode 100644
> > index 0000000000..96500f6c89
> > --- /dev/null
> > +++ b/hw/block/vhost-blk-common.c
> > @@ -0,0 +1,291 @@
> > +/*
> > + * Parent class for vhost based block devices
> > + *
> > + * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All rights reserved.
> > + *
> > + * Author:
> > + *   Xie Yongji <xieyongji@bytedance.com>
> > + *
> > + * Heavily based on the vhost-user-blk.c by:
> > + *   Changpeng Liu <changpeng.liu@intel.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.  See
> > + * the COPYING file in the top-level directory.
>
> The hw/block/vhost-user-blk.c license is the GNU LGPL, version 2 or
> later. Why did you change the license and did you get permission from
> the copyright holders?

Oh, sorry. My mistake.

Thanks,
Yongji

