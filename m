Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E61400CF0
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 22:43:24 +0200 (CEST)
Received: from localhost ([::1]:38264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMcVX-0001mT-EV
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 16:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMcSh-0007z9-RP
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMcSc-0005kJ-Iy
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630788018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Djle/VptooCBWaFimUtK/TBWOM2iQGZn9RNOiobF1jQ=;
 b=cq+p6T8cZbxv4pC8GVsaZhmnpGqVPDent8r/NIdH49QJbPPEcCw+ESOGcGxXehfEbrZZqS
 +sbGbyo0JuYlvwcnUSHKkvXyZdVMLujmayhEdHoB8jyI0qfrZMrZ7SYtlR0R3yJS03QYYO
 /7XzZ1Kd/GOD1dz10p2mv/WsGe3lCMw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-RlKAueO4M1yxdpQPuiZelA-1; Sat, 04 Sep 2021 16:40:18 -0400
X-MC-Unique: RlKAueO4M1yxdpQPuiZelA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y19-20020a056402441300b003cd8ce2b987so1443445eda.6
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 13:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9M39T4JAYJ+v6537a8Q9WFbfa7hCHIeOH+5+JeQgaGA=;
 b=kcXxvTLl0GqMGdGmAbZ6e2UBTe5IREs2I26DwV+gRwLy8UyeQi5oYPgQuDDHl4Vm/Q
 RMYYTuJhN9I5+G1UDw04i0wg25BCDrcnBTZP1P/dOf7l/JCfBaF6O8MG676fQXXZm/6D
 +iU7RfZP3fIgKOJ4yDXkNWQrO8s1r1RqvmZB0bwSqdaahwzkJ2URomrE/9H+AN2JXgQZ
 QBMbwV/y0QX9iJMX/JsTWq3qjYGnA+nOYCNL6b9Jo+S9WZOjvcAyckE3Dx4wuLXsqE5T
 v4a8HpCQ42UbT/kHC8uxp0nJiJz9jj1sVnX44A6un5McK/0SNFMh9/5WfTSIfFgM4tTD
 irjA==
X-Gm-Message-State: AOAM530L/bxUfaUaIirnek4ZISpCtuB72qZZ4R4bmZM66yXQpR1jLHDe
 Yo+3o6S9BFdiij78LLpT1i/z4ORGWUGnCScvaw9vz4b+Cu7PojB0gZTAx9R27v9s7PaAoSmUYTO
 1aH80NTxZEmidgjo=
X-Received: by 2002:a17:906:1289:: with SMTP id k9mr5839289ejb.2.1630788016712; 
 Sat, 04 Sep 2021 13:40:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3c60oEyoyEYY2s90Mziqa89JL1xvoeh0hkKmmsetxT2E1Xa/yK7SMdUAvT+rxbYqNSXZWUw==
X-Received: by 2002:a17:906:1289:: with SMTP id k9mr5839274ejb.2.1630788016490; 
 Sat, 04 Sep 2021 13:40:16 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id q18sm1499661ejc.84.2021.09.04.13.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:40:15 -0700 (PDT)
Date: Sat, 4 Sep 2021 16:40:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 17/21] vhost-net: control virtqueue support
Message-ID: <20210904164002-mutt-send-email-mst@kernel.org>
References: <20210903091031.47303-1-jasowang@redhat.com>
 <20210903091031.47303-18-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903091031.47303-18-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: lulu@redhat.com, qemu-devel@nongnu.org, gdawar@xilinx.com,
 eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 05:10:27PM +0800, Jason Wang wrote:
> We assume there's no cvq in the past, this is not true when we need
> control virtqueue support for vhost-user backends. So this patch
> implements the control virtqueue support for vhost-net. As datapath,
> the control virtqueue is also required to be coupled with the
> NetClientState. The vhost_net_start/stop() are tweaked to accept the
> number of datapath queue pairs plus the the number of control
> virtqueue for us to start and stop the vhost device.
>=20
> Signed-off-by: Jason Wang <jasowang@redhat.com>


Fails build:

