Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC66504EE3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 12:39:19 +0200 (CEST)
Received: from localhost ([::1]:36256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngOms-0005lS-Oz
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 06:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ngOkg-00046F-Jl
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 06:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ngOke-0000s2-Jo
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 06:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650278219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ol1mpi/G4dhxl3MOZmYtKqx4BuSqr+Jy7nxvwuK2Fso=;
 b=EYnY8LaXe+2ZL0tCwMh4ocQM7J3183lyzLdGLE5Mxs48OD8xgYExxsoFloDGijjKuIRXG4
 mJ/AbDAXQSFFYNY2hCU2Eg46H2dCoUlYLnpyWvnAfFhnqdWg6TzAEl1BQJ3se1WIsNG4jS
 /94aAk4sEgV5ScS6WO1Yp+S198gTneU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-F7fY-Of2M8WRQknKbaoK2g-1; Mon, 18 Apr 2022 06:36:58 -0400
X-MC-Unique: F7fY-Of2M8WRQknKbaoK2g-1
Received: by mail-qv1-f69.google.com with SMTP id
 dz20-20020ad45894000000b004463bf9543fso5813954qvb.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 03:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ol1mpi/G4dhxl3MOZmYtKqx4BuSqr+Jy7nxvwuK2Fso=;
 b=efUIrOMMKcEHbG2+HYdL2Flabe34/utVqWKHqCRzJGlDOhowmZSRALWae64xvqZOLw
 z0DAF/u19AT6kt37CuvoDNt4uOe1EP+5eJkc5xB0+XQWY4JEIMTEcflvBZozOUsP8Kwk
 htKh78ruv6lgYenoZiu/AKNVrgyge2oxP2UYma9zKO4XjS1AelFKwrWQGWKai31mk5Jl
 Y9d+eqGgF7CCUaBhq/TE4epq74nrQulvwO4yU7uubFJOxFkN/LSfCMYOxmGYhH8o4q/a
 bAi3GeiGDcUN01TXaCIJvcyoI4AeLp7JjXsg84PIPNSM9opN3iyuNWtMsLNOrYgzKjUP
 PzGw==
X-Gm-Message-State: AOAM531Is3DZWzvcbmNjwTam8vPsEBeb/MF8HCJmHAzllFNKWTCJzpjN
 TDLq2H1gwqeuByJOYKtRMtdrhV7Oa9tbDFMp36WidRFRm74X+MMTKFWuWBWAgjK94nXeqRIoKkJ
 4x/OYH0xVI8TY469G2425h7vm/98GvXQ=
X-Received: by 2002:a0c:b2c2:0:b0:443:9772:e555 with SMTP id
 d2-20020a0cb2c2000000b004439772e555mr7487321qvf.26.1650278218336; 
 Mon, 18 Apr 2022 03:36:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3zRfEF6/ltSvm48QIvTxoyXAef9bSmAowhY+uMeU2X/jZXy9lPqnxT+nXbRFDMw70qOGyZo8AdHSK3ri0x4k=
X-Received: by 2002:a0c:b2c2:0:b0:443:9772:e555 with SMTP id
 d2-20020a0cb2c2000000b004439772e555mr7487311qvf.26.1650278218089; Mon, 18 Apr
 2022 03:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-9-eperezma@redhat.com>
 <a0f3e6dd-f32c-257b-694b-7592ae35ef2f@redhat.com>
In-Reply-To: <a0f3e6dd-f32c-257b-694b-7592ae35ef2f@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Apr 2022 12:36:22 +0200
Message-ID: <CAJaqyWcogVeeEH+=nTMC2362rt_vsB-8+Z=k4E+Gr0kfyjJMyg@mail.gmail.com>
Subject: Re: [RFC PATCH v7 08/25] vdpa: Add x-svq to NetdevVhostVDPAOptions
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 7:32 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/4/14 00:31, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Finally offering the possibility to enable SVQ from the command line.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   qapi/net.json    |  9 ++++++++-
> >   net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++-------=
-
> >   2 files changed, 48 insertions(+), 9 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index b92f3f5fb4..92848e4362 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -445,12 +445,19 @@
> >   # @queues: number of queues to be created for multiqueue vhost-vdpa
> >   #          (default: 1)
> >   #
> > +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.=
1)
> > +#         (default: false)
> > +#
> > +# Features:
> > +# @unstable: Member @x-svq is experimental.
> > +#
> >   # Since: 5.1
> >   ##
> >   { 'struct': 'NetdevVhostVDPAOptions',
> >     'data': {
> >       '*vhostdev':     'str',
> > -    '*queues':       'int' } }
> > +    '*queues':       'int',
> > +    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
> >
> >   ##
> >   # @NetClientDriver:
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 1e9fe47c03..9261101af2 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -128,6 +128,7 @@ static void vhost_vdpa_cleanup(NetClientState *nc)
> >   {
> >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >
> > +    g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_release)=
;
> >       if (s->vhost_net) {
> >           vhost_net_cleanup(s->vhost_net);
> >           g_free(s->vhost_net);
> > @@ -187,13 +188,23 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> >           .check_peer_type =3D vhost_vdpa_check_peer_type,
> >   };
> >
> > +static int vhost_vdpa_get_iova_range(int fd,
> > +                                     struct vhost_vdpa_iova_range *iov=
a_range)
> > +{
> > +    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > +
> > +    return ret < 0 ? -errno : 0;
> > +}
> > +
> >   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> > -                                           const char *device,
> > -                                           const char *name,
> > -                                           int vdpa_device_fd,
> > -                                           int queue_pair_index,
> > -                                           int nvqs,
> > -                                           bool is_datapath)
> > +                                       const char *device,
> > +                                       const char *name,
> > +                                       int vdpa_device_fd,
> > +                                       int queue_pair_index,
> > +                                       int nvqs,
> > +                                       bool is_datapath,
>
>
> It's better not mix style changes here (especially it looks correct).
>
>
> > +                                       bool svq,
> > +                                       VhostIOVATree *iova_tree)
> >   {
> >       NetClientState *nc =3D NULL;
> >       VhostVDPAState *s;
> > @@ -211,8 +222,14 @@ static NetClientState *net_vhost_vdpa_init(NetClie=
ntState *peer,
> >
> >       s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >       s->vhost_vdpa.index =3D queue_pair_index;
> > +    s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > +    s->vhost_vdpa.iova_tree =3D iova_tree ? vhost_iova_tree_acquire(io=
va_tree) :
> > +                              NULL;
> >       ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_ind=
ex, nvqs);
> >       if (ret) {
> > +        if (iova_tree) {
> > +            vhost_iova_tree_release(iova_tree);
> > +        }
> >           qemu_del_net_client(nc);
> >           return NULL;
> >       }
> > @@ -266,6 +283,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >       g_autofree NetClientState **ncs =3D NULL;
> >       NetClientState *nc;
> >       int queue_pairs, i, has_cvq =3D 0;
> > +    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >
> >       assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >       opts =3D &netdev->u.vhost_vdpa;
> > @@ -285,19 +303,31 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >           qemu_close(vdpa_device_fd);
> >           return queue_pairs;
> >       }
> > +    if (opts->x_svq) {
> > +        struct vhost_vdpa_iova_range iova_range;
> > +
> > +        if (has_cvq) {
> > +            error_setg(errp, "vdpa svq does not work with cvq");
> > +            goto err_svq;
> > +        }
> > +        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > +        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_range=
.last);
> > +    }
> >
> >       ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> >
> >       for (i =3D 0; i < queue_pairs; i++) {
> >           ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                     vdpa_device_fd, i, 2, true);
> > +                                     vdpa_device_fd, i, 2, true, opts-=
>x_svq,
> > +                                     iova_tree);
> >           if (!ncs[i])
> >               goto err;
> >       }
> >
> >       if (has_cvq) {
> >           nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                 vdpa_device_fd, i, 1, false);
> > +                                 vdpa_device_fd, i, 1, false, opts->x_=
svq,
> > +                                 iova_tree);
>
>
> So we had at most 1 iova_tree here, so the refcnt looks unnecessary.
>

It's needed later, I can reorder the patch order so refcount is
introduced right before the patch that uses it.

Thanks!

> Thanks
>
>
> >           if (!nc)
> >               goto err;
> >       }
> > @@ -308,6 +338,8 @@ err:
> >       if (i) {
> >           qemu_del_net_client(ncs[0]);
> >       }
> > +
> > +err_svq:
> >       qemu_close(vdpa_device_fd);
> >
> >       return -1;
>


