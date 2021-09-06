Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D57640154B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 05:46:47 +0200 (CEST)
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN5ao-0007Ma-CK
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 23:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mN5Y1-00051a-4I
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 23:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mN5Xz-00033f-7z
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 23:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630899830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjkfpBaKj0jjnglKRRl6GGSxE0cP6dYruTih/z4sNL4=;
 b=QoO0ml0DK04YN/EIaGlrl6XvvctUzNdK2xgVbklARhBBUxsGo3Aj88ntYZlArFSMq/pabz
 bdkiXc+y0SZlMTpvlNytVKNTFVn07wDwsD0ioaZOk4HTa/AwhKFl0jPpsRJ9Zrdk9I9uSr
 W5q81oX9fzxC/B/N8t6O1rCk+xTjpc0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-raN10Ux_NmieC1YEVWShLA-1; Sun, 05 Sep 2021 23:43:47 -0400
X-MC-Unique: raN10Ux_NmieC1YEVWShLA-1
Received: by mail-lj1-f199.google.com with SMTP id
 v2-20020a2e5042000000b001def54ff19eso2693230ljd.2
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 20:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SjkfpBaKj0jjnglKRRl6GGSxE0cP6dYruTih/z4sNL4=;
 b=QNquUJqaIik2URaD69Pe0WoBKjQBWKF4cmSKs6pR2FIq6uLvgCSH/xFYaOhW6vOGRm
 +PoCEGHRCpWY/hR2LC5F+GnOGfd4GGQo+QJinsVx46dixKTExWs4GdV1g3p2bAeAJXD0
 rkPI0bxjTx/b4DkEHtuDL5NM8qvNsbVaUPVop3qGUapRrCztC04UWNFcERw9ok0Bcbqw
 NewQzfbY8Ru/mTxSVsCrBbyjsVfMbcZbDwtFAC32lBK/awVTV53txuBdlEiWRQUnPvAT
 6NKj+nu6hHWK9RwJ+1WOfCSrhLVQ3hmnJ/ereTDgXM2Tn+XdTmdSMaEmDAs5Yg0KL8I0
 SDCQ==
X-Gm-Message-State: AOAM533H+DaZrCthqKCcCKzct4wX0DO6VApmhgQ0mZbzOIIiHAwB5UTD
 Ziv778CskxW+n5C//kplkXVRV0fRayt/om0m4QZ6dK7jmunoYCNAhDpU8nnsuKUsZ0zqbInDu7p
 kd6svNQ8+YO3TobZJ7sZrQ0eb8As6V+E=
X-Received: by 2002:a2e:b88a:: with SMTP id r10mr1014457ljp.362.1630899825639; 
 Sun, 05 Sep 2021 20:43:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweX/JdTKHL9DRLaRcP43WYsKJQc58dFI8DI8Ti29Q5ZOl/VYGEQX5cuKjUQaUYQHUHYtS9EsoTttLpA3fnkOU=
X-Received: by 2002:a2e:b88a:: with SMTP id r10mr1014434ljp.362.1630899825295; 
 Sun, 05 Sep 2021 20:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210903091031.47303-1-jasowang@redhat.com>
 <20210903091031.47303-18-jasowang@redhat.com>
 <20210904164002-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210904164002-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 6 Sep 2021 11:43:34 +0800
Message-ID: <CACGkMEu2Ny2OAU1-MD7B8x62QkB=7C5HGjdoxCcmFqPPvmPKgg@mail.gmail.com>
Subject: Re: [PATCH V2 17/21] vhost-net: control virtqueue support
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Cindy Lu <lulu@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gautam Dawar <gdawar@xilinx.com>, eperezma <eperezma@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 4:40 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Sep 03, 2021 at 05:10:27PM +0800, Jason Wang wrote:
> > We assume there's no cvq in the past, this is not true when we need
> > control virtqueue support for vhost-user backends. So this patch
> > implements the control virtqueue support for vhost-net. As datapath,
> > the control virtqueue is also required to be coupled with the
> > NetClientState. The vhost_net_start/stop() are tweaked to accept the
> > number of datapath queue pairs plus the the number of control
> > virtqueue for us to start and stop the vhost device.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
>
>
> Fails build:
>
> FAILED: libcommon.fa.p/hw_net_vhost_net-stub.c.o
> cc -Ilibcommon.fa.p -I. -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/sp=
ice-1 -I/usr/include/spice-server -I/usr/include/cacard -I/usr/include/glib=
-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/nss3 -I/usr/include/nspr4=
 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/pixman-1 -I/us=
