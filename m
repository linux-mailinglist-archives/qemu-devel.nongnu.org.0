Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE26855E5E7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 18:19:37 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Dw9-0005XQ-0e
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 12:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o6Dsw-0000ut-2P; Tue, 28 Jun 2022 12:16:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o6Dst-000791-HR; Tue, 28 Jun 2022 12:16:17 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25SFmNMk033796;
 Tue, 28 Jun 2022 16:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=inHIfQF4iwzmjZQamoZf18fepUvf6PucMPregHJD6x8=;
 b=aF0LbAxfIdlAAwEkeF59M9DR0Kp32p4rSGuMv6UqNnbhoC19Rm5oyX/o00eu03FwE87Y
 ouFKCCRgTV4BMknuFsQDxOujgM6x/UtQm8os9mPo1SYtvcUTL3GaJNXpju3rOEvsCvhc
 j0yVayNH156pBvfA2clpxjD2k3tCFlkpxoNNVZgdjs5iGM3wiH02w+mw9jdj9HcsBvMC
 VbEN1xHJAu5801cw2PgGCpiRlayxxBQU1YQwM/daPbwyuZb2eWl1+Y6nN4eQDAH03naO
 KUAEjt2swChXLPmNbfTJ7RiVDx9owG1DJxm3c5qSKsopHsQt1aRAV+kgevvXPuS22tig tg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h04m0rv0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 16:16:10 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25SFo73M032649;
 Tue, 28 Jun 2022 16:16:08 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3gwt093tv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 16:16:08 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25SGG6Tc18809144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jun 2022 16:16:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F129A405B;
 Tue, 28 Jun 2022 16:16:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1811A4054;
 Tue, 28 Jun 2022 16:16:05 +0000 (GMT)
Received: from [9.145.173.90] (unknown [9.145.173.90])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Jun 2022 16:16:05 +0000 (GMT)
Message-ID: <348a8b91-6d91-7429-615b-c0e3d23e4fce@linux.ibm.com>
Date: Tue, 28 Jun 2022 18:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Slowness with multi-thread TCG?
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
 <dd5f1753-ff56-f248-9863-b39739fb6093@eldorado.org.br>
 <cf38218a-6e13-8024-8e08-fcdd74faa5a8@linux.ibm.com>
 <87h744keg7.fsf@linaro.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <87h744keg7.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gbVrBQgV56ybjfUxihBwEksT18Vrt7fJ
X-Proofpoint-ORIG-GUID: gbVrBQgV56ybjfUxihBwEksT18Vrt7fJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_09,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280064
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 28/06/2022 17:12, Alex Bennée wrote:
> 
> Frederic Barrat <fbarrat@linux.ibm.com> writes:
> 
>> On 28/06/2022 13:25, Matheus K. Ferst wrote:
>>> On 27/06/2022 15:25, Frederic Barrat wrote:
>>>> [ Resending as it was meant for the qemu-ppc list ]
>>>>
>>>> Hello,
>>>>
>>>> I've been looking at why our qemu powernv model is so slow when booting
>>>> a compressed linux kernel, using multiple vcpus and multi-thread tcg.
>>>> With only one vcpu, the decompression time of the kernel is what it is,
>>>> but when using multiple vcpus, the decompression is actually slower. And
>>>> worse: it degrades very fast with the number of vcpus!
>>>>
>>>> Rough measurement of the decompression time on a x86 laptop with
>>>> multi-thread tcg and using the qemu powernv10 machine:
>>>> 1 vcpu => 15 seconds
>>>> 2 vcpus => 45 seconds
>>>> 4 vcpus => 1 min 30 seconds
>>>>
>>>> Looking in details, when the firmware (skiboot) hands over execution to
>>>> the linux kernel, there's one main thread entering some bootstrap code
>>>> and running the kernel decompression algorithm. All the other secondary
>>>> threads are left spinning in skiboot (1 thread per vpcu). So on paper,
>>>> with multi-thread tcg and assuming the system has enough available
>>>> physical cpus, I would expect the decompression to hog one physical cpu
>>>> and the time needed to be constant, no matter the number of vpcus.
> <snip>
>>>>
>>>> Ironically, the behavior seen with single thread tcg is what I would
>>>> expect: 1 thread decompressing in 15 seconds, all the other threads
>>>> spinning for that same amount of time, all sharing the same physical
>>>> cpu, so it all adds up nicely: I see 60 seconds decompression time with
>>>> 4 vcpus (4x15). Which means multi-thread tcg is slower by quite a bit.
>>>> And single thread tcg hogs one physical cpu of the laptop vs. 4 physical
>>>> cpus for the slower multi-thread tcg.
>>>>
>>>> Does anybody have an idea of what might happen or have suggestion to
>>>> keep investigating?
>>>> Thanks for your help!
>>>>
>>>>     Fred
>>>>
>>>>
>>> Hi Frederic,
>>> I did some boot time tests recently and didn't notice this behavior.
>>> Could you share your QEMU command line with us? Did you build QEMU
>>> with any debug option or sanitizer enabled?
>>
>>
>> You should be able to see it with:
>>
>> qemu-system-ppc64 -machine powernv10 -smp 4 -m 4G -nographic -bios
>> <path to skiboot.lid> -kernel <path to compresses kernel>   -initrd
>> <path to initd>  -serial mon:stdio
>>
>>
>> -smp is what matters.
>>
>> When simplifying the command line above, I noticed something
>> interesting: the problem doesn't show using the skiboot.lid shipped
>> with qemu! I'm using something closer to the current upstream head and
>> the idle code (the for loop in my initial mail) had been reworked in
>> between. So, clearly, the way the guest code is written matters. But
>> that doesn't explain it.
>>
>> I'm using a kernel in debug mode, so it's pretty big and that's why I
>> was using a compressed image. The compressed image is about 8 MB.
> 
> If the debug mode on PPC enables live patching of kernel functions for
> instrumentation that can certainly slow things down. You would see that
> in tcg_optimize appearing in the perf log and "info jit" showing
> constantly growing translation buffers.


