Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93980391F58
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:43:31 +0200 (CEST)
Received: from localhost ([::1]:56636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyV8-0000AT-Kj
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llyOs-0006rg-BW
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:37:03 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:35729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llyOf-00029V-Vr
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:37:01 -0400
Received: from [192.168.100.1] ([82.142.6.50]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MS3r9-1lsPWR3H9H-00TRnm; Wed, 26 May 2021 20:36:36 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Michael Forney <mforney@mforney.org>
References: <20210526043928.9586-1-mforney@mforney.org>
 <502221eb-cc9f-ca58-2864-91aaa07006ba@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: Remove unnecessary static assert involving
 __SIGRTMAX
Message-ID: <cd5b4bc7-bc57-6299-5237-895ce2dd11ff@vivier.eu>
Date: Wed, 26 May 2021 20:36:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <502221eb-cc9f-ca58-2864-91aaa07006ba@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nl4ncFai5FAz7QujyJQAFxHCJCoiKLrfX1HGHWIRHH5n6GQ4EVT
 YbKXr+1wxakUh0EGPUz7DiAVKNy0K5R/iO/8dPQEOZJG8HINxRy532Zn6xZs+P/e/Z2l2KL
 nym1FYHI/HWpaH6BFN5/x4UJq3qIyOO1dOT9m7YfDAf5Ve334ADJjr32SJ0zxkzBL0+8Ct8
 ivN33XTQWsqB4ZRTyY6YA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wr+bmCdtx9E=:Tdxcmg4gfopKEqsUv4CQAj
 obkMS8U6zvDbJKIQUJcKYoB99iM6fVeEUSXcmZQ0yMKa3jhcHi3ipGTkoxnJMXaaBVlaFiZK/
 X316Tz+7r2RkhaOZtnucDupagH/nmH2J+4fT4cM9SXL000NBQ0aHwcqO6sct4ilE6hCtQSGhR
 eDOOc1Vqiy3mzjx8wUGWdTdOlEqZgJqCO3zo0rLoOkrcJ8O9LfORk1hUdt8nQ6Qa1IIXs07Zr
 1VmDfs+mtkEO+2KKuzHpUQ99I4gMeEvTPXZYlAtCAOegs3Y5kRTp1tgJ8FYoB2uHGClTzu1by
 UB9u4QAe6+H2Yf0TVEUqUFvireLz3BsaXJmZvDHmgd+awvDdb9yaEQJYY5jEOfl1eK6kcPHOv
 X6/zSaIiH1vJZMVCF5TA61ZbNBG1/7rA6enRjODz3kXHyrQYr5OSr8xHAciDVJWgIwxOlQPLA
 L9HpL4VQW4+T+f4Vw3rs5vhlccuCX0TYX7wqQi+jsmDyU7oyNN57Dv7NAJ/Wd4xaW3KgFs2NC
 4BI2qhbrGbj8v3pBsiP+u4=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/05/2021 à 19:16, Philippe Mathieu-Daudé a écrit :
> On 5/26/21 6:39 AM, Michael Forney wrote:
>> Since "linux-user: fix use of SIGRTMIN" (6bc024e7), qemu removed
>> use of __SIGRTMAX except for in this QEMU_BUILD_BUG_ON assert.
>> Presumably, this check is to ensure that the loop in signal_table_init
>> from SIGRTMIN to SIGRTMAX falls within the bounds of
>> host_to_target_signal_table (_NSIG).
>>
>> However, _NSIG is already defined to be the one larger than the
>> largest signal supported by the system (as specified in the upcoming
>> POSIX revision[0]), so the check is unnecessary.
>>
>> musl libc does not define __SIGRTMAX, so removing this check fixes
>> one of the last remaining errors when building qemu.
>>
>> [0] https://www.austingroupbugs.net/view.php?id=741
>>
>> Signed-off-by: Michael Forney <mforney@mforney.org>
>> ---
>> If you prefer, I can send an alternate patch to leave the
>> QEMU_BUILD_BUG_ON, but guard it by #ifdef __SIGRTMAX.
> 
> This looks safer, personally I prefer, but let's see what the
> maintainers prefer.

I agree, the reason of the check is explained in the comment above.

I think it's safer to keep the QEMU_BUILD_BUG_ON().

In the past we had a confusion between _NSIG, NSIG and TARGET_NSIG.

See 9fcff3a67f2b ("linux-user: fix TARGET_NSIG and _NSIG uses")

Thanks,
Laurent

