Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E78308746
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:15:03 +0100 (CET)
Received: from localhost ([::1]:36532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Prq-0005uI-Ev
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5PqY-00054q-AC
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:13:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5PqV-0002kk-Cn
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611911618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkueEu7LkM9y8+zXCxLE29UNYOYgnwWj7A7Hkngym98=;
 b=SM4OjoJ2MMSEBjE/hFcC1vc7b3yzdeu8MH4EVeKmstk7Flnu13WGeoqlesTBS1KaYqt7eM
 qUJQa7N0OkcVifn+NNaKbj3kf4TzCEeSUiocZ2nuxcn+/LRgcS9a41TDdcWVGugIGX0Njq
 nLmVin+p+/bea3zbq9l17x1vrPfI+WY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-yncuuWvjMmi3W2dkbeJnBQ-1; Fri, 29 Jan 2021 04:13:35 -0500
X-MC-Unique: yncuuWvjMmi3W2dkbeJnBQ-1
Received: by mail-qv1-f69.google.com with SMTP id n1so2994109qvi.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 01:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OkueEu7LkM9y8+zXCxLE29UNYOYgnwWj7A7Hkngym98=;
 b=V+3hNUzAr909M5acPxBq+K/hBoK5nupAPoJ34G6qdk/gA7iNSIGuEWcIG2StrFGWeo
 7zS+vABHxoGswQHtNnccor2ajp6aZfO9cE7LJb81nALvjAVeMIA5OjyTY48cSFTpDZuw
 IFjtvFCnxyCCwVnR2dRSV4eKrjFGVkUNv6uukIq/ILry/dFSxT1RJ71QOT4Mvuvr6Z9G
 9XmalRMrDY/FJF6X6epicZF3sZSfcho29PPf0S93lejjtJN9tXkW1+1PiBeuZrME6EhW
 iuG4axtg1WMMvQqNI2LQY02vl6ybuiZBKdh6YVAJdGNb96NPe2ij+yC4Bt7ViMQP/EbG
 UBNQ==
X-Gm-Message-State: AOAM5335I1Jqq+ZTrjTPi4tvFr/Vs422s6Ij8m0i+y9/82WEgKffSSCs
 cr3kShRz8v5z8oGA81FaioK4+Ugh/CNdvWMtBqDxoppnzE7Eq+S2ybxdlJNignOQNelbzjc8IQO
 VVRnLBbXhonmYwQHAvVirGIndF+geQOQ=
X-Received: by 2002:ac8:6b8a:: with SMTP id z10mr3596621qts.384.1611911615193; 
 Fri, 29 Jan 2021 01:13:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwx03YAOiwmkC0NjqQ9boJM9uMAWG8sTqNeeeLjs2GUaRGNucMWneKwafRebFpWN0/6iCRU8W5pO8WVBV9L4nM=
X-Received: by 2002:ac8:6b8a:: with SMTP id z10mr3596586qts.384.1611911614486; 
 Fri, 29 Jan 2021 01:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20210127204449.745365-1-eperezma@redhat.com>
 <ad299544-8762-a5fd-e102-1cf9829131fb@redhat.com>
 <CAJaqyWfUaS9+xKJ8FM9JHnu7YBP9=p9FjNKG067X0waeiVhAXQ@mail.gmail.com>
 <f8e073ee-1d95-3ab9-0d86-ca2b64416026@redhat.com>
 <CAJaqyWdV=zrAz8VT4O3+Tyj-ct5Zr52Zj_qAPvs-1mWNk_5FHQ@mail.gmail.com>
 <3d5b7b31-59ea-0ed6-6bfe-0fa280d5a3af@redhat.com>
In-Reply-To: <3d5b7b31-59ea-0ed6-6bfe-0fa280d5a3af@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 29 Jan 2021 10:12:58 +0100
Message-ID: <CAJaqyWdTkc3tejkiAUrGhQPD5Pf12eRL=w5sOKLb08aEGQuNNg@mail.gmail.com>
Subject: Re: [PATCH] vhost-user: Check for iotlb callback in iotlb_miss
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 8:29 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/29 =E4=B8=8B=E5=8D=883:22, Eugenio Perez Martin wrote:
> > On Fri, Jan 29, 2021 at 4:29 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On 2021/1/28 =E4=B8=8B=E5=8D=885:37, Eugenio Perez Martin wrote:
> >>> Hi Jason.
> >>>
> >>> On Thu, Jan 28, 2021 at 3:32 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>> On 2021/1/28 =E4=B8=8A=E5=8D=884:44, Eugenio P=C3=A9rez wrote:
> >>>>> Not registering this can lead to vhost_backend_handle_iotlb_msg and
> >>>>> vhost_device_iotlb_miss if backend issue a miss after qemu vhost de=
vice
> >>>>> stop.
> >>>>>
> >>>>> This causes a try to access dev->vdev->dma_as with vdev =3D=3D NULL=
.
> >>>> Hi Eugenio:
> >>>>
> >>>> What condition can we get this? Did you mean we receive IOTLB_MISS
> >>>> before vhost_dev_start()?
> >>>>
> >>> In the VM reboot case, yes, between vhost_dev_stop() and
> >>> vhost_dev_start(). But I can reproduce the bug in VM shutdown too,
> >>> with no vhost_dev_start expected.
> >>>
> >>> I didn't try to send IOTLB_MISS before starting vhost_dev, but this
> >>> patch should solve that problem too.
> >>>
> >>> I think we can get this with whatever malicious/buggy vhost-user
> >>> backend sending unexpected iotlb misses, but I didn't test so deeply.
> >>
> >> I see.
> >>
> >>
> >>>> If yes, it looks to me a bug somewhere else.
> >>> Where should I look for it?
> >>
> >> So I winder whether or not we can simply ignore IOTLB message if vhost
> >> device is not started.
> >>
> > Do you mean like an early return in vhost_device_iotlb_miss?
>
>
> Yes or probably a little bit earlier in vhost_backend_handle_iotlb_msg()
> which somehow a warn there.
>
> Anyhow it's meaningless to process IOTLB message in this case and we
> don't need to introduce a dedicated variable for this.
>

Start a new series, since the patch title does not reflect the changes anym=
ore:

https://patchew.org/QEMU/20210129090728.831208-1-eperezma@redhat.com/

Thanks!

> Thanks
>
>
> > That was
> > my first first option, but this seems cleaner to me. I'm ok with both
> > options.
> >
> > Or do you mean not to return -EFAULT but 0 if !u->iotlb_enabled ?
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>
> >>> Thanks!
> >>>
> >>>> Thanks
> >>>>
> >>>>
> >>>>> Reproduced rebooting a guest with testpmd in txonly forward mode.
> >>>>>     #0  0x0000559ffff94394 in vhost_device_iotlb_miss (
> >>>>>         dev=3Ddev@entry=3D0x55a0012f6680, iova=3D10245279744, write=
=3D1)
> >>>>>         at ../hw/virtio/vhost.c:1013
> >>>>>     #1  0x0000559ffff9ac31 in vhost_backend_handle_iotlb_msg (
> >>>>>         imsg=3D0x7ffddcfd32c0, dev=3D0x55a0012f6680)
> >>>>>         at ../hw/virtio/vhost-backend.c:411
> >>>>>     #2  vhost_backend_handle_iotlb_msg (dev=3Ddev@entry=3D0x55a0012=
f6680,
> >>>>>         imsg=3Dimsg@entry=3D0x7ffddcfd32c0)
> >>>>>         at ../hw/virtio/vhost-backend.c:404
> >>>>>     #3  0x0000559fffeded7b in slave_read (opaque=3D0x55a0012f6680)
> >>>>>         at ../hw/virtio/vhost-user.c:1464
> >>>>>     #4  0x000055a0000c541b in aio_dispatch_handler (
> >>>>>         ctx=3Dctx@entry=3D0x55a0010a2120, node=3D0x55a0012d9e00)
> >>>>>         at ../util/aio-posix.c:329
> >>>>>
> >>>>> Fixes: 6dcdd06e3b ("spec/vhost-user spec: Add IOMMU support")
> >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>> ---
> >>>>>     hw/virtio/vhost-user.c | 10 ++++++++--
> >>>>>     1 file changed, 8 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> >>>>> index 2fdd5daf74..a49b2229fb 100644
> >>>>> --- a/hw/virtio/vhost-user.c
> >>>>> +++ b/hw/virtio/vhost-user.c
> >>>>> @@ -238,6 +238,7 @@ struct vhost_user {
> >>>>>         /* Shared between vhost devs of the same virtio device */
> >>>>>         VhostUserState *user;
> >>>>>         int slave_fd;
> >>>>> +    bool iotlb_enabled;
> >>>>>         NotifierWithReturn postcopy_notifier;
> >>>>>         struct PostCopyFD  postcopy_fd;
> >>>>>         uint64_t           postcopy_client_bases[VHOST_USER_MAX_RAM=
_SLOTS];
> >>>>> @@ -1461,7 +1462,11 @@ static void slave_read(void *opaque)
> >>>>>
> >>>>>         switch (hdr.request) {
> >>>>>         case VHOST_USER_SLAVE_IOTLB_MSG:
> >>>>> -        ret =3D vhost_backend_handle_iotlb_msg(dev, &payload.iotlb=
);
> >>>>> +        if (likely(u->iotlb_enabled)) {
> >>>>> +            ret =3D vhost_backend_handle_iotlb_msg(dev, &payload.i=
otlb);
> >>>>> +        } else {
> >>>>> +            ret =3D -EFAULT;
> >>>>> +        }
> >>>>>             break;
> >>>>>         case VHOST_USER_SLAVE_CONFIG_CHANGE_MSG :
> >>>>>             ret =3D vhost_user_slave_handle_config_change(dev);
> >>>>> @@ -2044,7 +2049,8 @@ static int vhost_user_send_device_iotlb_msg(s=
truct vhost_dev *dev,
> >>>>>
> >>>>>     static void vhost_user_set_iotlb_callback(struct vhost_dev *dev=
, int enabled)
> >>>>>     {
> >>>>> -    /* No-op as the receive channel is not dedicated to IOTLB mess=
ages. */
> >>>>> +    struct vhost_user *u =3D dev->opaque;
> >>>>> +    u->iotlb_enabled =3D enabled;
> >>>>>     }
> >>>>>
> >>>>>     static int vhost_user_get_config(struct vhost_dev *dev, uint8_t=
 *config,
>


