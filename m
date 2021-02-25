Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F32C3253E2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 17:47:51 +0100 (CET)
Received: from localhost ([::1]:38390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFJnp-00042Q-GR
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 11:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lFJk9-0002ge-6M
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:44:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lFJjy-0007ad-MH
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614271425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s3KSB7e4Gspf3X5hHpL9C3WRD9cI8OiKEqvk3dl72bk=;
 b=H9QrxdEeTUrv/E9zQvlO6EDlv25bCnoiWN53esQBJLphcypUo//8EZ6LtDeCztQlxHSQ13
 abnFJhu2otH6knAkJkfTCVIN7EkilCv8I0LjR/2q8FwX1FMIOPBuzJToR1E9OU4Th0aiOp
 GaiB/cc+20vJZJ+zVE73DswsXF8H/QU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-yFsn6Lo6NeqNfP9tient6A-1; Thu, 25 Feb 2021 11:43:44 -0500
X-MC-Unique: yFsn6Lo6NeqNfP9tient6A-1
Received: by mail-pl1-f200.google.com with SMTP id z2so3760319pln.18
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 08:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s3KSB7e4Gspf3X5hHpL9C3WRD9cI8OiKEqvk3dl72bk=;
 b=kf7AXvWJH2EUBrTTh5Dcx0R5CYbHQZHAWA1cBxJiXEjmowuhNar8TX0FanOW7Z3aHh
 51r549JYZ92RrFjZiNnv1Fi0rrlWbkuwdG/pfmd+BKr6PdV/QHNBKBAf+sr3fS9aZ7hM
 SNc3PK4mjMVM1sXPB/oMfLATkkhGBrfhsL4IZmqWC8yGH3SKJjS3e9iTvaeDNLdS9/9C
 ho13XA03h8O7eK8+YpDWiZ/5Kh4CqZCjoBo/qtkYY2VXOneg8o71MRbaYE8e5HGcYccd
 O8BMB7sAMeRZz1lRw2xK2KjVh11Qd6i0fDxWBsygitplUL2fa0m7umrIW97+CU7GsGUY
 FlOg==
X-Gm-Message-State: AOAM530mkpWTzxB4lBqwpZdQk70Tuy3jjXIoIGPCtZ/bjz9S375RDS4D
 Uq9asK/hGC0iLecfn5BHFqJnrICI/4dY+yR5d1mgbSe/SCUBb+OsL4Z62NH3cDeyLWqOUm6/mOA
 Ll850OxqrIFYCoJTdjy122ph13XG6Lzg=
X-Received: by 2002:a63:d153:: with SMTP id c19mr3694409pgj.311.1614271421934; 
 Thu, 25 Feb 2021 08:43:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwukvCV8h2tBtWMZpzzZ8fgj2au/Ewu2EZpB3MPj1NzJPCgefrwz+LanZkew7xd5Of44DNVAXGbx21/mm58S7A=
X-Received: by 2002:a63:d153:: with SMTP id c19mr3694377pgj.311.1614271421620; 
 Thu, 25 Feb 2021 08:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20210224073333.16035-1-lulu@redhat.com>
 <20210224024852-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210224024852-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Fri, 26 Feb 2021 00:43:05 +0800
Message-ID: <CACLfguXiywOcTEYWJJA9MaB1XocaOUegiWS=0TAQi9ykmbn0sw@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: Add check for mac address while peer is vdpa
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Adrian Moreno Zapata <amorenoz@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sure, Thanks michael, I will address, these comment and send a new version

On Wed, Feb 24, 2021 at 3:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> > [PATCH] virtio-net: Add check for mac address while peer is vdpa
> please do keep numbering patch versions.
>
>
> On Wed, Feb 24, 2021 at 03:33:33PM +0800, Cindy Lu wrote:
> > Sometime vdpa get an all zero mac address from the hardware, this will cause the
> > traffic down, So we add the check for in part.if we get an zero mac address we will
> > use the default/cmdline mac address instead
>
> How does this differ from v4 of same patch?
>
> Lots of typos above. I guess I can just rewrite the whole log ...
>
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  hw/net/virtio-net.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 9179013ac4..f1648fc47d 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -126,6 +126,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> >      VirtIONet *n = VIRTIO_NET(vdev);
> >      struct virtio_net_config netcfg;
> >      NetClientState *nc = qemu_get_queue(n->nic);
> > +    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
> >
> >      int ret = 0;
> >      memset(&netcfg, 0 , sizeof(struct virtio_net_config));
> > @@ -151,7 +152,11 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> >          ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
> >                                     n->config_size);
> >          if (ret != -1) {
> > -            memcpy(config, &netcfg, n->config_size);
>
> Below needs a huge code comment explaining what is going on.
>
> E.g.  if we get a valid mac from peer, use it.
>
> If we get 0 instead
> then we don't know the peer mac but since the
> mac is 0 and that is not a legal value,
> try to proceed assume something else (management, hardware) sets up the mac
> correctly and consistently with the qemu configuration.
>
>
> > +            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) != 0) {
>
> != 0 is not necessary
>
> > +                memcpy(config, &netcfg, n->config_size);
>
> > +        } else {
> > +                error_report("Get an all zero mac address from hardware");
>
> So why are you skipping the copying of the whole config space? Why not
> just skip the mac? Seems quite risky e.g. looks like it will break
> things like reporting the link status, right?
>
> > +            }
> >          }
> >      }
> >  }
> > --
> > 2.21.3
>


