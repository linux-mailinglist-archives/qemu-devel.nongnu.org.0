Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3296B38B2DE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:18:31 +0200 (CEST)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkRS-0003xK-84
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljkOe-0007Rl-Mh
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljkOc-0002pG-3C
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621523732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3vegyKjEXxlYciBM+VVdYJ1nFBzZO1GtzGI5KaoD/U=;
 b=Vvvv3ClLAN8t1GVQi3YOHbwRhKD1GBibXxOWoxcLdRWbn9FPtJE2vaDP/A10y85KOMqZv6
 GIr/nUFirVP1keu5DRi1yruDw2HtrT/KMa79q6O6krNYrTsOsESIl9jFwmlvjQdT0Zhua9
 sdC/P1P7PiCsB9s1OT2LSWpcGEBGbSI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-k-0zm4YRP8SAvqeC3ShkUA-1; Thu, 20 May 2021 11:15:30 -0400
X-MC-Unique: k-0zm4YRP8SAvqeC3ShkUA-1
Received: by mail-ej1-f71.google.com with SMTP id
 p18-20020a1709067852b02903dab2a3e1easo2160121ejm.17
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n3vegyKjEXxlYciBM+VVdYJ1nFBzZO1GtzGI5KaoD/U=;
 b=AB1LJlS++87kn1PmDqX3XqdO2W3G/fD7MiFLi6lbSCjrHkVsGcyDqOoUiKBBv94JpM
 FojFyeoTSiaTpFF0PrpHE/iMn7rLC7xyQgDp5Z2ctE+OCH7Q2PkLyctN5hYaU7nBRtLB
 Pm4P8GFUCl0InGSL/XvZqHTy8XgMbglm1HDznVqiiXZqymswyr0hao+r40eVjfkqSyDH
 qr8xY7bPztKGCr5uhoCK+SoS2s1vmEcGrpHOwW4Gid2tvHGNKqvNE35cIAQtSkhMZn5/
 8anWK9n+GIkenn48YNEu5cI/wvdZx64z7v/kQon/CPPWcfMmQrv262aeRgAO7vKQTsh+
 pReQ==
X-Gm-Message-State: AOAM530v6+oPx+WqqlKpoQkUdPV5AK6FVUSanVJ6mKacPyy83Ho47fKh
 Isfi2NpeUaB9c20o2aC801/0hYoLtJvJsMkeQpn9eqBKUEnDFAD1wk/9Ymd8gFIFJWwEE8ZosZL
 LRMki8Q9AG4S0WzQ+On5FtlSXFRdpiJJZKwECyO7eTpV5gouP36lb40CBNuXSadxdaOI=
X-Received: by 2002:a17:907:c1c:: with SMTP id
 ga28mr5393918ejc.320.1621523728687; 
 Thu, 20 May 2021 08:15:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV/GA4Ge0xDXnuQdUWmEZJDL0XygZjMGGeU9YlyuaP7EKuUKHjDWRcZ7CgLpaCth48ZHjlQA==
X-Received: by 2002:a17:907:c1c:: with SMTP id
 ga28mr5393882ejc.320.1621523728317; 
 Thu, 20 May 2021 08:15:28 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 m10sm1691599edp.48.2021.05.20.08.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 08:15:27 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] block-copy: improve documentation of BlockCopyTask
 and BlockCopyState types and functions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-3-eesposit@redhat.com>
 <833e7298-1293-5fab-4277-3ced3c3347f4@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <58e040eb-a24e-12cd-c9b7-f8efcaa36789@redhat.com>
Date: Thu, 20 May 2021 17:15:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <833e7298-1293-5fab-4277-3ced3c3347f4@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 20/05/2021 17:00, Vladimir Sementsov-Ogievskiy wrote:
> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>> As done in BlockCopyCallState, categorize BlockCopyTask
>> and BlockCopyState in IN, State and OUT fields.
>> This is just to understand which field has to be protected with a lock.
>>
>> BlockCopyTask .zeroes is a special case, because it is only initialized
>> and then read by the coroutine in block_copy_task_entry.
>>
>> Also set block_copy_task_create as coroutine_fn because:
>> 1) it is static and only invoked by coroutine functions
>> 2) next patches will introduce and use a CoMutex lock there
> 
> this change is unrelated, why not to put it into commit, which adds use 
> of CoMutex in that function?

Ok I will move it in patch 4.

> 
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

[...]
> 
> you add an empty line before group, it looks good
> 
>> +    /* State */
>>       int64_t in_flight_bytes;
>> -    int64_t cluster_size;
>>       BlockCopyMethod method;
>> -    int64_t max_transfer;
>> -    uint64_t len;
>>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all 
>> block-copy calls */
>>       QLIST_HEAD(, BlockCopyCallState) calls;
> 
> but not here..

Because these are still State fields, so in the same State group. It is 
a different sub-category.

> 
>> +    /* State fields that use a thread-safe API */
>> +    BdrvDirtyBitmap *copy_bitmap;
>> +    ProgressMeter *progress;
>> +    SharedResource *mem;
>> +    RateLimit rate_limit;
>> +    /*
>> +     * IN parameters. Initialized in block_copy_state_new()
>> +     * and never changed.
>> +     */
>> +    int64_t cluster_size;
>> +    int64_t max_transfer;
>> +    uint64_t len;
>>       BdrvRequestFlags write_flags;
>>       /*

Thank you,
Emanuele


