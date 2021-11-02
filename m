Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F07C442762
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:02:06 +0100 (CET)
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhno5-0002ow-NZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhnlh-0001eo-P3
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhnlf-0004s7-Rb
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635836373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPw2j4r3q2s9nQkCAm6RmPuNcGo4hGBgcUuFF0ea/Xk=;
 b=OCa+FBku1l8+n5x3jTd5Q6Ofbg/1Mz0Tuw8iQAED0gQqOvTNZ+5Ekb5eV0LOMAO/K337iU
 Jy+pZH38dVOaL5s0Uag8hLt26sLU7XH1y0RRregHcNflTH3ELXyCiz8hain3w/ftX1dRhz
 +aF8+uM/NFtn2cS+SCsYMxDaTpNlj2o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-kD8Cx5zQNk27b0JQxLcbXA-1; Tue, 02 Nov 2021 02:59:32 -0400
X-MC-Unique: kD8Cx5zQNk27b0JQxLcbXA-1
Received: by mail-qv1-f72.google.com with SMTP id
 o15-20020a0cc38f000000b0038455e36f89so18643531qvi.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 23:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BPw2j4r3q2s9nQkCAm6RmPuNcGo4hGBgcUuFF0ea/Xk=;
 b=pMvqwt/M6SW/a2VIU3ZsPt4HLREurxRWPYfql9NEeUWc+tGi3mD0sSSJLobpMHc1co
 IixyDc8VG/Ef/3f9Eskcj4twF/ksvIe+mZI7j/aS6JTSDmWbytS50o2rIY8LaMxEFxrU
 weqB2+aaBcXkbodJk/+rqgCi+Eh0WKoVf9eVBSvgN6kHME+vXiDFeBpGRNTW2ms1n16O
 yiNod8xxP7IjgmlSgAGLfRwMY2MBNSlkW96tj1a9QUAygcHg9pgpQn6iDaqfTc64xajU
 b7E9Ch0odZI35pJhZkok8BbjsaRveTydS4A4vYIEKC4BMZSv2DgjMXNVStOxpwPLKlfH
 J5dQ==
X-Gm-Message-State: AOAM533khfQN+rtUy4WUGyLkdS+jasJ7Z7FoJD+UdMchisO007TgpDuX
 Ghu+VqXctVTC0oaGF9KCmWELYv6/I2e7hTX2Rin7BylnuwBBIgo7kfr9RDBRZhs/JCy1JkL4xLQ
 h8QlwdHFVDsrNkvtG5fJ+6GznuHuVfD4=
X-Received: by 2002:a05:6214:226e:: with SMTP id
 gs14mr33545388qvb.4.1635836371626; 
 Mon, 01 Nov 2021 23:59:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbLoU0tdI1n5ho/uRS/ffRKvFE+5qXOpbQou/nJEpxVMduA/GVjCxZg2zRtTDxxZSeUC+OaQ4yWLdKZsSCyrI=
X-Received: by 2002:a05:6214:226e:: with SMTP id
 gs14mr33545376qvb.4.1635836371478; 
 Mon, 01 Nov 2021 23:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211029141608.1728855-1-eperezma@redhat.com>
 <CACGkMEss8Xq8WYUkDkLaYx-XBW6GADDAjH1mwmpBdxKc2wsRAQ@mail.gmail.com>
 <CAJaqyWcsbtOoLGkCW6J_9M8qR1-yvbQmWq1rU0y+8Y=BhPeRWw@mail.gmail.com>
 <CACGkMEv9OR1yTVWhy8bqxdH8s6+f_6KY=Avw2z3soeBudR+Ocw@mail.gmail.com>
In-Reply-To: <CACGkMEv9OR1yTVWhy8bqxdH8s6+f_6KY=Avw2z3soeBudR+Ocw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Nov 2021 07:58:55 +0100
Message-ID: <CAJaqyWeV-UGG8ddwmrYeq4J47V_KSfkPEni96sJOzpEFe5v_FQ@mail.gmail.com>
Subject: Re: [PATCH] vhost: Fix last queue index of devices with no cvq
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 5:09 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Mon, Nov 1, 2021 at 4:59 PM Eugenio Perez Martin <eperezma@redhat.com>=
 wrote:
> >
> > On Mon, Nov 1, 2021 at 4:34 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Oct 29, 2021 at 10:16 PM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
> > > >
> > > > The -1 assumes that all devices with no cvq have an spare vq alloca=
ted
> > > > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not b=
e the
> > > > case, and the device may have a pair number of queues.
> > > >
> > > > To fix this, just resort to the lower even number of queues.
> > > >
> > > > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for th=
e virtio device")
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  hw/net/vhost_net.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > > index 0d888f29a6..edf56a597f 100644
> > > > --- a/hw/net/vhost_net.c
> > > > +++ b/hw/net/vhost_net.c
> > > > @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClien=
tState *ncs,
> > > >      NetClientState *peer;
> > > >
> > > >      if (!cvq) {
> > > > -        last_index -=3D 1;
> > > > +        last_index &=3D ~1ULL;
> > > >      }
> > >
> > > The math here looks correct but we need to fix vhost_vdpa_dev_start()=
 instead?
> > >
> > > if (dev->vq_index + dev->nvqs - 1 !=3D dev->last_index) {
> > > ...
> > > }
> > >
> >
> > If we just do that, devices that offer an odd number of queues but do
> > not offer ctrl vq would never enable the last vq pair, isn't it?
>
> For vq pair, you assume that it's a networking device, so the device
> you described here violates the spec.
>
> >
> > Also, I would say that the right place for the solution of this
> > problem should not be virtio/vhost-vdpa: This is highly dependent on
> > having cvq, and this implies a knowledge about the use of each
> > virtqueue. Another kind of device could have an odd number of
> > virtqueues naturally, and that (-1) would not work for them, isn't it?
>
> It actually depends on how multiqueue is modeled for each specific
> type of device. They need to initialize the vq_index and nvqs
> correctly:
>
> E.g if we had a device with 3 queues, we could model it with the followin=
g:
>
> vhost_dev 1, vq_index =3D 0, nvqs =3D 2
> vhost_dev 2, vq_index =3D 2, nvqs =3D 1
>
> In this case the last_index should be initialized to 2, then we know
> all the vhost_dev is initialized and we can start the hardware.
>

Right, but in that case, cvq =3D=3D true, and we never enter the
conditional if (!cvq).

If cvq is false at that moment, your vhost_dev 2 *must* not exist and
the last index will be even, so we must not subtract 1 to last_index.
The subtraction is the cause the device never starts.

Given all of the above, I think we can skip the conditional entirely.

Thanks!

> Thanks
>
> >
> > Thanks!
> >
> > > Thanks
> > >
> > > >
> > > >      if (!k->set_guest_notifiers) {
> > > > --
> > > > 2.27.0
> > > >
> > >
> >
>


