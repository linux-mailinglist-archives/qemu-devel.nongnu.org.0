Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BF94DCB30
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:24:22 +0100 (CET)
Received: from localhost ([::1]:51718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsvE-0005Pz-Vg
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:24:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUsuL-0004Yl-6e
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:23:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUsuI-0003UT-6M
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647534192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5EZysGT/4TDtsPwhEug+OxWRKF+UeotA1id6vIJ9uY=;
 b=Fdtg5nKVM3ieWi2joHypAiKsw7eRNd0X7zL6k7yRf6Iri1chTL9FVLwzOXBVAJeTS2SVjQ
 l7bUZpzGDfPybJDmmRdn/LEU64w00gD6ykFQwPtHnSqcBeuC0Jt1NHdujkH/RQL2RumQUH
 7GevTuzwiD2NPZsMjPbdHJ9swuNTtU8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-1HJC_BZ4OlaaEU29sja8Yg-1; Thu, 17 Mar 2022 12:23:11 -0400
X-MC-Unique: 1HJC_BZ4OlaaEU29sja8Yg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o10-20020a1c4d0a000000b0038c6e5fcbaeso1983156wmh.9
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=H5EZysGT/4TDtsPwhEug+OxWRKF+UeotA1id6vIJ9uY=;
 b=R0q181NU9FE3lB0QvXNQqzFxjADA9M5zUmKbBsDTIjKRP0539HIBGRbzoTdgtLIpZJ
 muuZtBw8aqgWwKZb4bJ4pnGE6UWHjU6t6AfE+wTVM8DwXBMZ95+VEti9AKQ7v3mqfx2I
 oRB/kuTsW+1nahjh1lOfTo5wMQ4L5pfGkjXX8Y+IRiHlfGpDKt7Lvx+Wj3PncH/ixzHU
 0TIP5DU/Ru7z5enYkzgFW5/tJ9gtjRdB0GnBg1qsch9kMdtp3C1WK+F5wm0w1o7QKVEr
 naKtrHeqM1EyNTNfo+ltNBZA+TCqZsQO8gZqqKHfzW/Izfm7R4vRvd0K10eowT578LDn
 eDuw==
X-Gm-Message-State: AOAM532aTSO8IZXa+IYY0fcBDEcVVeUQR686sFCeLr51tQC1d/2AgVBD
 T++swDiStkJ3R+rgE4siKTaStqbXDjbI+Rh9GZy5qpPOD5IZY0UEQfsfR+qXMavHfDkTZ2VhkAC
 Mvf9DqiuKL56K8kg=
X-Received: by 2002:adf:ed50:0:b0:203:da73:e0fd with SMTP id
 u16-20020adfed50000000b00203da73e0fdmr4716005wro.516.1647534190469; 
 Thu, 17 Mar 2022 09:23:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPEGvuAcY+Sjbzeh1H1uR+xIHNMXcViYgWVNdXxMBYtS2llYV/rD28U+jayTRIJIajsTbO0g==
X-Received: by 2002:adf:ed50:0:b0:203:da73:e0fd with SMTP id
 u16-20020adfed50000000b00203da73e0fdmr4715965wro.516.1647534190050; 
 Thu, 17 Mar 2022 09:23:10 -0700 (PDT)
Received: from [192.168.149.119]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm4525253wma.21.2022.03.17.09.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 09:23:09 -0700 (PDT)
Message-ID: <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
Date: Thu, 17 Mar 2022 17:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
In-Reply-To: <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 09/03/2022 um 14:26 schrieb Emanuele Giuseppe Esposito:
>>> * Drains allow the caller (either main loop or iothread running
>>> the context) to wait all in_flights requests and operations
>>> of a BDS: normal drains target a given node and is parents, while
>>> subtree ones also include the subgraph of the node. Siblings are
>>> not affected by any of these two kind of drains.
>> Siblings are drained to the extent required for their parent node to
>> reach in_flight == 0.
>>
>> I haven't checked the code but I guess the case you're alluding to is
>> that siblings with multiple parents could have other I/O in flight that
>> will not be drained and further I/O can be submitted after the parent
>> has drained?
> Yes, this in theory can happen. I don't really know if this happens
> practically, and how likely is to happen.
> 
> The alternative would be to make a drain that blocks the whole graph,
> siblings included, but that would probably be an overkill.
> 

So I have thought about this, and I think maybe this is not a concrete
problem.
Suppose we have a graph where "parent" has 2 children: "child" and
"sibling". "sibling" also has a blockjob.

Now, main loop wants to modify parent-child relation and maybe detach
child from parent.

1st wrong assumption: the sibling is not drained. Actually my strategy
takes into account draining both nodes, also because parent could be in
another graph. Therefore sibling is drained.

But let's assume "sibling" is the sibling of the parent.

Therefore we have
"child" -> "parent" -> "grandparent"
and
"blockjob" -> "sibling" -> "grandparent"

The issue is the following: main loop can't drain "sibling", because
subtree_drained does not reach it. Therefore blockjob can still run
while main loop modifies "child" -> "parent". Blockjob can either:
1) drain, but this won't affect "child" -> "parent"
2) read the graph in other ways different from drain, for example
.set_aio_context recursively touches the whole graph.
3) write the graph.

3) can be only performed in the main loop, because it's a graph
operation. It means that the blockjob runs when the graph modifying
coroutine/bh is not running. They never run together.
The safety of this operation relies on where the drains are and will be
inserted. If you do like in my patch "block.c:
bdrv_replace_child_noperm: first call ->attach(), and then add child",
then we would have problem, because we drain between two writes, and the
blockjob will find an inconsistent graph. If we do it as we seem to do
it so far, then we won't really have any problem.

2) is a read, and can theoretically be performed by another thread. But
is there a function that does that? .set_aio_context for example is a GS
function, so we will fall back to case 3) and nothing bad would happen.

Is there a counter example for this?

-----------

Talking about something else, I discussed with Kevin what *seems* to be
an alternative way to do this, instead of adding drains everywhere.
His idea is to replicate what blk_wait_while_drained() currently does
but on a larger scale. It is something in between this subtree_drains
logic and a rwlock.

Basically if I understood correctly, we could implement
bdrv_wait_while_drained(), and put in all places where we would put a
read lock: all the reads to ->parents and ->children.
This function detects if the bdrv is under drain, and if so it will stop
and wait that the drain finishes (ie the graph modification).
On the other side, each write would just need to drain probably both
nodes (simple drain), to signal that we are modifying the graph. Once
bdrv_drained_begin() finishes, we are sure all coroutines are stopped.
Once bdrv_drained_end() finishes, we automatically let all coroutine
restart, and continue where they left off.

Seems a good compromise between drains and rwlock. What do you think?

I am not sure how painful it will be to implement though.

Thank you,
Emanuele


