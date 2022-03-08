Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9415E4D1169
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:59:38 +0100 (CET)
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUkr-0005db-MW
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:59:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRUMR-0001Ou-Up
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:34:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRUMQ-0008BT-1f
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646724860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZcD3tGcJdOUEzjr66CWHptnK39ygSQWDs9ZK64ukAJ4=;
 b=NppBEEjRBTeS4uWnvhgcWXSE7mK48OnKf+FHgO1PYrkj48Cx9MzjsisUtvcLH4+xfckacD
 BJdxKDY98E3JjURBGLUzQvO3OxtvLobSGa3wMCwxHu90maQniZqywUOFzR7/oLWgnc7hOh
 wrht0K4wRS5WidN/giZ9TtYX+Rt3h4c=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-lablD7AzOxyQrE8Tm5WDKQ-1; Tue, 08 Mar 2022 02:34:17 -0500
X-MC-Unique: lablD7AzOxyQrE8Tm5WDKQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 dw13-20020a0562140a0d00b00435ab868167so1127242qvb.22
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZcD3tGcJdOUEzjr66CWHptnK39ygSQWDs9ZK64ukAJ4=;
 b=C5yvvV8ieeEGv/cvggGwHHBp3awqonWp45NH2J5sGdPXn88S2+vvViOoO7S1xYv0cj
 VfrzKiD8bys8GFVEkrUg9ALXyDbNpTS3ZgXoSq7DMX0hgAGvBXMhzWcZDCvGKx5jpw1y
 M9FpZMvWNmPal44/bGKeWVcCYCKD4nvkCrk4sdqoZ6HyReWnG4P+LSQk/S50GfFw4F5E
 kfLcp3/GJiz5BdcWZhXm17Lc72CgO5e4w3hegKgqV+kyaysrMlGxh5Hmiu3JSaV3CJ83
 AIDzGXdz27CQ7Eg8m4PPWJuSajEDKDdkWN6CzJ3SombW8+trvXl7723NE15J55U9EgNw
 AhwA==
X-Gm-Message-State: AOAM533TLDizZZdaFReHGJDTI5WeO0ebAbY32Xa1iv0WapCCwRD8erUd
 8a4HaUHehjPu4KGmfjfSTBfwXUZimkSh120BO0VsPj3ST075WTgKUxa/MUxkAgGFa4JLAnzGbHu
 58I9V3rqHGdiMfY1FfXRKWb1c6T14IEU=
X-Received: by 2002:a05:620a:3195:b0:649:2a18:1480 with SMTP id
 bi21-20020a05620a319500b006492a181480mr9252956qkb.308.1646724856980; 
 Mon, 07 Mar 2022 23:34:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw21p0XZ22pKJkXFqJPzQF9f5y7GB0G5S4WR15ZZ4pp61QfNu32sMCS/iINfTZCBqdpdoQfvf8sKHCZG7nVwVU=
X-Received: by 2002:a05:620a:3195:b0:649:2a18:1480 with SMTP id
 bi21-20020a05620a319500b006492a181480mr9252930qkb.308.1646724856716; Mon, 07
 Mar 2022 23:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <20220307153334.3854134-16-eperezma@redhat.com>
 <20220308021116-mutt-send-email-mst@kernel.org>
 <CAJaqyWewPYVPDOYTgKs03-LyfMHWkE+OR6tBEQ25rZ3YZmTrsw@mail.gmail.com>
In-Reply-To: <CAJaqyWewPYVPDOYTgKs03-LyfMHWkE+OR6tBEQ25rZ3YZmTrsw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 8 Mar 2022 08:33:40 +0100
Message-ID: <CAJaqyWecGp7LFjLkDmFS5bSyGsu+WC9NY=ZfOGpbLUpCcO571w@mail.gmail.com>
Subject: Re: [PATCH v5 15/15] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 8:32 AM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Tue, Mar 8, 2022 at 8:11 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Mar 07, 2022 at 04:33:34PM +0100, Eugenio P=C3=A9rez wrote:
> > > Finally offering the possibility to enable SVQ from the command line.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  qapi/net.json    |  8 +++++++-
> > >  net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++------=
--
> > >  2 files changed, 47 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/qapi/net.json b/qapi/net.json
> > > index 7fab2e7cd8..d626fa441c 100644
> > > --- a/qapi/net.json
> > > +++ b/qapi/net.json
> > > @@ -445,12 +445,18 @@
> > >  # @queues: number of queues to be created for multiqueue vhost-vdpa
> > >  #          (default: 1)
> > >  #
> > > +# @svq: Start device with (experimental) shadow virtqueue. (Since 7.=
0)
> > > +#
> > > +# Features:
> > > +# @unstable: Member @svq is experimental.
> > > +#
> > >  # Since: 5.1
> > >  ##
> > >  { 'struct': 'NetdevVhostVDPAOptions',
> > >    'data': {
> > >      '*vhostdev':     'str',
> > > -    '*queues':       'int' } }
> > > +    '*queues':       'int',
> > > +    '*svq':          {'type': 'bool', 'features' : [ 'unstable'] } }=
 }
