Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCA3A16A4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:07:50 +0200 (CEST)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqys0-0002lY-PH
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lqyrB-000276-OQ
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lqyr7-0004Jh-Ux
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623247612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5G4SJzVeJcusgfpgZEPj4fyLUyx7sxKr21sHMKFlp4=;
 b=i28ByBypeEwR5n2p6RXDVu9qnA9k9ICOE5qFBlagbuntdkLCA+qmLWy/e+ckbJdTOmN5IX
 kyOwrHxR8X6lU70VYBGZEXAZYiQ3hke0Qz7zV3XHc57B93vW5ZMRfM17I9fnvtGRmt6ADn
 soTrS4MYLFU9/UGLb1Ur5NhaHiAP0hE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-uJrt6tXUOU6aP0Q51HnOLg-1; Wed, 09 Jun 2021 10:06:50 -0400
X-MC-Unique: uJrt6tXUOU6aP0Q51HnOLg-1
Received: by mail-qv1-f70.google.com with SMTP id
 h10-20020a0cab0a0000b029020282c64ecfso18058014qvb.19
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 07:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s5G4SJzVeJcusgfpgZEPj4fyLUyx7sxKr21sHMKFlp4=;
 b=C/pvM3c2ox+xJ9tAhjIpxXAk7Y8vOXafYI3dO5rIPyvtFsfUnQGeNwVAMZBUk83TgJ
 GKa7Ou0SGWi63XhS/7CYYTJ3orEpvKuuG04CtdBTJuF5Fng+jmNfGyu7xq3Gmh0gaHzC
 RN8OmplIjKGoPDp9Bz0Cq5eWbIcKPwSxQ2OEHfFaQcbo+EC0UrUe2YYbkO9WChOxWf22
 LkaWiX6/qqRoaUiIv3v1zW5YjDn4NRi2r3ECrrshZRXwKwGzdEjQCnrVsKMSvs/Bz4/r
 D07TEJYpdCiy7WxOKaSITr3G0a64upQo/WNoptS7/T6YHMQ71/QZtVVXaKkBLSnfHd5C
 7huQ==
X-Gm-Message-State: AOAM531YyyEI8sWRP5FyL7sptU3DOgMu7s4+IwRuVb8vQOL5EBx02Ocb
 IlpPXze7VXCYaaAjTowzKVrmXvY/d6CPLxF4uo/Mf5+I7WzxyaGKOG4acnCoidbxSvbYafbHdu6
 tcREVhsQcK2rpL4cQJsTEnIUvM5Q0fhU=
X-Received: by 2002:a05:6214:10e9:: with SMTP id
 q9mr119448qvt.45.1623247609736; 
 Wed, 09 Jun 2021 07:06:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrxIsi5YxViFEzrVp9MjwisKiFv9TZG2CIo0nqS4CfnoHbMR3f2AntgVgpMVBYtTbfO+vbuJERfKVgyzHBZNw=
X-Received: by 2002:a05:6214:10e9:: with SMTP id
 q9mr119419qvt.45.1623247609473; 
 Wed, 09 Jun 2021 07:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-5-eperezma@redhat.com>
 <87y2c8pnx0.fsf@dusky.pond.sub.org>
 <CAJaqyWf9HZKb+Mtn_UNHZQj4EqzybPzwbLE7vcbCXJPK7wtXKw@mail.gmail.com>
 <87k0n4xwo4.fsf@dusky.pond.sub.org>
 <CAJaqyWcmpZxdSv9SKi0yFY5UNsdMKzRGFSW_4pUZicqCP7Gkdg@mail.gmail.com>
 <87wnr3p8fn.fsf@dusky.pond.sub.org>
