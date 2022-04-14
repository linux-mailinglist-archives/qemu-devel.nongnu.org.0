Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849CA5004B9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 05:43:18 +0200 (CEST)
Received: from localhost ([::1]:37994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqO5-0008Kz-Kj
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 23:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqNB-0007ZX-Gj
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:42:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqN9-0003cH-Ux
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649907739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EEjqX75cumbD8s9fubouXAmLwyZK2PyVHxah6XsiXTs=;
 b=SYvMXRJrPOrcWVjQd3NCFGhFCCaJNp69gOMNt8MONGf0N+6Q9UHqzXAY1JTV3X4CHvBnXA
 UPOpy2uCR2dgudEXXhZ+3pQqBXx0LEXUPufXQadJP1wHz0IiY85DQwBXJMBEO99/B0c8vA
 FADW4poToyfhT0X/tN1b0YF6QbDTchY=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-tZOduXkjNnSQfPuEA-Db9Q-1; Wed, 13 Apr 2022 23:42:18 -0400
X-MC-Unique: tZOduXkjNnSQfPuEA-Db9Q-1
Received: by mail-pg1-f199.google.com with SMTP id
 e12-20020a63544c000000b003985d5888a8so2108265pgm.15
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 20:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EEjqX75cumbD8s9fubouXAmLwyZK2PyVHxah6XsiXTs=;
 b=GZdhjqyc1bOOYl7nKFdD7nlIGUNMFt7zMrnt1dGT+pIjDhk+ZU9gL5dbV7b78zIGFN
 RMYr2oiyoDu6v1RbCz3hBlz+n1vKzVrx+IKpCrzzZ9jFUthDn6/xAgB7XRKQgUmtXY+d
 rRcUV8U+ZU2w0BQKzsfpzaO5ZXvEY1HdJt52PTL5kttit+qbrm0WJDamCG1hdoJXPA6p
 woU4pNtJGxaEi15+1whBQ24jXzHCLjPMp05gS4wLW2UUuzXhAzb1+1ft4agA0PEU/VIC
 eSRQZEHQL4K0Zsv6sRwS0QszatwGpdE6V07AZrFHmLG5YN5iWSrq6DOiRhpvbSDTmwF2
 /0hQ==
X-Gm-Message-State: AOAM5322/VjXFwy3DbX60obdvCuubduHKHa+R/DPeoXacPzWYG9lYlr4
 kCDTvhwAGzr8kgVmS0hyJovjPBo9hJDaNBReKwCnO5iWtVmHcbcKPGZaQcz280GwG4/9liUDcAv
 e53VEJoLI9Aa+WmA=
X-Received: by 2002:a63:54c:0:b0:39d:a5ab:d797 with SMTP id
 73-20020a63054c000000b0039da5abd797mr712159pgf.102.1649907736996; 
 Wed, 13 Apr 2022 20:42:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRGxce36KALIthGMqUMOHAw53Xc5LyHT4Q4mecuEaWsmYdunNk4c6IG6QyDqm38hDrDuPSEw==
X-Received: by 2002:a63:54c:0:b0:39d:a5ab:d797 with SMTP id
 73-20020a63054c000000b0039da5abd797mr712141pgf.102.1649907736740; 
 Wed, 13 Apr 2022 20:42:16 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004fae885424dsm520579pfx.72.2022.04.13.20.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 20:42:16 -0700 (PDT)
Message-ID: <84ea79a3-30ab-31e1-35e6-aa63241a051d@redhat.com>
Date: Thu, 14 Apr 2022 11:42:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v5 06/23] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220408133415.1371760-1-eperezma@redhat.com>
 <20220408133415.1371760-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220408133415.1371760-7-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/8 21:33, Eugenio Pérez 写道:
> Finally offering the possibility to enable SVQ from the command line.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   qapi/net.json    |  9 ++++++++-
>   net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
>   2 files changed, 48 insertions(+), 9 deletions(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index b92f3f5fb4..92848e4362 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -445,12 +445,19 @@
>   # @queues: number of queues to be created for multiqueue vhost-vdpa
>   #          (default: 1)
>   #
> +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.1)
> +#         (default: false)
> +#
> +# Features:
> +# @unstable: Member @x-svq is experimental.
> +#
>   # Since: 5.1
>   ##
>   { 'struct': 'NetdevVhostVDPAOptions',
>     'data': {
>       '*vhostdev':     'str',
> -    '*queues':       'int' } }
> +    '*queues':       'int',
> +    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
>   
>   ##
>   # @NetClientDriver:
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 1e9fe47c03..def738998b 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -127,7 +127,11 @@ err_init:
>   static void vhost_vdpa_cleanup(NetClientState *nc)
>   {
>       VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_dev *dev = s->vhost_vdpa.dev;
>   
> +    if (dev && dev->vq_index + dev->nvqs == dev->vq_index_end) {
> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
> +    }
>       if (s->vhost_net) {
>           vhost_net_cleanup(s->vhost_net);
>           g_free(s->vhost_net);
> @@ -187,13 +191,23 @@ static NetClientInfo net_vhost_vdpa_info = {
>           .check_peer_type = vhost_vdpa_check_peer_type,
>   };
>   
> +static int vhost_vdpa_get_iova_range(int fd,
> +                                     struct vhost_vdpa_iova_range *iova_range)
> +{
> +    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> +
> +    return ret < 0 ? -errno : 0;
> +}
> +
>   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> -                                           const char *device,
> -                                           const char *name,
> -                                           int vdpa_device_fd,
> -                                           int queue_pair_index,
> -                                           int nvqs,
> -                                           bool is_datapath)
> +                                       const char *device,
> +                                       const char *name,
> +                                       int vdpa_device_fd,
> +                                       int queue_pair_index,
> +                                       int nvqs,
> +                                       bool is_datapath,


It's better not mix style changes with the logic changes.

Other looks fine.

Thanks


> +                                       bool svq,
> +                                       VhostIOVATree *iova_tree)
>   {
>       NetClientState *nc = NULL;
>       VhostVDPAState *s;
> @@ -211,6 +225,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>   
>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>       s->vhost_vdpa.index = queue_pair_index;
> +    s->vhost_vdpa.shadow_vqs_enabled = svq;
> +    s->vhost_vdpa.iova_tree = iova_tree;
>       ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
>       if (ret) {
>           qemu_del_net_client(nc);
> @@ -266,6 +282,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       g_autofree NetClientState **ncs = NULL;
>       NetClientState *nc;
>       int queue_pairs, i, has_cvq = 0;
> +    g_autoptr(VhostIOVATree) iova_tree = NULL;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>       opts = &netdev->u.vhost_vdpa;
> @@ -285,29 +302,44 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>           qemu_close(vdpa_device_fd);
>           return queue_pairs;
>       }
> +    if (opts->x_svq) {
> +        struct vhost_vdpa_iova_range iova_range;
> +
> +        if (has_cvq) {
> +            error_setg(errp, "vdpa svq does not work with cvq");
> +            goto err_svq;
> +        }
> +        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> +        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
> +    }
>   
>       ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
>   
>       for (i = 0; i < queue_pairs; i++) {
>           ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> -                                     vdpa_device_fd, i, 2, true);
> +                                     vdpa_device_fd, i, 2, true, opts->x_svq,
> +                                     iova_tree);
>           if (!ncs[i])
>               goto err;
>       }
>   
>       if (has_cvq) {
>           nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> -                                 vdpa_device_fd, i, 1, false);
> +                                 vdpa_device_fd, i, 1, false, opts->x_svq,
> +                                 iova_tree);
>           if (!nc)
>               goto err;
>       }
>   
> +    iova_tree = NULL;
>       return 0;
>   
>   err:
>       if (i) {
>           qemu_del_net_client(ncs[0]);
>       }
> +
> +err_svq:
>       qemu_close(vdpa_device_fd);
>   
>       return -1;


