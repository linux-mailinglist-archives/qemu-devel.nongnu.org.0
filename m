Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117D56B5D1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 11:44:37 +0200 (CEST)
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9kXL-0004bB-A5
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 05:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9kV5-0003kK-HS
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:42:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9kV1-0008QI-Hf
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657273330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPv+qy8xb30Eg9mnmRkS6JPZkkHHKuzPj6sFoEUF2z4=;
 b=Gdf9w54JSK1le1wNRhsas8OzogIEDHqUgd3HyBLUtglDpvMW6DSgWZhghjhDED8lnva+dZ
 LKd0WYKVaCQKt/llK9QdLajuq6qWg75jIbnciSj4Z6GOvPO1ZVrR5LPfWP8gK38/bu/cyV
 fhy9k9TefkmFMDLHyZNTobAJxHdpnfw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-qws_SzpKPM6Osq3pNEiZ_A-1; Fri, 08 Jul 2022 05:42:09 -0400
X-MC-Unique: qws_SzpKPM6Osq3pNEiZ_A-1
Received: by mail-wr1-f72.google.com with SMTP id
 w12-20020adf8bcc000000b0021d20a5b24fso3744230wra.22
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 02:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=gPv+qy8xb30Eg9mnmRkS6JPZkkHHKuzPj6sFoEUF2z4=;
 b=V9cpbzKZJkcBiu6H7r8VcNlCuuRjOHPWSElpPjGUM4S27vU8p9blLGu52AWn++UYuL
 o0NCUPsOzZ9sV+Ca47tmvP8Ff7+cMr7XTaY51XLfOvopN3xwIhsqoiPPMEphOEu83uCU
 eqja8jW8/a+S/GoAU3v6kucKf0J6oXzo6FGFVtmm8q2O4F02qJ3fLePcFyBllRNIkQp0
 X5Di5XJW0UeHNE73r0C8lbxs4iqy0jl+zJikRkfwa9Sg1E/m528yx1/uBKaAYtL+noeg
 l+UlcMoaAzh4IEGSh3ZVrqOC8X+WsFKqndm90h2WfLEzXcu46Rg71o8V2SgyIHFLmiN0
 jCGA==
X-Gm-Message-State: AJIora/RWrK4PIXrz+a8xeYVW54vL1ifupR68KOq5lv/v9JKwNOiMAcr
 ozDjh1fLN6G+AbFVJqHo9SQs8kfX/zGMEcuAPzmBSzGJYDS7+DpFgUZth1q/Sm40Yo+Ir6o7j50
 2n9BrY3OLpoO33ss=
X-Received: by 2002:a05:6000:1885:b0:21b:ad25:8ae6 with SMTP id
 a5-20020a056000188500b0021bad258ae6mr2219538wri.183.1657273327788; 
 Fri, 08 Jul 2022 02:42:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uPeqem9d26cIkFHDhU1UMFMSVIC5gqUXatfkZFA0ONb0U4X1rNCpAlhgfY6lz+PjOp3kgU8g==
X-Received: by 2002:a05:6000:1885:b0:21b:ad25:8ae6 with SMTP id
 a5-20020a056000188500b0021bad258ae6mr2219505wri.183.1657273327468; 
 Fri, 08 Jul 2022 02:42:07 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a5d5911000000b0021bbdc3375fsm16718907wrd.68.2022.07.08.02.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 02:42:06 -0700 (PDT)
