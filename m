Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D5580A37
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 06:09:04 +0200 (CEST)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGBsV-00013e-61
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 00:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBqs-000873-6R
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBqo-00048D-Nj
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658808437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lq+QyVydaGPkH/hN+J2SKArk1VlJA75s86I5m3Gedxc=;
 b=jKbIcq25X2Pg8Z3gOU5gaE0sVVd3tQfxYjfxsBg+V/jKDnNuuVV8Kh8r5XzphX0iBSF5Yh
 J9pBsh/3wQe4lWTSy4Gr1boLtN9WgyL2l7m36y2dkyPFZby4b/wyUBlAH4oh+BsdBf9Vjm
 rFOQGr54GQksk3W9TwfH7dP3uZHwEOQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-ugOGAnkKNiySwx2SrD-5hQ-1; Tue, 26 Jul 2022 00:07:15 -0400
X-MC-Unique: ugOGAnkKNiySwx2SrD-5hQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 c12-20020a17090a8d0c00b001f20d603777so9433918pjo.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lq+QyVydaGPkH/hN+J2SKArk1VlJA75s86I5m3Gedxc=;
 b=jLTH6X1rLrg8SNDdGYYUbIgG+ouIVko8NHAQLXNLjG53h9cp2tY10o8smiUa3OmnOf
 hqHzoxxz34JBke/IXKIrSw9BLdBIQFyeJNB0KWxjfZDN5YMZqfCErgstFWJZf3fCsWIE
 L36WZmhvx/Kyb25WAzTm1k9CQ6fcub3HGtkNPRwWDcufcKP+/xTFlUxS6rvn4whNj4OH
 26eGpVCq5snSFopaBKDc5vxD1i9ku1wTpGp89QM3cT+XCjwvP4USXJrjmP0yDTErM+sq
 R6icYZ6NdYm68UTO79lemwvnkIhJGJowFvJXaJQNBxEmahl/zoRTzY990OOLZ0CRJV7v
 4vrg==
X-Gm-Message-State: AJIora/GJ3PsiHhddn9SkSDBb4CTbhUeZePlsSwhk3mIDVoMv39oAA3S
 8adTe1ra/l9NvuOZKSCaYfIvv35JWQ0l+9Wb3ITxdwWEuum2QvKnqjibbc5cNNy9sX4Ubo20lhR
 SqgMXiUimhvBgCpY=
X-Received: by 2002:a17:903:205:b0:16d:4417:8436 with SMTP id
 r5-20020a170903020500b0016d44178436mr15751616plh.109.1658808434649; 
 Mon, 25 Jul 2022 21:07:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1svEYuYGAa3XamYDqJu2szY7uC6Hz470onvvLYEsKjKDRE4/vsHH2dSF2G2gZsBQr/B1bjz5g==
X-Received: by 2002:a17:903:205:b0:16d:4417:8436 with SMTP id
 r5-20020a170903020500b0016d44178436mr15751587plh.109.1658808434280; 
 Mon, 25 Jul 2022 21:07:14 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 jf17-20020a170903269100b0016bf1ed3489sm10077540plb.143.2022.07.25.21.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 21:07:13 -0700 (PDT)
Message-ID: <3fd4d288-8db7-41f4-7e8b-0a8ef44c936f@redhat.com>
Date: Tue, 26 Jul 2022 12:07:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 09/16] vhost-user: enable/disable a single vring
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <46deff7d44ad806a4bfb9235e57b0d37d8cfa95c.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <46deff7d44ad806a4bfb9235e57b0d37d8cfa95c.1658141552.git.kangjie.xu@linux.alibaba.com>
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


在 2022/7/18 19:17, Kangjie Xu 写道:
> Implement the vhost_set_single_vring_enable, which is to enable or
> disable a single vring.
>
> The parameter wait_for_reply is added to help for some cases such as
> vq reset.
>
> Meanwhile, vhost_user_set_vring_enable() is refactored.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/vhost-user.c | 55 ++++++++++++++++++++++++++++++++++++------
>   1 file changed, 48 insertions(+), 7 deletions(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 75b8df21a4..5a80a415f0 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -267,6 +267,8 @@ struct scrub_regions {
>       int fd_idx;
>   };
>   
> +static int enforce_reply(struct vhost_dev *dev, const VhostUserMsg *msg);
> +
>   static bool ioeventfd_enabled(void)
>   {
>       return !kvm_enabled() || kvm_eventfds_enabled();
> @@ -1198,6 +1200,49 @@ static int vhost_user_set_vring_base(struct vhost_dev *dev,
>       return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
>   }
>   
> +
> +static int vhost_user_set_single_vring_enable(struct vhost_dev *dev,
> +                                              int index,
> +                                              int enable,
> +                                              bool wait_for_reply)
> +{
> +    int ret;
> +
> +    if (index < dev->vq_index || index >= dev->vq_index + dev->nvqs) {
> +        return -EINVAL;
> +    }
> +
> +    struct vhost_vring_state state = {
> +        .index = index,
> +        .num   = enable,
> +    };
> +
> +    VhostUserMsg msg = {
> +        .hdr.request = VHOST_USER_SET_VRING_ENABLE,
> +        .hdr.flags = VHOST_USER_VERSION,
> +        .payload.state = state,
> +        .hdr.size = sizeof(msg.payload.state),
> +    };
> +
> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
> +
> +    if (reply_supported && wait_for_reply) {
> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
> +    }


Do we need to fail if !realy_supported && wait_for_reply?

Thanks



> +
> +    ret = vhost_user_write(dev, &msg, NULL, 0);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    if (wait_for_reply) {
> +        return enforce_reply(dev, &msg);
> +    }
> +
> +    return ret;
> +}
> +
>   static int vhost_user_set_vring_enable(struct vhost_dev *dev, int enable)
>   {
>       int i;
> @@ -1207,13 +1252,8 @@ static int vhost_user_set_vring_enable(struct vhost_dev *dev, int enable)
>       }
>   
>       for (i = 0; i < dev->nvqs; ++i) {
> -        int ret;
> -        struct vhost_vring_state state = {
> -            .index = dev->vq_index + i,
> -            .num   = enable,
> -        };
> -
> -        ret = vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE, &state);
> +        int ret = vhost_user_set_single_vring_enable(dev, dev->vq_index + i,
> +                                                     enable, false);
>           if (ret < 0) {
>               /*
>                * Restoring the previous state is likely infeasible, as well as
> @@ -2627,6 +2667,7 @@ const VhostOps user_ops = {
>           .vhost_set_owner = vhost_user_set_owner,
>           .vhost_reset_device = vhost_user_reset_device,
>           .vhost_get_vq_index = vhost_user_get_vq_index,
> +        .vhost_set_single_vring_enable = vhost_user_set_single_vring_enable,
>           .vhost_set_vring_enable = vhost_user_set_vring_enable,
>           .vhost_requires_shm_log = vhost_user_requires_shm_log,
>           .vhost_migration_done = vhost_user_migration_done,


