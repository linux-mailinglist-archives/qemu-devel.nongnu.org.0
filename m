Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0DA4C6209
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 05:01:13 +0100 (CET)
Received: from localhost ([::1]:57952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOXDk-0005ZX-NJ
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 23:01:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOXCW-0004sB-Q8
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 22:59:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOXCT-0001KN-N3
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 22:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646020792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/jZhvLabLMT1rZ80L7AA+Rt0fod5ZDmGFxBBMRWJZ0=;
 b=HArwrOTe63xmLec2N8YtXlbG8oQRDovjyhL8WsmPXig1rjUnFS7xmkRbbSzi18cHNvQJmJ
 QBALbRjscIbSvIcIqi3gcGpN7ij9RNkYpKO04R25X2xfGDj/I4g1PQsEiPoWIWJlFuxCI7
 O8yEfO881fkuCFNby2XRVJfy6J4EMPI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-IDseZQh7NYKCbNtoHZKolw-1; Sun, 27 Feb 2022 22:59:49 -0500
X-MC-Unique: IDseZQh7NYKCbNtoHZKolw-1
Received: by mail-pl1-f198.google.com with SMTP id
 x18-20020a170902b41200b0014fc2665bddso4061285plr.0
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 19:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R/jZhvLabLMT1rZ80L7AA+Rt0fod5ZDmGFxBBMRWJZ0=;
 b=s0TrHKMXKnSZcU66TovmMf//QihooJfOSdfLkdSpV+HxazwpMfxx8/ueKepkADoYBb
 obhnJG9zlEwx2S2Oak6qc5yp7r+THp1nv0fAFDaOD/koaWQzwVRfUA7kL4jS4xlHiEFC
 Ba00hZzpZ+ZODuIJyGnCl1xVXzRRQaZPVCEsqozYMCWhb5CtkqDVl/Lj6sl4iZTlSJXP
 6eymy05mKdZi9XIV8ARyL5dDPjXjZo8TzDREMNlnYZPzyQ91QHwGP549u6WGofH8gfan
 A4reoLK11nMpGHyy+yMzt2ySx050e6XQWrDtoMQp7gz8nXIjMLalCqGJcl1irExtZzIg
 qUUg==
X-Gm-Message-State: AOAM533IO9G3doRXC8IFld1Cx0c1CpxYgQYm9pfrRtlvYLrsVTLOiu0k
 Yte0mmjx2tpFyjZ1OxBvBTxSGTNn3rjplFLdRewmrF0tZrARXKU/KWAUmXCzcwfLKkJKWe8AjX7
 RbLwk//8tSul2W5s=
X-Received: by 2002:a17:902:cccc:b0:14e:e89c:c669 with SMTP id
 z12-20020a170902cccc00b0014ee89cc669mr18733736ple.58.1646020788252; 
 Sun, 27 Feb 2022 19:59:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxq0j23zg7yiWAAMMy1CXQ5lLLH79PSc02YMLOpfWDbUUog7gxdhyGKoRJVWp8QzaFFPWOqfA==
X-Received: by 2002:a17:902:cccc:b0:14e:e89c:c669 with SMTP id
 z12-20020a170902cccc00b0014ee89cc669mr18733698ple.58.1646020787931; 
 Sun, 27 Feb 2022 19:59:47 -0800 (PST)
Received: from [10.72.13.215] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a056a000b8100b004f111c21535sm11625722pfj.80.2022.02.27.19.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 19:59:47 -0800 (PST)
Message-ID: <2457e208-0898-0dee-39c5-551fe2acb0fd@redhat.com>
Date: Mon, 28 Feb 2022 11:59:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 06/14] vdpa: adapt vhost_ops callbacks to svq
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220227134111.3254066-7-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/27 下午9:41, Eugenio Pérez 写道:
> First half of the buffers forwarding part, preparing vhost-vdpa
> callbacks to SVQ to offer it. QEMU cannot enable it at this moment, so
> this is effectively dead code at the moment, but it helps to reduce
> patch size.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++------
>   1 file changed, 73 insertions(+), 11 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index d614c435f3..b2c4e92fcf 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -344,6 +344,16 @@ static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
>       return v->index != 0;
>   }
>   
> +static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
> +                                       uint64_t *features)
> +{
> +    int ret;
> +
> +    ret = vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
> +    trace_vhost_vdpa_get_features(dev, *features);
> +    return ret;
> +}
> +
>   static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>                                  Error **errp)
>   {
> @@ -356,7 +366,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>           return 0;
>       }
>   
> -    r = hdev->vhost_ops->vhost_get_features(hdev, &dev_features);
> +    r = vhost_vdpa_get_dev_features(hdev, &dev_features);
>       if (r != 0) {
>           error_setg_errno(errp, -r, "Can't get vdpa device features");
>           return r;
> @@ -583,12 +593,26 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
>   static int vhost_vdpa_set_features(struct vhost_dev *dev,
>                                      uint64_t features)
>   {
> +    struct vhost_vdpa *v = dev->opaque;
>       int ret;
>   
>       if (vhost_vdpa_one_time_request(dev)) {
>           return 0;
>       }
>   
> +    if (v->shadow_vqs_enabled) {
> +        uint64_t features_ok = features;
> +        bool ok;
> +
> +        ok = vhost_svq_valid_features(&features_ok);
> +        if (unlikely(!ok)) {
> +            error_report(
> +                "Invalid guest acked feature flag, acked: 0x%"
> +                PRIx64", ok: 0x%"PRIx64, features, features_ok);
> +            return -EINVAL;
> +        }
> +    }
> +
>       trace_vhost_vdpa_set_features(dev, features);
>       ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
>       if (ret) {
> @@ -735,6 +759,13 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>       return ret;
>    }
>   
> +static int vhost_vdpa_set_dev_vring_base(struct vhost_dev *dev,
> +                                         struct vhost_vring_state *ring)
> +{
> +    trace_vhost_vdpa_set_vring_base(dev, ring->index, ring->num);
> +    return vhost_vdpa_call(dev, VHOST_SET_VRING_BASE, ring);
> +}
> +
>   static int vhost_vdpa_set_vring_dev_kick(struct vhost_dev *dev,
>                                            struct vhost_vring_file *file)
>   {
> @@ -749,6 +780,18 @@ static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>   }
>   
> +static int vhost_vdpa_set_vring_dev_addr(struct vhost_dev *dev,
> +                                         struct vhost_vring_addr *addr)
> +{
> +    trace_vhost_vdpa_set_vring_addr(dev, addr->index, addr->flags,
> +                                addr->desc_user_addr, addr->used_user_addr,
> +                                addr->avail_user_addr,
> +                                addr->log_guest_addr);
> +
> +    return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
> +
> +}
> +
>   /**
>    * Set the shadow virtqueue descriptors to the device
>    *
> @@ -859,11 +902,17 @@ static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
>   static int vhost_vdpa_set_vring_addr(struct vhost_dev *dev,
>                                          struct vhost_vring_addr *addr)
>   {
> -    trace_vhost_vdpa_set_vring_addr(dev, addr->index, addr->flags,
> -                                    addr->desc_user_addr, addr->used_user_addr,
> -                                    addr->avail_user_addr,
> -                                    addr->log_guest_addr);
> -    return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
> +    struct vhost_vdpa *v = dev->opaque;
> +
> +    if (v->shadow_vqs_enabled) {
> +        /*
> +         * Device vring addr was set at device start. SVQ base is handled by
> +         * VirtQueue code.
> +         */
> +        return 0;
> +    }
> +
> +    return vhost_vdpa_set_vring_dev_addr(dev, addr);
>   }
>   
>   static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
> @@ -876,8 +925,17 @@ static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
>   static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
>                                          struct vhost_vring_state *ring)
>   {
> -    trace_vhost_vdpa_set_vring_base(dev, ring->index, ring->num);
> -    return vhost_vdpa_call(dev, VHOST_SET_VRING_BASE, ring);
> +    struct vhost_vdpa *v = dev->opaque;
> +
> +    if (v->shadow_vqs_enabled) {
> +        /*
> +         * Device vring base was set at device start. SVQ base is handled by
> +         * VirtQueue code.
> +         */
> +        return 0;
> +    }
> +
> +    return vhost_vdpa_set_dev_vring_base(dev, ring);
>   }
>   
>   static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
> @@ -924,10 +982,14 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>   static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                        uint64_t *features)
>   {
> -    int ret;
> +    struct vhost_vdpa *v = dev->opaque;
> +    int ret = vhost_vdpa_get_dev_features(dev, features);
> +
> +    if (ret == 0 && v->shadow_vqs_enabled) {
> +        /* Filter only features that SVQ can offer to guest */
> +        vhost_svq_valid_features(features);


I think it's better not silently clear features here (e.g the feature 
could be explicitly enabled via cli). This may give more troubles in the 
future cross vendor/backend live migration.

We can simple during vhost_vdpa init.

Thanks


> +    }
>   
> -    ret = vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
> -    trace_vhost_vdpa_get_features(dev, *features);
>       return ret;
>   }
>   


