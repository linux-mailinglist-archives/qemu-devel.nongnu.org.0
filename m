Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159C4682B1A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:05:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMoQy-0006zZ-Rh; Tue, 31 Jan 2023 06:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMoQx-0006zG-KD
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:04:15 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMoQv-0008Lc-Vz
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:04:15 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MX00X-1p7ZlO1rB3-00XIls; Tue, 31 Jan 2023 12:04:07 +0100
Message-ID: <e4f75988-4906-bce9-5617-9014d8b45b2b@vivier.eu>
Date: Tue, 31 Jan 2023 12:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: fr
To: Helge Deller <deller@gmx.de>
Cc: qemu-devel@nongnu.org
References: <Y9Q7BlDc/VX+1SBL@p100>
 <521ea804-5afc-fb19-db72-e1ed73300781@vivier.eu>
 <79a67002-0294-3a87-41ed-82bbb2689bf0@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] linux-user: Improve strace output of pread64() and
 pwrite64()
In-Reply-To: <79a67002-0294-3a87-41ed-82bbb2689bf0@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Yo/WPRxTmxl58DPAENLcJkad4cZhmUBVOlSVyLdda7jQM4x5oLv
 /pRh6E2wP9BN35ITYogbNZmgk2Lqb4vdYqQy9rAfxRLzJsJXal50WI00GVUg54K0fx5LOBQ
 m71lCrz5ITD2CVQOAb9yBSzJtvknJvvPAyYF1Ot9foZ/NzqYEZD+0R5UJCFLyycGLMDTqKJ
 hnR+RWCgEHV42l0r6BqqA==
UI-OutboundReport: notjunk:1;M01:P0:mVpilsqeNSA=;3JwScWieRMtkd+gDJWGmiC5ttqq
 OmxjhpVKy+bamMC8W4ktos1lO8tp07dmyQ+ICDpcyZ2DbEFhUEsHvecjizcnn1wpNyTOTVeZC
 Ns7dkZhcN/2Re8Zn0cMsaLjBhg3J1hklGgLxEf3jE3756H3RPA7EV8haQHi7Mcz609XPbTjMa
 Uq5SDKQ+hx2qx5Lr4KsoDA7MWXLlyObCkgy1f/Dcsj/rQLqHIU2ppqwlOTZ5x2zCdJTrzfuSu
 Xe9S8e1q24c5sDHBCihGJGlY3LHmOUGehRZp+IToBQLUCpo5NiVbbUWqFLRq2lc2glT4BGmGR
 HLzaFhs2Az8JcDczwahJsJxSYp+cmCU/pfABGALaTJhYBO3JnPkmizysWG2t2agQbFu56WtwK
 E/0y/ANX/Kp/3EEirSWPPEOKb8TTcpZRHTEzOGQmSoPTKD+/1dLgHvkwXtJc7FM9OcczaMKgS
 4lLirsfhRxcH39/BeEKIbt3c6pjgLUmtNPAHdpHLlSziZye29aaidNmiGCZFkr699PC1h/sSh
 4e5WH/wzE2hOuPMEEuUFKzKF/66xc8awX7SESwrUKeGmJsVEFSQnP7oqA26u5p0xmucGw0FjX
 ZBdQDYuHuu98ExhHBwlPRxRktJcWlPj/VRUo7UHCE500BrvmBusDrbUaUaIgZNG/Dy+h/GVv7
 H6lH9YADyqkgdyBVBM+I2H+EBJC7DuM6erpCjLMgEQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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

Le 30/01/2023 à 23:11, Helge Deller a écrit :
> On 1/30/23 10:26, Laurent Vivier wrote:
>> Le 27/01/2023 à 21:58, Helge Deller a écrit :
>>> Make the strace look nicer for those two syscalls.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> ---
>>> v2: Use regpairs_aligned() and target_offset64(), noticed by Laurent Vivier
>>>
>>> diff --git a/linux-user/strace.c b/linux-user/strace.c
>>> index 82dc1a1e20..379536f5c9 100644
>>> --- a/linux-user/strace.c
>>> +++ b/linux-user/strace.c
>>> @@ -3824,6 +3824,25 @@ print_rlimit64(abi_ulong rlim_addr, int last)
>>>       }
>>>   }
>>>
>>> +#if defined(TARGET_NR_pread64) || defined(TARGET_NR_pwrite64)
>>> +static void
>>> +print_preadwrite64(CPUArchState *cpu_env, const struct syscallname *name,
>>> +           abi_long arg0, abi_long arg1, abi_long arg2,
>>> +           abi_long arg3, abi_long arg4, abi_long arg5)
>>> +{
>>> +    if (regpairs_aligned(cpu_env, TARGET_NR_pread64)) {
>>> +        arg3 = arg4;
>>> +        arg4 = arg5;
>>> +    }
>>> +    print_syscall_prologue(name);
>>> +    print_raw_param("%d", arg0, 0);
>>> +    print_pointer(arg1, 0);
>>> +    print_raw_param("%d", arg2, 0);
>>> +    qemu_log("%lld", (long long)target_offset64(arg3, arg4));
>>
>> better to use:
>>
>> print_raw_param("%" PRIu64, target_offset64(arg3, arg4), 1);
> 
> I thought of that as well, but that won't work, as print_raw_param()
> takes an "abi_long" value, which is just a 32-bit value on 32-bit targets.
> See print_rlimit64(), it's used there with qemu_log() as well.

Yes, you're right.

But even with qemu_log() I would prefer you use "%"PRIu64 rather than %lld.

Or better define a print_raw_param64() (or similar) and update print_fallocate(), print_truncate64() 
and print_ftruncate64().

Thanks,
Laurent