r/include/p11-kit-1 -I/usr/include/SDL2 -I/usr/include/libpng16 -I/usr/incl=
ude/virgl -I/usr/include/libusb-1.0 -I/usr/include/slirp -I/usr/include/gtk=
-3.0 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/freety=
pe2 -I/usr/include/fribidi -I/usr/include/libxml2 -I/usr/include/cairo -I/u=
sr/include/gdk-pixbuf-2.0 -I/usr/include/gio-unix-2.0 -I/usr/include/atk-1.=
0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/dbus-1.0 -I/usr/lib64/dbus-=
1.0/include -I/usr/include/at-spi-2.0 -I/usr/include/vte-2.91 -I/usr/includ=
e/capstone -fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -st=
d=3Dgnu11 -O2 -g -isystem /scm/qemu/linux-headers -isystem linux-headers -i=
quote . -iquote /scm/qemu -iquote /scm/qemu/include -iquote /scm/qemu/disas=
/libvixl -iquote /scm/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_S=
OURCE=3D2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_S=
OURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissi=
ng-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declarat=
ion -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Wi=
nit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels =
-Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs=
 -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC -D_DEF=
AULT_SOURCE -D_XOPEN_SOURCE=3D600 -DNCURSES_WIDECHAR -DSTRUCT_IOVEC_DEFINED=
 -D_REENTRANT -Wno-undef -MD -MQ libcommon.fa.p/hw_net_vhost_net-stub.c.o -=
