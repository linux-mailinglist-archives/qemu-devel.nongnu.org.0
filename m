Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A906C2FE919
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:44:38 +0100 (CET)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2YOD-0005ya-QC
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2YNI-0005LB-1N
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:43:40 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2YNG-0006qx-FW
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:43:39 -0500
Received: by mail-ej1-x635.google.com with SMTP id r12so2136416ejb.9
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 03:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VpojcDg+aoeSkKu4A+2OknxOKyuK8Whk6jLZste/bsw=;
 b=dEORlR1FcOaQPKN0qK92BkoRgYKq5n2EtPmCixsdwZpY6LVAwqEKnSAOJW7eF3Ysv/
 LeGwlAz3jPj3F4jUSyVGV/bwJvYrqy1YTuiZqS3EdFmYfTB2pnOdw1bdz+bKRJzX1vE2
 3OVW20NimmEUXHpXU3paY+bvI7sjriMtdtmYs6wiUPmGgFJcpWQYJ+eRqDwF8A66DCOw
 3/lJRqr52PEFjFM9Acv0nWGCikYpftVMlmBY9SIrHQq6C+l6y358MVmId0ZPDXuWyqck
 dXaEeszcof9yuu/6cnJFCd8CiLkLZA6y0SFBY3nRg0UM9/m25dM2SM8NqgRT+zpIFK4v
 63dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VpojcDg+aoeSkKu4A+2OknxOKyuK8Whk6jLZste/bsw=;
 b=jkcdbaj+7u07rCLiL99z40blYTK4FqieZk8+D1+zM3GjUucP86qsMuYeDFXuWkyTns
 nR1c2dfSPI6c789aPeR9UOfXQ/lysdKi8RrjvPBYxp59xrs4Z3EUBRATj3AzE7LMl+R7
 56E3RXvRvvdvcdX4a/dLLS1nLVf031rYN6848tg+W/Rsw697RHBUy9t283bpNuZYAPby
 IaLw0VMBV0wg5czlps2rsYe1iP5KxO0NyUww+DIm9qGFgLyxrlFnWqBbcjXcnVXxYqFA
 POEcSF/pL46JXY2wA7/8x3B5RCxtquZxjQyc4vtsj7Ctr/yjQnDQ/K24I3BlfCbPlr6T
 m62w==
X-Gm-Message-State: AOAM530l8SIZHZVbPSOj/f/5hKw8i/oc7arOopL6ANLLTOVUYeEzxvpx
 wWIBLdeFNnjr7yBny9zaHVS3i69Jkfk=
X-Google-Smtp-Source: ABdhPJwveKFAN1+G0VIpyjhOWrAl6hyyquglZkXNTEIMMVL8pSwkKvEjBXBtKJ2hyBVCiiHcGs90MQ==
X-Received: by 2002:a17:907:da9:: with SMTP id
 go41mr9079617ejc.326.1611229416582; 
 Thu, 21 Jan 2021 03:43:36 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u23sm2591443edt.78.2021.01.21.03.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 03:43:35 -0800 (PST)
Subject: Re: [PULL 0/5] Linux user for 6.0 patches
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210120195317.84222-1-laurent@vivier.eu>
 <CAFEAcA_jGAWW=3YxJirzOGosLrrgoXhpWHELeJnGJT3u=TPxcw@mail.gmail.com>
 <a3565e8c-1e4e-6544-1784-37a5d2cd33ab@vivier.eu>
 <e8d3abb0-9992-e991-6f54-d138d1190b76@amsat.org>
Message-ID: <bc15aba7-82cc-e39c-2328-90240f9f749d@amsat.org>
Date: Thu, 21 Jan 2021 12:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e8d3abb0-9992-e991-6f54-d138d1190b76@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 12:38 PM, Philippe Mathieu-Daudé wrote:
> On 1/21/21 12:07 PM, Laurent Vivier wrote:
>> Le 21/01/2021 à 11:44, Peter Maydell a écrit :
>>> On Wed, 20 Jan 2021 at 19:56, Laurent Vivier <laurent@vivier.eu> wrote:
>>>>
>>>> The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:
>>>>
>>>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-2021011=
>>>> 9-1' into staging (2021-01-19 15:47:23 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>>>>
>>>> for you to fetch changes up to 8a7e49050b8d5477a567b0ec5d764a564481abdb:
>>>>
>>>>   linux-user: Remove obsolete F_SHLCK and F_EXLCK translation (2021-01-20 18:=
>>>> 26:46 +0100)
>>>>
>>>> ----------------------------------------------------------------
>>>> linux-user pull request 20210119-v2
>>>>
>>>> Remove obsolete F_SHLCK and F_EXLCK translation
>>>> Update sockopt
>>>> Add F_ADD_SEALS and F_GET_SEALS
>>>>
>>> Now fails with:
>>>
>>> ../../linux-user/strace.c: In function ‘do_print_sockopt’:
>>> ../../linux-user/strace.c:2831:14: error: ‘IPV6_ADDR_PREFERENCES’
>>> undeclared (first use in this function)
>>>          case IPV6_ADDR_PREFERENCES:

I could reproduce building qemu-ppc64 (--target-list=ppc64-linux-user).

> I checked on CentOS7 and this part isn't compiled because
> TARGET_NR_socketcall is not defined, but I only build the
> x86_64-linux-user target there.
> 
>>
>> Probably the same cause, in a different file.
>>
>> This should fix the problem.
>>
>> diff --git a/linux-user/strace.c b/linux-user/strace.c
>> index bc3bb6b2f949..7b43668b9b0e 100644
>> --- a/linux-user/strace.c
>> +++ b/linux-user/strace.c
>> @@ -11,6 +11,7 @@
>>  #include <netinet/udp.h>
>>  #include <linux/if_packet.h>
>>  #include <linux/netlink.h>
>> +#include <linux/in6.h>

This build with your fix:

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>>  #include <sched.h>
>>  #include "qemu.h"
> 
> Sounds good.
> 
>>
>> I will try to reproduce it before re-sending the PR.
>>
>> Thanks,
>> Laurent
>>
> 
> 

