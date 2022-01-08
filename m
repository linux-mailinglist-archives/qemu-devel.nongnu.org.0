Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E84884E1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 18:14:55 +0100 (CET)
Received: from localhost ([::1]:35272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6FIs-0001YE-Eb
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 12:14:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6FHX-0000pO-Gs
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:13:31 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:60941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6FHW-0003Mu-2r
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:13:31 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MzyAy-1mCVKQ057G-00wzJ8; Sat, 08 Jan 2022 18:13:28 +0100
Message-ID: <6045fd59-35f5-9567-8c3f-60f27050db35@vivier.eu>
Date: Sat, 8 Jan 2022 18:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/4] linux-user: Do not special-case NULL for
 PR_GET_PDEATHSIG
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220106225738.103012-1-richard.henderson@linaro.org>
 <20220106225738.103012-2-richard.henderson@linaro.org>
 <a1e347c5-e6a5-73b7-12a7-3c7012a349c8@vivier.eu>
In-Reply-To: <a1e347c5-e6a5-73b7-12a7-3c7012a349c8@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GF2ANhOJaEtZ/XORXY/0gTg+yYhdZ2hDzxbRMjPVz6wS6FstGjn
 +bE+WbuX4BkgBlsqf8hKJDccSKdWNZRJjhD5aTo/NkJPFHAQegBpTWxbFV8YICw9ganj2wY
 NynQ+oU2uGYxv3zzt0aeY+y3rU1f3sSoT68EKxI/2k/LXyKtf+8oBtPJH2w+Ggc/gup0vBh
 XSYIbye8sV5hVhcVPZ1Hg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MWpCR8P0c+U=:0jI74LbZEW5xfi5IfNXpz9
 bUOywsGF6IeNN/IKn4tLN6XJ6DTy+3peu+SM6EVC4vV/RDPhhaANxduqKYVwwbsOrcUe7uE9Q
 AbEi6NHxG1vI31FkTMh5ziUVS63kNH+aVrB2mXy4oZrcxQ9LaEp09Ix41lo+cXJ5rZjemfgP/
 eIpxPHCVsLMSUa3o2s34HjUv0nfc5qUMZmsL/GhS/ugWiI4YScHBZKlb6DYyVeRrNd1R4dYir
 3p/h3wOBV/YFwQTLUB83+xGbmuG8S5JDnTiR5TsXEJpBgAApdCeAXOIPlzyQQxtvWWeC6VAf+
 TkT631TdlAcz7B/lIy1dZi7VqMcYYKk6sfY0XhXrRJBTYUJRADIa0l8PzhgJXSVVC2HfG/58x
 NMYnMP4PQY6rUhDlBmm91+AP1CdRet0pS3O56Rq3TPrJJ5iinpQcKqS7i3a5rFH7lEUZS1UOd
 7tX49HPk1ooJROBxXz5Tf9F2WNtTpiHwzvGgbxH3XynmH0BxL/1rsascT4ZsudbsxQdSqUHTl
 H77pkzAYT686aZmTvs0OQi5C1XpLC3/H7w4kAubqltLFoiTxJOLgTOa5cPjm0KnkCwxC6IQyf
 LUIY5XTMT+IEvkqUkvIKBUqga7L+OYn4e0ObQi174lzNFoxgp+OPsgpwffcWgYbzZRXJCgLKu
 eRlhlH3oH2g0H+NzMmyVUKHMavXRGAD87qhg72f8Pvnf4CUX8ctCD/AR0UyoGVxfj484=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 08/01/2022 à 18:10, Laurent Vivier a écrit :
> Le 06/01/2022 à 23:57, Richard Henderson a écrit :
>> The kernel does not special-case arg2 != NULL, so
>> neither should we.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/syscall.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index ce9d64896c..e8f9e0643e 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -6444,7 +6444,7 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
>>               int deathsig;
>>               ret = get_errno(prctl(PR_GET_PDEATHSIG, &deathsig,
>>                                     arg3, arg4, arg5));
>> -            if (!is_error(ret) && arg2 && put_user_s32(deathsig, arg2)) {
>> +            if (!is_error(ret) && put_user_s32(deathsig, arg2)) {
>>                   return -TARGET_EFAULT;
>>               }
>>               return ret;
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

