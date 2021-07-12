Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C593C461A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 10:46:46 +0200 (CEST)
Received: from localhost ([::1]:41010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2raP-0007a9-0U
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 04:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rXS-0004lU-4T
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rXQ-00010c-MA
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626079420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a34T1uehrbk4v5cYTrajLxw5nLFsIidOiZ1uhqg5NLI=;
 b=DRQHORdjVb4m8uehep9dKNqXa4Y+Y6HwfzDIYn4ZLPQ4Sh+zYvLstrqDnJSJs6dukmIm9o
 jCcL4V7PubQmP+N6h2vzcwHtWLUm0VueNEPcK6j+ZEo+Gr8HQ3MgAStMuwNi5vF7gSGy7W
 M3vU50GCOe0UjfpM1Kn89kQT+a1AgiI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-yt7qEBjrMQy54s3TKVxnYg-1; Mon, 12 Jul 2021 04:43:39 -0400
X-MC-Unique: yt7qEBjrMQy54s3TKVxnYg-1
Received: by mail-ej1-f69.google.com with SMTP id
 d2-20020a1709072722b02904c99c7e6ddfso4478571ejl.15
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 01:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a34T1uehrbk4v5cYTrajLxw5nLFsIidOiZ1uhqg5NLI=;
 b=Qq692zaEmPW5rgbGe5zY3usadA2xa6nHHRz9JP4fuXUTgKgWtpl4JYSwavvIJ7H8KR
 07JmkKqpOgD0rDzCtyQtTpJ3ACgTwErv40WgJcZ5/uygtnm/11HQik7aN0Sw8EOR/TQY
 woELcS/ypNBX9pI4Wtkfj36MlXaYTk4hFJCVCapd819CMX7+SrPZ4QHLNvdUZcQSDuof
 NtiVxZM10zHKbUy9jdFgZp7F/A04xWLZnjf8xM+yA8SlA7YDIJQoBoA27VlYiz4/dXx6
 yoS9PKzLlpzmF06MKUoRmaKNau1RgmaVY9Wcqq/5vwBWUsKI0ILWQsq4Glfkbn/SYq3x
 oQiA==
X-Gm-Message-State: AOAM530WJQXzGzlbflY9aaZVGstkBQNpmDbjvT8WBSqZhMI0g/R3QnFu
 1EE4nVEcM2X8VrlMzverLQwS/ooaELQA1kheZOi6S1uxo27Aw+ia1HcO7OV1eDo/IHPW4mTaC67
 TOk7Vi16l/Or3xgKKUL0s+x8j/f2CKKn3T7derSIsV81IoGD1tQXErVCg6XukHeXVJnI=
X-Received: by 2002:a17:906:6d54:: with SMTP id
 a20mr4665741ejt.322.1626079417698; 
 Mon, 12 Jul 2021 01:43:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxbDrPpkK4+S4UoxgTGsHuYU7sGtMdnO2e5q/P/0o3T23sDGqRtJtb++crWO2ATPFEXskD5Q==
X-Received: by 2002:a17:906:6d54:: with SMTP id
 a20mr4665720ejt.322.1626079417557; 
 Mon, 12 Jul 2021 01:43:37 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 ck25sm380006edb.96.2021.07.12.01.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 01:43:37 -0700 (PDT)
Subject: Re: [RFC PATCH 4/6] job.h: categorize job fields
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <20210707165813.55361-5-eesposit@redhat.com>
 <YObbS4aY/9bFBaFX@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <2faaf85c-3979-2f5a-723d-98cf214baf4a@redhat.com>
Date: Mon, 12 Jul 2021 10:43:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YObbS4aY/9bFBaFX@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.631, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 08/07/2021 13:02, Stefan Hajnoczi wrote:
> On Wed, Jul 07, 2021 at 06:58:11PM +0200, Emanuele Giuseppe Esposito wrote:
>> -    /** AioContext to run the job coroutine in */
>> +    /**
>> +     * AioContext to run the job coroutine in.
>> +     * Atomic.
>> +     */
>>       AioContext *aio_context;
> 
> This isn't accessed using atomic operations, so I'm not sure why it's
> documented as atomic?
> 
Maybe this is unnecessary, but from what I understand right now when we 
want to change the AioContext of a child node, we need to acquire its 
AioContext lock, and then we try to set it. Without AioContext locks, my 
understanding is that this has to be protected somehow. Therefore I 
thought of setting this pointer atomically (actual code that does this 
is in patch 5).

Again same reasoning style applies here: this patch just adds a bounce 
of comments, but merging it with next one would just make it more 
unreadable.

Emanuele


