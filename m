Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962D94C289A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:56:30 +0100 (CET)
Received: from localhost ([::1]:37822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNArN-0005Zx-Ne
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:56:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNAnz-0004XF-Ex
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:52:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNAnx-0003F1-Lc
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645696377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6r2yEYe1sh4EuEje4qD2qIFL6kwm3BpC8AWI1pDdc4=;
 b=dxd3goMDxsb7veEkwJGqDJx+YZbMJgJghdeDUybbQNK3rxx/zp61f7r5M5rjvs/RCge7Vx
 5/tx/1UdkTjBDGHkCG9Zu0c+q6THZYKlO1PuvnMS3d0cQOSpPA6wWTE92xEQxbhvXKGZPn
 pnFVrPhUT5hPBswjxF+eXszqX0m/o48=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-P2659s5GNF6LUUiB7s5Zkg-1; Thu, 24 Feb 2022 04:52:56 -0500
X-MC-Unique: P2659s5GNF6LUUiB7s5Zkg-1
Received: by mail-qk1-f199.google.com with SMTP id
 k23-20020a05620a139700b0062cda5c6cecso2019330qki.6
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 01:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r6r2yEYe1sh4EuEje4qD2qIFL6kwm3BpC8AWI1pDdc4=;
 b=HIoDtZje+/G53JaGZKb3p+amIJppQA9+FmZ+mqZWuR9RI8F7xXVAlZtiTquBit/dQu
 vSGVSmKkCYXh4n8xrkMm5fMCSDkcnxAr+May4DqV09mgO2kHx5YAuN5L8qfMU6uhNyzy
 qqqCdJiELjv0Mu3u0u3gUauANAV8TN5alMluYMlwt7FCgxGQvGdaf3ERc87sgzz7Rb3I
 BGOlJn2fP8KQZdVZK8VMO5OE5kNHb3FnH8d0+8SMdTjrN3vnk5thXwfJI5Ugdy3rJjFf
 o+Lgh62yGyKxM11qIz1xPfv8P4U94WJeY6mXl4RPBiJC0BqWZvZnWj71WN4aQkZdQwEo
 z6aw==
X-Gm-Message-State: AOAM532nVoLadAL6LDMpn2bAHldfn1tUqgjabX9IfqxjAnir+xspN8K/
 LwQ6EGJtDY7MUe7GQvmDxVu74Lc2yKDW1T6CB7vtfu2etMrDDk9JriGrMFgxWwPIvXaa3QXGrXv
 oqIlUC+EFcdtvSco=
X-Received: by 2002:a37:62d5:0:b0:47e:1755:2ad8 with SMTP id
 w204-20020a3762d5000000b0047e17552ad8mr1048444qkb.561.1645696375563; 
 Thu, 24 Feb 2022 01:52:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwjInUu7h8j5ryE574s8sjfp6bkuNJn9u5ygc7nYvejRYd9S9YTq96NS1PDbL7cymXj4EQEQ==
X-Received: by 2002:a37:62d5:0:b0:47e:1755:2ad8 with SMTP id
 w204-20020a3762d5000000b0047e17552ad8mr1048436qkb.561.1645696375354; 
 Thu, 24 Feb 2022 01:52:55 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id f8sm1138845qkm.33.2022.02.24.01.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 01:52:55 -0800 (PST)
Message-ID: <aea216c8-986c-3596-2acc-524217f3a683@redhat.com>
Date: Thu, 24 Feb 2022 10:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 07/20] job.h: add _locked duplicates for job API
 functions called with and without job_mutex
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-8-eesposit@redhat.com>
 <Yg5ZpqTZkoKAmTPZ@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yg5ZpqTZkoKAmTPZ@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17/02/2022 15:20, Stefan Hajnoczi wrote:
> On Tue, Feb 08, 2022 at 09:35:00AM -0500, Emanuele Giuseppe Esposito wrote:
>>  static void job_exit(void *opaque)
>>  {
>>      Job *job = (Job *)opaque;
>>      AioContext *ctx;
>> +    JOB_LOCK_GUARD();
>>  
>>      job_ref(job);
>>      aio_context_acquire(job->aio_context);
> 
> The previous patch said:
> 
>   We don't want this, as job_lock must be taken inside the AioContext
>   lock, and taking it outside would cause deadlocks.

This was misleading (and thus removed). You have to remember that at
this point JOB_LOCK_GUARD is nop.
I will add this to the commit message too.

> 
> Therefore this looks like a deadlock.
> 


