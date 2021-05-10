Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80E378FE0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 16:06:05 +0200 (CEST)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg6Xs-00082O-9o
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 10:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lg6X2-0007MM-Ds
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:05:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lg6Wz-0004Oo-0x
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620655507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sed5dFvqrIQK/1xOPSWhbj3wqJ1GU1x/D2LdDVqwX0M=;
 b=ULp+z7Yt5Cd3tjShIDWx9D3+p56xgYhzSEKtp1mw/2mowcaNhOTNcVAATh48aPTypbrq1t
 IXV/GUlcJyF5RkAs9XajsvM2/AhjLXrmye1OVAciKUUW+a46JPjQrFaWWJBWEwaiCB3ckF
 c6X/EuZnS29E5NdhGihLrkZUA3s9yls=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-48YCEiOaOkKB4nXAIZejyw-1; Mon, 10 May 2021 10:05:05 -0400
X-MC-Unique: 48YCEiOaOkKB4nXAIZejyw-1
Received: by mail-ed1-f72.google.com with SMTP id
 i19-20020a05640242d3b0290388cea34ed3so9088391edc.15
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 07:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sed5dFvqrIQK/1xOPSWhbj3wqJ1GU1x/D2LdDVqwX0M=;
 b=DC7oSJlxVN2nZZqtEzakPiY5h2Ob04fl7ZKest+kdJ28MY2+iOBYOFAcfs13uk5mq0
 vPDGKFokqwJkXynaa6f2B/FkUbk3BXo6r70tevzzMgoOep0rjow6R/yZr4ys7PpuUWtw
 JBMqxH69MInYoSwB5QGiL9b+8of7DoT3aSt8zKDFmNv3lCsJAvC59LB6zNntyI2xRAU8
 q4jtBgJfvKtuQ4/YzDlgw51q31vebfQc1DoM1kyhQjp16Jz7SJ8WHhzukyAdO/v8BwHP
 yfsoAMPimjIwGkau1D2uZDZcPy2fx6lw2qpbYUdhgzeD4q9BUdIYfNCjtB9FUXfb+onp
 ztjg==
X-Gm-Message-State: AOAM532Euu2NcSnFDUsgFRHSgvn0rJO9q9SfVwBRUbxS6hTL1rcJKeih
 RCtiWMwhJgtk7/N7ISSc7e/+O6qDkQxn+V0DPQXAL0k0nzDAnXHlSyTH3s7sXUXOpAhFqa9graS
 oOBIMj2Ze648Xfwg=
X-Received: by 2002:a17:906:7fd3:: with SMTP id
 r19mr25605279ejs.2.1620655504343; 
 Mon, 10 May 2021 07:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlCWkUAX7SfSg88/3ES/eKOqPU9x6if9ljU8OyZJHTPj3VwXijkOFRyazP4bGQTdVlqrFXLQ==
X-Received: by 2002:a17:906:7fd3:: with SMTP id
 r19mr25605244ejs.2.1620655503994; 
 Mon, 10 May 2021 07:05:03 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f30sm9458712ejl.62.2021.05.10.07.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 07:05:03 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] virtio-blk: Convert QEMUBH callback to "bitops.h"
 API
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210507170634.2058801-1-philmd@redhat.com>
 <20210507170634.2058801-3-philmd@redhat.com>
 <YJk0Ybzgna/nPbGK@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f66bfa6a-ec17-481e-c41e-5d8c59f220b1@redhat.com>
Date: Mon, 10 May 2021 16:05:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJk0Ybzgna/nPbGK@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 3:25 PM, Stefan Hajnoczi wrote:
> On Fri, May 07, 2021 at 07:06:34PM +0200, Philippe Mathieu-Daudé wrote:
>> By directly using find_first_bit() and find_next_bit from the
>> "bitops.h" API to iterate over the bitmap, we can remove the
>> bitmap[] variable-length array copy on the stack and the complex
>> manual bit testing/clearing logic.
>>
>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/block/dataplane/virtio-blk.c | 19 ++++---------------
>>  1 file changed, 4 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
>> index e9050c8987e..a7b5bda06fc 100644
>> --- a/hw/block/dataplane/virtio-blk.c
>> +++ b/hw/block/dataplane/virtio-blk.c
>> @@ -60,23 +60,12 @@ static void notify_guest_bh(void *opaque)
>>  {
>>      VirtIOBlockDataPlane *s = opaque;
>>      unsigned nvqs = s->conf->num_queues;
>> -    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
>> -    unsigned j;
>>  
>> -    memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
>> -    memset(s->batch_notify_vqs, 0, sizeof(bitmap));
>> +    for (unsigned long i = find_first_bit(s->batch_notify_vqs, nvqs);
>> +             i < nvqs; i = find_next_bit(s->batch_notify_vqs, nvqs, i)) {
>> +        VirtQueue *vq = virtio_get_queue(s->vdev, i);
>>  
>> -    for (j = 0; j < nvqs; j += BITS_PER_LONG) {
>> -        unsigned long bits = bitmap[j / BITS_PER_LONG];
>> -
>> -        while (bits != 0) {
>> -            unsigned i = j + ctzl(bits);
>> -            VirtQueue *vq = virtio_get_queue(s->vdev, i);
>> -
>> -            virtio_notify_irqfd(s->vdev, vq);
>> -
>> -            bits &= bits - 1; /* clear right-most bit */
>> -        }
>> +        virtio_notify_irqfd(s->vdev, vq);
>>      }
>>  }
> 
> Bits in s->batch_notify_vqs[] must be cleared. Otherwise we may raise
> spurious irqs next time this function is called. The memset() can be
> moved after the loop.

Doh... good catch! I missed it when removing the previous
test_and_clear_bit() call (from v1).