> > >
> > >  ##
> > >  # @NetClientDriver:
> >
> > I think this should be x-svq same as other unstable features.
> >
>
> I'm fine with both, but I was pointed to the other direction at [1] and [=
2].
>

(Sorry, I hit "send" too quick)

What I totally missed was to change the subject of this patch, I could
send a new series with that if you want.

> Thanks!
>
> [1] https://patchwork.kernel.org/project/qemu-devel/patch/20220302203012.=
3476835-15-eperezma@redhat.com/
> [2] https://lore.kernel.org/qemu-devel/20220303185147.3605350-15-eperezma=
@redhat.com/
>
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 1e9fe47c03..c827921654 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -127,7 +127,11 @@ err_init:
> > >  static void vhost_vdpa_cleanup(NetClientState *nc)
> > >  {
> > >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > +    struct vhost_dev *dev =3D s->vhost_vdpa.dev;
> > >
> > > +    if (dev && dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> > > +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_de=
lete);
> > > +    }
> > >      if (s->vhost_net) {
> > >          vhost_net_cleanup(s->vhost_net);
> > >          g_free(s->vhost_net);
> > > @@ -187,13 +191,23 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> > >          .check_peer_type =3D vhost_vdpa_check_peer_type,
> > >  };
> > >
> > > +static int vhost_vdpa_get_iova_range(int fd,
> > > +                                     struct vhost_vdpa_iova_range *i=
ova_range)
> > > +{
> > > +    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > > +
> > > +    return ret < 0 ? -errno : 0;
> > > +}
> > > +
> > >  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> > > -                                           const char *device,
> > > -                                           const char *name,
> > > -                                           int vdpa_device_fd,
> > > -                                           int queue_pair_index,
> > > -                                           int nvqs,
> > > -                                           bool is_datapath)
> > > +                                       const char *device,
> > > +                                       const char *name,
> > > +                                       int vdpa_device_fd,
> > > +                                       int queue_pair_index,
> > > +                                       int nvqs,
> > > +                                       bool is_datapath,
> > > +                                       bool svq,
> > > +                                       VhostIOVATree *iova_tree)
> > >  {
> > >      NetClientState *nc =3D NULL;
> > >      VhostVDPAState *s;
> > > @@ -211,6 +225,8 @@ static NetClientState *net_vhost_vdpa_init(NetCli=
entState *peer,
> > >
> > >      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> > >      s->vhost_vdpa.index =3D queue_pair_index;
> > > +    s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > > +    s->vhost_vdpa.iova_tree =3D iova_tree;
> > >      ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_in=
dex, nvqs);
> > >      if (ret) {
> > >          qemu_del_net_client(nc);
> > > @@ -266,6 +282,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> > >      g_autofree NetClientState **ncs =3D NULL;
> > >      NetClientState *nc;
> > >      int queue_pairs, i, has_cvq =3D 0;
> > > +    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> > >
> > >      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > >      opts =3D &netdev->u.vhost_vdpa;
> > > @@ -285,29 +302,44 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> > >          qemu_close(vdpa_device_fd);
> > >          return queue_pairs;
> > >      }
> > > +    if (opts->svq) {
> > > +        struct vhost_vdpa_iova_range iova_range;
> > > +
> > > +        if (has_cvq) {
> > > +            error_setg(errp, "vdpa svq does not work with cvq");
> > > +            goto err_svq;
> > > +        }
> > > +        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > > +        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_ran=
ge.last);
> > > +    }
> > >
> > >      ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> > >
> > >      for (i =3D 0; i < queue_pairs; i++) {
> > >          ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > > -                                     vdpa_device_fd, i, 2, true);
> > > +                                     vdpa_device_fd, i, 2, true, opt=
s->svq,
> > > +                                     iova_tree);
> > >          if (!ncs[i])
> > >              goto err;
> > >      }
> > >
> > >      if (has_cvq) {
> > >          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > > -                                 vdpa_device_fd, i, 1, false);
> > > +                                 vdpa_device_fd, i, 1, false, opts->=
svq,
> > > +                                 iova_tree);
> > >          if (!nc)
> > >              goto err;
> > >      }
> > >
> > > +    iova_tree =3D NULL;
> > >      return 0;
> > >
> > >  err:
> > >      if (i) {
> > >          qemu_del_net_client(ncs[0]);
> > >      }
> > > +
> > > +err_svq:
> > >      qemu_close(vdpa_device_fd);
> > >
> > >      return -1;
> > > --
> > > 2.27.0
> >


