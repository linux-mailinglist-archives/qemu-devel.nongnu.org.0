Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2AD2FD506
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:13:55 +0100 (CET)
Received: from localhost ([::1]:51710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2G7G-0004LU-RA
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2G6G-0003WK-VC
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:12:52 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2G6B-0001Jo-Ln
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:12:52 -0500
Received: by mail-ed1-x530.google.com with SMTP id b21so17579457edy.6
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 08:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UtyMchHTySs4/UkXhi9H3hAk0IV0VAEPFlA2TEEq8vE=;
 b=hsWSEiuwhoTXXVqvq1Kzd5gao1OKNcCSn2VeLQgjyoM1ipKaE2Hc5rq0rqp2zsr3dS
 QYmFWgMi+ARHtH5vfMGW5vM3TdwXnTxhoANmxRHoQDBQ5ekcvrbjvuI5GaH7vmiicDnV
 RO2oklLpocTfnq1SaVAiC8/nFhK/cHbDA0xQG2w9qybszQN6zCuV+OZH1Xiy8fGbvnzq
 yhA1X/+56Qihr9JrLHBdjAKEqp/YXH9TtcR4pBfKfZifY7DTgRHVSMhf8+TpyDqdkiSs
 JGFLtxUgUNGw1C73c/bs7cVPduMKnSFQNoPer4R2Jd8hCaFKelPf4Egt0BloGh1T1mlI
 t/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UtyMchHTySs4/UkXhi9H3hAk0IV0VAEPFlA2TEEq8vE=;
 b=BR+LVCR237/1FYq71zDh6BjTKhq0Op6WWmdNshIyZ56dJU+MMMjx2Taof9QaHnFkxa
 iNbc5q1echRgFBOlrR3z+kcWhEXUDrPN2F6y+tRaLB2H9kM9WxRBkYP+zEHUGW09gJ36
 5f1Bvg6j0/YtagSI9oh0qsNO6fxmsKdGkpgoquZf/Nm+GahZWHBjsnAuio/3PWJoIcT8
 eaZMZhitFpZw9NN3Sgg1mRkvZRul+YnJZTI1oMwwTEvH8Pr34ewMj9Dyzb9r2bVqHLzp
 8u1CJrDQ3obIjoj5dTokEvcY3OWexNe8ZYKD0k984ll7fIsKS+fVSgrSgknEZz3/NnQB
 bjXg==
X-Gm-Message-State: AOAM532EM51bTXSGkC+0U61MUywE7CsqyhKAiy2N0jxytWkNpKVlMgo7
 MA81KBOgwmFZ5ox4hqKzO08=
X-Google-Smtp-Source: ABdhPJy5OH3QIB+zAzDaiMWg1Qn3dDgDWqUzmOg1Y05WnE5mn9NFcQhCbyo5dwPOeDC5o8xs+M7BCg==
X-Received: by 2002:a05:6402:34d2:: with SMTP id
 w18mr8314103edc.102.1611159166004; 
 Wed, 20 Jan 2021 08:12:46 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id mb15sm1070252ejb.9.2021.01.20.08.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 08:12:45 -0800 (PST)
Subject: Re: [PULL 3/5] linux-user: add missing IPv6 get/setsockopt option
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210119175427.2050737-1-laurent@vivier.eu>
 <20210119175427.2050737-4-laurent@vivier.eu>
 <58abf222-2bcb-4433-7608-ebcc999a2241@amsat.org>
 <c2a2537c-b042-9065-dac6-749815f66ba4@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <02481ce6-7fc0-c40d-1b31-0260ee3a323e@amsat.org>
Date: Wed, 20 Jan 2021 17:12:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c2a2537c-b042-9065-dac6-749815f66ba4@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
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

On 1/20/21 5:00 PM, Laurent Vivier wrote:
> Le 20/01/2021 à 13:16, Philippe Mathieu-Daudé a écrit :
>> On 1/19/21 6:54 PM, Laurent Vivier wrote:
>>> From: Shu-Chun Weng <scw@google.com>
>>>
>>> IPV6_ADDR_PREFERENCES (RFC5014: Source address selection) was not supported.
>>>
>>> Signed-off-by: Shu-Chun Weng <scw@google.com>
>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>> Message-Id: <20201218193213.3566856-4-scw@google.com>
>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>> ---
>>>  linux-user/syscall.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index 969db2008104..70c61d15ebf8 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -51,6 +51,7 @@
>>>  #include <sys/sysinfo.h>
>>>  #include <sys/signalfd.h>
>>>  //#include <sys/user.h>
>>> +#include <netinet/in.h>
>>>  #include <netinet/ip.h>
>>>  #include <netinet/tcp.h>
>>>  #include <netinet/udp.h>
>>> @@ -2272,6 +2273,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
>>>          case IPV6_RECVDSTOPTS:
>>>          case IPV6_2292DSTOPTS:
>>>          case IPV6_TCLASS:
>>> +        case IPV6_ADDR_PREFERENCES:
>>>  #ifdef IPV6_RECVPATHMTU
>>>          case IPV6_RECVPATHMTU:
>>>  #endif
>>> @@ -2926,6 +2928,7 @@ get_timeout:
>>>          case IPV6_RECVDSTOPTS:
>>>          case IPV6_2292DSTOPTS:
>>>          case IPV6_TCLASS:
>>> +        case IPV6_ADDR_PREFERENCES:
>>>  #ifdef IPV6_RECVPATHMTU
>>>          case IPV6_RECVPATHMTU:
>>>  #endif
>>>
>>
>> Building on Centos7:
>>
>> ../linux-user/syscall.c: In function 'do_setsockopt':
>> ../linux-user/syscall.c:2276:14: error: 'IPV6_ADDR_PREFERENCES'
>> undeclared (first use in this function)
>>          case IPV6_ADDR_PREFERENCES:
>>               ^
>> ../linux-user/syscall.c:2276:14: note: each undeclared identifier is
>> reported only once for each function it appears in
>> ../linux-user/syscall.c: In function 'do_getsockopt':
>> ../linux-user/syscall.c:2931:14: error: 'IPV6_ADDR_PREFERENCES'
>> undeclared (first use in this function)
>>          case IPV6_ADDR_PREFERENCES:
>>               ^
>>
> 
> Strange... this is defined since kernel v2.6.26 in /usr/include/linux/in6.h
> 
> 7cbca67c0732 [IPV6]: Support Source Address Selection API (RFC5014).
> 
> Could try adding the include?

Yes, this fixed it, thanks:

-- >8 --
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f91aa0ed5e..34760779c8e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -59,6 +59,7 @@
 #include <linux/icmp.h>
 #include <linux/icmpv6.h>
 #include <linux/if_tun.h>
+#include <linux/in6.h>
 #include <linux/errqueue.h>
 #include <linux/random.h>
 #ifdef CONFIG_TIMERFD
---

