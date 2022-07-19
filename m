Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7C6579CC4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:42:49 +0200 (CEST)
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmYq-0003Aq-CV
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDmWa-0000eH-I7
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:40:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDmWW-0006VN-BZ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658234423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifc7c8NHzmrLSe6w4ZS3Ah26N4FhNhxMKXIhqiTQ6zQ=;
 b=QeMxUKelu/Ntfe+aoQPoZL/Jvl72xw4aU4P0Euuvd72SVzyOlCIPl4XTM8Osx/kQA7RUrr
 pNLELDNRSIkHSD7AjHqPN0+/Ax1aFhkp1GJGs0wYZRbB8MzXHhTd/tTC6/sOewqLXDPUPx
 p+mBd3p1BR4GwFXphnPkZS/tdyw/mR8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-EkDXBH8jMcaVuwfYVaA3nA-1; Tue, 19 Jul 2022 08:40:17 -0400
X-MC-Unique: EkDXBH8jMcaVuwfYVaA3nA-1
Received: by mail-qv1-f70.google.com with SMTP id
 p11-20020a0cfd8b000000b0047318870bdfso7338576qvr.14
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ifc7c8NHzmrLSe6w4ZS3Ah26N4FhNhxMKXIhqiTQ6zQ=;
 b=A5f0oFzc4psCG1cRMxmIsgt1N8cRQrTIRpOzXOlCHtRQ+mV9QVkqKLQ+36VlGmqldK
 SgVsA+znOex6YfD43D9xNd8DNwkczfC7KAJ0iaRhHxdbhlgmHAYHeEuE3FEAXAEGz2L3
 v7RLNHDcw5mAGIdTp4Vv9RR5ZHci+kRx+XLpqhuomj5YbmLKldR3Auqa80YdKGKKP8Rr
 PNWT4UK20HVil244098msBprEeisO/3BJpnDR/MCZTTlGc7x3bhhMMaXm26lYDwJzQOT
 7Sye5GZiMqdbqZl+5OwxxbgVRaztEvbrBnF8/G+PF/d9WCVCXRoiT4HuLUlBihTsjY3D
 401g==
X-Gm-Message-State: AJIora+l6xThuCX0Jk5TRnq9/fkHGCzdqIw0BmTIGFkwM4pO/bqbibXV
 ivjy0PEQGpnC12WPPX3S6uU4ESsu0Wghm/FuvV/Xzi8SyyX/jR6Bw5TmYyOY49yBrurZYw33ATW
 oFuDqd3Jo6nwhNOg=
X-Received: by 2002:a05:622a:1195:b0:31a:af14:ae00 with SMTP id
 m21-20020a05622a119500b0031aaf14ae00mr25080432qtk.305.1658234417048; 
 Tue, 19 Jul 2022 05:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tHvlnd3nxCtkYqVsGb+5siUBdNsXhxgkdYE7A7dNhZVjyzfhC5qZVQc1DaV4hKtIuwmqSL1g==
X-Received: by 2002:a05:622a:1195:b0:31a:af14:ae00 with SMTP id
 m21-20020a05622a119500b0031aaf14ae00mr25080414qtk.305.1658234416807; 
 Tue, 19 Jul 2022 05:40:16 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a37640e000000b006b5869c1525sm13127331qkb.21.2022.07.19.05.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 05:40:16 -0700 (PDT)
Message-ID: <5e29e502-95a9-3776-b12e-6e70ced6c83f@redhat.com>
Date: Tue, 19 Jul 2022 14:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 11/21] jobs: group together API calls under the same
 job lock
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
 <20220706201533.289775-12-eesposit@redhat.com>
 <1925769b-7fc1-a5f3-b9bf-9799a0656b69@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <1925769b-7fc1-a5f3-b9bf-9799a0656b69@yandex-team.ru>
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



Am 11/07/2022 um 15:26 schrieb Vladimir Sementsov-Ogievskiy:
>>   }
>>     static bool child_job_drained_poll(BdrvChild *c)
>> @@ -111,8 +113,10 @@ static bool child_job_drained_poll(BdrvChild *c)
>>       /* An inactive or completed job doesn't have any pending
>> requests. Jobs
>>        * with !job->busy are either already paused or have a pause
>> point after
>>        * being reentered, so no job driver code will run before they
>> pause. */
>> -    if (!job->busy || job_is_completed(job)) {
>> -        return false;
>> +    WITH_JOB_LOCK_GUARD() {
>> +        if (!job->busy || job_is_completed_locked(job)) {
>> +            return false;
>> +        }
>>       }
> 
> This doesn't correspond to commit subject. I'd put such things to
> separate commit "correct use of job_mutex in blockjob.c".
> 
>>         /* Otherwise, assume that it isn't fully stopped yet, but
>> allow the job to
>> @@ -127,7 +131,9 @@ static bool child_job_drained_poll(BdrvChild *c)
>>   static void child_job_drained_end(BdrvChild *c, int
>> *drained_end_counter)
>>   {
>>       BlockJob *job = c->opaque;
>> -    job_resume(&job->job);
>> +    WITH_JOB_LOCK_GUARD() {
>> +        job_resume_locked(&job->job);
>> +    }
>>   }
> 
> Again, don't see a reason for such change.
> 
> 
> [my comments relate to more similar cases in the patch]

I think you misunderstood: I aim to group API calls under the same lock.
One application of such grouping involves loops, but not only them.

Regarding the single-line WITH_JOB_LOCK_GUARD (job_next, job_pause,
job_resume and similar), I guess I will keep the not-locked function.

Emanuele


