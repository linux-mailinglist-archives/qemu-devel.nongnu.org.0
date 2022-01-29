Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04C94A2CBD
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 09:11:17 +0100 (CET)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDipI-0001bk-Kh
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 03:11:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDikO-0007rT-AT
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 03:06:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDikL-00049e-MK
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 03:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643443568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m18Lyfi5XZgrFQHudZavcCK/JJKhyYgzVv8UrJDPYFg=;
 b=hs2u5E7EejtfuZKqQq2xb0PJ6DwHviwGNWtQyrPYFVYkYNRkV4fd2X0HhoEWaaBYvW6smo
 R3sdLDKMuva+1eV/4NsVB13JeqHOR8Jo6t53Um13GD3U7hfBDY0/QqhbcP3IpRwpKmfEZE
 Ghr/bpp3WmxHMF6pUFxSAP7Plqk1TV0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-msvj5j3SMieHZIMa7zOGgQ-1; Sat, 29 Jan 2022 03:06:07 -0500
X-MC-Unique: msvj5j3SMieHZIMa7zOGgQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 o72-20020a17090a0a4e00b001b4e5b5b6c0so5224870pjo.5
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 00:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m18Lyfi5XZgrFQHudZavcCK/JJKhyYgzVv8UrJDPYFg=;
 b=hHlOpGRu+uycj4nTaOU5leYIdYJ5jPSgDAN7Bh/yxWey0+ZqJ2656aItOfJ3Arb37m
 EGX+cQNwHmKhRhttFsEYqlTHTxoZGLjozwjsM7oJjEBTp1xC2faB24dLRgKcyMn1LIwx
 YKw+jLp8G1jcz60OmOpRtrL4m6+546F3M0L8IYRHPJvfy3/H30ItZJlng2+vM8ctYuxL
 O2pDFNN0V8p7UHcWYF43+2EUPssnRD9byS5GC1G0aN/GAPWHnYnPXeLr7jy36Imp9hUY
 gcWb+sN7TVFtlO1D3WWD1Achl9hNKE2dOzXMirYIecZ190ib59zC0cN7KOnGneq8xSjS
 tQhw==
X-Gm-Message-State: AOAM5303tBFIGFciep+oh+2M+zIZm75SO43JRv8TFZC99HC8/q11FxBa
 qqXZdyOfS5jKTStmO5yrJOqMyGQSmrFRLsyfwjlPXCc+WR9DFOkKVWRVufpW4otfGZUlHsnVifY
 qoor6mmb4zSYa3tM=
X-Received: by 2002:a05:6a00:b85:: with SMTP id
 g5mr11772673pfj.56.1643443565998; 
 Sat, 29 Jan 2022 00:06:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXku+9gZRmvlQdHa2a5m7Cq9TWfUZ7rERC50OfbZwsYoGbEGc7yF4LbQc5axpPXDwqG3xsOA==
X-Received: by 2002:a05:6a00:b85:: with SMTP id
 g5mr11772635pfj.56.1643443565722; 
 Sat, 29 Jan 2022 00:06:05 -0800 (PST)
Received: from [10.72.12.112] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b24sm8416040pgs.1.2022.01.29.00.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 00:06:05 -0800 (PST)
Message-ID: <cbfbd909-4ee8-8ad2-effd-4b9f60270581@redhat.com>
Date: Sat, 29 Jan 2022 16:05:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 09/31] vhost-vdpa: Take into account SVQ in
 vhost_vdpa_set_vring_call
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-10-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/22 上午4:27, Eugenio Pérez 写道:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 18de14f0fb..029f98feee 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -687,13 +687,29 @@ static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
>       }
>   }
>   
> -static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
> -                                       struct vhost_vring_file *file)
> +static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
> +                                         struct vhost_vring_file *file)
>   {
>       trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>   }
>   
> +static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
> +                                     struct vhost_vring_file *file)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +
> +    if (v->shadow_vqs_enabled) {
> +        int vdpa_idx = vhost_vdpa_get_vq_index(dev, file->index);
> +        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
> +
> +        vhost_svq_set_guest_call_notifier(svq, file->fd);


Two questions here (had similar questions for vring kick):

1) Any reason that we setup the eventfd for vhost-vdpa in 
vhost_vdpa_svq_setup() not here?

2) The call could be disabled by using -1 as the fd, I don't see any 
code to deal with that.

Thanks


> +        return 0;
> +    } else {
> +        return vhost_vdpa_set_vring_dev_call(dev, file);
> +    }
> +}
> +
>   /**
>    * Set shadow virtqueue descriptors to the device
>    *


