Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0426F461711
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:52:39 +0100 (CET)
Received: from localhost ([::1]:50518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrh5B-0003Ee-JM
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:52:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrgwN-0005r2-8Q
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:43:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrgwK-0001c6-QZ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638193407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rcQeXhWzRgeRpTwStRDmRY0fuBFG9QkUxxHvHlxWNk=;
 b=LOOVO6RY3XKpTIRnuZCla+O078hBER4oUCxP2Kt5RtmyduZPEXwBqfIzEBuaSHIJNwq2af
 Orou3yhelJ/vKQ9bUU8TC5hK0CEgVSyiRkp7Cwm8YH8r6DAqjTn3N+m8hwCYY1/tR9u09u
 uJkq8zslxiqeG42fdIPIC+94xhOMAxs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-fg4sa5ESMXOen70fZNBLvw-1; Mon, 29 Nov 2021 08:43:26 -0500
X-MC-Unique: fg4sa5ESMXOen70fZNBLvw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w4-20020aa7cb44000000b003e7c0f7cfffso13777799edt.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1rcQeXhWzRgeRpTwStRDmRY0fuBFG9QkUxxHvHlxWNk=;
 b=TQc2e0gWOUUD/SJniP9JgYbLVpTIzaYLe05sXdSnbc0UaU90IEjb9wpDO+osX7z0DY
 gWWm/GFCHg/H4Xyo/6vxHfC2kmjuAILi8mI59dTFOsUdgSwFvojeULIVqcnqHCONf3uY
 u4HBMrkWtAMlKWZEeiYk14f+5QeWbzJ/MjyAx0WeR88AGKQqOHTOkWFMHdCMRZP6EK3P
 EIu4vkq7RA1kusFh0f2twlMUXlQvYI+/6XDELNvlJyhVV5+uliEijppk+m+ICaBwYoGT
 qJVqwH/iElcTnBKSQWe5kQk64icvFEk+5IvwJjbLxku/d3RDubq3GtkSqNQPwqEshSri
 lq3A==
X-Gm-Message-State: AOAM532GIqdYNHxBSezta29GJNa4Bd6ywARzHZ9F2L/2Fi5EMfq/hQBr
 90GeTVwWMqmPQPa83N1yfzmz2aLkLRoatUCmIC4PoC8cxbd34e4Mt7gMnGRos6hHnGr/5u/kug6
 OZdlnaLuRbmkxfUI=
X-Received: by 2002:a05:6402:4249:: with SMTP id
 g9mr74419510edb.316.1638193405216; 
 Mon, 29 Nov 2021 05:43:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXaLq0+uXmcMjb5LhoApBg0hcwzOD4x4uBWq8F/MKkpV9qSsUPfCSbUYwiXZr6vy0fuCWp2Q==
X-Received: by 2002:a05:6402:4249:: with SMTP id
 g9mr74419455edb.316.1638193404859; 
 Mon, 29 Nov 2021 05:43:24 -0800 (PST)
Received: from redhat.com ([45.15.19.35])
 by smtp.gmail.com with ESMTPSA id gs15sm7193997ejc.42.2021.11.29.05.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 05:43:23 -0800 (PST)
Date: Mon, 29 Nov 2021 08:43:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 2/2] virtio-net: Fix log message
Message-ID: <20211129084249-mutt-send-email-mst@kernel.org>
References: <20211125101614.76927-1-eperezma@redhat.com>
 <20211125101614.76927-3-eperezma@redhat.com>
 <CACGkMEubkMz-BGxQ3zX__-gmweAvEid=CQxLaRXVDEnCHDoE=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEubkMz-BGxQ3zX__-gmweAvEid=CQxLaRXVDEnCHDoE=A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 26, 2021 at 10:54:32AM +0800, Jason Wang wrote:
> On Thu, Nov 25, 2021 at 6:16 PM Eugenio Pérez <eperezma@redhat.com> wrote:
> >
> > The message has never been true in the case of non tap networking, so
> > only tell that userland networking will be used if possible.
> >
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> 
> Acked-by: Jason Wang <jasowang@redhat.com>

Breaks make check. I suspect it's called without a peer or something.

Dropped for 6.2.

> > ---
> >  hw/net/virtio-net.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index f2014d5ea0..d6c98c3c2d 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -245,6 +245,7 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
> >      NetClientState *nc = qemu_get_queue(n->nic);
> >      int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
> >      int cvq = n->max_ncs - n->max_queue_pairs;
> > +    bool tap_backend = nc->peer->info->type == NET_CLIENT_DRIVER_TAP;
> >
> >      if (!get_vhost_net(nc->peer)) {
> >          return;
> > @@ -258,9 +259,9 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
> >          int r, i;
> >
> >          if (n->needs_vnet_hdr_swap) {
> > -            error_report("backend does not support %s vnet headers; "
> > -                         "falling back on userspace virtio",
> > -                         virtio_is_big_endian(vdev) ? "BE" : "LE");
> > +            error_report("backend does not support %s vnet headers%s",
> > +                    virtio_is_big_endian(vdev) ? "BE" : "LE",
> > +                    tap_backend ? "; falling back on userspace virtio" : "");
> >              return;
> >          }
> >
> > @@ -288,8 +289,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
> >          n->vhost_started = 1;
> >          r = vhost_net_start(vdev, n->nic->ncs, queue_pairs, cvq);
> >          if (r < 0) {
> > -            error_report("unable to start vhost net: %d: "
> > -                         "falling back on userspace virtio", -r);
> > +            error_report("unable to start vhost net: %d%s", -r,
> > +                       tap_backend ? " falling back on userspace virtio" : "");
> >              n->vhost_started = 0;
> >          }
> >      } else {
> > --
> > 2.27.0
> >


