Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEDD579F02
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:09:52 +0200 (CEST)
Received: from localhost ([::1]:54740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmz1-00022M-3X
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDmx0-0000Y7-HI
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDmwv-0002wU-HH
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658236060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUDLix6yuqzoHg8MJx2eT5w8S52TIC8iYOTATwPTaZw=;
 b=YxEslJljjZ8dDzrnZcxmb9W2qZUhZD3nPBXfLUstBmGhZBddbBtWp+jGpscWMcHYvx1VqS
 a4gBF2Ckd1loCfsqkqu1xkALFqmK6tdWkYoMTSQCVrNbAwmI+FENA3YVPCUyohJfsu68rg
 ptdeRlbQInMlmZBqywATn9LsFZlfoLc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-LgZ4rSFrP8G5ytRPyhzfmQ-1; Tue, 19 Jul 2022 09:07:36 -0400
X-MC-Unique: LgZ4rSFrP8G5ytRPyhzfmQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 u15-20020a0ced2f000000b004732a5e7a99so7307954qvq.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 06:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RUDLix6yuqzoHg8MJx2eT5w8S52TIC8iYOTATwPTaZw=;
 b=F2jhkMHjPTofgMhbmPIeSenLt2LHdI0HYnxVJz39kPHbVsztEiGUKWixt9eXwx3PwW
 4u1gtHGLGoszACYHe9p52/0eWdOA88qupOoBGIeN31qhP4IxtwRbz+00ATJvlJNHILzc
 X3jDi83stT+LovTeSHrlVQVMjPoC0Xj8XscvFhVROL6ka6X1fa3sWZt1VfR350X3kzU1
 jzMbeMmiDASwbtlUx9gJ+BRz4SOuBEdPayul39VK6ffALgOUkSpfBbrS1NiprPnU4NfH
 +B8syQacLZGKiLE2dSZ/dlGFqRNuzalttmIP6yhjT6SIoo6XMjLTSrfoNJL5trnqYJVw
 IKrQ==
X-Gm-Message-State: AJIora9dRWQ7wI2+jqnZU/qleVdFyFlyK5/HW7sWBsCHVmRnUoxt1yAD
 dQmCzesAdD6ZxRTl3W33A4dHq7/WEG3iPMUALtHGy0V2Nqsh8CfqIGhS5p703aRq3NmSy9YMheb
 V5yJfh2tXOqytALo=
X-Received: by 2002:a05:620a:4409:b0:6b5:9563:2357 with SMTP id
 v9-20020a05620a440900b006b595632357mr20597704qkp.394.1658236055441; 
 Tue, 19 Jul 2022 06:07:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sLNfh8ZCdIslVvcH82eYOx+KqipYexmUJy2OU3rI34W5CZUFIQsOM6uagrVVBAaZrvNWNppA==
X-Received: by 2002:a05:620a:4409:b0:6b5:9563:2357 with SMTP id
 v9-20020a05620a440900b006b595632357mr20597674qkp.394.1658236055145; 
 Tue, 19 Jul 2022 06:07:35 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a37ea0d000000b006af147d4876sm13399677qkj.30.2022.07.19.06.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 06:07:34 -0700 (PDT)
Message-ID: <a45a572b-031e-6a88-439f-ca276202a357@redhat.com>
Date: Tue, 19 Jul 2022 15:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 19/21] blockjob: protect iostatus field in BlockJob
 struct
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-20-eesposit@redhat.com>
 <00b8b101-b36f-2204-0e49-1c605268b793@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <00b8b101-b36f-2204-0e49-1c605268b793@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 11/07/2022 um 16:51 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
>> iostatus is the only field (together with .job) that needs
>> protection using the job mutex.
>>
>> It is set in the main loop (GLOBAL_STATE functions) but read
>> in I/O code (block_job_error_action).
>>
>> In order to protect it, change block_job_iostatus_set_err
>> to block_job_iostatus_set_err_locked(), always called under
>> job lock.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> Seems, that (and previous) patch should go before 15.

Why?

> 
>> ---
>>   blockjob.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/blockjob.c b/blockjob.c
>> index a2559b97a7..893c8ff08e 100644
>> --- a/blockjob.c
>> +++ b/blockjob.c
>> @@ -367,7 +367,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error
>> **errp)
>>       return block_job_query_locked(job, errp);
>>   }
>>   -static void block_job_iostatus_set_err(BlockJob *job, int error)
>> +/* Called with job lock held */
>> +static void block_job_iostatus_set_err_locked(BlockJob *job, int error)
>>   {
>>       if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
>>           job->iostatus = error == ENOSPC ?
>> BLOCK_DEVICE_IO_STATUS_NOSPACE :
>> @@ -586,8 +587,8 @@ BlockErrorAction block_job_error_action(BlockJob
>> *job, BlockdevOnError on_err,
>>                    */
>>                   job->job.user_paused = true;
>>               }
>> +            block_job_iostatus_set_err_locked(job, error);
>>           }
>> -        block_job_iostatus_set_err(job, error);
>>       }
>>       return action;
>>   }
> 
> 


