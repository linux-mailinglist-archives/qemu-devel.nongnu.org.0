Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EAC380C0B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 16:42:04 +0200 (CEST)
Received: from localhost ([::1]:51034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZ0t-00052s-3o
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 10:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhYzW-0003cd-Fk
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:40:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhYzQ-0003CK-8r
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621003231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+lLI8o9FaBlehbWbGic7zHNJlgdOK3cN2rXt7rXEMc=;
 b=WX94/GRvsgR81/bPyYJOZ9gVEyG9svYrR8SCTxCdPlaNe/rlhbwvOS1DEAA9AoB8pge8j9
 e3We63eE9bgiCFnf8BYPizgRXDVU1FrZoiz4jlOPInFoxTMrstttlIB6VtvhWE9i/A4qmz
 5cgR2nzr2ovidtzH8vygf6vjCrZ6Wew=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-NeO_IWRjOP6LL0RnDmgLUA-1; Fri, 14 May 2021 10:40:28 -0400
X-MC-Unique: NeO_IWRjOP6LL0RnDmgLUA-1
Received: by mail-ej1-f72.google.com with SMTP id
 j14-20020a17090686ceb02903d381073418so1124236ejy.12
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 07:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A+lLI8o9FaBlehbWbGic7zHNJlgdOK3cN2rXt7rXEMc=;
 b=PuswfKBAzioTPP9oIUFCATrOJp2xXuFnl6OnRanSnZUiOd8ygLACHE43xC9Ph+BWVu
 Zd61GMF0xlfSEizVb0KcEIF14fvzKUXwFv2Pbu6fGGPCa6JB2RQcpXe8tMHaw6TEYqXp
 c6NSTeMbJV9GoP0a0eifV0xFBeNGYwmvRfAX/f2XuphfzJbwjjLKxUJtqslr7abSMOIG
 ebsdafrMVkZor3hPmiogh7N0DUUHoVDHTGgoi0kdGgaAmNa9g9C8a/yjkaSHhknp0qt+
 8bmgvg4miBnqPCQxpEebtuIBKkh72/MCF4sEiXpeV1Qboyr5ttF+jY+OLgBeer8F5oW9
 uVGQ==
X-Gm-Message-State: AOAM533VC29d/H2quLiR1wn1WesUvVzunbaYT7dWh5PrziF4FTVnvKBr
 3iBvOMv5gnDAgbCu/HtB8bq5DHASMTM6p3PVXKI0T8KntTzjj7bDBQptalArgyk5Fqxv9MouUuq
 G4Tv88Egtk9hNXIbi48+NO+eyzNjEFIg+5AeJ7wCN9IwTUn8qB7ZWrm112CHb7y91UhU=
X-Received: by 2002:a17:907:75e9:: with SMTP id
 jz9mr16560980ejc.314.1621003226799; 
 Fri, 14 May 2021 07:40:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAiGGshdkb6a62pOmsp52W5bGyAF+ZzgTqoOiRuLoeRSGwAYF4YMIpwTsm+OY2pbpAiv/c8w==
X-Received: by 2002:a17:907:75e9:: with SMTP id
 jz9mr16560954ejc.314.1621003226472; 
 Fri, 14 May 2021 07:40:26 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 w21sm4498931edq.82.2021.05.14.07.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:40:24 -0700 (PDT)
Subject: Re: [PATCH v2] qemu-iotests: fix pylint 2.8 consider-using-with error
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210510190449.65948-1-eesposit@redhat.com>
 <d2253d8d-89dd-1acf-e005-0fb3aee6610d@redhat.com>
 <6fe978ce-be8c-db43-120d-95cb66769bfe@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <49a20315-b77a-a454-68bb-b0a385515f83@redhat.com>
Date: Fri, 14 May 2021 16:40:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6fe978ce-be8c-db43-120d-95cb66769bfe@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 14/05/2021 16:09, Max Reitz wrote:
> On 12.05.21 19:04, Max Reitz wrote:
>> On 10.05.21 21:04, Emanuele Giuseppe Esposito wrote:
>>> pylint 2.8 introduces consider-using-with error, suggesting
>>> to use the 'with' block statement when possible.
>>>
>>> Modify all subprocess.Popen call to use the 'with' statement,
>>> except the one in __init__ of QemuIoInteractive class, since
>>> it is assigned to a class field and used in other methods.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>> v1 -> v2:
>>> * fix indentation [Max]
>>> * explain why we disabled the check in QemuIoInteractive's __init__ 
>>> [Max]
>>
>> Thanks!
>>
>> Applied to my block branch:
>>
>> https://github.com/XanClic/qemu/commits/block
> 
> I’ve just seen that the “# pylint: disable=consider-using-with” line 
> causes a warning in pylint versions that don’t know that warning…
> 
> I’d like to squash this in:
> 
>> diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
>> index 7a6c0a9474..f2c0b522ac 100644
>> --- a/tests/qemu-iotests/pylintrc
>> +++ b/tests/qemu-iotests/pylintrc
>> @@ -19,6 +19,9 @@ disable=invalid-name,
>>          too-many-public-methods,
>>          # pylint warns about Optional[] etc. as unsubscriptable in 3.9
>>          unsubscriptable-object,
>> +        # Sometimes we need to disable a newly introduced pylint 
>> warning.
>> +        # Doing so should not produce a warning in older versions of 
>> pylint.
>> +        bad-option-value,
>>          # These are temporary, and should be removed:
>>          missing-docstring,
>>          too-many-return-statements,
> 
> Would that be OK for you?

I see... Looks good to me, this also prevents the same problem with 
other pylint options that can be introduced in the future.

Thank you,
Emanuele


