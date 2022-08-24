Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F859F8F3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 14:02:32 +0200 (CEST)
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQp5b-0007CM-6m
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 08:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQoYD-0004FU-Hs
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 07:28:01 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:54169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQoY2-0002Ho-Vi
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 07:27:54 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VN7IuT4_1661340459; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN7IuT4_1661340459) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 19:27:40 +0800
Content-Type: multipart/alternative;
 boundary="------------7HeMYQ9NnmjMpKHVbmhzNneu"
Message-ID: <a5cb0b2d-1a76-86eb-acd7-6421a5f6d3eb@linux.alibaba.com>
Date: Wed, 24 Aug 2022 19:27:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 07/24] virtio-pci: support queue enable
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <6dda660c634b2a35c3dea46a98e63fb2ef3a36c9.1660611460.git.kangjie.xu@linux.alibaba.com>
 <1824ba40-9460-4c5d-9a27-820a51355ba3@redhat.com>
 <9fb3e2b4-9f78-5da1-3ab6-0ec53f03b628@linux.alibaba.com>
 <5812b7ed-3983-6b39-0c44-e1701ca4ecf0@redhat.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, eduardo@habkost.net,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
In-Reply-To: <5812b7ed-3983-6b39-0c44-e1701ca4ecf0@redhat.com>
Received-SPF: pass client-ip=115.124.30.43;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-43.freemail.mail.aliyun.com
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
--------------7HeMYQ9NnmjMpKHVbmhzNneu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/8/24 16:59, Jason Wang 写道:
>
> 在 2022/8/23 16:20, Kangjie Xu 写道:
>>
>> 在 2022/8/23 15:44, Jason Wang 写道:
>>>
>>> 在 2022/8/16 09:06, Kangjie Xu 写道:
>>>> PCI devices support vq enable.
>>>
>>>
>>> Nit: it might be "support device specific vq enable"
>>>
>>>
>> Get it.
>>>>
>>>> Based on this function, the driver can re-enable the virtqueue 
>>>> after the
>>>> virtqueue is reset.
>>>>
>>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>>> ---
>>>>   hw/virtio/virtio-pci.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>>>> index ec8e92052f..3d560e45ad 100644
>>>> --- a/hw/virtio/virtio-pci.c
>>>> +++ b/hw/virtio/virtio-pci.c
>>>> @@ -1335,6 +1335,7 @@ static void virtio_pci_common_write(void 
>>>> *opaque, hwaddr addr,
>>>> proxy->vqs[vdev->queue_sel].avail[0],
>>>> ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>>>> proxy->vqs[vdev->queue_sel].used[0]);
>>>> +            virtio_queue_enable(vdev, vdev->queue_sel);
>>>>               proxy->vqs[vdev->queue_sel].enabled = 1;
>>>>               proxy->vqs[vdev->queue_sel].reset = 0;
>>>
>>>
>>> Any reason we do it before the assignment of 1? It probably means 
>>> the device specific method can't depend on virtio_queue_enabled()?
>>>
>>> Thanks
>>>
>> Sorry, I don't get why device specific method can't depend on 
>> virtio_queue_enabled().
>
>
> I meant if the device specific method call virtio_queue_enabled() it 
> will return false in this case, is this intended?
>
Yes, I intend it to behave in this way.
>
>>
>> Before virtio_queue_enable() is done, virtqueue should always be not 
>> ready and disabled.
>>
>> Otherwise, If we put it after the assignment of enabled to 1, the 
>> virtqueue may be accessed illegally and may cause panic, because the 
>> virtqueue is still being intialized and being configured.
>
>
> How? Shouldn't we make transport ready before making device 
> virtqueue(device) ready?
>
> Thanks
>
I am not experienced in this field, could you tell me why we should make 
the transport ready first?

I make the transport ready later than making device ready for two aspects:

1. In QEMU, the virtio_queue_enabled() is used only when we start the 
device/queue pair (vhost_dev_start_one), or reading 
VIRTIO_PCI_COMMON_Q_ENABLE. These two operations and resetting the queue 
will *be synchronized* using iothread lock, so we do not need to worry 
about the case currently.

2. Suppose we use virtio_queue_enabled() or access the enabled status 
asynchronously, and we make the transport ready first.

After enabled set to true, and before virtio_queue_enable() is finished, 
somewhere  that call virtio_queue_enabled()  or access the enabled 
status of VirtIOPCIQueue. Then the caller will consider the virtqueue as 
enabled(enabled = true in VirtIOPCIQueue). The caller might access the 
virtqueue(access avail ring / desc table). But I think *the access here 
is illegal* because the virtqueue might still be *unintialized* status.

Thus, from my perspective, to prevent illegal access, we need to make 
transport ready after virtio_queue_enable().

Thanks

