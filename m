Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B273C4618
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 10:44:31 +0200 (CEST)
Received: from localhost ([::1]:36248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2rYE-0004JQ-Ei
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 04:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rWg-0002np-OD
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:42:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rWe-0000Uu-0s
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626079371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8G/4X/WPeewoxLV6C9ZZfPuUB6o4tJEru7ACbz2p10=;
 b=YkvmE9zCteVM7CQA5zipOz/jLNSRo5EaqMTvdAoZHLU5YorRi9cUWnDIopyNd+YN43kw8j
 xeou1HvpKDwP35n6shHnRMS1syaWgJcYctjAROzoiK0KKpHftJuzbqurtsJGx/Jnl0fpoj
 t1v2FnO6bzU3Kjf+56CuU8o9dM7OHUA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-oJ317ElpP--mwoT8jpJzGQ-1; Mon, 12 Jul 2021 04:42:50 -0400
X-MC-Unique: oJ317ElpP--mwoT8jpJzGQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 cw12-20020a056402228cb02903a4b3e93e15so3144188edb.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 01:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b8G/4X/WPeewoxLV6C9ZZfPuUB6o4tJEru7ACbz2p10=;
 b=kxgZQzxzF5giylK4XFh/mgn95Ht48m3w5806E7Gt0T/otESjCY4DG/xs0nyRloGru9
 chVU3lFAgbsfzA4G6OAPgcIN1jhWfClsIzT0PzFKWTyYAseRBb4nI305Zs+efIEiV17l
 EGS0MSGXWPgyAzhVdaXLbw6gSiIMKNVWHwfeGgRyU4SFlgd+ICBn6useceWaOi81lmAV
 lXuIhh5UeFx2sNL3HiU1PR9XacYUJWiPLHCwbrTT4SL6ExVxQ46ZSI4VPMM1I4YrYbtx
 KsHPPKohEWdWhl+ElkydEpopy3a30nYXMtyFAsqDwqjsuhDuQGZPLPv7IOjNjzHIka6Z
 7ABw==
X-Gm-Message-State: AOAM531PZqa/zdUSsxhyUOPvqoXvuE/W0urGEz/dzkcsWVm/uqyD5zMo
 3BZT1AJ0cykjTOmpnaw8n5YBMED6vE4nI33axas3Hfr9TEOdf27s8NFuHoCDxpVswhO7ZF2qGgf
 9FvOhHVOTXMewMf4fwvCCxvnrvTNe3INDfMxub3a0v2tyhfyZeZjfU2So/MY0/AAhnAk=
X-Received: by 2002:a17:906:f2d7:: with SMTP id
 gz23mr2526226ejb.314.1626079369158; 
 Mon, 12 Jul 2021 01:42:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3f2rt//OnQeiJWPYM9HUaBxt+A8J1Yo+Js930bELHMSCrbOukCS5Umjgz9qYIIno328U1Aw==
X-Received: by 2002:a17:906:f2d7:: with SMTP id
 gz23mr2526204ejb.314.1626079368860; 
 Mon, 12 Jul 2021 01:42:48 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 gg26sm5425063ejb.103.2021.07.12.01.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 01:42:48 -0700 (PDT)
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YOb5EZndlckpruhR@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <1f85b7d3-41fe-e4e0-ec44-b3e1c22293ea@redhat.com>
Date: Mon, 12 Jul 2021 10:42:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YOb5EZndlckpruhR@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.631, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/07/2021 15:09, Stefan Hajnoczi wrote:
> On Wed, Jul 07, 2021 at 06:58:07PM +0200, Emanuele Giuseppe Esposito wrote:
>> This is a continuation on the work to reduce (and possibly get rid of) the usage of AioContext lock, by introducing smaller granularity locks to keep the thread safety.
>>
>> This series aims to:
>> 1) remove the aiocontext lock and substitute it with the already existing
>>     global job_mutex
>> 2) fix what it looks like to be an oversight when moving the blockjob.c logic
>>     into the more generic job.c: job_mutex was introduced especially to
>>     protect job->busy flag, but it seems that it was not used in successive
>>     patches, because there are multiple code sections that directly
>>     access the field without any locking.
>> 3) use job_mutex instead of the aiocontext_lock
>> 4) extend the reach of the job_mutex to protect all shared fields
>>     that the job structure has.
> 
> Can you explain the big picture:
> 
> 1. What are the rules for JobDrivers? Imagine you are implementing a new
>     JobDriver. What do you need to know in order to write correct code?

I think that in general, the rules for JobDrivers remain the same. The 
job_mutex lock should be invisible (or almost) from the point of view of 
a JobDriver, because the job API available for it should take care of 
the necessary locking/unlocking.

> 
> 2. What are the rules for monitor? The main pattern is looking up a job,
>     invoking a job API on it, and then calling job_unlock().

The monitor instead is aware of this lock: the reason for that is 
exactly what you have described here.
Looking up + invoking a job API operation (for example calling 
find_job() and then job_pause() ) must be performed with the same lock 
hold all the time, otherwise other threads could modify the job while 
the monitor runs its command.

Please let me know if something is not clear and/or if you have 
additional comments on this!

Emanuele

> 
> Stefan
> 


