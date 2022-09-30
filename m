Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E64A5F0DFE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:51:45 +0200 (CEST)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHMd-0001tk-Tf
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oeHHl-0006jO-V8
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:46:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oeHHZ-0002A8-Cs
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664549184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLT1vsWtrElpFRF3nx8Gbio+d2zNDP+EDV00OnElrgg=;
 b=YT1zfluzBTEyze9U1sv+kYAb0y1og1enHZd3L7HuhwYnaQFfL1YLf4azKmBRR/TG3jJqPn
 XWD1+nDr49BqIv0w/BSpD8Q5oNPmwHui5v1m9tvtjKsa+JutgGn3vpxwKAkMKUJJLwtMCg
 +g8JnM5pPjv5JhUCHTJQAPYr6RnrY7k=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-mQzSuhVlP1OCb9Kki8_YMw-1; Fri, 30 Sep 2022 10:46:20 -0400
X-MC-Unique: mQzSuhVlP1OCb9Kki8_YMw-1
Received: by mail-qk1-f200.google.com with SMTP id
 k2-20020a05620a414200b006ceec443c8bso3923989qko.14
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 07:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jLT1vsWtrElpFRF3nx8Gbio+d2zNDP+EDV00OnElrgg=;
 b=d+XnLfDXdClnYzD1g6ybjOMR3zDMhGET8TBnu1GYUJIBIH33Pg6+EBj+jG6MUHa3N7
 jHc4gIrOrmnb1O7uFUU9Edcp5B3e28nHWOWE3JG6QH2WNWgkbc3J6mZt/vyb2Sk+b+3r
 xUsWPbXqH+XTZnJedeZFnviqnXxVVCsxGg+sFSPJ2OJJtf3Rsc5BzU8tpsNUbYxBa2qi
 vyZmirhkZZ/KuITaHVipsfmbGzUBgTXR4FP8udWrNJTWqULZ7qNpd1TN2WQg9+oaTM/x
 IYRY5JxXT1k7ONSe/BGRk7i2I1JFvINqM3hI+2JdX0wXeWaxBrBR8fObgaH6OMT1uX9l
 VV0A==
X-Gm-Message-State: ACrzQf3twfN/8tg+RXeJlEUMR+ygF8P8Wh6LxHd6YhVZT4aPcez6W2VF
 mgKhUSH7SPALRHkkA+RpPwE4BEvLCZ2qk0UbQP08ugyjHYtigRdndffwP9qY9YwXfYKSeB66TKb
 bEy9hF3Nol8vdwCs=
X-Received: by 2002:ae9:c105:0:b0:6ce:e3d8:73af with SMTP id
 z5-20020ae9c105000000b006cee3d873afmr6325831qki.105.1664549179920; 
 Fri, 30 Sep 2022 07:46:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7RWt6J/sib7Hrwfrvwz3Vei2CU/jbcB5uVDvx/+SEcpdxBR20jlzjg0xrd+8xogPfflywdyw==
X-Received: by 2002:ae9:c105:0:b0:6ce:e3d8:73af with SMTP id
 z5-20020ae9c105000000b006cee3d873afmr6325808qki.105.1664549179698; 
 Fri, 30 Sep 2022 07:46:19 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05620a400800b006bb9e4b96e6sm2836287qko.24.2022.09.30.07.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:46:18 -0700 (PDT)
Message-ID: <0cced85e-3ac7-cb3d-a00e-2e9831cca923@redhat.com>
Date: Fri, 30 Sep 2022 16:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] thread-pool: use ThreadPool from the running thread
Content-Language: en-US
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20220609134452.1146309-1-eesposit@redhat.com>
 <20220609134452.1146309-3-eesposit@redhat.com> <YzW6FkfT9LT7aE7d@redhat.com>
 <29c33add-81ca-5a16-a02a-d2a0c5bfaf88@redhat.com>
In-Reply-To: <29c33add-81ca-5a16-a02a-d2a0c5bfaf88@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.583, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 30/09/2022 um 14:17 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 29/09/2022 um 17:30 schrieb Kevin Wolf:
>> Am 09.06.2022 um 15:44 hat Emanuele Giuseppe Esposito geschrieben:
>>> Remove usage of aio_context_acquire by always submitting work items
>>> to the current thread's ThreadPool.
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>
>> The thread pool is used by things outside of the file-* block drivers,
>> too. Even outside the block layer. Not all of these seem to submit work
>> in the same thread.
>>
>>
>> For example:
>>
>> postcopy_ram_listen_thread() -> qemu_loadvm_state_main() ->
>> qemu_loadvm_section_start_full() -> vmstate_load() ->
>> vmstate_load_state() -> spapr_nvdimm_flush_post_load(), which has:
>>
>> ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
>> ...
>> thread_pool_submit_aio(pool, flush_worker_cb, state,
>>                        spapr_nvdimm_flush_completion_cb, state);
>>
>> So it seems to me that we may be submitting work for the main thread
>> from a postcopy migration thread.
>>
>> I believe the other direct callers of thread_pool_submit_aio() all
>> submit work for the main thread and also run in the main thread.
>>
>>
>> For thread_pool_submit_co(), pr_manager_execute() calls it with the pool
>> it gets passed as a parameter. This is still bdrv_get_aio_context(bs) in
>> hdev_co_ioctl() and should probably be changed the same way as for the
>> AIO call in file-posix, i.e. use qemu_get_current_aio_context().
>>
>>
>> We could consider either asserting in thread_pool_submit_aio() that we
>> are really in the expected thread, or like I suggested for LinuxAio drop
>> the pool parameter and always get it from the current thread (obviously
>> this is only possible if migration could in fact schedule the work on
>> its current thread - if it schedules it on the main thread and then
>> exits the migration thread (which destroys the thread pool), that
>> wouldn't be good).
> 
> Dumb question: why not extend the already-existing poll->lock to cover
> also the necessary fields like pool->head that are accessed by other
> threads (only case I could find with thread_pool_submit_aio is the one
> you pointed above)?
> 

That would be a good replacement for the aio_context lock in
thread_pool_completion_bh(), I think.

> Thank you,
> Emanuele
> 


