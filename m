Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C259D166
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 08:43:01 +0200 (CEST)
Received: from localhost ([::1]:45406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQNcq-0006sZ-L7
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 02:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNTn-0002Ij-Kn
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:33:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNTh-0003f9-S5
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661236412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgUrJIQHsctlU5jUXDyk+zJc6lV/w7ATiGXuzf7HXio=;
 b=aL+3f4oF2ZGPw+GaDvdmpErwB900vecEIlUH1XSuArkVUSrHLG68x4V8Nf9yta4Cz0CSOQ
 k5uV6JnTFjC9rwFCE2yuBwYJm5KsJ4ISxlPsjlWD1Tq9cOXq07KG0VGTlmuG786XQbL7/N
 BKmnxInu+ag5FfseNYsLbnNNEHEU88c=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-0sH70f8MPMW4sSftdXAE-g-1; Tue, 23 Aug 2022 02:33:31 -0400
X-MC-Unique: 0sH70f8MPMW4sSftdXAE-g-1
Received: by mail-pl1-f197.google.com with SMTP id
 u14-20020a17090341ce00b00172f000e493so2741497ple.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 23:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=wgUrJIQHsctlU5jUXDyk+zJc6lV/w7ATiGXuzf7HXio=;
 b=4RfOJO2OI4hJ+8ZdSN4HZYK+9XywQcNZFGWXDTB/DZiPwYbEqdMCHH32w0yzw7HUez
 VLmDWVJG7bubO21UhoYKk4YP4W1ZRr+09QbB4aFzgqFwU+UDzg8VQa5o37+YiO2gz5cD
 1xmp0KTfNS+GvNEHrZj0wIfzGrsJnaCIkTH6xJ1E4ah/aLcxQc0rb64ClVWPxyX5qFcT
 t0wSBIIRY+QZsTbL1HLX0VZVfrzqxTJWyKgXiPjyfixo1nyvZSvKTonD+/mfLxnzH8+C
 w+YoTDhjP+8KjKKyTWKxVUGGqf4dM1busFb9G091eRy07cPqi2lLl0D80jieeIoKE6bG
 SgcA==
X-Gm-Message-State: ACgBeo1XE4Kmrkfp992n0Wq32APo+mBri9pRKCdva7+fAznCuwrSrDuM
 z1JhIwhXOEwCo1o4lAc33aXFBuAt3KMAe1nyXJ6PpCanKuOK1HPUYtMAISN5qLgbKnPSPOLtpAO
 QqAOQxoNZ201xBqY=
X-Received: by 2002:a17:903:11c9:b0:172:6ea1:b728 with SMTP id
 q9-20020a17090311c900b001726ea1b728mr23350660plh.95.1661236410520; 
 Mon, 22 Aug 2022 23:33:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7vlYJXJlsFA/HvVe/QOgp5brn1BZR+JgoUDqyWe6Tmn0uhAhjj65IOO80mtCbrrYdnMECtcw==
X-Received: by 2002:a17:903:11c9:b0:172:6ea1:b728 with SMTP id
 q9-20020a17090311c900b001726ea1b728mr23350641plh.95.1661236410193; 
 Mon, 22 Aug 2022 23:33:30 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 rm10-20020a17090b3eca00b001faee47021dsm355939pjb.45.2022.08.22.23.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 23:33:29 -0700 (PDT)
Message-ID: <cbd28116-8444-0054-4c95-dad7f54c61b6@redhat.com>
Date: Tue, 23 Aug 2022 14:33:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 5/7] vdpa: Make SVQ vring unmapping return void
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220819165357.3591965-1-eperezma@redhat.com>
 <20220819165357.3591965-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220819165357.3591965-6-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/8/20 00:53, Eugenio Pérez 写道:
> Nothing actually reads the return value, but an error in cleaning some
> entries could cause device stop to abort, making a restart impossible.
> Better ignore explicitely the return value.
>
> Reported-by: Lei Yang <leiyang@redhat.com>
> Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/vhost-vdpa.c | 32 ++++++++++----------------------
>   1 file changed, 10 insertions(+), 22 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 943799c17c..07d00f5284 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -884,7 +884,7 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
>   /**
>    * Unmap a SVQ area in the device
>    */
> -static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
> +static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
>                                         const DMAMap *needle)
>   {
>       const DMAMap *result = vhost_iova_tree_find_iova(v->iova_tree, needle);
> @@ -893,37 +893,32 @@ static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
>   
>       if (unlikely(!result)) {
>           error_report("Unable to find SVQ address to unmap");
> -        return false;
> +        return;
>       }
>   
>       size = ROUND_UP(result->size, qemu_real_host_page_size());
>       r = vhost_vdpa_dma_unmap(v, result->iova, size);
>       if (unlikely(r < 0)) {
> -        return false;
> +        return;
>       }
>   
>       vhost_iova_tree_remove(v->iova_tree, result);
> -    return 0;
>   }
>   
> -static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
> +static void vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
>                                          const VhostShadowVirtqueue *svq)
>   {
>       DMAMap needle = {};
>       struct vhost_vdpa *v = dev->opaque;
>       struct vhost_vring_addr svq_addr;
> -    bool ok;
>   
>       vhost_svq_get_vring_addr(svq, &svq_addr);
>   
>       needle.translated_addr = svq_addr.desc_user_addr;
> -    ok = vhost_vdpa_svq_unmap_ring(v, &needle);
> -    if (unlikely(!ok)) {
> -        return false;
> -    }
> +    vhost_vdpa_svq_unmap_ring(v, &needle);
>   
>       needle.translated_addr = svq_addr.used_user_addr;
> -    return vhost_vdpa_svq_unmap_ring(v, &needle);
> +    vhost_vdpa_svq_unmap_ring(v, &needle);
>   }
>   
>   /**
> @@ -1094,26 +1089,22 @@ err:
>       return false;
>   }
>   
> -static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
> +static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
>   {
>       struct vhost_vdpa *v = dev->opaque;
>   
>       if (!v->shadow_vqs) {
> -        return true;
> +        return;
>       }
>   
>       for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
>           VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
> -        bool ok = vhost_vdpa_svq_unmap_rings(dev, svq);
> -        if (unlikely(!ok)) {
> -            return false;
> -        }
> +        vhost_vdpa_svq_unmap_rings(dev, svq);
>       }
>   
>       if (v->migration_blocker) {
>           migrate_del_blocker(v->migration_blocker);
>       }
> -    return true;
>   }
>   
>   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> @@ -1130,10 +1121,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>           }
>           vhost_vdpa_set_vring_ready(dev);
>       } else {
> -        ok = vhost_vdpa_svqs_stop(dev);
> -        if (unlikely(!ok)) {
> -            return -1;
> -        }
> +        vhost_vdpa_svqs_stop(dev);
>           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>       }
>   


