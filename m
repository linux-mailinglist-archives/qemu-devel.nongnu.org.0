Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3244E2980
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:04:09 +0100 (CET)
Received: from localhost ([::1]:53130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWIdj-0002rG-Pq
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:04:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nWIci-000246-1c
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:03:04 -0400
Received: from [2a00:1450:4864:20::62a] (port=42585
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nWIcd-0007j9-Qu
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:03:01 -0400
Received: by mail-ej1-x62a.google.com with SMTP id j15so15962849eje.9
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cj/cTaG+WGomhVO9Jz29DQDjy18L+qylMJI42WjaT0M=;
 b=zcz+5prqC0qMIZKqqt1vh8zKzyqf35SYo2d42RSEu429cOXtWGGck5qqivY9vPGKsd
 dl4BL45xL9XVkM2Zw0NjQjmFPxOMQqDlNIe3QDV246XGRh8uoOcJJ5fz9e6LBD+tu4nK
 xLdaScNcjNMPmq6FE3/55eLWKF0HziVwMeQfNV6YD9ZOd4qfwDjfakHxQjXI0eYlF7xu
 6CqlUitPqDKYnenBsRwbcYvjWio9w/zL+s8Lx4i9XrBkqQh/gYjjGRW9bBKT0x+hpAD2
 qgshp7die8jyn+5m01UNH5xaUoL9gUm/3n5dIpMmkq+3t6x+JnfV/qVFyYsRCFnQQ7fN
 FZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cj/cTaG+WGomhVO9Jz29DQDjy18L+qylMJI42WjaT0M=;
 b=sSonnqJ7Rp1Dq2hOjFOGxck6cPb72USBlXwT5aH6emBXmY9+roacT6taBGfM9/ZpKT
 3kjqlUqlnA0YnCR+O39esBi9DqYTpXYQrEKzYcTKWwR1//pGyyKUB1qhkt/bZrqkrCJT
 OZAjUzcZiD69UJv0oZk+Znel2Ud/Gjb3axbiXpdtxYeLNOe/xhf2D/pV9p33dALfHN/B
 0QuQVocG5XSgEkIkejOiQutKHdxKCfR7MAAqBvr7Ul2abejfvyatXEEIQJC+Vf7JHaEg
 +Q9nXsOZ84f7CZB5xry32r+jGqe3nGXiGVPB5Jc9AVBcaRy72u1DPVelYYwKre3jHgjM
 jfVg==
X-Gm-Message-State: AOAM531aaSYjKBfCPjWQh9DYbuagzudyeBk/r7SL4ONJ4T9CqmQ0QXu9
 qa233UFSUioWxLOdql5tQ3QdlOLOIvkAAcqdOsCk
X-Google-Smtp-Source: ABdhPJz0vFdOe7azrow4Ycj2xBpCSYhxufSouUj+jEpRzXtiYxiuIK3+OOaA0lQhWisAxjx/nGzbnHIHg0Eic8O56Zg=
X-Received: by 2002:a17:906:c102:b0:6df:e34c:9923 with SMTP id
 do2-20020a170906c10200b006dfe34c9923mr9385924ejc.667.1647871376806; Mon, 21
 Mar 2022 07:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220321071439.151-1-xieyongji@bytedance.com>
 <20220321071439.151-5-xieyongji@bytedance.com>
 <20220321132514.nmfl5rxjkncrnme3@redhat.com>
In-Reply-To: <20220321132514.nmfl5rxjkncrnme3@redhat.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Mon, 21 Mar 2022 22:02:56 +0800
Message-ID: <CACycT3ua5Xy3SCmwYLa1iLWvBjYb-M67os22UZPEtFFecn-s4g@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] vduse-blk: implements vduse-blk export
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, jsnow@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 9:25 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Mon, Mar 21, 2022 at 03:14:37PM +0800, Xie Yongji wrote:
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
> > ---
>
> Looking at just the QAPI:
>
> > +++ b/qapi/block-export.json
> > @@ -170,6 +170,22 @@
> >              '*allow-other': 'FuseExportAllowOther' },
> >    'if': 'CONFIG_FUSE' }
> >
> > +##
> > +# @BlockExportOptionsVduseBlk:
> > +#
> > +# A vduse-blk block export.
> > +#
> > +# @num-queues: the number of virtqueues. Defaults to 1.
> > +# @queue-size: the size of virtqueue. Defaults to 128.
> > +# @logical-block-size: Logical block size in bytes. Defaults to 512 bytes.
>
> Any restrictions on this not being allowed to be smaller than 512, or
> that it must be a power of 2, or that it has a maximum size?  If so,
> they should be documented.
>

Yes, it must be [512, PAGE_SIZE]. I will document it in v4.

> > +#
> > +# Since: 7.0
>
> This is a new feature, and is too late for 7.0, so this line should
> mention 7.1.
>

Oh, right. I will fix it.

> > +##
> > +{ 'struct': 'BlockExportOptionsVduseBlk',
> > +  'data': { '*num-queues': 'uint16',
> > +            '*queue-size': 'uint16',
> > +            '*logical-block-size': 'size'} }
> > +
> >  ##
> >  # @NbdServerAddOptions:
> >  #
> > @@ -273,6 +289,7 @@
> >  # @nbd: NBD export
> >  # @vhost-user-blk: vhost-user-blk export (since 5.2)
> >  # @fuse: FUSE export (since: 6.0)
> > +# @vduse-blk: vduse-blk export (since 7.0)
>
> Another spot for 7.1.
>

Will fix it.

Thanks,
Yongji

