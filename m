Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357C23F945F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:26:22 +0200 (CEST)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJVJQ-0000xK-MO
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJVHg-000764-45
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 02:24:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJVHd-0001cv-C7
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 02:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630045448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZDLfQ0iSqGNX7AeivV/CFLFyU+9ZvYrCTdNV77O3OQ=;
 b=UxRG2DkTt3r0xUVqBQzYTtW4ztYy5SjaLy4cdkYmOWLpfk5CeMt7hEQ3Cywp8UdmJaVb5m
 nqPBC4QTtTx5EmA4ByIXIeMrM9QAFe9fkjDz+j0Ng/XbttzD1W4016RxI93mj6SIfJvsjy
 hNlXkzTOuu2CmQ0yG/24OmYAcWK+xgY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-4lKayC0WMW2CC5xTYH6QQw-1; Fri, 27 Aug 2021 02:24:07 -0400
X-MC-Unique: 4lKayC0WMW2CC5xTYH6QQw-1
Received: by mail-wr1-f72.google.com with SMTP id
 p10-20020adfce0a000000b001572d05c970so1533938wrn.21
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 23:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hZDLfQ0iSqGNX7AeivV/CFLFyU+9ZvYrCTdNV77O3OQ=;
 b=a2ZmMV5FJlL95uUyLk5XNFJdGzD+KbydiswJhjGMLr92khVW0RmYhn6eKN9y0N5p0R
 aGjYrwOQhRM0YTmEC1Z+WCR0YgrMYOMSiFUQqkROTr7+0IGrydm8b0kahnXMC6LU7mb2
 MMYJqyENGJG5LPQPeAgZ5DDxP+2BsZidTomGVMxAVyt5/6aXsaMmqeZvWxvX0/tp9XEH
 pagfnpedN5vg1iFxZ8cJK2CTLlfjF9S48p0gQu1/WpbpW1FV28OqFfIp7JJTP2f1wsMN
 4CPyTLHQXrJshdiD8H6UUtve+8Nps4EhmXxIq8+ZekVWxit3z0rhqcgfGeURsEZnvjjK
 JFDg==
X-Gm-Message-State: AOAM532OvCXeMN7+pKm931ACWmkoiBskWwo+HaFfBm22vBT7LRCa8BHE
 UdzcpAKwO7hM2YKcsnYgCdYqPtUwJrd8eP8hthi8+BZKQ5k6/LJTeOq7efQiS/A1zbAngMTATnE
 sdJiTk5xdoihGy1A=
X-Received: by 2002:a1c:a7d2:: with SMTP id q201mr7040858wme.77.1630045445711; 
 Thu, 26 Aug 2021 23:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk+E5lj18G0AvvP5gqHeB47aJiXBN1p+Wgkp11exUHgs4v337PlX5Ei+wqX5++ti8Ea2N3Ig==
X-Received: by 2002:a1c:a7d2:: with SMTP id q201mr7040835wme.77.1630045445449; 
 Thu, 26 Aug 2021 23:24:05 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w29sm5654920wra.88.2021.08.26.23.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 23:24:05 -0700 (PDT)
Subject: Re: [PATCH v2 06/11] util/vfio-helpers: Pass Error handle to
 qemu_vfio_dma_map()
To: Klaus Jensen <its@irrelevant.dk>
References: <20210826195014.2180369-1-philmd@redhat.com>
 <20210826195014.2180369-7-philmd@redhat.com>
 <YSh8uKL1jMQwwxDT@apples.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1b593ee5-cde1-9ce3-6019-db9264db9037@redhat.com>
Date: Fri, 27 Aug 2021 08:24:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSh8uKL1jMQwwxDT@apples.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Markus

