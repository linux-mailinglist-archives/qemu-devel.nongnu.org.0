Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A597442BA0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:27:33 +0100 (CET)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhr0u-0006UT-NZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhqy8-00053P-63
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:24:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhqy5-0000Jq-KK
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635848676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TySGzMUBPO8BTdxO8g+SeLLWqsTJLjIYjdI+cdky7g=;
 b=BlUQlEGcOLEhBqtfptr8lw70qrf34qibwuaUaoZaJx4sPTBEewCrUkLLsL9raoc7+yP6sf
 zo4ZO9SkegF03mx1/cEs5I0OKYjY+wXLGFCLG2pKDqzaR8SqOTfeO0/oWABrwYTf2/4G4i
 SKQ24XzrSi4ZaW4NXtDyFyur6neiqh8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-ibmJtUUiPoS7KwL18RgH9g-1; Tue, 02 Nov 2021 06:24:33 -0400
X-MC-Unique: ibmJtUUiPoS7KwL18RgH9g-1
Received: by mail-qk1-f197.google.com with SMTP id
 w2-20020a3794020000b02903b54f40b442so12496857qkd.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3TySGzMUBPO8BTdxO8g+SeLLWqsTJLjIYjdI+cdky7g=;
 b=zEN73Cla9uuDcLXpiJby28VumI/O/9NPzJcuusZ2vBqxoYiVHrTgHPVQX1Xm2M/qbt
 o3OIJb9nxoE+X6b3gCAG/qHmgtCNMMg4xq3FnKR1RYWaKaiwEx6GUtW46VRc9VyvrPxg
 Y8iC+owiIsY407rFkU7zGDDXdtIx4gwDWAB5JUxyfv6SlVcWx3KxF6Bq/QXfMf0afpsW
 9vqbXlni/7F0OZanSedh+7UFJoiPT0AV0SVcoKlSk9zB4KCjhY0PDZdCaanhxEUxkIGQ
 9IY0PuP7BBVLTNaKvclD6nc8kDAkE+mgbVwxfx+VBItmUdHeBDUSdNoOktOMMwuMs7Jm
 LTJQ==
X-Gm-Message-State: AOAM530IKA3XF/VtRi/cSd8XMX2FTlHlUY7Sz+Gu+hhs0rlGd3X+vyeJ
 jnao0hh8fvTs8JvYoKPRruks1yx6Pt9uX700m9L8nO//A7TirVDeiWrAu3aqwrTJ3QPdh5Fd1AA
 ZlBPTxPmK3ZyEPBO5YldKd5EMLlvQl5I=
X-Received: by 2002:a0c:f992:: with SMTP id t18mr15758602qvn.37.1635848673171; 
 Tue, 02 Nov 2021 03:24:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznzsk/nHJxcTvplfsC750nW9NP0OXAH2xGgdGCOuPJ25U7lqO8xejHWLAaiT/oEL/2JAaZHS4zqgrF9nd8vfg=
X-Received: by 2002:a0c:f992:: with SMTP id t18mr15758590qvn.37.1635848672995; 
 Tue, 02 Nov 2021 03:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211029141608.1728855-1-eperezma@redhat.com>
 <CACGkMEss8Xq8WYUkDkLaYx-XBW6GADDAjH1mwmpBdxKc2wsRAQ@mail.gmail.com>
 <CAJaqyWcsbtOoLGkCW6J_9M8qR1-yvbQmWq1rU0y+8Y=BhPeRWw@mail.gmail.com>
 <CACGkMEv9OR1yTVWhy8bqxdH8s6+f_6KY=Avw2z3soeBudR+Ocw@mail.gmail.com>
 <CAJaqyWeV-UGG8ddwmrYeq4J47V_KSfkPEni96sJOzpEFe5v_FQ@mail.gmail.com>
 <CACGkMEsxW_ZKdF7JGvvCEspNMXeSUeovZM1DooR2RTsmESw5jw@mail.gmail.com>
In-Reply-To: <CACGkMEsxW_ZKdF7JGvvCEspNMXeSUeovZM1DooR2RTsmESw5jw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Nov 2021 11:23:57 +0100
Message-ID: <CAJaqyWdy92O15cChXxCU1_CTYFccmrcvHHb5JG=GrkEw0y219A@mail.gmail.com>
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

