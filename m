Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE558AB8C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 15:24:33 +0200 (CEST)
Received: from localhost ([::1]:43944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJxJY-0006i5-Jd
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 09:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oJxHa-0004M4-KL
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:22:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oJxHX-0001GC-LZ
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659705746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21yPqh1UpYkf0CnX5Ev52wGye4k7uv4wjGlBgxPnu80=;
 b=LfStc7DJ31NIf0gkDkFTgJLfUq0HYlnGb4e6pw+eoxKajtlNkpSX5OS4zlftknzsoPNx9k
 ZSbUXEoJ4NdNbKjQAOgVvIYwaHIYXsTVKZDWsRiX6HN7kx/p2DqRHOcitbPT2xSslZt5Gq
 q72b/06Pi+RLW++bADh1/MX3wA367nM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-fHf3lFf2MzmW0r3UR3VWBA-1; Fri, 05 Aug 2022 09:22:25 -0400
X-MC-Unique: fHf3lFf2MzmW0r3UR3VWBA-1
Received: by mail-qt1-f198.google.com with SMTP id
 t9-20020ac85309000000b0031ee055ad11so1915418qtn.12
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 06:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=21yPqh1UpYkf0CnX5Ev52wGye4k7uv4wjGlBgxPnu80=;
 b=y9Hk9wzpz93v4ohpWQ8oooMCEHkkBKz45xwL+s68I7QMhXM6kI+5nKKjgWstyY/rLM
 qctCWEySK2Sf+cU2w2ItGX70gHhB/kzbpJnyX8FO5L8ccxx901Kr6isaqVuqqTJcZiVO
 Ou8u8vNcH3Pp5brI+SupjFg/LJtn52QjZ5HRTPIC/u0WbrPxIMEVtntlZoH00siVcgHI
 Bht4y+znaKNDILJ/O9orMapu3DE6ljTVee236Cna/YCIUZTf4WY5ijQ90nCW6PpsZESt
 RkZNswv6XbqLlWToZ/ndapGESQn/1n3aCAoEcRkaGaqA1CAOMAmQ0l1Pxsyl34lYRUX8
 GiBA==
X-Gm-Message-State: ACgBeo03Gl89Ia05PmgTjR+q1dtwSnwX4Q96f1FiPtuY/XGa4RnWqy3H
 kGTTVAqPuM7HeCIHXW8FyXEmgKUIyF1xtZ0z1SNifF5gZSv+k2P8VI/9s9YBKPrbes53dyd3rj2
 22BIHKoEVdNrcl5k=
X-Received: by 2002:a05:622a:8e:b0:31f:371f:e6a1 with SMTP id
 o14-20020a05622a008e00b0031f371fe6a1mr5917793qtw.565.1659705745231; 
 Fri, 05 Aug 2022 06:22:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR50DXTtbb9W0dMQng1r37ZauMh8S6yieersHR9DBVGki+GopsSFsbtg471mPut92JibwSMTTw==
X-Received: by 2002:a05:622a:8e:b0:31f:371f:e6a1 with SMTP id
 o14-20020a05622a008e00b0031f371fe6a1mr5917764qtw.565.1659705744855; 
 Fri, 05 Aug 2022 06:22:24 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 5-20020ac85745000000b0033a5048464fsm2771059qtx.11.2022.08.05.06.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 06:22:24 -0700 (PDT)
Message-ID: <0b3872fa-830a-f657-76be-2fbae055dffa@redhat.com>
Date: Fri, 5 Aug 2022 15:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 00/11] Refactor bdrv_try_set_aio_context using
 transactions
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220725122120.309236-1-eesposit@redhat.com>
 <b3eb6174-5fd5-f7f9-512c-4cdb46e62502@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <b3eb6174-5fd5-f7f9-512c-4cdb46e62502@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 27/07/2022 um 18:13 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/25/22 15:21, Emanuele Giuseppe Esposito wrote:
>> The aim of this series is to reorganize bdrv_try_set_aio_context
>> and drop BDS ->set_aio_context and ->can_set_aio_ctx callbacks in
>> favour of a new one, ->change_aio_ctx.
>>
>> More informations in patch 3 (which is also RFC, due to the doubts
>> I have with AioContext locks).
>>
>> Patch 1 just add assertions in the code, 2 extends the transactions
>> API to be able to add also transactions in the tail
>> of the list.
>> Patch 3 is the core of this series, and introduces the new callback.
>> It is marked as RFC and the reason is explained in the commit message.
>> Patches 4-5-6 implement ->change_aio_ctx in the various block, blockjob
>> and block-backend BDSes.
>> Patch 7 substitutes ->change_aio_ctx with the old callbacks, and
>> patch 8 takes care of deleting the old callbacks and unused code.
>>
>> This series is based on "job: replace AioContext lock with job_mutex",
>> but just because it uses job_set_aio_context() introduced there.
>>
>> Suggested-by: Paolo Bonzini<pbonzini@redhat.com>
>> Based-on:<20220706201533.289775-1-eesposit@redhat.com>
> 
> 

So, I read your email before going on PTO and at that point I got what
your concerns were, but now after re-reading it I don't understand
anymore what you mean :)

> What I dislike here is that you refactor aio-context-change to use
> transactions, but you use it "internally" for aio-context-change.
> aio-context-change doesn't become a native part of block-graph
> modifiction transaction system after the series.
> 
> For example, bdrv_attach_child_common(..., tran) still calls
> bdrv_try_change_aio_context() function which doesn't take @tran
> argument. And we have to call bdrv_try_change_aio_context() again in
> bdrv_attach_child_common_abort() with opposite arguments by hand. We
> create in _try_ separate Transaction object which is unrelated to the
> original block-graph-change transaction.
> 

This can be fixed: patch 4 "bdrv_child_try_change_aio_context: add
transaction parameter" supports taking transaction as a parameter.
bdrv_attach_child_common could simply call
bdrv_try_change_aio_context_tran (ok we need to deal with locking, but
it could work).

I think the main concern here is that during the prepare phase this
serie doesn't change any aiocontext, so until we don't commit the rest
of the code cannot assume that the aiocontext has been changed.

But isn't it what happens also for permissions? Permission functions
like bdrv_drv_set_perm perform bdrv_check_perm() in .prepare(), and then
bdrv_set_perm() in commit.

Another important question is that if we actually want to put everything
in a single transaction, because .prepare functions like the one
proposed here perform drains, so the logic following prepare and
preceding commit must take into account that everything is drained. Also
prepare itself has to take into account that maybe other .prepare took
locks or drained themselves...

> With good refactoring we should get rid of these _try_ functions, and
> have just bdrv_change_aio_context(..., tran) that can be natively used
> with external tran object, where other block-graph change actions
> participate. This way we'll not have to call reverse
> aio_context_change() in .abort, it will be done automatically.
> 
> Moreover, your  *aio_context_change* functions that do have tran
> parameter cannot be simply used in the block-graph change transaction,
> as you don't follow the common paradigm, that in .prepare we do all
> visible changes. That's why you have to still use _try_*() version that
> creates seaparate transaction object and completes it: after that the
> action is actually done and other graph-modifying actions can be done on
> top.
> 
> So, IMHO, we shouldn't go this way, as that adds transaction actions
> that actually can't be used in common block-graph-modifying transaction
> but only context of bdrv_try_change_aio_context() internal transaction.
> 
> I agree that aio-context change should finally be rewritten to take a
> native place in block-graph transactions, but that should be a complete
> solution, introducing native bdrv_change_aio_context(..., tran)
> transaction action that is directly used in the block-graph transaction,
> do visible effect in .prepare and don't create extra Transaction objects.
> 