Message-ID: <7ca3224d-102f-f45c-f765-9ea79110d127@redhat.com>
Date: Fri, 8 Jul 2022 11:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: AioContext lock removal: help needed
Content-Language: en-US
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: "open list:Block layer core" <qemu-block@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alberto Faria <afaria@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <8904fc80-4ecf-23f5-ab7b-7d016db78aa5@redhat.com>
In-Reply-To: <8904fc80-4ecf-23f5-ab7b-7d016db78aa5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 08/07/2022 um 10:42 schrieb Emanuele Giuseppe Esposito:
> Hello everyone,
> 
> As you all know, I am trying to find a way to replace the well known
> AioContext lock with something else that makes sense and provides the
> same (or even better) guarantees than using this lock.
> 
> The reason for this change have been explained over and over and I don't
> really want to repeat them. Please read the various series I posted in
> the past [1] for more information.
> 
> The end goal is to get rid of the AioContext, and have fine-granularity
> locks in the various components, to make the whole block layer more
> multi-thread friendly and eventually be able to assign multiple virtual
> queues to a single iothread.
> 
> AioContext lock is used everywhere, to protect a huge variety of data.
> This limits a lot the level of multithreading that iothreads can achieve.
> 
> Before digging into the problem itself and possible solutions, I would
> like to also add that we are having a weekly (or bi-weekly, we'll see)
> public meeting where we plan to discuss about this project. Anyone
> interested is very welcome to join. Event invitation is here:
> 
> https://calendar.google.com/event?action=TEMPLATE&tmeid=NTdja2VwMDFyYm9nNjNyc25pdXU5bm8wb3FfMjAyMjA3MTRUMDgwMDAwWiBlZXNwb3NpdEByZWRoYXQuY29t&tmsrc=eesposit%40redhat.com&scp=ALL
> 
> One huge blocker we are having is removing the AioContext from the block
> API (bdrv_* and friends).
> I identified two initial and main candidates that need to lose the
> aiocontext protection:
> - bdrv_replace_child_noperm
> - bdtv_try_set_aio_context
> 
> When these two functions can safely run without AioContext lock, then we
> are getting rid of the majority of its usage.
> The main issue is: what can we use as replacement?
> 
> Let's analyze bdrv_replace_child_noperm (probably the toughest of the
> two): this function performs a graph modification, removing a child from
> a bs and putting it under another. It modifies the bs' ->parents and
> ->children nodes list, and it definitely needs protection because these
> lists are also read from iothreads in parallel.
> 
> Possible candidates to use as replacement:
> 
> - rwlock. With the help of Paolo, I implemented a rwlock optimized for
> many and fast readers, and few writers. Ideal for
> bdrv_replace_child_noperm. However, the problem here is that when a
> writer has to wait other readers to finish (since it has exclusive
> access), it should call a nested event loop to allow others (reader
> included) to progress.
> And this brings us into serious complications, because polling with a
> wlock taken is prone to a lot of deadlocks, including the fact that the
> AioContext lock is still needed in AIO_WAIT_WHILE. The solution would be
> to run everything, readers included, in coroutines. However, this is not
> easy either: long story short, switching BlockDriverState callbacks to
> coroutines is a big problem, as the AioContext lock is still being taken
> in many of the callbacks caller and therefore switching from a coroutine
> creates a mixture of locks taken that simply results in deadlocks.
> Ideally we want to first get rid of the AioContext lock and then switch
> to coroutines, but that's the whole point of the rwlock.
> More on this here:
> https://patchew.org/QEMU/20220426085114.199647-1-eesposit@redhat.com/#cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com

This is also very useful (on the same thread as above):
https://patchew.org/QEMU/20220426085114.199647-1-eesposit@redhat.com/#6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com

> 
> But I would say this is not an ideal candidate to replace the AioContext
> lock. At least not in the immediate future.
> 
> - drains. This was the initial and still main lead. Using
> bdrv_drained_begin/end we are sure that a node and all its parents will
> be paused (included jobs), no io will further come since it will be
> temporarily disabled and all processing requests are ensured to be
> finished by the end bdrv_drained_begin returns.
> Even better than bdrv_drained, I proposed using
> bdrv_subtree_drained_begin, which also stops and protects the child of a
> node.
> I think the major drawback of this is that we need to be sure that there
> are no cases where drains is not enough. Together with Kevin and Stefan
> we identified that we need to prevent drain to be called in coroutines,
> regardless on which AioContext they are run. That's because they could
> allow parallel drain/graph reading to happen, for example (thinking
> about the general case) a coroutine yielding after calling drain_begin
> and in the middle of a graph modification could allow another coroutine
> to drain/read the graph.
> Note that draining itself also involves reading the graph too.
> 
> We thought the only usage of coroutines draining was in mirror run()
> callback. However, that is just the tip of the iceberg.
> Other functions like .bdrv_open callbacks (like qcow2_open) take care of
> creating coroutines to execute part of the logic, with valid performance
> reasons (we don't want to wait when we could simply yield and allow
> something else to run).
> 
> So another question is: what could we do to solve this coroutine issue?
> Ideas?
> 
> Main drain series:
> https://patchew.org/QEMU/20220118162738.1366281-1-eesposit@redhat.com/
> [1]
> 
> 
> 
> [1] = https://patchew.org/QEMU/20220301142113.163174-1-eesposit@redhat.com/
> 
> Thank you,
> Emanuele
> 
> 


