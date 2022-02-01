Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117674A5B99
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:54:28 +0100 (CET)
Received: from localhost ([::1]:36828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErju-0005zi-O4
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:54:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nErbT-0007K0-1d
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:45:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nErbQ-0000TH-W6
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643715940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RczpA0EPAGQEc6XH0BU19UWPVQsg8YC4mBwdl6OFFfc=;
 b=NnPYMj6C844qtRp1H9Dsf3XJHylm7emGhIsKPSFkgpuVv3aRw1VQoeQkq7aA9OBv2Oudoh
 MbChwWU2HVlGwOkBh6+FuaBdjZWGZ8+sn6rluwNT0UDzQznVgGim3FAPgUStcL3hf614lQ
 ZM1ELlWPZSHaivIGOb4217MqB18NXm4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-DGssEdjVMUuNPxF6QVK90A-1; Tue, 01 Feb 2022 06:45:39 -0500
X-MC-Unique: DGssEdjVMUuNPxF6QVK90A-1
Received: by mail-qk1-f200.google.com with SMTP id
 n3-20020ae9c303000000b00477e4f3dfd2so11807864qkg.21
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RczpA0EPAGQEc6XH0BU19UWPVQsg8YC4mBwdl6OFFfc=;
 b=L+0Vi+4EUf0yNqxMgG9iH/cO/OAk4EqYSITrq88bIKfWyeYnbcRIATI+Y91GcF6jC9
 YhPXtQSFwDg7UsA1XB+yPQMONgjzRnE2O4XS/X5iNGa832Ea4WTebLH/a2x8Ge1UZ8dR
 mnGsR7Q19w7291V3ZdOdih7Lyuf28D+AIGlrsx0SAGQyNS8H7r8mTM6dWiZaB9ARtUQx
 CWk3XzvpalgvcEm2nBW+g6j5VJ9RkejuIAfO3blZreS0FMknwnOV4pagEg/WLeHu0ALk
 i7Or7Y257f5WnK9ntQfZbSPH++TKImN25D1rfyfUCgmYojULbSNsRpoOpYRPl2YId70S
 D7Og==
X-Gm-Message-State: AOAM533Xsb4YMB8RcRUu0IXNKnkIWChtr9s8S3d8+G/FVP/D7Qhybay3
 uLacoGhHYGLmdqwelsr84sIHlexaBwi5a8nFJtnpMFgu0l9zwwlFlHBZRIDHVY0clueg4P8SUgw
 pLLJ5KgwZF8+w0U4hFlk3xD9sYoQNcsw=
X-Received: by 2002:a37:ba45:: with SMTP id k66mr16238554qkf.632.1643715938715; 
 Tue, 01 Feb 2022 03:45:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZ5pl1vVzb1JTxnxBPGpS8Gs4NyqqPYVbq43HDweQfJsRo0z0drt7AqLzmlgJ1uKTuHQQfwIHis9WcqGDoSsM=
X-Received: by 2002:a37:ba45:: with SMTP id k66mr16238532qkf.632.1643715938438; 
 Tue, 01 Feb 2022 03:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-29-eperezma@redhat.com>
 <42664143-6d0c-b107-ec90-8e6336bae29b@redhat.com>
In-Reply-To: <42664143-6d0c-b107-ec90-8e6336bae29b@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Feb 2022 12:45:02 +0100
Message-ID: <CAJaqyWdBLU+maEhByepzeH7iwLmqUba0rRb8PM4VwBy2P8Vtow@mail.gmail.com>
Subject: Re: [PATCH 28/31] vdpa: Expose VHOST_F_LOG_ALL on SVQ
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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

On Sun, Jan 30, 2022 at 7:50 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > SVQ is able to log the dirty bits by itself, so let's use it to not
> > block migration.
> >
> > Also, ignore set and clear of VHOST_F_LOG_ALL on set_features if SVQ is
> > enabled. Even if the device supports it, the reports would be nonsense
> > because SVQ memory is in the qemu region.
> >
> > The log region is still allocated. Future changes might skip that, but
> > this series is already long enough.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index fb0a338baa..75090d65e8 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1022,6 +1022,9 @@ static int vhost_vdpa_get_features(struct vhost_d=
ev *dev, uint64_t *features)
> >       if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> >           /* Filter only features that SVQ can offer to guest */
> >           vhost_svq_valid_guest_features(features);
> > +
> > +        /* Add SVQ logging capabilities */
> > +        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> >       }
> >
> >       return ret;
> > @@ -1039,8 +1042,25 @@ static int vhost_vdpa_set_features(struct vhost_=
dev *dev,
> >
> >       if (v->shadow_vqs_enabled) {
> >           uint64_t dev_features, svq_features, acked_features;
> > +        uint8_t status =3D 0;
> >           bool ok;
> >
> > +        ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> > +        if (unlikely(ret)) {
> > +            return ret;
> > +        }
> > +
> > +        if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
> > +            /*
> > +             * vhost is trying to enable or disable _F_LOG, and the de=
vice
> > +             * would report wrong dirty pages. SVQ handles it.
> > +             */
>
>
> I fail to understand this comment, I'd think there's no way to disable
> dirty page tracking for SVQ.
>

vhost_log_global_{start,stop} are called at the beginning and end of
migration. To inform the device that it should start logging, they set
or clean VHOST_F_LOG_ALL at vhost_dev_set_log.

While SVQ does not use VHOST_F_LOG_ALL, it exports the feature bit so
vhost does not block migration. Maybe we need to look for another way
to do this?

Thanks!

> Thanks
>
>
> > +            return 0;
> > +        }
> > +
> > +        /* We must not ack _F_LOG if SVQ is enabled */
> > +        features &=3D ~BIT_ULL(VHOST_F_LOG_ALL);
> > +
> >           ret =3D vhost_vdpa_get_dev_features(dev, &dev_features);
> >           if (ret !=3D 0) {
> >               error_report("Can't get vdpa device features, got (%d)", =
ret);
>


