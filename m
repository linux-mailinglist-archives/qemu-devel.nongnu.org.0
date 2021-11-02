Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D0E442784
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:06:37 +0100 (CET)
Received: from localhost ([::1]:53216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhnsR-0004a3-OX
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhnqg-0003sN-L1
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:04:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhnqc-0001FW-3M
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635836680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lwb/CyKGjMpw1AcUmjQHhYoalWVs2fec3YfmpmYJt8w=;
 b=TDgHviFU8CQFc2UEq5YLquMAzEu2R8tDByE4YxYSNZX26KAypXfOFNK8I4pJyXMqz+bN76
 z8F51KJ/k9foJU94zZ6WPUXUvutC5uY29Rr3zn+4gTVhpjN4kve8D3re45p1ggoKU9Xlgt
 lD2STT+0PVHyBT3sNtOgsIGT5zF08Js=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-qViM89wKPEOKD8wbC369CQ-1; Tue, 02 Nov 2021 03:04:39 -0400
X-MC-Unique: qViM89wKPEOKD8wbC369CQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 73-20020a2e054c000000b0021668f13ce2so1184789ljf.17
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 00:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lwb/CyKGjMpw1AcUmjQHhYoalWVs2fec3YfmpmYJt8w=;
 b=vG/gmUBS32qoG2tfu/SK9egd4F19HCITKrcvBMoywcXoqBOB+EO8oqUcYIVJ0UkTJJ
 gvCB9udjhntidYfPN9aYZTAc7ZPB1pU/YgPUIzDEB7ezqbYFDJ7vOp3cDntD54T9zfcW
 +cD7SFaVZfvl/m3FclYQwvFOyIXTahmqs67SK4PsE8ZQrDB2DyFptfjzsIes7P8dlaZ6
 6SQk97aBHqDj+ERFnpP+S4sCwuO9ySu5pe0mMy37WpRpS00KkurVjOvh5oxnG3d9KvhT
 f3iVlZJwUaM2gHjKM/8GecsHu5WM3b6ofHoh+ZlybS+SZGCORCzz8IjSdXNXjcZNlVlZ
 +ZHQ==
X-Gm-Message-State: AOAM5326Cjk9od/TefocHWURiUJkeHltNBl0BtEuSu+cWP3MufX7K7TE
 NE7sG9/Hufx7+MpvepYjrnLHKbVrCCbH1sYKX9jg0iOZQr+94ezO5nxbogAPjhQiF9iWrhQ2w7U
 AmhF6gNWs2bFX3QArpYx+d0qUCvS5TzY=
X-Received: by 2002:a2e:5344:: with SMTP id t4mr36656016ljd.362.1635836677773; 
 Tue, 02 Nov 2021 00:04:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX2v8seSnQatagGgmURzzkXiZ3QDOj3w1vTa2wfC/2r3JEciKE2j3pF9lPORhwpoRz7jokT3ckQyfJd8XzoH0=
X-Received: by 2002:a2e:5344:: with SMTP id t4mr36655982ljd.362.1635836677520; 
 Tue, 02 Nov 2021 00:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211029141608.1728855-1-eperezma@redhat.com>
 <CACGkMEss8Xq8WYUkDkLaYx-XBW6GADDAjH1mwmpBdxKc2wsRAQ@mail.gmail.com>
 <CAJaqyWcsbtOoLGkCW6J_9M8qR1-yvbQmWq1rU0y+8Y=BhPeRWw@mail.gmail.com>
 <CACGkMEv9OR1yTVWhy8bqxdH8s6+f_6KY=Avw2z3soeBudR+Ocw@mail.gmail.com>
 <CAJaqyWeV-UGG8ddwmrYeq4J47V_KSfkPEni96sJOzpEFe5v_FQ@mail.gmail.com>
In-Reply-To: <CAJaqyWeV-UGG8ddwmrYeq4J47V_KSfkPEni96sJOzpEFe5v_FQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 2 Nov 2021 15:04:26 +0800
Message-ID: <CACGkMEsxW_ZKdF7JGvvCEspNMXeSUeovZM1DooR2RTsmESw5jw@mail.gmail.com>
Subject: Re: [PATCH] vhost: Fix last queue index of devices with no cvq
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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

On Tue, Nov 2, 2021 at 2:59 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Tue, Nov 2, 2021 at 5:09 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Mon, Nov 1, 2021 at 4:59 PM Eugenio Perez Martin <eperezma@redhat.co=
m> wrote:
> > >
> > > On Mon, Nov 1, 2021 at 4:34 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > > On Fri, Oct 29, 2021 at 10:16 PM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
> > > > >
> > > > > The -1 assumes that all devices with no cvq have an spare vq allo=
cated
> > > > > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not=
 be the
> > > > > case, and the device may have a pair number of queues.
> > > > >
> > > > > To fix this, just resort to the lower even number of queues.
> > > > >
> > > > > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for =
the virtio device")
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  hw/net/vhost_net.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > > > index 0d888f29a6..edf56a597f 100644
> > > > > --- a/hw/net/vhost_net.c
> > > > > +++ b/hw/net/vhost_net.c
> > > > > @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetCli=
entState *ncs,
> > > > >      NetClientState *peer;
> > > > >
> > > > >      if (!cvq) {
> > > > > -        last_index -=3D 1;
> > > > > +        last_index &=3D ~1ULL;
> > > > >      }
> > > >
> > > > The math here looks correct but we need to fix vhost_vdpa_dev_start=
() instead?
> > > >
> > > > if (dev->vq_index + dev->nvqs - 1 !=3D dev->last_index) {
> > > > ...
> > > > }
> > > >
> > >
> > > If we just do that, devices that offer an odd number of queues but do
> > > not offer ctrl vq would never enable the last vq pair, isn't it?
> >
> > For vq pair, you assume that it's a networking device, so the device
> > you described here violates the spec.
> >
> > >
> > > Also, I would say that the right place for the solution of this
> > > problem should not be virtio/vhost-vdpa: This is highly dependent on
> > > having cvq, and this implies a knowledge about the use of each
> > > virtqueue. Another kind of device could have an odd number of
> > > virtqueues naturally, and that (-1) would not work for them, isn't it=
?
> >
> > It actually depends on how multiqueue is modeled for each specific
> > type of device. They need to initialize the vq_index and nvqs
> > correctly:
> >
> > E.g if we had a device with 3 queues, we could model it with the follow=
ing:
> >
> > vhost_dev 1, vq_index =3D 0, nvqs =3D 2
> > vhost_dev 2, vq_index =3D 2, nvqs =3D 1
> >
> > In this case the last_index should be initialized to 2, then we know
> > all the vhost_dev is initialized and we can start the hardware.
> >
>
> Right, but in that case, cvq =3D=3D true, and we never enter the
> conditional if (!cvq).
>
> If cvq is false at that moment, your vhost_dev 2 *must* not exist and
> the last index will be even, so we must not subtract 1 to last_index.
> The subtraction is the cause the device never starts.

The last_index will be 1, so the device will be started after
vhost_dev 1 is initialized?

Thanks

>
> Given all of the above, I think we can skip the conditional entirely.
>
> Thanks!
>
> > Thanks
> >
> > >
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > > > >
> > > > >      if (!k->set_guest_notifiers) {
> > > > > --
> > > > > 2.27.0
> > > > >
> > > >
> > >
> >
>


