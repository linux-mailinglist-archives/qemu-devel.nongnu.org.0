Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0A25809AC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 04:54:01 +0200 (CEST)
Received: from localhost ([::1]:34562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGAhr-0008V6-KR
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 22:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGAex-0006Mn-25
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 22:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGAet-0001zQ-6o
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 22:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658803852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4OyTWDPf99wUWao15KfntbHwx+2BmkkkATqA6p8C6I=;
 b=ZU0+Ba2Hv2uhDqqF2ozHqiOCIwsYSoJwFvcleNjU3Q6DVvvXaIDMxvxFY0drUfmsJ56zuQ
 Y3ClWc7xXoVlO9FtAHldAxGWbFMdgCD1Elc+0IIniL25+xY898o/r9DRK0YEEsWqGU9rgg
 aY4mjBaB6NiO3hnm4nSN5wcFy5vX/to=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-MtKxXvCjPFilFYguqLo4lg-1; Mon, 25 Jul 2022 22:50:50 -0400
X-MC-Unique: MtKxXvCjPFilFYguqLo4lg-1
Received: by mail-pl1-f198.google.com with SMTP id
 u4-20020a170902e5c400b0016d6a70a282so3237926plf.10
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 19:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B4OyTWDPf99wUWao15KfntbHwx+2BmkkkATqA6p8C6I=;
 b=v6TSuJZFXc0xe/rBVeOaRE+7V1Jq3UVeTYFwETKuXr/XCTbcu74/O5kej7yv4nF3XP
 nOo9lvwL9gnsoLgaM6FR4iyhZILjpb0SFX99sT2ullWmrDnhzwb7eRQIqfmyy9qUQBZp
 GX/vcY9wloII7U7tO5uq3NcrBZrISSBe9wVyHMq+lW4/6nKvGsksd3Mmu3XQ/mHW3o+7
 AYoFALYkks1XhsYQeUaKWMAkA9taFfjqB16J+D8rHKy2rtVDhNTapb4bgFISr3Mei61g
 YbCq7w0wB7sbk2Iknetpgxxqj1+D5JaZiC+PeR8B5EAGfpc3P4MZwcbZ/cTwjg1N4cpN
 +0+Q==
X-Gm-Message-State: AJIora+ztSqZNtOoJiLEdA1fELBwS7oevi2sUL3Ql2uy2mI4IVOVMrlc
 afN7I0V4CFsL63LrDCPfNimjbPjTDPETT7PqQ9858HGTbmV7AksGngDYon13rBnt9g3rEY4teuV
 BZl1zVqR1/u6dGn4=
X-Received: by 2002:a05:6a00:b8b:b0:51c:2487:57b5 with SMTP id
 g11-20020a056a000b8b00b0051c248757b5mr15331091pfj.56.1658803849326; 
 Mon, 25 Jul 2022 19:50:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tOqIw+fPoD8FEeOWoKCxtJLFDuzAVw3vHmhuanxb7kg4iqOpddftKxdB019nZDm7LxyzZDRQ==
X-Received: by 2002:a05:6a00:b8b:b0:51c:2487:57b5 with SMTP id
 g11-20020a056a000b8b00b0051c248757b5mr15331058pfj.56.1658803849026; 
 Mon, 25 Jul 2022 19:50:49 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a170902ab9000b0016d2d2c7df1sm9983338plr.188.2022.07.25.19.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 19:50:48 -0700 (PDT)
Message-ID: <2f8cb2fd-9aaf-3cd6-7068-575470c63f23@redhat.com>
Date: Tue, 26 Jul 2022 10:50:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/7] vdpa: Extract vhost_vdpa_net_cvq_add from
 vhost_vdpa_net_handle_ctrl_avail
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand
 <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cornelia Huck
 <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
References: <20220722111245.3403062-1-eperezma@redhat.com>
 <20220722111245.3403062-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220722111245.3403062-3-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


在 2022/7/22 19:12, Eugenio Pérez 写道:
> So we can reuse to inject state messages.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 74 ++++++++++++++++++++++++++++++------------------
>   1 file changed, 47 insertions(+), 27 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 6abad276a6..1b82ac2e07 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -334,6 +334,46 @@ static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
>       return true;
>   }
>   
> +static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(VhostShadowVirtqueue *svq,
> +                                               const struct iovec *dev_buffers)


Let's make this support any layout by accepting in/out sg.


> +{
> +    /* in buffer used for device model */
> +    virtio_net_ctrl_ack status;
> +    size_t dev_written;
> +    int r;
> +
> +    /*
> +     * Add a fake non-NULL VirtQueueElement since we'll remove before SVQ
> +     * event loop can get it.
> +     */
> +    r = vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, (void *)1);


I'd suggest to avoid the trick like (void *)1, which is usually a hint 
of the defect of the API.

We can either:

1) make vhost_svq_get() check ndescs instead of elem

or

2) simple pass sg

Thanks


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
> +    return VIRTIO_NET_OK;
> +}
> +
>   /**
>    * Do not forward commands not supported by SVQ. Otherwise, the device could
>    * accept it and qemu would not know how to update the device model.
> @@ -380,19 +420,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
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
> +    /* in buffer seen by virtio-net device model */
>       const struct iovec in = {
>           .iov_base = &status,
>           .iov_len = sizeof(status),
>       };
> -    int r = -EINVAL;
>       bool ok;
>   
>       ok = vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
> @@ -405,35 +444,16 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
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
> +    status = vhost_vdpa_net_cvq_add(svq, dev_buffers);
>       if (status != VIRTIO_NET_OK) {
>           goto out;
>       }
>   
>       status = VIRTIO_NET_ERR;
> -    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
> -    if (status != VIRTIO_NET_OK) {
> +    in_len = virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
> +    if (in_len != sizeof(status) || status != VIRTIO_NET_OK) {
>           error_report("Bad CVQ processing in model");
> +        return VIRTIO_NET_ERR;
>       }
>   
>   out:
> @@ -450,7 +470,7 @@ out:
>       if (dev_buffers[1].iov_base) {
>           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].iov_base);
>       }
> -    return r;
> +    return status == VIRTIO_NET_OK ? 0 : 1;
>   }
>   
>   static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {


