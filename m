Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F9643439D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 04:52:51 +0200 (CEST)
Received: from localhost ([::1]:51906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md1ik-0003Sn-HY
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 22:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md1go-0002gX-JM
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:50:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md1gl-0005Ma-Ke
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634698245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VTQ5+FPcSe7K0eTYQFZVUN+PpjMg1Zbjs4mRaD8Ghao=;
 b=I9SE0t/BA4uji/VtH5jzEkoLi4KUB/5rCDXIZfgCRwYVUmWbeBX9moktun2APOvK7mqYe5
 6LipOafkPTtGONCvrWWsuAjYF0GAmKV/0+v9+TQ5bHQUWaXfkFfkFcqAyziSUQuAdQOCs/
 /nrxCmkUOOLCne8bTxXvE2/8Mu9qCxg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-pQEuyOj8Pgy2Y3KTauRa_A-1; Tue, 19 Oct 2021 22:50:44 -0400
X-MC-Unique: pQEuyOj8Pgy2Y3KTauRa_A-1
Received: by mail-lf1-f69.google.com with SMTP id
 z29-20020a195e5d000000b003fd437f0e07so2363741lfi.20
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 19:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VTQ5+FPcSe7K0eTYQFZVUN+PpjMg1Zbjs4mRaD8Ghao=;
 b=2VTH4tzl9scfi1tmwtm6zAhU8rgSxl2ULk3SwOdG5FkRVFRKI3GINbO7l5Ak/vX6c8
 hA+cOJG1aUJK9++izhnyK+p0Ir5A8dF1A73xUsUwJnL3uyz5PFC+X8k21wEi5jvBzgRF
 Wnv5HHRMn6Mb3l0tdeDokOWzvNzuhDOFUf1QB7xtnbxBVfbryfQgUtekql64YRn06xvD
 vDisL58KzdXkUq7aVbwajVpU0JU8Psd8HZnr2TN1FOMOb9q9SU0SPCKeaHAcWSjt7GXk
 zWWvvlDeYbZ46xM4kPu7+27S8ANDx7jjA1cBtbvc9M72oVCMNPNn3VY5jRAtF/iKYnvX
 IpiA==
X-Gm-Message-State: AOAM531K2tveAno5EV34BMuKJScNvhj13/GeOphDbod0BePfe9uGYBdB
 b8muqDruvldiO1JUFGUlDa6888pospOQyabPZhfqZSPDwWgjw2ehZIVxT6hbl4FdIJfCJ2C+Iw6
 JM7SkQPC+XSXpBhguxMVftBE0/0DD9aE=
X-Received: by 2002:a05:6512:3b22:: with SMTP id
 f34mr9403712lfv.629.1634698242636; 
 Tue, 19 Oct 2021 19:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyyeFEU1jxBhM5D44/gUH1ZYmVAJ6+nk7CTBkuB7oJnO8iBZnPSEDfd22q1TYd0Xv6RwVGkhZmPJPbE+MIHLU=
X-Received: by 2002:a05:6512:3b22:: with SMTP id
 f34mr9403685lfv.629.1634698242391; 
 Tue, 19 Oct 2021 19:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211011042829.4159-1-jasowang@redhat.com>
 <20211011042829.4159-4-jasowang@redhat.com>
 <20211018154423.uc3ehhrfvmxd3nry@steredhat>
In-Reply-To: <20211018154423.uc3ehhrfvmxd3nry@steredhat>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Oct 2021 10:50:31 +0800
Message-ID: <CACGkMEviEiR8XCkAaA8q8ULsMQLfZibjhsaLVgC1hFLhHdpFkA@mail.gmail.com>
Subject: Re: [PATCH V4 03/10] vhost-vdpa: prepare for the multiqueue support
To: Stefano Garzarella <sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 eperezma <eperezma@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Eli Cohen <elic@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 11:44 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Mon, Oct 11, 2021 at 12:28:22PM +0800, Jason Wang wrote:
> >Unlike vhost-kernel, vhost-vdpa adapts a single device multiqueue
> >model. So we need to simply use virtqueue index as the vhost virtqueue
> >index. This is a must for multiqueue to work for vhost-vdpa.
> >
> >Signed-off-by: Jason Wang <jasowang@redhat.com>
> >Message-Id: <20210907090322.1756-4-jasowang@redhat.com>
> >Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >---
> > hw/virtio/vhost-vdpa.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >index edac4017da..8587d30918 100644
> >--- a/hw/virtio/vhost-vdpa.c
> >+++ b/hw/virtio/vhost-vdpa.c
> >@@ -504,8 +504,8 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
> > {
> >     assert(idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs);
>
> Should we also change this assert?

I think this assert applies to multi-queue as well.

Thanks

>
> Thanks,
> Stefano
>
> >
> >-    trace_vhost_vdpa_get_vq_index(dev, idx, idx - dev->vq_index);
> >-    return idx - dev->vq_index;
> >+    trace_vhost_vdpa_get_vq_index(dev, idx, idx);
> >+    return idx;
> > }
> >
> > static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> >--
> >2.25.1
> >
> >
>


