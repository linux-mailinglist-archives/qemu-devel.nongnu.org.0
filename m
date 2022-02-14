Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B634B401F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 04:12:35 +0100 (CET)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJRmz-0003cl-Qm
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 22:12:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJRki-00028w-2Q
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:10:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJRkd-00085O-Qo
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644808206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GgktKMqLPN0bb1K8KRW6e3QInjo7NN5WhSyFmI1GTew=;
 b=LdiQEfQ8ZmVdqPbpDBDGzssi8M2RLhogPBZ4RgJmHNL65yxNF+OGs+ipiBS6GTekz7FLvG
 yMNIRU1M+5aRUGwdutRLVH/vrGeNNJJQmW3lNeb7FWLiXe+LF5V3gWfKFPvYHMY9svuD5l
 bdOt1cEPtPmkhHBcfRdnaS9HIZwcn/o=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-9-Rpfh0bM3qhiCRsHpudSw-1; Sun, 13 Feb 2022 22:10:04 -0500
X-MC-Unique: 9-Rpfh0bM3qhiCRsHpudSw-1
Received: by mail-lf1-f70.google.com with SMTP id
 t25-20020a056512209900b004419802fb8aso4619372lfr.19
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 19:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GgktKMqLPN0bb1K8KRW6e3QInjo7NN5WhSyFmI1GTew=;
 b=IqIcCj1Jb+SMEpWzYMm7Le0qmxn9yrN0iZhd6shGyaCBpmy/h1utoUQUToLNR/ZkU5
 o8twtEncOlfcgM1ZhbjrShZGpU+9uDw5zJ/DTqZmM7U+lJN4QNFF/+xrilNuFLXC6y70
 MI5DU4KBVsctA2uYhsk6hQ1+JV5RR3TNDUo2FVniHW/N+4zhoXrBegHi+p53K38Utg8w
 tuSNrD3oJlWTKNJCk8t/l+gbM29paw3yczqiuDcoVvAy86PCx7zUxwq8BqVWWnvFdxRF
 OQz+QB00sFd/Fz0BXuI7wrAC3VfMrFirok2WVuj63ivrbtKIU+car9KBiTRQdo+4GC6r
 jDdA==
X-Gm-Message-State: AOAM530tva4sGvwZXmFzTA1+R+j8r9gEsWwpuU4BvCYBm5WaJRwP91Lo
 3eSHpRhehEYJ5YfYXVsjWYBRbHSQO15SZahgdUw4tETvnZlg3UPJP0vkRGiOEAwP6SHdomz8+1Y
 IjRNP1edPmYNAFhQ10qXwCoiSo1GDw+A=
X-Received: by 2002:a2e:a80c:: with SMTP id l12mr8033720ljq.107.1644808203444; 
 Sun, 13 Feb 2022 19:10:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzGoLt8EXckk6z89RSxwLhRt+EGeqcct+4vhXAjAL4doldJue3413jGpUMWmShs+syJvbvYRuV8invA72wv5I=
X-Received: by 2002:a2e:a80c:: with SMTP id l12mr8033709ljq.107.1644808203228; 
 Sun, 13 Feb 2022 19:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20220211170259.1388734-1-lvivier@redhat.com>
In-Reply-To: <20220211170259.1388734-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 14 Feb 2022 11:09:52 +0800
Message-ID: <CACGkMEt6CTS-L60t3YtyzDL626jmHcRTCaGOq6dHwBeg-Gir1w@mail.gmail.com>
Subject: Re: [PATCH] hw/virtio: vdpa: Fix leak of host-notifier memory-region
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

On Sat, Feb 12, 2022 at 1:03 AM Laurent Vivier <lvivier@redhat.com> wrote:
>
> If call virtio_queue_set_host_notifier_mr fails, should free
> host-notifier memory-region.
>
> This problem can trigger a coredump with some vDPA drivers (mlx5,
> but not with the vdpasim), if we unplug the virtio-net card from
> the guest after a stop/start.
>
> The same fix has been done for vhost-user:
>   1f89d3b91e3e ("hw/virtio: Fix leak of host-notifier memory-region")
>
> Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
> Cc: jasowang@redhat.com
> Resolves: https://bugzilla.redhat.com/2027208
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Cc: qemu-stable@nongnu.org
Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost-vdpa.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 04ea43704f5d..11f696468dc1 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -431,6 +431,7 @@ static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
>      g_free(name);
>
>      if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
> +        object_unparent(OBJECT(&n->mr));
>          munmap(addr, page_size);
>          goto err;
>      }
> --
> 2.34.1
>


