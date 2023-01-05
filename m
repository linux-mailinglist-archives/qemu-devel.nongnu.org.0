Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA3465E914
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 11:36:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDNaL-0002ra-9o; Thu, 05 Jan 2023 05:34:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDNaJ-0002rA-4g
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 05:34:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDNaH-0004xL-CY
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 05:34:54 -0500
Received: by mail-wr1-x433.google.com with SMTP id z16so19180578wrw.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 02:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hQDDEadPfJcDyXMy869YRDlX0A/0jsWw5kpDKeHnKSc=;
 b=JovFG28yrTUgOcvT4Zdq44/wdWvIUs8Oz75RnSj3vaswZiOzqatjLVbkUvRewH/6zQ
 V6MqxmzIknSaDDGsxyDzudu5CTYpgozTO0zpM2KVg5qUs7g1r1RBxM2GHc7eFr+T4wg1
 YlN6Eflz/kCe49l8fSfXi9PgB1AScM1X1xowK0hIfbk9hexWj35F7Vhnsh+zYDedqe2S
 OSHzwIG/NtwuOFE64iZDBcdEE5hRK+zDPkBM83rURxGb/fttcRLAoxssN7r5VozOXxNS
 ZvfQRGEKgwL0g/J/XttCLc5L2mP145OXdiQgT9wI4UG8LFCW/3W4DjcMv7DUpxW13jgp
 MJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hQDDEadPfJcDyXMy869YRDlX0A/0jsWw5kpDKeHnKSc=;
 b=RPYIXiiN7OzG6GIf+om75pIJnHJ2S18meTk9jQM+S9SrM2BLYjfKWcJ+47anvU4R3I
 BzcOVxKdB6P84FfFpRT6b/1Hz7mPvdGZpnTHLfh9V9gF0Tf5iXAjiX4Qr/fEj0sT458b
 hd76MFmiBTTiRV8AXzqSdULen+raQnnGaYofcfziUF/0BuvrUdYTFo9n3jDvuVwN4kBE
 Moh+rSjPscVzwLndUbUsIyHuPb6WKS9kBd+NAvx8N7gnuE9auW0ubmhBAuDWSscOl2/4
 RavVz9VqeC7xE32Vs4QJ/21VoPVfA0QWNUK0QEV0wY49vj3swlif0N4QrNyUC2NbwAQQ
 MPYw==
X-Gm-Message-State: AFqh2kr8zwzqf305OmBA1RfzxwNe2O2EIRwz1s1emhh5X8aO11q4gtUf
 wFsCqXelIQ3K38PX0cGzkReMFg==
X-Google-Smtp-Source: AMrXdXu69XCfPTgkPyQJyp/BXbi0UOMnmZgdEewXnkGrJuEFRsCOWeuestmeFw9hejbjyAftFJCW8g==
X-Received: by 2002:adf:ed8d:0:b0:242:643e:6954 with SMTP id
 c13-20020adfed8d000000b00242643e6954mr33088715wro.14.1672914891721; 
 Thu, 05 Jan 2023 02:34:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 cc12-20020a5d5c0c000000b002b065272da2sm1622237wrb.13.2023.01.05.02.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 02:34:51 -0800 (PST)
Message-ID: <92fa9023-06ee-0eb2-a212-ffc9adb0f85b@linaro.org>
Date: Thu, 5 Jan 2023 11:34:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] confidential guest support: Introduce a 'check' class
 handler
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-2-clg@kaod.org>
 <fa7b4a10-0fd5-7435-53e0-89779f0f526f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fa7b4a10-0fd5-7435-53e0-89779f0f526f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 5/1/23 09:46, Thomas Huth wrote:
> On 04/01/2023 12.51, Cédric Le Goater wrote:
>> From: Cédric Le Goater <clg@redhat.com>
>>
>> Some machines have specific requirements to activate confidential
>> guest support. Add a class handler to the confidential guest support
>> interface to let the arch implementation perform extra checks.
>>
>> Cc: Eduardo Habkost <eduardo@habkost.net>
>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> Cc: "Philippe Mathieu-Daudé" <philmd@linaro.org>
>> Cc: Yanan Wang <wangyanan55@huawei.com>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   include/exec/confidential-guest-support.h |  4 +++-
>>   hw/core/machine.c                         | 11 ++++++-----
>>   2 files changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/exec/confidential-guest-support.h 
>> b/include/exec/confidential-guest-support.h
>> index ba2dd4b5df..9e6d362b26 100644
>> --- a/include/exec/confidential-guest-support.h
>> +++ b/include/exec/confidential-guest-support.h
>> @@ -23,7 +23,8 @@
>>   #include "qom/object.h"
>>   #define TYPE_CONFIDENTIAL_GUEST_SUPPORT "confidential-guest-support"
>> -OBJECT_DECLARE_SIMPLE_TYPE(ConfidentialGuestSupport, 
>> CONFIDENTIAL_GUEST_SUPPORT)
>> +OBJECT_DECLARE_TYPE(ConfidentialGuestSupport, 
>> ConfidentialGuestSupportClass,
>> +                    CONFIDENTIAL_GUEST_SUPPORT)
>>   struct ConfidentialGuestSupport {
>>       Object parent;
>> @@ -55,6 +56,7 @@ struct ConfidentialGuestSupport {
>>   typedef struct ConfidentialGuestSupportClass {
>>       ObjectClass parent;
>> +    bool (*check)(const Object *obj, Error **errp);
>>   } ConfidentialGuestSupportClass;
>>   #endif /* !CONFIG_USER_ONLY */
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index f589b92909..bab43cd675 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -502,11 +502,12 @@ static void 
>> machine_check_confidential_guest_support(const Object *obj,
>>                                                        Object 
>> *new_target,
>>                                                        Error **errp)
>>   {
>> -    /*
>> -     * So far the only constraint is that the target has the
>> -     * TYPE_CONFIDENTIAL_GUEST_SUPPORT interface, and that's checked
>> -     * by the QOM core
>> -     */
>> +    ConfidentialGuestSupportClass *cgsc =
>> +        CONFIDENTIAL_GUEST_SUPPORT_GET_CLASS(new_target);
>> +
>> +    if (cgsc->check) {
>> +        cgsc->check(obj, errp);
> 
> I assume the caller is checking *errp, so it's ok to ignore the return 
> value of the check function here?

Agreed, can we change by:

   if (cgsc->check && !cgsc->check(obj, errp)) {
       return;
   }

?

Also since the handler name is not very self-descriptive, can we
add a comment in its declaration in ConfidentialGuestSupportClass?

>> +    }
>>   }

