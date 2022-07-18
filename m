Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9190577E15
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 10:56:54 +0200 (CEST)
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDMYg-0004JW-1i
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 04:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDMVa-0007ZN-Mq
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:53:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDMVY-0002cV-Qy
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658134420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+C0aAASlRvX5iLKaD2zrL+QvGY8arL1cvKxCLTEqp+U=;
 b=VfmyJlLxFMzGxrjsTl2k67AFiH17E9VyRn2hJG5VpmpMtS1cQugUlzA+mvjt6X/pZZgwOm
 OLJ1fA7ecnVmkOO8S262eNed6uRB3I5DFcNn5chJEFr6vpCDhH5rME3pqdTP2/UFsVc0EL
 bllRiAxlFQ1CWEEyZxhi4bFVYv8CjPA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-EUFcCqhdP-K3UiH8V6wjwQ-1; Mon, 18 Jul 2022 04:53:38 -0400
X-MC-Unique: EUFcCqhdP-K3UiH8V6wjwQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 1-20020a17090a190100b001f05565f004so3859401pjg.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 01:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+C0aAASlRvX5iLKaD2zrL+QvGY8arL1cvKxCLTEqp+U=;
 b=qtPrj5jKo07T+yztW3NSCFUITdaVdPbla1wumwI3rf+0wApIKqcC8f2FzQerIbcuY8
 v1v19a/4C+ZslGHHH1+qJuss7FE7mxRMVsBDYVDGP06rN9IqLLTQUNz4UCTI1VyyQwIN
 OFLF1g530sXkGuW43w8yjfY4Rr0Aojn4XN2iua7o25kJ1jIxb7DIPPRz9YHj8Eijmn/4
 tM1QdRCHbj0RnMcXz6H+a/tfe3e21I/EyZqgyK+fn5zPvhSGsKL9msfEJHcOT4EEc5We
 WjkZkcd3KbL8x1ja0qUgDX0pe+U4k0u5lc7MgQs39lX+naPJUfuj+/jluJDeoResxkGS
 2Vyw==
X-Gm-Message-State: AJIora90Oq05msu6nNw1DDbngBGiwlpjYnauN8ZKqZTu6VJ2c7J8DijB
 GB3PZKibOA/siziMJb4EpikJ56usjaon0rrwjjyjZGl+lFIkZnkkq8ozwN12K9I9BqMJSdH4BGt
 Pb/I6Niz5mxgmvqQ=
X-Received: by 2002:a17:902:d4ce:b0:16c:3d34:fdbe with SMTP id
 o14-20020a170902d4ce00b0016c3d34fdbemr27874795plg.15.1658134417691; 
 Mon, 18 Jul 2022 01:53:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sub3kT7ZOpzzRPyUjxbgrA/q6CXf0MhW7SzipyaX736uvEITFV9h4WMHYRVGGc503jBXgMHQ==
X-Received: by 2002:a17:902:d4ce:b0:16c:3d34:fdbe with SMTP id
 o14-20020a170902d4ce00b0016c3d34fdbemr27874766plg.15.1658134417393; 
 Mon, 18 Jul 2022 01:53:37 -0700 (PDT)
Received: from [10.72.13.213] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a63de54000000b0041173d92b35sm7507880pgi.81.2022.07.18.01.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 01:53:36 -0700 (PDT)
Message-ID: <56637ea3-1875-9cd4-d455-9060309b8e3b@redhat.com>
Date: Mon, 18 Jul 2022 16:53:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 09/12] vdpa: Extract vhost_vdpa_net_svq_add from
 vhost_vdpa_net_handle_ctrl_avail
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gautam Dawar <gdawar@xilinx.com>
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220716113407.2730331-10-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/7/16 19:34, Eugenio Pérez 写道:
> So we can reuse to inject state messages.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 89 +++++++++++++++++++++++++++---------------------
>   1 file changed, 51 insertions(+), 38 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 211bd0468b..aaae51a778 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -334,6 +334,54 @@ static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
>       return true;
>   }
>   
> +static virtio_net_ctrl_ack vhost_vdpa_net_svq_add(VhostShadowVirtqueue *svq,
> +                                               const struct iovec *dev_buffers)


