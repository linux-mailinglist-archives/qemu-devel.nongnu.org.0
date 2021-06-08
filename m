Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFBC39FAA6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:28:08 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdeA-0004Rt-N7
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lqdd7-0003m8-AL
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lqdd3-0004F9-UK
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623166016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9/CMdy6fcAeEx0Je5fTN6BY2zqhJGrDE3u0qrdpmJxU=;
 b=XwoGeS6DbIDoqf2j0eXxPFXGi3MglYikvagfzyEKjRKxfZbJES9gDTMY0nGgsO3odKFIWU
 mis9hbTuUxl0riTj4sD9ObOkivoi9hGrVGXj7bqPAFzHAH/2+nzT72f5y/31id1NUlxpoi
 496JTKL+fIVjaJGgGU8+DDCTO8c3mfg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-rIes8FcXM4mkKIiA1ZI0gQ-1; Tue, 08 Jun 2021 11:26:54 -0400
X-MC-Unique: rIes8FcXM4mkKIiA1ZI0gQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 bl11-20020ad4564b0000b029021d1fdffd5aso15768203qvb.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 08:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9/CMdy6fcAeEx0Je5fTN6BY2zqhJGrDE3u0qrdpmJxU=;
 b=iI5KQvj3ltnLzzOhJ2eDvnaJQG3VO9QnUd4Pbk/9wDLktQMPcZTMEooTh2yYMfOJw3
 YQggsbxzYCBeHzmdoWMtkBo8IdQ0G9JYFCrskjLTiiaxSu0T38YMc6+jkBFrs2WY0nql
 ZH2WHCNY5LWJMXFO8HKNpJExXBiXmAk0v8VydMmkyWF9jEx4yDKn6TYYhsZYqxzQ99D5
 Bg6dFK1uKyaXI5IJ2ocnePctUDlAnwUZLSPGYX3UCnRIJT1ZY01btV6ADYlUV3UZ9xWN
 yH2aLrYGU/7jEUwGTyCL6ayKHGozKzskGVu0kJuBP5JoA4x1JvY9kHcsbsBuMKLK0Fnc
 yzfg==
X-Gm-Message-State: AOAM530G3pY2cR6eYytoWIJjCzdRbiHCLVlBLb44Qr3dAmnGiZRiJ8By
 CMCy+hGYBAVMfD1YUEO/ywC7oQaqIoDAl5ZB/UAZ/q0+AUwvs0eIzdBV2fxR/vcabrNn1j/SNY9
 SWw5dXY6bepmU5h0O70NIJMf4jbHODnA=
X-Received: by 2002:ad4:4e47:: with SMTP id eb7mr567252qvb.40.1623166014047;
 Tue, 08 Jun 2021 08:26:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmzGoQhhFIFLUKZoRpLGw8lsM3yS9Kzal+6TwHpLB4Rl1Xn9UloVHaE0YkxnPq8aErK2jCpKxFHB64TfztzAE=
X-Received: by 2002:ad4:4e47:: with SMTP id eb7mr567225qvb.40.1623166013807;
 Tue, 08 Jun 2021 08:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-5-eperezma@redhat.com>
 <87y2c8pnx0.fsf@dusky.pond.sub.org>
 <CAJaqyWf9HZKb+Mtn_UNHZQj4EqzybPzwbLE7vcbCXJPK7wtXKw@mail.gmail.com>
 <87k0n4xwo4.fsf@dusky.pond.sub.org>
In-Reply-To: <87k0n4xwo4.fsf@dusky.pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 8 Jun 2021 17:26:18 +0200
Message-ID: <CAJaqyWcmpZxdSv9SKi0yFY5UNsdMKzRGFSW_4pUZicqCP7Gkdg@mail.gmail.com>
Subject: Re: [RFC v3 04/29] vhost: Add x-vhost-enable-shadow-vq qmp
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-level <qemu-devel@nongnu.org>, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 4:23 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Eugenio Perez Martin <eperezma@redhat.com> writes:
>
> > On Fri, May 21, 2021 at 9:05 AM Markus Armbruster <armbru@redhat.com> w=
rote:
> >>
> >> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
> >>
> >> > Command to enable shadow virtqueue looks like:
> >> >
> >> > { "execute": "x-vhost-enable-shadow-vq",
> >> >   "arguments": { "name": "dev0", "enable": true } }
> >> >
> >> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> > ---
> >> >  qapi/net.json     | 22 ++++++++++++++++++++++
> >> >  hw/virtio/vhost.c |  6 ++++++
> >> >  2 files changed, 28 insertions(+)
> >> >
> >> > diff --git a/qapi/net.json b/qapi/net.json
> >> > index c31748c87f..660feafdd2 100644
> >> > --- a/qapi/net.json
> >> > +++ b/qapi/net.json
> >> > @@ -77,6 +77,28 @@
> >> >  ##
> >> >  { 'command': 'netdev_del', 'data': {'id': 'str'} }
> >> >
> >> > +##
> >> > +# @x-vhost-enable-shadow-vq:
> >> > +#
> >> > +# Use vhost shadow virtqueue.
> >> > +#
> >> > +# @name: the device name of the VirtIO device
> >> > +#
> >> > +# @enable: true to use he alternate shadow VQ notification path
>
> [...]
>
> >> > +#
> >> > +# Returns: Error if failure, or 'no error' for success. Not found i=
f vhost is not enabled.
> >>
> >> This is confusing.  What do you mean by "Not found"?
> >>
> >> If you mean DeviceNotFound:
> >>
> >> 1. Not actually true: qmp_x_vhost_enable_shadow_vq() always fails with
> >> GenericError.  Perhaps later patches will change that.
>
> [...]
>
> >> 2. Do you really need to distinguish "vhost is not enabled" from other
> >> errors?
> >>
> >
> > SVQ cannot work if the device backend is not vhost, like qemu VirtIO
> > dev. What I meant is that "qemu will only look for its name in the set
> > of vhost devices, so you will have a device not found if the device is
> > not a vhost one", which may not be 100% clear at first glance. Maybe
> > this wording is better?
>
> We might be talking past each other.  Let me try again :)
>
> The following question is *not* about the doc comment, it's about the
> *code*: what practical problem is solved by using DeviceNotFound instead
> of GenericError for some errors?
>

Sorry, I'm not sure if I follow you :). At risk of being circular in
this topic, the only use case I can think is to actually tell the
difference between "the device does not exists, or is not a vhost
device" and "the device does not support SVQ because X", where X can
be "it uses a packed ring", "it uses event idx", ...

I can only think of one practical use case, "if you see this error,
you probably forgot to set vhost=3Don in the command line, or something
is forbidding this device to be a vhost one". Having said that, I'm
totally fine with using GenericError always, but I see the more
fine-grained the error the better. What would be the advantage of also
using GenericError here?

Just to be sure that we are on the same page, I think this is better
seen from PATCH 07/39: vhost: Route guest->host notification through
shadow virtqueue.

> [...]
>