>
>>
>> Thanks
>>
>>>
>>>>           } else {
>>
--------------7HeMYQ9NnmjMpKHVbmhzNneu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/8/24 16:59, Jason Wang 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5812b7ed-3983-6b39-0c44-e1701ca4ecf0@redhat.com">
      <br>
      在 2022/8/23 16:20, Kangjie Xu 写道:
      <br>
      <blockquote type="cite">
        <br>
        在 2022/8/23 15:44, Jason Wang 写道:
        <br>
        <blockquote type="cite">
          <br>
          在 2022/8/16 09:06, Kangjie Xu 写道:
          <br>
          <blockquote type="cite">PCI devices support vq enable.
            <br>
          </blockquote>
          <br>
          <br>
          Nit: it might be "support device specific vq enable"
          <br>
          <br>
          <br>
        </blockquote>
        Get it.
        <br>
        <blockquote type="cite">
          <blockquote type="cite">
            <br>
            Based on this function, the driver can re-enable the
            virtqueue after the
            <br>
            virtqueue is reset.
            <br>
            <br>
            Signed-off-by: Kangjie Xu
            <a class="moz-txt-link-rfc2396E" href="mailto:kangjie.xu@linux.alibaba.com">&lt;kangjie.xu@linux.alibaba.com&gt;</a>
            <br>
            Signed-off-by: Xuan Zhuo <a class="moz-txt-link-rfc2396E" href="mailto:xuanzhuo@linux.alibaba.com">&lt;xuanzhuo@linux.alibaba.com&gt;</a>
            <br>
            ---
            <br>
              hw/virtio/virtio-pci.c | 1 +
            <br>
              1 file changed, 1 insertion(+)
            <br>
            <br>
            diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
            <br>
            index ec8e92052f..3d560e45ad 100644
            <br>
            --- a/hw/virtio/virtio-pci.c
            <br>
            +++ b/hw/virtio/virtio-pci.c
            <br>
            @@ -1335,6 +1335,7 @@ static void
            virtio_pci_common_write(void *opaque, hwaddr addr,
            <br>
            proxy-&gt;vqs[vdev-&gt;queue_sel].avail[0],
            <br>
            ((uint64_t)proxy-&gt;vqs[vdev-&gt;queue_sel].used[1])
            &lt;&lt; 32 |
            <br>
            proxy-&gt;vqs[vdev-&gt;queue_sel].used[0]);
            <br>
            +            virtio_queue_enable(vdev, vdev-&gt;queue_sel);
            <br>
                          proxy-&gt;vqs[vdev-&gt;queue_sel].enabled = 1;
            <br>
                          proxy-&gt;vqs[vdev-&gt;queue_sel].reset = 0;
            <br>
          </blockquote>
          <br>
          <br>
          Any reason we do it before the assignment of 1? It probably
          means the device specific method can't depend on
          virtio_queue_enabled()?
          <br>
          <br>
          Thanks
          <br>
          <br>
        </blockquote>
        Sorry, I don't get why device specific method can't depend on
        virtio_queue_enabled().
        <br>
      </blockquote>
      <br>
      <br>
      I meant if the device specific method call virtio_queue_enabled()
      it will return false in this case, is this intended?
      <br>
      <br>
    </blockquote>
    Yes, I intend it to behave in this way.<br>
    <blockquote type="cite"
      cite="mid:5812b7ed-3983-6b39-0c44-e1701ca4ecf0@redhat.com">
      <br>
      <blockquote type="cite">
        <br>
        Before virtio_queue_enable() is done, virtqueue should always be
        not ready and disabled.
        <br>
        <br>
        Otherwise, If we put it after the assignment of enabled to 1,
        the virtqueue may be accessed illegally and may cause panic,
        because the virtqueue is still being intialized and being
        configured.
        <br>
      </blockquote>
      <br>
      <br>
      How? Shouldn't we make transport ready before making device
      virtqueue(device) ready?
      <br>
      <br>
      Thanks
      <br>
      <br>
    </blockquote>
    <p>I am not experienced in this field, could you tell me why we
      should make the transport ready first?<br>
    </p>
    <p>I make the transport ready later than making device ready for two
      aspects:</p>
    <p>1. In QEMU, the virtio_queue_enabled() is used only when we start
      the device/queue pair (vhost_dev_start_one), or reading
      VIRTIO_PCI_COMMON_Q_ENABLE. These two operations and resetting the
      queue will <b>be synchronized</b> using iothread lock, so we do
      not need to worry about the case currently.</p>
    <p>2. Suppose we use virtio_queue_enabled() or access the enabled
      status asynchronously, and we make the transport ready first.</p>
    <p>After enabled set to true, and before virtio_queue_enable() is
      finished, somewhere  that call virtio_queue_enabled()  or access
      the enabled status of VirtIOPCIQueue. Then the caller will
      consider the virtqueue as enabled(enabled = true in
      VirtIOPCIQueue). The caller might access the virtqueue(access
      avail ring / desc table). But I think <b>the access here is
        illegal</b> because the virtqueue might still be <b>unintialized</b>
      status.</p>
    <p>Thus, from my perspective, to prevent illegal access, we need to
      make transport ready after virtio_queue_enable().</p>
    <p>Thanks<br>
    </p>
    <blockquote type="cite"
      cite="mid:5812b7ed-3983-6b39-0c44-e1701ca4ecf0@redhat.com">
      <br>
      <blockquote type="cite">
        <br>
        Thanks
        <br>
        <br>
        <blockquote type="cite">
          <br>
          <blockquote type="cite">          } else {
            <br>
          </blockquote>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------7HeMYQ9NnmjMpKHVbmhzNneu--

