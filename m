Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4143876F8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:55:01 +0200 (CEST)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixNM-0007Jc-QN
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liwk6-0003Vp-9U
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liwk3-0002NM-Vt
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bn4mGOFagsLMlfw2827h/n2j5m2oymHznzHxM8pQSjg=;
 b=X+J7KowDyBu/8DqvmpVRXiZlkQaDwpgGlPldls4+eGBEnuFx0h4rEuLPPERnjXGKlL6q3n
 ITwQ9DULo0hSOUQQNcfWwXfLlAvVEFizJaX3wK0M5tPs+AMd+yYdcxvPrEEJWqzW23XxAC
 9d+R3tklfpdYIs3LMUQ5jmWY91NXMfM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-e1YHPvmmOpq2mkKBtnffVQ-1; Tue, 18 May 2021 06:14:20 -0400
X-MC-Unique: e1YHPvmmOpq2mkKBtnffVQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 j16-20020a1709062a10b02903ba544485d0so2194357eje.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bn4mGOFagsLMlfw2827h/n2j5m2oymHznzHxM8pQSjg=;
 b=hEAaZhueZ15UuKHTdmRGRhx3UScqGE0P1CcHKGPyl26COy6a4OVhTTnOPXrYxjTN8J
 mVLesO/Aiozih+6W4Rs/znYIEMqKYPmbu1hwdvwFr7kw3Odk+X4tS+liRUqzx9+YdiHd
 /dZd6nqjrgfhO+juRjk6HBalzeXOOYFTLgNvqL39IBNZcp/o0/CuK453Q5kTNlM2pSpn
 m6igU4ZS3GmznJtOuxhbJl/UTVB7UrsYB4YRMpOLGWbaytqY4XPfqf2ZASEPEIaRzI+C
 N4w+orkiPdD+giuvzPnHwK5hVwSMhgzj9XZeFDcA2YTkC8SinWbNnsF2aIZtYKg+OAog
 tccg==
X-Gm-Message-State: AOAM530GEtSYnVWtyp62Ptq5Iq6Aksqn++wxhc8xb8m26xmo5sY4ucy7
 cSchnk0G1aPXt26K0zTvB4NoAtaYnisNIrAc/aRnwYJDsbCKPRdS4AVaoFEt9JHv3I4ejEBsheA
 n7h+Di9jGU4Hb+hYcxCs4VcP+bxktDWBJg+S1etVvvZsjmmLvfLEG520R1GRs+LCLleQ=
X-Received: by 2002:a17:906:938a:: with SMTP id
 l10mr5198457ejx.540.1621332858994; 
 Tue, 18 May 2021 03:14:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtPKSciae6HIOsjY41fYNY0o/xU4UKsh7bRhprtFG0yHuvzPBoVWj/ntuAmMtm7ec6BhQ6rQ==
X-Received: by 2002:a17:906:938a:: with SMTP id
 l10mr5198432ejx.540.1621332858759; 
 Tue, 18 May 2021 03:14:18 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 z4sm12713515edc.1.2021.05.18.03.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:14:18 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] progressmeter: protect with a mutex
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210518094058.25952-1-eesposit@redhat.com>
 <20210518094058.25952-5-eesposit@redhat.com>
 <60139fc9-4856-1dfa-222d-08267cb89c27@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <b0de7a46-5abc-3aef-adcb-438474274436@redhat.com>
Date: Tue, 18 May 2021 12:14:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <60139fc9-4856-1dfa-222d-08267cb89c27@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 18/05/2021 12:00, Vladimir Sementsov-Ogievskiy wrote:
> 18.05.2021 12:40, Emanuele Giuseppe Esposito wrote:
>> Progressmeter is protected by the AioContext mutex, which
>> is taken by the block jobs and their caller (like blockdev).
>>
>> We would like to remove the dependency of block layer code on the
>> AioContext mutex, since most drivers and the core I/O code are already
>> not relying on it.
>>
>> Create a new C file to implement the ProgressMeter API, but keep the
>> struct as public, to avoid forcing allocation on the heap.
>>
>> Also add a mutex to be able to provide an accurate snapshot of the
>> progress values to the caller.
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> patch changed a lot, so you can't keep Stefan's r-b. r-b should be kept 
> if patch is unchanged.

Sorry, my bad. Will remove it, if we keep these changes (see below).

> 
> 
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/meson.build             |  1 +
>>   block/progress_meter.c        | 64 +++++++++++++++++++++++++++++++++++
>>   blockjob.c                    | 33 +++++++++++++-----
>>   include/qemu/progress_meter.h | 34 +++++++++++--------
>>   job-qmp.c                     |  8 +++--
>>   job.c                         |  3 ++
>>   qemu-img.c                    |  9 +++--
>>   7 files changed, 124 insertions(+), 28 deletions(-)
>>   create mode 100644 block/progress_meter.c
>>
>> diff --git a/block/meson.build b/block/meson.build
>> index d21990ec95..90efd21ecf 100644
>> --- a/block/meson.build
>> +++ b/block/meson.build
>> @@ -13,6 +13,7 @@ block_ss.add(files(
>>     'commit.c',
>>     'copy-on-read.c',
>>     'preallocate.c',
>> +  'progress_meter.c',
>>     'create.c',
>>     'crypto.c',
>>     'dirty-bitmap.c',
>> diff --git a/block/progress_meter.c b/block/progress_meter.c
>> new file mode 100644
>> index 0000000000..aa2e60248c
>> --- /dev/null
>> +++ b/block/progress_meter.c
>> @@ -0,0 +1,64 @@
>> +/*
[...]>
> That's not what I meant.

I know it's not what you meant. But since Paolo also pointed out that it 
would be better to avoid heap allocations, I went for something in 
between :) In the end it doesn't look so bad to have a separate .c file.

  If we move only function to c file, this
> doesn't make real sense. If we want encapsulation, we should move the 
> structure definition itself to the c file too. Than, you'll need _new / 
> _free functions instead of _init / _destroy, because we'll move to heap 
> allocation for progress meter. Also, if we go this way, please make at 
> least two patches:
> 
> 1. move progress meter (functions and structure) to own c file, modify 
> meson.build
> 
> 2. add thread-safety

Let's see how this goes, and then if we keep the .c file I will split 
the patches. But I guess this requires a v3 anyways.

Emanuele


