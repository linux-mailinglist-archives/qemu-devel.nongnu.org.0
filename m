Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA09434387
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 04:31:54 +0200 (CEST)
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md1OT-0007Xq-Gd
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 22:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1md1Ma-0006lD-2e
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:29:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1md1MY-00082S-2g
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:29:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634696992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jNmTJV17EWVaMMn2TweB4Dy1kBj7ub7KQqY6JoryUG0=;
 b=MXyvcLmnWPYSGuMqnMCf5P//3wBrmMcnU9H3XO66zWv/2kUqMXdVVqop5fkvT3kapAdSmO
 HYdhWpHXMTYdO2+YwOQx+zowWj5po+bDkusxg4kVo5xOYkiFtrqKFBucybQywFtlDa+Rp+
 h/3J1v3SS5pOZRxw6KXDvQJ6dxgPH0E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-80slXf_9P927dkcL7PlvOg-1; Tue, 19 Oct 2021 22:29:51 -0400
X-MC-Unique: 80slXf_9P927dkcL7PlvOg-1
Received: by mail-ed1-f70.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so19494775edq.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 19:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jNmTJV17EWVaMMn2TweB4Dy1kBj7ub7KQqY6JoryUG0=;
 b=celcrWf7GK7Nmcsxm4O1oBzmC0943cTFqJJp9VGS2ziTk30gTyYag6jFh4kBFQ7Z6J
 ILUuND/YEkFbNNm7ffIfYfE0ouC/6OPojiN1J4TZs8WvsFmxKYvJ400pM+i7kwacF1q4
 YttMT+itQhVD2v0CqZof7X8jP7tkGRBaGqlzn3w9TyzUQRzTYtfg8rL3riJveJto7jc7
 ShmiLosy/PT5lQBQzIyZJmUi36ZOBQfo/iydLyK9LgPYn/oB/PDANTc5K/HQAEButG1v
 N0+1Q/o9H5HCcxNEFPeTTPmgZOgX+FI3LDhAE5OEkQQ4Z1+y6kxkPwIsSZfrf73hvAHp
 saiA==
X-Gm-Message-State: AOAM533Wrz2XUMttRbI2c6pE37BeRxFjGKrHSoKWH5TWsKh1pVlt2wrq
 2nrsSlPzwDW4X09NjeRG/I95qTBrK/ulCzzPoauY3lSMZFlXbJTMzc+4tnrhiHQQUnXi76PNlN/
 rTad401rElc/p1x4ANM0E5iICLy4LkXA=
X-Received: by 2002:a50:8dcb:: with SMTP id s11mr57033245edh.143.1634696990705; 
 Tue, 19 Oct 2021 19:29:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ+EgcU+wen2CSM3ff2e5UIIlCKhFya9ppewrNQBThUD9okmdf7+//JErVIr6nI1YzUUdGahPsXc0oINvwKWo=
X-Received: by 2002:a50:8dcb:: with SMTP id s11mr57033221edh.143.1634696990524; 
 Tue, 19 Oct 2021 19:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210930023348.17770-1-lulu@redhat.com>
 <20210930023348.17770-5-lulu@redhat.com>
 <20211019025041-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211019025041-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 20 Oct 2021 10:29:13 +0800
Message-ID: <CACLfguV8kSNj1gBt03HfB9=8oGj5L2_wsGSSNCNvkk7BGBDPNw@mail.gmail.com>
Subject: Re: [PATCH v9 04/10] vhost: add new call back function for config
 interrupt
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

On Tue, Oct 19, 2021 at 2:52 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Sep 30, 2021 at 10:33:42AM +0800, Cindy Lu wrote:
> > To support the config interrupt, we need to
> > add a new call back function for config interrupt.
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
>
> Pls make commit log more informative.
> Doing what? Called back when?
>
sure, I will add more information in the commit log
>
> > ---
> >  include/hw/virtio/vhost-backend.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> > index 8475c5a29d..e732d2e702 100644
> > --- a/include/hw/virtio/vhost-backend.h
> > +++ b/include/hw/virtio/vhost-backend.h
> > @@ -126,6 +126,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
> >
> >  typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
> >
> > +typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> > +                                       int fd);
> >  typedef struct VhostOps {
> >      VhostBackendType backend_type;
> >      vhost_backend_init vhost_backend_init;
> > @@ -171,6 +173,7 @@ typedef struct VhostOps {
> >      vhost_vq_get_addr_op  vhost_vq_get_addr;
> >      vhost_get_device_id_op vhost_get_device_id;
> >      vhost_force_iommu_op vhost_force_iommu;
> > +    vhost_set_config_call_op vhost_set_config_call;
> >  } VhostOps;
> >
> >  extern const VhostOps user_ops;
> > --
> > 2.21.3
>


