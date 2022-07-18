Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D1577E26
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 10:59:02 +0200 (CEST)
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDMaj-0007Es-RW
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 04:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDMXH-0002ZJ-Jn
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDMXF-00037x-MI
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658134525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCD3dNpwYGdwy6vxyMaFcIU2E6GduwM8PLHs5Z3W+kY=;
 b=BryYovX9O8/rZYkJW2YpIKmmGZOEOPY+XKi9Zcp/X7VqrmT9gB4VWQ9tnRYw4yTLdl0Ku0
 LSzuCmjXBJ4XVE+Gd4CExezszlGNWv9G1aKVPk0J4oVTc+yNpexY3acK+g1ZN8z0YVGnPz
 mC7FFEOIYW4JCWPyF+O25gJz8LGhKMs=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-iCk3sukqNrGmsSr2nLpdCw-1; Mon, 18 Jul 2022 04:55:23 -0400
X-MC-Unique: iCk3sukqNrGmsSr2nLpdCw-1
Received: by mail-pj1-f70.google.com with SMTP id
 a2-20020a17090a740200b001efaae60a57so6909996pjg.8
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 01:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mCD3dNpwYGdwy6vxyMaFcIU2E6GduwM8PLHs5Z3W+kY=;
 b=MkkNdtT9TGPNSgxUGZeO7DBexrDGSAlYlPnKlHHA4YsfGMAyUdOiS3D+w/42eCK6DE
 Bs7/yQPJLp5KjtnulOvMmQm+PUO2MZNJo8E8x54x6fshiaCFveiVu5vR2Dwrcxkeq1yb
 TtV7RaZeC/KoDOOkwD7W8tjq9PB8irShps+f+XOa8IuafDGq1NkjsKeSneOJYdnvPgbL
 5d0Q4Eo+OG6c9Ii0yQZY7XSzXqFE/EXyAOveU6Aj7kyOL7lq6kjXrZgGuryUYg5efTkA
 CFTWhjqRW89jfMwBkpC0uM0LvfYTk6GYOfEZ5tpvkcRLpNcUGM/WRT/E8X8bB66jYzSw
 rcQQ==
X-Gm-Message-State: AJIora9OptOkbhAoEKxqHeU3G9222o5BPQNmIHEP0H38BDRKinW4Os6v
 2mTH8qF06XQNlasJUiQfWCMVRHyPvYut2du4gwyglIw+e+1iod16pkMaFTN9xfqQOSR8X+dNU/G
 2WwFD/hQHkLtJCXw=
X-Received: by 2002:a17:903:2687:b0:16c:ca53:24db with SMTP id
 jf7-20020a170903268700b0016cca5324dbmr15857973plb.124.1658134522594; 
 Mon, 18 Jul 2022 01:55:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vehWWnCQ/95QM74vIRNkhkG1/Gy6USDIjAfGl8O/T86PgEiIoSUudthyEio4pkQWMsClpYkw==
X-Received: by 2002:a17:903:2687:b0:16c:ca53:24db with SMTP id
 jf7-20020a170903268700b0016cca5324dbmr15857948plb.124.1658134522329; 
 Mon, 18 Jul 2022 01:55:22 -0700 (PDT)
Received: from [10.72.13.213] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 x19-20020aa79413000000b0052b66304d54sm2193094pfo.74.2022.07.18.01.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 01:55:21 -0700 (PDT)
Message-ID: <70dc9f92-8aea-4698-57d8-1108d1cf7db2@redhat.com>
Date: Mon, 18 Jul 2022 16:55:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 11/12] vdpa: Add virtio-net mac address via CVQ at
 start
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
 <20220716113407.2730331-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220716113407.2730331-12-eperezma@redhat.com>
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
> This is needed so the destination vdpa device see the same state a the
> guest set in the source.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 52 insertions(+), 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 0183fce353..2873be2ba4 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -383,7 +383,7 @@ static virtio_net_ctrl_ack vhost_vdpa_net_svq_add(VhostShadowVirtqueue *svq,
>       return VIRTIO_NET_OK;
>   }
>   
> -static int vhost_vdpa_start_control_svq(struct vhost_vdpa *v)
> +static int vhost_vdpa_enable_control_svq(struct vhost_vdpa *v)
>   {
>       struct vhost_vring_state state = {
>           .index = v->dev->vq_index,
> @@ -395,6 +395,57 @@ static int vhost_vdpa_start_control_svq(struct vhost_vdpa *v)
>       return r < 0 ? -errno : r;
>   }
>   
> +static int vhost_vdpa_start_control_svq(struct vhost_vdpa *v)
> +{
> +
> +    VirtIONet *n = VIRTIO_NET(v->dev->vdev);
> +    uint64_t features = v->dev->vdev->host_features;
> +    VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, 0);
> +    VhostVDPAState *s = container_of(v, VhostVDPAState, vhost_vdpa);
> +    int r;
> +
> +    r = vhost_vdpa_enable_control_svq(v);
> +    if (unlikely(r < 0)) {
> +        return r;
> +    }
> +
> +    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> +        const struct virtio_net_ctrl_hdr ctrl = {
> +            .class = VIRTIO_NET_CTRL_MAC,
> +            .cmd = VIRTIO_NET_CTRL_MAC_ADDR_SET,
> +        };
> +        uint8_t mac[6];
> +        const struct iovec out[] = {
> +            {
> +                .iov_base = (void *)&ctrl,
> +                .iov_len = sizeof(ctrl),
> +            },{
> +                .iov_base = mac,
> +                .iov_len = sizeof(mac),
> +            },
> +        };
> +        struct iovec dev_buffers[2] = {
> +            { .iov_base = s->cvq_cmd_out_buffer },
> +            { .iov_base = s->cvq_cmd_in_buffer },
> +        };
> +        bool ok;
> +        virtio_net_ctrl_ack state;
> +
> +        ok = vhost_vdpa_net_cvq_map_sg(s, out, ARRAY_SIZE(out), dev_buffers);
> +        if (unlikely(!ok)) {
> +            return -1;
> +        }
> +
> +        memcpy(mac, n->mac, sizeof(mac));
> +        state = vhost_vdpa_net_svq_add(svq, dev_buffers);
> +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[0].iov_base);
> +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[1].iov_base);


Any reason we do per buffer unmap instead of the sg unmap here?

Thanks


> +        return state == VIRTIO_NET_OK ? 0 : 1;
> +    }
> +
> +    return 0;
> +}
> +
>   /**
>    * Do not forward commands not supported by SVQ. Otherwise, the device could
>    * accept it and qemu would not know how to update the device model.


