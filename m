Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CE9500583
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 07:36:13 +0200 (CEST)
Received: from localhost ([::1]:44190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nes9M-0003J1-8H
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 01:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nes60-0001uC-Ca
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 01:32:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nes5x-00045d-Dt
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 01:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649914358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8pXmCMZxXZt0E1Gc/xkd79fNAlgWVXQp01FuY47Ck8k=;
 b=dtDQmw6poK8Okr9wGGCx/rkHdRD6A57tO/ogQjUqOhqL9prqu/dq6nDWH6Yt4OxChD17eu
 vV/BmJPPERG26HIle9DtbSKiwrRY/AvgCb3PDuUkbuGfTGhiAV1w9fLMWJZFKxoU6lJhiO
 rGKkTkQMegTeSRgE6lgfBPu6dWr1li4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-egOJJt4IOxGpzOHy03U1PQ-1; Thu, 14 Apr 2022 01:32:37 -0400
X-MC-Unique: egOJJt4IOxGpzOHy03U1PQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 j17-20020a62b611000000b004fa6338bd77so2542830pff.10
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 22:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8pXmCMZxXZt0E1Gc/xkd79fNAlgWVXQp01FuY47Ck8k=;
 b=vbhYbhwYDssvFPdE7VuPp8O4CqF2FttrRFjXZ8EsKdA9B/3WJg31lNTgZrtxf6qv0R
 7mkKWGyTSg1hMbtcELbeHvOLTX4gaLBQqywYTwrh3emcRoNJI9ygm1HUbo55EIgMWlGs
 IZlI5XCVemAUqsa8ltLXbehJzoFTcILdwEWMY1AU7WeYwtlMWvjXrvT5G4tpksc0BWIB
 XGPY5ETuCD1PXUzGaHjFQHqtA7MQmidQB5C/d6HRLsRlL6hDHPC2o4vNihImdMsGgLWO
 qde1Ofb79uNM3XXYmATS6cvL7p7Dyms2woCTOFiM91C1nkCwlo39nqwao9/Iqfssx+d1
 Xb9g==
X-Gm-Message-State: AOAM530/f4Pr47ZDNJHbqbcrZGtYK0gG6TYgXcptNgccnKdOhDWpSaVz
 ntCH71w0u/5l9Rv75Cg7ySquV0vFraH98P5tEmlzIC67igLgLg4e57efsXiKoUty8Pwe5hyDGhB
 K9i2zLEkpl2AldpM=
X-Received: by 2002:a17:902:c405:b0:158:63be:1776 with SMTP id
 k5-20020a170902c40500b0015863be1776mr18301383plk.107.1649914356088; 
 Wed, 13 Apr 2022 22:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvJm7ZXBCeJkp7Y4ht2ye3GQaZ/wX7Yg+oFDKh1kQUHiB7Z1JjOTDgQt9SzNQD849dzcbhiw==
X-Received: by 2002:a17:902:c405:b0:158:63be:1776 with SMTP id
 k5-20020a170902c40500b0015863be1776mr18301359plk.107.1649914355774; 
 Wed, 13 Apr 2022 22:32:35 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a056a00218600b004f65315bb37sm845263pfi.13.2022.04.13.22.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 22:32:34 -0700 (PDT)
Message-ID: <a0f3e6dd-f32c-257b-694b-7592ae35ef2f@redhat.com>
Date: Thu, 14 Apr 2022 13:32:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v7 08/25] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-9-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220413163206.1958254-9-eperezma@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/14 00:31, Eugenio Pérez 写道:
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
> index 1e9fe47c03..9261101af2 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -128,6 +128,7 @@ static void vhost_vdpa_cleanup(NetClientState *nc)
>   {
>       VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>   
> +    g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_release);
>       if (s->vhost_net) {
>           vhost_net_cleanup(s->vhost_net);
>           g_free(s->vhost_net);
> @@ -187,13 +188,23 @@ static NetClientInfo net_vhost_vdpa_info = {
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


It's better not mix style changes here (especially it looks correct).


> +                                       bool svq,
> +                                       VhostIOVATree *iova_tree)
>   {
>       NetClientState *nc = NULL;
>       VhostVDPAState *s;
> @@ -211,8 +222,14 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>   
>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>       s->vhost_vdpa.index = queue_pair_index;
> +    s->vhost_vdpa.shadow_vqs_enabled = svq;
> +    s->vhost_vdpa.iova_tree = iova_tree ? vhost_iova_tree_acquire(iova_tree) :
> +                              NULL;
>       ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
>       if (ret) {
> +        if (iova_tree) {
> +            vhost_iova_tree_release(iova_tree);
> +        }
>           qemu_del_net_client(nc);
>           return NULL;
>       }
> @@ -266,6 +283,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       g_autofree NetClientState **ncs = NULL;
>       NetClientState *nc;
>       int queue_pairs, i, has_cvq = 0;
> +    g_autoptr(VhostIOVATree) iova_tree = NULL;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>       opts = &netdev->u.vhost_vdpa;
> @@ -285,19 +303,31 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
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


So we had at most 1 iova_tree here, so the refcnt looks unnecessary.

Thanks


>           if (!nc)
>               goto err;
>       }
> @@ -308,6 +338,8 @@ err:
>       if (i) {
>           qemu_del_net_client(ncs[0]);
>       }
> +
> +err_svq:
>       qemu_close(vdpa_device_fd);
>   
>       return -1;


