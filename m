Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C734EE9C3
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:29:44 +0200 (CEST)
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCf9-0001XI-MN
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:29:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1naCYB-0004Pb-Tz
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:22:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1naCYA-0007RO-4I
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648801348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CqCQP2iTaPg5hGKFXg2mLflDcwhXHyn+LXPw+v8WXT4=;
 b=jEVwqWGluvkydWfTdzq4jA7mdJztvP71W5S2+WBWI4WMFZjAHojWIuKgY1uDwUMUW69QkT
 S4AQnpKuyfeLHn6hnitvQrc2Hze+SnKEOpYoY+gZmH9A2Ef8M7HlGHVLqEfA9DDeTS6t4d
 Ro/SMBqHkmFyTdYsbYfkcCyh5Ckj5eI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-kt6cNhjmPja7qC6gZCshmw-1; Fri, 01 Apr 2022 04:22:28 -0400
X-MC-Unique: kt6cNhjmPja7qC6gZCshmw-1
Received: by mail-qv1-f69.google.com with SMTP id
 z2-20020a056214060200b00440d1bc7815so1538796qvw.1
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 01:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CqCQP2iTaPg5hGKFXg2mLflDcwhXHyn+LXPw+v8WXT4=;
 b=rjQzkyZog4paze7Xus2gqWXWOCu+93ql8qz23t4GZuN70f3csCmhn8cvS9s6X2a4TG
 +NJcPv4zO04gZd4jA0ACf8WwCmEAInNgXyw1Ui+eDWzqR2QkKyA85std2tBsAphw5yWN
 3E0zaSEKnITWeAY3nppEbB6+h1OmRSTFiKW+nFbmLqcfm/11kuBF+c+uZ7fwN0697F2A
 rj9Q+Ui630rEAptF6UaN1mxuEcrKr15W09fUQsoq6CiQrOAcjhp01FDW7KMxnDeWddmg
 9JTUYRvlZufgbbHoSEI25r0f8zP6efNX6zvGEhulrL2++rqyNDBJN6umqinUGvU8JRSm
 VcXw==
X-Gm-Message-State: AOAM531BcUWrTu+ktEKSQuqqVIQQSMyGCfMZD0A27bFkMwSobLVbWEJb
 VlVQ7ODBIz4QViP9uIHKKfuv2I4nhVrlgW6Bc/HPVALgyhhxasqF8OWo6NspWW91ScSTBPqAu7t
 QbO9ZTb/+8v+dG9WtjrLHyMg4qY51IqA=
X-Received: by 2002:ac8:5a0b:0:b0:2eb:9af4:c920 with SMTP id
 n11-20020ac85a0b000000b002eb9af4c920mr3945882qta.221.1648801347301; 
 Fri, 01 Apr 2022 01:22:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWj7ejHyZjv5qNvhAK27UxbUK4b6szq9b9T2oXhd28005RLW8Qz+YVTz7L786jf3+ri0ZxF+zBXiW+hBji/3c=
X-Received: by 2002:ac8:5a0b:0:b0:2eb:9af4:c920 with SMTP id
 n11-20020ac85a0b000000b002eb9af4c920mr3945872qta.221.1648801347033; Fri, 01
 Apr 2022 01:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
 <CAJaqyWdF55nKD05C54OOvM5-mmsCG7FMixKLguPGNR4Ostqnmw@mail.gmail.com>
 <f8ace3a3-8f86-841e-c056-271528d5ba9c@oracle.com>
 <CAJaqyWfb5=bEQGiGHamwqgBAvQf2FKEr8SwgVsa1LM2N-v48oQ@mail.gmail.com>
 <778d216b-dba6-0783-177c-cbb766c8f12a@oracle.com>
In-Reply-To: <778d216b-dba6-0783-177c-cbb766c8f12a@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 1 Apr 2022 10:21:51 +0200
Message-ID: <CAJaqyWfzWePq3dVHkcCyeOYVMzTKe-veXT5gRNTVhdNX3w5iqg@mail.gmail.com>
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-level <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:15 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 3/31/2022 1:02 AM, Eugenio Perez Martin wrote:
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
> > VHOST_IOTLB_BATCH_BEGIN will fail.
> This is not what I see from the code? For e.g.
> vhost_vdpa_iotlb_batch_begin_once() has the following:
>
>   140     if (v->dev->backend_cap & (0x1ULL <<
> VHOST_BACKEND_F_IOTLB_BATCH) &&
>   141         !v->iotlb_batch_begin_sent) {
>   142         vhost_vdpa_listener_begin_batch(v);
>   143     }
>
> If backend_cap doesn't contain the VHOST_BACKEND_F_IOTLB_BATCH bit, QEMU
> shouldn't send down VHOST_IOTLB_BATCH_BEGIN...
>
> Noted in vhost_vdpa_set_backend_cap(), VHOST_GET_BACKEND_FEATURES was
> supposed to get the backend capability from the kernel ahead of the
> VHOST_SET_BACKEND_FEATURES call. In which case of your concern, at least
> feature VHOST_BACKEND_F_IOTLB_MSG_V2 should be successfully returned and
> stored in the backend_cap, even if the VHOST_SET_BACKEND_FEATURES ioctl
> was missed in between. Hence the resulting backend_cap shouldn't have
> the VHOST_BACKEND_F_IOTLB_BATCH bit set. What am I missing here?
>

You're right, I missed that the GET is not skipped, thanks!

>
> >   I didn't test what happens next but
> > it probably cannot continue.
> >
> > In that regard, this commit needs to be marked as "Fixes: ...", either
> > ("a5bd058 vhost-vdpa: batch updating IOTLB mappings") or maybe better
> > ("4d191cf vhost-vdpa: classify one time request"). We have a
> > regression if we introduce both, or the second one and the support of
> > any other backend feature.
> Sure, it's not that I am unwilling to add the "Fixes" tag, though I'd
> like to make sure if the worry is real upfront. Thanks for pointing it
> out anyway.
>
> Thanks,
> -Siwei
>
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


