Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3680CFC261
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 10:14:04 +0100 (CET)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVBCV-0005Jo-8O
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 04:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57767)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iVBAh-0003LN-Fs
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:12:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iVBAf-0005LP-9u
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:12:11 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32951
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iVBAf-0005KS-4O
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573722727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W56fz7o7jbEKWc3kRzshq8PY6o3Mvo664Maqk680iks=;
 b=iZVOrCckcsPV6EO+0z79VOktJ4oBXvj4QqP2s4O1DFvakRpPM6WdLRbdcGNcFT+0tIA1A2
 7v+8fIbS2mv+oNrQahN4EsxLgLlMXCXLH0IR3ynQxKJWhkVAgJ0a4EYxJb9m95KJwTrOqi
 bFMyYmL9EAiK/Hp+hsFffJW8WiBbGuY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-DaX5DEoCNMGTxpeohVnSzA-1; Thu, 14 Nov 2019 04:12:06 -0500
Received: by mail-qk1-f198.google.com with SMTP id x186so3537678qke.13
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 01:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=isNtA0IYg/N18++IW5AY/QA+c+xkdBeRJ7LtqVbPdDY=;
 b=eWS+s8dfMkSOckJcbgQ/rwCBjeLu5zFvMtTzcMOxaR1rfymk83E3MmT0+DqOtztrfL
 VB/VDfNAcszM0I8Y+ouvQbl8GQam8e8TLx2XW7BUC8VYwpTK2dqa2DLd208e69DZTuJ/
 jzfM/3ce1yTu7nKx/JhtJzfA4edwhLTfkNjC519foJvj/cxYDfPKBWYF6+HC1DFOeK/K
 5tXZdvbGqdNABBGHZJ/crGJxJwOOKjIHJZmfhgFjNS90SzCQBwrwWYMMDr0nxNEa9+cA
 6HeQ8F3lGI5qO6/Ap2/395S9xD/JyIkmkaIo0aFSG3qfc8bCwHt0X8eZKFw24ECG8d2V
 1dZQ==
X-Gm-Message-State: APjAAAXtiPF4l7NOginuMqPCeXTXitbm3WBJ9glXU4ixBJdkYCAYH3Lt
 ZFX15sjCfOCW5Rvp3Kz5MVjCVwmZBesEUN28aEVXe3HEckEKPiJQlBv6dFMwEVm3tFIG7WcI1zx
 UPueGRrnDspaXj/M=
X-Received: by 2002:ac8:2e57:: with SMTP id s23mr7176459qta.204.1573722726106; 
 Thu, 14 Nov 2019 01:12:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqy1NX3LYkW0eWLqXOM9GVrohWSR3MEQfIDpzcsCpzJ0CWT7q1tqWTO0LZUbbwZncPXn/exAkw==
X-Received: by 2002:ac8:2e57:: with SMTP id s23mr7176444qta.204.1573722725797; 
 Thu, 14 Nov 2019 01:12:05 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
 by smtp.gmail.com with ESMTPSA id 50sm2990379qtv.88.2019.11.14.01.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 01:12:05 -0800 (PST)
Date: Thu, 14 Nov 2019 04:12:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: Re: [PATCH RFC] virtio-pci: disable vring processing when
 bus-mastering is disabled
Message-ID: <20191114041049-mutt-send-email-mst@kernel.org>
References: <20191113054301.31529-1-mdroth@linux.vnet.ibm.com>
 <20191113050402-mutt-send-email-mst@kernel.org>
 <157369365636.3335.3099930975683371802@sif>
 <20191114034532-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191114034532-mutt-send-email-mst@kernel.org>
