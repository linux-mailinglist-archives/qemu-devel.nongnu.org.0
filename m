Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F152938E15F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 09:15:39 +0200 (CEST)
Received: from localhost ([::1]:39482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll4oM-0008Sy-5z
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 03:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ll4nD-0006ot-0k
 for qemu-devel@nongnu.org; Mon, 24 May 2021 03:14:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ll4n9-0006aE-FI
 for qemu-devel@nongnu.org; Mon, 24 May 2021 03:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621840459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oPgl03scXsvbYQqNinortM2UGx7py5GoAXRWoQK3erg=;
 b=ZazSwez5hI4PwcmJrWLmdIUfyOpynAzv3EoFgnIU38MxDQYfgLezuuy2vZFIDQ2bM8rAWV
 TNFv/iG3IukJFn/it/ZDnSgWWVPZKPZUN2Mf+pF+Itsn9x0kk55SiZSbW4kpn8ux568/UF
 8eT+0d1Fdk9y1Udu/MuWPpT/llTCLjU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-pCQPqlPkOzmnqEGHKkVojQ-1; Mon, 24 May 2021 03:14:16 -0400
X-MC-Unique: pCQPqlPkOzmnqEGHKkVojQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 i141-20020a379f930000b02902e94f6d938dso25841374qke.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 00:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oPgl03scXsvbYQqNinortM2UGx7py5GoAXRWoQK3erg=;
 b=RamEW010E+UTHceHmga1i/dDyJ+bCYmuSWJp+aVyN0Q4buRThVV7FK9E5yEJR1qFjh
 WCoEMiKfhLt/YEu5Md8p5j26tl/ye0UHxa5O66bCSIVfXrAcCMBcRliVFJsGJs6LgeFw
 jbZCNoQ16F/3d0uJpdok834wKmJd9vCbCNl7t+ThEJjvaaY1+GJEiE92ky6r3NtBr1ka
 uPlUqr7W6Rb9MQMUW204XS8we5wlqmBMexrU4N8noVROtHsSxk0e6kujbKE1rKcBNn58
 vWNW5URbrtUOnHdl5q4GPybwb6aAk/TDhhAeMV1BZUoGPiVGmg21pZSFMbtvZuiJQtUX
 RI2w==
X-Gm-Message-State: AOAM530RCmdGU5dBXw/OaCdhjrUHYYhjRjBEK6liLa8qgNNQhSr4MDxH
 9WwtXWw47LvSogscK9UCOhQXMlDsBtA5wVWQKppiHc/sBNrouYXjwDUrWgTxjHvj4nNoA1P1Fhl
 jwoJ6xUqolTO1sKw9JSYpI4/IQuf+W24=
X-Received: by 2002:a05:6214:a91:: with SMTP id
 ev17mr29111091qvb.9.1621840455554; 
 Mon, 24 May 2021 00:14:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBFCKDKe6j2ehoIJaHD8MCoyk9VyE7uN9ULz2Ad4/gOuaeqXC1Cl3O1wv6bn8ZuS40DMU+mvGY6dMoYwWEsr4=
X-Received: by 2002:a05:6214:a91:: with SMTP id
 ev17mr29111056qvb.9.1621840455309; 
 Mon, 24 May 2021 00:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-5-eperezma@redhat.com>
 <87y2c8pnx0.fsf@dusky.pond.sub.org>
In-Reply-To: <87y2c8pnx0.fsf@dusky.pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 24 May 2021 09:13:39 +0200
Message-ID: <CAJaqyWf9HZKb+Mtn_UNHZQj4EqzybPzwbLE7vcbCXJPK7wtXKw@mail.gmail.com>
Subject: Re: [RFC v3 04/29] vhost: Add x-vhost-enable-shadow-vq qmp
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-level <qemu-devel@nongnu.org>, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 9:05 AM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>
> > Command to enable shadow virtqueue looks like:
> >
> > { "execute": "x-vhost-enable-shadow-vq",
> >   "arguments": { "name": "dev0", "enable": true } }
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  qapi/net.json     | 22 ++++++++++++++++++++++
> >  hw/virtio/vhost.c |  6 ++++++
> >  2 files changed, 28 insertions(+)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index c31748c87f..660feafdd2 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -77,6 +77,28 @@
> >  ##
> >  { 'command': 'netdev_del', 'data': {'id': 'str'} }
> >
> > +##
> > +# @x-vhost-enable-shadow-vq:
> > +#
> > +# Use vhost shadow virtqueue.
> > +#
> > +# @name: the device name of the VirtIO device
> > +#
> > +# @enable: true to use he alternate shadow VQ notification path
>
> Typo "he".
>

Thanks, I will fix it!

> What's a "notification path", and why should I care?
>
> Maybe
>
>    # @enable: Enable alternate shadow VQ notification
>

Your description is more accurate at some point of the series, I will fix i=
t.

> > +#
> > +# Returns: Error if failure, or 'no error' for success. Not found if v=
host is not enabled.
>
> This is confusing.  What do you mean by "Not found"?
>
> If you mean DeviceNotFound:
>
> 1. Not actually true: qmp_x_vhost_enable_shadow_vq() always fails with
> GenericError.  Perhaps later patches will change that.
>

Right, I left the documentation in an intermediate state. At this
point it will always return failure, and in future ones it depends on
some conditions as you may have seen.

If I carry the QMP command to future series, I will update the doc
accordly to every commit.

> 2. Do you really need to distinguish "vhost is not enabled" from other
> errors?
>

SVQ cannot work if the device backend is not vhost, like qemu VirtIO
dev. What I meant is that "qemu will only look for its name in the set
of vhost devices, so you will have a device not found if the device is
not a vhost one", which may not be 100% clear at first glance. Maybe
this wording is better?

> > +#
> > +# Since: 6.1
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "x-vhost-enable-shadow-vq", "arguments": { "name": "=
virtio-net", "enable": false } }
>
> Please break the long line, e.g. like this:
>
>    # -> { "execute": "x-vhost-enable-shadow-vq",
>    #      "arguments": { "name": "virtio-net", "enable": false } }
>
> We normally show output in examples, too.
>

Ok, I will fix both issues.

Thanks!

> > +#
> > +##
> > +{ 'command': 'x-vhost-enable-shadow-vq',
> > +  'data': {'name': 'str', 'enable': 'bool'},
> > +  'if': 'defined(CONFIG_VHOST_KERNEL)' }
> > +
> >  ##
> >  # @NetLegacyNicOptions:
> >  #
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 40f9f64ebd..c4c1f80661 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -15,6 +15,7 @@
> >
> >  #include "qemu/osdep.h"
> >  #include "qapi/error.h"
> > +#include "qapi/qapi-commands-net.h"
> >  #include "hw/virtio/vhost.h"
> >  #include "qemu/atomic.h"
> >  #include "qemu/range.h"
> > @@ -1831,3 +1832,8 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
> >
> >      return -1;
> >  }
> > +
> > +void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error=
 **errp)
> > +{
> > +    error_setg(errp, "Shadow virtqueue still not implemented");
> > +}
>


