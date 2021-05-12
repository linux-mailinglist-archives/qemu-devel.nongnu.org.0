Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA1437B776
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 10:06:52 +0200 (CEST)
Received: from localhost ([::1]:54448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjtL-0001RK-9d
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 04:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjs4-0000Ea-MR
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjs1-0005iK-L4
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620806728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4IKNq2mSW65uXWHOZaUE8aPeOw/wbLSG+yjRsu8xMM=;
 b=eZFoELrkk+sw6iiYKA2ZGy7/Qkicf1dNVxtuvvlz1v6hYzrgCHl89GlKNiyldqv5KyzWYC
 Ago5t+jWGeQSEos7v1JxWajjoBBIjc0deWitwuFo1oaNdhbQuSggtUKlCjnwIHLrHTcLwe
 7nazy5H1C+wOXtuWhddJmeAVqIBoQvc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-pVSGfyrUNqee8mlcloIwsQ-1; Wed, 12 May 2021 04:05:26 -0400
X-MC-Unique: pVSGfyrUNqee8mlcloIwsQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso12374143edd.19
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 01:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s4IKNq2mSW65uXWHOZaUE8aPeOw/wbLSG+yjRsu8xMM=;
 b=s+Ye0xyCqDjNJEiUubehnWXW5gpE1jfKv9t9GuCS/0KOIycci0rPPtULTWw7BXVYf8
 JKjLLoCDmnkwba7Yv4uVwd6Y6ub0nWBAZBuogMJsMJenI82gHkCvehblEeVOPpHKkPgL
 GiIJctcSTBMryVByDnvrZ4aTst8Aum18+7s5dwVxXVtg5l6dgWp31OJg07CT51xmjPnB
 r4Jlu7uST5sujPKma28dO3Wa3H3bsVzl7oylqtYAcm+LnsWee3H2GpH6SeWuAIY1ykKI
 kA1lk8P0qgUWTUjQPMqop6ZagmmfrjrK+zgxVWK+iMUN0POV+j6OPpXrmFxU6HQf0+sL
 t+Hw==
X-Gm-Message-State: AOAM530QfCo9JlQq2ViInxY9StEmgY3FS1p7yhaBo9as+j7fdgSKk2yi
 spBSscHnBKcW6mzmCZF8l8lSSLR+JCPPnJlUMszUraUgexLNqY4U1gfw3+I9NH66AJMB6tt3jL8
 cfeVA5IXSyAndpMM=
X-Received: by 2002:a05:6402:188:: with SMTP id
 r8mr29136069edv.75.1620806724972; 
 Wed, 12 May 2021 01:05:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDsVZvmzqmv3tYqX+R6I7YPpS/pv39xmvP7KGyZHon3/tIkCuDohix7BPodnhoat7MK+K3gg==
X-Received: by 2002:a05:6402:188:: with SMTP id
 r8mr29136045edv.75.1620806724749; 
 Wed, 12 May 2021 01:05:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i4sm1196126ejg.27.2021.05.12.01.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 01:05:24 -0700 (PDT)
Subject: Re: [PULL 30/33] migration: do not restart VM after successful
 snapshot-load
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
 <20210511081350.419428-31-pbonzini@redhat.com> <YJpGxIcrLeZ21EUT@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9c737fec-4830-2c7b-504f-2bf7a08a18ec@redhat.com>
Date: Wed, 12 May 2021 10:05:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJpGxIcrLeZ21EUT@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/21 10:56, Dr. David Alan Gilbert wrote:
> * Paolo Bonzini (pbonzini@redhat.com) wrote:
>> The HMP loadvm code is calling load_snapshot rather than
>> qmp_snapshot_load, in order to bypass the job infrastructure.  The code
>> around it is almost the same, with one difference: hmp_loadvm is
>> restarting the VM if load_snapshot fails, qmp_snapshot_load is doing so
>> if load_snapshot succeeds.
>>
>> Fix the bug in QMP by moving the common code to load_snapshot.
> 
> See my comment:
> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01103.html
> 
> but you've also lost Eric's Rb.

Sorry, I missed both replies.  As Daniel pointed out, the bug is in the 
QMP version.  Kevin has the correct fix, I'll send the cleanup of 
vm_stop/vm_start separately on top of his patch.

Paolo

> Dave
> 
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   migration/savevm.c | 16 ++++++++--------
>>   monitor/hmp-cmds.c |  7 +------
>>   2 files changed, 9 insertions(+), 14 deletions(-)
>>
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 52e2d72e4b..a899191cbf 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -2992,6 +2992,7 @@ bool load_snapshot(const char *name, const char *vmstate,
>>       int ret;
>>       AioContext *aio_context;
>>       MigrationIncomingState *mis = migration_incoming_get_current();
>> +    int saved_vm_running  = runstate_is_running();
>>   
>>       if (!bdrv_all_can_snapshot(has_devices, devices, errp)) {
>>           return false;
>> @@ -3024,6 +3025,8 @@ bool load_snapshot(const char *name, const char *vmstate,
>>           return false;
>>       }
>>   
>> +    vm_stop(RUN_STATE_RESTORE_VM);
>> +
>>       /*
>>        * Flush the record/replay queue. Now the VM state is going
>>        * to change. Therefore we don't need to preserve its consistency
>> @@ -3061,13 +3064,17 @@ bool load_snapshot(const char *name, const char *vmstate,
>>   
>>       if (ret < 0) {
>>           error_setg(errp, "Error %d while loading VM state", ret);
>> -        return false;
>> +        goto err_restart;
>>       }
>>   
>>       return true;
>>   
>>   err_drain:
>>       bdrv_drain_all_end();
>> +err_restart:
>> +    if (saved_vm_running) {
>> +        vm_start();
>> +    }
>>       return false;
>>   }
>>   
>> @@ -3135,17 +3142,10 @@ static void snapshot_load_job_bh(void *opaque)
>>   {
>>       Job *job = opaque;
>>       SnapshotJob *s = container_of(job, SnapshotJob, common);
>> -    int orig_vm_running;
>>   
>>       job_progress_set_remaining(&s->common, 1);
>>   
>> -    orig_vm_running = runstate_is_running();
>> -    vm_stop(RUN_STATE_RESTORE_VM);
>> -
>>       s->ret = load_snapshot(s->tag, s->vmstate, true, s->devices, s->errp);
>> -    if (s->ret && orig_vm_running) {
>> -        vm_start();
>> -    }
>>   
>>       job_progress_update(&s->common, 1);
>>   
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 0ad5b77477..a39436c8cb 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1127,15 +1127,10 @@ void hmp_balloon(Monitor *mon, const QDict *qdict)
>>   
>>   void hmp_loadvm(Monitor *mon, const QDict *qdict)
>>   {
>> -    int saved_vm_running  = runstate_is_running();
>>       const char *name = qdict_get_str(qdict, "name");
>>       Error *err = NULL;
>>   
>> -    vm_stop(RUN_STATE_RESTORE_VM);
>> -
>> -    if (!load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
>> -        vm_start();
>> -    }
>> +    load_snapshot(name, NULL, false, NULL, &err);
>>       hmp_handle_error(mon, err);
>>   }
>>   
>> -- 
>> 2.26.2
>>
>>
>>


