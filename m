Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC90C4343F3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:39:23 +0200 (CEST)
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md2Rn-0001ui-13
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1md29s-00042V-2N
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:20:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1md29p-0004OA-Ex
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634700046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E0SjV+K2uII9s7mwn+LvvmOjlHFCEIsOztf8UEzgctk=;
 b=BOX2hids7U7YgUQ+lp1QcmQ0mDYNSEDgNolyrnL813NORcpXWHT5/WPuE55ERC4IdySnWy
 T/mI48qhq1Q7ImMrk0x9rAK1X58NvO9gdhzuhjAJh0u+VNlehArFy/P8UEegu/BFRsMfq4
 zCA81WjpjcvKF6R930Tx+kX2Y4FXuLc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-249Qg-qsNOebRGM-vS4VKw-1; Tue, 19 Oct 2021 23:20:45 -0400
X-MC-Unique: 249Qg-qsNOebRGM-vS4VKw-1
Received: by mail-ed1-f70.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so16117790edx.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E0SjV+K2uII9s7mwn+LvvmOjlHFCEIsOztf8UEzgctk=;
 b=gYASKedSnWh428RrWohj0I8YpanK7RiRz6IvYYt7/wRTd3OaccBduyhqN+aGP1aisy
 FZUW0KijAzkfe/FIy+Yy11K1pJU+BFFkKo/69CdkjKJECMo+u9tO4ccztxLfZpE5qZgX
 DLE4+99mKwbM2znz3imgZl8PW4o7RDjbeupSpT+JpCSg2nencs7JbSEa+0wDRSEWW29f
 NBnzAtkRm30BmO4VBicXAnITliUcqHbC66VNBBzh1fPs342aC1zZHinqMeYjL9KUOYMQ
 6x0pBXMCG5vE/XHlkVY6qJRYnn43kphPeKAYENkn+a+ykDyY/9Jz2zeWyQBVhY2idI3H
 yrAQ==
X-Gm-Message-State: AOAM532Z64DECOsG9l0dc9N3nzffdGkFFOEvwNgnWgmfCrQmOd/sHRi3
 /tJGZ4VyzhAPTUSIsMIMOv7389PWcKTrnemgZQ1oXrcTsCwtLbG7clul+1cMnGK+E5vMAK2o7W3
 jBvQHhoKWtj4ngwwXR0Vg1c2+RkrDn2A=
X-Received: by 2002:a50:8dcb:: with SMTP id s11mr57301612edh.143.1634700044383; 
 Tue, 19 Oct 2021 20:20:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+7ZNtJuVGhAgW4vrTFy/Yd0BMW0MwCvK795HRA089Ejp4Y9YBwoDzruPbG28LFaYBDECZXQlYVSDBRXtIpiQ=
X-Received: by 2002:a50:8dcb:: with SMTP id s11mr57301586edh.143.1634700044171; 
 Tue, 19 Oct 2021 20:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210930023348.17770-1-lulu@redhat.com>
 <20210930023348.17770-6-lulu@redhat.com>
 <20211019025230-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211019025230-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 20 Oct 2021 11:20:07 +0800
Message-ID: <CACLfguVVY+gYrWxh_1_mHd94XmpnoKUEW20Fnhp4UStJJut=sg@mail.gmail.com>
Subject: Re: [PATCH v9 05/10] vhost-vdpa: add support for config interrupt
 call back
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, dgilbert@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>, arei.gonglei@huawei.com,
 kraxel@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 2:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Sep 30, 2021 at 10:33:43AM +0800, Cindy Lu wrote:
> > Add new call back function in vhost-vdpa, this call back function will
> > set the fb number to hardware.
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
>
> fb being what? you mean fd. said fd doing what exactly?
> all this needs to be in the commit log pls.
>
I will add more information for this
Thanks
> > ---
> >  hw/virtio/trace-events | 2 ++
> >  hw/virtio/vhost-vdpa.c | 7 +++++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 8ed19e9d0c..836e73d1f7 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
> >  vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
> >  vhost_vdpa_set_owner(void *dev) "dev: %p"
> >  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> > +vhost_vdpa_set_config_call(void *dev, int fd)"dev: %p fd: %d"
> > +
> >
> >  # virtio.c
> >  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 4fa414feea..73764afc61 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -622,6 +622,12 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
> >      trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
> >      return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> >  }
> > +static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
> > +                                       int fd)
> > +{
> > +    trace_vhost_vdpa_set_config_call(dev, fd);
> > +    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
> > +}
> >
> >  static int vhost_vdpa_get_features(struct vhost_dev *dev,
> >                                       uint64_t *features)
> > @@ -688,4 +694,5 @@ const VhostOps vdpa_ops = {
> >          .vhost_get_device_id = vhost_vdpa_get_device_id,
> >          .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
> >          .vhost_force_iommu = vhost_vdpa_force_iommu,
> > +        .vhost_set_config_call = vhost_vdpa_set_config_call,
> >  };
> > --
> > 2.21.3
>


