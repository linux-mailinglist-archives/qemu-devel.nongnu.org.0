Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6190B1D2D86
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 12:52:43 +0200 (CEST)
Received: from localhost ([::1]:36158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZBTm-0004gG-GL
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 06:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jZBSr-0004Fb-I7
 for qemu-devel@nongnu.org; Thu, 14 May 2020 06:51:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45768
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jZBSp-0007HS-St
 for qemu-devel@nongnu.org; Thu, 14 May 2020 06:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589453502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Q+pebQZ4PHFpeWOCq0aYOP2v3JlfmQ0wnWtAqDSQdU=;
 b=El+g1pccuysuuEVVXlscSmQLhSd1Nc5PRJ7ojgCz0F/IPsfZb57VAQHtskJER8NaxM0fBD
 v4jus+oqovKAZTGxC79YeBDhuuZk+alzE5vu/dOcXDakeOUKyDFf94rgNcyQSqAw9VsgZN
 zirY0zMTMRhIZdNF6MDqjzRSXVIUTfI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-gHjTHPkxOiKzhnmd3BbTgA-1; Thu, 14 May 2020 06:51:41 -0400
X-MC-Unique: gHjTHPkxOiKzhnmd3BbTgA-1
Received: by mail-wm1-f71.google.com with SMTP id l21so13302763wmh.2
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 03:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/Q+pebQZ4PHFpeWOCq0aYOP2v3JlfmQ0wnWtAqDSQdU=;
 b=qDj8+nVrLvOBMXcw0p8qZ22fy7R3ZVmN0np0OqnUlv/uoj8NmLZ17VmdGyg8R7gykg
 XYvo4EuOHlEUPtjhpjZd6flqlinW0D1Pdw2Di7dUH+IzFZVbYe03DXIB/qthUVfnmPv3
 bQTOsZszKvpvVhWeAhRCeb9km6XZBJjLL8fE4Pjq96yCzI+tQuWlYaLvDTnySR+rMTMb
 b1ylPqgHSwZfNdYmoHD+9jKDInArdFa1qwUp0i+WGEgEjMZl7cG8lrYQBatpKy/yO8f4
 x0sgFjBVLaDtHpOvMQ34oOf7swFHVWumFNLx7GnFTuh5WSzLky+IVwz3HqCMsD5noMc+
 q8Sg==
X-Gm-Message-State: AOAM532UOLBy5/P9HR1s60PEuA1mdxoEm6Fg99VPOnxHJE/bsRcGRNdI
 nFgvu3O3JuLGqKDW1xN8PydOWOXWsaljnp1DXNLm0RETe2QAD2NqNwWa+24Db8wA6riIJ5CQt9E
 pxnPJCzWFHVhAmWQ=
X-Received: by 2002:adf:a704:: with SMTP id c4mr4687106wrd.303.1589453499974; 
 Thu, 14 May 2020 03:51:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCQhBO3fnGUNrntoKlBKfY4dK4fymEeRQpL/P4+nCiRUDcyBoq3iOv7l2f4Do1l3mniEeS3w==
X-Received: by 2002:adf:a704:: with SMTP id c4mr4687081wrd.303.1589453499640; 
 Thu, 14 May 2020 03:51:39 -0700 (PDT)
Received: from redhat.com (bzq-79-179-68-225.red.bezeqint.net. [79.179.68.225])
 by smtp.gmail.com with ESMTPSA id d6sm3749188wra.63.2020.05.14.03.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 03:51:39 -0700 (PDT)
Date: Thu, 14 May 2020 06:51:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: Re: [PATCH] vhost-user: add support for VHOST_USER_SET_STATUS
Message-ID: <20200514064721-mutt-send-email-mst@kernel.org>
References: <20200514073332.1434576-1-maxime.coquelin@redhat.com>
 <33dae8af-a7ee-e005-f8d5-2b4a038b8211@redhat.com>
 <670d4623-fba9-dba6-8eea-2f1c16f2ad4b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <670d4623-fba9-dba6-8eea-2f1c16f2ad4b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: shahafs@mellanox.com, lulu@redhat.com, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, amorenoz@redhat.com, matan@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 14, 2020 at 12:14:32PM +0200, Maxime Coquelin wrote:
> 
> 
> On 5/14/20 9:53 AM, Jason Wang wrote:
> > 
> > On 2020/5/14 下午3:33, Maxime Coquelin wrote:
> >> It is usefull for the Vhost-user backend to know
> >> about about the Virtio device status updates,
> >> especially when the driver sets the DRIVER_OK bit.
> >>
> >> With that information, no more need to do hazardous
> >> assumptions on when the driver is done with the
> >> device configuration.
> >>
> >> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
> >> ---
> >>
> >> This patch applies on top of Cindy's "vDPA support in qemu"
> >> series, which introduces the .vhost_set_state vhost-backend
> >> ops.
> >>
> >>   docs/interop/vhost-user.rst | 12 ++++++++++++
> >>   hw/net/vhost_net.c          | 10 +++++-----
> >>   hw/virtio/vhost-user.c      | 35 +++++++++++++++++++++++++++++++++++
> >>   3 files changed, 52 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> >> index 3b1b6602c7..f108de7458 100644
> >> --- a/docs/interop/vhost-user.rst
> >> +++ b/docs/interop/vhost-user.rst
> >> @@ -815,6 +815,7 @@ Protocol features
> >>     #define VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD       12
> >>     #define VHOST_USER_PROTOCOL_F_RESET_DEVICE         13
> >>     #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
> >> +  #define VHOST_USER_PROTOCOL_F_STATUS               15
> >>     Master message types
> >>   --------------------
> >> @@ -1263,6 +1264,17 @@ Master message types
> >>       The state.num field is currently reserved and must be set to 0.
> >>   +``VHOST_USER_SET_STATUS``
> >> +  :id: 36
> >> +  :equivalent ioctl: VHOST_VDPA_SET_STATUS
> >> +  :slave payload: N/A
> >> +  :master payload: ``u64``
> >> +
> >> +  When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
> >> +  successfully negotiated, this message is submitted by the master to
> >> +  notify the backend with updated device status as defined in the Virtio
> >> +  specification.
> >> +
> >>   Slave message types
> >>   -------------------
> >>   diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> >> index 463e333531..37f3156dbc 100644
> >> --- a/hw/net/vhost_net.c
> >> +++ b/hw/net/vhost_net.c
> >> @@ -517,10 +517,10 @@ int vhost_set_state(NetClientState *nc, int state)
> >>   {
> >>       struct vhost_net *net = get_vhost_net(nc);
> >>       struct vhost_dev *hdev = &net->dev;
> >> -    if (nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> >> -        if (hdev->vhost_ops->vhost_set_state) {
> >> -                return hdev->vhost_ops->vhost_set_state(hdev, state);
> >> -             }
> >> -        }
> >> +
> >> +    if (hdev->vhost_ops->vhost_set_state) {
> >> +        return hdev->vhost_ops->vhost_set_state(hdev, state);
> >> +    }
> >> +
> >>       return 0;
> >>   }
> >> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> >> index ec21e8fbe8..b7e52d97fc 100644
> >> --- a/hw/virtio/vhost-user.c
> >> +++ b/hw/virtio/vhost-user.c
> >> @@ -59,6 +59,7 @@ enum VhostUserProtocolFeature {
> >>       VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
> >>       VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
> >>       VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
> >> +    VHOST_USER_PROTOCOL_F_STATUS = 15,
> >>       VHOST_USER_PROTOCOL_F_MAX
> >>   };
> >>   @@ -100,6 +101,7 @@ typedef enum VhostUserRequest {
> >>       VHOST_USER_SET_INFLIGHT_FD = 32,
> >>       VHOST_USER_GPU_SET_SOCKET = 33,
> >>       VHOST_USER_RESET_DEVICE = 34,
> >> +    VHOST_USER_SET_STATUS = 36,
> >>       VHOST_USER_MAX
> >>   } VhostUserRequest;
> >>   @@ -1886,6 +1888,38 @@ static int vhost_user_set_inflight_fd(struct
> >> vhost_dev *dev,
> >>       return 0;
> >>   }
> >>   +static int vhost_user_set_state(struct vhost_dev *dev, int state)
> >> +{
> >> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
> >> +                                             
> >> VHOST_USER_PROTOCOL_F_REPLY_ACK);
> >> +
> >> +    VhostUserMsg msg = {
> >> +        .hdr.request = VHOST_USER_SET_STATUS,
> >> +        .hdr.flags = VHOST_USER_VERSION,
> >> +        .hdr.size = sizeof(msg.payload.u64),
> >> +        .payload.u64 = (uint64_t)state,
> >> +    };
> >> +
> >> +    if (!virtio_has_feature(dev->protocol_features,
> >> +                VHOST_USER_PROTOCOL_F_STATUS)) {
> >> +        return -1;
> >> +    }
> >> +
> >> +    if (reply_supported) {
> >> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
> >> +    }
> >> +
> >> +    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> >> +        return -1;
> >> +    }
> >> +
> >> +    if (reply_supported) {
> >> +        return process_message_reply(dev, &msg);
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> > 
> > 
> > Interesting, I wonder how vm stop will be handled in this case.
> 
> For now, my DPDK series only use DRIVER_OK to help determine when the
> driver is done with the initialization. For VM stop, it still relies on
> GET_VRING_BASE.

Sounds like a good fit.
GET_VRING_BASE is transparent to guest, as is vmstop.
This is more for driver 


> 
> GET_VRING_BASE arrives before DRIVER_OK bit is cleared is the tests I've
> done (logs from backend side):


One problem is with legacy guests, for these you can't rely
on DRIVER_OK, they often kick before that, and sometimes
expect buffers to be used too (e.g. for scsi).





> 
> VHOST_CONFIG: read message VHOST_USER_GET_VRING_BASE
> 
> destroy port /tmp/vhost-user1, did: 0
> VHOST_CONFIG: vring base idx:0 file:41
> VHOST_CONFIG: read message VHOST_USER_GET_VRING_BASE
> VHOST_CONFIG: vring base idx:1 file:0
> VHOST_CONFIG: read message VHOST_USER_SET_STATUS
> VHOST_CONFIG: New device status(0x0000000b):
> 	-ACKNOWLEDGE: 1
> 	-DRIVER: 1
> 	-FEATURES_OK: 1
> 	-DRIVER_OK: 0
> 	-DEVICE_NEED_RESET: 0
> 	-FAILED: 0
> 
> > In the case of vDPA kernel, we probable don't want to mirror the virtio
> > device status to vdpa device status directly.
> 
> In vDPA DPDK, we don't mirror the Virtio device status either. It could
> make sense to do that, but would require some API changes.
> 
> > Since qemu may stop
> > vhost-vdpa device through e.g resting vdpa device, but in the mean time,
> > guest should not detect such condition in virtio device status.
> 
> 
> 
> > So in the new version of vDPA support, we probably need to do:
> > 
> > static int vhost_vdpa_set_state(struct vhost_dev *dev, bool started)
> > {
> >     if (started) {
> >         uint8_t status = 0;
> > 
> >         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> >         vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> > 
> >         return !(status & VIRTIO_CONFIG_S_DRIVER_OK);
> >     } else {
> >         vhost_vdpa_reset_device(dev);
> >         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >                                    VIRTIO_CONFIG_S_DRIVER);
> >         return 0;
> >     }
> > }
> 
> IIUC, you have another copy of the status register not matching 1:1 what
> the guest sets/sees.
> 
> Is vhost_vdpa_add_status() sending VHOST_VDPA_SET_STATUS to the backend?
> 
> And why reading back the status from the backend? Just to confirm the
> change is taken into account?

Making sure features have been acked makes sense IMHO.


> > And vhost_set_state() will be called from vhost_dev_start()/stop().
> > 
> > Does this work for vhost-user as well?
> 
> IIUC what you did above, I think it would work. And we won't need
> GET_STATUS request, but just rely on the REPLY_ACK.

Right. Need to document that though.


> 
> Thanks,
> Maxime
> 
> > Thanks
> > 
> > 
> >> +
> >>   bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error
> >> **errp)
> >>   {
> >>       if (user->chr) {
> >> @@ -1947,4 +1981,5 @@ const VhostOps user_ops = {
> >>           .vhost_backend_mem_section_filter =
> >> vhost_user_mem_section_filter,
> >>           .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
> >>           .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
> >> +        .vhost_set_state = vhost_user_set_state,
> >>   };


