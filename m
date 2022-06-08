Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21138543EDF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 23:52:40 +0200 (CEST)
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz3bS-0004uq-Jf
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 17:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nz3aK-000451-4Z
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:51:28 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:58731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nz3aI-0002pD-5d
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:51:27 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N1x2P-1naoVO1mHJ-012FOM; Wed, 08 Jun 2022 23:51:23 +0200
Message-ID: <fdb1f8bb-3d3c-4135-3005-4fbff36da569@vivier.eu>
Date: Wed, 8 Jun 2022 23:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 0/3] target/m68k: semihosting cleanup
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220607222616.717435-1-richard.henderson@linaro.org>
 <56b31126-41c5-e7b6-5b32-2b64ba1cce67@vivier.eu>
 <8f833280-b1bb-d4f4-6603-5be44ee8e9b7@linaro.org>
 <09f9a931-6873-bd98-74ed-e1d17318d76e@vivier.eu>
 <9c42516d-a238-a1d6-3f01-aaa8fc018eda@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <9c42516d-a238-a1d6-3f01-aaa8fc018eda@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:umUAqKTcO3g+fpT7jyBBOrZ+BSOjnNGq4t8jehd12YvZq5Ti/Pg
 kH+TmutIhO0gRHU20SJX/NJTaBG0gUpYvETpddiy6fnN5A6EVO2SYtX5bB1ErUJY/q2C0LE
 H1DVTbz1j14Iu95i1PW594bMvMDTJShOcTBvx28vbi6jeajZzjxTYxVcb+VdrTbNty9O0tb
 vdt32mtoA1u1umTF4zeBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x4AH31xlTJ4=:kIJ4M4/uPRCrAM3QfYAsiQ
 BGDPBNLD4EMIDfT1ifLpKD/4GnkCee8LJoNp3VjoeoFlJVzB93qzBNvoh/6bcYYJ9wUox5Dwp
 OFneZTA8cDwGxccFQxPYD5lXeLgIh0C2MtalXj7imLgA1VPNS+5t9QaDnlwkowPJRWtS6wZoG
 kTn4jNdx1To/tukObe//AFRE2uwVNsznBDqJCm2abHAjeVMtRgxuoy91XwFJ5+AS0C9qq0zez
 SrM6XhHcKqzLWwOHT6JtkDIFemGwoHii62XOrv1hyDtAUVhaQjwBdgyhqwkpHiRCO2jvb5pD4
 6N+WhPtd9fKOptGQLb2QJY85mlYIylljT9Wk4kc5EjWo6/Qc5vst9q2NycORKuf+RqQHpQhDi
 iTWO4x4gyPx+XN3gnYGspLIxaASoLQiutmxuWOpjTAxWF//1s+bgwMb+/hXlrnLOQ+dbo0aA8
 R+dYhU/RGef7lCuPmwfJhjKNiZzWMteof71n565uMunGuPpU39x4NDr4EOz1yPq0S7K4/yThI
 XsH7cJgL7E4xEYQhHLkIrMrT1ip4fecamYynALJOsqf1+BCrKkF0hMuytujd/y+1gJ9QLF3hw
 NdZYcP4JzvDYW2Pfd7pUFkqerOSHSa+OvXZQQUyUvNgkQkHyYK2I2LNX4lqnF+8ONfUws4xrh
 Ko9JUVFQryqz/EONY23rb3g0WSUSI14Sz+nyfDGY/GT9bWT0Fg3sZiIkWGVrrc7SdCXPxTI0v
 tt+YednpKGyRxT+qdZPt0NeCdgghr3HiQBp+7A==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 08/06/2022 à 21:05, Richard Henderson a écrit :
> On 6/8/22 11:08, Laurent Vivier wrote:
>> Le 08/06/2022 à 16:53, Richard Henderson a écrit :
>>> On 6/8/22 02:36, Laurent Vivier wrote:
>>>> Le 08/06/2022 à 00:26, Richard Henderson a écrit :
>>>>> Based-on: <20220607204557.658541-1-richard.henderson@linaro.org>
>>>>> ("[PATCH v4 00/53] semihosting cleanup")
>>>>>
>>>>> Changes for v4:
>>>>>    * Split out of v2.
>>>>>    * Convert host errno to gdb errno, which for m68k is guest errno.
>>>>>
>>>>
>>>> How do you test semihosting on m68k?
>>>
>>> I have only compiled this.  I had been working on adding something to tests/tcg/m68k/, which is 
>>> where those halt patches came from, but haven't finished.
>>>
>>
>> But what is the use case of semihosting on m68k?
>> Is there a kernel implementation available for that?
> 
> Not that I'm aware of.  Do you want to remove it entirely instead?

No, while you fix it I have no problem to keep it.

Thanks,
Laurent

