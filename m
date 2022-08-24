Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4537D59F182
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:49:05 +0200 (CEST)
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgS0-0005KS-9v
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQgPt-000290-AH
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:46:53 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:40022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQgPr-0006Zi-9i
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:46:53 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VN5LIt6_1661309204; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN5LIt6_1661309204) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 10:46:45 +0800
Content-Type: multipart/alternative;
 boundary="------------TTVNMiUfemaiXnGTY5vbqXio"
Message-ID: <7fd73535-b101-d5f9-93da-62800f86b308@linux.alibaba.com>
Date: Wed, 24 Aug 2022 10:46:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 11/24] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_stop()
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <9f5f233aaef3096fa1715095f3c436bb3c855fe5.1660611460.git.kangjie.xu@linux.alibaba.com>
 <11f8a57c-96e0-6bea-2a1d-f0c7269fa75f@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <11f8a57c-96e0-6bea-2a1d-f0c7269fa75f@redhat.com>
Received-SPF: pass client-ip=115.124.30.42;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-42.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

This is a multi-part message in MIME format.
--------------TTVNMiUfemaiXnGTY5vbqXio
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/8/24 10:40, Jason Wang 写道:
>
> 在 2022/8/16 09:06, Kangjie Xu 写道:
>> Introduce vhost_virtqueue_stop(), which can reset the virtqueue
>> in the device. Then it will unmap vrings and the desc of the
>> virtqueue.
>>
>> This patch only considers the case for vhost-kernel, when
>> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/net/vhost_net.c      | 21 +++++++++++++++++++++
>>   include/net/vhost_net.h |  2 ++
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index ccac5b7a64..aa60dd901c 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -514,3 +514,24 @@ int vhost_net_set_mtu(struct vhost_net *net, 
>> uint16_t mtu)
>>         return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>>   }
>> +
>> +void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
>> +                              int vq_index)
>> +{
>> +    VHostNetState *net = get_vhost_net(nc->peer);
>> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
>> +    struct vhost_vring_file file = { .fd = -1 };
>> +    int idx;
>> +
>> +    assert(vhost_ops);
>> +
>> +    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
>> +
>> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
>> +        file.index = idx;
>> +        int r = vhost_net_set_backend(&net->dev, &file);
>> +        assert(r >= 0);
>> +    }
>
>
> Let's have a vhost_ops here instead of open code it.
>
> Thanks
>
I share your view.

Thanks

>
>> +
>> +    vhost_dev_virtqueue_stop(&net->dev, vdev, idx);
>> +}
>> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
>> index 387e913e4e..9b3aaf3814 100644
>> --- a/include/net/vhost_net.h
>> +++ b/include/net/vhost_net.h
>> @@ -48,4 +48,6 @@ uint64_t vhost_net_get_acked_features(VHostNetState 
>> *net);
>>     int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>>   +void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
>> +                              int vq_index);
>>   #endif
--------------TTVNMiUfemaiXnGTY5vbqXio
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/8/24 10:40, Jason Wang 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:11f8a57c-96e0-6bea-2a1d-f0c7269fa75f@redhat.com">
      <br>
      在 2022/8/16 09:06, Kangjie Xu 写道:
      <br>
      <blockquote type="cite">Introduce vhost_virtqueue_stop(), which
        can reset the virtqueue
        <br>
        in the device. Then it will unmap vrings and the desc of the
        <br>
        virtqueue.
        <br>
        <br>
        This patch only considers the case for vhost-kernel, when
        <br>
        NetClientDriver is NET_CLIENT_DRIVER_TAP.
        <br>
        <br>
        Signed-off-by: Kangjie Xu <a class="moz-txt-link-rfc2396E" href="mailto:kangjie.xu@linux.alibaba.com">&lt;kangjie.xu@linux.alibaba.com&gt;</a>
        <br>
        Signed-off-by: Xuan Zhuo <a class="moz-txt-link-rfc2396E" href="mailto:xuanzhuo@linux.alibaba.com">&lt;xuanzhuo@linux.alibaba.com&gt;</a>
        <br>
        ---
        <br>
          hw/net/vhost_net.c      | 21 +++++++++++++++++++++
        <br>
          include/net/vhost_net.h |  2 ++
        <br>
          2 files changed, 23 insertions(+)
        <br>
        <br>
        diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
        <br>
        index ccac5b7a64..aa60dd901c 100644
        <br>
        --- a/hw/net/vhost_net.c
        <br>
        +++ b/hw/net/vhost_net.c
        <br>
        @@ -514,3 +514,24 @@ int vhost_net_set_mtu(struct vhost_net
        *net, uint16_t mtu)
        <br>
                return vhost_ops-&gt;vhost_net_set_mtu(&amp;net-&gt;dev,
        mtu);
        <br>
          }
        <br>
        +
        <br>
        +void vhost_net_virtqueue_stop(VirtIODevice *vdev,
        NetClientState *nc,
        <br>
        +                              int vq_index)
        <br>
        +{
        <br>
        +    VHostNetState *net = get_vhost_net(nc-&gt;peer);
        <br>
        +    const VhostOps *vhost_ops = net-&gt;dev.vhost_ops;
        <br>
        +    struct vhost_vring_file file = { .fd = -1 };
        <br>
        +    int idx;
        <br>
        +
        <br>
        +    assert(vhost_ops);
        <br>
        +
        <br>
        +    idx = vhost_ops-&gt;vhost_get_vq_index(&amp;net-&gt;dev,
        vq_index);
        <br>
        +
        <br>
        +    if (net-&gt;nc-&gt;info-&gt;type == NET_CLIENT_DRIVER_TAP)
        {
        <br>
        +        file.index = idx;
        <br>
        +        int r = vhost_net_set_backend(&amp;net-&gt;dev,
        &amp;file);
        <br>
        +        assert(r &gt;= 0);
        <br>
        +    }
        <br>
      </blockquote>
      <br>
      <br>
      Let's have a vhost_ops here instead of open code it.
      <br>
      <br>
      Thanks
      <br>
      <br>
    </blockquote>
    <p><span style="color: rgb(0, 0, 0); font-family: Overpass,
        sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 300; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"><span> </span>I share your view.</span></p>
    <p>Thanks<br>
    </p>
    <blockquote type="cite"
      cite="mid:11f8a57c-96e0-6bea-2a1d-f0c7269fa75f@redhat.com">
      <br>
      <blockquote type="cite">+
        <br>
        +    vhost_dev_virtqueue_stop(&amp;net-&gt;dev, vdev, idx);
        <br>
        +}
        <br>
        diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
        <br>
        index 387e913e4e..9b3aaf3814 100644
        <br>
        --- a/include/net/vhost_net.h
        <br>
        +++ b/include/net/vhost_net.h
        <br>
        @@ -48,4 +48,6 @@ uint64_t
        vhost_net_get_acked_features(VHostNetState *net);
        <br>
            int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
        <br>
          +void vhost_net_virtqueue_stop(VirtIODevice *vdev,
        NetClientState *nc,
        <br>
        +                              int vq_index);
        <br>
          #endif
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------TTVNMiUfemaiXnGTY5vbqXio--

