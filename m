Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D6557A0D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 14:13:14 +0200 (CEST)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Lhx-0002hr-4y
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 08:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o4LdW-0000XM-DX
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:08:38 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:35377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o4LdU-0007Xv-Dw
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:08:38 -0400
Received: from [192.168.100.42] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1M4bA6-1o3n8U2MVy-001eRn; Thu, 23 Jun 2022 14:08:29 +0200
Message-ID: <f10fc88c-a47e-3f23-4f1f-ecda6d00637c@vivier.eu>
Date: Thu, 23 Jun 2022 14:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH] linux-user: un-parent OBJECT(cpu) when closing thread
Content-Language: en-US
From: Laurent Vivier <laurent@vivier.eu>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, thuth@redhat.com
References: <20220610143855.1211000-1-alex.bennee@linaro.org>
 <63402e61-a23b-6780-fec3-8a0fdf32520a@vivier.eu>
In-Reply-To: <63402e61-a23b-6780-fec3-8a0fdf32520a@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g6JKxznPcanOjarHUWCCV3lY3K2RsdEGlFBibjucfo2i5ZLYJDM
 lO9pOJTz5lT6tWL9Mp2uMB/EXBTb8IB2JjMVdK3s9CqgyPIjio59S/HisoYgOMYYr9V6PPx
 4+uCDPQ4UZN7AsjOtUZMOdVhOojYRqhVWzqAvsYxBOr5HPTUOUqxkCVnQNR5A/NVV1TUbKF
 oBgz+c7P0gXC65xRB46zQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CNfGpz0LgQU=:5ub4uQ+wRHILLX+iIcVMwU
 s6Rza7/rvs/m8QvTDfQS6oa5BnzfNaa/0gp6Vx58XddeOWz2mtc5Sx2WWmGclSaZAIMtDsBxH
 DbKJ4SWwBzLoRb+RT2elyxnbDJ6gDX60YzG7v1NPLbBH+IQv3BVU7oOPAa/7bebd3p0mdYr8L
 h/FffBUbef3QKEuzSaQ2ywfffRjmo8TZWaYqF4ZXyg9widh5uy131Y3L/qfQtmc0dpCgXleBd
 9F6IXU55UleWl4y/35igfHhlU5d5WyT+mQrkPDk+3aSDlotfBUHJFBV+02bPHbDBuCqlsLKnW
 IIcRO+0a9sbJn4MJDdSWpH2ZQBFMqqw/eh9GnYAGf+Jzop40nyGnK6dHdOwLuHBZi2fG5K6Rx
 PPSN0riZsdrAx216EZkz6kDplfctKTBxFYbFGjWbMABPCInyOuFjqEq95ibEFSYONnr8XGbFZ
 tQY2+xRTgcwanGtm8yNjEV0WlQSbIRJQIBKUXnCKXEGcGEiG+ggWtT1fmH1y3t35uvDnd636j
 J1fGtXKOTAipSyXsRqK8W1ze7DC6HofcVszdiv2x0BRM3mOf9GNCYJUa0U+bwSlc9HAOk7Buj
 6Lqpu1jLMPcSHdbaG/fe5fBo71LHwasZ8aH0c85BElzJ7ondsOWhr62z3GFQRa+UWvlo4B0OP
 xdc6X6HJ4xrtSZrkpKdnI1wtWwUo4GXPLFSBbMrCEEW9vaQNGZCxRK1ZDXulUUwNcpXTStbPt
 8Kle65vTAHiC2n9Q7HlmNaD6HcVPhQwfY1zktA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

On 21/06/2022 20:17, Laurent Vivier wrote:
> Le 10/06/2022 à 16:38, Alex Bennée a écrit :
>> While forcing the CPU to unrealize by hand does trigger the clean-up
>> code we never fully free resources because refcount never reaches
>> zero. This is because QOM automatically added objects without an
>> explicit parent to /unattached/, incrementing the refcount.
>>
>> Instead of manually triggering unrealization just unparent the object
>> and let the device machinery deal with that for us.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/866
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   linux-user/syscall.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index f55cdebee5..c413d32311 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -8566,7 +8566,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, 
>> abi_long arg1,
>>           if (CPU_NEXT(first_cpu)) {
>>               TaskState *ts = cpu->opaque;
>> -            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
>> +            object_unparent(OBJECT(cpu));
>>               object_unref(OBJECT(cpu));
>>               /*
>>                * At this point the CPU should be unrealized and removed
> 
> Applied to my linux-user-for-7.1 branch.
> 

I remove it from the branch.

It breaks something with arm64 (only) target (any distros: stretch, sid, trusty, bionic), 
the following LTP test cases fail:

bind04, bind05, fcntl34, fcntl34_64, fcntl36, fcntl36_64, inotify09, mmap18, 
sched_setattr01, sched_getattr01, tgkill01, tgkill02, tgkill03, futex_wake02

For instance:

tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
bind04.c:117: TINFO: Testing AF_UNIX pathname stream
bind04.c:150: TPASS: Communication successful
tst_test.c:1300: TBROK: Test killed by SIGSEGV!

Thanks,
Laurent

