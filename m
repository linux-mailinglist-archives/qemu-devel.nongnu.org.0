Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BACF368C872
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 22:18:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP8r4-0000fx-Po; Mon, 06 Feb 2023 16:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pP8qt-0000dy-Qq
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:16:40 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pP8qr-0007Ga-5P
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:16:39 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id i2so12891910ybt.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 13:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puH016TxqHI0QMU6JCA0n/enjpP5F4VC6ZwIXFSkWZk=;
 b=K6kkevZZMqHz3QuohRffQdYyTNzY+dGOvdvgM+Vf3QldSNLvc0s5jlRaFEPOudJxan
 JoxVcR07HmM3elgq/KDDWknbb7chu16H6NoBbN36ek10WBaMLwNWNi8Ody/MMu5nTe9+
 llqROUHaZz5VCNhJbNz7Wy4vTGUW9sMQ2WuknWPxK0EnRDlvDvnuFkpI67vxYVIDJBFq
 FfFkyrrAw/NythaTFxhPAtTPxpEndUmluo1KkhShZQUdt+208QzeDp+CaLWc/4zMSKWJ
 i2lgaDOsQnTnd4sIJCpaxTAmAsW5TSfm9ZWigugKffJz1Zspsb3H6zqzL2ErtcqS40c/
 Ar8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puH016TxqHI0QMU6JCA0n/enjpP5F4VC6ZwIXFSkWZk=;
 b=YPUpGxZg9OCZOtE28VUfEqwBtp4kw4eniyV0WDJvK9ySDeZKj63jSb3btnpeXEhvIQ
 ZN5j3wzzfiuBgkZrixa3RTeAfQzQXVyHY5+0Zzhr/UJI0HqxZ2ktKJlkTWGH9FCxsd2v
 aLnMA2xUY909wtpoRoq9tS859FEJCwjlTDYErpue7lh41wNPraXzS7jsrQjhzb3ztyyt
 xfxDFcqPMgvmel5kAU6/yMlrsGQhzs2K5BXf9Kn1COwkOdptKVydBAHUSAeorVamQkhW
 XlPcJ+nKyAs7/OWJXGTQwGLzpBmXf+D/iPVDPtMHGK1Cm+dNs4MZrx8xNejhUT4hw7VI
 DRHA==
X-Gm-Message-State: AO0yUKVWMffQY0LUxVOsB0LiOX3rz0uvenoWrULxrcQFoJ/HG5lBLz+x
 Lz8hw/DITaNaeaXs2U87trQ1FYVy5/c8P6GNxNM=
X-Google-Smtp-Source: AK7set8T8j4WxSWRcsmRS50NTZ9jipb5x4gMJMoE7LJGaDOh6Yw3y+JKWEkjRb/KO/2ec6HbYOuw4/DzfNSQfiBzcDI=
X-Received: by 2002:a25:9c81:0:b0:8a9:cdd7:2130 with SMTP id
 y1-20020a259c81000000b008a9cdd72130mr125977ybo.118.1675718194771; Mon, 06 Feb
 2023 13:16:34 -0800 (PST)
MIME-Version: 1.0
References: <fb523956-7a8c-608b-6db1-961686b73e9c@redhat.com>
 <CAJSP0QWnq6av7j6x_n-C2mLSPMYBhMeEthr6ayPN-cmsEB3UnA@mail.gmail.com>
 <87mt5qv76d.fsf@secure.mitica>
In-Reply-To: <87mt5qv76d.fsf@secure.mitica>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 6 Feb 2023 16:16:22 -0500
Message-ID: <CAJSP0QUO3i+tLfDE0sdNRePnoaqJ7TL29izmk5sDzRt83Ds8tQ@mail.gmail.com>
Subject: Re: vhost-user (virtio-fs) migration: back end state
To: quintela@redhat.com
Cc: Hanna Czenczek <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 virtio-fs-list <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dave Gilbert <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 6 Feb 2023 at 16:02, Juan Quintela <quintela@redhat.com> wrote:
>
> Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > On Mon, 6 Feb 2023 at 07:36, Hanna Czenczek <hreitz@redhat.com> wrote:
> >>
> >> Hi Stefan,
> >>
> >> For true virtio-fs migration, we need to migrate the daemon=E2=80=99s =
(back
> >> end=E2=80=99s) state somehow.  I=E2=80=99m addressing you because you =
had a talk on this
> >> topic at KVM Forum 2021. :)
> >>
> >> As far as I understood your talk, the only standardized way to migrate=
 a
