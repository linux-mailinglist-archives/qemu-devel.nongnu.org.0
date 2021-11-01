Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B964415D5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 10:06:28 +0100 (CET)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhTGt-0000qn-Di
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 05:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhTEZ-00060z-OW
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:04:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhTEU-00067r-1s
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635757437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctAO72ejsAyPHGGG1lK4xcDebPuBcDCdm8YvWhd6j1w=;
 b=PnXe5dPlsxWUL2jrLYNbQOz+qlRvE9CP+uxsOjqV1EUw/HB0bIMfrM38gzkRgB6J5RVh7n
 aYpBg6u1vbK+xFh9E43KZoaiTPIi7oLX3XCdBm7tws5x0D/peXOwQakcPhQpSTvJBBgbJC
 UAeApir8fSCrdyfiSoDcloL57bAHaTw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-aJMCgf5vOjWq-fLB94oXag-1; Mon, 01 Nov 2021 05:03:55 -0400
X-MC-Unique: aJMCgf5vOjWq-fLB94oXag-1
Received: by mail-qk1-f197.google.com with SMTP id
 w13-20020a05620a0e8d00b0045fad6245e8so10013640qkm.8
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 02:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ctAO72ejsAyPHGGG1lK4xcDebPuBcDCdm8YvWhd6j1w=;
 b=7Coe7ZeRuFMPmval84J9jcGF2R9nQrZVTb1De+lk7QzAMdqH8hNBL5SMszpUjdE+C7
 9FAtFiUuUmBkWntIXuOLUq+WG01iJDbyR3rG6MYuf8ViRU1o8zNNt7DvUgNCC8tZk5EE
 X3cSA8fc5kpm7XHuouJaD0W2V4Fd7VESRTDleovdqMpH/o8mOoZoIhCD63ljDbT6l/2p
 DQOA1KmvzuTHWq6QUk1vwvN5lf+CN530IStExdscitlIrJaQ3uIA48OxRWzHSz81Hsu3
 iku/C2azufHOVAVLk6HsvW7hW/fUPl9IQB6eDPZVC01Q3QG9zpX3ILIPNMM3pPqwrs4i
 oDPQ==
X-Gm-Message-State: AOAM530dW0NEXaxb+094NlbqL1k7XOHZDkdh4PJo66aS3QlMyBPgOrEz
 NnGxgHJhE7bdgmsc+CgYN+omIAs68f+4Nj/VLsMU+1caVZmsS3U4Su1aMp6eXNclZsjk7Vg6rEA
 HYgxsaTfzkiEBN9jj+jJulVJIDpDt/Bs=
X-Received: by 2002:a37:5446:: with SMTP id i67mr21640462qkb.502.1635757435485; 
 Mon, 01 Nov 2021 02:03:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0O95xRc+VyziVlvs2gn9kMdOy+GOqw0JTFwOwarjH3KWQ0mUyllnn0xk1meIWHrM6X2vcWTRG7VlST5VEdc4=
X-Received: by 2002:a37:5446:: with SMTP id i67mr21640454qkb.502.1635757435332; 
 Mon, 01 Nov 2021 02:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211029141608.1728855-1-eperezma@redhat.com>
 <20211031174635-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211031174635-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Nov 2021 10:03:19 +0100
Message-ID: <CAJaqyWcbTLXqgOgRkwVF6rgZrLhejfXh+GLePaBS61R4HYQWDg@mail.gmail.com>
Subject: Re: [PATCH] vhost: Fix last queue index of devices with no cvq
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 31, 2021 at 10:47 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Oct 29, 2021 at 04:16:08PM +0200, Eugenio P=C3=A9rez wrote:
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
> >
> >      if (!k->set_guest_notifiers) {
>
> could this code be made clearer?
>

I can expand both for sure, but do you mean clearer because the
operation is obscure (to remove the last bit to make last_index even)
or because the need of that operation is not clear enough?

Thanks!

> > --
> > 2.27.0
>


