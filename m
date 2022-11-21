Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164B632F60
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 22:53:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxEhs-0007W6-7y; Mon, 21 Nov 2022 16:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oxEhn-0007U7-7O
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:51:55 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oxEhl-0004ZC-7M
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:51:54 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-39ce6773248so56551797b3.12
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 13:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/pLudiI/ftoFwygumJkBraimRgmNuF7i/8510oW5i2k=;
 b=C7yCQEyUalEmdHueehhLdZ/T0IYezx7i/bWlz6q8X3vB3eqtm93Wl/cZ2ALo+lujFM
 KSLH71c9w4G/AXeyjREihOETwX0yWJIMH5ruux7GvkDmEBCwsNU8U6w96v/VdmeJ0JOA
 8oxo2U6UcRF9zAx+xhq/ictu/CXCffhWbI/Wzy3DB1cDekGZKZKIHSpn/jfAqOCsaahL
 cliOZKyuOi6L6yzM9/Uv8zIdLdZf/sZTP3rfS4o+4ufTG1DucQV/rnhAp8eABX8/aqNP
 WEFvgejCfF0OTzysT8Zzh1Tc0V6Fg5F5AXMdvvKqjXA3uM2KsHBjPEYv2gktQ/RPzwBe
 38wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pLudiI/ftoFwygumJkBraimRgmNuF7i/8510oW5i2k=;
 b=li/msLHERp3Y/cN4QziKFAuGvaByphk3lNcIR02NRv1apvU4G/bQfRZSl+O3rOgiOP
 j0vGmfRvMDaa6UdWg/CYnbIFHWH6YtrCDYfxkzpeEF8Ss3Dr3hJ+puq0kWN79yKWPVd6
 zNn1sKIK3roA2I78/wxzwOthfY3EeSCEOzcl5etJEMpEH2isKFknB0CKJVZUtUdpiYok
 lBmtTt9kNLVwvUqM2jHf28DcqYgwUhXUUxUgqjI/E/pAvxGVWX7k1aLz4W16faKpEQc6
 sUIs+4w+4bezrFngjeUJi5Yz3JKIpl0xvS6N43DMtaw592MtpcP8cFjX8NnLqNU2Qrg9
 pFBw==
X-Gm-Message-State: ANoB5pmspbCHEnd09p7PxOcNuauoJ9kBjJG5GzfC2vwm2aTK0dotL2Mj
 fcrW7TVomUPgU/Da888EIzw1YwBfxDkXWER1vkY=
X-Google-Smtp-Source: AA0mqf4yxqQzdPtzgUF8b+8oTf3RR7wwEhgPOfcpHmstHilqhsi2YVDBies27Cn/Qwab02dd2RUbddAtR+vOaKvoQaA=
X-Received: by 2002:a81:6c08:0:b0:369:94dc:7321 with SMTP id
 h8-20020a816c08000000b0036994dc7321mr3693376ywc.156.1669067511975; Mon, 21
 Nov 2022 13:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20221121144921.2830330-1-alex.bennee@linaro.org>
 <CAJSP0QU72EnMQRbHpZ812QpszkjEeStA1R2Jic1VvCKBFas8_g@mail.gmail.com>
 <87a64kcdpk.fsf@linaro.org>
In-Reply-To: <87a64kcdpk.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 21 Nov 2022 16:51:40 -0500
Message-ID: <CAJSP0QW-w45JFyrsMztN_e2rqwmJrn+M17kgi103XuY1RGD1Eg@mail.gmail.com>
Subject: Re: [RFC PATCH] include/hw: attempt to document VirtIO feature
 variables (!DISCUSS!)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 21 Nov 2022 at 14:25, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
