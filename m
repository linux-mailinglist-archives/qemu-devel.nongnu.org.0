Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CCD398A2A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:02:00 +0200 (CEST)
Received: from localhost ([::1]:54732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQVT-0006vq-Jl
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1loQT4-00062M-R2
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1loQT2-0003mS-4L
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622638766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iWhDL+4NftWxrxrJvfUqIfEP1K0HBZJXUe7IOVxp3n0=;
 b=alg40eKsZl+GBWgBhkn/al+lAi7HZ+n/6ysVQNParyrceUQRG3S8nfZwObdF6zkrCw+TsE
 qrmpgsMTmqM2i2Cstm5lSVKlRhn056+VEZ8f0mveUFjqrlfx7i86msDOrm4U46k8TM91/v
 9c5CilXzapIYS0xnpcqYDb/WJDW1QDA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-IfsnVM_fPZy7GcSzFOiMYw-1; Wed, 02 Jun 2021 08:59:24 -0400
X-MC-Unique: IfsnVM_fPZy7GcSzFOiMYw-1
Received: by mail-ed1-f69.google.com with SMTP id
 v18-20020a0564023492b029038d5ad7c8a8so1340640edc.11
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 05:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iWhDL+4NftWxrxrJvfUqIfEP1K0HBZJXUe7IOVxp3n0=;
 b=qYFazq6p4omr6d1xSBSqWoiN3qDQkTM5NPekDCv6rswLnsS1G/bRLcw7lUCleekuWT
 WoJ01RBElCI+Ko3EYxJyQte9kWgpuvdnWDZRfCOYtIUei5u9PYabd4AylIJsD5JWdomO
 7tB2QF8XDms952d/N4pC+4gZVuCZ7+ySLDD+WO837jHXMuHHCNuYgvZbrgzvd7r+AgrK
 uhb5TQvQtYSAnZfSAOtsBVz79CQAIy9GIXFJi/yVRDie9+LltrxQgbcbfs7XeSsnMHze
 O8S/edwym2N+/imb7CJcdQL0ua2cVmVVpwt2vYRm2YNUT4m1s9DkMZp4t5qXnR+loVuW
 Pi5A==
X-Gm-Message-State: AOAM532SjJHDoZdMmFF9bAwXLO90F692v2BHSSNe/gB4gvpNaQbhhgDu
 3L+ffQjxRff2eEzADCzVnt0agAzCT6mvZIzEmIKL1MSZsY3u7cQxN+cobW+/IvvUzFI0ZTeB42j
 1g2xoxTWLIQBA6gc=
X-Received: by 2002:a17:906:b34e:: with SMTP id
 cd14mr10406749ejb.69.1622638763560; 
 Wed, 02 Jun 2021 05:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvWlYJt0zbG+aHnLAeotPQWsdVaYc/tr9o6nHGextzd/WCNICSZWR4bf2pGJ2CpI1tzU+oMA==
X-Received: by 2002:a17:906:b34e:: with SMTP id
 cd14mr10406729ejb.69.1622638763281; 
 Wed, 02 Jun 2021 05:59:23 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 d17sm8540115ejp.90.2021.06.02.05.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:59:22 -0700 (PDT)
Subject: Re: [PATCH v3 5/5] blkdebug: protect rules and suspended_reqs with a
 lock
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517145049.55268-1-eesposit@redhat.com>
 <20210517145049.55268-6-eesposit@redhat.com>
 <43b0217f-4d3a-9380-c91e-ee86fe461c40@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <0bd35c32-d987-f007-392a-08c116e026c2@redhat.com>
Date: Wed, 2 Jun 2021 14:59:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <43b0217f-4d3a-9380-c91e-ee86fe461c40@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 01/06/2021 10:39, Vladimir Sementsov-Ogievskiy wrote:
> 17.05.2021 17:50, Emanuele Giuseppe Esposito wrote:
>> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/blkdebug.c | 53 ++++++++++++++++++++++++++++++++++++------------
>>   1 file changed, 40 insertions(+), 13 deletions(-)
>>
>> diff --git a/block/blkdebug.c b/block/blkdebug.c
>> index dffd869b32..cf8b088ce7 100644
>> --- a/block/blkdebug.c
>> +++ b/block/blkdebug.c
>> @@ -54,6 +54,7 @@ typedef struct BDRVBlkdebugState {
>>       /* For blkdebug_refresh_filename() */
>>       char *config_file;
>> +    QemuMutex lock;
> 
> we'll need a comments, which fields are protected by the lock, like in 
> other your series.
> 
> and also a comment which functions are thread-safe after the patch.
> 
> remove_rule() lacks comment, like "Called with lock held or from 
> .bdrv_close"

Will apply these feedback in next version, thanks.

[...]

>> +/* Called with lock held.  */
>>   static void process_rule(BlockDriverState *bs, struct BlkdebugRule 
>> *rule,
>>                            int *action_count)
>>   {
>> @@ -829,9 +840,11 @@ static void blkdebug_debug_event(BlockDriverState 
>> *bs, BlkdebugEvent event)
>>       assert((int)event >= 0 && event < BLKDBG__MAX);
>> -    s->new_state = s->state;
>> -    QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
>> -        process_rule(bs, rule, actions_count);
>> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
>> +        s->new_state = s->state;
>> +        QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
>> +            process_rule(bs, rule, actions_count);
>> +        }
>>       }
>>       while (actions_count[ACTION_SUSPEND] > 0) {
>> @@ -839,7 +852,9 @@ static void blkdebug_debug_event(BlockDriverState 
>> *bs, BlkdebugEvent event)
>>           actions_count[ACTION_SUSPEND]--;
>>       }
>> +    qemu_mutex_lock(&s->lock);
>>       s->state = s->new_state;
>> +    qemu_mutex_unlock(&s->lock);
>>   }
> 
> Preexising: honestly, I don't understand the logic around state and 
> new_state.. (and therefore, I'm not sure, is it in good relation with 
> patch 04)
> 
> It come in the commit
> 
> commit 8f96b5be92fbd74798b97b1dc1ff5fbbe249ed11
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:   Fri Sep 28 17:23:00 2012 +0200
> 
>      blkdebug: process all set_state rules in the old state
>      Currently it is impossible to write a blkdebug script that ping-pongs
>      between two states, because the second set-state rule will use the
>      state that is set in the first.  If you have
>          [set-state]
>          event = "..."
>          state = "1"
>          new_state = "2"
>          [set-state]
>          event = "..."
>          state = "2"
>          new_state = "1"
>      for example the state will remain locked at 1.  This can be fixed
>      by first processing all rules, and then setting the state.
> 
> But I don't understand, whey it should remain locked..

 From what I understand, when bdrv_debug_event is invoked the code 
