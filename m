Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0373939D516
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 08:38:14 +0200 (CEST)
Received: from localhost ([::1]:51814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq8tp-0005cu-19
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 02:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lq8sE-00044r-MT
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:36:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lq8sD-00047p-5K
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623047792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bS6uSZiS+Hvu0+HuFER8vtlzg1RX9XoQm1w50yxT27s=;
 b=RdmCre7aHkTGPY+s60XFjNrL4gdjBug5fNHMJ5Xaam3ZOFGPzqnuJYmIPdps6ON10WJYjm
 v6RQ8wkwVKBkXawPQOEnzDCW6lpTEf2Or/X07Lwrm9CqgQoh67Yo2iSxRYp8VT+e+stZuS
 acc9f328iI4gzuIE4Huczh3vpo2UGks=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-VsRXoUrBMmyM_7owp4DybQ-1; Mon, 07 Jun 2021 02:36:29 -0400
X-MC-Unique: VsRXoUrBMmyM_7owp4DybQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 p20-20020a1709064994b02903cd421d7803so2069636eju.22
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 23:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bS6uSZiS+Hvu0+HuFER8vtlzg1RX9XoQm1w50yxT27s=;
 b=GRe8E7XU724vSTGv6Nt+kPMp3itDS4kasfy0/MDA47FGbPvYGG4E345NtoEsTtM9QN
 0Iz1ewbeP4gl1Wa5G1i5cBQhKiAewt1bmhWzaBHq8NFtCAx8dOL85FKhp90U7MSytJDa
 nYLbv+waob6z/vLgahH9QE2twpBQz8LtKr59ignbg6EE+/H6KVybntxGicENg7gTSJ9n
 poL9C2W8RL7sT/kuntaEZ1lxlR8NwxkFaWBHMQqmnaECuUDghJExRZZ1a9GRLiUI6i+c
 X1VmsCxI8B0RWU/2IE/GIPnU/Fh1/rEkSczwQrxQdqcSu5hdjyl46KnBYJJoZxv60pJm
 ypQg==
X-Gm-Message-State: AOAM5339rvwfBu4DGZvew+KK35qZ9zalzm+iZ1aK5PPtR5gHupqm72is
 x215Vqsjh4Q4ApOwkIAqJNWAlpAuRl5SOBmolaCl9j/oSn4UKAN3r6FLjnCjpUrva2+58XTb9ts
 WOwy5UgCeCQmeqKKkD1QKqYciyP2067U=
X-Received: by 2002:a17:906:4d56:: with SMTP id
 b22mr15870667ejv.78.1623047788068; 
 Sun, 06 Jun 2021 23:36:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyDNn5boD4TiEGrWL+z5q1aSFljHICsRfCrwLxdPeQSbgDHVYVxCDHt0zKCinBOHwowlFjNK+MamRmTXXLnWc=
X-Received: by 2002:a17:906:4d56:: with SMTP id
 b22mr15870655ejv.78.1623047787873; 
 Sun, 06 Jun 2021 23:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-8-lulu@redhat.com>
 <4d06d28c-8a61-5e2f-f6e3-8061f6bc2001@redhat.com>
In-Reply-To: <4d06d28c-8a61-5e2f-f6e3-8061f6bc2001@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 7 Jun 2021 14:35:52 +0800
Message-ID: <CACLfguWEieJBONhRfDrOHspcFNfPg=e41tdZ0J2BCxLqjqpC5Q@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] virtio-mmio: add support for configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 3, 2021 at 2:36 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/2 =E4=B8=8A=E5=8D=8811:47, Cindy Lu =E5=86=99=E9=81=93:
> > Add configure interrupt support for virtio-mmio bus. This
> > interrupt will working while backend is vhost-vdpa
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/virtio-mmio.c | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> >
> > diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> > index 13772d52bb..423267d51c 100644
> > --- a/hw/virtio/virtio-mmio.c
> > +++ b/hw/virtio/virtio-mmio.c
> > @@ -670,7 +670,26 @@ static int virtio_mmio_set_guest_notifier(DeviceSt=
ate *d, int n, bool assign,
> >
> >       return 0;
> >   }
> > +static int virtio_mmio_set_config_notifier(DeviceState *d, bool assign=
)
> > +{
> > +    VirtIOMMIOProxy *proxy =3D VIRTIO_MMIO(d);
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> >
> > +    EventNotifier *notifier =3D virtio_get_config_notifier(vdev);
> > +    int r =3D 0;
> > +    if (assign) {
> > +        r =3D event_notifier_init(notifier, 0);
>
>
> The return value is ignored.
>
will add the check here
>
> > +        virtio_set_notifier_fd_handler(vdev, -1, true, false);
>
>
> You'd better use the macro you introduced in patch 1 here?
>
sorry, Seems I missed this, I will correct this
>
> > +    } else {
> > +        virtio_set_notifier_fd_handler(vdev, -1, false, false);
> > +        event_notifier_cleanup(notifier);
> > +    }
> > +    if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
> > +        vdc->guest_notifier_mask(vdev, -1, !assign);
> > +    }
> > +    return r;
> > +}
> >   static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
> >                                              bool assign)
> >   {
> > @@ -692,8 +711,15 @@ static int virtio_mmio_set_guest_notifiers(DeviceS=
tate *d, int nvqs,
> >               goto assign_error;
> >           }
> >       }
> > +    r =3D virtio_mmio_set_config_notifier(d, assign);
> > +    if (r < 0) {
> > +        goto config_assign_error;
> > +    }
> >
> >       return 0;
> > +config_assign_error:
> > +    assert(assign);
> > +    r =3D virtio_mmio_set_config_notifier(d, false);
>
>
> This looks wired. We only have a single configure interrupt, so assign
> fails should mean unassigned?
>
> Thanks
>
sure Will correct this
> >
> >   assign_error:
> >       /* We get here on assignment failure. Recover by undoing for VQs =
0 .. n. */
>


