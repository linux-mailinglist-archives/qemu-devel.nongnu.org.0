Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BC55775DD
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jul 2022 13:03:31 +0200 (CEST)
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oD23c-0006r8-1b
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 07:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oD21C-0004X8-Ts
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 07:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oD215-0003rJ-I6
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 07:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658055650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2s9hz0gS/th4a4Fq7mchz85y2+NBcTwvNjovHS/k2o=;
 b=Z958Y2ZpvPc8jRFLKOYha5JH80SyqpOM8skQT2mXXhi5snVj5p2kXQtug7wcUj6fbef2mE
 aDfClukH3pgL3mHqFpgrNfCzgOeJioUPBvzDONjqCbJL/6/6JQN4nSTOBq1AOqwbYaSZlm
 XpExZs/uJ+J/Pr9+niR12KlKA9zNfbk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-WcRwin7zMa-qKgShBkurUQ-1; Sun, 17 Jul 2022 07:00:43 -0400
X-MC-Unique: WcRwin7zMa-qKgShBkurUQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 u18-20020a05620a455200b006b5d08c0ee7so4782173qkp.12
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 04:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X2s9hz0gS/th4a4Fq7mchz85y2+NBcTwvNjovHS/k2o=;
 b=C/3flWBowh6Zaf4pJ0A2opFhtVClmXyFAkKLRf5co9Kelkk+sPWXFhDw5RZeF7kaGV
 y/auPuVlSFd682fs050Aa52pfIdhEouq60mr8kAqvqYl8FvW6nq8Ez0MswMbJl1hQNCG
 MstrYb9alf+mGMTKNfazwLfyhTVpkLdlqoqFPL902pQC8EY9n3lqf0r9sxgukce20UaQ
 xVFngWp4m5p5y+/Vk9McpOqiZp1MAOUaN6XRIvVnTu7YR5G0Xm70zKpdOrpgzLBlyhyb
 U/OxGUaElaHyF3t6pwX8g+Jh1ZERJ5uMqLOTn8KKY510U0i4jqzfyjzT3RQr8cnD9Gwa
 t+rA==
X-Gm-Message-State: AJIora9+BXaQGs1X3Cfh4tjbebFWN70AyWLm+vP/HYxX47KoY1PnH9w+
 Smw6t/+qc81mOiRiWSGbZeYFdRV2uydNtKefscxy3V1lwXXg/+SIkISYy79yRIanTq+LtdjKumD
 zqcFh3LHZroqaqeywu6dRS4weJ3DLvGE=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr17768997qvb.2.1658055643131; 
 Sun, 17 Jul 2022 04:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unAprwu6Qp61ZX0/ykVpkJehfhSXdsi1tI6KHkaiMRrjc2i/FOI5FscYm6bv0tjLbJAYqbsyqDCgn1PFtDPCo=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr17768989qvb.2.1658055642945; Sun, 17
 Jul 2022 04:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-22-eperezma@redhat.com>
 <120c7e7b-1044-166c-a861-3efb03b9df8f@redhat.com>
 <CAJaqyWebnbv18LTX8iEOdXNjaPEjBLiqj4gHqt5Nd5kWuwWTcA@mail.gmail.com>
In-Reply-To: <CAJaqyWebnbv18LTX8iEOdXNjaPEjBLiqj4gHqt5Nd5kWuwWTcA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Sun, 17 Jul 2022 13:00:07 +0200
Message-ID: <CAJaqyWfCs1F5ZJg=T6VZK7PLyjRx2Z3wtysFSMNBh84y3=ZsUg@mail.gmail.com>
Subject: Re: [RFC PATCH v9 21/23] vdpa: Add vhost_vdpa_start_control_svq
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 17, 2022 at 12:30 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Jul 12, 2022 at 9:26 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/7/7 02:40, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > As a first step we only enable CVQ first than others. Future patches =
add
> > > state restore.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >   net/vhost-vdpa.c | 19 +++++++++++++++++++
> > >   1 file changed, 19 insertions(+)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index e415cc8de5..77d013833f 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -370,6 +370,24 @@ static CVQElement *vhost_vdpa_cvq_alloc_elem(Vho=
stVDPAState *s,
> > >       return g_steal_pointer(&cvq_elem);
> > >   }
> > >
> > > +static int vhost_vdpa_start_control_svq(VhostShadowVirtqueue *svq,
> > > +                                        void *opaque)
> > > +{
> > > +    struct vhost_vring_state state =3D {
> > > +        .index =3D virtio_get_queue_index(svq->vq),
> > > +        .num =3D 1,
> > > +    };
> > > +    VhostVDPAState *s =3D opaque;
> > > +    struct vhost_dev *dev =3D s->vhost_vdpa.dev;
> > > +    struct vhost_vdpa *v =3D dev->opaque;
> > > +    int r;
> > > +
> > > +    assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VD=
PA);
> > > +
> > > +    r =3D ioctl(v->device_fd, VHOST_VDPA_SET_VRING_ENABLE, &state);
> > > +    return r < 0 ? -errno : r;
> > > +}
> > > +
> > >   /**
> > >    * iov_size with an upper limit. It's assumed UINT64_MAX is an inva=
lid
> > >    * iov_size.
> > > @@ -554,6 +572,7 @@ static const VhostShadowVirtqueueOps vhost_vdpa_n=
et_svq_ops =3D {
> > >       .avail_handler =3D vhost_vdpa_net_handle_ctrl_avail,
> > >       .used_handler =3D vhost_vdpa_net_handle_ctrl_used,
> > >       .detach_handler =3D vhost_vdpa_net_handle_ctrl_detach,
> > > +    .start =3D vhost_vdpa_start_control_svq,
> > >   };
> >
> >
> > I wonder if vhost_net_start() is something better than here. It knows
> > all virtqueues and it can do whatever it wants, we just need to make
> > shadow virtqueue visible there?
> >
>
> But this needs to be called after the set of DRIVER_OK and before
> VHOST_VRING_ENABLE.
>
> I also think vhost_net_start is a better place, but to achieve it we
> need to split vhost_vdpa_dev_start to call VHOST_VRING_ENABLE after
> it. Maybe through .vhost_set_vring_enable? Why wasn't it done that way
> from the beginning?
>
> After that, we need to modify the vhost_net_start sequence. Currently,
> vhost_net is calling VHOST_VRING_ENABLE right after each vhost_dev
> vhost_dev_start. Vdpa would need to call vhost_dev_start for each
> device, and then call .vhost_set_vring_enable for each device again.
> And to add the vdpa_cvq_start in the middle.
>
> It's not a lot of code change but I think we're safer self containing
> it in vdpa at the moment, and then we can move to vhost_net
> immediately for the development cycle. If the vhost-user backend
> should support this other sequence immediately, I'm ok with sending a
> new version before Tuesday.
>

+=3D Moved to vhost_vdpa in the already sent RFC [1].

[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02856.html


