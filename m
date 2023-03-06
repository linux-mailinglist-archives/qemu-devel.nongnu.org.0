Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1412B6AB51F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 04:43:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ1jx-0007kn-0r; Sun, 05 Mar 2023 22:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ1jv-0007kd-AK
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:42:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ1jt-0003AQ-K7
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678074136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0hxxGEYuqu+9cX3KfGvjhtuGLmd4p9IkeAR52tZdX0E=;
 b=C5/ytxYiMetBz6gA1ruokWuqR6bKfFACz+bkVrT+H2wDKn5ssSbcX6Vg3N8AinySNy3Tio
 p8VqQvY/qFSbjWz7q9CO++/HUTwN+025xeDMM6B/YGmBbRcrv5J+OjvXaeNd+kRU9gtCUT
 ZvW6K4QSmA6hWw9fFRWRjA/Fd+Gwf6I=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-4aaAw6i4Nkie3Gpo5r4YAA-1; Sun, 05 Mar 2023 22:42:15 -0500
X-MC-Unique: 4aaAw6i4Nkie3Gpo5r4YAA-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1765e2031ccso5797309fac.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 19:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678074134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0hxxGEYuqu+9cX3KfGvjhtuGLmd4p9IkeAR52tZdX0E=;
 b=AuBCHDqfYDyL23Lo3jEzaqpIne3zvaoTwXICCOAiuAkHT7XAhjZyyUvdWJp5vttY/U
 TmvCbEC9p5TOgTSsSPbFEstO9oe5CEAsikZPO/5YpMpo7QDYH+MOjri3m7JvYd/uoHQ+
 kWYS0pa9F5seeBqAMlN9DXsg5p9RVhUWPR/H1hfRQG+9Cf/gd/b6EhdBF3AYKPB+i6Oo
 yAdVmy/Mk0AJ+WL3eh6J4YOLmrou4uem87Ove69UNP1/bmuOw/9Wy6r9BC9x81u7jGom
 5BKqhoo1eWsULZP/zwZR/Vw0ZWhqLSwRVQ/HSUICuUy+RQvtvdL7TNT//Zp2SRGFQ5a8
 MkLw==
X-Gm-Message-State: AO0yUKWWt0yTJsLdiTCPijhcG/QKD/r0/QsedXjmCIJLiyCp4f0y74Oe
 GIPVMFWFgGR37DT5Zd1GEB+ZVWQxRz/JaGceZcn60MelaVVOsmwlS0VKYZu0iLHUSSSFDa8ZJFB
 ofWmbAQiGkGbrI1sjDe1e8lGnyH9mNDk=
X-Received: by 2002:a05:6870:5b31:b0:176:2b47:b31d with SMTP id
 ds49-20020a0568705b3100b001762b47b31dmr3222263oab.9.1678074134665; 
 Sun, 05 Mar 2023 19:42:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+4QXSD+ua72ymuyKgl4lurKjK5AaRc8kiE/b60QioVMM/lFsKqh3RDfE4+SoLG6cs1aeT+iqdgNRuATsIvtvE=
X-Received: by 2002:a05:6870:5b31:b0:176:2b47:b31d with SMTP id
 ds49-20020a0568705b3100b001762b47b31dmr3222254oab.9.1678074134422; Sun, 05
 Mar 2023 19:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-13-eperezma@redhat.com>
 <2367dcff-e8c3-c3ca-378a-e9e67e10710a@redhat.com>
 <CACGkMEs13RdzLfU8nZwHT0YsZ_hXy47or4t9jkHCoJ1EVa3q9w@mail.gmail.com>
 <CAJaqyWcUMwchHZ66=o+aayVvsAT78iOnWo0g3jbg4A1TiAupfQ@mail.gmail.com>
 <69983de5-7cb7-02a1-8869-0977ff2928b2@redhat.com>
 <CAJaqyWfoTO26=aeWbWBBqM-kJpa+4ZtWNxwp2nFmZ9L14BoPqA@mail.gmail.com>
In-Reply-To: <CAJaqyWfoTO26=aeWbWBBqM-kJpa+4ZtWNxwp2nFmZ9L14BoPqA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 6 Mar 2023 11:42:03 +0800
Message-ID: <CACGkMEv-2-wj8xhimgX_iwOP1cuTsVKYgp2UTat6Xyg5QTURmw@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] vdpa: block migration if device has unsupported
 features
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>, 
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Mar 3, 2023 at 4:58=E2=80=AFPM Eugenio Perez Martin <eperezma@redha=
t.com> wrote:
>
> On Fri, Mar 3, 2023 at 4:48 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2023/3/2 03:32, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > On Mon, Feb 27, 2023 at 9:20 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > >> On Mon, Feb 27, 2023 at 4:15=E2=80=AFPM Jason Wang <jasowang@redhat.=
com> wrote:
> > >>>
> > >>> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > >>>> A vdpa net device must initialize with SVQ in order to be migratab=
le at
> > >>>> this moment, and initialization code verifies some conditions.  If=
 the
