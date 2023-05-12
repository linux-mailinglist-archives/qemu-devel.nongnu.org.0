Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91737009F8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:08:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTQ6-0000qN-IH; Fri, 12 May 2023 10:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTQ4-0000qD-0z
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:06:52 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTQ1-0003qH-Rt
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:06:51 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f24cfb8539so7719470e87.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683900408; x=1686492408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKcsFC7TwEEpBgtg4G65EtddAkn+kMkWhAZmZBsJBXM=;
 b=aW3nHd5E3gdvrxa0eliYX4mybS+IQsRCrQKrQsexxwNaQCgmTjT8W5QOCAcjM4mCE1
 F7b9w1lVW/BwMLQ9BrIrqJwJG8oTsBpmYFbJxLxZi2vXCIpou3PyxO1jiInnHtn9musT
 FcA8pXVEJmYo4zjvq1TIoPj25wEXXVW0Z27woyRCBiRc5orFg5KyaWGYxGPgDfboVn/D
 URIt3oRptGQfs294KfivVVsdPDd3dsIn2TN/ypt0/9+Npim43UzUYkIqp/jk1lTkxPtH
 MlUZhpcMDbdl1CUEa95yaIyVzTJNngSBFUYB9jOcLd9WbXSgEGuYV2zLBSI6RxN8ys13
 rtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683900408; x=1686492408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UKcsFC7TwEEpBgtg4G65EtddAkn+kMkWhAZmZBsJBXM=;
 b=f599ztaziMc4Ad3rlMfRaw5flLPijz4YsQEEMhe0stc8Q3qXLHTNPEg1ASajuNmsTF
 yYaw2Mcd/8AP9udJqVjmMg9bEElDMjIKdfzvzBDIJpvgXkX2HZT+Ph4OS50bM4ogZrHS
 9d58EJ3U0xjRo4iuyrH4fDJYGOlzBeXA9If9n4nJI/ZGS0p9MDqTpmZB4+6ajzda7bqZ
 znTaut73e8vmTe+P3NLsSslbrm1rqxvy4+AwuUYFJKkroRX8lrTHBLKPtJwO2rxgx++o
 6DeXPx+Z7bKWbn5j915fJeZkvI++/AgrJoM5QrDf+9enHjxEnF85pffOuTp5TT0U+eFy
 fLmg==
X-Gm-Message-State: AC+VfDxNRBcPbKVsl+67faelYfssBaAfSfK4m4F6ZwyxhUiK4YZ4deAs
 af1UqlcUBE9FhR2qT+aD7o1QnBFP9EHa3Iz3DH5tcA==
X-Google-Smtp-Source: ACHHUZ6wcz/dhMGePdYO5zoUedYeX7VTMUyOkMeXJyLYY35Iaikb+iiujFUkaeR3f3ovtiZ2IKq1Nqt426vAA/tSzB4=
X-Received: by 2002:ac2:4c06:0:b0:4ed:b15d:467d with SMTP id
 t6-20020ac24c06000000b004edb15d467dmr3651011lfq.53.1683900407877; Fri, 12 May
 2023 07:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230501020221.188376-1-viktor@daynix.com>
 <20230501020221.188376-5-viktor@daynix.com>
 <CACGkMEvpy0YPy_qr4C=RPA_vUALJi0kMNZzwXNC8AXZbxWVyRw@mail.gmail.com>
In-Reply-To: <CACGkMEvpy0YPy_qr4C=RPA_vUALJi0kMNZzwXNC8AXZbxWVyRw@mail.gmail.com>
From: Viktor Prutyanov <viktor@daynix.com>
Date: Fri, 12 May 2023 17:06:37 +0300
Message-ID: <CAPv0NP6egyurH+U=z8sswURBzsVV7VmAgKT1rSeRC2GNXYp0HQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/4] virtio-net: pass Device-TLB enable/disable
 events to vhost
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, yan@daynix.com, 
 yuri.benditovich@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::134;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 8, 2023 at 8:26=E2=80=AFAM Jason Wang <jasowang@redhat.com> wro=
te:
>
> On Mon, May 1, 2023 at 10:02=E2=80=AFAM Viktor Prutyanov <viktor@daynix.c=
om> wrote:
> >
> > If vhost is enabled for virtio-net, Device-TLB enable/disable events
> > must be passed to vhost for proper IOMMU unmap flag selection.
>
> The patch looks good, just wonder if you have tested it with vhost-user?

Not yet, because I don't know which use case to test. Actually, the
device_iotlb_enabled flag logic doesn't rely on a backend. And that's
really enough to fix the problem for all the guests I know at the
moment. The trigger logic which turned out to be backend-aware is
needed only if ATS is enabled/disabled in runtime and I create such a
situation manually and test that IOMMU flag re-registration is done.

Thanks,
Viktor Prutyanov

>
> (It looks to me like it should work there).
>
> Thanks
>
> >
> > Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> > ---
> >  hw/net/vhost_net.c      | 11 +++++++++++
> >  hw/net/virtio-net.c     |  8 ++++++++
> >  include/net/vhost_net.h |  2 ++
> >  3 files changed, 21 insertions(+)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index c4eecc6f36..2364c8de99 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -552,6 +552,17 @@ int vhost_net_set_mtu(struct vhost_net *net, uint1=
6_t mtu)
> >      return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
> >  }
> >
> > +void vhost_net_toggle_device_iotlb(struct vhost_dev *dev, bool enable)
> > +{
> > +    const VhostOps *vhost_ops =3D dev->vhost_ops;
> > +
> > +    if (!vhost_ops->vhost_toggle_device_iotlb) {
> > +        return;
> > +    }
> > +
> > +    vhost_ops->vhost_toggle_device_iotlb(dev, enable);
> > +}
> > +
> >  void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
> >                                 int vq_index)
> >  {
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 53e1c32643..e6851b885c 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3843,6 +3843,13 @@ static struct vhost_dev *virtio_net_get_vhost(Vi=
rtIODevice *vdev)
> >      return &net->dev;
> >  }
> >
> > +static void virtio_net_toggle_device_iotlb(VirtIODevice *vdev,
> > +                                           bool enable)
> > +{
> > +    if (vdev->vhost_started)
> > +        vhost_net_toggle_device_iotlb(virtio_net_get_vhost(vdev), enab=
le);
> > +}
> > +
> >  static const VMStateDescription vmstate_virtio_net =3D {
> >      .name =3D "virtio-net",
> >      .minimum_version_id =3D VIRTIO_NET_VM_VERSION,
> > @@ -3948,6 +3955,7 @@ static void virtio_net_class_init(ObjectClass *kl=
ass, void *data)
> >      vdc->vmsd =3D &vmstate_virtio_net_device;
> >      vdc->primary_unplug_pending =3D primary_unplug_pending;
> >      vdc->get_vhost =3D virtio_net_get_vhost;
> > +    vdc->toggle_device_iotlb =3D virtio_net_toggle_device_iotlb;
> >  }
> >
> >  static const TypeInfo virtio_net_info =3D {
> > diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> > index c37aba35e6..36d527f321 100644
> > --- a/include/net/vhost_net.h
> > +++ b/include/net/vhost_net.h
> > @@ -56,4 +56,6 @@ int vhost_net_virtqueue_restart(VirtIODevice *vdev, N=
etClientState *nc,
> >                                  int vq_index);
> >
> >  void vhost_net_save_acked_features(NetClientState *nc);
> > +
> > +void vhost_net_toggle_device_iotlb(struct vhost_dev *dev, bool enable)=
;
> >  #endif
> > --
> > 2.35.1
> >
>

