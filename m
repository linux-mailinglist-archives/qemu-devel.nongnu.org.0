Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A170514528
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 11:14:19 +0200 (CEST)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkMhe-0003J8-HG
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 05:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkMBs-0006g4-LS
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 04:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkMBq-0007Fm-H3
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 04:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w14hR5w4nT+3ki4osOIPl7Eu8JJQuc1oFAsp1Vu8HYU=;
 b=ZDyZJC4k64xSr6Wbm84GA86+Z3Tj1BuGOTa+Y6kkyy8EmefkSVrn0CWk81G+xePWoy/Ceu
 GHUbHW+6lDC8hIWIwD5C/bLdttbooFHiaDXSAwsCv9EPUVtNFY4cW7/QkaPMvXSV7ZxAH4
 b5zKp2yHaA1P2+bSMxnwr1N6YMTbnPg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-XgML86bmO2SIwaP8y35GGA-1; Fri, 29 Apr 2022 04:41:23 -0400
X-MC-Unique: XgML86bmO2SIwaP8y35GGA-1
Received: by mail-wr1-f70.google.com with SMTP id
 e21-20020adfa455000000b0020ae075cf35so2826437wra.11
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 01:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w14hR5w4nT+3ki4osOIPl7Eu8JJQuc1oFAsp1Vu8HYU=;
 b=S6w4l+EHYbOOhcdK6gpDhObQVYKqEa7lq0CBYqVRYc66Do8MX4H2MYInSEX+44BKeO
 Alp5wy9YrJP4YXIUkjROxokLg0R2QLuFlS6/Q873mrRMsazNeR8VR0AcBifuRfMy7CKc
 Q+qC9nj7dr8wYGEprKjMBSXn6ZDYAz99qb6z44LDYklkWOLTUUwd2obLBQujqgxGP5q5
 r4YFDs+UGh56RqAygllFxjVCq6YQF612CbecspQmvFjiFrK2iBSufsfsf5UW05ybnPGh
 NiWHP8ipUcvcDL0SSUQJmCJXORJx6E32kD9Fy8/K3tKg5+jo4/i2UfhsZUKCUTYJ7q6T
 U9jQ==
X-Gm-Message-State: AOAM530tyN2I48kDdqyaeGWIoJXvMKIiXDzR4hdAEzz8XWwHUQ0nwI1i
 5YGK68vvnuoqACdmjsMMNE2k3tYQud7/vMEpi08dJAHXnVS+rtKps3jxPcQyTVyxcitSxHmJNq5
 bp9D4E/EOB/5BFDg=
X-Received: by 2002:a7b:c20c:0:b0:38f:fac1:fe05 with SMTP id
 x12-20020a7bc20c000000b0038ffac1fe05mr2181397wmi.144.1651221682624; 
 Fri, 29 Apr 2022 01:41:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9mriwsOXPaOw2fQsz7rdwPRpJGqyLg+xxGp1KaT3gpUR3zs0f2ZnvDgq00f0YzKDinYCZzw==
X-Received: by 2002:a7b:c20c:0:b0:38f:fac1:fe05 with SMTP id
 x12-20020a7bc20c000000b0038ffac1fe05mr2181379wmi.144.1651221682370; 
 Fri, 29 Apr 2022 01:41:22 -0700 (PDT)
Received: from ?IPV6:2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9?
 ([2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9])
 by smtp.gmail.com with ESMTPSA id
 bg26-20020a05600c3c9a00b00393e997c657sm2101568wmb.37.2022.04.29.01.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 01:41:22 -0700 (PDT)
Message-ID: <59b40377-22c2-5410-6339-2d8b96f19d99@redhat.com>
Date: Fri, 29 Apr 2022 10:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 5/8] block.c: wrlock in bdrv_replace_child_noperm
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-6-eesposit@redhat.com>
 <Ymqc1nkfoQaW9J2L@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Ymqc1nkfoQaW9J2L@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 28/04/2022 um 15:55 schrieb Stefan Hajnoczi:
> On Tue, Apr 26, 2022 at 04:51:11AM -0400, Emanuele Giuseppe Esposito wrote:
>> The only problem here is ->attach and ->detach callbacks
>> could call bdrv_{un}apply_subtree_drain(), which itself
>> will use a rdlock to navigate through all nodes.
>> To avoid deadlocks, take the lock only outside the drains,
>> and if we need to both attach and detach, do it in a single
>> critical section.
>>
>> Therefore change ->attach and ->detach to return true if they
>> are modifying the lock, so that we don't take it twice or release
>> temporarly.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  block.c                          | 31 +++++++++++++++++++++++++++----
>>  block/block-backend.c            |  6 ++++--
>>  include/block/block_int-common.h |  8 ++++++--
>>  3 files changed, 37 insertions(+), 8 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index b2eb679abb..6cd87e8dd3 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -1434,21 +1434,26 @@ static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
>>      *child_flags = flags;
>>  }
>>  
>> -static void bdrv_child_cb_attach(BdrvChild *child)
>> +static bool bdrv_child_cb_attach(BdrvChild *child)
>>  {
>>      BlockDriverState *bs = child->opaque;
>>  
>>      assert_bdrv_graph_writable(bs);
>>      QLIST_INSERT_HEAD(&bs->children, child, next);
>>  
>> +    /* Paired with bdrv_graph_wrlock() in bdrv_replace_child_noperm */
>> +    bdrv_graph_wrunlock();
>> +
>>      if (child->role & BDRV_CHILD_COW) {
>>          bdrv_backing_attach(child);
>>      }
>>  
>>      bdrv_apply_subtree_drain(child, bs);
>> +
>> +    return true;
>>  }
>>  
>> -static void bdrv_child_cb_detach(BdrvChild *child)
>> +static bool bdrv_child_cb_detach(BdrvChild *child)
>>  {
>>      BlockDriverState *bs = child->opaque;
>>  
>> @@ -1458,8 +1463,13 @@ static void bdrv_child_cb_detach(BdrvChild *child)
>>  
>>      bdrv_unapply_subtree_drain(child, bs);
>>  
>> +    /* Paired with bdrv_graph_wrunlock() in bdrv_replace_child_noperm */
>> +    bdrv_graph_wrlock();
>> +
>>      assert_bdrv_graph_writable(bs);
>>      QLIST_REMOVE(child, next);
>> +
>> +    return true;
>>  }
>>  
>>  static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
>> @@ -2842,6 +2852,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>>      BlockDriverState *old_bs = child->bs;
>>      int new_bs_quiesce_counter;
>>      int drain_saldo;
>> +    bool locked = false;
>>  
>>      assert(!child->frozen);
>>      assert(old_bs != new_bs);
>> @@ -2868,8 +2879,12 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>>           * are already gone and we only end the drain sections that came from
>>           * elsewhere. */
>>          if (child->klass->detach) {
>> -            child->klass->detach(child);
>> +            locked = child->klass->detach(child);
>> +        }
>> +        if (!locked) {
>> +            bdrv_graph_wrlock();
>>          }
>> +        locked = true;
>>          assert_bdrv_graph_writable(old_bs);
>>          QLIST_REMOVE(child, next_parent);
>>      }
>> @@ -2880,6 +2895,10 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>>      }
>>  
>>      if (new_bs) {
>> +        if (!locked) {
>> +            bdrv_graph_wrlock();
>> +            locked = true;
>> +        }
>>          assert_bdrv_graph_writable(new_bs);
>>          QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
>>  
>> @@ -2896,10 +2915,14 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>>           * drain sections coming from @child don't get an extra .drained_begin
>>           * callback. */
>>          if (child->klass->attach) {
>> -            child->klass->attach(child);
>> +            locked = !(child->klass->attach(child));
> 
> O_O I don't understand what the return value of ->attach() means. It has
> the opposite meaning to the return value of ->detach()?

It means "state of the lock changed". So for ->attach(), if it is
changed (went to unlock), we want locked = false.

I will probably switch to Paolo's suggestion, it's cleaner.
> 
>>          }
>>      }
>>  
>> +    if (locked) {
>> +        bdrv_graph_wrunlock();
>> +    }
>> +
>>      /*
>>       * If the old child node was drained but the new one is not, allow
>>       * requests to come in only after the new node has been attached.
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index e0e1aff4b1..5dbd9fceae 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
>> @@ -282,7 +282,7 @@ static int blk_root_inactivate(BdrvChild *child)
>>      return 0;
>>  }
>>  
>> -static void blk_root_attach(BdrvChild *child)
>> +static bool blk_root_attach(BdrvChild *child)
>>  {
>>      BlockBackend *blk = child->opaque;
>>      BlockBackendAioNotifier *notifier;
>> @@ -295,9 +295,10 @@ static void blk_root_attach(BdrvChild *child)
>>                  notifier->detach_aio_context,
>>                  notifier->opaque);
>>      }
>> +    return false;
>>  }
>>  
>> -static void blk_root_detach(BdrvChild *child)
>> +static bool blk_root_detach(BdrvChild *child)
>>  {
>>      BlockBackend *blk = child->opaque;
>>      BlockBackendAioNotifier *notifier;
>> @@ -310,6 +311,7 @@ static void blk_root_detach(BdrvChild *child)
>>                  notifier->detach_aio_context,
>>                  notifier->opaque);
>>      }
>> +    return false;
>>  }
>>  
>>  static AioContext *blk_root_get_parent_aio_context(BdrvChild *c)
>> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
>> index 5a04c778e4..dd058c1fd8 100644
>> --- a/include/block/block_int-common.h
>> +++ b/include/block/block_int-common.h
>> @@ -857,8 +857,12 @@ struct BdrvChildClass {
>>      void (*activate)(BdrvChild *child, Error **errp);
>>      int (*inactivate)(BdrvChild *child);
>>  
>> -    void (*attach)(BdrvChild *child);
>> -    void (*detach)(BdrvChild *child);
>> +    /*
>> +     * Return true if the graph wrlock is taken/released,
> 
> What does "taken/released" mean? Does it mean released by attach and
> taken by detach?

Yes
> 
> Also, please document which locks are held when these callbacks are
> invoked.
> 
>> +     * false if the wrlock state is not changed.
>> +     */
>> +    bool (*attach)(BdrvChild *child);
>> +    bool (*detach)(BdrvChild *child);
>>  
>>      /*
>>       * Notifies the parent that the filename of its child has changed (e.g.
>> -- 
>> 2.31.1
>>


