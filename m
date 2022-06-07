Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B172453FFE8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 15:23:35 +0200 (CEST)
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZBG-0005f0-8J
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 09:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nyZ6B-0002P2-K3
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:18:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nyZ63-00055C-LA
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654607890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vOd/Jrb4lN8i9sqvnSgzLl+QEJI28nvCWUTDYTD/ok=;
 b=PqyPfcxVsJ5EXLx0Xk2s6kuc8eSv8UK4cSDf0ZpiiiW5guKY0FDpg6vtmPc1T5GtYTJb5q
 TXn1IRoQhpAgdLrPVwbvTitYvPH2EV0YbvFM3lsQrb6cym8+4xlOtyuWhf4ehEnwlJHxwN
 KpHsoRf5H5C1Oq4fDV1RtNuVBRrpvHg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-zW1pFz3vM4GVip_B2lGSBA-1; Tue, 07 Jun 2022 09:17:59 -0400
X-MC-Unique: zW1pFz3vM4GVip_B2lGSBA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so8779591wms.6
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 06:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7vOd/Jrb4lN8i9sqvnSgzLl+QEJI28nvCWUTDYTD/ok=;
 b=F/ij5nhqvJUw/gcGiX9HOpUwNCayK6oo9eK5OaZ67+knSY7GFmDozf6ahQI3XuC34a
 a68v8b5Jhzpz816WsOpCPxfuTp0Ei3VCX4AkeOlpO/ufHXFQ08iiYae+QrfM7CSuSjBa
 7tEiynvTRzlxiLvcyBgZ7gWrVMggxbsTVmnEEGxYUG+gzUmnbU19cvSBQCdiXC60dCR6
 HuF59zXIir0CRph/WPEHx92NT9yjcTxZ8fspjIwQUI7/klOrXhShEWu4G5QPP+eZyS3e
 ictSK6nhqlryodkMwFWnifZpzohxGF9jV6N7SbsBdeRCdi3ELTSJz2a2VDIhtXd7N4oD
 5NRA==
X-Gm-Message-State: AOAM5324O21HxkCVNhOf7Wk3wkKS93ebsmAu4wisLyijz6BVMG8LIrLg
 8yfUnmwtBEMt7AodmxDBoDpT+n921w1AVJZ6QJlrNiEsU2vW4yFmx8Ivmt98e97HFLsUYlBgtSR
 l45r14R9Slx1f0uY=
X-Received: by 2002:a5d:4112:0:b0:216:1abb:f731 with SMTP id
 l18-20020a5d4112000000b002161abbf731mr18353871wrp.618.1654607877104; 
 Tue, 07 Jun 2022 06:17:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpVXKyiHMW59xepGlSayVxm6T5J1JTyM1T9Bf9GddcUih+uA9kA9uInxqP3yH+HTl9ZedbhA==
X-Received: by 2002:a5d:4112:0:b0:216:1abb:f731 with SMTP id
 l18-20020a5d4112000000b002161abbf731mr18353823wrp.618.1654607876717; 
 Tue, 07 Jun 2022 06:17:56 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c2cac00b0039749256d74sm25319738wmc.2.2022.06.07.06.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 06:17:56 -0700 (PDT)
Message-ID: <e1e6a510-1b3d-e126-b9d8-a8e1bbca637f@redhat.com>
Date: Tue, 7 Jun 2022 15:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 06/18] jobs: protect jobs with job_lock/unlock
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
 <20220314133707.2206082-7-eesposit@redhat.com> <Ypo5lHwqTc2FtyNh@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Ypo5lHwqTc2FtyNh@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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



Am 03/06/2022 um 18:40 schrieb Kevin Wolf:
> Am 14.03.2022 um 14:36 hat Emanuele Giuseppe Esposito geschrieben:
>> Introduce the job locking mechanism through the whole job API,
>> following the comments  in job.h and requirements of job-monitor
>> (like the functions in job-qmp.c, assume lock is held) and
>> job-driver (like in mirror.c and all other JobDriver, lock is not held).
>>
>> Use the _locked helpers introduced before to differentiate
>> between functions called with and without job_mutex.
>> This only applies to function that are called under both
>> cases, all the others will be renamed later.
>>
>> job_{lock/unlock} is independent from real_job_{lock/unlock}.
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  block.c             |  18 ++++---
>>  block/replication.c |   8 ++-
>>  blockdev.c          |  17 ++++--
>>  blockjob.c          |  56 +++++++++++++-------
>>  job-qmp.c           |   2 +
>>  job.c               | 125 +++++++++++++++++++++++++++++++-------------
>>  monitor/qmp-cmds.c  |   6 ++-
>>  qemu-img.c          |  41 +++++++++------
>>  8 files changed, 187 insertions(+), 86 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 718e4cae8b..5dc46fde11 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -4978,7 +4978,9 @@ static void bdrv_close(BlockDriverState *bs)
>>  
>>  void bdrv_close_all(void)
>>  {
>> -    assert(job_next(NULL) == NULL);
>> +    WITH_JOB_LOCK_GUARD() {
>> +        assert(job_next(NULL) == NULL);
>> +    }
>>      GLOBAL_STATE_CODE();
> 
> This series seems really hard to review patch by patch, in this case
> because I would have to know whether you intended job_next() to be
> called with the lock held or not. Nothing in job.h indicates either way
> at this point in the series.

Well if it's under lock it means all its calls will be under lock. If
some cases will be under lock and some other not, I use the _locked
version, as described in the commit description.

> 
> Patch 11 answers this by actually renaming it job_next_locked(), but
> always having to refer to the final state after the whole series is
> applied is really not how things should work. We're splitting the work
> into individual patches so that the state after each single patch makes
> sense on its own. Otherwise the whole series could as well be a single
> patch. :-(

The various function and ordering has changed pretty much in each of the
6 version I sent, because it is very difficult to understand what comes
first and what can go afterwards.

Anyways, I see what you mean but I would not move patch 11 before this
one, because otherwise we would have _locked functions used without
having even a fake lock around, and the next reviewer would complain. In
fact, I think I put it afterwards because someone initially suggested so.

Ideally we want both patches together, but then it will be a total mess
to read, so I would leave it as it is.

In addition, I don't think it would hurt to have "normal" (ie without
_locked) functions wrapped by a nop macro.

Emanuele

> 
> So I'd argue that patch 11 should probably come before this one.
> 
> Anyway, I guess I'll try to make my way to the end of the series quickly
> and then somehow try to verify whatever the state is then.
> 
> Kevin
> 


