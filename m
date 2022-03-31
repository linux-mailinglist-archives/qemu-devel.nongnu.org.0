Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98284ED704
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:32:59 +0200 (CEST)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrAo-00083i-Dp
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:32:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZqyc-0000OJ-Fh
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZqya-0001pN-Fu
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648718418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iw/6OVnm28c1qhFww9LNzmBXF9VcHRlmZzMJMsORg6U=;
 b=QvFSikuUNOubaTZrFN4AX4x+5Fjh8uv0IVW6DG1/cdryTaD+Dam6zOWJdz+T6ZgKyYfgC1
 6kDgxwsvGMwrEN6FXpZJdlUwCgQemoXD0IMgK/87WrXvpUUxUapAN7QfhZ6NIAQ7lLDl04
 Jp82QjM8pxX34efDb4drwRHqOK092AM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-yf2uWWmpMA6jXbJ1uZcQQg-1; Thu, 31 Mar 2022 05:20:16 -0400
X-MC-Unique: yf2uWWmpMA6jXbJ1uZcQQg-1
Received: by mail-qt1-f200.google.com with SMTP id
 k1-20020ac85fc1000000b002e1c5930386so19629263qta.3
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 02:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iw/6OVnm28c1qhFww9LNzmBXF9VcHRlmZzMJMsORg6U=;
 b=yy1bkVvoghZoiZAf/k4msO/FQ/pIsdFWYnRg1Q33jXe2E2laiWoH/WnmLMC8Kebn7P
 bzMsBplGclITGI+PQ4xUMkqWLtZyW0IktVdYUNAUl/swrSsAyxRyI3lnSlrqWTn+6ZH9
 de1UGZ8+zN20fZrl5N7fxRLGHBa7F4XdnpvQ1LPW6yMzKYichKF+N+qct7+fcPea8rGF
 Z/bqp97nhM/NVwvT0qvdGxFnkIzP1ixBi1rTMMtN5UvqXYfFZTBr3Yv02idUQw2TiB03
 htzR3OHFMEfTzFiSbS2NWmWoUdF95lmSJrCDG3gtykHXl8U/deuD/6kxBVasINhBLph9
 588Q==
X-Gm-Message-State: AOAM5337VhnLkY+LHB1mtnMppk5/y/AQER3A6vDRoykbsgGxlRkR1Fo2
 GLHQtoxuOi8H8TofdpfBx3E7dJAqMcT9trpWst2oj320XcGc0m8AXg21nE+09cyqUPlGvsl+3kt
 ysz3RVGszBODqrYDbtv44GdMTbLc7jZM=
X-Received: by 2002:ac8:59c7:0:b0:2e1:a0d1:fc7b with SMTP id
 f7-20020ac859c7000000b002e1a0d1fc7bmr3358892qtf.320.1648718416213; 
 Thu, 31 Mar 2022 02:20:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9oNKo/8vkL97hZ8UWyTd5PjjK0DPyg2oTg1S4nUgrbD+vn4xocgQGDL69pNQqA/GNJv12gszBPsO5okrFSkQ=
X-Received: by 2002:ac8:59c7:0:b0:2e1:a0d1:fc7b with SMTP id
 f7-20020ac859c7000000b002e1a0d1fc7bmr3358877qtf.320.1648718415970; Thu, 31
 Mar 2022 02:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
 <CAJaqyWdF55nKD05C54OOvM5-mmsCG7FMixKLguPGNR4Ostqnmw@mail.gmail.com>
 <f8ace3a3-8f86-841e-c056-271528d5ba9c@oracle.com>
 <CAJaqyWfb5=bEQGiGHamwqgBAvQf2FKEr8SwgVsa1LM2N-v48oQ@mail.gmail.com>
 <9a7c92a6-4551-48a7-6569-d3bc9d227fe2@redhat.com>
In-Reply-To: <9a7c92a6-4551-48a7-6569-d3bc9d227fe2@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 31 Mar 2022 11:19:40 +0200
Message-ID: <CAJaqyWfusKtDiTYuJBidwZGzpq3mQrOyaQOk2WNiiNPgxffgcQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Eli Cohen <eli@mellanox.com>,
 qemu-level <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 10:54 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/3/31 =E4=B8=8B=E5=8D=884:02, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > On Thu, Mar 31, 2022 at 1:03 AM Si-Wei Liu <si-wei.liu@oracle.com> wrot=
