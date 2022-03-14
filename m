Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB54D876E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:53:02 +0100 (CET)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTm4D-0005kx-4m
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:53:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTlEw-0000tA-Tw
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:00:02 -0400
Received: from [2607:f8b0:4864:20::1034] (port=36491
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTlEv-0005eN-57
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:00:02 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 kx6-20020a17090b228600b001bf859159bfso17559856pjb.1
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=THQBNdkOGSwvixpJpgQp3dhhi/BVzHqcrgjeexYw3lY=;
 b=DQYAB5AQ0VMJA/uRskF6z8k2hoMefnti2i1aCQ6xjHQbP7nokrUPHV9hTcMT1VxgIo
 bxyPFFida2ao9qWBS9cGaaXhjepxdRpUkYDE2aloeyTXYiRSGDiu+eIhsb8/5sfYIviE
 rkmp9o2u3pGDymQh2tASs8e7rbImimrIZ/LxwZkUhFBphkQtpfiYLj0lQugFbG/3w8T/
 Q0nXeHepfvd7Fw9bZ3r0N70OMehsnVUOFWNEVMnZyvi/uo04UzGN6veKgMJeZ5VsRqte
 C4LxOnrNbuxxGyF/7ilxToeM1dFf8x4WIXS8MPn/g3NIuOYUuJhAu42Inpl5FPk4PaoJ
 +xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=THQBNdkOGSwvixpJpgQp3dhhi/BVzHqcrgjeexYw3lY=;
 b=NzNR8e+QoS7Kr+ZwxSsqvjdEpOwEgjOnaU4+Z+Wi/nm+UpndntEEO7jmXfAwx6HNa/
 B/Oel0uBDhQ0Ml2ZoHkEF5KjLa0vj/IS18dNJLeeDU5Vc2qHgXSean6LznKTRMLz7Fbe
 7BJeEWFlLYhK2xR7dfuOYikJbzXGw5O6OXlDTGmHs4YjBFiFWJiUXdXJqT0iiCBdNgIQ
 7R/RGZFIDb2oha+BFSm7oBwF1ri3mUIyfeObiHRaJ2qCSZtfmf9NNckVr0RppFZX413O
 Hzap8+qHhMqpM6CRhcm4UUGsAZIc+8Goa1+QosVwNPKrZAaWlB+LOjfDdZk7W+0fNVjA
 AtcQ==
X-Gm-Message-State: AOAM530I9A0Y2jAbxa7KrvQ9vaS6xcR8ix60DykB9VbAMmgVPmv1vUjo
 /zOyOEBGiYVLI1hejHqE5aU=
X-Google-Smtp-Source: ABdhPJxSQW7kbcM1mJiizpLTeWRhwqQNTyoZCRPkI/XA/MZm9ThcRQtEAVNxkDPmBFT54+gn/VKSqQ==
X-Received: by 2002:a17:90a:9106:b0:1b9:115a:a2c1 with SMTP id
 k6-20020a17090a910600b001b9115aa2c1mr36393982pjo.80.1647266397337; 
 Mon, 14 Mar 2022 06:59:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cv15-20020a17090afd0f00b001bedcbca1a9sm21877367pjb.57.2022.03.14.06.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:59:56 -0700 (PDT)
Message-ID: <66621e30-4304-7d27-cc14-829eccbb6290@gmail.com>
Date: Mon, 14 Mar 2022 14:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH-for-7.0 v2] softmmu: List CPU types again
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220310140728.6506-1-philippe.mathieu.daude@gmail.com>
 <4df842b7-5fee-e38a-82e4-638b4f95920f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <4df842b7-5fee-e38a-82e4-638b4f95920f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/22 16:16, Thomas Huth wrote:
> On 10/03/2022 15.07, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Commit e0220bb5b2 made cpus.c target-agnostic but didn't notice
>> the cpu_list() function is only defined in target-specific code
>> in "cpu.h". Move list_cpus() declaration to "exec/cpu-common.h"
>> because this function is not softmmu-specific and can also be
>> used by user-mode, along with moving its implementation to cpu.c,
>> which is compiled per target.
>>
>> Fixes: e0220bb5b2 ("softmmu: Build target-agnostic objects once")
>> Reported-by: Max Filippov <jcmvbkbc@gmail.com>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   cpu.c                     | 9 +++++++++
>>   include/exec/cpu-common.h | 2 ++
>>   include/sysemu/cpus.h     | 2 --
>>   softmmu/cpus.c            | 8 --------
>>   4 files changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/cpu.c b/cpu.c
>> index d564886149..d50845f713 100644
>> --- a/cpu.c
>> +++ b/cpu.c
>> @@ -35,6 +35,7 @@
>>   #include "sysemu/tcg.h"
>>   #include "sysemu/kvm.h"
>>   #include "sysemu/replay.h"
>> +#include "exec/cpu-all.h"
> 
> Why not cpu-common.h?

Copy/paste mistake I presume.

> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks!


