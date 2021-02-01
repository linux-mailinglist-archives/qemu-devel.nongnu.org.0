Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E5430A296
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 08:22:58 +0100 (CET)
Received: from localhost ([::1]:39338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6TY1-0006v6-Kx
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 02:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l6TWm-0005xZ-2G
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:21:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l6TWd-0006Bb-LG
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612164087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7t5bxY6u0UFawLK2x7hEyciEsdbyG/6RTYKfYz3AN0M=;
 b=TEqjuWAkpgjKLe+lYAAHeOiRZcYm0neYKR3KyNoWlO0O5PMiPTtQ00Lnz+OB7XW2Ai/NJo
 AWg3hCJ4APKglKCfNiRo8MTmmylz5oN69atkM6F90XBB7O9xKstryFYkFXw3G+D4ZJ1z0k
 XEfHQK298LaLE4liYnx83EAM/VmCtXY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-P7NFsRaKPC-Cg0bzcyHKgg-1; Mon, 01 Feb 2021 02:21:26 -0500
X-MC-Unique: P7NFsRaKPC-Cg0bzcyHKgg-1
Received: by mail-qt1-f198.google.com with SMTP id l15so9944348qtp.21
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 23:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7t5bxY6u0UFawLK2x7hEyciEsdbyG/6RTYKfYz3AN0M=;
 b=RkP7Ikcjr6QCaX/ZQyiB5YNaPX3cYf/k8HcN26vTceHYvs+jN9zA9p/ThlFrFCQou1
 F4ZNsCfE3j7WkiREP0UCl/HC/ovMwFBpRJxmYPdbn9JbdhMSslNKHOGQX3d1uCB1Cfce
 0KF1RAtzhXy/ojSOtPwzAfsCUbIm20r2V4Mp1jcjHSldUrnciArM8B0YCr8KEFz4dzRH
 MM/sUstx4/w63pQx1z4TMDQIKzjwnHjnKegnBSRttAi4HrTTecBpSfgpy7/CHS3pdev8
 d7NXjOBWN7SxkIDeuGGnGioYuqjxlmY2mFLUmuZqCChBYkGIOTjDZ5rU+q9UZO91c+R8
 ne5g==
X-Gm-Message-State: AOAM530hndJEMW7TnM4uDTRPDVTrVrByBQQcAhGsf9EdkTROwWy60Du4
 amcgKGuyX78eAAkBYfKJNJaAD/eIIaUIG6Eu523kbhopR0lD8Dh+KaULqDP/DVmSU7DngnfWUqH
 L8KTP3k0RrnHhjfJJY9EGGlcyv8KcpyE=
X-Received: by 2002:a37:87c5:: with SMTP id
 j188mr14579845qkd.210.1612164086016; 
 Sun, 31 Jan 2021 23:21:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytj1HxfMge18sLLjsOtVfTd4ZaWA3LEgp5pYdUde4FH8dqDUE1Qo8glcTyho5TvxHhEh1SlkdvQJB8y3gqX8c=
X-Received: by 2002:a37:87c5:: with SMTP id
 j188mr14579828qkd.210.1612164085803; 
 Sun, 31 Jan 2021 23:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-4-eperezma@redhat.com>
 <f440260b-d970-548f-8d0d-5e3deb403773@redhat.com>
In-Reply-To: <f440260b-d970-548f-8d0d-5e3deb403773@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Feb 2021 08:20:49 +0100
Message-ID: <CAJaqyWfd9zh7Fj2DiUWY3hZBK-z7tOaBWgmPqW1_NMJTT70nKw@mail.gmail.com>
Subject: Re: [RFC 03/10] virtio: Add virtio_queue_get_idx
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 1, 2021 at 7:10 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/30 =E4=B8=8A=E5=8D=884:54, Eugenio P=C3=A9rez wrote:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/hw/virtio/virtio.h | 2 ++
> >   hw/virtio/virtio.c         | 5 +++++
> >   2 files changed, 7 insertions(+)
> >
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index 9988c6d5c9..9013c03424 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -399,6 +399,8 @@ static inline bool virtio_device_disabled(VirtIODev=
ice *vdev)
> >       return unlikely(vdev->disabled || vdev->broken);
> >   }
> >
> > +unsigned virtio_queue_get_idx(const VirtIODevice *vdev, const VirtQueu=
e *vq);
> > +
> >   bool virtio_legacy_allowed(VirtIODevice *vdev);
> >   bool virtio_legacy_check_disabled(VirtIODevice *vdev);
> >
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index ebb780fb42..3d14b0ef74 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -500,6 +500,11 @@ void virtio_queue_set_notification(VirtQueue *vq, =
int enable)
> >       }
> >   }
> >
> > +unsigned virtio_queue_get_idx(const VirtIODevice *vdev, const VirtQueu=
e *vq)
> > +{
> > +    return vq - vdev->vq;
> > +}
>
>
> It looks to me we had a dedicated index stored in VirtQueue:
> vq->queue_index.
>

You are right, I don't know why but missed it! It will be used in the
next series.

Thanks!

> Thanks
>
>
> > +
> >   int virtio_queue_ready(VirtQueue *vq)
> >   {
> >       return vq->vring.avail !=3D 0;
>