MF libcommon.fa.p/hw_net_vhost_net-stub.c.o.d -o libcommon.fa.p/hw_net_vhos=
t_net-stub.c.o -c ../hw/net/vhost_net-stub.c
> ../hw/net/vhost_net-stub.c:34:5: error: conflicting types for =E2=80=98vh=
ost_net_start=E2=80=99
>    34 | int vhost_net_start(VirtIODevice *dev,
>       |     ^~~~~~~~~~~~~~~
> In file included from ../hw/net/vhost_net-stub.c:19:
> /scm/qemu/include/net/vhost_net.h:24:5: note: previous declaration of =E2=
=80=98vhost_net_start=E2=80=99 was here
>    24 | int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>       |     ^~~~~~~~~~~~~~~
> ../hw/net/vhost_net-stub.c:40:6: error: conflicting types for =E2=80=98vh=
ost_net_stop=E2=80=99
>    40 | void vhost_net_stop(VirtIODevice *dev,
>       |      ^~~~~~~~~~~~~~
> In file included from ../hw/net/vhost_net-stub.c:19:
> /scm/qemu/include/net/vhost_net.h:26:6: note: previous declaration of =E2=
=80=98vhost_net_stop=E2=80=99 was here
>    26 | void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>       |      ^~~~~~~~~~~~~~
> ninja: build stopped: subcommand failed.
> make[1]: *** [Makefile:156: run-ninja] Error 1

Will fix this.

Thanks

>
>
>
> > ---
> >  hw/net/vhost_net.c      | 43 ++++++++++++++++++++++++++++++-----------
> >  hw/net/virtio-net.c     |  4 ++--
> >  include/net/vhost_net.h |  6 ++++--
> >  3 files changed, 38 insertions(+), 15 deletions(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 386ec2eaa2..7e0b60b4d9 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -315,11 +315,14 @@ static void vhost_net_stop_one(struct vhost_net *=
net,
> >  }
> >
> >  int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> > -                    int total_queues)
> > +                    int data_qps, int cvq)
> >  {
> >      BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(dev)));
> >      VirtioBusState *vbus =3D VIRTIO_BUS(qbus);
> >      VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(vbus);
> > +    int total_notifiers =3D data_qps * 2 + cvq;
> > +    VirtIONet *n =3D VIRTIO_NET(dev);
> > +    int nvhosts =3D data_qps + cvq;
> >      struct vhost_net *net;
> >      int r, e, i;
> >      NetClientState *peer;
> > @@ -329,9 +332,14 @@ int vhost_net_start(VirtIODevice *dev, NetClientSt=
ate *ncs,
> >          return -ENOSYS;
> >      }
> >
> > -    for (i =3D 0; i < total_queues; i++) {
> > +    for (i =3D 0; i < nvhosts; i++) {
> > +
> > +        if (i < data_qps) {
> > +            peer =3D qemu_get_peer(ncs, i);
> > +        } else { /* Control Virtqueue */
> > +            peer =3D qemu_get_peer(ncs, n->max_queues);
> > +        }
> >
> > -        peer =3D qemu_get_peer(ncs, i);
> >          net =3D get_vhost_net(peer);
> >          vhost_net_set_vq_index(net, i * 2);
> >
> > @@ -344,14 +352,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientS=
tate *ncs,
> >          }
> >       }
> >
> > -    r =3D k->set_guest_notifiers(qbus->parent, total_queues * 2, true)=
;
> > +    r =3D k->set_guest_notifiers(qbus->parent, total_notifiers, true);
> >      if (r < 0) {
> >          error_report("Error binding guest notifier: %d", -r);
> >          goto err;
> >      }
> >
> > -    for (i =3D 0; i < total_queues; i++) {
> > -        peer =3D qemu_get_peer(ncs, i);
> > +    for (i =3D 0; i < nvhosts; i++) {
> > +        if (i < data_qps) {
> > +            peer =3D qemu_get_peer(ncs, i);
> > +        } else {
> > +            peer =3D qemu_get_peer(ncs, n->max_queues);
> > +        }
> >          r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> >
> >          if (r < 0) {
> > @@ -375,7 +387,7 @@ err_start:
> >          peer =3D qemu_get_peer(ncs , i);
> >          vhost_net_stop_one(get_vhost_net(peer), dev);
> >      }
> > -    e =3D k->set_guest_notifiers(qbus->parent, total_queues * 2, false=
);
> > +    e =3D k->set_guest_notifiers(qbus->parent, total_notifiers, false)=
;
> >      if (e < 0) {
> >          fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e=
);
> >          fflush(stderr);
> > @@ -385,18 +397,27 @@ err:
> >  }
> >
> >  void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
> > -                    int total_queues)
> > +                    int data_qps, int cvq)
> >  {
> >      BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(dev)));
> >      VirtioBusState *vbus =3D VIRTIO_BUS(qbus);
> >      VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(vbus);
> > +    VirtIONet *n =3D VIRTIO_NET(dev);
> > +    NetClientState *peer;
> > +    int total_notifiers =3D data_qps * 2 + cvq;
> > +    int nvhosts =3D data_qps + cvq;
> >      int i, r;
> >
> > -    for (i =3D 0; i < total_queues; i++) {
> > -        vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
> > +    for (i =3D 0; i < nvhosts; i++) {
> > +        if (i < data_qps) {
> > +            peer =3D qemu_get_peer(ncs, i);
> > +        } else {
> > +            peer =3D qemu_get_peer(ncs, n->max_queues);
> > +        }
> > +        vhost_net_stop_one(get_vhost_net(peer), dev);
> >      }
> >
> > -    r =3D k->set_guest_notifiers(qbus->parent, total_queues * 2, false=
);
> > +    r =3D k->set_guest_notifiers(qbus->parent, total_notifiers, false)=
;
> >      if (r < 0) {
> >          fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r=
);
> >          fflush(stderr);
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 16d20cdee5..8fccbaa44c 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -285,14 +285,14 @@ static void virtio_net_vhost_status(VirtIONet *n,=
 uint8_t status)
> >          }
> >
> >          n->vhost_started =3D 1;
> > -        r =3D vhost_net_start(vdev, n->nic->ncs, queues);
> > +        r =3D vhost_net_start(vdev, n->nic->ncs, queues, 0);
> >          if (r < 0) {
> >              error_report("unable to start vhost net: %d: "
> >                           "falling back on userspace virtio", -r);
> >              n->vhost_started =3D 0;
> >          }
> >      } else {
> > -        vhost_net_stop(vdev, n->nic->ncs, queues);
> > +        vhost_net_stop(vdev, n->nic->ncs, queues, 0);
> >          n->vhost_started =3D 0;
> >      }
> >  }
> > diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> > index fba40cf695..e656e38af9 100644
> > --- a/include/net/vhost_net.h
> > +++ b/include/net/vhost_net.h
> > @@ -21,8 +21,10 @@ typedef struct VhostNetOptions {
> >  uint64_t vhost_net_get_max_queues(VHostNetState *net);
> >  struct vhost_net *vhost_net_init(VhostNetOptions *options);
> >
> > -int vhost_net_start(VirtIODevice *dev, NetClientState *ncs, int total_=
queues);
> > -void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs, int total_=
queues);
> > +int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> > +                    int data_qps, int cvq);
> > +void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
> > +                    int data_qps, int cvq);
> >
> >  void vhost_net_cleanup(VHostNetState *net);
> >
> > --
> > 2.25.1
>


