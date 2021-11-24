Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AA345B697
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:33:51 +0100 (CET)
Received: from localhost ([::1]:51352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpniw-0006JV-Nm
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpnhW-0005TO-D8
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:32:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mpnhU-0003za-RM
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637742740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4s/8FqHwkWavN9oCkdXiV1XpPXfPfq5lgxa86btWeYo=;
 b=aewyNK2Tdy1NkUaW6/Yrt1oR6lEY4iq+R0IpAs8WcDzCiZPU6Dugxk+pugflLmVvfxHWzY
 rti9qJrNDuPZlHN4ROSiAj+3lzP9xT2rT233T4ePGuKNMJNYkSNMM4TKjZ3UXChycmO1T7
 u4PitNBuapu6CU4RtZx4qtdDDvyv3T8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-FkraZztJMISo6GYHBDleMw-1; Wed, 24 Nov 2021 03:32:19 -0500
X-MC-Unique: FkraZztJMISo6GYHBDleMw-1
Received: by mail-lf1-f72.google.com with SMTP id
 k5-20020a05651210c500b0040934a07fbdso1029800lfg.22
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 00:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4s/8FqHwkWavN9oCkdXiV1XpPXfPfq5lgxa86btWeYo=;
 b=06EsDD7MdeKSyQDLgHwE2OWQ93103An3g3Xlr2hrP/x1b51591/Wcv9zTmlWZM0906
 IjSNYzzJf+Ru5hLq0OcUSqQFbDDJiezLMZfMJoinM5WWqFxP5vbE/z3GuH3U6LgWyb2L
 Il65bZ9rKcLOhzS1Gq+4iyAjMdNVYYwwcCA8+/ldNZB4nRqPkW+GH0k6pFUeWaQXqPIF
 4xZsa6hcaGajDSwkTe0G3eeJX4IDMpx20FfpMloA1FWzUZDo+/C8rel+UuuZhT+p8+hu
 UZGhDihie0cj5FiHfPw1IaKJVHgXI/qKzKh5EeCu9YYAo02vlFiWTm8LbM7G7IV7k7Is
 nNZQ==
X-Gm-Message-State: AOAM533BufrHwG1y+oleSWFPyDyVv0Ei+RDsqnPvBzm2dIknZstNyPmt
 0Yhz+t1cVLHA4kBiKLRFJnX38VCS8OlgVnd4DhoF91hmefucgDer1bwyDkbHkqYSV5pFdEWTjzP
 FPj3ETXIVp/YSoxPQeCuCEKeFCJjzBTY=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr12990951ljp.362.1637742737444; 
 Wed, 24 Nov 2021 00:32:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUmDysWcdnCGgTU36RMjkFbh9lelpxQKSDTcpdusIIR4IMs+FA9Q+qig3J3z940ga45Hiri2VEHNRvT++yfls=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr12990919ljp.362.1637742737236; 
 Wed, 24 Nov 2021 00:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20211124043255.6050-1-jasowang@redhat.com>
 <20211124020118-mutt-send-email-mst@kernel.org>
 <CACGkMEsGX6y9cppLoGGsNtoJvbw4TLBVo2V0TFLOGr-JybXA-w@mail.gmail.com>
 <20211124032456-mutt-send-email-mst@kernel.org>
 <CACGkMEuHkM7DDN=xoJ=WHki+6SyB_cUfMr7q0yawYucvf3yBWQ@mail.gmail.com>
In-Reply-To: <CACGkMEuHkM7DDN=xoJ=WHki+6SyB_cUfMr7q0yawYucvf3yBWQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 24 Nov 2021 16:32:06 +0800
Message-ID: <CACGkMEuiUj_d31fcQxKW0MBZQm7sDsYGZw2c5zo6Pt9cVTZWRA@mail.gmail.com>
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

On Wed, Nov 24, 2021 at 4:28 PM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Nov 24, 2021 at 4:25 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Nov 24, 2021 at 03:58:22PM +0800, Jason Wang wrote:
> > > On Wed, Nov 24, 2021 at 3:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Nov 24, 2021 at 12:32:55PM +0800, Jason Wang wrote:
> > > > > Spec said:
> > > > >
> > > > > "and len the total of bytes written into the buffer."
> > > > >
> > > > > For inflateq, deflateq and statsq, we don't process in_sg so the used
> > > > > length should be zero. For free_page_vq, though the free pages are
> > > > > supplied via in_sgs, zero used length should still be fine since
> > > > > anyway driver is expected to use the length in this case and it
> > > > > simplifies the error handling path.
> > > > >
> > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > >
> > > > I think for free page vq the point is that the pages are
> > > > zeroed by hypervisor, so we must set used len accordingly. No?
> > >
> > > I may miss something, I think it is used for clearing the dirty
> > > bitmaps to avoid migrating unused pages, the zeroing is not needed.
> > >
> > > Thanks
> >
> > And, once the page is migrated, it's value on destination may differ
> > from one on source.
>
> Right, I will fix this in the next version.
>
> Thanks

Btw in the get_free_page_hints() I see this:

    if (elem->in_num && dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
                                  elem->in_sg[0].iov_len);
    }

It looks like only the first in sg is used, it looks like a bug?

Thanks

>
>
> >
> > > >
> > > > > ---
> > > > >  hw/virtio/virtio-balloon.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > > > > index c6962fcbfe..3e52daa793 100644
> > > > > --- a/hw/virtio/virtio-balloon.c
> > > > > +++ b/hw/virtio/virtio-balloon.c
> > > > > @@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
> > > > >          return;
> > > > >      }
> > > > >
> > > > > -    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
> > > > > +    virtqueue_push(s->svq, s->stats_vq_elem, 0);
> > > > >      virtio_notify(vdev, s->svq);
> > > > >      g_free(s->stats_vq_elem);
> > > > >      s->stats_vq_elem = NULL;
> > > > > @@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> > > > >              memory_region_unref(section.mr);
> > > > >          }
> > > > >
> > > > > -        virtqueue_push(vq, elem, offset);
> > > > > +        virtqueue_push(vq, elem, 0);
> > > > >          virtio_notify(vdev, vq);
> > > > >          g_free(elem);
> > > > >          virtio_balloon_pbp_free(&pbp);
> > > > > @@ -549,7 +549,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> > > > >      }
> > > > >
> > > > >  out:
> > > > > -    virtqueue_push(vq, elem, 1);
> > > > > +    virtqueue_push(vq, elem, 0);
> > > > >      g_free(elem);
> > > > >      return ret;
> > > > >  }
> > > > > --
> > > > > 2.25.1
> > > >
> >