FAILED: libcommon.fa.p/hw_net_vhost_net-stub.c.o=20
cc -Ilibcommon.fa.p -I. -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/spic=
e-1 -I/usr/include/spice-server -I/usr/include/cacard -I/usr/include/glib-2=
.0 -I/usr/lib64/glib-2.0/include -I/usr/include/nss3 -I/usr/include/nspr4 -=
I/usr/include/libmount -I/usr/include/blkid -I/usr/include/pixman-1 -I/usr/=
include/p11-kit-1 -I/usr/include/SDL2 -I/usr/include/libpng16 -I/usr/includ=
e/virgl -I/usr/include/libusb-1.0 -I/usr/include/slirp -I/usr/include/gtk-3=
.0 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/freetype=
2 -I/usr/include/fribidi -I/usr/include/libxml2 -I/usr/include/cairo -I/usr=
/include/gdk-pixbuf-2.0 -I/usr/include/gio-unix-2.0 -I/usr/include/atk-1.0 =
-I/usr/include/at-spi2-atk/2.0 -I/usr/include/dbus-1.0 -I/usr/lib64/dbus-1.=
0/include -I/usr/include/at-spi-2.0 -I/usr/include/vte-2.91 -I/usr/include/=
capstone -fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=
=3Dgnu11 -O2 -g -isystem /scm/qemu/linux-headers -isystem linux-headers -iq=
uote . -iquote /scm/qemu -iquote /scm/qemu/include -iquote /scm/qemu/disas/=
libvixl -iquote /scm/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SO=
URCE=3D2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SO=
URCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissin=
g-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declarati=
on -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Win=
it-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -=
Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs =
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC -D_DEFA=
ULT_SOURCE -D_XOPEN_SOURCE=3D600 -DNCURSES_WIDECHAR -DSTRUCT_IOVEC_DEFINED =
-D_REENTRANT -Wno-undef -MD -MQ libcommon.fa.p/hw_net_vhost_net-stub.c.o -M=
F libcommon.fa.p/hw_net_vhost_net-stub.c.o.d -o libcommon.fa.p/hw_net_vhost=
_net-stub.c.o -c ../hw/net/vhost_net-stub.c
../hw/net/vhost_net-stub.c:34:5: error: conflicting types for =E2=80=98vhos=
t_net_start=E2=80=99
   34 | int vhost_net_start(VirtIODevice *dev,
      |     ^~~~~~~~~~~~~~~
In file included from ../hw/net/vhost_net-stub.c:19:
/scm/qemu/include/net/vhost_net.h:24:5: note: previous declaration of =E2=
=80=98vhost_net_start=E2=80=99 was here
   24 | int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
      |     ^~~~~~~~~~~~~~~
../hw/net/vhost_net-stub.c:40:6: error: conflicting types for =E2=80=98vhos=
t_net_stop=E2=80=99
   40 | void vhost_net_stop(VirtIODevice *dev,
      |      ^~~~~~~~~~~~~~
In file included from ../hw/net/vhost_net-stub.c:19:
/scm/qemu/include/net/vhost_net.h:26:6: note: previous declaration of =E2=
=80=98vhost_net_stop=E2=80=99 was here
   26 | void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
      |      ^~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.
make[1]: *** [Makefile:156: run-ninja] Error 1



> ---
>  hw/net/vhost_net.c      | 43 ++++++++++++++++++++++++++++++-----------
>  hw/net/virtio-net.c     |  4 ++--
>  include/net/vhost_net.h |  6 ++++--
>  3 files changed, 38 insertions(+), 15 deletions(-)
>=20
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 386ec2eaa2..7e0b60b4d9 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -315,11 +315,14 @@ static void vhost_net_stop_one(struct vhost_net *ne=
t,
>  }
> =20
>  int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> -                    int total_queues)
> +                    int data_qps, int cvq)
>  {
>      BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(dev)));
>      VirtioBusState *vbus =3D VIRTIO_BUS(qbus);
>      VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(vbus);
> +    int total_notifiers =3D data_qps * 2 + cvq;
> +    VirtIONet *n =3D VIRTIO_NET(dev);
> +    int nvhosts =3D data_qps + cvq;
>      struct vhost_net *net;
>      int r, e, i;
>      NetClientState *peer;
> @@ -329,9 +332,14 @@ int vhost_net_start(VirtIODevice *dev, NetClientStat=
e *ncs,
>          return -ENOSYS;
>      }
> =20
> -    for (i =3D 0; i < total_queues; i++) {
> +    for (i =3D 0; i < nvhosts; i++) {
> +
> +        if (i < data_qps) {
> +            peer =3D qemu_get_peer(ncs, i);
> +        } else { /* Control Virtqueue */
> +            peer =3D qemu_get_peer(ncs, n->max_queues);
> +        }
> =20
> -        peer =3D qemu_get_peer(ncs, i);
>          net =3D get_vhost_net(peer);
>          vhost_net_set_vq_index(net, i * 2);
> =20
> @@ -344,14 +352,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientSta=
te *ncs,
>          }
>       }
> =20
> -    r =3D k->set_guest_notifiers(qbus->parent, total_queues * 2, true);
> +    r =3D k->set_guest_notifiers(qbus->parent, total_notifiers, true);
>      if (r < 0) {
>          error_report("Error binding guest notifier: %d", -r);
>          goto err;
>      }
> =20
> -    for (i =3D 0; i < total_queues; i++) {
> -        peer =3D qemu_get_peer(ncs, i);
> +    for (i =3D 0; i < nvhosts; i++) {
> +        if (i < data_qps) {
> +            peer =3D qemu_get_peer(ncs, i);
> +        } else {
> +            peer =3D qemu_get_peer(ncs, n->max_queues);
> +        }
>          r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> =20
>          if (r < 0) {
> @@ -375,7 +387,7 @@ err_start:
>          peer =3D qemu_get_peer(ncs , i);
>          vhost_net_stop_one(get_vhost_net(peer), dev);
>      }
> -    e =3D k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
> +    e =3D k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>      if (e < 0) {
>          fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
>          fflush(stderr);
> @@ -385,18 +397,27 @@ err:
>  }
> =20
>  void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
> -                    int total_queues)
> +                    int data_qps, int cvq)
>  {
>      BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(dev)));
>      VirtioBusState *vbus =3D VIRTIO_BUS(qbus);
>      VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(vbus);
> +    VirtIONet *n =3D VIRTIO_NET(dev);
> +    NetClientState *peer;
> +    int total_notifiers =3D data_qps * 2 + cvq;
> +    int nvhosts =3D data_qps + cvq;
>      int i, r;
> =20
> -    for (i =3D 0; i < total_queues; i++) {
> -        vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
> +    for (i =3D 0; i < nvhosts; i++) {
> +        if (i < data_qps) {
> +            peer =3D qemu_get_peer(ncs, i);
> +        } else {
> +            peer =3D qemu_get_peer(ncs, n->max_queues);
> +        }
> +        vhost_net_stop_one(get_vhost_net(peer), dev);
>      }
> =20
> -    r =3D k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
> +    r =3D k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>      if (r < 0) {
>          fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);
>          fflush(stderr);
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 16d20cdee5..8fccbaa44c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -285,14 +285,14 @@ static void virtio_net_vhost_status(VirtIONet *n, u=
int8_t status)
>          }
> =20
>          n->vhost_started =3D 1;
> -        r =3D vhost_net_start(vdev, n->nic->ncs, queues);
> +        r =3D vhost_net_start(vdev, n->nic->ncs, queues, 0);
>          if (r < 0) {
>              error_report("unable to start vhost net: %d: "
>                           "falling back on userspace virtio", -r);
>              n->vhost_started =3D 0;
>          }
>      } else {
> -        vhost_net_stop(vdev, n->nic->ncs, queues);
> +        vhost_net_stop(vdev, n->nic->ncs, queues, 0);
>          n->vhost_started =3D 0;
>      }
>  }
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index fba40cf695..e656e38af9 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -21,8 +21,10 @@ typedef struct VhostNetOptions {
>  uint64_t vhost_net_get_max_queues(VHostNetState *net);
>  struct vhost_net *vhost_net_init(VhostNetOptions *options);
> =20
> -int vhost_net_start(VirtIODevice *dev, NetClientState *ncs, int total_qu=
eues);
> -void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs, int total_qu=
eues);
> +int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> +                    int data_qps, int cvq);
> +void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
> +                    int data_qps, int cvq);
> =20
>  void vhost_net_cleanup(VHostNetState *net);
> =20
> --=20
> 2.25.1


