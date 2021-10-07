Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C6F42547C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:41:41 +0200 (CEST)
Received: from localhost ([::1]:57042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTeW-00064t-LO
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYTXX-0001A8-9y
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:34:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYTXU-0005W0-GN
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633613663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/j/HHSVtJr6PIJG22FVs1Os873ZgesmCnYbTsB90PtQ=;
 b=PlA3HAYjxGgLcHtNWtRaIQ99TLQMsg5C3aMb4N9hB2SNxDOEbQ/zBc7q7oQpzzilFnVNkJ
 St/WlGN7UtC0dyuFFIsPdF67EbgvzpaMT8peHLFDtp6EDVodVDsSf5VJuEE+Bz+CYdsExr
 Q5NSMlvwRiSST2HRDSf7Ocyb5V8pCP0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-1WltJ2V6NPKvXKw3MBqtzA-1; Thu, 07 Oct 2021 09:34:22 -0400
X-MC-Unique: 1WltJ2V6NPKvXKw3MBqtzA-1
Received: by mail-wr1-f70.google.com with SMTP id
 m17-20020adffa11000000b00160c1ac74e9so4709936wrr.9
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/j/HHSVtJr6PIJG22FVs1Os873ZgesmCnYbTsB90PtQ=;
 b=6G9kTLkgL20qGQdCY5D0ydg1qaQBBTx1OkYc1//82RqCkJdVDKUnObKHK1/+DWsl9L
 TuMHSpn6Yd5LZbIz+wh8wucXTTTrxGh6VFP7+lgXP172enwCvxt5Oae2t793uW6rCXG3
 qSPtqwd2lG6JnLyus2FpZmVqRHTBYGiF27Lj79dFmnUoBD+xUFCcQVZvKI993+g9YDPo
 +Ol/iNwoYLocP2eYdhI8cBo7OvfYqPHVNXUJ4olUR2+AQ39u+bT1jeXdK4UOWxCCMnmf
 PRrMGsf4WQXor6Kzt5OgGQQfOwWhSnwjAEAM0AaEvn+1xTg1q+cKPxDCSTw6ZaKpwnq4
 iY+Q==
X-Gm-Message-State: AOAM533ReoL/wkhrc5RqvHvNQcNkWoPSLSwcMubWd95noK1h5LSlPzim
 iWhxeEpd3bqJzUCqd5vqggZDt+AFtxZR3+pva7Lp8LZFbK4g+KrG6Vm4MGV6f4oTJzRzvKxndQz
 0J76oJpK9IQCygec=
X-Received: by 2002:adf:a486:: with SMTP id g6mr5458122wrb.130.1633613661252; 
 Thu, 07 Oct 2021 06:34:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0IzvfijkkXYl4kIpksiQAFMH/brTu9BhGMhgVas4fGA5ziEDciIF/kS4WmaTWgPNX2fQQ4A==
X-Received: by 2002:adf:a486:: with SMTP id g6mr5458080wrb.130.1633613660960; 
 Thu, 07 Oct 2021 06:34:20 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o26sm8824414wmc.17.2021.10.07.06.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 06:34:20 -0700 (PDT)
Message-ID: <19edd050-c09f-2039-0c89-50bcae61321f@redhat.com>
Date: Thu, 7 Oct 2021 15:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 5/5] block/nvme: Fix memory leak from nvme_init_queue()
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211006164931.172349-1-philmd@redhat.com>
 <20211006164931.172349-6-philmd@redhat.com>
 <YV72QsbNN3Eb2kLV@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YV72QsbNN3Eb2kLV@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 15:29, Stefan Hajnoczi wrote:
> On Wed, Oct 06, 2021 at 06:49:31PM +0200, Philippe Mathieu-Daudé wrote:
>> nvme_create_queue_pair() allocates resources with qemu_vfio_dma_map(),
>> but we never release them. Do it in nvme_free_queue() which is called
>> from nvme_free_queue_pair().
>>
>> Reported by valgrind:
>>
>>   ==252858== 520,192 bytes in 1 blocks are still reachable in loss record 8,293 of 8,302
>>   ==252858==    at 0x4846803: memalign (vg_replace_malloc.c:1265)
>>   ==252858==    by 0x484691F: posix_memalign (vg_replace_malloc.c:1429)
>>   ==252858==    by 0xB8AFE4: qemu_try_memalign (oslib-posix.c:210)
>>   ==252858==    by 0xA9E315: nvme_create_queue_pair (nvme.c:229)
>>   ==252858==    by 0xAA0125: nvme_init (nvme.c:799)
>>   ==252858==    by 0xAA081C: nvme_file_open (nvme.c:953)
>>   ==252858==    by 0xA23DDD: bdrv_open_driver (block.c:1550)
>>   ==252858==    by 0xA24806: bdrv_open_common (block.c:1827)
>>   ==252858==    by 0xA2889B: bdrv_open_inherit (block.c:3747)
>>   ==252858==    by 0xA28DE4: bdrv_open (block.c:3840)
>>   ==252858==    by 0x9E0F8E: bds_tree_init (blockdev.c:675)
>>   ==252858==    by 0x9E7C74: qmp_blockdev_add (blockdev.c:3551)
>>
>> Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  block/nvme.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/block/nvme.c b/block/nvme.c
>> index 6e476f54b9f..903c8ffa060 100644
>> --- a/block/nvme.c
>> +++ b/block/nvme.c
>> @@ -185,6 +185,7 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
>>  
>>  static void nvme_free_queue(BDRVNVMeState *s, NVMeQueue *q)
>>  {
>> +    qemu_vfio_dma_unmap(s->vfio, q->queue);
>>      qemu_vfree(q->queue);
>>  }
> 
> I can't figure out the issue. qemu_vfree(q->queue) was already called
> before this patch. How does adding qemu_vfio_dma_unmap() help with the
> valgrind report in the commit description?

You are right, I think I didn't select the correct record
between the 8302 reported by valgrind. I will revisit, thanks.


