Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A1C42D950
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:30:09 +0200 (CEST)
Received: from localhost ([::1]:53088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazs8-000767-SA
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mazi2-0005sF-OH
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:19:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mazhz-00081f-R9
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634213973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=55SPomddJ+eQrMEPgEkT9GlIoarfKKDf4qDOAhTk+q0=;
 b=QY1yBeI18xAetcz92/vHbSAZLITrc74YEiWPcawZkXh4sNUSMdU2ugAjU56pzC7XynvGiV
 gmA3mpsCINkfnm4xJRJGYiwMpH91NgvVFLQ5dPT9gWXcCBp6Novcmuf7KfH5dttZ4Qvi7C
 tkvVcAOd5CHZ0D/xRWEb0PfMF1Sf3J8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-EZB6XhLoOJSgQFjTXiMnaA-1; Thu, 14 Oct 2021 08:19:26 -0400
X-MC-Unique: EZB6XhLoOJSgQFjTXiMnaA-1
Received: by mail-qv1-f71.google.com with SMTP id
 t3-20020a056214154300b00383496932feso5434169qvw.6
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 05:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=55SPomddJ+eQrMEPgEkT9GlIoarfKKDf4qDOAhTk+q0=;
 b=VwQh8vzZ1DeP8gQVc9WqKbroP5vjsyw1ICqPEZDbqmnximxm5PkauwHYrbni11r4sN
 fOa5enuf0wEDI4WSxBnBY9v+a9LtXCBrvdt6fPCn6vh9m7A+M7x7UL9Ic1lyGCp/dqNy
 XJ7sNjRcUOyWmaKkWSVf1N6Rnj51r3dRiqhApsPKKLyuo31iwW8V5m7zbsj8m0s7v1w2
 vXgQ3BEK3S9mZIwEweIYPWdbEY31h5Orsh53yGJaMh9e/ecm2u5N662uMCYWkhvcZUUD
 QtAuxOhuqjwpxI93nDtXGuhQFfIfy62303OmuaeEfkK7jzCuxclRSiTKD9qfQrSMu1m8
 8OKQ==
X-Gm-Message-State: AOAM532fvNFHY3ypCUYJ1dIrSsDU8cT2BN8VMWhnNAylso+yHk57Yqf+
 Fx/lw4jByjabBZXRXqqlcFgN2Xiyc38B8DYDb1F6ar7uu6CcGShkTntrUFpStHU+ZbPOKWiQTK5
 6S6b1ppPVIUDXr9kTdOhCDHMeo0CpmwA=
X-Received: by 2002:ac8:5f90:: with SMTP id j16mr6111291qta.175.1634213966310; 
 Thu, 14 Oct 2021 05:19:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7eLGt4LmFG1g+pL3w0UnkmbXTvKg1lCiz085bTOP2m1CZjZjzv2O2NYsHUNn9xXvSkfwPEauoCKf8/EzLU68=
X-Received: by 2002:ac8:5f90:: with SMTP id j16mr6111272qta.175.1634213966134; 
 Thu, 14 Oct 2021 05:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-11-eperezma@redhat.com>
 <6f10e27f-b40b-8c79-f829-3073f226eb6c@redhat.com>
In-Reply-To: <6f10e27f-b40b-8c79-f829-3073f226eb6c@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Oct 2021 14:18:50 +0200
Message-ID: <CAJaqyWc-S0pSWWF-WG3ZyxMJeRSF01BuZMEXBbt-ULBk5+BgSg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 10/20] vhost-vdpa: Take into account SVQ in
 vhost_vdpa_set_vring_call
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 5:43 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 17 ++++++++++++++---
> >   1 file changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 57a857444a..bc34de2439 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -649,16 +649,27 @@ static int vhost_vdpa_set_vring_kick(struct vhost=
_dev *dev,
> >       return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
> >   }
> >
> > +static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
> > +                                         struct vhost_vring_file *file=
)
> > +{
> > +    trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
> > +    return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> > +}
> > +
> >   static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
> >                                          struct vhost_vring_file *file)
> >   {
> >       struct vhost_vdpa *v =3D dev->opaque;
> >       int vdpa_idx =3D vhost_vdpa_get_vq_index(dev, file->index);
> >
> > -    trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
> > -
> >       v->call_fd[vdpa_idx] =3D file->fd;
> > -    return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> > +    if (v->shadow_vqs_enabled) {
> > +        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 vdpa_idx);
> > +        vhost_svq_set_guest_call_notifier(svq, file->fd);
> > +        return 0;
> > +    } else {
> > +        return vhost_vdpa_set_vring_dev_call(dev, file);
> > +    }
>
>
> I feel like we should do the same for kick fd.
>
> Thanks
>

I think this also has been answered on 08/20, but feel free to tell me
otherwise if I missed something.

Thanks!

>
> >   }
> >
> >   static int vhost_vdpa_get_features(struct vhost_dev *dev,
>


