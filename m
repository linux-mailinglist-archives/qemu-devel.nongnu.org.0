Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39654BF343
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 09:13:21 +0100 (CET)
Received: from localhost ([::1]:35720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMQIS-0007x5-IC
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 03:13:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nMQBv-00058z-BS
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:06:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nMQBr-0000pb-Bk
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645517183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8oewlzuH5VaZoiKZOwm2mm+r14chgc/lRRFyNyarmOo=;
 b=cX/gXGRzsKC6VVPGwGRDimdc6uR4lkpyIHBNGHguPS/SWzra7KNwVgPzrBpyTAmZ0AgtUJ
 3aWYmLcIRzmSJK4Oe3grUPEtPFLSc1y78W5IrV8oiOLopKGmbWGjeItEo4OnE67xVSt6Cv
 zI/3M947RFJvVdB7XE0BGNbYNltigbM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-VjyG1HW5OAi0ohoWjwraPg-1; Tue, 22 Feb 2022 03:06:22 -0500
X-MC-Unique: VjyG1HW5OAi0ohoWjwraPg-1
Received: by mail-qv1-f72.google.com with SMTP id
 l3-20020a0ce503000000b0042c0129c766so20058986qvm.20
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 00:06:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8oewlzuH5VaZoiKZOwm2mm+r14chgc/lRRFyNyarmOo=;
 b=RTLUf108W7jHll6n6AncB2qjrfyhy4hpzX0ZuGH0vzZiinJcpfZ57be8mdmIoUpjHe
 0R7DUKHpCi60h7cbC7C4f7N58yWdT9xPDpydPJEZPNvlOr4+IhvsLR2WxirNeU+3wXLl
 7FKiU7x72gRieQfVsDU59ERWD5WMHGOtQfVULBG9nB+sIi1d6NWr0v0+w1XOaTQbXTpF
 iio/GoLttvdYbaTnzLOTYl4gPIEW4xZsBmqnLU9/syzW05ya+bcYYYHmF6ivFxzN6e9U
 /MKUHH8xLJ99UxWiB/X36TR09Vdjtg1H5QOBFP4VrMoZCKsNcGeFotyKlH/3axLZ5Vp0
 nFsA==
X-Gm-Message-State: AOAM531ls+L0+/xhCR404CAhxEvc4bfhMO+JLViCv4iA3rA6GYu2vjAx
 aJRig2JrrzkoTXsC6YwG7IUY8bNf+smCYQ6jUO7v+SD1wRhjkwF40c7fXHIxSTvyidvujFZ7Eei
 CgVEzvBVj74VVeZioIZsw8vKiVtXMJ6A=
X-Received: by 2002:a37:9fce:0:b0:506:ec02:15a6 with SMTP id
 i197-20020a379fce000000b00506ec0215a6mr14390782qke.406.1645517181493; 
 Tue, 22 Feb 2022 00:06:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLuvSBeuklyZwGwigv3uwqVtfC4SKhByJWjJIp3AXtDZ4AymmK+j9XWJ2JCTR5DM0X60y4zVJpCHDus86teh8=
X-Received: by 2002:a37:9fce:0:b0:506:ec02:15a6 with SMTP id
 i197-20020a379fce000000b00506ec0215a6mr14390754qke.406.1645517181159; Tue, 22
 Feb 2022 00:06:21 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-29-eperezma@redhat.com>
 <42664143-6d0c-b107-ec90-8e6336bae29b@redhat.com>
 <CAJaqyWdBLU+maEhByepzeH7iwLmqUba0rRb8PM4VwBy2P8Vtow@mail.gmail.com>
 <9b32f664-56a9-3718-cf48-49003f87d430@redhat.com>
 <CAJaqyWcvWjPas0=xp+U-c-kG+e6k73jg=C4phFD7S-tZY=niSQ@mail.gmail.com>
 <CACGkMEtbd9RsE9f-HLnwmhJEFsK++uBHnqG4N0c6qJG0PxDdzw@mail.gmail.com>
 <CAJaqyWdhHmD+tB_bY_YEMnBU1p7-LW=LP8f+3e_ZXDcOfSRiNA@mail.gmail.com>
 <0f0204f1-8b7f-a21e-495e-24443a63f026@redhat.com>
In-Reply-To: <0f0204f1-8b7f-a21e-495e-24443a63f026@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 22 Feb 2022 09:05:45 +0100
Message-ID: <CAJaqyWfFC4SgxQ4zQeHgtDDJSd0tBa-W4HmtW0UASA2cVDWDUg@mail.gmail.com>
Subject: Re: [PATCH 28/31] vdpa: Expose VHOST_F_LOG_ALL on SVQ
To: Jason Wang <jasowang@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 8:41 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/17 =E4=B8=8B=E5=8D=884:22, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > On Thu, Feb 17, 2022 at 7:02 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Wed, Feb 16, 2022 at 11:54 PM Eugenio Perez Martin
> >> <eperezma@redhat.com> wrote:
> >>> On Tue, Feb 8, 2022 at 9:25 AM Jason Wang <jasowang@redhat.com> wrote=
:
> >>>>
> >>>> =E5=9C=A8 2022/2/1 =E4=B8=8B=E5=8D=887:45, Eugenio Perez Martin =E5=
=86=99=E9=81=93:
> >>>>> On Sun, Jan 30, 2022 at 7:50 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> >>>>>> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> >>>>>>> SVQ is able to log the dirty bits by itself, so let's use it to n=
ot
> >>>>>>> block migration.
> >>>>>>>
> >>>>>>> Also, ignore set and clear of VHOST_F_LOG_ALL on set_features if =
SVQ is
> >>>>>>> enabled. Even if the device supports it, the reports would be non=
sense
> >>>>>>> because SVQ memory is in the qemu region.
> >>>>>>>
> >>>>>>> The log region is still allocated. Future changes might skip that=
, but
> >>>>>>> this series is already long enough.
> >>>>>>>
> >>>>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>>>> ---
> >>>>>>>     hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++++
> >>>>>>>     1 file changed, 20 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>>>>>> index fb0a338baa..75090d65e8 100644
> >>>>>>> --- a/hw/virtio/vhost-vdpa.c
> >>>>>>> +++ b/hw/virtio/vhost-vdpa.c
> >>>>>>> @@ -1022,6 +1022,9 @@ static int vhost_vdpa_get_features(struct v=
host_dev *dev, uint64_t *features)
> >>>>>>>         if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> >>>>>>>             /* Filter only features that SVQ can offer to guest *=
/
> >>>>>>>             vhost_svq_valid_guest_features(features);
> >>>>>>> +
> >>>>>>> +        /* Add SVQ logging capabilities */
> >>>>>>> +        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> >>>>>>>         }
> >>>>>>>
> >>>>>>>         return ret;
> >>>>>>> @@ -1039,8 +1042,25 @@ static int vhost_vdpa_set_features(struct =
vhost_dev *dev,
> >>>>>>>
> >>>>>>>         if (v->shadow_vqs_enabled) {
> >>>>>>>             uint64_t dev_features, svq_features, acked_features;
> >>>>>>> +        uint8_t status =3D 0;
> >>>>>>>             bool ok;
> >>>>>>>
> >>>>>>> +        ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &sta=
tus);
> >>>>>>> +        if (unlikely(ret)) {
> >>>>>>> +            return ret;
> >>>>>>> +        }
> >>>>>>> +
> >>>>>>> +        if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
> >>>>>>> +            /*
> >>>>>>> +             * vhost is trying to enable or disable _F_LOG, and =
the device
> >>>>>>> +             * would report wrong dirty pages. SVQ handles it.
> >>>>>>> +             */
> >>>>>> I fail to understand this comment, I'd think there's no way to dis=
able
> >>>>>> dirty page tracking for SVQ.
> >>>>>>
> >>>>> vhost_log_global_{start,stop} are called at the beginning and end o=
f
> >>>>> migration. To inform the device that it should start logging, they =
set
> >>>>> or clean VHOST_F_LOG_ALL at vhost_dev_set_log.
> >>>>
> >>>> Yes, but for SVQ, we can't disable dirty page tracking, isn't it? Th=
e
> >>>> only thing is to ignore or filter out the F_LOG_ALL and pretend to b=
e
> >>>> enabled and disabled.
> >>>>
> >>> Yes, that's what this patch does.
> >>>
> >>>>> While SVQ does not use VHOST_F_LOG_ALL, it exports the feature bit =
so
> >>>>> vhost does not block migration. Maybe we need to look for another w=
ay
> >>>>> to do this?
> >>>>
> >>>> I'm fine with filtering since it's much more simpler, but I fail to
> >>>> understand why we need to check DRIVER_OK.
> >>>>
> >>> Ok maybe I can make that part more clear,
> >>>
> >>> Since both operations use vhost_vdpa_set_features we must just filter
> >>> the one that actually sets or removes VHOST_F_LOG_ALL, without
> >>> affecting other features.
> >>>
> >>> In practice, that means to not forward the set features after
> >>> DRIVER_OK. The device is not expecting them anymore.
> >> I wonder what happens if we don't do this.
> >>
> > If we simply delete the check vhost_dev_set_features will return an
> > error, failing the start of the migration. More on this below.
>
>
> Ok.
>
>
> >
> >> So kernel had this check:
> >>
> >>          /*
> >>           * It's not allowed to change the features after they have
> >>           * been negotiated.
> >>           */
> >> if (ops->get_status(vdpa) & VIRTIO_CONFIG_S_FEATURES_OK)
> >>          return -EBUSY;
> >>
> >> So is it FEATURES_OK actually?
> >>
> > Yes, FEATURES_OK seems more appropriate actually so I will switch to
> > it for the next version.
> >
> > But it should be functionally equivalent, since
> > vhost.c:vhost_dev_start sets both and the setting of _F_LOG_ALL cannot
> > be concurrent with it.
>
>
> Right.
>
>
> >
> >> For this patch, I wonder if the thing we need to do is to see whether
> >> it is a enable/disable F_LOG_ALL and simply return.
> >>
> > Yes, that's the intention of the patch.
> >
> > We have 4 cases here:
> > a) We're being called from vhost_dev_start, with enable_log =3D false
> > b) We're being called from vhost_dev_start, with enable_log =3D true
>
>
> And this case makes us can't simply return without calling vhost-vdpa.
>

