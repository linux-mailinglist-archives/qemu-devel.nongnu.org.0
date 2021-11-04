Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B145444EF8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 07:37:06 +0100 (CET)
Received: from localhost ([::1]:50566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miWMz-0007OX-8R
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 02:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miWLC-0006Y2-C9
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 02:35:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miWL7-0007vt-07
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 02:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636007706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEeQErNW4V6Lz+cq9Ke6Z7JCEihd/F7Vlrsxr16ltCQ=;
 b=HlHaPGqEGuDQi5Y+QP4KUNEzgeGNxNqmEcMYfq7hZygkXK00m/2KnKeYzHLfgAECIfkGxS
 xhc7/GU1dIABHYP1R0rtF/0BLVBcaOcylvxo4olKJe4Q0aJ/edxFZxPxKBKxbJnx3m/uR/
 buGnWNeeUhDDGEl3tzifRG+rhcGFiu8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-UNxiWaSXOai0dZV3igQ14A-1; Thu, 04 Nov 2021 02:35:05 -0400
X-MC-Unique: UNxiWaSXOai0dZV3igQ14A-1
Received: by mail-qv1-f72.google.com with SMTP id
 z8-20020a0cd788000000b00384d92a0f11so4831208qvi.17
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 23:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YEeQErNW4V6Lz+cq9Ke6Z7JCEihd/F7Vlrsxr16ltCQ=;
 b=2SleR9SVIi/1HOyXoaGigyiR8nIb4vr205o+OqsdKMO2pm/0X1ddcMQYH2aAJzmDsW
 JY5xEhemKv+g5oBMjo/GTzBZetncalncElhqaXxpdKzfstpJ4xRj2T3GLjrDEvWjf/Jp
 B/n3nJ2Ukzp0nZ0oG3qUQhZhPMyXmSEtr3cnW2n8KHXTJgbj/Yy45Xd31gNSwNzNZMpH
 0SPbT4jOAvEpXLZ7u3v3bhu+zAp3Fz1FDvA0X30RdTg5UQ8mWLOJQNajDvXDI9kIwtpQ
 r7qtpo6BL7xLK8WuyYYTDeJM72glBJ4V1mNsfyx6akBs8/raAXooUKg1xN2h+RStFhEs
 7dQA==
X-Gm-Message-State: AOAM533Vn/NG0mQUWbr8oLK6eqGTRaX68n5nQnF8ZMT6AqYQFX33IHPA
 ZvZoAsBbdEfroLFYKRSkwsy+//VbnyPBBE03dxMjLqgZFNvqzFIVdRZjZsD84ffsW0FbTfFeCPR
 EZeF0LuRwyZt+dQlIV5cz5C6Yg48NWmw=
X-Received: by 2002:ac8:598d:: with SMTP id e13mr52877169qte.76.1636007704515; 
 Wed, 03 Nov 2021 23:35:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww4VakNpASH5u6cZO+Dr4KJs0SgaemfDG5YuW2CaCrCEjIyK84+8DZIqMuv+NdWIVE7rWb5ga3MedWWySdfqE=
X-Received: by 2002:ac8:598d:: with SMTP id e13mr52877150qte.76.1636007704283; 
 Wed, 03 Nov 2021 23:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211103100131.1983272-1-eperezma@redhat.com>
 <20211103100131.1983272-3-eperezma@redhat.com>
 <CACGkMEuEktc5RbeBcfyDhZ5iTBB49nHdcwQ+r0u29VfmuC+gtQ@mail.gmail.com>
In-Reply-To: <CACGkMEuEktc5RbeBcfyDhZ5iTBB49nHdcwQ+r0u29VfmuC+gtQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Nov 2021 07:34:28 +0100
Message-ID: <CAJaqyWcWpkoDNVRx5B0n8NahLxcOBTxm64UQ54Ma+-TjZgWXgQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] vhost: Fix last vq queue index of devices with no
 cvq
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 4, 2021 at 3:47 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Nov 3, 2021 at 6:01 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > The -1 assumes that last index counts all vhost device models as having
> > two queues, but they count only the ones that models the data queues.
> >
> > Because of that, the right change in last_index is to actually add the
> > cvq, not to remove the missing one.
> >
> > This is not a problem to vhost-net, but it is to vhost-vdpa, which
> > device model trust to reach the last index to finish starting the
> > device.
> >
> > Tested with vp_vdpa with host's vhost=3Don and vhost=3Doff, with ctrl_v=
q=3Don
> > and ctrl_vq=3Doff.
> >
> > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the vi=
rtio device")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/net/vhost_net.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 081946dc93..fe2b8a2b83 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -329,8 +329,8 @@ int vhost_net_start(VirtIODevice *dev, NetClientSta=
te *ncs,
> >      int r, e, i, last_index =3D data_queue_pairs * 2;
> >      NetClientState *peer;
> >
> > -    if (!cvq) {
> > -        last_index -=3D 1;
> > +    if (cvq) {
> > +        last_index +=3D 1;
>
> Patch looks ok.
>
> Not a native speaker but I guess "last" should be inside the closed
> interval. If this is true, I still prefer to change the check in
> vhost_vdpa_dev_start().
>

You are right, it's the way we are using it in iova address and there
are some other examples. I'll rename to end, similar to other
containers.

Thanks!

> Thanks
>
> >      }
> >
> >      if (!k->set_guest_notifiers) {
> > --
> > 2.27.0
> >
>


