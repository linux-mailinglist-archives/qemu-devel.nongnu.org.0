Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489253E2339
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:26:37 +0200 (CEST)
Received: from localhost ([::1]:52200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtJU-00020Y-C3
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBtIT-0000Wh-N7
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBtIS-0008WU-3R
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628231131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4DifUKbjttTtYfjk9v4alOVyN+FdZNPfEEzbpnk+yLs=;
 b=jJc+hMXkjZvhCdI8LPifkM7PzJeUFHNW4IFeSla929ZSUsaqkSFm5auOOjbiJ8z6awUCcH
 SuP4VfzANGG0rsgf46YuZf/RmLiIdpQWcYYKR0y0WzxRUfAk49/udOCb88VBKS07+msh4n
 Fda6WdH/k3pQ8XbPhRAOEcq3j/R65+g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-AeENBxfiOjybOWRi7_cY1Q-1; Fri, 06 Aug 2021 02:25:28 -0400
X-MC-Unique: AeENBxfiOjybOWRi7_cY1Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 a197-20020a1c98ce0000b029025831695a2eso1669017wme.4
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 23:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4DifUKbjttTtYfjk9v4alOVyN+FdZNPfEEzbpnk+yLs=;
 b=kAtnPg6GJgs/5xVoZ2n8tcXL64cYAonfiHYRTwMLAniDBnsdXAae0h5TSQ4SH4Umvg
 IJQ5v8pGe3kW09eu6jys/mnrVeA+Jq8Cw4oKWl0L6kPstxOykLwrrumFpWLuGXYkXgz3
 UBLbjgYp8e12o24H/GAYpqA0Kw8KuuYK9kc9B69VQdjko7cEY57qS3e6BVKb9TJmlGHQ
 vmLnFMLeDOtNKpn+PRAybNBgB/6XOTDeOz/7jzVFEy7T9ktrLl8Qlu8ZmvWKF8OoDH4J
 c+4E+/lz3g1R7Kn1/SnAUFbTBjMDKT+IQHw1oY3PYqNQ9e8pxUZDMMYzmCzsSgLicdSX
 3EsA==
X-Gm-Message-State: AOAM530qUzmXZ8OXViLDGNJKZGRzw5MQsVjaX5OViB/X29+tErH9Co7b
 KQHoZistZEijLv/xo2/vI/LeovlkruEmHi7pEznCBml1EZL8O9STkpxRdbqCO8Bj8OnXPlh3VXr
 L/F0XhlBK4uVxLXg=
X-Received: by 2002:a05:600c:21d8:: with SMTP id
 x24mr1528542wmj.59.1628231127211; 
 Thu, 05 Aug 2021 23:25:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz18QsjNyw0FCBSXXAHevenbP79IL/JknZVeGNVADlO5VKI2YTk1a2kzUQ5XyvWxrCxaVt6sw==
X-Received: by 2002:a05:600c:21d8:: with SMTP id
 x24mr1528518wmj.59.1628231126978; 
 Thu, 05 Aug 2021 23:25:26 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id t1sm7572131wma.28.2021.08.05.23.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 23:25:26 -0700 (PDT)
Subject: Re: [PATCH v1 02/12] s390x/tcg: fix ignoring bit 63 when setting the
 storage key in SSKE
From: Thomas Huth <thuth@redhat.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-3-david@redhat.com>
 <1aa00053-4923-423e-5a7d-d81b203d3eb2@redhat.com>
Message-ID: <c9cf9879-8a09-5d23-a3b2-50a534acafbf@redhat.com>
Date: Fri, 6 Aug 2021 08:25:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1aa00053-4923-423e-5a7d-d81b203d3eb2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/08/2021 08.19, Thomas Huth wrote:
> On 05/08/2021 17.27, David Hildenbrand wrote:
>> The last bit has to be ignored.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   target/s390x/tcg/mem_helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
>> index e0befd0f03..3c0820dd74 100644
>> --- a/target/s390x/tcg/mem_helper.c
>> +++ b/target/s390x/tcg/mem_helper.c
>> @@ -2210,7 +2210,7 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, 
>> uint64_t r2)
>>           skeyclass = S390_SKEYS_GET_CLASS(ss);
>>       }
>> -    key = (uint8_t) r1;
>> +    key = r1 & 0xfe;
> 
> I'm not sure about this one ... could you cite a sentence in the PoP where 
> this is declared? For me it rather sounds like SSKE always sets the whole 
> storage key...

Ah, never mind, I missed that the rightmost bit is undefined and thus this 
is likely ok. Did you check this on a real CPU, though?

  Thomas



