Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B2A3BC93B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:12:40 +0200 (CEST)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i4F-0005vY-CW
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0htg-0000Gn-Hy
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0hte-0002Ah-7J
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFu5RNQqZsGoFOI18nL0NPlQOOpfG3+9TPD/odtERBc=;
 b=VkRu37KA3vUGT8TnHGDbxwms2/I9hKBnKugOHT4axoKUnsLjtdBHLCnwuphMQCH5zCJapK
 TbyvyRhJz7keScaNlhtyPUvyn7ZjAWujHW+DzDGH5DxGySUNUCkOYGHPiVPl8jR7TTQ6BN
 /Dy4uuleQ+4f/U7vo4hhJT/i4EFDAj0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-xbmf4N8YNdyXFaifKvSrTg-1; Tue, 06 Jul 2021 06:01:40 -0400
X-MC-Unique: xbmf4N8YNdyXFaifKvSrTg-1
Received: by mail-wr1-f69.google.com with SMTP id
 y5-20020adfe6c50000b02901258bf1d760so6978737wrm.14
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FFu5RNQqZsGoFOI18nL0NPlQOOpfG3+9TPD/odtERBc=;
 b=Y/RlOhO1rli3rDtoTYJoMXd5hw9t6YUB6eGNT1OlD25ToJjU7oZHLubmYHRze/fai/
 VqOfY4blu14UZXaaVtaI4QtUsHlS3Fq0sRQo+ciCAQndac7CbvHwiehw3DFvqJ7/S4q6
 0iNds0JGV4Pprrj/18znN9ciNJxZqK045SutVtU74DV95APYWryXP4V0+k83ENCX7Zwj
 D5oe3cRqosOHrn2AOTJGc744ZbNNOEBtJMUzX+lNAr6o4FSLCi4FLM4le4b5wQdDMzxI
 vJ+rpsXhEHeQ9ZWKEsTai39p5/AuaYaGve2SHZYseLAHQ3SzmCIST83Zu74kPCIWxowU
 eFSA==
X-Gm-Message-State: AOAM5310yCABmBAydhGHvWZ69XkfsJKUJAI2xXRPbyef1KX/1/8ucb2D
 HOZDi41fHfpt1U1e43A0UYAWZnzJk46d9Fv6rBsDibC4DXR2vj6TG+H8bWZMaUEqtpTndPtw9en
 sywNSZQoz/0K8Xcg=
X-Received: by 2002:adf:e8cc:: with SMTP id k12mr20575466wrn.163.1625565699199; 
 Tue, 06 Jul 2021 03:01:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr42jxWriQdmVe+fUd69k+2Mc0EgT6fBqq+iN7eIcqULO1E06Iy3tMv1iiYmjEXpzBzDjYnw==
X-Received: by 2002:adf:e8cc:: with SMTP id k12mr20575434wrn.163.1625565698986; 
 Tue, 06 Jul 2021 03:01:38 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j17sm2192181wmi.41.2021.07.06.03.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 03:01:38 -0700 (PDT)
Subject: Re: [RFC PATCH] hw/display/virtio-gpu: Fix memory leak (CID 1453811)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210531101928.1662732-1-philmd@redhat.com>
 <e69a7f99-7d35-12f8-21af-48cc95172e6d@redhat.com>
 <ce1d8148-ef68-bee4-1b10-ce4b92cc1c7a@redhat.com>
Message-ID: <35384ebd-a4a4-f87a-f969-2df7dd48bfd1@redhat.com>
Date: Tue, 6 Jul 2021 12:01:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ce1d8148-ef68-bee4-1b10-ce4b92cc1c7a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If this is not a proper fix, what would be the correct one?

On 6/21/21 11:59 AM, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 6/14/21 12:52 PM, Philippe Mathieu-Daudé wrote:
>> ping?
>>
>> On 5/31/21 12:19 PM, Philippe Mathieu-Daudé wrote:
>>> To avoid leaking memory on the error path, reorder the
>>> code as:
>>> - check the parameters first
>>> - check resource already existing
>>> - finally allocate memory
>>>
>>> Reported-by: Coverity (CID 1453811: RESOURCE_LEAK)
>>> Fixes: e0933d91b1c ("virtio-gpu: Add virtio_gpu_resource_create_blob")
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> RFC because the s->iov check is dubious.
>>> ---
>>>  hw/display/virtio-gpu.c | 28 +++++++++++-----------------
>>>  1 file changed, 11 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
>>> index 4d549377cbc..8d047007bbb 100644
>>> --- a/hw/display/virtio-gpu.c
>>> +++ b/hw/display/virtio-gpu.c
>>> @@ -340,8 +340,15 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
>>>          return;
>>>      }
>>>  
>>> -    res = virtio_gpu_find_resource(g, cblob.resource_id);
>>> -    if (res) {
>>> +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_GUEST &&
>>> +        cblob.blob_flags != VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid memory type\n",
>>> +                      __func__);
>>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
>>> +        return;
>>> +    }
>>> +
>>> +    if (virtio_gpu_find_resource(g, cblob.resource_id)) {
>>>          qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
>>>                        __func__, cblob.resource_id);
>>>          cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>>> @@ -352,25 +359,12 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
>>>      res->resource_id = cblob.resource_id;
>>>      res->blob_size = cblob.size;
>>>  
>>> -    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_GUEST &&
>>> -        cblob.blob_flags != VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE) {
>>> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid memory type\n",
>>> -                      __func__);
>>> -        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
>>> -        g_free(res);
>>> -        return;
>>> -    }
>>> -
>>> -    if (res->iov) {
>>> -        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>>> -        return;
>>> -    }
>>> -
>>>      ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
>>>                                          cmd, &res->addrs, &res->iov,
>>>                                          &res->iov_cnt);
>>> -    if (ret != 0) {
>>> +    if (ret != 0 || res->iov) {
>>>          cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>>> +        g_free(res);
>>>          return;
>>>      }
>>>  
>>>
>>
> 


