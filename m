Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9820D426847
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 12:50:10 +0200 (CEST)
Received: from localhost ([::1]:58598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYnS5-0005QF-Hu
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 06:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYnQj-0004Zl-Mu
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:48:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYnQh-0003kk-BF
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633690122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1de/dVKY6LpwDxAIrVXXBd8LCOUYOQADzexfRocGog=;
 b=FFpMXDwqABVBjsuj5w6ZHd7/OLtGwpvfqfIdY6e4Z3Tjelz3Kq2zrZdKmHOugM4YvuoZO6
 DPDNsuxUz5q5JwhyGEk1FpAOiPYfhYD8uSFXYrTowcQHXFiPnUn9x583IM8WUUnRxuObug
 mBuo8iU8KAMOQqhKaz5zwckt1CCNWvw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-6eJ50ONlMLOyngKd88SG2g-1; Fri, 08 Oct 2021 06:48:30 -0400
X-MC-Unique: 6eJ50ONlMLOyngKd88SG2g-1
Received: by mail-wr1-f72.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so7020235wrh.0
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 03:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A1de/dVKY6LpwDxAIrVXXBd8LCOUYOQADzexfRocGog=;
 b=qz5SLTrYnUJ2gPsKJoxJDqr+6ohEC2oHhoQ7TbG1sbKGw1kMLF+sqyucWzmcyngNSx
 4Z/PNQ1BmN9KYOoLu1ba6dendJEAwmRfO81QcFyT1WgUNcyAkJF/ICIsxCw3izhwd3CS
 G+hh+tdYF606iQz2RD+yzWgd0SbR5kJYAB6xWvQ+7Xz9BgZkHSmUkkaqEtCzKuiLwbUV
 0MWEBsO6QkgyzWYYyVCzMrqKCL0NOrkCOHwD0YfjSLMvJG6RGG2+4ObDo57Pc8WYrL97
 vEL8/ISgOwpNbQXzXdzD3r2QVwDP8DQ6Q7tXmNgIWYONoY9NaN2anp2SLljCY51MbjIb
 aJRw==
X-Gm-Message-State: AOAM532JO6wXYmR3yZGbYJCjuLYJG22d8i+SH33tmVxVrf0/s/OYa8oV
 +AcW2nlgkGH0TJUXuYrR50Z8xyAgowz5s1WPMY6S8jau72Ed9WpHLhUQVwyXTt0TyL0iiBt7v/F
 3nUYL2IzGPaQitQMBWKQ8HLbvwRJF734fb3SI3BfBqEOG1vnUQbixYWtxmNg/X94eyZc=
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr2546786wmq.163.1633690109120; 
 Fri, 08 Oct 2021 03:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyylT82ZRqoxvmYhd41x9/l+JI0JUbNcxzQV1OYd5ukYmDtAEZBZ+A2zflmaQJkJy3DngScyQ==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr2546748wmq.163.1633690108858; 
 Fri, 08 Oct 2021 03:48:28 -0700 (PDT)
Received: from pc-96.home ([2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9])
 by smtp.gmail.com with ESMTPSA id o8sm12508606wme.38.2021.10.08.03.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 03:48:28 -0700 (PDT)
Subject: Re: [RFC PATCH v2 24/25] job.h: split function pointers in JobDriver
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-25-eesposit@redhat.com>
 <YV8KMVycKfU/Zr6r@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <25d0ba31-6a97-7595-ed32-b712bfaf29e0@redhat.com>
Date: Fri, 8 Oct 2021 12:48:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YV8KMVycKfU/Zr6r@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/10/2021 16:54, Stefan Hajnoczi wrote:
> On Tue, Oct 05, 2021 at 10:32:14AM -0400, Emanuele Giuseppe Esposito wrote:
>> The job API will be handled separately in another serie.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   include/qemu/job.h | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index 41162ed494..c236c43026 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -169,12 +169,21 @@ typedef struct Job {
>>    * Callbacks and other information about a Job driver.
>>    */
>>   struct JobDriver {
>> +
>> +    /* Fields initialized in struct definition and never changed. */
>> +
>>       /** Derived Job struct size */
>>       size_t instance_size;
>>   
>>       /** Enum describing the operation */
>>       JobType job_type;
>>   
>> +    /*
>> +     * I/O API functions. These functions are thread-safe, and therefore
>> +     * can run in any thread as long as they have called
>> +     * aio_context_acquire/release().
>> +     */
> 
> This comment described the block layer well but job.h is more generic. I
> don't think these functions are necessarily thread-safe (they shouldn't
> be invoked from multiple threads at the same time). It's just that they
> are run without regard to the BQL and may run in an arbitrary thread.

Ok, in this instance I will change it to:

/*
  * Functions run without regard to the BQL and may run in any
  * arbitrary thread.
  */

Thank you,
Emanuele

> 
> Other than that:
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 


