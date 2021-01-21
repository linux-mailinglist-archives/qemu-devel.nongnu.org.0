Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12CE2FE900
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:39:16 +0100 (CET)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2YJ2-0004OO-0z
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2YI3-0003zM-79
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:38:15 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2YI1-0004GM-JN
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:38:14 -0500
Received: by mail-ed1-x534.google.com with SMTP id c2so1798076edr.11
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 03:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NwrnIvpT+/1eLr9X4EgMl66NI7hZMWXQBeoL03dynvM=;
 b=NTKkl/1hIBLFMXPg9QhGPPcRxZK7k6My628Kn3c8mnUClWtijvK7FXJw/rhGR+0kay
 Xn5WQ2sAdgQtfmrOpOopqKxBDBr41kEk/S1XIUSSYRlL3pHlRXYwrhIhFTB25OYD1X0s
 A9TfjFeUJ5EyK8X0AYPcNBKkgxC4rblICSp+IhnxYH98R+F2TeItvhgLE6bvO6kXi/gS
 NOImdYwWR+QtU2ZB/M9ZKqkuEkWOUu0zWUvznXTI95U3lQ0YFzb7tpLvw1mDQ1jHBEXV
 8oyznYDhSCmEq5mz7yFh+mxuzwOYWX/iUnOsAO1Y8f5jProOQpVwnkv1tW9PRPp8VjmC
 Tt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NwrnIvpT+/1eLr9X4EgMl66NI7hZMWXQBeoL03dynvM=;
 b=s/KvywD2s4S+BUKvvZHRo4S8olXMrqyaDHo8m7PiHkEdOZRLGPH5txx4OXew5/DFcN
 J6mHOnpxCYM26bUrMdaCAtFSQJiKN7lgzoiHHvlIuker6KrzdV9P3SatJi1lNCSNZUaW
 TSVOjcOSXPOY1W+aJFEhW913BvCkC9w66P9tAMNfxMFLkTOVcdQyXKLTinlYj5QimLil
 4fD4onQhlhN3DaggWJKFV+J2+xEWRjePcDhZco8TJO1ramQbpOnew1hIbz9TIO5hwRUV
 z01o6s6Q5hjfAovkpgx8WZhWVcSuFbthM4/Dexf/enlmg86ecWKqkSuqrxn2TL5rlBme
 baUg==
X-Gm-Message-State: AOAM533S2q60opwS59A/mwBrvPOUyNVCvJtLYJt5YqdZsBb4UjvYLZW+
 2iIFzIQFgIObVh9uT+ktksaMoZWyW3c=
X-Google-Smtp-Source: ABdhPJwsAO0Y7yCeWcBc3d25lm/7fBxwiW0WSkDh62cnW7mMwyqu51gFSsSYHjzrVkRwcFcoFRLRvg==
X-Received: by 2002:a50:d484:: with SMTP id s4mr10723625edi.13.1611229091718; 
 Thu, 21 Jan 2021 03:38:11 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q2sm2626752edn.91.2021.01.21.03.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 03:38:11 -0800 (PST)
Subject: Re: [PULL 0/5] Linux user for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210120195317.84222-1-laurent@vivier.eu>
 <CAFEAcA_jGAWW=3YxJirzOGosLrrgoXhpWHELeJnGJT3u=TPxcw@mail.gmail.com>
 <a3565e8c-1e4e-6544-1784-37a5d2cd33ab@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e8d3abb0-9992-e991-6f54-d138d1190b76@amsat.org>
Date: Thu, 21 Jan 2021 12:38:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a3565e8c-1e4e-6544-1784-37a5d2cd33ab@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
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

On 1/21/21 12:07 PM, Laurent Vivier wrote:
> Le 21/01/2021 à 11:44, Peter Maydell a écrit :
>> On Wed, 20 Jan 2021 at 19:56, Laurent Vivier <laurent@vivier.eu> wrote:
>>>
>>> The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:
>>>
>>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-2021011=
>>> 9-1' into staging (2021-01-19 15:47:23 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>>>
>>> for you to fetch changes up to 8a7e49050b8d5477a567b0ec5d764a564481abdb:
>>>
>>>   linux-user: Remove obsolete F_SHLCK and F_EXLCK translation (2021-01-20 18:=
>>> 26:46 +0100)
>>>
>>> ----------------------------------------------------------------
>>> linux-user pull request 20210119-v2
>>>
>>> Remove obsolete F_SHLCK and F_EXLCK translation
>>> Update sockopt
>>> Add F_ADD_SEALS and F_GET_SEALS
>>>
>> Now fails with:
>>
>> ../../linux-user/strace.c: In function ‘do_print_sockopt’:
>> ../../linux-user/strace.c:2831:14: error: ‘IPV6_ADDR_PREFERENCES’
>> undeclared (first use in this function)
>>          case IPV6_ADDR_PREFERENCES:

I checked on CentOS7 and this part isn't compiled because
TARGET_NR_socketcall is not defined, but I only build the
x86_64-linux-user target there.

> 
> Probably the same cause, in a different file.
> 
> This should fix the problem.
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index bc3bb6b2f949..7b43668b9b0e 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -11,6 +11,7 @@
>  #include <netinet/udp.h>
>  #include <linux/if_packet.h>
>  #include <linux/netlink.h>
> +#include <linux/in6.h>
>  #include <sched.h>
>  #include "qemu.h"

Sounds good.

> 
> I will try to reproduce it before re-sending the PR.
> 
> Thanks,
> Laurent
> 