> > >>>> device is not initialized with the x-svq parameter, it will not ex=
pose
> > >>>> _F_LOG so the vhost subsystem will block VM migration from its
> > >>>> initialization.
> > >>>>
> > >>>> Next patches change this, so we need to verify migration condition=
s
> > >>>> differently.
> > >>>>
> > >>>> QEMU only supports a subset of net features in SVQ, and it cannot
> > >>>> migrate state that cannot track or restore in the destination.  Ad=
d a
> > >>>> migration blocker if the device offer an unsupported feature.
> > >>>>
> > >>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>>> ---
> > >>>> v3: add mirgation blocker properly so vhost_dev can handle it.
> > >>>> ---
> > >>>>    net/vhost-vdpa.c | 12 ++++++++----
> > >>>>    1 file changed, 8 insertions(+), 4 deletions(-)
> > >>>>
> > >>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > >>>> index 4f983df000..094dc1c2d0 100644
> > >>>> --- a/net/vhost-vdpa.c
> > >>>> +++ b/net/vhost-vdpa.c
> > >>>> @@ -795,7 +795,8 @@ static NetClientState *net_vhost_vdpa_init(Net=
ClientState *peer,
> > >>>>                                           int nvqs,
> > >>>>                                           bool is_datapath,
> > >>>>                                           bool svq,
> > >>>> -                                       struct vhost_vdpa_iova_ran=
ge iova_range)
> > >>>> +                                       struct vhost_vdpa_iova_ran=
ge iova_range,
> > >>>> +                                       uint64_t features)
> > >>>>    {
> > >>>>        NetClientState *nc =3D NULL;
> > >>>>        VhostVDPAState *s;
> > >>>> @@ -818,7 +819,10 @@ static NetClientState *net_vhost_vdpa_init(Ne=
tClientState *peer,
> > >>>>        s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > >>>>        s->vhost_vdpa.iova_range =3D iova_range;
> > >>>>        s->vhost_vdpa.shadow_data =3D svq;
> > >>>> -    if (!is_datapath) {
> > >>>> +    if (queue_pair_index =3D=3D 0) {
> > >>>> +        vhost_vdpa_net_valid_svq_features(features,
> > >>>> +                                          &s->vhost_vdpa.migratio=
n_blocker);
> > >>>
> > >>> Since we do validation at initialization, is this necessary to vali=
d
> > >>> once again in other places?
> > >> Ok, after reading patch 13, I think the question is:
> > >>
> > >> The validation seems to be independent to net, can we valid it once
> > >> during vhost_vdpa_init()?
> > >>
> > > vhost_vdpa_net_valid_svq_features also checks for net features. In
> > > particular, all the non transport features must be in
> > > vdpa_svq_device_features.
> > >
> > > This is how we protect that the device / guest will never negotiate
> > > things like VLAN filtering support, as SVQ still does not know how to
> > > restore at the destination.
> > >
> > > In the VLAN filtering case CVQ is needed to restore VLAN, so it is
> > > covered by patch 11/15. But other future features may need support fo=
r
> > > restoring it in the destination.
> >
> >
> > I wonder how hard to have a general validation code let net specific
> > code to advertise a blacklist to avoid code duplication.
> >
>
> A blacklist does not work here, because I don't know if SVQ needs
> changes for future feature bits that are still not in / proposed to
> the standard.

Could you give me an example for this?

>
> Regarding the code duplication, do you mean to validate transport
> features and net specific features in one shot, instead of having a
> dedicated function for SVQ transport?

Nope.

Thanks

>
> Thanks!
>
> > Thanks
> >
> >
> > >
> > > Thanks!
> > >
> > >> Thanks
> > >>
> > >>> Thanks
> > >>>
> > >>>
> > >>>> +    } else if (!is_datapath) {
> > >>>>            s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_=
page_size(),
> > >>>>                                                vhost_vdpa_net_cvq_=
cmd_page_len());
> > >>>>            memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd=
_page_len());
> > >>>> @@ -956,7 +960,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, =
const char *name,
> > >>>>        for (i =3D 0; i < queue_pairs; i++) {
> > >>>>            ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, n=
ame,
> > >>>>                                         vdpa_device_fd, i, 2, true=
, opts->x_svq,
> > >>>> -                                     iova_range);
> > >>>> +                                     iova_range, features);
> > >>>>            if (!ncs[i])
> > >>>>                goto err;
> > >>>>        }
> > >>>> @@ -964,7 +968,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, =
const char *name,
> > >>>>        if (has_cvq) {
> > >>>>            nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > >>>>                                     vdpa_device_fd, i, 1, false,
> > >>>> -                                 opts->x_svq, iova_range);
> > >>>> +                                 opts->x_svq, iova_range, feature=
s);
> > >>>>            if (!nc)
> > >>>>                goto err;
> > >>>>        }
> >
>


