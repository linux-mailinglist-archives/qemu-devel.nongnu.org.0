Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27B69B433
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 21:49:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT7fF-0004Qx-6O; Fri, 17 Feb 2023 15:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT7fB-0004QG-6I
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 15:49:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT7f8-0004MU-3T
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 15:48:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id u16so1804454wml.5
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 12:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R/seUeA0dC31v1aAbgYurYzTzGK4jHJvZ1cmxlPwxwU=;
 b=HO6N8jbJG4s2X9PZ7oh5cSaEQnx2MIybfM8C/w3h5onNkogKPkzDfGSeliyxcdgyzh
 bdxDEZWmas5ulI3Uds4t/vBYAq7YdSgfewRIWPbcBKHRoWxv5tlvtyLFdpEebSStNSEP
 Op1b8RMDJ8pXG2NvAyKToRixaG6ieLKB1QBQsMOqyXzHi9xeCn+vi5JZdPDRiReY4dYl
 K8LkOJmaUdRrO6rs0l4XJiYTgKxd1FC6FecjoiH8qtr3plJ6+6H4WzPZR9if5gJpCqsq
 rpBGiWTTVPUahW+ozn9jx/zwLzw1rjgQJcdYjfaCu50ipGo2CHDWuzkCzs0ddun0+qwS
 7EOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R/seUeA0dC31v1aAbgYurYzTzGK4jHJvZ1cmxlPwxwU=;
 b=yb3s3orYxjyjBNESM/mgr117co2wg0LBsAEQn2nKrJcBSrdOhqLuKO4fDsp6lu/waK
 BEMlBmsnsXu8a2q7vlK5kB4qNIno6gfgPk4wZXy/Nm+HNfpsyrhRS53wC033/I85ST5+
 TwP+b0JgVt2gvCQO8u90geLTUYlIc4wG817Eroc0OICUGGVaBXEXReN+tLJ/4REPZeXw
 rVLwihnqfWvxpLECZKRJovNEb+3Q2dB/2JlidvXVZDBTYRzDlMf1mr/0UXEV40YQlVUR
 JSEVJBRz29d0SDZjy9AaWdmvrpJ1MRHL3/9pm0YlMAyXBg9NCMO+DB+gROOup6JpAQ4D
 eoXw==
X-Gm-Message-State: AO0yUKWMn/fWqt7UVaP/PLibG5vp4qAPnsbu58PEcVyaNvoEJeXWeddl
 Q8V/Xyi84Pr7fk+Y6BmSpRhbsg==
X-Google-Smtp-Source: AK7set8RcXXqv9i//eP8WYpdhQKCAiO/gImMonPjxauSoJ5+0M6oGrPV3k+mk7zUYJwQ9++f4Nr/cA==
X-Received: by 2002:a05:600c:2ad6:b0:3dd:dd46:1274 with SMTP id
 t22-20020a05600c2ad600b003dddd461274mr1433340wme.4.1676666936089; 
 Fri, 17 Feb 2023 12:48:56 -0800 (PST)
Received: from [192.168.72.175] (2.red-88-29-172.dynamicip.rima-tde.net.
 [88.29.172.2]) by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003e01493b136sm929390wml.43.2023.02.17.12.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 12:48:55 -0800 (PST)
Message-ID: <a3206e43-5c72-2af6-f14d-1c43752d528a@linaro.org>
Date: Fri, 17 Feb 2023 21:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] hw/timer: Reduce 'hw/ptimer.h' inclusion
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Vikram Garhwal <vikram.garhwal@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antony Pavlov <antonynpavlov@gmail.com>
References: <20230217141832.24777-1-philmd@linaro.org>
 <20230217141832.24777-3-philmd@linaro.org>
 <8daaae78-c773-af8c-de6d-c3b0a45d4253@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8daaae78-c773-af8c-de6d-c3b0a45d4253@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 17/2/23 19:52, Thomas Huth wrote:
> On 17/02/2023 15.18, Philippe Mathieu-Daudé wrote:
>> "hw/ptimer.h" API is mostly used by timer / watchdog device
>> models. Since the SoC / machines only access the ptimer via
>> reference, they don't need its definition: the declartion is
>> enough.
>>
>> On order to reduce the inclusion on the source files,
>> forward-declare 'ptimer_state' in "qemu/typedefs.h".
>> Use the typedef in few place instead of the structure.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> "30 files changed"... but since this is trivial, there is
>> no point in splitting per subsystem IMO.
>> ---
> ...
>> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
>> index df4b55ac65..effcba4bca 100644
>> --- a/include/qemu/typedefs.h
>> +++ b/include/qemu/typedefs.h
>> @@ -104,6 +104,7 @@ typedef struct PICCommonState PICCommonState;
>>   typedef struct PostcopyDiscardState PostcopyDiscardState;
>>   typedef struct Property Property;
>>   typedef struct PropertyInfo PropertyInfo;
>> +typedef struct ptimer_state ptimer_state;
> 
> Would it make sense to properly CamelCase the type while you're at it 
> anyway?

PeriodicTimer, PTimerState, PTimer?

This API is documented as 'ptimer API' although, and renaming all the
API methods doesn't seem to bring much, so maybe stick to PTimer.

More generically for QOM objects, we can agree for no 'State' trailing
for instance state, and 'Class' trailing for class one, similar to
Object / ObjectClass. I.e:

   PeriodicTimer // instance
   PeriodicTimerClass // class

Maybe 'Device' is too generic? Here the API uses 'qdev_' prefix, so
QDev / QDevClass could work...

