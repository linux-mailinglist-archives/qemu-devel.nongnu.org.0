Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053442FD63B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:58:32 +0100 (CET)
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GoQ-0003ba-Gv
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2GmZ-0002YG-2H
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:56:35 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2GmX-0000Wv-DG
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:56:34 -0500
Received: by mail-ej1-x635.google.com with SMTP id w1so34449862ejf.11
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 08:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lQX50w3torONeDPk4BpsOwzp11UDa4gitrx4f6+XnfE=;
 b=CIq6eLXj4tw9JrErvYOZHf8tciPO/KwiRGLsaFtvyxC7xXtTP5fyclmUVtNU8WeSiT
 W5sqKjtQO57TN8KgA3LGRMteKc4VAg9B79sYmerX462FOIqu5XmHqmL2TsLEWfvTrj6k
 aFQGfO5LrF6FYVKfjEV+giMZFOmYuBbmdY10gj72lev7Ouk91iHLjvXP5leteWy7xAwb
 H2MyDPIlFrKnc92RXUwDLysxvW6BSlj8vGcjdxDyXGizSrzPYURjaRWWkVO09hR33Q38
 JSNqb1yK+NGDonho6ACSWro7o2+EKl/9/CHuFCGUfQ+tXQCiq1HabiJwnjjIMmOoIvV9
 TSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lQX50w3torONeDPk4BpsOwzp11UDa4gitrx4f6+XnfE=;
 b=QSJWktN9ozpdpDg4NduGvMM+Mvm2vFX//tqhUsKlCCH+UnexiZdZHLjuURNttk1/ej
 imXYzWFtUnNC/M8RRLHN1ZzngkWf6XJtodsc4cU766vFzol2XyniysBvo1g5Yw3d0wEs
 ojQhciDKqxlFuicbbCwZEVGoAJl2Jed1EHL+haKZdaHZdV8rJQe4rLRD3ZeBHz6+uy+k
 ImrMk06Is8dildUAncE1copUlxVHHcqLxPvrWvfoLCi/Lk0QsMKycKB8D4VbW5SdDcc5
 hUyX9kMmiO+nsa0kJ2Z9Bkfj0BuS+urFV8wInpmtfYON97HD5fdCqNL5Vpy7B/0/KK00
 90HQ==
X-Gm-Message-State: AOAM530QpbCLCa1hXUWy18x33AVrCR5gjKnGvK84n5/4AU4s3wcfQjfL
 oqTgg3XZhmGqOalwAIrzMdU=
X-Google-Smtp-Source: ABdhPJyQ2aFx1vrU0VZvr7CZAoX3Qm5JQQ0pWBeyG0GD136VRX1Edm4A/ZcNLLZncjPqIzEUGattxg==
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr6950041ejd.250.1611161791864; 
 Wed, 20 Jan 2021 08:56:31 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c24sm1394368edt.74.2021.01.20.08.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 08:56:31 -0800 (PST)
Subject: Re: [PULL 3/5] linux-user: add missing IPv6 get/setsockopt option
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210119175427.2050737-1-laurent@vivier.eu>
 <20210119175427.2050737-4-laurent@vivier.eu>
 <58abf222-2bcb-4433-7608-ebcc999a2241@amsat.org>
 <c2a2537c-b042-9065-dac6-749815f66ba4@vivier.eu>
 <02481ce6-7fc0-c40d-1b31-0260ee3a323e@amsat.org>
 <96635a5c-6442-52e6-1fc5-ad241a130c8b@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b8bdf47d-489f-e2dd-1044-930256ee364c@amsat.org>
Date: Wed, 20 Jan 2021 17:56:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <96635a5c-6442-52e6-1fc5-ad241a130c8b@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 5:22 PM, Laurent Vivier wrote:
> Le 20/01/2021 à 17:12, Philippe Mathieu-Daudé a écrit :
>> On 1/20/21 5:00 PM, Laurent Vivier wrote:
>>> Le 20/01/2021 à 13:16, Philippe Mathieu-Daudé a écrit :
>>>> On 1/19/21 6:54 PM, Laurent Vivier wrote:
>>>>> From: Shu-Chun Weng <scw@google.com>
>>>>>
>>>>> IPV6_ADDR_PREFERENCES (RFC5014: Source address selection) was not supported.
>>>>>
>>>>> Signed-off-by: Shu-Chun Weng <scw@google.com>
>>>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>>>> Message-Id: <20201218193213.3566856-4-scw@google.com>
>>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>>> ---
>>>>>  linux-user/syscall.c | 3 +++
>>>>>  1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>>>> index 969db2008104..70c61d15ebf8 100644
>>>>> --- a/linux-user/syscall.c
>>>>> +++ b/linux-user/syscall.c
>>>>> @@ -51,6 +51,7 @@
>>>>>  #include <sys/sysinfo.h>
>>>>>  #include <sys/signalfd.h>
>>>>>  //#include <sys/user.h>
>>>>> +#include <netinet/in.h>
>>>>>  #include <netinet/ip.h>
>>>>>  #include <netinet/tcp.h>
>>>>>  #include <netinet/udp.h>
>>>>> @@ -2272,6 +2273,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
>>>>>          case IPV6_RECVDSTOPTS:
>>>>>          case IPV6_2292DSTOPTS:
>>>>>          case IPV6_TCLASS:
>>>>> +        case IPV6_ADDR_PREFERENCES:
>>>>>  #ifdef IPV6_RECVPATHMTU
>>>>>          case IPV6_RECVPATHMTU:
>>>>>  #endif
>>>>> @@ -2926,6 +2928,7 @@ get_timeout:
>>>>>          case IPV6_RECVDSTOPTS:
>>>>>          case IPV6_2292DSTOPTS:
>>>>>          case IPV6_TCLASS:
>>>>> +        case IPV6_ADDR_PREFERENCES:
>>>>>  #ifdef IPV6_RECVPATHMTU
>>>>>          case IPV6_RECVPATHMTU:
>>>>>  #endif
>>>>>
>>>>
>>>> Building on Centos7:
>>>>
>>>> ../linux-user/syscall.c: In function 'do_setsockopt':
>>>> ../linux-user/syscall.c:2276:14: error: 'IPV6_ADDR_PREFERENCES'
>>>> undeclared (first use in this function)
>>>>          case IPV6_ADDR_PREFERENCES:
>>>>               ^
>>>> ../linux-user/syscall.c:2276:14: note: each undeclared identifier is
>>>> reported only once for each function it appears in
>>>> ../linux-user/syscall.c: In function 'do_getsockopt':
>>>> ../linux-user/syscall.c:2931:14: error: 'IPV6_ADDR_PREFERENCES'
>>>> undeclared (first use in this function)
>>>>          case IPV6_ADDR_PREFERENCES:
>>>>               ^
>>>>
>>>
>>> Strange... this is defined since kernel v2.6.26 in /usr/include/linux/in6.h
>>>
>>> 7cbca67c0732 [IPV6]: Support Source Address Selection API (RFC5014).
>>>
>>> Could try adding the include?
>>
>> Yes, this fixed it, thanks:
>>
>> -- >8 --
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 1f91aa0ed5e..34760779c8e 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -59,6 +59,7 @@
>>  #include <linux/icmp.h>
>>  #include <linux/icmpv6.h>
>>  #include <linux/if_tun.h>
>> +#include <linux/in6.h>
>>  #include <linux/errqueue.h>
>>  #include <linux/random.h>
>>  #ifdef CONFIG_TIMERFD
>> ---
>>
> 
> Could you send a patch to the ML?

Me? OK...

> 
> Thanks,
> Laurent
> 

