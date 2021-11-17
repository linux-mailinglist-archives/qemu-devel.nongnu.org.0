Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B34C4547B1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 14:46:25 +0100 (CET)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLGZ-0004Fy-CZ
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 08:46:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mnLDc-0002hG-7c
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:43:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mnLDY-0006kV-SH
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637156595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRaqDm94swzPQKB0JwLLKVXXZYne4Vgc5HV78jgXPWk=;
 b=hqzEXCXDDe6S4oehyuL/eMl+PoeASqWdbc0RhnED/RHTjW2t0ReeoiV9+6337J9ymRJ4sw
 NQZkTdqbuZTXdNs1ETq/3IzEE6qLyQHhaJUXnY6THq1YRFXgGlEHPqlqaz4oW7g72meSC3
 MoN055jrM136bCBn+NTR5kk+2NXlWHQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-EpyMeKBAOlu4HLCi6Gsy7g-1; Wed, 17 Nov 2021 08:43:14 -0500
X-MC-Unique: EpyMeKBAOlu4HLCi6Gsy7g-1
Received: by mail-ed1-f72.google.com with SMTP id
 m8-20020a056402510800b003e29de5badbso2129647edd.18
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 05:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=TRaqDm94swzPQKB0JwLLKVXXZYne4Vgc5HV78jgXPWk=;
 b=AWzqWPtLAlcuFMfCT74QjVHREK9mR4Yy3FURys8uioESHnvFl/CWquGVS43myggeBn
 LmsiRxei1zAZHDPWV6+Pt5T4XRYF58RXYqPTrq6mtwQObQWA6pzshDNWP2sDRzCIdit6
 5pqLYrlmWCYRZfdIbkMCy6dl25MEIkHoSZtMHfxVEgELPQ6aS7eFN1g+ePWtwF3uYsm+
 FFVBaVDEUnVA+fivcZhoSrfFhVcCrju0G/T2YC0TImE/KHo3zDdFm9h81UokfSd8xLMz
 Z7NITLVJMCPPalTMIISiNZyvpghT/WcbVxAHYcq0wEnc3klwdnjvNF4IQjnR0/5ShwbO
 eA3Q==
X-Gm-Message-State: AOAM5335HxNeY9uiDlA7I+oZ0HpGu7kqZw/kvtNVXbvYQIZVjiC4ywmG
 HSVBmvNr+FQPUKJlkn1bfpl/CFHLMdbTGO8CWQk6kP1MA14bSx2/SgT+Q8myYLXHJlr7vORUiOe
 S67vDldde3mrx0Ys=
X-Received: by 2002:a17:906:5811:: with SMTP id
 m17mr21913677ejq.289.1637156593125; 
 Wed, 17 Nov 2021 05:43:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaK8Vpx8U/pfqCJrmG+gPT3jfDPS5sYy1BgXj9jrZXmTncWwyMme1Pq1xQBNOGN7KltyqTzQ==
X-Received: by 2002:a17:906:5811:: with SMTP id
 m17mr21913607ejq.289.1637156592845; 
 Wed, 17 Nov 2021 05:43:12 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id i15sm11166255edk.2.2021.11.17.05.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 05:43:12 -0800 (PST)
Message-ID: <a93747e7-8cb1-d2be-f658-d71d3a2a40e0@redhat.com>
Date: Wed, 17 Nov 2021 14:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v4 24/25] job.h: split function pointers in JobDriver
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-25-eesposit@redhat.com>
 <c7324851-ebe8-c797-360a-a5ec1c465d06@redhat.com>
In-Reply-To: <c7324851-ebe8-c797-360a-a5ec1c465d06@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15/11/2021 16:11, Hanna Reitz wrote:
> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>> The job API will be handled separately in another serie.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   include/qemu/job.h | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index 6e67b6977f..7e9e59f4b8 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -169,12 +169,21 @@ typedef struct Job {
>>    * Callbacks and other information about a Job driver.
>>    */
>>   struct JobDriver {
>> +
>> +    /* Fields initialized in struct definition and never changed. */
> 
> Like in patch 19, I’d prefer a slightly more verbose comment that I’d 
> find more easily readable.
> 
>> +
>>       /** Derived Job struct size */
>>       size_t instance_size;
>>       /** Enum describing the operation */
>>       JobType job_type;
>> +    /*
>> +     * Functions run without regard to the BQL and may run in any
> 
> s/and/that/?
> 
>> +     * arbitrary thread. These functions do not need to be thread-safe
>> +     * because the caller ensures that are invoked from one thread at 
>> time.
> 
> s/that/they/ (or “that they”)
> 
> I believe .run() must be run in the job’s context, though.  Not sure if 
> that’s necessary to note, but it isn’t really an arbitrary thread, and 
> block jobs certainly require this (because they run in the block 
> device’s context).  Or is that something that’s going to change with I/O 
> threading?
> 

What about moving .run() before the comment and add "Must be run in the 
job's context" to its comment description?

maybe also add the following assertion in job_co_entry (that calls 
job->run())?

assert(job->aio_context == qemu_get_current_aio_context());

Emanuele