In-Reply-To: <87wnr3p8fn.fsf@dusky.pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 9 Jun 2021 16:06:12 +0200
Message-ID: <CAJaqyWcwAAAXGZD5huHjYUvrDQyEQgmnv4iTCzY4=qT9zWMgFg@mail.gmail.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 9, 2021 at 1:46 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Eugenio Perez Martin <eperezma@redhat.com> writes:
>
> > On Tue, Jun 8, 2021 at 4:23 PM Markus Armbruster <armbru@redhat.com> wr=
ote:
> >>
> >> Eugenio Perez Martin <eperezma@redhat.com> writes:
> >>
> >> > On Fri, May 21, 2021 at 9:05 AM Markus Armbruster <armbru@redhat.com=
> wrote:
> >> >>
> >> >> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
> >> >>
> >> >> > Command to enable shadow virtqueue looks like:
> >> >> >
> >> >> > { "execute": "x-vhost-enable-shadow-vq",
> >> >> >   "arguments": { "name": "dev0", "enable": true } }
> >> >> >
> >> >> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> >> > ---
> >> >> >  qapi/net.json     | 22 ++++++++++++++++++++++
> >> >> >  hw/virtio/vhost.c |  6 ++++++
> >> >> >  2 files changed, 28 insertions(+)
> >> >> >
> >> >> > diff --git a/qapi/net.json b/qapi/net.json
> >> >> > index c31748c87f..660feafdd2 100644
> >> >> > --- a/qapi/net.json
> >> >> > +++ b/qapi/net.json
> >> >> > @@ -77,6 +77,28 @@
> >> >> >  ##
> >> >> >  { 'command': 'netdev_del', 'data': {'id': 'str'} }
> >> >> >
> >> >> > +##
> >> >> > +# @x-vhost-enable-shadow-vq:
> >> >> > +#
> >> >> > +# Use vhost shadow virtqueue.
> >> >> > +#
> >> >> > +# @name: the device name of the VirtIO device
> >> >> > +#
> >> >> > +# @enable: true to use he alternate shadow VQ notification path
> >>
> >> [...]
> >>
> >> >> > +#
> >> >> > +# Returns: Error if failure, or 'no error' for success. Not foun=
d if vhost is not enabled.
> >> >>
> >> >> This is confusing.  What do you mean by "Not found"?
> >> >>
> >> >> If you mean DeviceNotFound:
> >> >>
> >> >> 1. Not actually true: qmp_x_vhost_enable_shadow_vq() always fails w=
ith
> >> >> GenericError.  Perhaps later patches will change that.
> >>
> >> [...]
> >>
> >> >> 2. Do you really need to distinguish "vhost is not enabled" from ot=
her
> >> >> errors?
> >> >>
> >> >
> >> > SVQ cannot work if the device backend is not vhost, like qemu VirtIO
> >> > dev. What I meant is that "qemu will only look for its name in the s=
et
> >> > of vhost devices, so you will have a device not found if the device =
is
> >> > not a vhost one", which may not be 100% clear at first glance. Maybe
> >> > this wording is better?
> >>
> >> We might be talking past each other.  Let me try again :)
> >>
> >> The following question is *not* about the doc comment, it's about the
> >> *code*: what practical problem is solved by using DeviceNotFound inste=
ad
> >> of GenericError for some errors?
> >>
> >
> > Sorry, I'm not sure if I follow you :). At risk of being circular in
> > this topic, the only use case I can think is to actually tell the
> > difference between "the device does not exists, or is not a vhost
> > device" and "the device does not support SVQ because X", where X can
> > be "it uses a packed ring", "it uses event idx", ...
> >
> > I can only think of one practical use case, "if you see this error,
> > you probably forgot to set vhost=3Don in the command line, or something
> > is forbidding this device to be a vhost one". Having said that, I'm
> > totally fine with using GenericError always, but I see the more
> > fine-grained the error the better. What would be the advantage of also
> > using GenericError here?
>
> In the initial design of the Error API, every error had its own distinct
> class.  This provided for fine-grained errors.
>
> Adding a new error was bothersome: you had to define a new class, in
> qerror.h.  Recompile the world.  Conflict magnet.  Constant temptation
> to reuse an existing error even when its error message is suboptimal,
> and the reuse of the class for another error conflates errors.
>
> After a bit under three years, we had 70 classes, used in almost 400
> places.  Management applications actually cared for just six classes.
>
> Bad error messages and development friction had turned out to be a real
> problem.  Conflating errors pretty much not.
>
> We concluded that providing for fine-grained errors when next to nothing
> uses them was not worth the pain.  So we ditched them:
>
>     https://lists.nongnu.org/archive/html/qemu-devel/2012-08/msg01958.htm=
l
>     Commit ac839ccd8c3..adb2072ed0f
>
> Since them, we recommend to use GenericError unless there is a
> compelling reason not to.  "Something might care someday" doesn't
> qualify.
>
> Learning by doing the wrong thing is painful and expensive, but at least
> the lessons tends to stick ;)
>
> Today, we have more than 4000 callers of error_setg(), and less than 40
> of error_set().
>

So let's do it with GenericError then :). Thanks for pointing it out,
it will be fixed in the next revision!

> > Just to be sure that we are on the same page, I think this is better
> > seen from PATCH 07/39: vhost: Route guest->host notification through
> > shadow virtqueue.
> >
> >> [...]
> >>
>