The name should be tweaked since it is used only for cvq.


> +{
> +    /* in buffer used for device model */
> +    virtio_net_ctrl_ack status;
> +    const struct iovec in = {
> +        .iov_base = &status,
> +        .iov_len = sizeof(status),
> +    };
> +    size_t dev_written;
> +    int r;
> +    void *unused = (void *)1;
> +
> +    r = vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, unused);
> +    if (unlikely(r != 0)) {
> +        if (unlikely(r == -ENOSPC)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
> +                          __func__);
> +        }
> +        return VIRTIO_NET_ERR;
> +    }
> +
> +    /*
> +     * We can poll here since we've had BQL from the time we sent the
> +     * descriptor. Also, we need to take the answer before SVQ pulls by itself,
> +     * when BQL is released
> +     */


This reminds me that, do we need a upper limit of the time on the 
polling here. (Avoid taking BQL for too long time).

Thanks


> +    dev_written = vhost_svq_poll(svq);
> +    if (unlikely(dev_written < sizeof(status))) {
> +        error_report("Insufficient written data (%zu)", dev_written);
> +        return VIRTIO_NET_ERR;
> +    }
> +
> +    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
> +    if (status != VIRTIO_NET_OK) {
> +        return VIRTIO_NET_ERR;
> +    }
> +
> +    status = VIRTIO_NET_ERR;
> +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
> +    if (status != VIRTIO_NET_OK) {
> +        error_report("Bad CVQ processing in model");
> +        return VIRTIO_NET_ERR;
> +    }
> +
> +    return VIRTIO_NET_OK;
> +}
> +
>   static int vhost_vdpa_start_control_svq(struct vhost_vdpa *v)
>   {
>       struct vhost_vring_state state = {
> @@ -392,19 +440,13 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
>                                               void *opaque)
>   {
>       VhostVDPAState *s = opaque;
> -    size_t in_len, dev_written;
> +    size_t in_len;
>       virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
>       /* out and in buffers sent to the device */
>       struct iovec dev_buffers[2] = {
>           { .iov_base = s->cvq_cmd_out_buffer },
>           { .iov_base = s->cvq_cmd_in_buffer },
>       };
> -    /* in buffer used for device model */
> -    const struct iovec in = {
> -        .iov_base = &status,
> -        .iov_len = sizeof(status),
> -    };
> -    int r;
>       bool ok;
>   
>       ok = vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
> @@ -417,36 +459,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
>           goto out;
>       }
>   
> -    r = vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, elem);
> -    if (unlikely(r != 0)) {
> -        if (unlikely(r == -ENOSPC)) {
> -            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
> -                          __func__);
> -        }
> -        goto out;
> -    }
> -
> -    /*
> -     * We can poll here since we've had BQL from the time we sent the
> -     * descriptor. Also, we need to take the answer before SVQ pulls by itself,
> -     * when BQL is released
> -     */
> -    dev_written = vhost_svq_poll(svq);
> -    if (unlikely(dev_written < sizeof(status))) {
> -        error_report("Insufficient written data (%zu)", dev_written);
> -        goto out;
> -    }
> -
> -    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
> -    if (status != VIRTIO_NET_OK) {
> -        goto out;
> -    }
> -
> -    status = VIRTIO_NET_ERR;
> -    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
> -    if (status != VIRTIO_NET_OK) {
> -        error_report("Bad CVQ processing in model");
> -    }
> +    status = vhost_vdpa_net_svq_add(svq, dev_buffers);
>   
>   out:
>       in_len = iov_from_buf(elem->in_sg, elem->in_num, 0, &status,
> @@ -462,7 +475,7 @@ out:
>       if (dev_buffers[1].iov_base) {
>           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].iov_base);
>       }
> -    return r;
> +    return status == VIRTIO_NET_OK ? 0 : 1;
>   }
>   
>   static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {


