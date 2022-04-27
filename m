Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF29510F4E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 05:12:49 +0200 (CEST)
Received: from localhost ([::1]:49720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njY6j-0001C6-2E
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 23:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1njY4y-00006X-6J
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:11:00 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1njY4u-0003Mv-59
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:10:57 -0400
Received: by mail-ej1-x62d.google.com with SMTP id kq17so773034ejb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 20:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wgZ7QW8ZOkEM7gq6v4Y5TE/A7C6E5yAklLVpPNDJKQY=;
 b=79r5qdF2p3gFLojkXktLznabY4Az0GMjTmrCfieiH1KnBm53Qu0CSi5V+ApFWfrUGG
 JnHx9MHG5AD+jbmu3BH7xL+F2QKo23A/koXMD5ycUz2s9m5gQeAVqqx42E6bchXYtbJv
 QHYvhLOPFcszpzbKghcpGVna0Xc5S90fmwepZURK8T9+P8KOSVG4QQy+JCTeHRwXaEhe
 1BvO8gwdXWhFAekSI9gd+xCd06RnV5p5qzkHSrUwIwtVXZ0IWhC9r9YZkx/AGuS0xP/o
 +FLXhDQ9KNXcAHhH8zwsIz6nB3MryGgH4xYL9owOV8W/FtYHJjvINaXuyXmmZBB9iBL6
 dq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wgZ7QW8ZOkEM7gq6v4Y5TE/A7C6E5yAklLVpPNDJKQY=;
 b=JIvkqBaoYW/4rUXUGPX3tC3NPkjrqy9Vz1cXYXteODoqTWur+NBPZ5QtlfAu1HX9I4
 lqrOenipd7jwvvzCRVz8m6XxcLnqPvkD423yIKbqdTWdeol8e1F7u0thO1S82fOydK6k
 lY4qiW9T2ku5WTZuFIBkvekBKLBb++a4yut1uSdTmA/ngAS/eT59BcUADpKTroQjw8nm
 +q1bdDrorDDAu3469rED6ip6uKXtOYuFH1FvYC6B39yx7yn9TIyoYL1cWJk6vTmTRke+
 cgd/8ckWY1EWI17bRUstPJdQOEt35WVlVHp2okN5lO4pvrAJOQZIDzS83gpFq0O5BPtr
 ko5g==
X-Gm-Message-State: AOAM530DlmxSrF2BTxvM0ud50nE6eLkW3QXvIfLk3QRz75JodFh1V66l
 Ril3jbLXUZY7ujsFvhyDUsopP3oejcTbroaDfDoO
X-Google-Smtp-Source: ABdhPJyWb2Mh5/zOwyooBR8rkdQy0TiXbZvPB4UVfY4IV4ih+j1wR9gpjoM0xOZ9G7ObCmLi0vHUbYOW+0DfTdBWsG4=
X-Received: by 2002:a17:906:7954:b0:6f3:b2f4:b22b with SMTP id
 l20-20020a170906795400b006f3b2f4b22bmr5738981ejo.536.1651029053200; Tue, 26
 Apr 2022 20:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220406075921.105-1-xieyongji@bytedance.com>
 <20220406075921.105-5-xieyongji@bytedance.com>
 <Ymglzs0iKKUFiFNW@redhat.com>
In-Reply-To: <Ymglzs0iKKUFiFNW@redhat.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 27 Apr 2022 11:11:24 +0800
Message-ID: <CACycT3t5YJmo=zwVUF=gbfK5eczqZ1rx1ZaP6iePr7PLBJPzfQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] vduse-blk: implements vduse-blk export
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, jsnow@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 1:03 AM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 06.04.2022 um 09:59 hat Xie Yongji geschrieben:
> > This implements a VDUSE block backends based on
> > the libvduse library. We can use it to export the BDSs
> > for both VM and container (host) usage.
> >
> > The new command-line syntax is:
> >
> > $ qemu-storage-daemon \
> >     --blockdev file,node-name=drive0,filename=test.img \
> >     --export vduse-blk,node-name=drive0,id=vduse-export0,writable=on
> >
> > After the qemu-storage-daemon started, we need to use
> > the "vdpa" command to attach the device to vDPA bus:
> >
> > $ vdpa dev add name vduse-export0 mgmtdev vduse
> >
> > Also the device must be removed via the "vdpa" command
> > before we stop the qemu-storage-daemon.
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
>
> The request handling code is almos the same as for the vhost-user-blk
> export. I wonder if we could share this code instead of copying.
>

I think we can. Will do it v5.

> The main difference seems to be that you chose not to support discard
> and write_zeroes yet. I'm curious if there is a reason why the
> vhost-user-blk code wouldn't work for vdpa there?
>

They are different protocols. The data plane is similar, so we can
share some codes. But the control plane is different, e.g., vhost-user
can only work for guests but vdpa can work for both guests and hosts.

> > +    features = vduse_get_virtio_features() |
> > +               (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
> > +               (1ULL << VIRTIO_BLK_F_SEG_MAX) |
> > +               (1ULL << VIRTIO_BLK_F_TOPOLOGY) |
> > +               (1ULL << VIRTIO_BLK_F_BLK_SIZE);
> > +
> > +    if (num_queues > 1) {
> > +        features |= 1ULL << VIRTIO_BLK_F_MQ;
> > +    }
> > +    if (!vblk_exp->writable) {
> > +        features |= 1ULL << VIRTIO_BLK_F_RO;
> > +    }
>
> VIRTIO_BLK_F_FLUSH seems to be missing even though the flush command is
> implemented.
>

Oops. Will fix it.

> (This is not a full review yet, just two or three things I noticed while
> having a quick look.)
>

Thank you for your time!

Thanks,
Yongji

