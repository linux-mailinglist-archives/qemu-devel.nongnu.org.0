Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CC72E009
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 16:43:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVznx-0001bD-E9
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 10:43:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hVzmi-0000y2-14
	for qemu-devel@nongnu.org; Wed, 29 May 2019 10:42:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hVzmf-00013x-VV
	for qemu-devel@nongnu.org; Wed, 29 May 2019 10:42:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40910)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hVzmf-00012j-8a
	for qemu-devel@nongnu.org; Wed, 29 May 2019 10:42:29 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 134543179B4E;
	Wed, 29 May 2019 14:42:28 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C19821019607;
	Wed, 29 May 2019 14:42:22 +0000 (UTC)
Date: Wed, 29 May 2019 15:42:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Yongji Xie <elohimes@gmail.com>
Message-ID: <20190529144219.GJ2882@work-vm>
References: <20190320112646.3712-2-xieyongji@baidu.com>
	<20190524121909.277ae31e@bahia.lan>
	<20190528000854.GA11618@umbus.fritz.box>
	<20190528083909.65ba8be4@bahia.lan> <20190529111849.GD2882@work-vm>
	<20190529135434.34c46b39@bahia.lab.toulouse-stg.fr.ibm.com>
	<20190529123818.GG2882@work-vm>
	<20190529150213.51143f1c@bahia.lab.toulouse-stg.fr.ibm.com>
	<20190529134058.GI2882@work-vm>
	<CAONzpcYRK5ydTLuNh4cz3753odky9imAHc8+Lxt3gFa5qdH4kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAONzpcYRK5ydTLuNh4cz3753odky9imAHc8+Lxt3gFa5qdH4kg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 29 May 2019 14:42:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL v2 04/36] virtio: Introduce started flag to
 VirtioDevice
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Zhang Yu <zhangyu31@baidu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
	Xie Yongji <xieyongji@baidu.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Yongji Xie (elohimes@gmail.com) wrote:
> On Wed, 29 May 2019 at 21:43, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Greg Kurz (groug@kaod.org) wrote:
> > > On Wed, 29 May 2019 13:38:19 +0100
> > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > >
> > > > * Greg Kurz (groug@kaod.org) wrote:
> > > > > On Wed, 29 May 2019 12:18:50 +0100
> > > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > > >
> > > > > > * Greg Kurz (groug@kaod.org) wrote:
> > > > > > > On Tue, 28 May 2019 10:08:54 +1000
> > > > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > > > >
> > > > > > > > On Fri, May 24, 2019 at 12:19:09PM +0200, Greg Kurz wrote:
> > > > > > > > > On Mon, 20 May 2019 19:10:35 -0400
> > > > > > > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > > From: Xie Yongji <xieyongji@baidu.com>
> > > > > > > > > >
> > > > > > > > > > The virtio 1.0 transitional devices support driver uses the device
> > > > > > > > > > before setting the DRIVER_OK status bit. So we introduce a started
> > > > > > > > > > flag to indicate whether driver has started the device or not.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Xie Yongji <xieyongji@baidu.com>
> > > > > > > > > > Signed-off-by: Zhang Yu <zhangyu31@baidu.com>
> > > > > > > > > > Message-Id: <20190320112646.3712-2-xieyongji@baidu.com>
> > > > > > > > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > ---
> > > > > > > > > >  include/hw/virtio/virtio.h |  2 ++
> > > > > > > > > >  hw/virtio/virtio.c         | 52 ++++++++++++++++++++++++++++++++++++--
> > > > > > > > > >  2 files changed, 52 insertions(+), 2 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > > > > > > > > index 7140381e3a..27c0efc3d0 100644
> > > > > > > > > > --- a/include/hw/virtio/virtio.h
> > > > > > > > > > +++ b/include/hw/virtio/virtio.h
> > > > > > > > > > @@ -105,6 +105,8 @@ struct VirtIODevice
> > > > > > > > > >      uint16_t device_id;
> > > > > > > > > >      bool vm_running;
> > > > > > > > > >      bool broken; /* device in invalid state, needs reset */
> > > > > > > > > > +    bool started;
> > > > > > > > > > +    bool start_on_kick; /* virtio 1.0 transitional devices support that */
> > > > > > > > > >      VMChangeStateEntry *vmstate;
> > > > > > > > > >      char *bus_name;
> > > > > > > > > >      uint8_t device_endian;
> > > > > > > > > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > > > > > > > > index 28056a7ef7..5d533ac74e 100644
> > > > > > > > > > --- a/hw/virtio/virtio.c
> > > > > > > > > > +++ b/hw/virtio/virtio.c
> > > > > > > > > > @@ -1162,10 +1162,16 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val)
> > > > > > > > > >              }
> > > > > > > > > >          }
> > > > > > > > > >      }
> > > > > > > > > > +    vdev->started = val & VIRTIO_CONFIG_S_DRIVER_OK;
> > > > > > > > > > +    if (unlikely(vdev->start_on_kick && vdev->started)) {
> > > > > > > > > > +        vdev->start_on_kick = false;
> > > > > > > > > > +    }
> > > > > > > > > > +
> > > > > > > > > >      if (k->set_status) {
> > > > > > > > > >          k->set_status(vdev, val);
> > > > > > > > > >      }
> > > > > > > > > >      vdev->status = val;
> > > > > > > > > > +
> > > > > > > > > >      return 0;
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > > @@ -1208,6 +1214,9 @@ void virtio_reset(void *opaque)
> > > > > > > > > >          k->reset(vdev);
> > > > > > > > > >      }
> > > > > > > > > >
> > > > > > > > > > +    vdev->start_on_kick = (virtio_host_has_feature(vdev, VIRTIO_F_VERSION_1) &&
> > > > > > > > > > +                          !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1));
> > > > > > > > > > +    vdev->started = false;
> > > > > > > > > >      vdev->broken = false;
> > > > > > > > > >      vdev->guest_features = 0;
> > > > > > > > > >      vdev->queue_sel = 0;
> > > > > > > > > > @@ -1518,14 +1527,21 @@ void virtio_queue_set_align(VirtIODevice *vdev, int n, int align)
> > > > > > > > > >
> > > > > > > > > >  static bool virtio_queue_notify_aio_vq(VirtQueue *vq)
> > > > > > > > > >  {
> > > > > > > > > > +    bool ret = false;
> > > > > > > > > > +
> > > > > > > > > >      if (vq->vring.desc && vq->handle_aio_output) {
> > > > > > > > > >          VirtIODevice *vdev = vq->vdev;
> > > > > > > > > >
> > > > > > > > > >          trace_virtio_queue_notify(vdev, vq - vdev->vq, vq);
> > > > > > > > > > -        return vq->handle_aio_output(vdev, vq);
> > > > > > > > > > +        ret = vq->handle_aio_output(vdev, vq);
> > > > > > > > > > +
> > > > > > > > > > +        if (unlikely(vdev->start_on_kick)) {
> > > > > > > > > > +            vdev->started = true;
> > > > > > > > > > +            vdev->start_on_kick = false;
> > > > > > > > > > +        }
> > > > > > > > > >      }
> > > > > > > > > >
> > > > > > > > > > -    return false;
> > > > > > > > > > +    return ret;
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > >  static void virtio_queue_notify_vq(VirtQueue *vq)
> > > > > > > > > > @@ -1539,6 +1555,11 @@ static void virtio_queue_notify_vq(VirtQueue *vq)
> > > > > > > > > >
> > > > > > > > > >          trace_virtio_queue_notify(vdev, vq - vdev->vq, vq);
> > > > > > > > > >          vq->handle_output(vdev, vq);
> > > > > > > > > > +
> > > > > > > > > > +        if (unlikely(vdev->start_on_kick)) {
> > > > > > > > > > +            vdev->started = true;
> > > > > > > > > > +            vdev->start_on_kick = false;
> > > > > > > > > > +        }
> > > > > > > > > >      }
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > > @@ -1556,6 +1577,11 @@ void virtio_queue_notify(VirtIODevice *vdev, int n)
> > > > > > > > > >      } else if (vq->handle_output) {
> > > > > > > > > >          vq->handle_output(vdev, vq);
> > > > > > > > > >      }
> > > > > > > > > > +
> > > > > > > > > > +    if (unlikely(vdev->start_on_kick)) {
> > > > > > > > > > +        vdev->started = true;
> > > > > > > > > > +        vdev->start_on_kick = false;
> > > > > > > > > > +    }
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > >  uint16_t virtio_queue_vector(VirtIODevice *vdev, int n)
> > > > > > > > > > @@ -1770,6 +1796,13 @@ static bool virtio_broken_needed(void *opaque)
> > > > > > > > > >      return vdev->broken;
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > > +static bool virtio_started_needed(void *opaque)
> > > > > > > > > > +{
> > > > > > > > > > +    VirtIODevice *vdev = opaque;
> > > > > > > > > > +
> > > > > > > > > > +    return vdev->started;
> > > > > > > > >
> > > > > > > > > Existing machine types don't know about the "virtio/started" subsection. This
> > > > > > > > > breaks migration to older QEMUs if the driver has started the device, ie. most
> > > > > > > > > probably always when it comes to live migration.
> > > > > > > > >
> > > > > > > > > My understanding is that we do try to support backward migration though. It
> > > > > > > > > is a regular practice in datacenters to migrate workloads without having to
> > > > > > > > > take care of the QEMU version. FWIW I had to fix similar issues downstream
> > > > > > > > > many times in the past because customers had filed bugs.
> > > > > > > > >
> > > > > > > > > Cc'ing David for his opinion.
> > > > > > > >
> > > > > > > > Uh.. did you mean to CC me, or Dave Gilbert?
> > > > > > > >
> > > > > > >
> > > > > > > Oops... Dave Gilbert indeed, but you're thoughts on that matter are valuable
> > > > > > > as well. I remember being involved in backward migration fixes for spapr
> > > > > > > several times.
> > > > > > >
> > > > > > > > I mean, I think you're right that we should try to maintain backwards
> > > > > > > > migration, but this isn't really my area of authority.
> > > > > > > >
> > > > > > >
> > > > > > > Cc'ing Dave Gilbert :)
> > > > > >
> > > > > > Right, I need to maintain backwards migration compatibility; tie the
> > > > > > feature to a machine type so it's only used on newer machine types and
> > > > > > then we'll be safe.
> > > > > >
> > > > > > Having said that, what's the symptom when this goes wrong?
> > > > > >
> > > > >
> > > > > Since the started flag is set as soon as the guest driver begins to use
> > > > > the device and remains so until next reset, the associated subsection is
> > > > > basically always emitted when migrating a booted guest. This causes
> > > > > migration to always fail on the target in this case:
> > > >
> > > > I meant what's the symptom without this patch series at all?
> > > >
> > >
> > > Oh sorry... if I got it right, migrating when the guest first kicked the
> > > device but not set the DRIVE_OK bit yet would result in a guest hang on
> > > the destination. Yongji might elaborate a bit more on that.
> >
> > Hmm - the only thing worse than a migration failing with an error is a
> > migration that fails with a hung guest.
> >
> > If you were sending a new subsection in *only* the case where the guest
> > would definitely hang, then I think it would be worth sending the
> > subsection and allowing the backwards migration to fail with the error
> > because it's a bit better than a hung VM.
> >
> 
> I considered this approach before. But it needs to add some complex
> logic in virtio code to make sure migration works well between
> different qemu versions. Since it's hardly to trigger the hung VM bug.
> So I still try to use the general way (tie the feature to a machine
> type) to fix this migration issue. It's easily to ensure the
> compatibility

OK, great.  For reference could you give me a bit more info on how
exactly the failure happens, how you spot it and what the symptoms are;
so that when someone comes to me with a hung VM I know what to look for?

Dave

> Thanks,
> Yongji
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

