Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB435613308
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 10:49:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opRP7-0007nu-Is; Mon, 31 Oct 2022 05:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opRP2-0007jn-4A
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:48:20 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opROw-0004Nw-0P
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:48:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k8so15176218wrh.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yKAO13256uX1r5HdlNW2c20OyXfsYHlFIKgcal6bl9w=;
 b=c+FSsz4ucad0/Jelpud1lZ96HLsM67cWkjk7F0gVHfyJ5BXQgcuuSnqNncGfwZPjEL
 fCVmZRpq5k671p0MrYLSolifBGli9C4goXHCTCJc5xAPc7r6P+v3aQ+ayTdNBeJrYYzX
 0+EKz0iARDuyGQ5NrFDLDLsI7mzYcw6J2gC7PpE/wqGTsCxnUdguBnQr9IKpA+S7n/qd
 TgwDcpKv+Is+fHxGwSbsTwkxemZqVxa2rkzOALpNM1q9yEiOTVNSLkxIRqEymhcbeg2z
 w+XDKxfwZ+hLyRT2bZJwUCje0H3AFdB88PV0qako3EugiCdzlAV1/zU4ijVqaFmOYwyc
 I4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yKAO13256uX1r5HdlNW2c20OyXfsYHlFIKgcal6bl9w=;
 b=oaAFqSZ3mceVSA7nXVx1rV41X7QBgty59d94rQlzPl4AqRbOdeeIBMMouiVqcyWYJe
 8xE3vhaBNoEeef8m5e2NjVSwz1vuoyxbX5jQNsVWFqxU73xj/y+akaigMNtC5pQK9a1f
 90Z8teBoFxx9P1WsaOJnA7LVFlf0UhPlcUqRcx8xcKSDd+4FswAAQgShjKi5s80QuSRb
 XC8IckCRFpr1auPhEiV3uCwHJ8JQ8ZulahTj+FgEnKSe4eSuiXmD4/QsU+HATIGxRZls
 QKKiIQouNQBaoMbj8hHRfTIGekdkN8V4HnqM1wJtzha52rQ9I/PuN+A4id5eKM2nSxLp
 3rQA==
X-Gm-Message-State: ACrzQf1UngwwmFmD0TPOBpmZ5ji/9W/A9Ie/bXLR7nPvrexz2OC76oLG
 o5V0KXCmt7IWwgWsPraRLpUHwg==
X-Google-Smtp-Source: AMsMyM5Ur05gs5BroAtHpcwcsToaY0ud4Z6ZKUM2lqvzPD3I0Pz2b+xmtS65nWD6XmtuoqOUq3hdpQ==
X-Received: by 2002:adf:e54a:0:b0:236:bf8a:4782 with SMTP id
 z10-20020adfe54a000000b00236bf8a4782mr4224882wrm.442.1667209692279; 
 Mon, 31 Oct 2022 02:48:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a056000124600b0022e653f5abbsm6618548wrx.69.2022.10.31.02.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 02:48:11 -0700 (PDT)
Message-ID: <600eeb7a-d462-447c-1b1a-49119240bff1@linaro.org>
Date: Mon, 31 Oct 2022 10:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 2/4] vhost: convert byte order on SVQ used event write
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jason Wang <jasowang@redhat.com>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-3-eperezma@redhat.com>
 <6375bb66-91a5-d638-dd4f-2700ac3a26cc@linaro.org>
 <20221031041527-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221031041527-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/22 09:17, Michael S. Tsirkin wrote:
> On Sat, Oct 29, 2022 at 12:48:43AM +0200, Philippe Mathieu-Daudé wrote:
>> On 28/10/22 18:02, Eugenio Pérez wrote:
>>> This causes errors on virtio modern devices on big endian hosts
>>>
>>> Fixes: 01f8beacea2a ("vhost: toggle device callbacks using used event idx")
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-shadow-virtqueue.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>> index 70766ea740..467099f5d9 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>> @@ -382,7 +382,7 @@ static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
>>>    {
>>>        if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
>>>            uint16_t *used_event = &svq->vring.avail->ring[svq->vring.num];
>>> -        *used_event = svq->shadow_used_idx;
>>> +        *used_event = cpu_to_le16(svq->shadow_used_idx);
>>
>> This looks correct, but what about:
>>
>>             virtio_stw_p(svq->vdev, used_event, svq->shadow_used_idx);
> 
> 
> Philippe thanks for review but this comment isn't all that clear.
> I think you meant something like:
> 	this won't handle endian-ness for legacy virtio devices
> 	on BE correctly. I think  virtio_stw_p would be better.
> 
> which would make sense.
> 
> Yes contributors should document motivation for changes but so
> should reviewers.

Yes, fair enough :)

