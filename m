Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F1D571123
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:15:57 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7JU-0000AN-0r
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oB7FQ-0004zf-7k
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:11:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oB7FM-00033A-FU
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657599099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHsH8ukHRPJUe+OWKnDmolgpib6X0tGfBLgGRov1yaE=;
 b=fEyqkld4p6PLkKOBOtPhXZbBdY/70PnfRCL+ZuVpYXku9YKcm/Twx27BqylHMK3YLlz1sk
 N+WqBKItpBHwVD3+4a7c9KQj7xsEWko9VsI1FKcem4Hf334iKx1K4Wx6PuziluXalFrAS+
 fv5KHDe/aYV0Ikt5w+Cxg0NHjfg/A+0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-IZ6rliYiMRqR1kbjhgQNAQ-1; Tue, 12 Jul 2022 00:11:38 -0400
X-MC-Unique: IZ6rliYiMRqR1kbjhgQNAQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 q8-20020a17090311c800b0016a125c933fso4939744plh.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 21:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hHsH8ukHRPJUe+OWKnDmolgpib6X0tGfBLgGRov1yaE=;
 b=rtWZWz8fIrXXJ8RtNyCcj9q/zA/DPaSPWyCV4qw5uy/ggedcQColorMcuW5ycqnHLZ
 SdaIMhL9cOKrlDuCQ7UlkevukQ1vR7DrOPuKCXihANJJEvU68v0QUWygaH/bZIr+Qhra
 JXu4cMbjJ/3/A88AddWjouf+ZvAvy0YUz+fAJxxVTY5KGUpt+R8qiDf6fH2ToLOjjbau
 8OseCV0ryOcNu2e9nnwMynlh+PkM/JKxUx1wcV9aU8YLi+cZcxY7yH6sUYbpz4HF7OTF
 5gFRQMiIZKtogRTY1oVt1ezzf0hFvVX6ayoDGnCcxA4s+0cISWQDUkrOzBDJd9f4Tzgw
 m+Zg==
X-Gm-Message-State: AJIora+hInl2lZWD0Q9KFwloTY5KUXhUcG19U2Fri5ewM/fRUdLSoTnR
 L3UWdE1Xy3nGA9iaC9iDPevHXxEDHOG6MsI6rYKmtyO09eRU4KyRmkIuC84rDCuVHk2LnuSEpK5
 KQiU0yR3XG+ApDjE=
X-Received: by 2002:a63:d84c:0:b0:412:6729:fb1d with SMTP id
 k12-20020a63d84c000000b004126729fb1dmr19362597pgj.135.1657599097186; 
 Mon, 11 Jul 2022 21:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unva+16rL4YuzTK4VNV18qmC713/3GD8blMEY/m99lbs6HGjf+qm1dchCY6iu8QAMv2EcPxw==
X-Received: by 2002:a63:d84c:0:b0:412:6729:fb1d with SMTP id
 k12-20020a63d84c000000b004126729fb1dmr19362578pgj.135.1657599096957; 
 Mon, 11 Jul 2022 21:11:36 -0700 (PDT)
Received: from [10.72.12.111] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 x2-20020aa79562000000b00525521a288dsm5604383pfq.28.2022.07.11.21.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 21:11:36 -0700 (PDT)
Message-ID: <d44265d9-8310-9dfc-3d4d-be526d648049@redhat.com>
Date: Tue, 12 Jul 2022 12:11:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 19/23] vdpa: Extract get features part from
 vhost_vdpa_get_max_queue_pairs
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-20-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220706184008.1649478-20-eperezma@redhat.com>
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


在 2022/7/7 02:40, Eugenio Pérez 写道:
> To know the device features is needed for CVQ SVQ, so SVQ knows if it
> can handle all commands or not. Extract from
> vhost_vdpa_get_max_queue_pairs so we can reuse it.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   net/vhost-vdpa.c | 30 ++++++++++++++++++++----------
>   1 file changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index df1e69ee72..b0158f625e 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -219,20 +219,24 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>       return nc;
>   }
>   
> -static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
> +static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **errp)
> +{
> +    int ret = ioctl(fd, VHOST_GET_FEATURES, features);
> +    if (ret) {
> +        error_setg_errno(errp, errno,
> +                         "Fail to query features from vhost-vDPA device");
> +    }
> +    return ret;
> +}
> +
> +static int vhost_vdpa_get_max_queue_pairs(int fd, uint64_t features,
> +                                          int *has_cvq, Error **errp)
>   {
>       unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
>       g_autofree struct vhost_vdpa_config *config = NULL;
>       __virtio16 *max_queue_pairs;
> -    uint64_t features;
>       int ret;
>   
> -    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
> -    if (ret) {
> -        error_setg(errp, "Fail to query features from vhost-vDPA device");
> -        return ret;
> -    }
> -
>       if (features & (1 << VIRTIO_NET_F_CTRL_VQ)) {
>           *has_cvq = 1;
>       } else {
> @@ -262,10 +266,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>                           NetClientState *peer, Error **errp)
>   {
>       const NetdevVhostVDPAOptions *opts;
> +    uint64_t features;
>       int vdpa_device_fd;
>       g_autofree NetClientState **ncs = NULL;
>       NetClientState *nc;
> -    int queue_pairs, i, has_cvq = 0;
> +    int queue_pairs, r, i, has_cvq = 0;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>       opts = &netdev->u.vhost_vdpa;
> @@ -279,7 +284,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>           return -errno;
>       }
>   
> -    queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd,
> +    r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
> +    if (r) {
> +        return r;
> +    }
> +
> +    queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
>                                                    &has_cvq, errp);
>       if (queue_pairs < 0) {
>           qemu_close(vdpa_device_fd);