> >> vhost-user back end=E2=80=99s state is via dbus-vmstate.  I believe th=
at
> >> interface is unsuitable for our use case, because we will need to
> >> migrate more than 1 MB of state.  Now, that 1 MB limit has supposedly
> >> been chosen arbitrarily, but the introducing commit=E2=80=99s message =
says that
> >> it=E2=80=99s based on the idea that the data must be supplied basicall=
y
> >> immediately anyway (due to both dbus and qemu migration requirements),
> >> and I don=E2=80=99t think we can meet that requirement.
> >
> > Yes, dbus-vmstate is the available today. It's independent of
> > vhost-user and VIRTIO.
>
> Once that we are here:
> - typical size of your starte (either vhost-user or whatever)
> - what are the posibilities that you can enter the iterative stage
>   negotiation (i.e. that you can create a dirty bitmap about your state)
>
> >> Has there been progress on the topic of standardizing a vhost-user bac=
k
> >> end state migration channel besides dbus-vmstate?  I=E2=80=99ve looked=
 around
> >> but didn=E2=80=99t find anything.  If there isn=E2=80=99t anything yet=
, is there still
> >> interest in the topic?
> >
> > Not that I'm aware of. There are two parts to the topic of VIRTIO
> > device state migration:
> > 1. Defining an interface for migrating VIRTIO/vDPA/vhost/vhost-user
> > devices.
>
> Related topic: I am having to do right now vfio devices migration.  That
> is basically hardware with huge binary blobs.  But they are "learning"
> to have a dirty bitmap.  Current GPU's are already on the 128GB range,
> so it is really needed.
>
> > It doesn't need to be implemented in all these places
> > immediately, but the design should consider that each of these
> > standards will need to participate in migration sooner or later. It
> > makes sense to choose an interface that works for all or most of these
> > interfaces instead of inventing something vhost-user-specific.
>
> In vfio, we really need to use binary blobs.  Here I don't know what to
> do here.  In one side, "understading" what is through the channel makes
> things way easier.  On the other hand, learning vmstate or similar is
> complicated.
>
> The other thing that we *think* is going to be needed is something like
> what we do with cpus. cpu models and flags.  Too many flags.
>
> Why?  Because once that they are at it, they want to be able to migrate
> from one card, lets say Mellanox^wNVidia Connection-CX5 to
> Connection-CX6, with not necessarily the same levels of firmawere.
> I.e. fun.
>
> > 2. Defining standard device state formats so VIRTIO implementations
> > can interoperate.
>
> I have no clue here.
>
> >> Of course, we could use a channel that completely bypasses qemu, but I
> >> think we=E2=80=99d like to avoid that if possible.  First, this would =
require
> >> adding functionality to virtiofsd to configure this channel.  Second,
> >> not storing the state in the central VM state means that migrating to
> >> file doesn=E2=80=99t work (well, we could migrate to a dedicated state=
 file,
> >> but...).
>
> How much is migration to file used in practice?
> I would like to have some information here.
> It could be necessary probably to be able to encrypt it.  And that is a
> (different) whole can of worms.
>
> >> Third, setting up such a channel after virtiofsd has sandboxed
> >> itself is hard.  I guess we should set up the migration channel before
> >> sandboxing, which constrains runtime configuration (basically this wou=
ld
> >> only allow us to set up a listening server, I believe).  Well, and
> >> finally, it isn=E2=80=99t a standard way, which won=E2=80=99t be great=
 if we=E2=80=99re planning
