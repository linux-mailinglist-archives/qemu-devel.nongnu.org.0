Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701AB53FFFF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 15:26:49 +0200 (CEST)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZEO-0001zA-95
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 09:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nyZB1-0007c8-S2
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:23:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nyZAz-0006d1-Ri
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654608197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qu8zyYdO0C9hxlnRF/9jBkCimUJ+oRQ+KxYe9dI2az4=;
 b=YoUjJwgeDFoRSJaYpbbLobCRf497M9RECx3mgc32FtljcvCUeZBRzVqiyTpVIfiuRCnyxw
 3HbjaoqHjgpfkewFKfSyiBoUhS/UbBOfT/DSbCcIhA2SoEKqXo/xWibCwzT8v5YUAv2ahS
 tpUi7yMWI1Qk99UANWKSICyQSeGbk/U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-dGbr0PhkOw2gD-Omdtmjeg-1; Tue, 07 Jun 2022 09:23:16 -0400
X-MC-Unique: dGbr0PhkOw2gD-Omdtmjeg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k32-20020a05600c1ca000b0039c4cf75023so3784577wms.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 06:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qu8zyYdO0C9hxlnRF/9jBkCimUJ+oRQ+KxYe9dI2az4=;
 b=W3JW2sZC8occ/0ZQcyhUTJ85E65x0yKRH9ExplF25d8cTY+6ai7tHHnlbOMPrdh1s4
 vJp2PNvh/2ylSHgUGTPLNJkYnZILAzCM3RQIkM406txQxF4pZ/mzha76ZOLMR5tSxkl5
 58tKXt8KY9EvCWhuMTwzRdG4dGBFQ11JY3LVKMmTAsC7yKzdQ0r00M6DBhg+PmRmn591
 4DWNmnKssWjrooPmM9aPaNUmZZxoP09cu44xbYRytfmctTt7KEL9AvReZGtdJuOSpCU5
 eHGOrFQLycWqJTpUgPwuKyrATY1iVnEoifnK5Fjioyd2aKHMmc7zt0rcunm3ZrRpcrO3
 rUCQ==
X-Gm-Message-State: AOAM531Rc6Dg9qG+NWjqdhv94kyQ3uprYtk99f/qHxSvV1QiCow4tBhW
 22Ew4Oa3BBOuqdguHNyH/f7oSR3OZ14BFNa2zyBywKBYuyUxsWMHmCoz8DLhP18Qa72ovNbK16o
 HbBSJoEqFbGpxZI4=
X-Received: by 2002:a7b:c205:0:b0:39c:506d:e294 with SMTP id
 x5-20020a7bc205000000b0039c506de294mr10455133wmi.159.1654608194013; 
 Tue, 07 Jun 2022 06:23:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/JWAU9O6SxyqxJDMfs8a0WOIgt99LbmojtSW/OWbXK4pTUBoXcDxtPnqTSlTSMvh/M8bgkw==
X-Received: by 2002:a7b:c205:0:b0:39c:506d:e294 with SMTP id
 x5-20020a7bc205000000b0039c506de294mr10455088wmi.159.1654608193739; 
 Tue, 07 Jun 2022 06:23:13 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 o34-20020a05600c512200b003944821105esm22681672wms.2.2022.06.07.06.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 06:23:13 -0700 (PDT)
Message-ID: <6521dd2c-74ae-4b91-089e-9fb4aad74714@redhat.com>
Date: Tue, 7 Jun 2022 15:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 05/18] job.h: add _locked duplicates for job API
 functions called with and without job_mutex
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-6-eesposit@redhat.com> <Ypo0G0/jK+mLOuAm@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Ypo0G0/jK+mLOuAm@redhat.com>
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



Am 03/06/2022 um 18:17 schrieb Kevin Wolf:
> Am 14.03.2022 um 14:36 hat Emanuele Giuseppe Esposito geschrieben:
>> In preparation to the job_lock/unlock usage, create _locked
>> duplicates of some functions, since they will be sometimes called with
>> job_mutex held (mostly within job.c),
>> and sometimes without (mostly from JobDrivers using the job API).
>>
>> Therefore create a _locked version of such function, so that it
>> can be used in both cases.
>>
>> List of functions duplicated as _locked:
>> job_is_ready (both versions are public)
>> job_is_completed (both versions are public)
>> job_is_cancelled (_locked version is public, needed by mirror.c)
>> job_pause_point (_locked version is static, purely done to simplify the code)
>> job_cancel_requested (_locked version is static)
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  include/qemu/job.h | 25 +++++++++++++++++++++---
>>  job.c              | 48 ++++++++++++++++++++++++++++++++++++++++------
>>  2 files changed, 64 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index 6000463126..aa33d091b1 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -473,21 +473,40 @@ const char *job_type_str(const Job *job);
>>  /** Returns true if the job should not be visible to the management layer. */
>>  bool job_is_internal(Job *job);
>>  
>> -/** Returns whether the job is being cancelled. */
>> +/**
>> + * Returns whether the job is being cancelled.
>> + * Called with job_mutex *not* held.
>> + */
>>  bool job_is_cancelled(Job *job);
>>  
>> +/** Just like job_is_cancelled, but called between job_lock and job_unlock */
>> +bool job_is_cancelled_locked(Job *job);
>> +
>>  /**
>>   * Returns whether the job is scheduled for cancellation (at an
>>   * indefinite point).
>> + * Called with job_mutex *not* held.
>>   */
>>  bool job_cancel_requested(Job *job);
>>  
>> -/** Returns whether the job is in a completed state. */
>> +/**
>> + * Returns whether the job is in a completed state.
>> + * Called with job_mutex *not* held.
>> + */
>>  bool job_is_completed(Job *job);
>>  
>> -/** Returns whether the job is ready to be completed. */
>> +/** Same as job_is_completed(), but assumes job_lock is held. */
>> +bool job_is_completed_locked(Job *job);
> 
> Any reason why this comment is phrased differently than for
> job_is_cancelled_locked()? I don't mind which one we use, but if they
> should express the same thing, it would be better to have the same
> wording. If they should express different things, it need to be clearer
> what they are.
> 

Makes sense, I will switch to the same format as job_is_cancelled_locked().

Emanuele

> Also, I assume job_mutex is meant because job_lock() is a function, not
> the lock that is held.
> 
>> +/**
>> + * Returns whether the job is ready to be completed.
>> + * Called with job_mutex *not* held.
>> + */
>>  bool job_is_ready(Job *job);
>>  
>> +/** Same as job_is_ready(), but assumes job_lock is held. */
>> +bool job_is_ready_locked(Job *job);
> 
> Same as above.
> 
>>  /**
>>   * Request @job to pause at the next pause point. Must be paired with
>>   * job_resume(). If the job is supposed to be resumed by user action, call
> 
> Kevin
> 