The part where I'm seeing the huge slowdown is not quite in kernel yet. 
Only one thread is in bootstrap code decompressing the real kernel. All 
the other threads are still spinning in firmware.

Anyway, I've run perf. I couldn't figure out how to trigger the 
recording only around the decompression part with the slowdown. So I 
booted with 4 cpus to make it really slow, expecting the initial steps 
of the boot, which happen quickly enough, would be dwarfed by the time 
spent while one thread is decompressing the kernel (the part where I see 
the huge slowdown). I'd say the recording was taken with ~80% of the 
time in the interesting part. Here is what I got:


   12,62%  qemu-system-ppc  [kernel.kallsyms]          [k] 
syscall_exit_to_user_mode
    6,93%  qemu-system-ppc  [kernel.kallsyms]          [k] 
syscall_return_via_sysret
    5,64%  qemu-system-ppc  [kernel.kallsyms]          [k] 
__entry_text_start
    3,93%  qemu-system-ppc  libc.so.6                  [.] 
pthread_mutex_lock@@GLIBC_2.2.5
    3,21%  qemu-system-ppc  libc.so.6                  [.] 
__GI___pthread_mutex_unlock_usercnt
    3,12%  qemu-system-ppc  libc.so.6                  [.] 
__GI___lll_lock_wait
    2,60%  qemu-system-ppc  qemu-system-ppc64          [.] 
cpu_handle_interrupt
    2,55%  qemu-system-ppc  [kernel.kallsyms]          [k] futex_wake
    2,43%  qemu-system-ppc  [kernel.kallsyms]          [k] 
native_queued_spin_lock_slowpath
    1,97%  qemu-system-ppc  [kernel.kallsyms]          [k] _raw_spin_lock
    1,89%  qemu-system-ppc  qemu-system-ppc64          [.] 
qemu_mutex_lock_impl
    1,83%  qemu-system-ppc  qemu-system-ppc64          [.] tb_lookup
    1,71%  qemu-system-ppc  [kernel.kallsyms]          [k] 
__get_user_nocheck_4
    1,55%  qemu-system-ppc  qemu-system-ppc64          [.] 
hreg_compute_hflags_value
    1,46%  qemu-system-ppc  [kernel.kallsyms]          [k] futex_q_lock
    1,39%  qemu-system-ppc  [kernel.kallsyms]          [k] futex_q_unlock
    1,23%  qemu-system-ppc  [kernel.kallsyms]          [k] 
audit_reset_context.part.0.constprop.0
    1,14%  qemu-system-ppc  qemu-system-ppc64          [.] 
object_class_dynamic_cast_assert
    1,09%  qemu-system-ppc  qemu-system-ppc64          [.] 
qemu_mutex_unlock_impl
    1,02%  qemu-system-ppc  qemu-system-ppc64          [.] 
object_dynamic_cast_assert
    1,00%  qemu-system-ppc  [kernel.kallsyms]          [k] __x64_sys_futex


Any known pattern here? There seems to be some contention with the 
mutex/futex call, but it's not obvious to me what it is.

I was also pointed to enabling gprof in qemu. I'll look into it.

Thanks!

   Fred


>>
>> The initrd shouldn't matter, the issue is seen during kernel
>> decompression, before the init ram is used.
>>
>> I can share my binaries if you'd like. Especially a recent version of
>> skiboot showing the problem.
>>
>>    Fred
> 
> 

