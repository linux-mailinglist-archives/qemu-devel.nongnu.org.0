Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E94C4A95A1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 09:53:35 +0100 (CET)
Received: from localhost ([::1]:41104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFuLV-00013s-Ss
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 03:53:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFtPJ-00048f-53
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:53:25 -0500
Received: from [2607:f8b0:4864:20::533] (port=40617
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFtPH-000857-A8
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:53:24 -0500
Received: by mail-pg1-x533.google.com with SMTP id q132so4399893pgq.7
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 23:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4ukdfzSzESdkwcpPCLMr3wbqz7fessYWqmQ0FWlH+kA=;
 b=K25ncgND67XjImL5NefamhGnOcM982ZHOifHxcNt6m047Jp2kmueA4QjYc/LBLRNo0
 ytaSMteQWZUxojNLUumzFZdYi95QbVV48M651LBhnwX/YNGI3FwBxwZW/D6m6X8qhqWm
 1gj2UQi+5XYuvzCwnpv+IlJYAw4iZpiMLS5HLVF2apoizerjTYZYnJsLczFrWXESeleK
 6PskXLWvqTTuXXsp4Y6sLXgOvNf0rOkYVt8vSkTVSZ3Sm/twTRwe/DyhT0LIGmvUB05V
 djKj79CF1pjwT5WWsRbRvQGj/KYryDFKQ3jWy2lu+P2KEHzPSI0emmk/ptDmSyhJ1IGC
 1OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4ukdfzSzESdkwcpPCLMr3wbqz7fessYWqmQ0FWlH+kA=;
 b=o0AM5XBGDBCvtezjz8xM/CYzzvb1aqWVjH8VjlD2a4LiE7+wyyNmuSIkue/FUSg6AQ
 qXkft4rsEg7VY9JaX8Td1OOdG6YyLqsv43SguUZUD+GtqoQbD3uUZkKZP6kbx58qazkF
 fNDDM/TROebr9Vmj64vcBea5zuJobnPG1moXglomdYDJnyx5kkdbhK6yXy7EDb46DMUj
 hCUDxH7ZP49uQhjFVismuLSvmY9fhN+UD5fnj44GazxsN7gDH8YxmSgfkWyUo3HG6P2X
 E6yfIu07W5HrcPCTUF09wSb2rZU88dixGTR9nx4ZfJkxNpFRDkzA4V5XRyjTKuxNiSzS
 JeoA==
X-Gm-Message-State: AOAM530Nlb3tjYTzwcROW66A/L0tW3893wdCwvUMMxrgv715Y7D/CSog
 viSoTLkJqaetEA3CvMgjdkU=
X-Google-Smtp-Source: ABdhPJxKg3se9QoKF3wSPAIeOyCFK+kbEelHqP/azPOD6AxzUUlPxH7tlZtTPlIS1Wo9APWUhT+RgQ==
X-Received: by 2002:a05:6a00:894:: with SMTP id
 q20mr1793136pfj.79.1643961201843; 
 Thu, 03 Feb 2022 23:53:21 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id a1sm932147pgm.83.2022.02.03.23.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 23:53:21 -0800 (PST)
Message-ID: <b55d483b-5fbe-4eb9-4c8a-660b21f57aae@amsat.org>
Date: Fri, 4 Feb 2022 08:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 03/10] hw/s390x/virtio: Add missing 'cpu.h' include
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-4-f4bug@amsat.org>
 <a08ea7e0-6203-39d9-29b3-3c6684b4ddae@redhat.com>
In-Reply-To: <a08ea7e0-6203-39d9-29b3-3c6684b4ddae@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/2/22 08:50, Thomas Huth wrote:
> On 03/02/2022 20.37, Philippe Mathieu-Daudé wrote:
>> CPUS390XState is declared in "cpu.h".
> 
> And how is this related to your qemu/log.h refactoring / why is this 
> patch needed now?

Hmm I might have been too overzealous when splitting in 3 parts,
this belong to the 3rd part then.

>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/s390x/s390-virtio-hcall.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/s390x/s390-virtio-hcall.h b/hw/s390x/s390-virtio-hcall.h
>> index 9800c4b351..9773ed8a21 100644
>> --- a/hw/s390x/s390-virtio-hcall.h
>> +++ b/hw/s390x/s390-virtio-hcall.h
>> @@ -13,6 +13,7 @@
>>   #define HW_S390_VIRTIO_HCALL_H
>>   #include "standard-headers/asm-s390/virtio-ccw.h"
>> +#include "cpu.h"
>>   /* The only thing that we need from the old kvm_virtio.h file */
>>   #define KVM_S390_VIRTIO_NOTIFY 0
> 
> Anyway:
> Acked-by: Thomas Huth <thuth@redhat.com>
> 


