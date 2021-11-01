Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEB54415BC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 10:01:55 +0100 (CET)
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhTCS-0006T9-AC
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 05:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhTA0-0004di-Nx
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:59:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhT9x-0005Et-O1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635757155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Snx8dXTI1BYyLNi+a6pldQz6zUVG7SJnlhU067HMJ8o=;
 b=gOiXjHUg/zurdxLJW+3yqKjuO749vhAKzrdfR/mDRjdU9+Nc3OPD7NG7EVhFVtj7ca0ZdF
 RA5HzBmQm+vDS3bfIJH46VzVzi/XKXPS6wYvN6zAS3bqSOstBqqGBgHvjFTgq11KXhW8cK
 rZspxVXa+WxDZa2WQiNJIJXvnWyzBkk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-QlT0cH62OZa8zE5lgH8zBA-1; Mon, 01 Nov 2021 04:59:14 -0400
X-MC-Unique: QlT0cH62OZa8zE5lgH8zBA-1
Received: by mail-qk1-f199.google.com with SMTP id
 az10-20020a05620a170a00b00462e059180eso5634660qkb.19
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 01:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Snx8dXTI1BYyLNi+a6pldQz6zUVG7SJnlhU067HMJ8o=;
 b=bYh1amWTRr8mxXhuhiMyx6hvAHcwSntj+j0XuWv/1vrMbL/u+5dLcAIrUPKw1ePIvY
 5dj0M1vIg1y0DpZU+CGvQw8LaKQUtrlS02OpT2+4QKqVXWppk6sNAAMoaAbTTt62csZ0
 cj4WcBB5HaaW91Sui2MdFFWVskA5QatXORNeXfbcw0sWN53aZ3nYAeA3BRlynlEeEoBZ
 CdZ3FXp5eyq5uEUYqiOiXgUzj7CtVNm/QtZz32d3cGRL6orALGhkzBGIQ1YI4cQEayJq
 lij4ZGDH4+zNNRbuboVBrcQKc0yDwybnC/CM8BV8EhTpmhRgpemm6TQMhu9YOswVPwo7
 IDFQ==
X-Gm-Message-State: AOAM5320WwrYhwVkyAkzVvnypOlSzrieJq2RJWOqzsD1v5cpL+k+f8RL
 5LTgQbFuxi33v5vEK5lUvUa6JRz3I8nk4Cu2jsHRyYPxdM9WtVJkjogEt8W547dACuVfDrVlNNN
 NckVZg06OFd39/MSHiKK5JqWv+o8RdJk=
X-Received: by 2002:ac8:6112:: with SMTP id a18mr28167376qtm.401.1635757153769; 
 Mon, 01 Nov 2021 01:59:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9X6/kMgsPOutqqWi+aiQ1Mmk0PtIHxKuTWnURyVw2avsflCGLMPs/e9LjyL1cR36X0t97NynXxBhCfHgpBwE=
X-Received: by 2002:ac8:6112:: with SMTP id a18mr28167365qtm.401.1635757153555; 
 Mon, 01 Nov 2021 01:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211029141608.1728855-1-eperezma@redhat.com>
 <CACGkMEss8Xq8WYUkDkLaYx-XBW6GADDAjH1mwmpBdxKc2wsRAQ@mail.gmail.com>
In-Reply-To: <CACGkMEss8Xq8WYUkDkLaYx-XBW6GADDAjH1mwmpBdxKc2wsRAQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Nov 2021 09:58:37 +0100
Message-ID: <CAJaqyWcsbtOoLGkCW6J_9M8qR1-yvbQmWq1rU0y+8Y=BhPeRWw@mail.gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
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

On Mon, Nov 1, 2021 at 4:34 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Oct 29, 2021 at 10:16 PM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > The -1 assumes that all devices with no cvq have an spare vq allocated
> > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be th=
e
> > case, and the device may have a pair number of queues.
> >
> > To fix this, just resort to the lower even number of queues.
> >
> > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the vi=
rtio device")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/net/vhost_net.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 0d888f29a6..edf56a597f 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientSta=
te *ncs,
> >      NetClientState *peer;
> >
> >      if (!cvq) {
> > -        last_index -=3D 1;
> > +        last_index &=3D ~1ULL;
> >      }
>
> The math here looks correct but we need to fix vhost_vdpa_dev_start() ins=
tead?
>
> if (dev->vq_index + dev->nvqs - 1 !=3D dev->last_index) {
> ...
> }
>

If we just do that, devices that offer an odd number of queues but do
not offer ctrl vq would never enable the last vq pair, isn't it?

Also, I would say that the right place for the solution of this
problem should not be virtio/vhost-vdpa: This is highly dependent on
having cvq, and this implies a knowledge about the use of each
virtqueue. Another kind of device could have an odd number of
virtqueues naturally, and that (-1) would not work for them, isn't it?

Thanks!

> Thanks
>
> >
> >      if (!k->set_guest_notifiers) {
> > --
> > 2.27.0
> >
>