On 8/27/21 7:48 AM, Klaus Jensen wrote:
> On Aug 26 21:50, Philippe Mathieu-Daudé wrote:
>> Currently qemu_vfio_dma_map() displays errors on stderr.
>> When using management interface, this information is simply
>> lost. Pass qemu_vfio_dma_map() an Error** handle so it can
>> propagate the error to callers.
>>
>> Reviewed-by: Fam Zheng <fam@euphon.net>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/qemu/vfio-helpers.h |  2 +-
>>  block/nvme.c                | 22 +++++++++++-----------
>>  util/vfio-helpers.c         | 10 ++++++----
>>  3 files changed, 18 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/qemu/vfio-helpers.h b/include/qemu/vfio-helpers.h
>> index 4491c8e1a6e..bde9495b254 100644
>> --- a/include/qemu/vfio-helpers.h
>> +++ b/include/qemu/vfio-helpers.h
>> @@ -18,7 +18,7 @@ typedef struct QEMUVFIOState QEMUVFIOState;
>>  QEMUVFIOState *qemu_vfio_open_pci(const char *device, Error **errp);
>>  void qemu_vfio_close(QEMUVFIOState *s);
>>  int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
>> -                      bool temporary, uint64_t *iova_list);
>> +                      bool temporary, uint64_t *iova_list, Error **errp);
>>  int qemu_vfio_dma_reset_temporary(QEMUVFIOState *s);
>>  void qemu_vfio_dma_unmap(QEMUVFIOState *s, void *host);
>>  void *qemu_vfio_pci_map_bar(QEMUVFIOState *s, int index,
>> diff --git a/block/nvme.c b/block/nvme.c
>> index 0786c501e46..80546b0babd 100644
>> --- a/block/nvme.c
>> +++ b/block/nvme.c
>> @@ -176,12 +176,11 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
>>          return false;
>>      }
>>      memset(q->queue, 0, bytes);
>> -    r = qemu_vfio_dma_map(s->vfio, q->queue, bytes, false, &q->iova);
>> +    r = qemu_vfio_dma_map(s->vfio, q->queue, bytes, false, &q->iova, errp);
>>      if (r) {
>> -        error_setg(errp, "Cannot map queue");
>> -        return false;
>> +        error_prepend(errp, "Cannot map queue: ");
>>      }
>> -    return true;
>> +    return r == 0;
>>  }
>>  
>>  static void nvme_free_queue_pair(NVMeQueuePair *q)
>> @@ -239,9 +238,9 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
>>      qemu_co_queue_init(&q->free_req_queue);
>>      q->completion_bh = aio_bh_new(aio_context, nvme_process_completion_bh, q);
>>      r = qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
>> -                          false, &prp_list_iova);
>> +                          false, &prp_list_iova, errp);
>>      if (r) {
>> -        error_setg_errno(errp, -r, "Cannot map buffer for DMA");
>> +        error_prepend(errp, "Cannot map buffer for DMA: ");
>>          goto fail;
>>      }
>>      q->free_req_head = -1;
>> @@ -534,9 +533,9 @@ static bool nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
>>          error_setg(errp, "Cannot allocate buffer for identify response");
>>          goto out;
>>      }
>> -    r = qemu_vfio_dma_map(s->vfio, id, id_size, true, &iova);
>> +    r = qemu_vfio_dma_map(s->vfio, id, id_size, true, &iova, errp);
>>      if (r) {
>> -        error_setg(errp, "Cannot map buffer for DMA");
>> +        error_prepend(errp, "Cannot map buffer for DMA: ");
>>          goto out;
>>      }
>>  
>> @@ -1032,7 +1031,7 @@ static coroutine_fn int nvme_cmd_map_qiov(BlockDriverState *bs, NvmeCmd *cmd,
>>  try_map:
>>          r = qemu_vfio_dma_map(s->vfio,
>>                                qiov->iov[i].iov_base,
>> -                              len, true, &iova);
>> +                              len, true, &iova, NULL);
>>          if (r == -ENOSPC) {
>>              /*
>>               * In addition to the -ENOMEM error, the VFIO_IOMMU_MAP_DMA
>> @@ -1524,14 +1523,15 @@ static void nvme_aio_unplug(BlockDriverState *bs)
>>  static void nvme_register_buf(BlockDriverState *bs, void *host, size_t size)
>>  {
>>      int ret;
>> +    Error *local_err = NULL;
>>      BDRVNVMeState *s = bs->opaque;
>>  
>> -    ret = qemu_vfio_dma_map(s->vfio, host, size, false, NULL);
>> +    ret = qemu_vfio_dma_map(s->vfio, host, size, false, NULL, &local_err);
>>      if (ret) {
>>          /* FIXME: we may run out of IOVA addresses after repeated
>>           * bdrv_register_buf/bdrv_unregister_buf, because nvme_vfio_dma_unmap
>>           * doesn't reclaim addresses for fixed mappings. */
>> -        error_report("nvme_register_buf failed: %s", strerror(-ret));
>> +        error_reportf_err(local_err, "nvme_register_buf failed: ");
>>      }
>>  }
>>  
>> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
>> index e7909222cfd..77cdec845d9 100644
>> --- a/util/vfio-helpers.c
>> +++ b/util/vfio-helpers.c
>> @@ -463,13 +463,15 @@ static void qemu_vfio_ram_block_added(RAMBlockNotifier *n, void *host,
>>                                        size_t size, size_t max_size)
>>  {
>>      QEMUVFIOState *s = container_of(n, QEMUVFIOState, ram_notifier);
>> +    Error *local_err = NULL;
>>      int ret;
>>  
>>      trace_qemu_vfio_ram_block_added(s, host, max_size);
>> -    ret = qemu_vfio_dma_map(s, host, max_size, false, NULL);
>> +    ret = qemu_vfio_dma_map(s, host, max_size, false, NULL, &local_err);
>>      if (ret) {
>> -        error_report("qemu_vfio_dma_map(%p, %zu) failed: %s", host, max_size,
>> -                     strerror(-ret));
>> +        error_reportf_err(local_err,
>> +                          "qemu_vfio_dma_map(%p, %zu) failed: ",
>> +                          host, max_size);
>>      }
>>  }
>>  
>> @@ -725,7 +727,7 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
>>   * mapping status within this area is not allowed).
>>   */
>>  int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
>> -                      bool temporary, uint64_t *iova)
>> +                      bool temporary, uint64_t *iova, Error **errp)
> 
> Won't this break at this point? You add an Error** to qemu_vfio_dma_map,
> but it is never used (so it probably stays NULL). So, above, if
> qemu_vfio_dma_map() returns something not zero, you use error_prepend(),
> which I think expects errp to be non-NULL?

I can't find such restriction documented in "qapi/error.h".

In error.c:

void error_prepend(Error *const *errp, const char *fmt, ...)
{
    va_list ap;

    va_start(ap, fmt);
    error_vprepend(errp, fmt, ap);
    ...

void error_vprepend(Error *const *errp, const char *fmt, va_list ap)
{
    GString *newmsg;

    if (!errp) {
        return;
    }
    ...

> 
> I realize that later patches fixes this, but this sticks out when
> reviewing this on its own.
> 
>>  {
>>      int ret = 0;
>>      int index;
>> -- 
>> 2.31.1
>>
>>
> 


