Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C3A574561
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 08:59:02 +0200 (CEST)
Received: from localhost ([::1]:56318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBsoP-0000dK-Ah
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 02:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBskK-00063m-4c
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 02:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oBskE-0005HB-Hz
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 02:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657781680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ZYgBLV06M4xXC1ZnzdcldPHRE0fMExwgVv7+CnXdWA=;
 b=Ka8R4/qis/56gL8/3nYMbHBXGCdOFLEUnmjwWxh3XaXkIBPBzEwQ3fS5gTdsoYVQOJFx12
 4KKB9XtCWklWRCd8DUi9U4nfXVvEHn6joXBXxIquouHtZ8MtyccmkO1cgyFUw096m+FxSe
 nwKK9nnwXcC6ssnKLkOmUXCNS6cuMUc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283--5p66gqYOuecvGBde4A_rA-1; Thu, 14 Jul 2022 02:54:39 -0400
X-MC-Unique: -5p66gqYOuecvGBde4A_rA-1
Received: by mail-qk1-f199.google.com with SMTP id
 bm38-20020a05620a19a600b006b5bbb087b6so593346qkb.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 23:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ZYgBLV06M4xXC1ZnzdcldPHRE0fMExwgVv7+CnXdWA=;
 b=3oXSzTiY1US6kjCHcJUANZEiE73g6pXadGyC+KnvDSdKSxbpRUBClsgdCMa4al5YwW
 J5nRVhomaX3fr5mnOFtqt7WyCJkDdszi9BllZOia/SYXeWVjDJ6UhhzIiOWDX07gNrmE
 luw0RiVhMADhxeTL7MlvvvT44S38fnLjBXhjiYkFsL4w15OurIYAkcyPtYLIIFs9Mhmg
 H9zC04GIPrjhzcZucnXSB0uSbD3uFrY4+d5wMJoNS6iWiNNc3a936zgMmdMm679pAGJ2
 JBNHN0kqFuFb+IuX0KOcCjfRxE2UqXOIwxDgdxE9uEFeoBGrWux0HPDuGbaF851ecTaK
 ZyWA==
X-Gm-Message-State: AJIora85yW7EcQ8GFYPkZH4COqVcezqoxb1L1lUL0TuqZl1IncNyCEbE
 dnxHCoNYYiy9YmB7ErMQ/4UixxSjaBdD8zFZk6WE3Pq+YyCiAUYVdTRYJyjnoKUY8X+rTo+KDql
 PDIGsqmtqlA4vVf86hd8Bs3qM6YmPL08=
X-Received: by 2002:a05:622a:1210:b0:31e:cd42:3e9e with SMTP id
 y16-20020a05622a121000b0031ecd423e9emr5459039qtx.495.1657781678564; 
 Wed, 13 Jul 2022 23:54:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vx2/Ag8fSZQVuhOdkObjGsoQhunpba9mLT2Dk6cjG4RJMmRkwfPZnNAE+7LR2fDTDrwNQYy3W3Rq2AO4TbfhA=
X-Received: by 2002:a05:622a:1210:b0:31e:cd42:3e9e with SMTP id
 y16-20020a05622a121000b0031ecd423e9emr5459017qtx.495.1657781678362; Wed, 13
 Jul 2022 23:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-21-eperezma@redhat.com>
 <0f40536a-8c51-e546-17e8-bd752313123c@redhat.com>
 <CAJaqyWcKstiF8AXsUUppPsdfXiiuRhDi2-8ynLVLM8ncv=Pc+Q@mail.gmail.com>
In-Reply-To: <CAJaqyWcKstiF8AXsUUppPsdfXiiuRhDi2-8ynLVLM8ncv=Pc+Q@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Jul 2022 08:54:02 +0200
Message-ID: <CAJaqyWeLXXBceQjSa-efsTazOXpub_Wr8LZ6sVyf8JdAdFzcQw@mail.gmail.com>
Subject: Re: [RFC PATCH v9 20/23] vdpa: Buffer CVQ support on shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> > > +static void vhost_vdpa_net_handle_ctrl_used(VhostShadowVirtqueue *svq,
> > > +                                            void *vq_elem_opaque,
> > > +                                            uint32_t dev_written)
> > > +{
> > > +    g_autoptr(CVQElement) cvq_elem = vq_elem_opaque;
> > > +    virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
> > > +    const struct iovec out = {
> > > +        .iov_base = cvq_elem->out_data,
> > > +        .iov_len = cvq_elem->out_len,
> > > +    };
> > > +    const DMAMap status_map_needle = {
> > > +        .translated_addr = (hwaddr)(uintptr_t)cvq_elem->in_buf,
> > > +        .size = sizeof(status),
> > > +    };
> > > +    const DMAMap *in_map;
> > > +    const struct iovec in = {
> > > +        .iov_base = &status,
> > > +        .iov_len = sizeof(status),
> > > +    };
> > > +    g_autofree VirtQueueElement *guest_elem = NULL;
> > > +
> > > +    if (unlikely(dev_written < sizeof(status))) {
> > > +        error_report("Insufficient written data (%llu)",
> > > +                     (long long unsigned)dev_written);
> > > +        goto out;
> > > +    }
> > > +
> > > +    in_map = vhost_iova_tree_find_iova(svq->iova_tree, &status_map_needle);
> > > +    if (unlikely(!in_map)) {
> > > +        error_report("Cannot locate out mapping");
> > > +        goto out;
> > > +    }
> > > +
> > > +    switch (cvq_elem->ctrl.class) {
> > > +    case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> > > +        break;
> > > +    default:
> > > +        error_report("Unexpected ctrl class %u", cvq_elem->ctrl.class);
> > > +        goto out;
> > > +    };
> > > +
> > > +    memcpy(&status, cvq_elem->in_buf, sizeof(status));
> > > +    if (status != VIRTIO_NET_OK) {
> > > +        goto out;
> > > +    }
> > > +
> > > +    status = VIRTIO_NET_ERR;
> > > +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
> >
> >
> > I wonder if this is the best choice. It looks to me it might be better
> > to extend the virtio_net_handle_ctrl_iov() logic:
> >
> > virtio_net_handle_ctrl_iov() {
> >      if (svq enabled) {
> >           host_elem = iov_copy(guest_elem);
> >           vhost_svq_add(host_elem);
> >           vhost_svq_poll(host_elem);
> >      }
> >      // usersapce ctrl vq logic
> > }
> >
> >
> > This can help to avoid coupling too much logic in cvq (like the
> > avail,used and detach ops).
> >
>
> Let me try that way and I'll come back to you.
>

The problem with that approach is that virtio_net_handle_ctrl_iov is
called from the SVQ used handler. How could we call it otherwise? I
find it pretty hard to do unless we return SVQ to the model where we
used VirtQueue.handle_output, discarded long ago.

I'm about to send a new version, but I still need to call
virtio_net_handle_ctrl_iov from the avail handler. The handlers used
and discard are removed at least.

Thanks!