before this patch will simply change the state in 1 - 2 - 1 in the same 
rule iteration. So following Paolo's example, having these two rules in 
the same rules["..."] list, will make only one bdrv_debug_event change 
the state from 1 to 2, and 2 to 1 (if they are ordered in this way), 
removing both rules from the list.

This is not the expected behavior: we want two bdrv_debug_event to 
trigger the two state changes, so in the first bdrv_debug_event call we 
have 1-2 and next 2-1.

> 
> And this logic is not safe: another event may happen during the yield, 
> and will operate on the same s->state and s->new_state, leading the the 
> mess.

Yes, I think you are right. The state update should go in the same lock 
guard above, like this:

WITH_QEMU_LOCK_GUARD(&s->lock) {
         s->new_state = s->state;
         QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
             process_rule(bs, rule, actions_count);
         }
+       s->state = s->new_state;
     }

     while (actions_count[ACTION_SUSPEND] > 0) {
         qemu_coroutine_yield();
         actions_count[ACTION_SUSPEND]--;
     }

-    qemu_mutex_lock(&s->lock);
-    s->state = s->new_state;
-    qemu_mutex_unlock(&s->lock);

The other comments below make sense to me, will also apply them.

Thank you,
Emanuele

> 
>>   static int blkdebug_debug_breakpoint(BlockDriverState *bs, const 
>> char *event,
>> @@ -862,11 +877,14 @@ static int 
>> blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
>>           .options.suspend.tag = g_strdup(tag),
>>       };
>> +    qemu_mutex_lock(&s->lock);
>>       QLIST_INSERT_HEAD(&s->rules[blkdebug_event], rule, next);
>> +    qemu_mutex_unlock(&s->lock);
>>       return 0;
>>   }
>> +/* Called with lock held.  */
> 
> I think, it would be a very good practice to include into convention:
> 
> May temporarily release lock. >
>>   static int resume_req_by_tag(BDRVBlkdebugState *s, const char *tag, 
>> bool all)
>>   {
>>       BlkdebugSuspendedReq *r;
>> @@ -884,7 +902,9 @@ retry:
>>               g_free(r->tag);
>>               g_free(r);
>> +            qemu_mutex_unlock(&s->lock);
>>               qemu_coroutine_enter(co);
>> +            qemu_mutex_lock(&s->lock);
>>               if (all) {
>>                   goto retry;
>> @@ -898,8 +918,12 @@ retry:
>>   static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
>>   {
>>       BDRVBlkdebugState *s = bs->opaque;
>> +    int rc;
> 
> Hmm, you can simply use QEMU_LOCK_GUARD

> 
>> -    return resume_req_by_tag(s, tag, false);
>> +    qemu_mutex_lock(&s->lock);
>> +    rc = resume_req_by_tag(s, tag, false);
>> +    qemu_mutex_unlock(&s->lock);
>> +    return rc;
>>   }
>>   static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
>> @@ -909,17 +933,19 @@ static int 
>> blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
>>       BlkdebugRule *rule, *next;
>>       int i, ret = -ENOENT;
>> -    for (i = 0; i < BLKDBG__MAX; i++) {
>> -        QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
>> -            if (rule->action == ACTION_SUSPEND &&
>> -                !strcmp(rule->options.suspend.tag, tag)) {
>> -                remove_rule(rule);
>> -                ret = 0;
>> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> 
> And here, instead of increasing nesting, let's use QEMU_LOCK_GUARD()
> 
>> +        for (i = 0; i < BLKDBG__MAX; i++) {
>> +            QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
>> +                if (rule->action == ACTION_SUSPEND &&
>> +                    !strcmp(rule->options.suspend.tag, tag)) {
>> +                    remove_rule(rule);
>> +                    ret = 0;
>> +                }
>>               }
>>           }
>> -    }
>> -    if (resume_req_by_tag(s, tag, true) == 0) {
>> -        ret = 0;
>> +        if (resume_req_by_tag(s, tag, true) == 0) {
>> +            ret = 0;
>> +        }
>>       }
>>       return ret;
>>   }
>> @@ -929,6 +955,7 @@ static bool 
>> blkdebug_debug_is_suspended(BlockDriverState *bs, const char *tag)
>>       BDRVBlkdebugState *s = bs->opaque;
>>       BlkdebugSuspendedReq *r;
>> +    QEMU_LOCK_GUARD(&s->lock);
>>       QLIST_FOREACH(r, &s->suspended_reqs, next) {
>>           if (!strcmp(r->tag, tag)) {
>>               return true;
>>
> 
> 


