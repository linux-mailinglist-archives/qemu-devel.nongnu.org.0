Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB4B4B4040
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 04:22:17 +0100 (CET)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJRwO-0006HJ-5H
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 22:22:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJRvI-0005bv-6I
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:21:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJRvC-0001tw-GK
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644808861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hagUZLtEtUbzoln7zjEvCWRlHh3U/Ue7tqA9vRFiDf0=;
 b=T1ip3cteANIPBchVCaOhU7WXubHFTWprbHzofe5vI+/2UvsJQjAQRt8cX+4P8fXDi7O/B2
 UV61jPXQ5owIev9ClUkdI6WI/bhQqM/VehUtXe57hg5jHn80L71i3q3V91d0uz3YuX+RjI
 dskfvfYaAMK0eePBDBSz3w0hKexZBV0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-otqHmnw-Mfaz1eVjubuthQ-1; Sun, 13 Feb 2022 22:21:00 -0500
X-MC-Unique: otqHmnw-Mfaz1eVjubuthQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 h16-20020a056512221000b00442f7ad732bso2054069lfu.15
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 19:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hagUZLtEtUbzoln7zjEvCWRlHh3U/Ue7tqA9vRFiDf0=;
 b=2GXGjxPSa3Mj7qZ+Ej7afXf63F2/isQn0GpiE70mRUiBuluYl8xY6QTshiPABuTdWu
 DkZ4hzOT7O49aHMYO0+4QN3BZJ1ynap4yb60sT68yy2z12j2me0eUBD136bCQLFY17Dw
 wpodKnJRKYPMjD6xZCJxHdLQsHspNirBwvGn9O8vyzu8ZR45z2Cs32zV2oLZMfq6zaCW
 oc6Scr/Uc44Ff2bMPU2VKiZez34zybBg27vtq8Nlh5gIlip4jUQmy15RWdCUErGAm2xC
 Dsz3VNtV3xx8Fqd9Sc2vANTuY5Ax8aSprNRWf4irz+m1wW7Z6LdF0Fd3o+ws9yzwxvKG
 BqMw==
X-Gm-Message-State: AOAM530x2OdYck2QCq2QqBwEzbym2RGdRpdLUH5o8Oi1PNPhSbDc3MGQ
 IOp33oBpxGtizmLmfUAUF8GCAdEifjpcgRSZecfOIwCku+5GX4BGpMza82qlrXkb6JeMnhYpiA1
 3W5bhKeOlK5PDMqlJOTZGKyfYfkiZtLA=
X-Received: by 2002:ac2:4437:: with SMTP id w23mr3496320lfl.481.1644808858486; 
 Sun, 13 Feb 2022 19:20:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4xftvfu8Y2hGc2aWdBktB4gVugjQtBNo1UdNoo6X1HgxQg0DeEEffRgeOTAFME0KO184FpXpNDKeCXKzLQAI=
X-Received: by 2002:ac2:4437:: with SMTP id w23mr3496308lfl.481.1644808858257; 
 Sun, 13 Feb 2022 19:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20220211161309.1385839-1-lvivier@redhat.com>
In-Reply-To: <20220211161309.1385839-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 14 Feb 2022 11:20:47 +0800
Message-ID: <CACGkMEuzDjt5Moyt=NdUhx4hCDq4marCDa+6Ko5pnF10uipSzA@mail.gmail.com>
Subject: Re: [RFC] vhost-vdpa: make notifiers _init()/_uninit() symmetric
To: Laurent Vivier <lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sat, Feb 12, 2022 at 12:13 AM Laurent Vivier <lvivier@redhat.com> wrote:
>
> vhost_vdpa_host_notifiers_init() initializes queue notifiers
> for queues "dev->vq_index" to queue "dev->vq_index + dev->nvqs",
> whereas vhost_vdpa_host_notifiers_uninit() uninitializes the
> same notifiers for queue "0" to queue "dev->nvqs".
>
> This asymmetry seems buggy, fix that by using dev->vq_index
> as the base for both.
>
> Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
> Cc: jasowang@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 04ea43704f5d..9be3dc66580c 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -395,15 +395,6 @@ static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
>      }
>  }
>
> -static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
> -{
> -    int i;
> -
> -    for (i = 0; i < n; i++) {
> -        vhost_vdpa_host_notifier_uninit(dev, i);
> -    }
> -}
> -
>  static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
>  {
>      size_t page_size = qemu_real_host_page_size;
> @@ -442,6 +433,15 @@ err:
>      return -1;
>  }
>
> +static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
> +{
> +    int i;
> +
> +    for (i = dev->vq_index; i < dev->vq_index + n; i++) {
> +        vhost_vdpa_host_notifier_uninit(dev, i);
> +    }
> +}

Patch looks good but I wonder why we need to move this function?

Thanks

> +
>  static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
>  {
>      int i;
> @@ -455,7 +455,7 @@ static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
>      return;
>
>  err:
> -    vhost_vdpa_host_notifiers_uninit(dev, i);
> +    vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
>      return;
>  }
>
> --
> 2.34.1
>


