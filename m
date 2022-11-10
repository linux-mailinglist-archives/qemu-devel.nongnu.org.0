Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0836B623F2E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 10:58:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Ja-0005nJ-Tu; Thu, 10 Nov 2022 04:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot4JZ-0005mo-4E
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:57:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot4JX-0006w5-DX
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668074258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Scbl1bp5XfiaDnXgT0IsOTs8ETs2VVaAkn8rAxavUlo=;
 b=W/aSlcTWOXrkyhXl41BK22zz1aqL+XB6Eq+BBgwPvoq9yO21gRt0ffQeCzpVvWYeuZTFGq
 szE3fzZeJkldDShupMGEEGou/JUpQoNUxPWFzvJ9wc4imR8bMDMLOjNVJZaRi6RRFrMOBn
 a22KInE2E1oJQk7nwh2SUaaXnrB32rU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-IRSTllnHO12PgMLSF9mxJg-1; Thu, 10 Nov 2022 04:57:36 -0500
X-MC-Unique: IRSTllnHO12PgMLSF9mxJg-1
Received: by mail-pj1-f71.google.com with SMTP id
 v10-20020a17090a7c0a00b00215deac75b4so873891pjf.3
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 01:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Scbl1bp5XfiaDnXgT0IsOTs8ETs2VVaAkn8rAxavUlo=;
 b=ieVat7Vp9uIt7BBSSEbMjm3GSSt+lZ1vEsDV6nV/bCeNI8uXNjnRMPx96wY31T6hOw
 7GDQAn93NRwl4D3PhnUNjFxJV/jfJV8IyVZ6NMlFrzQQZkeE4oNIofVCfR8WhT9kEbAm
 ziPnQQILd5ldNviL/0Q0ZnbFv/ryvLv09cfE6/KW5bxun3E8CqYoW/sDkvThRwSvNe8Y
 m/901Yq+AScJlWfF+C1iHoZAXSSxebyzitFt2IZvZkJ8zGLcEjLMOWHQSLy2MKW8Gswq
 wCzvxMVZvYEbML27yR86a340t1DBXF0WJO/tlx/Jt4efZaaK8gEJoA1+cKq5mSI3Q9lR
 B5UA==
X-Gm-Message-State: ACrzQf2jT3hTF4WFKKXP5pNadNWt4D6ijoNLcDgEHnZA0SLRzUK/2bCL
 8/JrIcRCJWKOwSXwF9iWaQQ0cfw7CpVOVrXg3xLql4vpKosIpPZ14/bFtqGCIGvSeaUFlUAxLZ8
 4w2tH0OyeKL5FJ4Q=
X-Received: by 2002:aa7:81d3:0:b0:563:5c10:6cd6 with SMTP id
 c19-20020aa781d3000000b005635c106cd6mr2279317pfn.53.1668074255722; 
 Thu, 10 Nov 2022 01:57:35 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4i2qdWL9Ba13EU0jSFkIdCBzfkMVSE9vohVlNqflq7FsQFjPdGv2lwUjB6ecDk0kKoJIYkrQ==
X-Received: by 2002:aa7:81d3:0:b0:563:5c10:6cd6 with SMTP id
 c19-20020aa781d3000000b005635c106cd6mr2279303pfn.53.1668074255447; 
 Thu, 10 Nov 2022 01:57:35 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a1709026f0f00b00181f8523f60sm10733324plk.225.2022.11.10.01.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 01:57:34 -0800 (PST)
Message-ID: <0b29d9e3-9ce2-633c-1d73-cb5b0b9105ee@redhat.com>
Date: Thu, 10 Nov 2022 10:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] qga: Allow building of the guest agent without system
 emulators or tools
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 qemu-trivial@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221109173750.201615-1-thuth@redhat.com>
 <b81930e5-9df7-a80a-5db4-09290a3b71f3@linaro.org>
 <87wn83jr54.fsf@pond.sub.org>
 <cee224a9-b107-9bf1-66d5-b631d5a88345@redhat.com>
 <208d1191-6852-c74c-2a06-d65a6a657f4d@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <208d1191-6852-c74c-2a06-d65a6a657f4d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/11/2022 10.49, Philippe Mathieu-Daudé wrote:
> On 10/11/22 09:35, Thomas Huth wrote:
>> On 10/11/2022 06.49, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> On 9/11/22 18:37, Thomas Huth wrote:
>>>>> If configuring with "--disable-system --disable-user --enable-guest-agent"
>>>>> the linking currently fails with:
>>>>>
>>>>> qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
>>>>> build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined 
>>>>> reference to `qmp_command_name'
> 
>>>>> Let's make sure that we also compile and link the required files if
>>>>> the system emulators have not been enabled.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>
>>> I wonder for how long this has been broken.
>>>
>>> Should we add such a configuration to CI?
>>
>> Some month ago, I'd say: Sure! ... but considering that gitlab now limits 
>> the available CI minutes and that apparently nobody really cares about 
>> this configuration (otherwise someone would have complained about this 
>> earlier), I think it's not that important to have a separate CI test for 
>> this configuration.
> 
> We could eventually add a job restricted to qemu-project CI (not in
> forks).

The problem is: Who's going to create such jobs? Someone needs to write the 
yaml stuff and test it first. And at least I pretty much lost motivation to 
work on new yaml stuff, since this burns my private CI minutes (which I 
rather need for my maintainer duties instead).

  Thomas


