Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B739CA65
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 20:03:30 +0200 (CEST)
Received: from localhost ([::1]:42892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpadt-0000Sc-1v
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 14:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lpaUh-0002Vj-QK
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 13:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lpaUf-0000il-QL
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 13:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622915637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A02CKClVOd4vCEYQhbXbgvLjxkdyVXuh+Gi4EidrZas=;
 b=PQNC8D4bsS3/Oh/BlBLw3Tx2qYXqWL1SGRW/Yj4QqkicRJleMZVZm19skhrYrzejAwkt3M
 7a4pKCHx9FEmR2K1tMV5gngEOiRA7mNT5nYGBH1E3+YFXrq60ongB2DDoqJCJY+pavuMt3
 JhzH+OswuaVbNpc4+tPYdl3gYxlGTpo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-Ats5vrg0MhmddJD28eTiAA-1; Sat, 05 Jun 2021 13:53:53 -0400
X-MC-Unique: Ats5vrg0MhmddJD28eTiAA-1
Received: by mail-ed1-f71.google.com with SMTP id
 u26-20020a05640207dab02903935beb5c71so1181801edy.3
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 10:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A02CKClVOd4vCEYQhbXbgvLjxkdyVXuh+Gi4EidrZas=;
 b=cu5b5HS3En4AVBfK4Hmb5dXJAJdCPoGWqjbSbOlX0G0kWEwpgWDf0iQRhXC5SRXVuv
 ZHAk6IvlbjyeivBEnjg2F8ilCEsHPF93Ip+qSwxihbkEB/1fD9JOi3FwMWca/6vYj8QS
 lOEcT40Fedhz3nR6v+nHQ+iht5LSZ6oK4d1Si634kxGoSXWSRI9NKZdgvogipe9FEhFr
 YAE7BWpZiparsEqXDNShetDy7lc3YcRAE8E1NWmZ2/V0jaOcZbDfGbwC/hAQtIvEr7wZ
 5WXSHkcTgobmlYaFSVyYRmkmDynqCQOBbFNyEzSthHLDBRTzCQ0DtrVSUGHbGIOOQzXS
 MSUg==
X-Gm-Message-State: AOAM531U/0HlUfOdLC04LsNf+uUDuGQ/lP+re2OXDP0I2SxnZLnktYj/
 U02FOe0uE39ez2BDWzgmjRdTnZggNkpK+PZft7+/m6d0su6AVgjn3XDBvhjJtx6WwTPVlgoP/26
 qN1IqExBDmfgqbX/x6vD/cix2fCucovL/jv1QZM8RZ6SUFD8Ie2rrxUHxHM9nqu2mfn4=
X-Received: by 2002:a17:906:e2d3:: with SMTP id
 gr19mr9961457ejb.525.1622915632186; 
 Sat, 05 Jun 2021 10:53:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6OQca3XoDnI2LrffK4d9WNCLCefkjGjfj1/fnsxwB3q8VpSqV5CDSUD3MFbNggXs58Bc2BA==
X-Received: by 2002:a17:906:e2d3:: with SMTP id
 gr19mr9961440ejb.525.1622915631950; 
 Sat, 05 Jun 2021 10:53:51 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 q9sm5064858edw.51.2021.06.05.10.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 10:53:51 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] blkdebug: protect rules and suspended_reqs with a
 lock
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210604100741.18966-1-eesposit@redhat.com>
 <20210604100741.18966-7-eesposit@redhat.com>
 <4d31dae3-cd23-0a37-910d-d44a6ca77456@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <763e2193-6505-016b-227a-490ad0119336@redhat.com>
