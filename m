Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A918C4B4323
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 08:54:35 +0100 (CET)
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWBu-00033e-PP
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 02:54:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJVx8-0006UC-8x
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:39:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJVx4-0001Q0-18
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644824352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WH7NjhKXSF4EuPVtzD9OoXyTPYuqBxPcJadIxTYKRO8=;
 b=UbDF8tBxwGZYDfpMSAKSbJq3s5D+3sofWkOqqLUa8omprmj0j9Os+bJVIjyUd5r5L6UeRU
 VqdkYVWRnUUwyeQxd9ckilX17+razsNmAzsjbxpBbmgBZcnEJH+rknsSK890pFkb79RmzS
 9i09dUPG2AuzsS9yFiRYD22qXcW9Pmk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-OLOqno2JMRS0sv5YNj6tcw-1; Mon, 14 Feb 2022 02:39:11 -0500
X-MC-Unique: OLOqno2JMRS0sv5YNj6tcw-1
Received: by mail-lj1-f199.google.com with SMTP id
 h2-20020a2ea482000000b00244cbce843dso483265lji.9
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 23:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WH7NjhKXSF4EuPVtzD9OoXyTPYuqBxPcJadIxTYKRO8=;
 b=XP246ozeyxguNzBQTFeF4pgA8en5jXF2i9Cuo+tUkIdFDlpWU2uzxcDj75wTWiSZu3
 8bPpyyFDb79VJ+hvP1NT8CQ9dXfjjStRpzOwfJH9hsGtFCQQ7/3Pf65/Up+7z51dpedS
 xQGGFOyJ9XAU96sDzFkc6vagTz3TZdfe/wnxtqgXGRaWCATyLuBRkyVVfwSYMAqRqHxI
 94vvTmW3mciJQuJrg0BncsqEPr0WoujOvg85I0bCPv1WuAfhje2sXa4MJUscH5coyV1B
 vBuY7YQMMt8RsD2xLJVnI9czgyWN3QaRSwQbMJ+APK8xzmHVDZ0nVUaWxPBcZJsPgoaK
 a8jw==
X-Gm-Message-State: AOAM531PzqLwq3klK13fpCEa3kP9Q4YQsFGUnEVv/yuwjDH8DlnX2+My
 39je2NGDNtb2Vfd05GhskzpmUUD1lmejjdpZMmND5zagw8B5QXLpc/0D9Lz3lr+1V706UaOn0zC
 neDQ5BZSJGbOhA7B49uDdd/rAI7kfHDk=
X-Received: by 2002:a2e:914c:: with SMTP id q12mr125648ljg.420.1644824350042; 
 Sun, 13 Feb 2022 23:39:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydw28t3X7ID/T1u6OIrrvOzMK0p9DzXZ0HeIkrjBh52yKARj312qQnTHFxp7ZP+ss3xeR40WaKS+7iX5Cwon8=
X-Received: by 2002:a2e:914c:: with SMTP id q12mr125638ljg.420.1644824349783; 
 Sun, 13 Feb 2022 23:39:09 -0800 (PST)
MIME-Version: 1.0
References: <20220211161309.1385839-1-lvivier@redhat.com>
 <CACGkMEuzDjt5Moyt=NdUhx4hCDq4marCDa+6Ko5pnF10uipSzA@mail.gmail.com>
 <95a5bf33-27d8-0be4-7a47-d12a90875e48@redhat.com>
In-Reply-To: <95a5bf33-27d8-0be4-7a47-d12a90875e48@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 14 Feb 2022 15:38:58 +0800
Message-ID: <CACGkMEvtrNymiCAwx4Lv-BADmSVXrcmdmX-36mk5Sgcor3nCBw@mail.gmail.com>
Subject: Re: [RFC] vhost-vdpa: make notifiers _init()/_uninit() symmetric
To: Laurent Vivier <lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 3:33 PM Laurent Vivier <lvivier@redhat.com> wrote:
>
> On 14/02/2022 04:20, Jason Wang wrote:
> > On Sat, Feb 12, 2022 at 12:13 AM Laurent Vivier <lvivier@redhat.com> wrote:
> >>
> >> vhost_vdpa_host_notifiers_init() initializes queue notifiers
> >> for queues "dev->vq_index" to queue "dev->vq_index + dev->nvqs",
> >> whereas vhost_vdpa_host_notifiers_uninit() uninitializes the
> >> same notifiers for queue "0" to queue "dev->nvqs".
> >>
> >> This asymmetry seems buggy, fix that by using dev->vq_index
> >> as the base for both.
> >>
> >> Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
> >> Cc: jasowang@redhat.com
> >> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >> ---
> >>   hw/virtio/vhost-vdpa.c | 20 ++++++++++----------
> >>   1 file changed, 10 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >> index 04ea43704f5d..9be3dc66580c 100644
> >> --- a/hw/virtio/vhost-vdpa.c
> >> +++ b/hw/virtio/vhost-vdpa.c
> >> @@ -395,15 +395,6 @@ static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
> >>       }
> >>   }
> >>
> >> -static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
> >> -{
> >> -    int i;
> >> -
> >> -    for (i = 0; i < n; i++) {
> >> -        vhost_vdpa_host_notifier_uninit(dev, i);
> >> -    }
> >> -}
> >> -
> >>   static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
> >>   {
> >>       size_t page_size = qemu_real_host_page_size;
> >> @@ -442,6 +433,15 @@ err:
> >>       return -1;
> >>   }
> >>
> >> +static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
> >> +{
> >> +    int i;
> >> +
> >> +    for (i = dev->vq_index; i < dev->vq_index + n; i++) {
> >> +        vhost_vdpa_host_notifier_uninit(dev, i);
> >> +    }
> >> +}
> >
> > Patch looks good but I wonder why we need to move this function?
>
> I moved the _uninit function close to the _init one to be able to compare them easier.
> I think it will help reviewers in the future if code is side-by-side.

Fine.

So

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> But we can let it at its original place.
>
> Thanks,
> Laurent
>


