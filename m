Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC8747E54C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 16:02:06 +0100 (CET)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0PbZ-0003SV-3S
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 10:02:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n0PZV-0001g4-Sb
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 09:59:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n0PZT-0008SN-Ai
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 09:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640271594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/KnJlg3MpessFxhZGC14L8gc4hAMXG029JF2TzuJ4s=;
 b=eIcElbRcJjD9glMoSXcpJlYTTeqHvUXDSvY+IkyIE9skykIU67IdFQnzDz7CLW9c18Kl2Z
 DIRn8xSzJc+wvWjSXDr4dtzUKgg63XoibM0FisvZUGlUmrQ1ARSLMkmQqlwf9TtJ40UbrH
 LSqULpx+x/Va60u3cVm25DPpCsoNhOU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-3V-0gbqnPeimU8O32OO6Ow-1; Thu, 23 Dec 2021 09:59:53 -0500
X-MC-Unique: 3V-0gbqnPeimU8O32OO6Ow-1
Received: by mail-ed1-f72.google.com with SMTP id
 dz8-20020a0564021d4800b003f897935eb3so4698133edb.12
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 06:59:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6/KnJlg3MpessFxhZGC14L8gc4hAMXG029JF2TzuJ4s=;
 b=6WuNR/CfesuIwFKBzKNghvhMVaQuHsNtBI2cBHj4bsQVR+Zbg0mBH6PPbfAmYJhHHb
 iccA/JOi4RVbCXlCzJiKb7B8wpvIZ+scNn8DUNWQhQDPUlTuhhF6O8GKqvK5z+jgbMvV
 swf8ErrA4deUTPIhVQJxeEJBemiXlw7UNZPh4AwboJbuXpCTNEfNwUaw+sA68annpXjG
 PuKwI8NEP6fmIGHRplXFmEW/tie7xAQezrGsf5mEWu4QE0bAecBtMKT341CNw1H8+Owd
 a+J612ffsZpC4jW4Q6uQB4Z9rfkoKi/TFzmTsTKJMeiP5fzesLcK7z8tIyXn9yHDLAO7
 DsfQ==
X-Gm-Message-State: AOAM531iWiGcSYO3wbvkoyW+rlOnDwH3nHzp+ixLvEO+ecvBEYHOZHHj
 ToMVK79n3gugqUc+kEZ21040fU1FWYd2GSx3QkLP9m5XXJc0rB+QfgxImHJWDPLsW7BEZCGX6QS
 dG8l1kQ4PJCNjcvQ=
X-Received: by 2002:a17:906:d96a:: with SMTP id
 rp10mr2149136ejb.614.1640271592069; 
 Thu, 23 Dec 2021 06:59:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRl8HgyX9pEWSRyHOAaJ54M0eYotj2ixS4ICOtTRcMVHDZb3djCpA7mzb+DfOsGOExMivhOQ==
X-Received: by 2002:a17:906:d96a:: with SMTP id
 rp10mr2149106ejb.614.1640271591725; 
 Thu, 23 Dec 2021 06:59:51 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id o12sm2121498edz.71.2021.12.23.06.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 06:59:51 -0800 (PST)
Message-ID: <66c34b8b-c363-4411-ff7e-0a2272fa1629@redhat.com>
Date: Thu, 23 Dec 2021 15:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 14/14] job.c: enable job lock/unlock and remove
 Aiocontext locks
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-15-eesposit@redhat.com>
 <6a0523e4-58d2-ba43-f6d9-f5ff9b616549@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <6a0523e4-58d2-ba43-f6d9-f5ff9b616549@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 18/12/2021 13:24, Vladimir Sementsov-Ogievskiy wrote:
> 04.11.2021 17:53, Emanuele Giuseppe Esposito wrote:
>> --- a/block/replication.c
>> +++ b/block/replication.c
>> @@ -728,9 +728,11 @@ static void replication_stop(ReplicationState 
>> *rs, bool failover, Error **errp)
>>            * disk, secondary disk in backup_job_completed().
>>            */
>>           if (s->backup_job) {
>> +            aio_context_release(aio_context);
>>               job_lock();
>>               job_cancel_sync(&s->backup_job->job, true);
>>               job_unlock();
>> +            aio_context_acquire(aio_context);
> 
> 
> Why we need it? If we never acquire aio context under job_lock, it 
> should be safe to make a job-mutex critical section inside aio-context 
> critical section.
> 

Right, it works also with the aio context taken.
I will remove this hunk.

Thank you,
Emanuele