> > On Mon, 21 Nov 2022 at 09:49, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> We have a bunch of variables associated with the device and the vhost
> >> backend which are used inconsistently throughout the code base. Lets
> >> start trying to bring some order by agreeing what each variable is
> >> for. Some cases to address (vho/vio renames to avoid ambiguous results
> >> while grepping):
> >>
> >> virtio->guest_features is mostly the live status of the features field
> >> and read and written as such by the guest. It does get manipulated by
> >> the various load state via virtio_set_features_nocheck(vdev, val) for
> >> migration.
> >>
> >> virtio->host_features is the result of vcd->get_features() most of the
> >> time and for vhost-user devices eventually ends up down at the vhost
> >> get features message:
> >>
> >>   ./hw/virtio/virtio-bus.c:66:    vdev->host_features =3D vdc->get_fea=
tures(vdev, vdev->host_features,
> >>
> >> However virtio-net does a lot of direct modification of it:
> >>
> >>   ./hw/net/virtio-net.c:3517:        n->host_features |=3D (1ULL << VI=
RTIO_NET_F_MTU);
> >>   ./hw/net/virtio-net.c:3529:        n->host_features |=3D (1ULL << VI=
RTIO_NET_F_SPEED_DUPLEX);
> >>   ./hw/net/virtio-net.c:3539:        n->host_features |=3D (1ULL << VI=
RTIO_NET_F_SPEED_DUPLEX);
> >>   ./hw/net/virtio-net.c:3548:        n->host_features |=3D (1ULL << VI=
RTIO_NET_F_STANDBY);
> >>   ./hw/virtio/virtio.c:3438:    bool bad =3D (val & ~(vdev->host_featu=
res)) !=3D 0;
> >>
> >> And we have this case which propagates the global QMP values for the
> >> device to the host features. This causes the resent regression of
> >> vhost-user-sock due to 69e1c14aa2 (virtio: core: vq reset feature
> >> negotation support) because the reset feature was rejected by the
> >> vhost-user backend causing it to freeze:
> >>
> >>   ./hw/virtio/virtio.c:4667:    status->host_features =3D qmp_decode_f=
eatures(vdev->device_id,
> >>
> >> virtio->backend_features is only used by virtio-net to stash the
> >> vhost_net_get_features features for checking later:
> >>
> >>     features =3D vhost_net_get_features(get_vhost_net(nc->peer), featu=
res);
> >>     vdev->vio_backend_features =3D features;
> >>
> >> and:
> >>
> >>     if (n->mtu_bypass_backend &&
> >>             !virtio_has_feature(vdev->vio_backend_features, VIRTIO_NET=
_F_MTU)) {
> >>         features &=3D ~(1ULL << VIRTIO_NET_F_MTU);
> >>     }
> >>
> >> vhost_dev->acked_features seems to mostly reflect
> >> virtio->guest_features (but where in the negotiation cycle?). Except
> >> for vhost_net where is becomes vhost_dev->backend_features
> >>
> >>   ./backends/vhost-user.c:87:    b->dev.vho_acked_features =3D b->vdev=
->guest_features;
> >>   ./hw/block/vhost-user-blk.c:149:    s->dev.vho_acked_features =3D vd=
ev->guest_features;
> >>   ./hw/net/vhost_net.c:132:    net->dev.vho_acked_features =3D net->de=
v.vho_backend_features;
> >>   ./hw/scsi/vhost-scsi-common.c:53:    vsc->dev.vho_acked_features =3D=
 vdev->guest_features;
> >>   ./hw/virtio/vhost-user-fs.c:77:    fs->vhost_dev.vho_acked_features =
=3D vdev->guest_features;
> >>   ./hw/virtio/vhost-user-i2c.c:46:    i2c->vhost_dev.vho_acked_feature=
s =3D vdev->guest_features;
> >>   ./hw/virtio/vhost-user-rng.c:44:    rng->vhost_dev.vho_acked_feature=
s =3D vdev->guest_features;
> >>   ./hw/virtio/vhost-vsock-common.c:71:    vvc->vhost_dev.vho_acked_fea=
tures =3D vdev->guest_features;
> >>   ./hw/virtio/vhost.c:1631:            hdev->vho_acked_features |=3D b=
it_mask;
> >>
> >> vhost_dev->backend_features has become overloaded with two use cases:
> >>
> >>   ./hw/block/vhost-user-blk.c:336:    s->dev.vho_backend_features =3D =
0;
> >>   ./hw/net/vhost_net.c:180:        net->dev.vho_backend_features =3D q=
emu_has_vnet_hdr(options->net_backend)
> >>   ./hw/net/vhost_net.c:185:        net->dev.vho_backend_features =3D 0=
;
> >>   ./hw/scsi/vhost-scsi.c:220:    vsc->dev.vho_backend_features =3D 0;
> >>   ./hw/scsi/vhost-user-scsi.c:121:    vsc->dev.vho_backend_features =
=3D 0;
> >>   ./hw/virtio/vhost-user.c:2083:        dev->vho_backend_features |=3D=
 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
> >> One use for saving the availability of a vhost-net feature and another
> >> for ensuring we add the protocol feature negotiation bit when querying
> >> a vhost backend. Maybe the places where this is queried should really
> >> be bools that can be queried in the appropriate places?
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Stefano Garzarella <sgarzare@redhat.com>
> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >> Cc: Stefan Hajnoczi <stefanha@gmail.com>
> >> ---
> >>  include/hw/virtio/vhost.h  | 18 +++++++++++++++---
> >>  include/hw/virtio/virtio.h | 20 +++++++++++++++++++-
> >>  2 files changed, 34 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> >> index 353252ac3e..502aa5677a 100644
> >> --- a/include/hw/virtio/vhost.h
> >> +++ b/include/hw/virtio/vhost.h
> >> @@ -88,13 +88,25 @@ struct vhost_dev {
> >>      int vq_index_end;
> >>      /* if non-zero, minimum required value for max_queues */
> >>      int num_queues;
> >> +    /**
> >> +     * vhost feature handling requires matching the feature set
> >> +     * offered by a backend which may be a subset of the total
> >> +     * features eventually offered to the guest.
> >> +     *
> >> +     * @features: available features provided by the backend
> >> +     * @acked_features: final set of negotiated features with the
> >> +     * front-end driver
> >> +     * @backend_features: additional feature bits applied during nego=
tiation
> >
> > What does this mean?
>
> Well practically it is currently either applying
> VHOST_USER_F_PROTOCOL_FEATURES to the vhost_user_set_features() or
> storing VHOST_NET_F_VIRTIO_NET_HDR which I think eventually gets applied
> to:
>
>   net->dev.acked_features =3D net->dev.backend_features;
>
> I suspect both could be dropped and handled as flags and applied at the
> destination.

I noticed there is also a VirtIODevice::backend_features field that is
barely used. virtio_net stashes vhost_net backend feature bits in
there, but I think the code would be clearer if it was rewritten
without the VirtIODevice::backend_features field.

Having both VirtIODevice and struct vhost_dev fields with the same
name is confusing. :/

>
> >
> >> +     *
> >> +     * Finally the @protocol_features is the final protocal feature
> >
> > s/protocal/protocol/
> >
> > All the other fields are VIRTIO feature bits and this field holds the
> > VHOST_USER_SET_FEATURES feature bits?
>
> No these are the protocol features so a totally separate set of feature
> bits for the vhost user protocol. I don't think these apply to kernel
> vhost stuff?

Oh, I see. Only vhost-user has this concept.

How about "the vhost-user VHOST_USER_SET_PROTOCOL_FEATURES bits"?

>
> >
> >> +     * set negotiated between QEMU and the backend (after
> >> +     * VHOST_USER_F_PROTOCOL_FEATURES is negotiated)
> >> +     */
> >>      uint64_t features;
> >> -    /** @acked_features: final set of negotiated features */
> >>      uint64_t acked_features;
> >> -    /** @backend_features: backend specific feature bits */
> >>      uint64_t backend_features;
> >> -    /** @protocol_features: final negotiated protocol features */
> >>      uint64_t protocol_features;
> >> +
> >>      uint64_t max_queues;
> >>      uint64_t backend_cap;
> >>      /* @started: is the vhost device started? */
> >> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> >> index a973811cbf..9939a0a632 100644
> >> --- a/include/hw/virtio/virtio.h
> >> +++ b/include/hw/virtio/virtio.h
> >> @@ -93,6 +93,12 @@ enum virtio_device_endian {
> >>      VIRTIO_DEVICE_ENDIAN_BIG,
> >>  };
> >>
> >> +/**
> >> + * struct VirtIODevice - common VirtIO structure
> >> + * @name: name of the device
> >> + * @status: VirtIO Device Status field
> >> + *
> >> + */
> >>  struct VirtIODevice
> >>  {
> >>      DeviceState parent_obj;
> >> @@ -100,9 +106,21 @@ struct VirtIODevice
> >>      uint8_t status;
> >>      uint8_t isr;
> >>      uint16_t queue_sel;
> >> -    uint64_t guest_features;
> >> +    /**
> >> +     * These fields represent a set of VirtIO features at various
> >> +     * levels of the stack. @host_features indicates the complete
> >> +     * feature set the VirtIO device can offer to the driver.
> >> +     * @guest_features indicates which features the VirtIO driver can
> >> +     * support.
> >
> > The device never knows the features that the driver can support, so
> > this sentence is ambiguous/incorrect. The device only knows the
> > features that the driver writes during negotiation, which the spec
> > says is a subset of host_features.
> >
> > Maybe "indicates the features that driver wrote"?
> >
> > I noticed that this field is assigned even when the guest writes
> > invalid feature bits.
>
> Should we fix that? The negotiation sequence should be guest read, mask
> and write back so the value should be validated against host_features?

I think the negotiation/state machine is okay. Invalid features will
not be accepted (negotiation fails).

It's just weird that an invalid input from the guest can be stored in
guest_features. Hopefully nothing trusts the guest_features value
without first checking that negotiation succeeded (I haven't checked
the code).

Stefan

