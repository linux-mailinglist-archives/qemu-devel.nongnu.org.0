Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F4238CB44
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 18:49:03 +0200 (CEST)
Received: from localhost ([::1]:45076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8Kc-0002Y5-Fq
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 12:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk8J7-0001hI-Od
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:47:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk8J4-0004hG-Iz
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621615645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahEpdhHHs73XCb2FGRdDZAWM07nEcizFI//VnC2x2Kk=;
 b=OWmdEW38LkcH50MYI9nhhaUMh5MJElLhzP8xepBUE6/BEZsmTrnKGx5JmjZx+a1f2xIeAX
 SML1YNyIFtfgVanSW4IhbINeG9Zs2/TLMSys5ndWD9CYiTJ4azx4eaops+5UniOs+DVRIz
 I6p4Wg1fcaXDoQLdiVZ5rKT8Zddz17g=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-rNnU9CsWNLi8zW-vL_jUYw-1; Fri, 21 May 2021 12:47:24 -0400
X-MC-Unique: rNnU9CsWNLi8zW-vL_jUYw-1
Received: by mail-ej1-f72.google.com with SMTP id
 h18-20020a1709063992b02903d59b32b039so6294307eje.12
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 09:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ahEpdhHHs73XCb2FGRdDZAWM07nEcizFI//VnC2x2Kk=;
 b=fmLsOaMn6qSlcGuBRFtvD6EwRt6H4+GQ5GW4bDG2tKntxXGfphvy2FLhmRGVlkuXGL
 clAYjQz+pZgB0hOUJbAUh7AOLfiF7nE58DE1vJ94LRWgbRfWQUNeeGmqe51WMkyvNLSv
 olPPfYjP9IuiPePALP/6QxVgzwtszRjmnjxfkMgjfwXBwxqI9aCVfTFlN5qQNhxW4H6c
 VexlNgverq08GYzejz2aKT70VjZKP1iyzaXYDqACjGQU0two3svouaXql2SfBXrlab01
 L2Uv3J7oKIPceQ/YPpb+vOVkEFcNprPjSDoa/FIMxlEYyu65+ErDINGgYVWBSx56q8ga
 Bcjw==
X-Gm-Message-State: AOAM532ytHMJYmdbw0LNogTZhiLHFAkuQotcTDwj04NfsKrWsASSFxSc
 oUkyomDuJK/QGCGzXEFQXMxSM1LvWZXBNcldPNEVtopjJ7Gt1RMlHgVG7jvJEeSYq9G7BFv1Pu+
 EW5Ei0RHAIr9bX61BWWdsxmb/LhKkb0RwIOD7q7fZ5qokz0ePKp7cMJOmxUozre0zcwM=
X-Received: by 2002:a17:906:680d:: with SMTP id
 k13mr11391727ejr.371.1621615642732; 
 Fri, 21 May 2021 09:47:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh/IUaWEDFoOZQrPt/wHwzPfXW0gMmCSp1jdY6LhMGJq5UG/0VJjzRNrGxsSenfrI+yfYLNQ==
X-Received: by 2002:a17:906:680d:: with SMTP id
 k13mr11391694ejr.371.1621615642443; 
 Fri, 21 May 2021 09:47:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q25sm3883989ejd.9.2021.05.21.09.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 09:47:21 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-7-eesposit@redhat.com>
 <068832dd-c577-0234-4a1d-dfdae6a5b4dd@virtuozzo.com>
 <05e94bee-8ee8-e23f-19c1-a7fcb540e080@redhat.com>
 <9dd72513-87f6-bb54-2364-35e767e903e4@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <11060538-b2dc-cd00-a898-7ec6292b6ae9@redhat.com>
Date: Fri, 21 May 2021 18:47:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9dd72513-87f6-bb54-2364-35e767e903e4@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/21 17:56, Vladimir Sementsov-Ogievskiy wrote:
> 21.05.2021 18:02, Paolo Bonzini wrote:
>> On 20/05/21 17:34, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>>> By adding acquire/release pairs, we ensure that .ret and .error_is_read
>>>> fields are written by block_copy_dirty_clusters before .finished is 
>>>> true.
>>>
>>> As I already said, please, can we live with one mutex for now? 
>>> finished, ret, error_is_read, all these variables are changing 
>>> rarely. I doubt that performance is improved by these atomic 
>>> operations. But complexity of the architecture increases exponentially.
>>
>> The problem is that these are used outside coroutines. 
>> load-acquire/store-release is the simplest way to handle a "finished" 
>> flag really.
>>
> 
> Related, maybe we can support CoMutex outside of coroutine context?
> 
> Create a coroutine, which will lock the mutex and unlock it for us... Or 
> something like this.. It will help the task of making everything 
> thread-safe a lot

No, it's not possible because the coroutine will yield to the caller if 
the mutex is contended, but the caller will not be able to use the data 
that is protected by the mutex.

There is no reason to have stuff like block_copy_call_status be a 
coroutine_fn.  Even if it's only called from a coroutine today I'd 
rather have the code more future proof.

Paolo


