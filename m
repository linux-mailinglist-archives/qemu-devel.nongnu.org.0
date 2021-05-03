Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC97E371307
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:32:30 +0200 (CEST)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUwH-0004GG-Sx
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldUu6-0003Wa-Ev
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:30:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldUu1-0006wf-FY
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620034209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNCbCR7K+dhuJtFsCVLg+qr4+cV7QS1WLe9CQVFEGlA=;
 b=gQjaqjCzjCeITvfUVnEMoEUqAKR2hwHApBV6r2IAaBZL/hO497jyg28cjSROwteKhAAlx7
 WQquIqCipssUuEfiAat6HO3Ki0Tyc4gzXhqZMbe+vG3eBVmm8voKimfRB83N7KmH+Qp7Eq
 5EUNeQyqSbNbS9/xBnswUSWcVA96EHY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-zc9IXm-WOzCrvhq0QQqGjQ-1; Mon, 03 May 2021 05:30:05 -0400
X-MC-Unique: zc9IXm-WOzCrvhq0QQqGjQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso1639576wrh.12
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 02:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KNCbCR7K+dhuJtFsCVLg+qr4+cV7QS1WLe9CQVFEGlA=;
 b=qCsr9CzagSqBNN7LH5N6pITCfhVxIGqWfpOVb8CJetpV7ZOcjaKpDCEBZWg+j+zDkG
 GMx0MiQIOjtodFnvM0+kc8FWiCsoyvN/CDJI4Cpxlqn3JzgtbL4IL6JQg0kNQ01hkPou
 mmExALOCPRkaJ4HtAR9v9ARTgRTprXf0YtXy1ZGtbtXxX0Y6PgLKATk+Rg7qEV2Frk8o
 gz/gEong5CcLZRsuDauijqQgGwnEvFTBnLXqT3DOTJ2y273ucapdI2iHNoR6FrpGSsvE
 trDOQGUBkzi9BgK01w1/PKvkQKNJ3HAWd4vGPonnPPQ7cTtTEVZJIz7UwA/13MUAyvGL
 amng==
X-Gm-Message-State: AOAM530PvM1PkmE61rdCoKXCZ8AFVHn5LbGLoAu7zA2RUByUaG9gMU46
 Y1iHAWVFIkBNlyM8fj+jOXR4NTIhGnof7DdbQpjhAsxHSnExB96SRYEua19vg29blom+D72RhiB
 N8jS1XvePGNrZJ0nMhLLWSsdHJCNK5705YFv2562ZzX2UnFboGo0zT//pIrnMqPsN
X-Received: by 2002:a7b:c316:: with SMTP id k22mr30857384wmj.176.1620034203998; 
 Mon, 03 May 2021 02:30:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGtBuQiXpErH0N99OkJkweFZdum7UYjESIykBM67v0Sk8sz7js47QvGb/YY9RR0ecFvauvUA==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr30857347wmj.176.1620034203732; 
 Mon, 03 May 2021 02:30:03 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id b12sm11815034wro.28.2021.05.03.02.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 02:30:03 -0700 (PDT)
Subject: Re: [PATCH 3/4] pc-bios/s390-ccw: Silence GCC 11 stringop-overflow
 warning
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-4-thuth@redhat.com>
 <20210503110000.56f175ac.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8a3e7c60-4b71-aa28-938c-f42259e9435b@redhat.com>
Date: Mon, 3 May 2021 11:30:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503110000.56f175ac.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 11:00 AM, Cornelia Huck wrote:
> On Sun,  2 May 2021 19:48:35 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> When building on Fedora 34 (gcc version 11.0.0 20210210) we get:
>>
>>   In file included from pc-bios/s390-ccw/main.c:11:
>>   In function ‘memset’,
>>       inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
>>       inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
>>   pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
>>      28 |         p[i] = c;
>>         |         ~~~~~^~~
>>
>> The offending code is:
>>
>>   memset((char *)S390EP, 0, 6);
>>
>> where S390EP is a const address:
>>
>>   #define S390EP 0x10008
>>
>> The compiler doesn't now how big that pointed area is, so assume its
> 
> s/now/know/
> s/assume/it assumes that/

Oops, thanks. Thomas, do you want me to repost this patch fixed?

>> length is zero. This has been reported as BZ#99578 to GCC:
>> "gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
>> pointer from integer literal"
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
>>
>> As this warning does us more harm than good in the BIOS code (where
>> lot of direct accesses to low memory are done), silence this warning
>> for all BIOS objects.
>>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Message-Id: <20210422145911.2513980-1-philmd@redhat.com>
>> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> [thuth: Use the pre-existing cc-option macro instead of adding a new one]
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  pc-bios/s390-ccw/Makefile | 1 +
>>  1 file changed, 1 insertion(+)


