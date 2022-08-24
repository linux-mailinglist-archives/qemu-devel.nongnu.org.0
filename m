Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB4D59F2ED
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 07:04:44 +0200 (CEST)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQiZH-00052V-E3
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 01:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQiUk-0002fA-PF
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 01:00:02 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:39654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQiUe-0008A7-6x
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:59:57 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VN5riXf_1661317190; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN5riXf_1661317190) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 12:59:51 +0800
Content-Type: multipart/alternative;
 boundary="------------e0Po95sUUbELcR1605HcjTtS"
Message-ID: <b00945f8-9b79-74f4-238c-cc3fcfe01708@linux.alibaba.com>
Date: Wed, 24 Aug 2022 12:59:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 16/24] vhost: vhost-user: update
 vhost_dev_virtqueue_stop()
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <a9483de778d0aa4c79acd9c716feeaf0677c9718.1660611460.git.kangjie.xu@linux.alibaba.com>
 <5eac5f68-e4e4-6cb5-a336-d475052a4fc6@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <5eac5f68-e4e4-6cb5-a336-d475052a4fc6@redhat.com>
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
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
--------------e0Po95sUUbELcR1605HcjTtS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/8/24 11:56, Jason Wang 写道:
>
> 在 2022/8/16 09:06, Kangjie Xu 写道:
>> Update vhost_dev_virtqueue_stop() for vhost-user scenario.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/virtio/vhost.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index fc3f550c76..a0d6824353 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1908,10 +1908,29 @@ int vhost_net_set_backend(struct vhost_dev 
>> *hdev,
>>   void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice 
>> *vdev,
>>                                 int idx)
>>   {
>> +    const VhostOps *vhost_ops = hdev->vhost_ops;
>> +    struct vhost_vring_state state;
>> +    int r;
>> +
>> +    assert(vhost_ops);
>> +
>> +    if (vhost_ops->vhost_reset_vring) {
>> +        state.index = hdev->vq_index + idx;
>> +        r = vhost_ops->vhost_reset_vring(hdev, &state);
>> +        if (r < 0) {
>> +            goto err_queue_reset;
>> +        }
>> +    }
>> +
>
>
> So this worries me:
>
> 1) having two similar functions
>
> vhost_virtqueue_stop()
>
> and
>
> vhost_dev_virtqueue_stop()
>
> It can easily confuse the people who want stop the device.
>
> I think we need rename vhost_dev_virtqueue_stop() to 
> vhost_virqtueue_reset() since it has different semantic compared to stop:
>
> 1) stop means the virtqueue state is reserved, e.g the index could be 
> synced via get_vring_base()
> 2) reset means the virqtueue state is lost
>
> Thanks
>
>
Totally agree, will fix.

Thanks

>>       vhost_virtqueue_unmap(hdev,
>>                             vdev,
>>                             hdev->vqs + idx,
>>                             idx);
>> +
>> +    return;
>> +
>> +err_queue_reset:
>> +    error_report("Error when stopping the qeuue.");
>>   }
>>     int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, 
>> VirtIODevice *vdev,
--------------e0Po95sUUbELcR1605HcjTtS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/8/24 11:56, Jason Wang 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5eac5f68-e4e4-6cb5-a336-d475052a4fc6@redhat.com">
      <br>
      在 2022/8/16 09:06, Kangjie Xu 写道:
      <br>
      <blockquote type="cite">Update vhost_dev_virtqueue_stop() for
        vhost-user scenario.
        <br>
        <br>
        Signed-off-by: Kangjie Xu <a class="moz-txt-link-rfc2396E" href="mailto:kangjie.xu@linux.alibaba.com">&lt;kangjie.xu@linux.alibaba.com&gt;</a>
        <br>
        Signed-off-by: Xuan Zhuo <a class="moz-txt-link-rfc2396E" href="mailto:xuanzhuo@linux.alibaba.com">&lt;xuanzhuo@linux.alibaba.com&gt;</a>
        <br>
        ---
        <br>
          hw/virtio/vhost.c | 19 +++++++++++++++++++
        <br>
          1 file changed, 19 insertions(+)
        <br>
        <br>
        diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
        <br>
        index fc3f550c76..a0d6824353 100644
        <br>
        --- a/hw/virtio/vhost.c
        <br>
        +++ b/hw/virtio/vhost.c
        <br>
        @@ -1908,10 +1908,29 @@ int vhost_net_set_backend(struct
        vhost_dev *hdev,
        <br>
          void vhost_dev_virtqueue_stop(struct vhost_dev *hdev,
        VirtIODevice *vdev,
        <br>
                                        int idx)
        <br>
          {
        <br>
        +    const VhostOps *vhost_ops = hdev-&gt;vhost_ops;
        <br>
        +    struct vhost_vring_state state;
        <br>
        +    int r;
        <br>
        +
        <br>
        +    assert(vhost_ops);
        <br>
        +
        <br>
        +    if (vhost_ops-&gt;vhost_reset_vring) {
        <br>
        +        state.index = hdev-&gt;vq_index + idx;
        <br>
        +        r = vhost_ops-&gt;vhost_reset_vring(hdev, &amp;state);
        <br>
        +        if (r &lt; 0) {
        <br>
        +            goto err_queue_reset;
        <br>
        +        }
        <br>
        +    }
        <br>
        +
        <br>
      </blockquote>
      <br>
      <br>
      So this worries me:
      <br>
      <br>
      1) having two similar functions
      <br>
      <br>
      vhost_virtqueue_stop()
      <br>
      <br>
      and
      <br>
      <br>
      vhost_dev_virtqueue_stop()
      <br>
      <br>
      It can easily confuse the people who want stop the device.
      <br>
      <br>
      I think we need rename vhost_dev_virtqueue_stop() to
      vhost_virqtueue_reset() since it has different semantic compared
      to stop:
      <br>
      <br>
      1) stop means the virtqueue state is reserved, e.g the index could
      be synced via get_vring_base()
      <br>
      2) reset means the virqtueue state is lost
      <br>
      <br>
      Thanks
      <br>
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
        !important; float: none;">Totally agree, will fix.<br>
      </span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: Overpass,
        sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 300; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">Thanks<br>
      </span></p>
    <blockquote type="cite"
      cite="mid:5eac5f68-e4e4-6cb5-a336-d475052a4fc6@redhat.com">
      <blockquote type="cite">      vhost_virtqueue_unmap(hdev,
        <br>
                                    vdev,
        <br>
                                    hdev-&gt;vqs + idx,
        <br>
                                    idx);
        <br>
        +
        <br>
        +    return;
        <br>
        +
        <br>
        +err_queue_reset:
        <br>
        +    error_report("Error when stopping the qeuue.");
        <br>
          }
        <br>
            int vhost_dev_virtqueue_restart(struct vhost_dev *hdev,
        VirtIODevice *vdev,
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------e0Po95sUUbELcR1605HcjTtS--

