Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8361158E716
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 08:04:36 +0200 (CEST)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLepX-0005rS-0Y
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 02:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oLekm-00038Z-NB
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:59:41 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oLekk-0005Tj-1l
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:59:40 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MG9To-1oBnw0020q-00GYGu; Wed, 10 Aug 2022 07:59:32 +0200
Message-ID: <04bffb14-d497-2d29-9bcc-8a0fbdeffc4d@vivier.eu>
Date: Wed, 10 Aug 2022 07:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Don't assume 0 is not a valid host timer_t
 value
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Jon Alduan <jon.alduan@gmail.com>
References: <20220725110035.1273441-1-peter.maydell@linaro.org>
 <Yt561CDN+UjmaDK3@redhat.com>
 <CAFEAcA86gdio-3_XcNJGum8qiC93iVR0RK-g_sV1QRAhb8VGUw@mail.gmail.com>
 <CAFEAcA9k_d6hFjz=udMuRgewxYhmnm8=ARB+s_33jNhtXknobg@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAFEAcA9k_d6hFjz=udMuRgewxYhmnm8=ARB+s_33jNhtXknobg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yNtZyEH2LkxDvZMmRFZK2S2T+Ykwmgm/nfv5JHCr7QQyAR23pKE
 3jMb3RjAzj5woqLZ7K+Errl1wofJD6kOsO4Ir7VN5xi5cKPqx7IR1mEwanKqfKsEXduhmwZ
 VejkAQc3uzW4sJeuIsnYF96s8uG8bGoNukVgBzFptpxMSKeiUsGCdWSrOTUHh4rpsNmsoQF
 hlSPtdmeUQYUXQ4aIFkJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KQw7z5r36gY=:cZnWsx3RKWrqQ5p2H2EPds
 FAIdjcOz4hboqTlXng6wLIpP9iyBo1jvKtUJHE+8GxIKqCGzAyQB7vQ02tn9nNIBmtJHcmfHt
 ujpzD1cOkgYRQyKeL3lLytEO6KQ/CeV+eq96wA6tb/UqOxswVSX+p3dvGNOxFU9VjZzLxA8Mf
 vFvjW94QLXyjxdxbTl+avryvmbG7Dkl48q0a2SMKXU/XyD/Wcf0pH3QicgAY27VdDn7JQ1z5p
 QK5KTRphwbv1GbcWZaYtU0jJtwJkgpd5dUQ+DwLhv1F1r+UnwD9dXfxdrSb1cTuCbfYZpIZm8
 M7q6yAZlV0sL5HWsGg8CFDpj2+KS5P+15Bn3+6mGo2WKPVMD9upboDJMX3maCBUIKS0QVtaCh
 f94aKy34clgjpPjq9ow/kocJpj3pyfIBsHntMWBuPB2G9VPCst2mCLYU/4fdih1a1/1mOumSY
 YgbwTRdSUAJIoBsD7gscIEvXbkyCo4d+EO8VB+VbmMeFfYHNpcmWyMXW7EUuxK3j+Yvsym8C+
 25CdyDyMEiVynqu9ZmPB2lYO8HtkFr8U9mBNU1U84suxkFtTG/eycqQx8y7C8VK6hzSNo2iLf
 S2r6VDVmLhDiLqdmp+7xWmwO7GG7t9mUOSNBDnS9JKivZZEiQvCb4p+9Pk6WgJfrFf8fQ9R/e
 B4vlOVbbmshvcNNllcKT5us1SPkRMkweNXUI1I3i5bkfntrmK8kLVluE62zGSEoe8AiyA/Xbn
 DBYklzKLsxfKWyInBrIuEO1942lJzhgmTad58g==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 09/08/2022 à 11:51, Peter Maydell a écrit :
> Laurent, ping ?

Sorry, I didn't see your message. I'm going to apply it if it's ok to go into rc3?

Thanks,
Laurent

> 
> thanks
> -- PMM
> 
> On Mon, 1 Aug 2022 at 12:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 25 Jul 2022 at 12:13, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>> On Mon, Jul 25, 2022 at 12:00:35PM +0100, Peter Maydell wrote:
>>>> For handling guest POSIX timers, we currently use an array
>>>> g_posix_timers[], whose entries are a host timer_t value, or 0 for
>>>> "this slot is unused".  When the guest calls the timer_create syscall
>>>> we look through the array for a slot containing 0, and use that for
>>>> the new timer.
>>>>
>>>> This scheme assumes that host timer_t values can never be zero.  This
>>>> is unfortunately not a valid assumption -- for some host libc
>>>> versions, timer_t values are simply indexes starting at 0.  When
>>>> using this kind of host libc, the effect is that the first and second
>>>> timers end up sharing a slot, and so when the guest tries to operate
>>>> on the first timer it changes the second timer instead.
>>>
>>> For sake of historical record, could you mention here which specific
>>> libc impl / version highlights the problem.
>>
>> How about:
>>
>> "This can happen if you are using glibc's backwards-compatible
>> 'timer_t is an integer' compat code for some reason. This happens
>> when a glibc newer than 2.3.3 is used for a program that was
>> linked to work with glibc 2.2 to 2.3.3."
>>
>> Laurent, I'm going to assume you don't need a v2 sending just
>> for a commit message tweak, unless you'd like me to do that.
>>
>> thanks
>> -- PMM
> 