Date: Sat, 5 Jun 2021 19:53:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4d31dae3-cd23-0a37-910d-d44a6ca77456@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 05/06/2021 17:15, Vladimir Sementsov-Ogievskiy wrote:
> 04.06.2021 13:07, Emanuele Giuseppe Esposito wrote:
>> First, categorize the structure fields to identify what needs
>> to be protected and what doesn't.
>>
>> We essentially need to protect only .state, and the 3 lists in
>> BDRVBlkdebugState.
>>
>> Then, add the lock and mark the functions accordingly.
>>
>> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/blkdebug.c | 46 +++++++++++++++++++++++++++++++++++-----------
>>   1 file changed, 35 insertions(+), 11 deletions(-)
>>
>> diff --git a/block/blkdebug.c b/block/blkdebug.c
>> index d597753139..ac3799f739 100644
>> --- a/block/blkdebug.c
>> +++ b/block/blkdebug.c
>> @@ -38,24 +38,27 @@
>>   #include "qapi/qobject-input-visitor.h"
>>   #include "sysemu/qtest.h"
>> +/* All APIs are thread-safe */
>> +
>>   typedef struct BDRVBlkdebugState {
>> -    int state;
>> +    /* IN: initialized in blkdebug_open() and never changed */
>>       uint64_t align;
>>       uint64_t max_transfer;
>>       uint64_t opt_write_zero;
>>       uint64_t max_write_zero;
>>       uint64_t opt_discard;
>>       uint64_t max_discard;
>> -
>> +    char *config_file; /* For blkdebug_refresh_filename() */
>> +    /* initialized in blkdebug_parse_perms() */
>>       uint64_t take_child_perms;
>>       uint64_t unshare_child_perms;
>> -    /* For blkdebug_refresh_filename() */
>> -    char *config_file;
>> -
>> +    /* State. Protected by lock */
>> +    int state;
>>       QLIST_HEAD(, BlkdebugRule) rules[BLKDBG__MAX];
>>       QSIMPLEQ_HEAD(, BlkdebugRule) active_rules;
>>       QLIST_HEAD(, BlkdebugSuspendedReq) suspended_reqs;
>> +    QemuMutex lock;
>>   } BDRVBlkdebugState;
>>   typedef struct BlkdebugAIOCB {
>> @@ -64,6 +67,7 @@ typedef struct BlkdebugAIOCB {
>>   } BlkdebugAIOCB;
>>   typedef struct BlkdebugSuspendedReq {
>> +    /* IN: initialized in suspend_request() */
>>       Coroutine *co;
>>       char *tag;
> 
> @next is part of *suspended_reqs list (in a manner), so it should be 
> protected by lock
> 
>>       QLIST_ENTRY(BlkdebugSuspendedReq) next;
>> @@ -77,6 +81,7 @@ enum {
>>   };
>>   typedef struct BlkdebugRule {
>> +    /* IN: initialized in add_rule() or blkdebug_debug_breakpoint() */
>>       BlkdebugEvent event;
>>       int action;
>>       int state;
> 
> as well as @next and @active_next here.

They all are already protected by the lock, I will just update the 
comments in case I need to re-spin.

[...]

> 
> Optional suggestion for additional comments and more use of 
> QEMU_LOCK_GUARD (it looks large because of indentation change):

Exactly, indentation change. If I recall correctly, you (rightly) 
complained about that in one of my patches (not sure if it was in this 
series).

> 
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index ac3799f739..b4f8844e76 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -70,6 +70,8 @@ typedef struct BlkdebugSuspendedReq {
>       /* IN: initialized in suspend_request() */
>       Coroutine *co;
>       char *tag;
> +
> +    /* List entry protected BDRVBlkdebugState::lock */

Is this C++ style ok to be used here? I don't think I have seen it used 
in QEMU. But I might be wrong, someone with better style taste and 
experience should comment here. Maybe it's better to have

/* List entry protected BDRVBlkdebugState's lock */

>       QLIST_ENTRY(BlkdebugSuspendedReq) next;
>   } BlkdebugSuspendedReq;
> 
> @@ -100,6 +102,8 @@ typedef struct BlkdebugRule {
>               char *tag;
>           } suspend;
>       } options;
> +
> +    /* List entries protected BDRVBlkdebugState::lock */
>       QLIST_ENTRY(BlkdebugRule) next;
>       QSIMPLEQ_ENTRY(BlkdebugRule) active_next;
>   } BlkdebugRule;
> @@ -249,9 +253,9 @@ static int add_rule(void *opaque, QemuOpts *opts, 
> Error **errp)
>       };
> 
>       /* Add the rule */
> -    qemu_mutex_lock(&s->lock);
> -    QLIST_INSERT_HEAD(&s->rules[event], rule, next);
> -    qemu_mutex_unlock(&s->lock);
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        QLIST_INSERT_HEAD(&s->rules[event], rule, next);
> +    }
Same lines used, just additional indentation added. For one line it 
might be okay? not sure.
> 
>       return 0;
>   }
> @@ -591,33 +595,32 @@ static int rule_check(BlockDriverState *bs, 
> uint64_t offset, uint64_t bytes,
>       int error;
>       bool immediately;
> 
> -    qemu_mutex_lock(&s->lock);
> -    QSIMPLEQ_FOREACH(rule, &s->active_rules, active_next) {
> -        uint64_t inject_offset = rule->options.inject.offset;
> -
> -        if ((inject_offset == -1 ||
> -             (bytes && inject_offset >= offset &&
> -              inject_offset < offset + bytes)) &&
> -            (rule->options.inject.iotype_mask & (1ull << iotype)))
> -        {
> -            break;
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        QSIMPLEQ_FOREACH(rule, &s->active_rules, active_next) {
> +            uint64_t inject_offset = rule->options.inject.offset;
> +
> +            if ((inject_offset == -1 ||
> +                 (bytes && inject_offset >= offset &&
> +                  inject_offset < offset + bytes)) &&
> +                (rule->options.inject.iotype_mask & (1ull << iotype)))
> +            {
> +                break;
> +            }
>           }
> -    }
> 
> -    if (!rule || !rule->options.inject.error) {
> -        qemu_mutex_unlock(&s->lock);
> -        return 0;
> -    }
> +        if (!rule || !rule->options.inject.error) {
> +            return 0;
> +        }
> 
> -    immediately = rule->options.inject.immediately;
> -    error = rule->options.inject.error;
> +        immediately = rule->options.inject.immediately;
> +        error = rule->options.inject.error;
> 
> -    if (rule->options.inject.once) {
> -        QSIMPLEQ_REMOVE(&s->active_rules, rule, BlkdebugRule, 
> active_next);
> -        remove_rule(rule);
> +        if (rule->options.inject.once) {
> +            QSIMPLEQ_REMOVE(&s->active_rules, rule, BlkdebugRule, 
> active_next);
> +            remove_rule(rule);
> +        }
>       }
> 
> -    qemu_mutex_unlock(&s->lock);

Too much indentation added for a couple of lock/unlock IMO.

>       if (!immediately) {
>           aio_co_schedule(qemu_get_current_aio_context(), 
> qemu_coroutine_self());
>           qemu_coroutine_yield();
> @@ -880,9 +883,9 @@ static int 
> blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
>           .options.suspend.tag = g_strdup(tag),
>       };
> 
> -    qemu_mutex_lock(&s->lock);
> -    QLIST_INSERT_HEAD(&s->rules[blkdebug_event], rule, next);
> -    qemu_mutex_unlock(&s->lock);
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        QLIST_INSERT_HEAD(&s->rules[blkdebug_event], rule, next);
> +    }

Same as above.

Thank you,
Emanuele


