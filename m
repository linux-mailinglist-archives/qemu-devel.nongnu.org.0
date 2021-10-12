Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2042A52A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:14:22 +0200 (CEST)
Received: from localhost ([::1]:38102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maHbp-0006gU-9J
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maHX5-0001cP-K9
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:09:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maHX1-0003ia-Gt
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634044162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tzb/vRQDUatqunSm5Na27whA5LatkphNfghL8D3vr2Y=;
 b=UIfHzK0cJDSNMURSYv9DO86TNmV7Kq5yif0zGWM+cMjuxOIOYLKA1yBRBlPfLjGbmfjm/U
 tsYMrdY6ISsjLnOcrBnxEZjzxemPw0FJ78x29nilxmWOOjjaw1T0hOXCzYYS6wgTsEdF0Q
 pSo1DzVsCPtWChFdirw+cAIHZhWwRqc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-WdHJlrM3OpyDSU4Ro9njEQ-1; Tue, 12 Oct 2021 09:09:21 -0400
X-MC-Unique: WdHJlrM3OpyDSU4Ro9njEQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 z29-20020a05620a08dd00b0045fa369b83dso629985qkz.9
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 06:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tzb/vRQDUatqunSm5Na27whA5LatkphNfghL8D3vr2Y=;
 b=6QXSS73dyJ9yYenlvkbg/AvQFrbPujTxENSfUwwtVOB/8hnfQBXxaUClHv5mY+E7gG
 M4MqzSUdMk4fls3ApHIvm8ZdLe8jNbrfFzKYM/ZBszPieiy88hXTjnu0DaIfOxBYZiba
 K0KvGKYZSRqve+YyRgJFyPYRoybPhlAGVzYFo2rmX1ZJsVmrDaQBSGp5+8M4uuAva8wl
 mXXb2jgj0bAoCUkQ6nSsAxx8Ldq0vSaJKxTBcZL5Uopz0yERtB6l6jIiVvtVHnS7pMq5
 IbFgQo9ZVrlgyQmmO1g82DFrIf3KvMK8CffthkcvEBx1kWm5z3cQR6Pu2Z0nZdAHYZx6
 M1zw==
X-Gm-Message-State: AOAM532ymKbei5RMqHQ/hZdmLxIGN8N5pXAwtt75jYRgpsf4YpGoJjfj
 Vj3KV9Mwe2wlsnuhGTgsxYoCth/rEyauJihFW9w3SIvZ9ApQQAzEeUNpeSSVvd/s1ZR2m6zwKpo
 wBusrQOI9x+LzLj9jco9JlmZI6qHcyLI=
X-Received: by 2002:ac8:6112:: with SMTP id a18mr21847379qtm.401.1634044160869; 
 Tue, 12 Oct 2021 06:09:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhcs6g7ukHN5N7UJR3tR9+i9SrZQdPKhc3EOm2iyFNjhOE4ccIBU31SLk/LavT4lQmt3OPagFA6Bi777aBni0=
X-Received: by 2002:ac8:6112:: with SMTP id a18mr21847345qtm.401.1634044160599; 
 Tue, 12 Oct 2021 06:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-6-eperezma@redhat.com>
 <877deihlcd.fsf@dusky.pond.sub.org>
In-Reply-To: <877deihlcd.fsf@dusky.pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 12 Oct 2021 15:08:44 +0200
Message-ID: <CAJaqyWcz6+ce+T3GYPa7durLEwxN8OdwK=7KCYbcD1o03uj4Xw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 05/20] vhost: Add x-vhost-enable-shadow-vq qmp
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 7:18 AM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>
> > Command to enable shadow virtqueue.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  qapi/net.json          | 23 +++++++++++++++++++++++
> >  hw/virtio/vhost-vdpa.c |  8 ++++++++
> >  2 files changed, 31 insertions(+)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 7fab2e7cd8..a2c30fd455 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -79,6 +79,29 @@
> >  { 'command': 'netdev_del', 'data': {'id': 'str'},
> >    'allow-preconfig': true }
> >
> > +##
> > +# @x-vhost-enable-shadow-vq:
> > +#
> > +# Use vhost shadow virtqueue.
> > +#
> > +# @name: the device name of the VirtIO device
>
> Is this a qdev ID?  A network client name?
>

At this moment is the virtio device name, the one specified at the
call of "virtio_init". But this should change, maybe the qdev id or
something that can be provided by the command line fits better here.

> > +#
> > +# @enable: true to use the alternate shadow VQ notifications
> > +#
> > +# Returns: Always error, since SVQ is not implemented at the moment.
> > +#
> > +# Since: 6.2
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "x-vhost-enable-shadow-vq",
> > +#     "arguments": { "name": "virtio-net", "enable": false } }
> > +#
> > +##
> > +{ 'command': 'x-vhost-enable-shadow-vq',
> > +  'data': {'name': 'str', 'enable': 'bool'},
> > +  'if': 'defined(CONFIG_VHOST_KERNEL)' }
> > +
>
> Adding an command just for controlling a flag in some object is fine for
> quick experiments.  As a permanent interface, it's problematic: one
> command per flag would result in way too many commands.  Better: one
> command to control a set of related properties.
>
> I hesitate to suggest qom-set, because qom-set is not introspectable.
> Recurring complaint about QOM: poor integration with QAPI/QMP.
>

I will take it into account, but it's only temporary, that's why it
has the x- prefix. It's not like event_idx or other device feature
flags: Every vDPA device can potentially use SVQ datapath in a
transparent way, neither the vDPA device nor the guest know that qemu
supports it.

Ideally, this mode will kick in at the migration time automatically,
no need to perform more actions.

> Naming nitpick: since the command can both enable and disable, I'd call
> it -set-vq instead of -enable-vq.
>

Got it, I will replace it.

Thanks!

> >  ##
> >  # @NetLegacyNicOptions:
> >  #
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 4fa414feea..c63e311d7c 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -23,6 +23,8 @@
> >  #include "cpu.h"
> >  #include "trace.h"
> >  #include "qemu-common.h"
> > +#include "qapi/qapi-commands-net.h"
> > +#include "qapi/error.h"
> >
> >  static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *s=
ection)
> >  {
> > @@ -656,6 +658,12 @@ static bool  vhost_vdpa_force_iommu(struct vhost_d=
ev *dev)
> >      return true;
> >  }
> >
> > +
> > +void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error=
 **errp)
> > +{
> > +    error_setg(errp, "Shadow virtqueue still not implemented");
> > +}
> > +
> >  const VhostOps vdpa_ops =3D {
> >          .backend_type =3D VHOST_BACKEND_TYPE_VDPA,
> >          .vhost_backend_init =3D vhost_vdpa_init,
>


