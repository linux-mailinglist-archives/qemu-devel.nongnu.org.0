Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C0B67D59B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 20:44:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL89f-00084V-Bs; Thu, 26 Jan 2023 14:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL89U-00084K-TM
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 14:43:16 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL89T-0007b1-6A
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 14:43:16 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N3Gok-1ocPOk0oXS-010OAm; Thu, 26 Jan 2023 20:43:12 +0100
Message-ID: <059795f6-97f0-b112-1802-fc47668986a5@vivier.eu>
Date: Thu, 26 Jan 2023 20:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Fix SO_ERROR return code of getsockopt()
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221216101033.8352-1-deller@gmx.de>
 <8ec83c02-0e87-90c2-835d-e01a330b1969@vivier.eu>
 <db38ab56-d632-8cb4-9e60-aef83477ca74@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <db38ab56-d632-8cb4-9e60-aef83477ca74@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OAS2XjJrf5ec63bUwkLX8FjvXZHnz4p4sDplsA6rjMCHdo8VTYd
 rQIwHfxmYmkGI30rfy0Ze8LUYebN+EHdeEZgRKFJUkmYhZsfxrlQjBdc/WnCIBHOPeyEW40
 sxo/+dHlLZzIm5nlmeHGraL//hw1fFSUl7J58G+yualg/qqH/+PfKXiNUSf23LKyl5fm2Dw
 AELhU7n+0wH4K+K7GqZ0w==
UI-OutboundReport: notjunk:1;M01:P0:n+3rXN1JfwQ=;WgckTG2KYsc6anZyyIppwH46Qr/
 Bt4IzsSiREI5LHmh9bahFMiejfPqVRfIiJ8FaCOTCspy0XxhvOetLYvNdPehjCOagE5WWagmO
 Z7kZsZ2dcFyGWQq9gOyCCRBj48/pBSIJSvw5SICW3+n1gb9uETEtu6IOmeAW3mM4OspjKMGYf
 RMvwxSYzw/Jq6NFVlWM6hJRU0jPXVM+NQdHfJ+eH4Yb8yoWDgu2YTbJUlfaMVbCS0qj90zdFu
 gj2WdvvzWnvniQnJjQiGfrJkHXHUBGI4Thwsb77hCEjehbDXnm6ppkpWPPute6RbhM4MYrrvc
 /nXW6rMsZfXMtXmH2gPIu1N+5WS6/inHN5Ii65+60OguNk0PVfArnv+tbTFpNMdu3FwDLTivf
 OKM/rQl4P9qgwbfpzoBr3Nv82gN6lNNjg/gzuV4zj+GkPzAmrTUrFIyBuIgarYH3AsRbZl4LQ
 Hr6caHzVeusQXX1Srbh8nm4LPLo8IYbXWzYC8IYKtscZA4uk5SL/lJVpcp0TjTa5rDQG7J1jj
 bNLZXnepItHU/P8TTdUVzuXlAmgIJUisBp0gCTDSCDaiir/xdc/rzhcuI+7WGS5zBMwG+IC2L
 KuFzuX4AcvYpf/YBYOZq6o8gT8583MofFMyFmeAgOyaBs2dy2D64v/uBpImuukLrpb/XNvN1U
 xzTjQev22ul3UpzqOI0UUO1hW4MhRqAPk2Y4lUl6Bw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 26/01/2023 à 19:27, Helge Deller a écrit :
> On 1/26/23 17:55, Laurent Vivier wrote:
>> Le 16/12/2022 à 11:10, Helge Deller a écrit :
>>> Add translation for the host error return code of:
>>>      getsockopt(19, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) = 0
>>>
>>> This fixes the testsuite of the cockpit debian package with a
>>> hppa-linux guest on a x86-64 host.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> ---
>>>   linux-user/syscall.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index e541fbe09a..52693b4239 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -2809,8 +2809,9 @@ get_timeout:
>>>           ret = get_errno(getsockopt(sockfd, level, optname, &val, &lv));
>>>           if (ret < 0)
>>>               return ret;
>>> -        if (optname == SO_TYPE) {
>>> -            val = host_to_target_sock_type(val);
>>> +        switch (optname) {
>>> +        case SO_TYPE:   val = host_to_target_sock_type(val);    break;
>>> +        case SO_ERROR:  val = host_to_target_errno(val);        break;
>>
>> It looks good but I think compiler will complain if you don't have a default case.
> 
> It didn't for me, but I'm not sure for others.

It's ok. No errors reported by gcc.

however checkscript.sh is not happy:

ERROR: trailing statements should be on next line
#30: FILE: linux-user/syscall.c:2762:
+        case SO_TYPE:   val = host_to_target_sock_type(val);    break;

ERROR: trailing statements should be on next line
#31: FILE: linux-user/syscall.c:2763:
+        case SO_ERROR:  val = host_to_target_errno(val);        break;

Thanks,
Laurent

