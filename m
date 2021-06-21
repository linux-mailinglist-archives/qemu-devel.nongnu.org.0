Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4574E3AE6CC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:11:17 +0200 (CEST)
Received: from localhost ([::1]:41974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGtg-0001AR-AE
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGi0-00064Z-En
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGhx-0006dl-LP
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7IyamYrcOGOFVkP8IE+zeXIz2/9OIDx6WN8OLxZPa90=;
 b=Mh0OwZiSyU6nv2h/WUc08kg26owW0eHYdYsaXgi2nWa99jOrvcHGXVENJXMvvKoU7LCYUL
 vlqEsdgUODLYFxZ3S/mvBZRi1oAjHWK9D6TgT1fJjHu41GgrkDPFzzW4gdcjBBvQiHfsGf
 nDXsC2CIINWR8vnAUzdbj2a7N+mbvaI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-1d6ypttpN7WYUanTbJJa1Q-1; Mon, 21 Jun 2021 05:59:06 -0400
X-MC-Unique: 1d6ypttpN7WYUanTbJJa1Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 g14-20020a05600c4eceb02901b609849650so5693082wmq.6
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 02:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7IyamYrcOGOFVkP8IE+zeXIz2/9OIDx6WN8OLxZPa90=;
 b=eUJaZ5ei+rzX4YAO7F78z2n2ndd/w6Z/hbYC0WcLMx9yWVBHlhHM8BwyXTu1jR8GbJ
 80YyPk3Xn5zjtaX945VwEM6LGPFZyVthmsfbIjNhCpEhcivbLkk+yde8S+DJeU3iQPno
 iKwFOwg86U40jGkW+grJQQgJboWZVEyisBvYxlGoK4dnxjSKbqhh+CrrIruKwhCKdq9f
 Oo6h9AHHrt+IWxayFYDTBArS1aBOLjaQjAmcwWvqXyw+rrrcw05noECM88I5FgZ1Khj2
 ER2aRVyRnUfp8RKyM/G/gHXeb3hbDfiAtrlG2IxMgnKR9JhLXnQOdttagPTCZdUhcGPy
 usHw==
X-Gm-Message-State: AOAM5336wbpn/KjxT9ySonuBtdikFLxdZzN09Q+VPsGFBPK+og0xGJIn
 foAJyfKqubdduukOcLkzrcUAdYGHD/l8XyUdqxVuQHQ60yxd8vFK89C2WouXMe7VMzu8UvEP/Ar
 BJW+9qJAr0CWqUnc=
X-Received: by 2002:adf:9d92:: with SMTP id p18mr25699170wre.109.1624269545461; 
 Mon, 21 Jun 2021 02:59:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrUhIvuSakwuYPnLFH9hDNWTjnYihGgtCbjIiyLXIADXvkVmrCBJjr0G5P9+/7S0wGRYdODA==
X-Received: by 2002:adf:9d92:: with SMTP id p18mr25699154wre.109.1624269545300; 
 Mon, 21 Jun 2021 02:59:05 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u12sm17965877wrr.40.2021.06.21.02.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:59:04 -0700 (PDT)
Subject: Re: [RFC PATCH] hw/display/virtio-gpu: Fix memory leak (CID 1453811)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, qemu-devel@nongnu.org
References: <20210531101928.1662732-1-philmd@redhat.com>
 <e69a7f99-7d35-12f8-21af-48cc95172e6d@redhat.com>
Message-ID: <ce1d8148-ef68-bee4-1b10-ce4b92cc1c7a@redhat.com>
Date: Mon, 21 Jun 2021 11:59:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e69a7f99-7d35-12f8-21af-48cc95172e6d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 6/14/21 12:52 PM, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 5/31/21 12:19 PM, Philippe Mathieu-Daudé wrote:
>> To avoid leaking memory on the error path, reorder the
>> code as:
>> - check the parameters first
>> - check resource already existing
>> - finally allocate memory
>>
>> Reported-by: Coverity (CID 1453811: RESOURCE_LEAK)
>> Fixes: e0933d91b1c ("virtio-gpu: Add virtio_gpu_resource_create_blob")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> RFC because the s->iov check is dubious.
>> ---
>>  hw/display/virtio-gpu.c | 28 +++++++++++-----------------
>>  1 file changed, 11 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
>> index 4d549377cbc..8d047007bbb 100644
>> --- a/hw/display/virtio-gpu.c
>> +++ b/hw/display/virtio-gpu.c
>> @@ -340,8 +340,15 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
>>          return;
>>      }
>>  
>> -    res = virtio_gpu_find_resource(g, cblob.resource_id);
>> -    if (res) {
>> +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_GUEST &&
>> +        cblob.blob_flags != VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid memory type\n",
>> +                      __func__);
>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
>> +        return;
>> +    }
>> +
>> +    if (virtio_gpu_find_resource(g, cblob.resource_id)) {
>>          qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
>>                        __func__, cblob.resource_id);
>>          cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>> @@ -352,25 +359,12 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
>>      res->resource_id = cblob.resource_id;
>>      res->blob_size = cblob.size;
>>  
>> -    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_GUEST &&
>> -        cblob.blob_flags != VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE) {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid memory type\n",
>> -                      __func__);
>> -        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
>> -        g_free(res);
>> -        return;
>> -    }
>> -
>> -    if (res->iov) {
>> -        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>> -        return;
>> -    }
>> -
>>      ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
>>                                          cmd, &res->addrs, &res->iov,
>>                                          &res->iov_cnt);
>> -    if (ret != 0) {
>> +    if (ret != 0 || res->iov) {
>>          cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>> +        g_free(res);
>>          return;
>>      }
>>  
>>
> 


