Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6804538136E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 23:54:43 +0200 (CEST)
Received: from localhost ([::1]:43374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhfla-00069o-1G
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 17:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhfkW-00051B-8a
 for qemu-devel@nongnu.org; Fri, 14 May 2021 17:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhfkS-0007Hi-S9
 for qemu-devel@nongnu.org; Fri, 14 May 2021 17:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621029211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdvEUQITdR/3Mah+50FJlV7zO32a+AzQ6nCGd/k1mA0=;
 b=KkLhJlGpuk5+qtJjMVJFRnVWiVeTbYNyu+3XOveU7d+WF0WPjE26BloVegFNgoQtjRSFSp
 i9mH+soUASSZYQxDuDDloCZVr1ssV8X2BFHVj7NDIbJQuKeT7+zf9ojzbjf0jRfNUR4dx6
 M+BJ9Zx+WeRuQusd2yR+WgdWJkja+K8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-pZrfvOQeOO2I2G6YCAgW7Q-1; Fri, 14 May 2021 17:53:30 -0400
X-MC-Unique: pZrfvOQeOO2I2G6YCAgW7Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 h18-20020a05640250d2b029038cc3938914so82209edb.17
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 14:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qdvEUQITdR/3Mah+50FJlV7zO32a+AzQ6nCGd/k1mA0=;
 b=jFZ/pvr750FDtGwcyjRh3IjJxJuyy7c0wpUt5UwPo2N1JHMVHlhtCEXE8RAPMKYjfZ
 XJWhU1QRSVQaBH2dV5awKY75dNyBZXHLqkZn2htZnX1wiY6/MLGRwJ7hmMyo9SPwzbuN
 owEPgktywPJwIUCSbVyXCwb/mczdbM9G7Q51rTyeLwPjPAGKm4nSTbijZwbH9SgHK+Li
 YBrbBLurMwfNHH/zz77EPD8tspN+JqBVdse0JzxrPZ3fJJ1syf6RPE59uCNdr0O2LUlo
 L47b2+1b3Ezlvg+89x1OVISckQU/1TUQT8MZrCU7MHZJBfiw3dSz/TfCgx38zWEZCwAZ
 xOhQ==
X-Gm-Message-State: AOAM531V+d0gUw4qI1Omcf+/j7RTcdXBWL0/v5LBHrwsRu2AgrkA2CwZ
 Xl+fLWo66e6VtIGyWo9TjF8nOyBRRp/28zRPcw5Bpw/YDDip3xAkxyxWTuch5GnvZnKHrPiLQ0E
 Vkrfrh8lrqI2eXtZQ0PjnADRLl5FQN2dVc3KDUZv8DfhwsCCif0wnqclrBrGgtcLKo2k=
X-Received: by 2002:a17:906:2854:: with SMTP id
 s20mr23725681ejc.335.1621029208690; 
 Fri, 14 May 2021 14:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqYjuinoF/0nNCmoaEv86hdBQoS4LO2VvG4Nfp+aYfCgKVcf3sNxP1Yd0eYz+4IZ7rtSCM2A==
X-Received: by 2002:a17:906:2854:: with SMTP id
 s20mr23725659ejc.335.1621029208369; 
 Fri, 14 May 2021 14:53:28 -0700 (PDT)
Received: from ?IPv6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id i25sm4269710eje.6.2021.05.14.14.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 14:53:27 -0700 (PDT)
Subject: Re: [PATCH 5/6] co-shared-resource: protect with a mutex
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-6-eesposit@redhat.com>
 <YJv3+y42z0Ld1nY0@stefanha-x1.localdomain>
 <6d1e432e-f18a-39a4-0bb6-2a14347c2905@redhat.com>
 <6b9d7c37-aaf7-1745-260b-4cce8f0891ee@virtuozzo.com>
 <8008b39d-905c-3858-a96f-8609801a4ae0@redhat.com>
 <24be08c6-d1f1-802c-a045-3a5c3fe102b0@virtuozzo.com>
 <ce9c970e-d7f2-fef9-8b07-b1fc5f634cc6@redhat.com>
 <dfb58ab5-a7ea-edf8-5278-6b666aa6097b@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <dc635abd-6beb-863a-6560-1531a0cd5dc6@redhat.com>
Date: Fri, 14 May 2021 23:53:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dfb58ab5-a7ea-edf8-5278-6b666aa6097b@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>>>>> we want to get from shres here, after possible call to 
>>>>> block_copy_task_shrink(), as task->bytes may be reduced.
>>>>
>>>> Ah right, I missed that. So I guess if we want the caller to protect 
>>>> co-shared-resource, get_from_shres stays where it is, and put_ 
>>>> instead can still go into task_end (with a boolean enabling it).
>>>
>>> honestly, I don't follow how it helps thread-safety
>>
>>  From my understanding, the whole point here is to have no lock in 
>> co-shared-resource but let the caller take care of it (block-copy).
>>
>> The above was just an idea on how to do it.
> 
> But how moving co_put_to_shres() make it thread-safe? Nothing in 
> block-copy is thread-safe yet..
> 
Sorry this is my bad, I did not explain it properly. If you look closely 
at the diff I sent, there are locks in a similar way of my block-copy 
initial patch. So I am essentially assuming that block-copy has already 
locks, and moving co_put_to_shres in block_copy_task_end has the purpose 
of moving shres "in a function that has a critical section".

>>>>>>> @@ -269,6 +270,7 @@ static void coroutine_fn 
>>>>>>> block_copy_task_end(BlockCopyTask *task, int ret)
>>>>>>>           bdrv_set_dirty_bitmap(task->s->copy_bitmap, 
>>>>>>> task->offset, task->bytes);
>>>>>>>       }
>>>>>>>       qemu_co_mutex_lock(&task->s->tasks_lock);
                ^^^ locks
>>>>>>> +    co_put_to_shres(task->s->mem, task->bytes);
>>>>>>>       task->s->in_flight_bytes -= task->bytes;
>>>>>>>       QLIST_REMOVE(task, list);
>>>>>>>       progress_set_remaining(task->s->progress,

		unlocks here (not shown in the diff)
	 }

Hopefully now it is clear. Apologies again for the confusion.

Emanuele


