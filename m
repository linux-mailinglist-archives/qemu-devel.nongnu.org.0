Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D38444274A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 07:51:20 +0100 (CET)
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhndf-0003u1-Fs
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 02:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhnbf-0002ld-In
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhnbd-0002zy-GF
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635835752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dDySiGfT6+1Iz8a8IfUONvpIA6I1lIMo2O0ee75n9Bg=;
 b=JxtVmJmf2OWDVHWJ4Tr8aOXkZWRZxWWkIP7GZFBs4UUDnqdf5TfnVTJJWE7P0QrElTTGGB
 cT0wnoJIq7idbZvTt65JqXW2uWYwIJCGs3jWjhO+zWpzta3OSGo0GI6y62fa51R58r5B4T
 QX2QteVWW4qUc0Vd/a5CJYz+fl199BY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-5lolM-ctNdKgtZRGzZTBjQ-1; Tue, 02 Nov 2021 02:49:11 -0400
X-MC-Unique: 5lolM-ctNdKgtZRGzZTBjQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so17792774edl.17
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 23:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dDySiGfT6+1Iz8a8IfUONvpIA6I1lIMo2O0ee75n9Bg=;
 b=LirH8SjCVjNmAFy770gZBSTFwCHdUbZab6uP3ysYzlqo+16ywou8jTJJC4QvsV0BXI
 cCAfT/4zd0SwIXBbrbhlmkTEMa8h6u5+koNE/aTGPQfyiDu5DtEkQabRupKRv6jqavRx
 seBxKGV/Bm1ylxv5/s846yHWHItnq0ys5M1XDh+4XB2DkWIBI932J+QrAfnDJEuYJ3+Z
 dbBNbMPaLYVJuC8/d+bVUJTmZSlelDGlT+m5QDLB9V4YF1+3AKfqDVNKRSF8xXDAXWVn
 HRzn8Y4boDitXnaxxXL49v/5TE9YKV6oDreF95ozQ6cvEaUf1q0KYVJHjcgTZHg9WoP+
 5JVQ==
X-Gm-Message-State: AOAM531c8Bf4DshwD3ghOgFtkcNxzVDI48EOyDMUdwjXrGRYcWg/wid6
 Gj6UckHPMSVwWU0EUoDjmoC2mzYR/CTQgOS5LzZfKa36C9bRaDZV9C0QwHcCHqFSKIF6a5wBDy0
 di+9kc8Kgvxz1WVs=
X-Received: by 2002:a17:906:314e:: with SMTP id
 e14mr42769901eje.165.1635835750525; 
 Mon, 01 Nov 2021 23:49:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxywGG7iRVoiS+LBJuZkF6ypLa2vVMwsKoCE91ET7QahGKWUZTYr2ekNz9AF9yp1VvPEtNOw==
X-Received: by 2002:a17:906:314e:: with SMTP id
 e14mr42769878eje.165.1635835750280; 
 Mon, 01 Nov 2021 23:49:10 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207f:b499:edfc:9aad:137a:a971])
 by smtp.gmail.com with ESMTPSA id bf8sm2064250edb.46.2021.11.01.23.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 23:49:09 -0700 (PDT)
Date: Tue, 2 Nov 2021 02:49:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Xueming(Steven) Li" <xuemingl@nvidia.com>
Subject: Re: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Message-ID: <20211102024742-mutt-send-email-mst@kernel.org>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
 <20211101083813.1224522-2-xuemingl@nvidia.com>
 <20211101170506-mutt-send-email-mst@kernel.org>
 <f433ca338852f0aaad9e23cb47ee39dd53061310.camel@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <f433ca338852f0aaad9e23cb47ee39dd53061310.camel@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 06:08:39AM +0000, Xueming(Steven) Li wrote:
> On Mon, 2021-11-01 at 17:06 -0400, Michael S. Tsirkin wrote:
> > On Mon, Nov 01, 2021 at 04:38:12PM +0800, Xueming Li wrote:
> > > When vhost-user vdpa client suspend, backend may close all resources,
> > > VQ notifier mmap address become invalid, restore MR which contains
> > > the invalid address is wrong. vdpa client will set VQ notifier after
> > > reconnect.
> > > 
> > > This patch removes VQ notifier restore and related flags to avoid reusing
> > > invalid address.
> > > 
> > > Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
> > > Cc: qemu-stable@nongnu.org
> > > Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
> > > Signed-off-by: Xueming Li <xuemingl@nvidia.com>
> > > ---
> > >  hw/virtio/vhost-user.c         | 19 +------------------
> > >  include/hw/virtio/vhost-user.h |  1 -
> > >  2 files changed, 1 insertion(+), 19 deletions(-)
> > > 
> > > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > > index bf6e50223c..c671719e9b 100644
> > > --- a/hw/virtio/vhost-user.c
> > > +++ b/hw/virtio/vhost-user.c
> > > @@ -1143,19 +1143,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
> > >      return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
> > >  }
> > >  
> > > -static void vhost_user_host_notifier_restore(struct vhost_dev *dev,
> > > -                                             int queue_idx)
> > > -{
> > > -    struct vhost_user *u = dev->opaque;
> > > -    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
> > > -    VirtIODevice *vdev = dev->vdev;
> > > -
> > > -    if (n->addr && !n->set) {
> > > -        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true);
> > > -        n->set = true;
> > > -    }
> > > -}
> > > -
> > >  static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
> > >                                              int queue_idx)
> > >  {
> > > @@ -1163,17 +1150,14 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
> > >      VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
> > >      VirtIODevice *vdev = dev->vdev;
> > >  
> > > -    if (n->addr && n->set) {
> > > +    if (n->addr) {
> > >          virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
> > > -        n->set = false;
> > >      }
> > >  }
> > > 
> > 
> > So on vq stop we still remove the notifier...
> >   
> > >  static int vhost_user_set_vring_base(struct vhost_dev *dev,
> > >                                       struct vhost_vring_state *ring)
> > >  {
> > > -    vhost_user_host_notifier_restore(dev, ring->index);
> > > -
> > >      return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
> > >  }
> > >  
> > 
> > but on vq start we do not reinstate it? Does this not mean that
> > notifiers won't work after stop then start?
> 
> 
> Yes, backend initially work w/o host notifier, request VM driver to
> install notifier if needed - call this function through slave socket.

I think it's cleaner if qemu handles this itself like it did before, it
knows vm is stopped without getting called.

> > 
> > 
> > > @@ -1538,7 +1522,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
> > >      }
> > >  
> > >      n->addr = addr;
> > > -    n->set = true;
> > >  
> > >      return 0;
> > >  }
> > > diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
> > > index a9abca3288..f6012b2078 100644
> > > --- a/include/hw/virtio/vhost-user.h
> > > +++ b/include/hw/virtio/vhost-user.h
> > > @@ -14,7 +14,6 @@
> > >  typedef struct VhostUserHostNotifier {
> > >      MemoryRegion mr;
> > >      void *addr;
> > > -    bool set;
> > >  } VhostUserHostNotifier;
> > >  
> > >  typedef struct VhostUserState {
> > > -- 
> > > 2.33.0
> > 
> 


