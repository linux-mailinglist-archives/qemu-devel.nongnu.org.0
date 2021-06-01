Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23490396DCE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 09:15:01 +0200 (CEST)
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnyc7-0004Cy-Nu
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 03:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lnybC-0003WJ-W4
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 03:14:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lnyb9-0003xT-7U
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 03:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622531637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gt70psrQya4EUNcW9Uaxi0wJrgLNxUAHI6BHTCa9Is0=;
 b=IVv4/tEzpNFJmcMFkg3UFE5SnP6X/KcgOdrWc06E+xkZgWey08owSXWCptrDpJz3tPjdE3
 aQy9ADylBxjBuMhtgzNevNDlg8NvdtNlWYZZHc6lEl/SsY3ENlFIWoDWRmMBXrDRJgwYnB
 xlcJOAB/Vmg3O8VYDFNT78tmzt/HU3M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-do77TlL5NR22nAEs6juXiw-1; Tue, 01 Jun 2021 03:13:55 -0400
X-MC-Unique: do77TlL5NR22nAEs6juXiw-1
Received: by mail-qv1-f70.google.com with SMTP id
 w14-20020a056214012eb02901f3a4388530so10759118qvs.17
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 00:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gt70psrQya4EUNcW9Uaxi0wJrgLNxUAHI6BHTCa9Is0=;
 b=E7Jz9xElotBfp8kOKBjGhOj3CAF504Q8gVLXLn2zVD6X9wocMu10JzmDX/agokibSt
 zrF7xIw7HoG/qUxRD2hr9KW2Xi8oezMv1K8BFViNlBKkwSKXjy3+bTIlxdQfQNC+Fh5C
 dWGC06qL2XP9nUEUnfKFlPT4J23Lr+pXIAmhRXzmuiAk+s20e++uxc1QHDOTnnw5tZC3
 3I8+Mt0dnSPzJDg47rQqj9+21uprhyc/ZnUa75tKUePPMH68UX5Mww2Xa1wRrtZVPx/q
 LlagpF2rgJlH769G6ba9vXF9O8UV51cmrHAkkeoxRn2MdBvNA2ULqMMZJI+EuxEJP6Ud
 HfdA==
X-Gm-Message-State: AOAM532Y/aKHvQTpD/zMzZp59DjJVcpCCeOO3YaEHDmRVZis/XLg6QG7
 UgEpt63q1gAn/U/FeRDfQoNi2Ad7yogcaY4UM6VQyeKCeVVqOc3ixx+d60LLERuQq7Z/OmZEZne
 u7yVIFSQJXQ/XdzzQ3QlWRalHc4cmKJc=
X-Received: by 2002:a05:620a:20d7:: with SMTP id
 f23mr20136478qka.484.1622531634501; 
 Tue, 01 Jun 2021 00:13:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTBDZTxATiXvKjj3lrbgfP7a24aKADgu9sOP3/Gt/CcWPGqzrlflZXylkLogNzUdPdvnNuSpOgbYkR/ijp2L0=
X-Received: by 2002:a05:620a:20d7:: with SMTP id
 f23mr20136458qka.484.1622531634270; 
 Tue, 01 Jun 2021 00:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-7-eperezma@redhat.com>
 <e64b9813-66e5-2417-3feb-65f0376db7e0@redhat.com>
 <4146c924-e871-5a94-253e-e9e09456f74b@redhat.com>
In-Reply-To: <4146c924-e871-5a94-253e-e9e09456f74b@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Jun 2021 09:13:18 +0200
Message-ID: <CAJaqyWeV+za=xeKHb9vn=Y+0mfekCb8w5dmWNMgzQ6uOtU3jxw@mail.gmail.com>
Subject: Re: [RFC v3 06/29] virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Harpreet Singh Anand <hanand@xilinx.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 3:10 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/5/26 =E4=B8=8A=E5=8D=889:06, Jason Wang =E5=86=99=E9=81=93=
:
> >
> > =E5=9C=A8 2021/5/20 =E4=B8=8A=E5=8D=8812:28, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >> So the guest can stop and start net device. It implements the RFC
> >> https://lists.oasis-open.org/archives/virtio-comment/202012/msg00027.h=
tml
> >>
> >>
> >> To stop (as "pause") the device is required to migrate status and vrin=
g
> >> addresses between device and SVQ.
> >>
> >> This is a WIP commit: as with VIRTIO_F_QUEUE_STATE, is introduced in
> >> virtio_config.h before of even proposing for the kernel, with no featu=
re
> >> flag, and, with no checking in the device. It also needs a modified
> >> vp_vdpa driver that supports to set and retrieve status.
> >>
> >> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> ---
> >>   include/standard-headers/linux/virtio_config.h | 2 ++
> >>   hw/net/virtio-net.c                            | 4 +++-
> >>   2 files changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/include/standard-headers/linux/virtio_config.h
> >> b/include/standard-headers/linux/virtio_config.h
> >> index 59fad3eb45..b3f6b1365d 100644
> >> --- a/include/standard-headers/linux/virtio_config.h
> >> +++ b/include/standard-headers/linux/virtio_config.h
> >> @@ -40,6 +40,8 @@
> >>   #define VIRTIO_CONFIG_S_DRIVER_OK    4
> >>   /* Driver has finished configuring features */
> >>   #define VIRTIO_CONFIG_S_FEATURES_OK    8
> >> +/* Device is stopped */
> >> +#define VIRTIO_CONFIG_S_DEVICE_STOPPED 32
> >>   /* Device entered invalid state, driver must reset it */
> >>   #define VIRTIO_CONFIG_S_NEEDS_RESET    0x40
> >>   /* We've given up on this device. */
> >> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >> index 96a3cc8357..2d3caea289 100644
> >> --- a/hw/net/virtio-net.c
> >> +++ b/hw/net/virtio-net.c
> >> @@ -198,7 +198,9 @@ static bool virtio_net_started(VirtIONet *n,
> >> uint8_t status)
> >>   {
> >>       VirtIODevice *vdev =3D VIRTIO_DEVICE(n);
> >>       return (status & VIRTIO_CONFIG_S_DRIVER_OK) &&
> >> -        (n->status & VIRTIO_NET_S_LINK_UP) && vdev->vm_running;
> >> +        (!(n->status & VIRTIO_CONFIG_S_DEVICE_STOPPED)) &&
> >> +        (n->status & VIRTIO_NET_S_LINK_UP) &&
> >> +        vdev->vm_running;
> >>   }
> >>     static void virtio_net_announce_notify(VirtIONet *net)
> >
> >
> > It looks to me this is only the part of pause.
>

For SVQ we need to switch vring addresses, and a full reset of the
device is required for that. Actually, the pause is just used to
recover

If you prefer this could be sent as a separate series where the full
pause/resume cycle is implemented, and then SVQ uses the pause part.
However there are no use for the resume part at the moment.

>
> And even for pause, I don't see anything that prevents rx/tx from being
> executed? (E.g virtio_net_handle_tx_bh or virtio_net_handle_rx).
>

virtio_net_started is called from virtio_net_set_status. If
_S_DEVICE_STOPPED is true, the former return false, and variable
queue_started is false in the latter:
  queue_started =3D
            virtio_net_started(n, queue_status) && !n->vhost_started;

After that, it should work like a regular device reset or link down if
I'm not wrong, and the last part of virtio_net_set_status should
delete timer or cancel bh.

> Thanks
>
>
> > We still need the resume?
> >
> > Thanks
> >
> >
>


