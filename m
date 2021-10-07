Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9707242520C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 13:32:38 +0200 (CEST)
Received: from localhost ([::1]:44682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYRdd-00072Z-6X
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 07:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYRax-0005jl-LU
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:29:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYRat-0001uW-VU
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633606186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drYJ3joVpGlpbZnnoT10cnxDs5NiORQp9FnHE19ej48=;
 b=H5kXp3MOh2QhWlRPyIGV4tzWYzYAIJkPWPUHioEC6e4SVvG+SHsrRDw80DI/LHCx1S2Bf5
 OKgOq01juNo+j9tMrmIjFXlylYih5iOJldKg9Ya+PiZhnafMTRjTfnC5RDJm2bMLyT5KbA
 xn/7u7g1oLuVz78bfYz/omrg+y4xUQ4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-tdqfmVSGOxuSQhNXGHhA_Q-1; Thu, 07 Oct 2021 07:29:45 -0400
X-MC-Unique: tdqfmVSGOxuSQhNXGHhA_Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so4256538wrb.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 04:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=drYJ3joVpGlpbZnnoT10cnxDs5NiORQp9FnHE19ej48=;
 b=tIP7SdH2o86SbF7Cn+wluVFxdUEiWV86WQPFn0aaugbKqMEuLmMyL7LW8UnjFj51Dm
 MkGqOQaHDjCWvnfnoeDQ7gndlcOn+WEr55yi4mLL7CCbiE9j4fQZChopV74JdG6df/B5
 GlEKyTGTsQdbbN9IIRohZwfeSYCK+/DaCbgWCV+F4s8CwVhQs8ye+/xjeOmW34S1jaTY
 RwpF8O0sCZzo/0ulegEEBozJfBYQMF2VMvseNxSGaWIADaX5NwFnk4FRHXt9Z18i3tYS
 OAiQPZbqn+YC6xb7K0QlpalXy91h+8iZrq0Vweti04BRf1oRugAd0Oi/mCJJ5BVnhaau
 wC2g==
X-Gm-Message-State: AOAM530LnkYUYqWSwnWQZ1RNs9+5OmYnbGnDXvuaNI5JDHYm2cLapdZD
 dzcIc02KVZAUosPD8uurrLLuyTT3KerK1mpCFhRAXuCjDNSqFaivaHZmlJaqw7wJ6vYjy/ZUXIr
 QeRiYChGbFYShYHY=
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr3909736wmh.135.1633606184130; 
 Thu, 07 Oct 2021 04:29:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCGtQPVUTWH8//ChO0azrAsnUoGsBUNkudWwL4mB93Z03icqsjehxKzcd4fqupF2TMlDsgAQ==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr3909724wmh.135.1633606183940; 
 Thu, 07 Oct 2021 04:29:43 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z16sm8450077wmk.6.2021.10.07.04.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 04:29:43 -0700 (PDT)
Message-ID: <8f12bc3e-53aa-c946-bb06-f7d08721b243@redhat.com>
Date: Thu, 7 Oct 2021 13:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 05/22] target/i386/monitor: Return QMP error when SEV
 is disabled in build
To: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-6-philmd@redhat.com>
 <bef20bd5-7760-3fc7-9914-1eddca800825@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <bef20bd5-7760-3fc7-9914-1eddca800825@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 10:11, Paolo Bonzini wrote:
> On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
>> If the management layer tries to inject a secret, it gets an empty
>> response in case the binary built without SEV:
>>
>>    { "execute": "sev-inject-launch-secret",
>>      "arguments": { "packet-header": "mypkt", "secret": "mypass",
>> "gpa": 4294959104 }
>>    }
>>    {
>>        "return": {
>>        }
>>    }
>>
>> Make it clearer by returning an error, mentioning the feature is
>> disabled:
>>
>>    { "execute": "sev-inject-launch-secret",
>>      "arguments": { "packet-header": "mypkt", "secret": "mypass",
>> "gpa": 4294959104 }
>>    }
>>    {
>>        "error": {
>>            "class": "GenericError",
>>            "desc": "this feature or command is not currently supported"
>>        }
>>    }
>>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   target/i386/monitor.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
>> index 196c1c9e77f..a9f85acd473 100644
>> --- a/target/i386/monitor.c
>> +++ b/target/i386/monitor.c
>> @@ -28,6 +28,7 @@
>>   #include "monitor/hmp-target.h"
>>   #include "monitor/hmp.h"
>>   #include "qapi/qmp/qdict.h"
>> +#include "qapi/qmp/qerror.h"
>>   #include "sysemu/kvm.h"
>>   #include "sysemu/sev.h"
>>   #include "qapi/error.h"
>> @@ -743,6 +744,10 @@ void qmp_sev_inject_launch_secret(const char
>> *packet_hdr,
>>                                     bool has_gpa, uint64_t gpa,
>>                                     Error **errp)
>>   {
>> +    if (!sev_enabled()) {
>> +        error_setg(errp, QERR_UNSUPPORTED);
>> +        return;
>> +    }
>>       if (!has_gpa) {
>>           uint8_t *data;
>>           struct sev_secret_area *area;
>>
> 
> This should be done in the sev_inject_launch_secret stub instead, I
> think.  Or if you do it here, you can remove the "if (!sev_guest)"
> conditional in the non-stub version.

This part is not related to SEV builtin; what we want to avoid here
is management layer to try to inject secret while the guest hasn't
been started with SEV (IOW 'no memory encryption requested for KVM).

Maybe this error message is more explicit?

  error_setg(errp, "Guest is not using memory encryption");

Or:

  error_setg(errp, "Guest is not using SEV");


