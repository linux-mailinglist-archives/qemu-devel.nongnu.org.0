Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845B45B6E7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:47:47 +0100 (CET)
Received: from localhost ([::1]:35762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnwP-0004Z3-L3
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:47:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpne8-0003O4-Tz
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:28:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpne6-0003Ot-5u
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637742529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=93JfgbMb5SSbtfmoTyH8F2lmYdxZo6a0wxPwsBypyCU=;
 b=DBEegaA5Yv8zOzt8/Tgrz4LI28OlWY7P7/Dwcv4XFJQlORtNg6gtvc2jAl9FhR/ZzQ9LLM
 1MdVhx4HmtqVpzJTGb2gfHq9S0bq5Fe32Q04DOtYfVNSj9TO7FjqwSbHa2G+c7wWGzcUXP
 OU6RgayS2u909C5OwIFDixFPs0FoWI8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-o7lXY_jYPMOLTGagdVnmig-1; Wed, 24 Nov 2021 03:28:47 -0500
X-MC-Unique: o7lXY_jYPMOLTGagdVnmig-1
Received: by mail-lj1-f199.google.com with SMTP id
 i14-20020a2e864e000000b00218a2c57df8so532341ljj.20
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 00:28:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=93JfgbMb5SSbtfmoTyH8F2lmYdxZo6a0wxPwsBypyCU=;
 b=shEQ0if74FUX0NcWd8vf6oyXkmiqFPqFFL+55X4lDkKOQeZnDiWrK3WO+CsYtN7KoW
 R7gPQdh8bgCYyeOmm/ebJtnNGxzBzLyw29yNqjnksTtmrpDdGhBcjTomgAoyWoFiIRBF
 mwLeskln7zkS/qSggegafaxhgmV0kvHyA/pTu8vJ2GkzbIwMIfWvIkwg8iAgDcB1L08V
 mgaSK2Tj1BrzLj/EQUjaGFhxsps2cfqOTFI3t9KeRqEPmyjV7ICgXPKHfVcIQ86yGd0B
 MavriiSQYwGN3WqYwu/5keSEumYRXqxETaZuv98k29qrFgQh7L9xvXwTM3rKr6Zokhdy
 VK3A==
X-Gm-Message-State: AOAM530/HcSduEooDJRhCM2CpKVgOVVfZP1qn8Vbcp0lovRakYPm6U9j
 jAwnnQmshFZkji3Q9oF0HoBsBoS5Oxg70US9Y8s8hR2gbLqGfLtOwkOjFIi0G4+FNOPz0rraYPH
 kju0tAryDAKUVSRvWiBUVaQtg65PJXmM=
X-Received: by 2002:a2e:3012:: with SMTP id w18mr12845699ljw.217.1637742525864; 
 Wed, 24 Nov 2021 00:28:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRapkSi/A/iO9jXF4v+O2ytWIeMF40q5saOb8pdnRJ1XDV06hIJR15InUnpDgLcsc5UhdeuYqkG2Sk2GByJkk=
X-Received: by 2002:a2e:3012:: with SMTP id w18mr12845659ljw.217.1637742525572; 
 Wed, 24 Nov 2021 00:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20211124043255.6050-1-jasowang@redhat.com>
 <20211124020118-mutt-send-email-mst@kernel.org>
 <CACGkMEsGX6y9cppLoGGsNtoJvbw4TLBVo2V0TFLOGr-JybXA-w@mail.gmail.com>
 <20211124032456-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211124032456-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 24 Nov 2021 16:28:34 +0800
Message-ID: <CACGkMEuHkM7DDN=xoJ=WHki+6SyB_cUfMr7q0yawYucvf3yBWQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-balloon: correct used length
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, qemu-devel <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 4:25 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Nov 24, 2021 at 03:58:22PM +0800, Jason Wang wrote:
> > On Wed, Nov 24, 2021 at 3:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Wed, Nov 24, 2021 at 12:32:55PM +0800, Jason Wang wrote:
> > > > Spec said:
> > > >
> > > > "and len the total of bytes written into the buffer."
> > > >
> > > > For inflateq, deflateq and statsq, we don't process in_sg so the used
> > > > length should be zero. For free_page_vq, though the free pages are
> > > > supplied via in_sgs, zero used length should still be fine since
> > > > anyway driver is expected to use the length in this case and it
> > > > simplifies the error handling path.
> > > >
> > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > >
> > > I think for free page vq the point is that the pages are
> > > zeroed by hypervisor, so we must set used len accordingly. No?
> >
> > I may miss something, I think it is used for clearing the dirty
> > bitmaps to avoid migrating unused pages, the zeroing is not needed.
> >
> > Thanks
>
> And, once the page is migrated, it's value on destination may differ
> from one on source.

Right, I will fix this in the next version.

Thanks


>
> > >
> > > > ---
> > > >  hw/virtio/virtio-balloon.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > > > index c6962fcbfe..3e52daa793 100644
> > > > --- a/hw/virtio/virtio-balloon.c
> > > > +++ b/hw/virtio/virtio-balloon.c
> > > > @@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
> > > >          return;
> > > >      }
> > > >
> > > > -    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
> > > > +    virtqueue_push(s->svq, s->stats_vq_elem, 0);
> > > >      virtio_notify(vdev, s->svq);
> > > >      g_free(s->stats_vq_elem);
> > > >      s->stats_vq_elem = NULL;
> > > > @@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> > > >              memory_region_unref(section.mr);
> > > >          }
> > > >
> > > > -        virtqueue_push(vq, elem, offset);
> > > > +        virtqueue_push(vq, elem, 0);
> > > >          virtio_notify(vdev, vq);
> > > >          g_free(elem);
> > > >          virtio_balloon_pbp_free(&pbp);
> > > > @@ -549,7 +549,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> > > >      }
> > > >
> > > >  out:
> > > > -    virtqueue_push(vq, elem, 1);
> > > > +    virtqueue_push(vq, elem, 0);
> > > >      g_free(elem);
> > > >      return ret;
> > > >  }
> > > > --
> > > > 2.25.1
> > >
>


