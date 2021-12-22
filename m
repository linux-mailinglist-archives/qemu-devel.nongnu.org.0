Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9AA47D862
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:53:06 +0100 (CET)
Received: from localhost ([::1]:56406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n08bh-0007Id-9n
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:53:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n08Ze-00064H-Lo
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:50:58 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:55293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n08Zd-0006Mt-1v
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:50:58 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MGQaz-1nGOme1ae5-00Gnvr; Wed, 22 Dec 2021 21:50:45 +0100
Message-ID: <1d186700-9c49-2734-a87e-d316b05a2c82@vivier.eu>
Date: Wed, 22 Dec 2021 21:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/6] linux-user: Disable more prctl subcodes
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211220214135.189157-1-richard.henderson@linaro.org>
 <20211220214135.189157-3-richard.henderson@linaro.org>
 <f490a5a8-e6c2-664c-e497-da6cca4174da@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <f490a5a8-e6c2-664c-e497-da6cca4174da@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cIpReku2s/gs5i0hCLAmq1Wt27bbrjcZspZYZ7Y7sW76L9BwL/S
 3UyipsI7OFGEm9DtD9fYTYMvr3j59yBKQ7IMsaVeHb4b3eTk1VkziBi84H5gT7OzBwHahjN
 G3CdvvEF8gizK0mzRqqpP9GQ1dc8WuGWfd00HjljRraVZ/l/Mgo4cpAz+hCq3y3teGy0R+f
 M764KUl7W25nY1l0ydJ4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HesDyezXSME=:G13uP9ygXwUeVJV5fGfGs2
 vceQk5Xs/QAnUu175x9guKx5ferXGlxz92isUB3IbMEEdw/lIgp+6udjBAm/MSXsOQv0TH5tq
 a3QhztO6+WnM45we6rwSiQWRdwGgQi/cIEyZx00WbwZcQpJ77j8vYxfEMKFiEEf30cssBrK62
 KbYqUr5hyPjA+lyoBj2YiX+8gsdS2y83K3Y1v5II9sbsA/39NS/tbgU5BTKAWtGgC/WJBJytE
 4jZq9JolTC1O5ZTFNYLAu7otHylHMRpqFoc1vvC8Q0SbIrqCczkO8SLKr0KZEblJRbegt0Xnt
 ceHRkmhdoe5k3kJps1nhApHgwOJfaliaa4scqpJFJjhw4ImEmh3BDIeaGABB6lnmRVeKvtvSQ
 3Y6OxmQh2t8vstFcvDhdRBNI1U8o+8ShumRHjAdBZXpCnfScaBNPiOSoK40Ghxk8Qfk+Kf2Ir
 8AzQe/9l1EeqBzXfWCZb5Fx8ypFJySxeHtigFGGBwaZDJ5tkvdEtdHF1IoHOEC6vyimbc6ROi
 NB2INVF/Wns/surZY1OgPVoLRM/fZ+mCpgIjR8kSAh21ews1l65gixGrGSLhYcE165E/nwWyv
 e2F/WlLJSlXh1w0LB+M0U3Me3lKcuzV2RjFE8nfSny9V+vYWsUbEtx/AGXMaTmwIAWiqbJL//
 w0lMVhb+OSOdTcty9SKW6kYkZYed0iB2nuyUILQs+KJa9chQUFz0oftuqJMAYJiJQ70w=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 20/12/2021 à 23:41, Philippe Mathieu-Daudé a écrit :
> On 12/20/21 22:41, Richard Henderson wrote:
>> Create a list of subcodes that we want to pass on, a list of
>> subcodes that should not be passed on because they would affect
>> the running qemu itself, and a list that probably could be
>> implemented but require extra work. Do not pass on unknown subcodes.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/syscall.c | 56 ++++++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 52 insertions(+), 4 deletions(-)
> 
>> +    case PR_SET_SYSCALL_USER_DISPATCH:
>> +    case PR_GET_THP_DISABLE:
>> +    case PR_SET_THP_DISABLE:
>> +    case PR_GET_TSC:
>> +    case PR_SET_TSC:
>> +    case PR_GET_UNALIGN:
>> +    case PR_SET_UNALIGN:
>>       default:
> 
> Unfortunately prctl values are not enumerated, so we can't remove
> the default case to catch new values at build time.
> 
> Maybe a qemu_log_mask(LOG_UNIMP) call would help here? (only

Yes, I think a qemu_log_mask(LOG_UNIMP) for the default case would help.
> for default?)
> 
> Regardless:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> 
>> -        /* Most prctl options have no pointer arguments */
>> -        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
>> +        /* Disable to prevent the target disabling stuff we need. */
>> +        return -TARGET_EINVAL;
>>       }
>>   }
>>   
> 