> >> to add a standard way anyway.
> >
> > Yes, live migration is hard enough. Duplicating it is probably not
> > going to make things better. It would still be necessary to support
> > saving to file as well as live migration.
>
> The other problem of NOT using migration infrastructure is firewalls.
> Live Migration only uses a single port.  It uses as many sockets as it
> needs with multifd, but use the same port to make life easier for
> libvirt/management app.
>
> Adding a new port for each vhost-user devices is not going to fly with
> admins.
>
> > There are two high-level approaches to the migration interface:
> > 1. The whitebox approach where the vhost-user back-end implements
> > device-specific messages to get/set migration state (e.g.
> > VIRTIO_FS_GET_DEVICE_STATE with a struct virtio_fs_device_state
> > containing the state of the FUSE session or multiple fine-grained
> > messages that extract pieces of state). The hypervisor is responsible
> > for the actual device state serialization.
> > 2. The blackbox approach where the vhost-user back-end implements the
> > device state serialization itself and just produces a blob of data.
>
> If your state is big enough, you are going to need a dirty bitmap or
> something similar.  Independently if you use white or black box
> approach.
>
> 100gigabit network ~ 10GB/s transfer.
> 1GB of state takes 1second downtime.
>
> And 100gigabit is not common now.  If you are stuck at 10gigabit, then
> you can only transfer 1GB in 1 second downtime.
>
> And we are getting to the point when we have multiple vhost-user/vfio
> devices, etc.
>
> Another problem that we are working with right now is bitmaps.  Just
> synchronizing them takes forever.  Take a 6TB guest:
>
> 6TB guest ~ 6TB/4KB ~ 1.600.000 pages, i.e. the size of the bitmap in bit=
s
> 1.600.000 entries /8 bits/byte - 200.000 bytes - 200MB each bitmap.
>
> If we end needing one for memory, and one for each vfio device, and
> another for each vhost device, that makes synchronization,
> ... interesting to say the less.  We could start using GPU's to
> synhronize bitmaps O:-)
>
> > An example of the whitebox approach is the existing vhost migration
> > interface - except that it doesn't really support device-specific
> > state, only generic virtqueue state.
> >
> > An example of the blackbox approach is the VFIO v2 migration interface:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/include/uapi/linux/vfio.h#n867
> >
> > Another aspect to consider is whether save/load is sufficient or if
> > the full iterative migration model needs to be exposed by the
> > interface. VFIO migration is an example of the full iterative model
> > while dbus-vmstate is just save/load. Devices with large amounts of
> > state need the full iterative model while simple devices just need
> > save/load.
>
> This is why I asked the size of vhost devices or whatever it is called
> this week O:-)
>
> > Regarding virtiofs, I think the device state is not
> > implementation-specific. Different implementations may have different
> > device states (e.g. in-memory file system implementation versus POSIX
> > file system-backed implementation), but the device state produced by
> > https://gitlab.com/virtio-fs/virtiofsd can probably also be loaded by
> > another implementation.
> >
> > My suggestion is blackbox migration with a full iterative interface.
> > The reason I like the blackbox approach is that a device's device
> > state is encapsulated in the device implementation and does not
> > require coordinating changes across other codebases (e.g. vDPA and
> > vhost kernel interface, vhost-user protocol, QEMU, etc). A blackbox
> > interface only needs to be defined and implemented once. After that,
> > device implementations can evolve without constant changes at various
> > layers.
> >
> > So basically, something like VFIO v2 migration but for vhost-user
> > (with an eye towards vDPA and VIRTIO support in the future).
> >
> > Should we schedule a call with Jason, Michael, Juan, David, etc to
> > discuss further? That way there's less chance of spending weeks
> > working on something only to be asked to change the approach later.
>
> We are discussing this with vfio.
>
> Basically what we have asked vfio to support is:
> - enter the interative stage to explain how much dirty memory do they
>   have.  We need this to calculate downtimes.  See my last PULL request
>   to see how I implemented it.
>   I generalized save_state_pending() for save_live devices to
>   state_pending_estimate() and state_pending_exact().
>   Only device that use different implementations for that values right
>   now is ram.  But I expect more to use it.
>   The idea is that with estimate, you give an estimate of how much you
>   think is pending, but without trying too hard.
>   ram returns how much dirty bits are on the ram dirty bitmap now.
>   with the _exact() one, you try very hard to give a "more" correct
>   size.  It is called when according to the estimates, we have few dirty
>   memory that we could enter last stage migration.
>
> - My next project is creating a new multifd thread for each vfio device
>   that requires it.  It does right now:
>   * we give a channel for the device, nothing else will use it
>   * a thread on the sending side/recovering side for the device
>   * we notify when we have ended the iterative stage, so they can start
>   * they can use the channel how they want, as it is on the ending
>     stage, they can transfer full speed.
>
> - They asked for a way to stop migration if we can not arrive to
>   downtime needed.  If with current speed, the maximum amount of dirty
>   memory that we can transmit is 512MB, and vfio tells us that they have
>   more than 512MB only by itself, we now this will never converge, so we
>   have to abort migration.  In the case of vfio devices, the device
>   state depends of guest configuration, and it is not going ta change
>   until guest change configuration.
>
> The last two bits are on my ToDo list for the near future, but not done.
>
> If we ended having lots of so big devices, we are going to have to think
> about downtimes in the order of dozens of seconds, not subsecond.
>
> So, if you are planning doing this in the near future, this is a good
> time to discuss this.

Can you explain the dirty bitmap requirement you mentioned further, given t=
hat:
1. vhost-user has dirty memory logging already, so DMA is covered.
2. An iterative interface allows the device to keep generating more
state, so does QEMU really need to know if parts of the previously
emitted binary blob have become dirty? It might allow QEMU to minimize
the size of the savevm file, but only if the overwritten data has the
same size.

Is a dirty bitmap for the device state necessary?

Stefan