e:
> >>
> >>
> >> On 3/30/2022 12:01 PM, Eugenio Perez Martin wrote:
> >>> On Wed, Mar 30, 2022 at 8:33 AM Si-Wei Liu <si-wei.liu@oracle.com> wr=
ote:
> >>>> The vhost_vdpa_one_time_request() branch in
> >>>> vhost_vdpa_set_backend_cap() incorrectly sends down
> >>>> iotls on vhost_dev with non-zero index. This may
> >>>> end up with multiple VHOST_SET_BACKEND_FEATURES
> >>>> ioctl calls sent down on the vhost-vdpa fd that is
> >>>> shared between all these vhost_dev's.
> >>>>
> >>> Not only that. This means that qemu thinks the device supports iotlb
> >>> batching as long as the device does not have cvq. If vdpa does not
> >>> support batching, it will return an error later with no possibility o=
f
> >>> doing it ok.
> >> I think the implicit assumption here is that the caller should back of=
f
> >> to where it was if it comes to error i.e. once the first
> >> vhost_dev_set_features call gets an error, vhost_dev_start() will fail
> >> straight.
> > Sorry, I don't follow you here, and maybe my message was not clear enou=
gh.
> >
> > What I meant is that your patch fixes another problem not stated in
> > the message: it is not possible to initialize a net vdpa device that
> > does not have cvq and does not support iotlb batches without it. Qemu
> > will assume that the device supports batching, so the write of
> > VHOST_IOTLB_BATCH_BEGIN will fail. I didn't test what happens next but
> > it probably cannot continue.
>
>
> So you mean we actually didn't call VHOST_SET_BACKEND_CAP in this case.
> Fortunately, kernel didn't check the backend cap when accepting batching
> hints.
>
> We are probably fine?
>

We're fine as long as the vdpa driver in the kernel effectively
supports batching. If not, qemu will try to batch, and it will fail.

It was introduced in v5.9, so qemu has not supported kernel <5.9 since
we introduced multiqueue support (I didn't test). Unless we apply this
patch. That's the reason it should be marked as fixed and backported
to stable IMO.

Thanks!

> Thanks
>
>
> > In that regard, this commit needs to be marked as "Fixes: ...", either
> > ("a5bd058 vhost-vdpa: batch updating IOTLB mappings") or maybe better
> > ("4d191cf vhost-vdpa: classify one time request"). We have a
> > regression if we introduce both, or the second one and the support of
> > any other backend feature.
> >
> >> Noted that the VHOST_SET_BACKEND_FEATURES ioctl is not per-vq
> >> and it doesn't even need to. There seems to me no possibility for it t=
o
> >> fail in a way as thought here. The capture is that IOTLB batching is a=
t
> >> least a vdpa device level backend feature, if not per-kernel. Same as
> >> IOTLB_MSG_V2.
> >>
> > At this moment it is per-kernel, yes. With your patch there is no need
> > to fail because of the lack of _F_IOTLB_BATCH, the code should handle
> > this case ok.
> >
> > But if VHOST_GET_BACKEND_FEATURES returns no support for
> > VHOST_BACKEND_F_IOTLB_MSG_V2, the qemu code will happily send v2
> > messages anyway. This has nothing to do with the patch, I'm just
> > noting it here.
> >
> > In that case, maybe it is better to return something like -ENOTSUP?
> >
> > Thanks!
> >
> >> -Siwei
> >>
> >>>    Some open questions:
> >>>
> >>> Should we make the vdpa driver return error as long as a feature is
> >>> used but not set by qemu, or let it as undefined? I guess we have to
> >>> keep the batching at least without checking so the kernel supports ol=
d
> >>> versions of qemu.
> >>>
> >>> On the other hand, should we return an error if IOTLB_MSG_V2 is not
> >>> supported here? We're basically assuming it in other functions.
> >>>
> >>>> To fix it, send down ioctl only once via the first
> >>>> vhost_dev with index 0. Toggle the polarity of the
> >>>> vhost_vdpa_one_time_request() test would do the trick.
> >>>>
> >>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> >>> Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>
> >>>> ---
> >>>>    hw/virtio/vhost-vdpa.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>>> index c5ed7a3..27ea706 100644
> >>>> --- a/hw/virtio/vhost-vdpa.c
> >>>> +++ b/hw/virtio/vhost-vdpa.c
> >>>> @@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct vho=
st_dev *dev)
> >>>>
> >>>>        features &=3D f;
> >>>>
> >>>> -    if (vhost_vdpa_one_time_request(dev)) {
> >>>> +    if (!vhost_vdpa_one_time_request(dev)) {
> >>>>            r =3D vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &f=
eatures);
> >>>>            if (r) {
> >>>>                return -EFAULT;
> >>>> --
> >>>> 1.8.3.1
> >>>>
>


