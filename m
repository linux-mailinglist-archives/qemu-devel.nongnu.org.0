Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451B30EF29
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:03:55 +0100 (CET)
Received: from localhost ([::1]:35120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7aYM-0006td-G2
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l7aWY-0006L5-Ut
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:02:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l7aWO-0007sy-2J
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612429309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxc0/kovsY4vWTYVywERklM8nWRuDxjweSITYwAj1LM=;
 b=aKzlz/Be9ByzoiyxUbkk0gP3BvADMJfZ2aNbVNCBUn/+uvUF1KgYbFIjGngAq/L0NJs8wo
 oCJ+H7chMm2Y1g7Mfgi7zgTIdz3X5G2WcrRvESMeikctqDUPZK8qFyVJQvZehn+XiCoWUU
 YVRmEHdhvPXjYiqgw6RVxkCic+2Vu6Q=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-SzOwbgHoOPK_gGiOWxgz5A-1; Thu, 04 Feb 2021 04:01:47 -0500
X-MC-Unique: SzOwbgHoOPK_gGiOWxgz5A-1
Received: by mail-qk1-f200.google.com with SMTP id d194so2051024qke.3
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 01:01:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rxc0/kovsY4vWTYVywERklM8nWRuDxjweSITYwAj1LM=;
 b=gpSlIvWXXzdSqC0EUx7weZ23zfdM8X/ZgMydqxU3nS49o9argiTiqevMr7P56Bj2FM
 W6P6Ioar9T5qpSeGFrpMX6o1hVOp65hKU4/z/Ry+Qb+VmuVoApftV+IXtUgviWPn5CbM
 0j6TZOaI7VZarLsJ+OJo2VIv8qbJbo+Cq9RxMGqihgIucYS51wfJsZOSBy988kpZnCWE
 7q5lRJ56VUOAumR80bBU742JVkUiNcVaxM7sT0xUI5dD4pYWCqpiXAUcXt68KdOa7XJJ
 elWbyMMB+28K65ia27BRpsOrwDouMcBNZOOtf6MW3Lp+kTmf6IfQwFqjhrH7cKyBZFqt
 yvtg==
X-Gm-Message-State: AOAM531sl8pC+UfVblywF1zYzFPvR6IlTIzsYmrmqe4/Hzrq+0f0ILSW
 iyNynEg4C9wUYkr8wnzToV7n53cCR22hEM9qjuCZL7OAQmx5t/tYGr9nqzTtj3Nr4gFtfsZzwEK
 ZYpniC+9K4Xs0w2mUPI6siOJ4UOnbzlo=
X-Received: by 2002:a0c:c488:: with SMTP id u8mr6457648qvi.9.1612429306003;
 Thu, 04 Feb 2021 01:01:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9Eb/4wy5b1cAE1BEURN1kTgYFYUklCgTnul3T89vrOBmpF4uVMbGcLjdi9fupTSIH+7kmvZNzlYWXgosqeow=
X-Received: by 2002:a0c:c488:: with SMTP id u8mr6457624qvi.9.1612429305790;
 Thu, 04 Feb 2021 01:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-9-eperezma@redhat.com>
 <4ab76cf6-401b-97de-6154-2e025cb1ebc6@redhat.com>
In-Reply-To: <4ab76cf6-401b-97de-6154-2e025cb1ebc6@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Feb 2021 10:01:09 +0100
Message-ID: <CAJaqyWc5_nmniTDsjCCpJpERvMq5RsB0xebeNuP8=oVnHQkovg@mail.gmail.com>
Subject: Re: [RFC 08/10] vhost: Add x-vhost-enable-shadow-vq qmp
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 2, 2021 at 4:38 PM Eric Blake <eblake@redhat.com> wrote:
>
> On 1/29/21 2:54 PM, Eugenio P=C3=A9rez wrote:
> > Command to enable shadow virtqueue looks like:
> >
> > { "execute": "x-vhost-enable-shadow-vq", "arguments": { "name": "dev0",=
 "enable": true } }
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  qapi/net.json     | 23 +++++++++++++++++++++++
> >  hw/virtio/vhost.c |  6 ++++++
> >  2 files changed, 29 insertions(+)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index c31748c87f..6170d69798 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -77,6 +77,29 @@
> >  ##
> >  { 'command': 'netdev_del', 'data': {'id': 'str'} }
> >
> > +##
> > +# @x-vhost-enable-shadow-vq:
>
> This spelling is the preferred form...[1]
>
> > +#
> > +# Use vhost shadow virtqueue.
> > +#
> > +# @name: the device name of the virtual network adapter
> > +#
> > +# @enable: true to use he alternate shadow VQ notification path
> > +#
> > +# Returns: Error if failure, or 'no error' for success
>
> This line...[2]
>
> > +#
> > +# Since: 5.3
>
> The next release is 6.0, not 5.3.
>
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "x-vhost_enable_shadow_vq", "arguments": {"enable": =
true} }
>
> [1]...but doesn't match the example.
>
> > +# <- { "return": { "enabled" : true } }
>
> [2]...doesn't match this comment.  I'd just drop the line, since there
> is no explicit return listed.
>

Hi Eric.

Thanks for your comments, they will be addressed in the next revision.

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
> > index 040f68ff2e..42836e45f3 100644
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
> > @@ -1841,3 +1842,8 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
> >
> >      return -1;
> >  }
> > +
> > +void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Error=
 **errp)
> > +{
> > +    error_setg(errp, "Shadow virtqueue still not implemented.");
>
> error_setg() should not be passed a trailing '.'.
>

Oh, sorry I missed the comment in the error_setg doc.

I copy&pasted from the call to error_setg "Migration disabled: vhost
lacks VHOST_F_LOG_ALL feature.". I'm wondering if it's a good moment
to delete the dot there too, since other tools could depend on parsing
it.

Thanks!

> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>