X-MC-Unique: DaX5DEoCNMGTxpeohVnSzA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 14, 2019 at 04:10:36AM -0500, Michael S. Tsirkin wrote:
> On Wed, Nov 13, 2019 at 07:07:36PM -0600, Michael Roth wrote:
> > Quoting Michael S. Tsirkin (2019-11-13 04:09:02)
> > > On Tue, Nov 12, 2019 at 11:43:01PM -0600, Michael Roth wrote:
> > > > Currently the SLOF firmware for pseries guests will disable/re-enab=
le
> > > > a PCI device multiple times via IO/MEM/MASTER bits of PCI_COMMAND
> > > > register after the initial probe/feature negotiation, as it tends t=
o
> > > > work with a single device at a time at various stages like probing
> > > > and running block/network bootloaders without doing a full reset
> > > > in-between.
> > > >=20
> > > > In QEMU, when PCI_COMMAND_MASTER is disabled we disable the
> > > > corresponding IOMMU memory region, so DMA accesses (including to vr=
ing
> > > > fields like idx/flags) will no longer undergo the necessary
> > > > translation. Normally we wouldn't expect this to happen since it wo=
uld
> > > > be misbehavior on the driver side to continue driving DMA requests.
> > > >=20
> > > > However, in the case of pseries, with iommu_platform=3Don, we trigg=
er the
> > > > following sequence when tearing down the virtio-blk dataplane ioeve=
ntfd
> > > > in response to the guest unsetting PCI_COMMAND_MASTER:
> > > >=20
> > > >   #2  0x0000555555922651 in virtqueue_map_desc (vdev=3Dvdev@entry=
=3D0x555556dbcfb0, p_num_sg=3Dp_num_sg@entry=3D0x7fffe657e1a8, addr=3Daddr@=
entry=3D0x7fffe657e240, iov=3Diov@entry=3D0x7fffe6580240, max_num_sg=3Dmax_=
num_sg@entry=3D1024, is_write=3Dis_write@entry=3Dfalse, pa=3D0, sz=3D0)
> > > >       at /home/mdroth/w/qemu.git/hw/virtio/virtio.c:757
> > > >   #3  0x0000555555922a89 in virtqueue_pop (vq=3Dvq@entry=3D0x555556=
dc8660, sz=3Dsz@entry=3D184)
> > > >       at /home/mdroth/w/qemu.git/hw/virtio/virtio.c:950
> > > >   #4  0x00005555558d3eca in virtio_blk_get_request (vq=3D0x555556dc=
8660, s=3D0x555556dbcfb0)
> > > >       at /home/mdroth/w/qemu.git/hw/block/virtio-blk.c:255
> > > >   #5  0x00005555558d3eca in virtio_blk_handle_vq (s=3D0x555556dbcfb=
0, vq=3D0x555556dc8660)
> > > >       at /home/mdroth/w/qemu.git/hw/block/virtio-blk.c:776
> > > >   #6  0x000055555591dd66 in virtio_queue_notify_aio_vq (vq=3Dvq@ent=
ry=3D0x555556dc8660)
> > > >       at /home/mdroth/w/qemu.git/hw/virtio/virtio.c:1550
> > > >   #7  0x000055555591ecef in virtio_queue_notify_aio_vq (vq=3D0x5555=
56dc8660)
> > > >       at /home/mdroth/w/qemu.git/hw/virtio/virtio.c:1546
> > > >   #8  0x000055555591ecef in virtio_queue_host_notifier_aio_poll (op=
aque=3D0x555556dc86c8)
> > > >       at /home/mdroth/w/qemu.git/hw/virtio/virtio.c:2527
> > > >   #9  0x0000555555d02164 in run_poll_handlers_once (ctx=3Dctx@entry=
=3D0x55555688bfc0, timeout=3Dtimeout@entry=3D0x7fffe65844a8)
> > > >       at /home/mdroth/w/qemu.git/util/aio-posix.c:520
> > > >   #10 0x0000555555d02d1b in try_poll_mode (timeout=3D0x7fffe65844a8=
, ctx=3D0x55555688bfc0)
> > > >       at /home/mdroth/w/qemu.git/util/aio-posix.c:607
> > > >   #11 0x0000555555d02d1b in aio_poll (ctx=3Dctx@entry=3D0x55555688b=
fc0, blocking=3Dblocking@entry=3Dtrue)
> > > >       at /home/mdroth/w/qemu.git/util/aio-posix.c:639
> > > >   #12 0x0000555555d0004d in aio_wait_bh_oneshot (ctx=3D0x55555688bf=
c0, cb=3Dcb@entry=3D0x5555558d5130 <virtio_blk_data_plane_stop_bh>, opaque=
=3Dopaque@entry=3D0x555556de86f0)
> > > >       at /home/mdroth/w/qemu.git/util/aio-wait.c:71
> > > >   #13 0x00005555558d59bf in virtio_blk_data_plane_stop (vdev=3D<opt=
imized out>)
> > > >       at /home/mdroth/w/qemu.git/hw/block/dataplane/virtio-blk.c:28=
8
> > > >   #14 0x0000555555b906a1 in virtio_bus_stop_ioeventfd (bus=3Dbus@en=
try=3D0x555556dbcf38)
> > > >       at /home/mdroth/w/qemu.git/hw/virtio/virtio-bus.c:245
> > > >   #15 0x0000555555b90dbb in virtio_bus_stop_ioeventfd (bus=3Dbus@en=
try=3D0x555556dbcf38)
> > > >       at /home/mdroth/w/qemu.git/hw/virtio/virtio-bus.c:237
> > > >   #16 0x0000555555b92a8e in virtio_pci_stop_ioeventfd (proxy=3D0x55=
5556db4e40)
> > > >       at /home/mdroth/w/qemu.git/hw/virtio/virtio-pci.c:292
> > > >   #17 0x0000555555b92a8e in virtio_write_config (pci_dev=3D0x555556=
db4e40, address=3D<optimized out>, val=3D1048832, len=3D<optimized out>)
> > > >       at /home/mdroth/w/qemu.git/hw/virtio/virtio-pci.c:613
> > > >=20
> > > > I.e. the calling code is only scheduling a one-shot BH for
> > > > virtio_blk_data_plane_stop_bh, but somehow we end up trying to proc=
ess
> > > > an additional virtqueue entry before we get there. This is likely d=
ue
> > > > to the following check in virtio_queue_host_notifier_aio_poll:
> > > >=20
> > > >   static bool virtio_queue_host_notifier_aio_poll(void *opaque)
> > > >   {
> > > >       EventNotifier *n =3D opaque;
> > > >       VirtQueue *vq =3D container_of(n, VirtQueue, host_notifier);
> > > >       bool progress;
> > > >=20
> > > >       if (!vq->vring.desc || virtio_queue_empty(vq)) {
> > > >           return false;
> > > >       }
> > > >=20
> > > >       progress =3D virtio_queue_notify_aio_vq(vq);
> > > >=20
> > > > namely the call to virtio_queue_empty(). In this case, since no new
> > > > requests have actually been issued, shadow_avail_idx =3D=3D last_av=
ail_idx,
> > > > so we actually try to access the vring via vring_avail_idx() to get
> > > > the latest non-shadowed idx:
> > > >=20
> > > >   int virtio_queue_empty(VirtQueue *vq)
> > > >   {
> > > >       bool empty;
> > > >       ...
> > > >=20
> > > >       if (vq->shadow_avail_idx !=3D vq->last_avail_idx) {
> > > >           return 0;
> > > >       }
> > > >=20
> > > >       rcu_read_lock();
> > > >       empty =3D vring_avail_idx(vq) =3D=3D vq->last_avail_idx;
> > > >       rcu_read_unlock();
> > > >       return empty;
> > > >=20
> > > > but since the IOMMU region has been disabled we get a bogus value (=
0
> > > > usually), which causes virtio_queue_empty() to falsely report that
> > > > there are entries to be processed, which causes errors such as:
> > > >=20
> > > >   "virtio: zero sized buffers are not allowed"
> > > >=20
> > > > or
> > > >=20
> > > >   "virtio-blk missing headers"
> > > >=20
> > > > and puts the device in an error state.
> > > >=20
> > > > This patch works around the issue by introducing virtio_set_disable=
d(),
> > > > which piggy-backs off the vdev->broken flag we already use to bypas=
s
> > > > checks like virtio_queue_empty(), and sets/unsets it in response to
> > > > enabling/disabling bus-mastering.
> > > >=20
> > > > NOTES:
> > > >=20
> > > >  - It's possible we could also work around this in SLOF by doing a
> > > >    full reset instead of relying on PCI_COMMAND to enable/disable, =
but
> > > >    in any case the QEMU behavior seems wrong.
> > > >  - This leaves some other oddities in play, like the fact that
> > > >    DRIVER_OK also gets unset in response to bus-mastering being
> > > >    disabled, but not restored (however the device seems to continue
> > > >    working)
> > > >  - Similarly, we disable the host notifier via
> > > >    virtio_bus_stop_ioeventfd(), which seems to move the handling ou=
t
> > > >    of virtio-blk dataplane and back into the main IO thread, and it
> > > >    ends up staying there till a reset (but otherwise continues work=
ing
> > > >    normally)
> > > >=20
> > > > Cc: David Gibson <david@gibson.dropbear.id.au>,
> > > > Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> > > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > > Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> > > > ---
> > > >  hw/virtio/virtio-pci.c     | 12 ++++++++----
> > > >  hw/virtio/virtio.c         |  7 ++++++-
> > > >  include/hw/virtio/virtio.h |  1 +
> > > >  3 files changed, 15 insertions(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > > > index c6b47a9c73..394d409fb9 100644
> > > > --- a/hw/virtio/virtio-pci.c
> > > > +++ b/hw/virtio/virtio-pci.c
> > > > @@ -608,10 +608,14 @@ static void virtio_write_config(PCIDevice *pc=
i_dev, uint32_t address,
> > > >          pcie_cap_flr_write_config(pci_dev, address, val, len);
> > > >      }
> > > > =20
> > > > -    if (range_covers_byte(address, len, PCI_COMMAND) &&
> > > > -        !(pci_dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) {
> > > > -        virtio_pci_stop_ioeventfd(proxy);
> > > > -        virtio_set_status(vdev, vdev->status & ~VIRTIO_CONFIG_S_DR=
IVER_OK);
> > > > +    if (range_covers_byte(address, len, PCI_COMMAND)) {
> > > > +        if (!(pci_dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) =
{
> > > > +            virtio_set_disabled(vdev, true);
> > > > +            virtio_pci_stop_ioeventfd(proxy);
> > > > +            virtio_set_status(vdev, vdev->status & ~VIRTIO_CONFIG_=
S_DRIVER_OK);
> > > > +        } else {
> > > > +            virtio_set_disabled(vdev, false);
> > > > +        }
> > > >      }
> > > > =20
> > > >      if (proxy->config_cap &&
> > > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > > index 527df03bfd..46580c357d 100644
> > > > --- a/hw/virtio/virtio.c
> > > > +++ b/hw/virtio/virtio.c
> > > > @@ -2575,6 +2575,11 @@ void virtio_device_set_child_bus_name(VirtIO=
Device *vdev, char *bus_name)
> > > >      vdev->bus_name =3D g_strdup(bus_name);
> > > >  }
> > > > =20
> > > > +void virtio_set_disabled(VirtIODevice *vdev, bool disable)
> > > > +{
> > > > +    vdev->broken =3D disable;
> > > > +}
> > > > +
> > > >  void GCC_FMT_ATTR(2, 3) virtio_error(VirtIODevice *vdev, const cha=
r *fmt, ...)
> > > >  {
> > > >      va_list ap;
> > >=20
> > > Hmm. I think just clear and immediate set of bus master while device =
was
> > > not doing any DMA actually should be fine and should not require a
> > > reset.  Now it's true that right now guests reset first thing which w=
ill
> > > clear the broken flag, but I'd say it's wrong to require this specifi=
c
> > > order.
> > > I think the easiest thing is to add a "disabled" flag.
> >=20
> > Agreed. Some comments on that below.
> >=20
> > >=20
> > >=20
> > > > @@ -2588,7 +2593,7 @@ void GCC_FMT_ATTR(2, 3) virtio_error(VirtIODe=
vice *vdev, const char *fmt, ...)
> > > >          virtio_notify_config(vdev);
> > > >      }
> > > > =20
> > > > -    vdev->broken =3D true;
> > > > +    virtio_set_disabled(vdev, true);
> > > >  }
> > > > =20
> > > >  static void virtio_memory_listener_commit(MemoryListener *listener=
)
> > > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.=
h
> > > > index 48e8d04ff6..921945b7e8 100644
> > > > --- a/include/hw/virtio/virtio.h
> > > > +++ b/include/hw/virtio/virtio.h
> > > > @@ -168,6 +168,7 @@ void virtio_init(VirtIODevice *vdev, const char=
 *name,
> > > >                           uint16_t device_id, size_t config_size);
> > > >  void virtio_cleanup(VirtIODevice *vdev);
> > > > =20
> > > > +void virtio_set_disabled(VirtIODevice *vdev, bool disable);
> > > >  void virtio_error(VirtIODevice *vdev, const char *fmt, ...) GCC_FM=
T_ATTR(2, 3);
> > > > =20
> > > >  /* Set the child bus name. */
> > >=20
> > >=20
> > > One open question here is cross version migration.
> > > What exactly happens if we migrate to an old qemu?
> > > from an old qemu?
> >=20
> > Currently vdev->broken is already migrated via a subsection if it is se=
t.
> >=20
> > So, with the current proposed patch I would expect the following:
> >=20
> >  old -> new:
> >    dev->broken set due to proposed virtio_set_disabled():
> >      - N/A
> >    dev->broken set due to other/existing reasons:
> >      - value is migrated, migration succeeds
> >      - device continues not working until a reset, or bus-mastering
> >        enabled/re-enabled. (which is good, but also makes me realize
> >        that a device that was put into broken state for reasons
> >        other than virtio_set_disabled() should not get 'unbroken'
> >        simply because bus-master bit was cycled. a separate flag
> >        is probably needed)
> >      - PASS
> >    dev->broken not set:
> >      - not migrated
> >      - PASS
> >  new -> old:
> >    dev->broken set due to proposed virtio_set_disabled():
> >      - migration succeeds to any QEMU that already has handling for
> >        dev->broken.
> >      - migration fails for any QEMU that doesn't have handling for
> >        dev->broken as it does now, but will a higher chance of
> >        triggering
> >      - device won't work until it is reset. for most guests we will
> >        probably get a reset before the device is used again anyway. for
> >        the SLOF case the device will stay broken after bus-mastering
> >        re-enabled, but that's the case for existing QEMU now anyway
> >      - PASS, but with increased chance of migration breakage for
> >        QEMU's that don't have handling for dev->broken.
> >    dev->broken set due to other/existing reasons:
> >      - migration succeeds to any QEMU that already has handling for
> >        dev->broken. device will require a reset as it does now.
> >      - migration fails for any QEMU that doesn't have handling for
> >        dev->broken as it does now
> >      - PASS
> >    dev->broken not set:
> >      - not migrated
> >      - PASS
> >=20
> > With a new dev->disabled flag, which we'd likely send using a subsectio=
n
> > like with dev->broken, I would expect the following:
> >=20
> >  old -> new:
> >    dev->disabled set:
> >      - N/A
> >    dev->disabled not set:
> >      - not migrated
> >      - if source disables BM just before migration we will likely go
> >        into an error state that either sets dev->broken or puts the
> >        device in some other possibly bad state. either case would requi=
re
> >        subsequent reset, just as they would without migration
> >      - PASS
> >  new -> old:
> >    dev->disabled set:
> >      - migration stream fails
> >      - FAIL, but as expected, and doesn't seem common currently outside
> >        of SLOF early-boot else we'd probably have more reports of
> >        breakage from vring access while BM isn't set.
> >    dev->broken not set:
> >      - not migrated
> >      - PASS
> >=20
> > So re-using 'broken' is slightly better from a migration standpoint, bu=
t
> > as noted above it is probably wrong to unset 'broken' just because BM b=
it
> > gets cycled, so a new 'disabled' flag is probably needed.
> >=20
> > We could probably get by with just adding a check for dev->disabled in=
=20
> > virtio_queue_empty(), or even earlier in
> > virtio_queue_host_notifier_aio_poll(), but it seems more proper to also
> > add it in most of the same places we currently check for dev->broken.
> >=20
> > That seems somewhat redundant though, so I think maybe the best approac=
h
> > is to:
> >=20
> >  - replace most dev->broken checks with checks for dev->disabled
>=20
> I propose calling an inline functions so we are not tied to a specific
> field.
>=20
> >  - set dev->disabled whenever dev->broken gets set
> >  - add a check in virtio_set_disabled() that only allows us to re-enabl=
e if
> >    dev->broken hasn't also been set.
> >=20
> > I'll work on a follow-up using that approach if it seems reasonable to
> > you.


Also, since the new field is not migrated anyway, how about a flag
that old machine types set, and behave the way we do now?
> >=20
> > Thanks!
> >=20
> > >=20
> > > > --=20
> > > > 2.17.1
> > >=20