On Tue, Nov 2, 2021 at 8:04 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Nov 2, 2021 at 2:59 PM Eugenio Perez Martin <eperezma@redhat.com>=
 wrote:
> >
> > On Tue, Nov 2, 2021 at 5:09 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Mon, Nov 1, 2021 at 4:59 PM Eugenio Perez Martin <eperezma@redhat.=
com> wrote:
> > > >
> > > > On Mon, Nov 1, 2021 at 4:34 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > > > >
> > > > > On Fri, Oct 29, 2021 at 10:16 PM Eugenio P=C3=A9rez <eperezma@red=
hat.com> wrote:
> > > > > >
> > > > > > The -1 assumes that all devices with no cvq have an spare vq al=
located
> > > > > > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may n=
ot be the
> > > > > > case, and the device may have a pair number of queues.
> > > > > >
> > > > > > To fix this, just resort to the lower even number of queues.
> > > > > >
> > > > > > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index fo=
r the virtio device")
> > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > ---
> > > > > >  hw/net/vhost_net.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > > > > index 0d888f29a6..edf56a597f 100644
> > > > > > --- a/hw/net/vhost_net.c
> > > > > > +++ b/hw/net/vhost_net.c
> > > > > > @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetC=
lientState *ncs,
> > > > > >      NetClientState *peer;
> > > > > >
> > > > > >      if (!cvq) {
> > > > > > -        last_index -=3D 1;
> > > > > > +        last_index &=3D ~1ULL;
> > > > > >      }
> > > > >
> > > > > The math here looks correct but we need to fix vhost_vdpa_dev_sta=
rt() instead?
> > > > >
> > > > > if (dev->vq_index + dev->nvqs - 1 !=3D dev->last_index) {
> > > > > ...
> > > > > }
> > > > >
> > > >
> > > > If we just do that, devices that offer an odd number of queues but =
do
> > > > not offer ctrl vq would never enable the last vq pair, isn't it?
> > >
> > > For vq pair, you assume that it's a networking device, so the device
> > > you described here violates the spec.
> > >
> > > >
> > > > Also, I would say that the right place for the solution of this
> > > > problem should not be virtio/vhost-vdpa: This is highly dependent o=
n
> > > > having cvq, and this implies a knowledge about the use of each
> > > > virtqueue. Another kind of device could have an odd number of
> > > > virtqueues naturally, and that (-1) would not work for them, isn't =
it?
> > >
> > > It actually depends on how multiqueue is modeled for each specific
> > > type of device. They need to initialize the vq_index and nvqs
> > > correctly:
> > >
> > > E.g if we had a device with 3 queues, we could model it with the foll=
owing:
> > >
> > > vhost_dev 1, vq_index =3D 0, nvqs =3D 2
> > > vhost_dev 2, vq_index =3D 2, nvqs =3D 1
> > >
> > > In this case the last_index should be initialized to 2, then we know
> > > all the vhost_dev is initialized and we can start the hardware.
> > >
> >
> > Right, but in that case, cvq =3D=3D true, and we never enter the
> > conditional if (!cvq).
> >
> > If cvq is false at that moment, your vhost_dev 2 *must* not exist and
> > the last index will be even, so we must not subtract 1 to last_index.
> > The subtraction is the cause the device never starts.

Clarification: I meant networking here :).

>
> The last_index will be 1, so the device will be started after
> vhost_dev 1 is initialized?
>

In !cvq !mq case, last_index is the number of virtqueues. It is initialized=
 as:

int ... last_index =3D data_queue_pairs * 2;

and data queue pairs comes from caller function virtio_net_vhost_status:

int queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;

so last_index ends up being 2.

I didn't check a MQ device with !cvq, but I think it will be the same.

Thanks!

> Thanks
>
> >
> > Given all of the above, I think we can skip the conditional entirely.
> >
> > Thanks!
> >
> > > Thanks
> > >
> > > >
> > > > Thanks!
> > > >
> > > > > Thanks
> > > > >
> > > > > >
> > > > > >      if (!k->set_guest_notifiers) {
> > > > > > --
> > > > > > 2.27.0
> > > > > >
> > > > >
> > > >
> > >
> >
>


