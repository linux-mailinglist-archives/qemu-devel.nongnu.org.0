Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB4457B814
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 16:07:44 +0200 (CEST)
Received: from localhost ([::1]:40888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEAMZ-0005Xz-C7
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 10:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oEALB-0003y3-Fz
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 10:06:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oEAL8-00006Z-6U
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 10:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658325973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcaMijrSWsJb1PpODPZ+NAHBI++4FifXMDxaNIQ2ZEk=;
 b=UfV7R8dAm9swKcZeaSM4nYbiwBoAmFXlwyYI0GfeJO52IV2SwroROZUAdqefEGFNYd5t/7
 ALuVOKIQElDL1Yhn268Q1BGI6Ln/Oc1V8s6Fob/RNIL+LRaal7pmuzEW8QR7LG52pSWhGl
 6xOTnKejAa0+yo6Vmtc01wk15wGLjAk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-NLK3zQY6NCiCtxz1w1GuNg-1; Wed, 20 Jul 2022 10:06:12 -0400
X-MC-Unique: NLK3zQY6NCiCtxz1w1GuNg-1
Received: by mail-qv1-f70.google.com with SMTP id
 u15-20020a0ced2f000000b004732a5e7a99so9464044qvq.5
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 07:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xcaMijrSWsJb1PpODPZ+NAHBI++4FifXMDxaNIQ2ZEk=;
 b=IJSD8I3xwMDQpo8xL+eB5MlLbtFTr6IIQcsWrZ6a4V9CwvV2uZznQ7DdtKWG7HVJh3
 dapLVlONB7yLfiIvLR9e5hnik6Vl4saKOFkTIaBLm2oNkuHGAsrUz2QkDEh1gwLKfdFk
 W8gC6LnYNQ0v6LIeYOo3QUFLkTumfsKdX/sIRedvj1HW6Gu27psOUi4rv/ArLC4vn57F
 6pAz/8A3VuRDDQCjTnd2aYOWMjK79vawnufIgygU75+xNqYra3+x+960+l/2gmuLGcCT
 ESHrKstHToyyos18noQhdWt8rHf8Lz/ADMfiKBfYoJvpOxQbsZef045VVSGHt0Ta+bCb
 NyAw==
X-Gm-Message-State: AJIora8vKCSq4EsM6yxsc7nA7czXgQv1XOlAHSJP8L+dxoVFTMlgAWr1
 KNCMOpqHlw5DVkiVy14vj1oHvIcYc2SuZyiIGcJa8Quo6zW59GIB8H6T+OAZvUBmJBQH32Xxycm
 YEwmtt5lrpGPgXWk=
X-Received: by 2002:a37:8706:0:b0:6b5:d405:7825 with SMTP id
 j6-20020a378706000000b006b5d4057825mr16424626qkd.657.1658325971507; 
 Wed, 20 Jul 2022 07:06:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s0eHNrNgQDNp3zqU28aGUZEHAoVZHcqwqAV61oT1s2d3PPJpIO1VtC7yjsz6+frt2F6ugsIg==
X-Received: by 2002:a37:8706:0:b0:6b5:d405:7825 with SMTP id
 j6-20020a378706000000b006b5d4057825mr16424598qkd.657.1658325971169; 
 Wed, 20 Jul 2022 07:06:11 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 c8-20020ac86608000000b0031eb6b42b26sm12049558qtp.73.2022.07.20.07.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 07:06:10 -0700 (PDT)
Message-ID: <e1b5b06b-1ce3-870d-617e-65b623fa4548@redhat.com>
Date: Wed, 20 Jul 2022 16:06:06 +0200
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
 <a45a572b-031e-6a88-439f-ca276202a357@redhat.com>
 <5f671004-acd0-f799-5483-97fb23be4edb@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <5f671004-acd0-f799-5483-97fb23be4edb@yandex-team.ru>
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



Am 20/07/2022 um 15:15 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/19/22 16:07, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 11/07/2022 um 16:51 schrieb Vladimir Sementsov-Ogievskiy:
>>> On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
>>>> iostatus is the only field (together with .job) that needs
>>>> protection using the job mutex.
>>>>
>>>> It is set in the main loop (GLOBAL_STATE functions) but read
>>>> in I/O code (block_job_error_action).
>>>>
>>>> In order to protect it, change block_job_iostatus_set_err
>>>> to block_job_iostatus_set_err_locked(), always called under
>>>> job lock.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>
>>> Seems, that (and previous) patch should go before 15.
>>
>> Why?
> 
> As I understand, before patch 15 everything was protected by aio-context
> lock. After patch 15, this becomes a bug, which we fix now. If we do it
> before patch 15, we never introduce the bug.. Or what I miss?

Makes sense.

Emanuele

> 
>>
>>>
>>>> ---
>>>>    blockjob.c | 5 +++--
>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/blockjob.c b/blockjob.c
>>>> index a2559b97a7..893c8ff08e 100644
>>>> --- a/blockjob.c
>>>> +++ b/blockjob.c
>>>> @@ -367,7 +367,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error
>>>> **errp)
>>>>        return block_job_query_locked(job, errp);
>>>>    }
>>>>    -static void block_job_iostatus_set_err(BlockJob *job, int error)
>>>> +/* Called with job lock held */
>>>> +static void block_job_iostatus_set_err_locked(BlockJob *job, int
>>>> error)
>>>>    {
>>>>        if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
>>>>            job->iostatus = error == ENOSPC ?
>>>> BLOCK_DEVICE_IO_STATUS_NOSPACE :
>>>> @@ -586,8 +587,8 @@ BlockErrorAction block_job_error_action(BlockJob
>>>> *job, BlockdevOnError on_err,
>>>>                     */
>>>>                    job->job.user_paused = true;
>>>>                }
>>>> +            block_job_iostatus_set_err_locked(job, error);
>>>>            }
>>>> -        block_job_iostatus_set_err(job, error);
>>>>        }
>>>>        return action;
>>>>    }
>>>
>>>
>>
> 
> 


