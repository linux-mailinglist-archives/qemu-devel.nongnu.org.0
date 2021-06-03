Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAAF399BA1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 09:34:12 +0200 (CEST)
Received: from localhost ([::1]:44712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lohrn-0003St-9c
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 03:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohpX-0001s2-9n
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohpV-0008IY-Na
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622705509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCTDmi48zjVIWQyiqWra6J10ZTXn/GPlHRkqMqEgK5w=;
 b=X/BMoHw9GxCHaGznNflHat++N24Ygzwq1ynR7QqliN+56cyck/nFalcfrod4A55tPk938z
 FvOB8CFbO88jk+QiyYtVpjGa1w9Hx3kjWvr9w3dQ0/TM3vwZ4zM0yrrpIOzVJAY4A3Vy+R
 mm4nBYpwi/63BUxw2BLAlORt1/qusaE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-3OmkABKqNT2qn-sCdzFBwQ-1; Thu, 03 Jun 2021 03:31:47 -0400
X-MC-Unique: 3OmkABKqNT2qn-sCdzFBwQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 j26-20020aa7ca5a0000b029038ffacf1cafso2822456edt.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 00:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pCTDmi48zjVIWQyiqWra6J10ZTXn/GPlHRkqMqEgK5w=;
 b=EtLCf4s4LwotwPARhWS2vOUCRNP8VixGnn82RbUN7v9bhlw7rcOyoomFy2ZzgM3i/n
 5ObaqKP2bTfFHWzWQbhipZD3fTnYA5g4En7oF8xU1j84ko/WhCtQtUiEACsOZd+FRNRz
 eYyf1zRzMJyXzwau9kSSej7aNkdv/CAFW/eAmMkwFl6/9HQ8ZR3gEfRhDQS67D1jY8C2
 SN8soBZ3Ft1VlJ899itxQEpMzCf6CuAjH9iQpo9tD5//Fz2LvhPhJcNvhjJoB2K4FD2t
 ugcgW96hZLEHNN4xehVTA+IX3dlgpzLnVIgYCthnLuDkKYNpqyLVytb0OPt3ROOZ2Tko
 mKsA==
X-Gm-Message-State: AOAM531DSzI36/Yen7diZbnL2co09JN8EgtFbwu+e0Cn3sfmnaxu4ZnF
 D7eve/jZezVOYI+O6mHEwMJ0aerBHACxjchz5NMBcEKFkm79EHrzIRofOx6bCE+jvXLPH7xkUmX
 TrWr+Cop5q07x/io=
X-Received: by 2002:a17:906:13db:: with SMTP id
 g27mr37921926ejc.88.1622705506664; 
 Thu, 03 Jun 2021 00:31:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFUTs6i+YGxYD5bdqaQEf/G8peuPlZdxpoTdGgodM3+QOM5doUyo/+xGriDbccPAAKWWZJvw==
X-Received: by 2002:a17:906:13db:: with SMTP id
 g27mr37921918ejc.88.1622705506525; 
 Thu, 03 Jun 2021 00:31:46 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id h2sm800210edr.50.2021.06.03.00.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 00:31:46 -0700 (PDT)
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com>
 <e42a93e4-dfee-2446-f82c-8fec074d4c59@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2ae093f8-a825-275f-a73c-81d7af0d58f2@redhat.com>
Date: Thu, 3 Jun 2021 09:31:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e42a93e4-dfee-2446-f82c-8fec074d4c59@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 1:26 AM, John Snow wrote:
> On 5/26/21 1:04 PM, Philippe Mathieu-Daudé wrote:
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>  > - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>    specific information. Currently the common structure base
>>    provides the name of the accelerator, while the specific
>>    part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>      { "execute": "query-accels" }
>>      {
>>          "return": [
>>              {
>>                  "name": "qtest"
>>              },
>>              {
>>                  "name": "kvm"
>>              }
>>          ]
>>      }
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v8:
>> - Include code snippet from Markus adding to machine-target.json
>>    to be able to use enum values or union branches conditional.
>> - Use accel_find() on enum to be sure the accelerator is enabled
>>    at runtime (chat with jsnow / eblake).
>>
> 
> Hi Phil -- Unfortunately I think I am going to defer on this one until
> Markus is back. I need to chat with him about the right way to design
> this, since I'm also not entirely clear on it myself.

OK, thanks for the update :)