It calls because {FEATURES,DRIVER}_OK is still not set at that point.

>
> > c) We're being called from vhost_dev_set_log, with enable_log =3D false
> > d) We're being called from vhost_dev_set_log, with enable_log =3D true
> >
> > The way to tell the difference between a/b and c/d is to check if
> > {FEATURES,DRIVER}_OK is set. And, as you point out in previous mails,
> > F_LOG_ALL must be filtered unconditionally since SVQ tracks dirty
> > memory through the memory unmapping, so we clear the bit
> > unconditionally if we detect that VHOST_SET_FEATURES will be called
> > (cases a and b).
> >
> > Another possibility is to track if features have been set with a bool
> > in vhost_vdpa or something like that. But it seems cleaner to me to
> > only store that in the actual device.
>
>
> So I suggest to make sure codes match the comment:
>
>          if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
>              /*
>               * vhost is trying to enable or disable _F_LOG, and the devi=
ce
>               * would report wrong dirty pages. SVQ handles it.
>               */
>              return 0;
>          }
>
> It would be better to check whether the caller is toggling _F_LOG_ALL in
> this case.
>

How to detect? We can save feature flags and compare, but ignoring all
set_features after FEATURES_OK seems simpler to me.

Would changing the comment work? Something like "set_features after
_S_FEATURES_OK means vhost is trying to enable or disable _F_LOG, and
the device would report wrong dirty pages. SVQ handles it."

Thanks!

> Thanks
>
>
> >
> >> Thanks
> >>
> >>> Does that make more sense?
> >>>
> >>> Thanks!
> >>>
> >>>> Thanks
> >>>>
> >>>>
> >>>>> Thanks!
> >>>>>
> >>>>>> Thanks
> >>>>>>
> >>>>>>
> >>>>>>> +            return 0;
> >>>>>>> +        }
> >>>>>>> +
> >>>>>>> +        /* We must not ack _F_LOG if SVQ is enabled */
> >>>>>>> +        features &=3D ~BIT_ULL(VHOST_F_LOG_ALL);
> >>>>>>> +
> >>>>>>>             ret =3D vhost_vdpa_get_dev_features(dev, &dev_feature=
s);
> >>>>>>>             if (ret !=3D 0) {
> >>>>>>>                 error_report("Can't get vdpa device features, got=
 (%d)", ret);
>


