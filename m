Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2029441930F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 13:24:37 +0200 (CEST)
Received: from localhost ([::1]:35920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUokN-0000mN-Pc
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 07:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUohv-0007rT-55
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUohr-0005Z5-Oj
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632741717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hD8Zygv9kRPaP1fi9/6dRyfr9fijqCuW9yPZQS73Pk=;
 b=Yj53Zwjm5AgpHQn3M3szPbyV9ApsNgklDdMb1KMqW23EolgqOOokvBRFgUjka7uOySGzDT
 FMuDKqyWKTzENtbP//Ja96RNWpF5KaYQSxpy7twDXvae95H1jL7NyY3PylrW0f1R+r52z5
 OxwmqEadCwUqH9W7mlv3YLkNrHnxYho=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-eRqBeg_VODuLuLPqJ1JTLw-1; Mon, 27 Sep 2021 07:21:56 -0400
X-MC-Unique: eRqBeg_VODuLuLPqJ1JTLw-1
Received: by mail-wr1-f72.google.com with SMTP id
 a17-20020adfed11000000b00160525e875aso6431397wro.23
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 04:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7hD8Zygv9kRPaP1fi9/6dRyfr9fijqCuW9yPZQS73Pk=;
 b=6WMJVnL01Qn8a9ixALpg/lIlYCu6X6ApAhljLiXi3sKeeUUaWMoVoHfT/vA19KYTtB
 19zSMvhCVIRKsXMZY0ag5F8+MLf4BFgcPXao0eDgiXMiGERlUPdUtBWhU1XBGfKzSFK+
 b4TyFADFVSez8BMI0U6LH8Ks760viU9CIJh+xeSccjUO0zWMkAbc4OEO6OicTOv9WTzA
 v6vAjPB8PBMf02XUQdrH7fkv3sdrxm9Qjd+rvRPpzapH67uSYc2qMHAxN0gnE9QjwkrZ
 y+WGZHllYkc7PONHwG9I4KRC2wQG4i1IHe84jPR5Gekf0JXh0bMv9U7HFB7CZiAZzFeY
 9+6g==
X-Gm-Message-State: AOAM531QA3wKUbeRqJ6cho0fp2a67MwkSWCBImNmDZzIB7BKX/kWht1G
 16mxZ1pS98vevNRCQfRqr/Vtubj1CASmvvxOlyutrw9/hLhEFbZnSCTbk2Y+93qxnOfuowOfiAt
 tZ9wBDCr8J2DRAbY=
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr27645232wrz.428.1632741715399; 
 Mon, 27 Sep 2021 04:21:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO0Gg4T0jDd5awLgnrHI/JenWdfD88nT+EvEKUxQJgD/sq4eFsxsf1Olalkp2LOYsQua/WKw==
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr27645195wrz.428.1632741715132; 
 Mon, 27 Sep 2021 04:21:55 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i203sm20852910wma.7.2021.09.27.04.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 04:21:54 -0700 (PDT)
Message-ID: <fd0e791a-edc9-4b5b-fde5-673a2415acac@redhat.com>
Date: Mon, 27 Sep 2021 13:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 1/3] hw/virtio: Comment virtqueue_flush() must be
 called with RCU read lock
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210906104318.1569967-1-philmd@redhat.com>
 <20210906104318.1569967-2-philmd@redhat.com> <874ka6e2yw.fsf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <874ka6e2yw.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 12:18, Cornelia Huck wrote:
> On Mon, Sep 06 2021, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Reported-by: Stefano Garzarella <sgarzare@redhat.com>
>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/hw/virtio/virtio.h | 7 +++++++
>>  hw/virtio/virtio.c         | 1 +
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index 8bab9cfb750..c1c5f6e53c8 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/include/hw/virtio/virtio.h
>> @@ -186,6 +186,13 @@ void virtio_delete_queue(VirtQueue *vq);
>>  
>>  void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
>>                      unsigned int len);
>> +/**
>> + * virtqueue_flush:
>> + * @vq: The #VirtQueue
>> + * @count: Number of elements to flush
>> + *
>> + * Must be called within RCU critical section.
>> + */
> 
> Hm... do these doc comments belong into .h files, or rather into .c files?

Maybe we should restart this old thread, vote(?) and settle on a style?

https://lore.kernel.org/qemu-devel/349cd87b-0526-30b8-d9cd-0eee537ab5a4@redhat.com/

>>  void virtqueue_flush(VirtQueue *vq, unsigned int count);
>>  void virtqueue_detach_element(VirtQueue *vq, const VirtQueueElement *elem,
>>                                unsigned int len);
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index 3a1f6c520cb..97f60017466 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -896,6 +896,7 @@ static void virtqueue_packed_flush(VirtQueue *vq, unsigned int count)
>>      }
>>  }
>>  
>> +/* Called within rcu_read_lock().  */
>>  void virtqueue_flush(VirtQueue *vq, unsigned int count)
>>  {
>>      if (virtio_device_disabled(vq->vdev)) {
> 
> The content of the change looks good to me, I'm only wondering about
> the style...
> 


