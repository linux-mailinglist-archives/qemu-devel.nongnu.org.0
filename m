Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82584A8218
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:10:46 +0100 (CET)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZ4d-0005Zu-G3
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:10:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFZ3K-0004hh-S4
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:09:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFZ3H-0003I2-Sg
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643882958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnObJKxt/4ecibQJN8tXpgrexQE6sAQmjW/5NWvY+QA=;
 b=LYY/1Z/nnISKUD2wktsprqDjhfihOSghg6wRBZHwpUnejzxu4YhqSHyoKfTMPCe6T5w1mS
 Tz4ZDmQTQh5Z7DP23iKy5gGCx+KlLqRcMAlJXrR1Y9FMCMyjoTwl54BbwtYcuj29l1WZFR
 tCwYRVqOI454VFXDV/JcKYyvJua6kRs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-iRR6BlQtMQWy4lWIT5RJNg-1; Thu, 03 Feb 2022 05:09:17 -0500
X-MC-Unique: iRR6BlQtMQWy4lWIT5RJNg-1
Received: by mail-wr1-f69.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso479663wrg.7
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wnObJKxt/4ecibQJN8tXpgrexQE6sAQmjW/5NWvY+QA=;
 b=GLqnINiPa7jba8q7lzpQ9O9MnBMAowZ1IIGriRKE13f2GIlNf7gYNyzgyr7hEkff/O
 XB8JflI00wlxth4KKTv8EdzaathOTqbXSPp/GQPwyE9MCOvLDrB68DPaK0oJojSjEH1s
 rFZN2/gpkm/pAlSPpqRyV+XgMJhxLJD4/A223WNhhAhzXHgcIcDictaXxrvq6yIJWAsK
 HXUH9doZXCilNyLw4DAoEC+XWU/50/WWGHfzFWdFnvkeE2nabAj7PKrJjuVp19i8+kWW
 VNJ3eNzfnv9iEFv30u9Tw2pOL4RqYMwe/aMftk71AR0eqs5Oo6g2VwG8Fq1gzz0cN0Pj
 PvwQ==
X-Gm-Message-State: AOAM5322/6Ey5EJ5mUumAcChhjRLZshizU/iaImr4z5bee5LU3qwbDQv
 4M6fOEJXC5iwTL4hYl1J3OyNhwa33pAXfr4WsPr8SBAQ39uRbfTqY2hr9Iuua5zfxIVPB/U+Vn9
 NLIzvpuohAmkGVHU=
X-Received: by 2002:a05:600c:4f84:: with SMTP id
 n4mr9904235wmq.106.1643882956386; 
 Thu, 03 Feb 2022 02:09:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ3tCd4vNnOlul77vv18iIJUFbDomdWL5uF8OoWxQ7kxjNxgMzCEJqkzmq4XfL6avjR1FKXA==
X-Received: by 2002:a05:600c:4f84:: with SMTP id
 n4mr9904213wmq.106.1643882956033; 
 Thu, 03 Feb 2022 02:09:16 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id bi18sm6183738wmb.20.2022.02.03.02.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 02:09:15 -0800 (PST)
Message-ID: <74cd9429-c15c-713d-4e9b-ae6e7a212500@redhat.com>
Date: Thu, 3 Feb 2022 11:09:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 10/12] block.c: add subtree_drains where needed
To: Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-11-eesposit@redhat.com>
 <52eff922-0ca4-fc12-0edb-8eb963ac306c@virtuozzo.com>
 <a2e77f99-3138-0a24-9ced-79f441d42ca4@redhat.com>
 <fbc50950-5124-87a2-a876-6e22e5a10404@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <fbc50950-5124-87a2-a876-6e22e5a10404@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02/02/2022 18:38, Paolo Bonzini wrote:
> On 2/2/22 16:37, Emanuele Giuseppe Esposito wrote:
>> So we have disk B with backing file C, and new disk A that wants to have
>> backing file C.
>>
>> I think I understand what you mean, so in theory the operation would be
>> - create new child
>> - add child to A->children list
>> - add child to C->parents list
>>
>> So in theory we need to
>> * drain A (without subtree), because it can't happen that child nodes of
>>    A have in-flight requests that look at A status (children list),
>> right?
>>    In other words, if A has another node X, can a request in X inspect
>>    A->children

I am not sure if this can happen. It doesn't seem so, though. All
functions inspecting ->parents are either GS or don't call recursive
function that go down on children list again.

>> * drain C, as parents can inspect C status (like B). Same assumption
>>    here, C->children[x]->bs cannot have requests inspecting C->parents
>>    list?

What if C->children[x]->bs drains? we would have a child inspecting
C->parents.

> 
> In that case (i.e. if parents have to be drained, but children need not)
> bdrv_drained_begin_unlocked would be enough, right?

Should be, if that is the case.

> 
> That would mean that ->children is I/O state but ->parents is global
> state.  I think it's quite a bit more complicated to analyze and to
> understand.

Not sure I follow this one, why is ->parents GS? it is also used by the
drain API...

Emanuele


