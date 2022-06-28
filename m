Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A0455D231
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:10:32 +0200 (CEST)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Az8-0001nu-Mh
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o6AxC-0000d3-Cr; Tue, 28 Jun 2022 09:08:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o6AxA-0007d4-5r; Tue, 28 Jun 2022 09:08:30 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25SCuQvH001414;
 Tue, 28 Jun 2022 13:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5pDJHWyhMdeUVYau/S5/6nfxheu7u9/QyRIUDA8igGA=;
 b=HsWQMVMVXxZwvjOD6BZjyjuXEaXmUKHG5TD50z3YLeX22GM4dL7r3cNsmPuqGMvTLMYO
 T35XSy7VVerr2miyl//4n4HXUnh9B73RohD2BeP1ABttzpnfpFniBeckOBCViBBiHnTl
 q7jQdBJnRJcNCdwtinbiusGINM55SCRwF2aU7rXWSHNaVC2wM8VcmLHHSxaEvPot6Q1M
 ZJb/4e7zMFCNX3j/mkzEaSP8LToeebRXPyQmEYbffHQdbOE+4lHb4icq6D3qLoDuloCb
 21LR5x5GOtx//d0VMdVH48CfmLsILA/I3FXemOYr2Zr5xuGDoHyhWjDVLK8Lw9Ec+IoQ uQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h023d0h5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 13:08:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25SD7BIL005803;
 Tue, 28 Jun 2022 13:08:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3gwsmj4wg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 13:08:23 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 25SD8Sxx23527854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jun 2022 13:08:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F02DA405C;
 Tue, 28 Jun 2022 13:08:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3B83A405B;
 Tue, 28 Jun 2022 13:08:20 +0000 (GMT)
Received: from [9.145.173.90] (unknown [9.145.173.90])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Jun 2022 13:08:20 +0000 (GMT)
Message-ID: <cf38218a-6e13-8024-8e08-fcdd74faa5a8@linux.ibm.com>
Date: Tue, 28 Jun 2022 15:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Slowness with multi-thread TCG?
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
References: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
 <dd5f1753-ff56-f248-9863-b39739fb6093@eldorado.org.br>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <dd5f1753-ff56-f248-9863-b39739fb6093@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jJOtC9EMZ8jcZ6cdmiTxfsiMTbdTAhhv
X-Proofpoint-GUID: jJOtC9EMZ8jcZ6cdmiTxfsiMTbdTAhhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_07,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280055
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



On 28/06/2022 13:25, Matheus K. Ferst wrote:
> On 27/06/2022 15:25, Frederic Barrat wrote:
>> [ Resending as it was meant for the qemu-ppc list ]
>>
>> Hello,
>>
>> I've been looking at why our qemu powernv model is so slow when booting
>> a compressed linux kernel, using multiple vcpus and multi-thread tcg.
>> With only one vcpu, the decompression time of the kernel is what it is,
>> but when using multiple vcpus, the decompression is actually slower. And
>> worse: it degrades very fast with the number of vcpus!
>>
>> Rough measurement of the decompression time on a x86 laptop with
>> multi-thread tcg and using the qemu powernv10 machine:
>> 1 vcpu => 15 seconds
>> 2 vcpus => 45 seconds
>> 4 vcpus => 1 min 30 seconds
>>
>> Looking in details, when the firmware (skiboot) hands over execution to
>> the linux kernel, there's one main thread entering some bootstrap code
>> and running the kernel decompression algorithm. All the other secondary
>> threads are left spinning in skiboot (1 thread per vpcu). So on paper,
>> with multi-thread tcg and assuming the system has enough available
>> physical cpus, I would expect the decompression to hog one physical cpu
>> and the time needed to be constant, no matter the number of vpcus.
>>
>> All the secondary threads are left spinning in code like this:
>>
>>         for (;;) {
>>                 if (cpu_check_jobs(cpu))  // reading cpu-local data
>>                         break;
>>                 if (reconfigure_idle)     // global variable
>>                         break;
>>                 barrier();
>>         }
>>
>> The barrier is to force reading the memory with each iteration. It's
>> defined as:
>>
>>    asm volatile("" : : : "memory");
>>
>>
>> Some time later, the main thread in the linux kernel will get the
>> secondary threads out of that loop by posting a job.
>>
>> My first thought was that the translation of that code through tcg was
>> somehow causing some abnormally slow behavior, maybe due to some
>> non-obvious contention between the threads. However, if I send the
>> threads spinning forever with simply:
>>
>>      for (;;) ;
>>
>> supposedly removing any contention, then the decompression time is the 
>> same.
>>
>> Ironically, the behavior seen with single thread tcg is what I would
>> expect: 1 thread decompressing in 15 seconds, all the other threads
>> spinning for that same amount of time, all sharing the same physical
>> cpu, so it all adds up nicely: I see 60 seconds decompression time with
>> 4 vcpus (4x15). Which means multi-thread tcg is slower by quite a bit.
>> And single thread tcg hogs one physical cpu of the laptop vs. 4 physical
>> cpus for the slower multi-thread tcg.
>>
>> Does anybody have an idea of what might happen or have suggestion to
>> keep investigating?
>> Thanks for your help!
>>
>>    Fred
>>
>>
> 
> Hi Frederic,
> 
> I did some boot time tests recently and didn't notice this behavior. 
> Could you share your QEMU command line with us? Did you build QEMU with 
> any debug option or sanitizer enabled?


You should be able to see it with:

qemu-system-ppc64 -machine powernv10 -smp 4 -m 4G -nographic -bios <path 
to skiboot.lid> -kernel <path to compresses kernel>   -initrd <path to 
initd>  -serial mon:stdio


-smp is what matters.

When simplifying the command line above, I noticed something 
interesting: the problem doesn't show using the skiboot.lid shipped with 
qemu! I'm using something closer to the current upstream head and the 
idle code (the for loop in my initial mail) had been reworked in 
between. So, clearly, the way the guest code is written matters. But 
that doesn't explain it.

I'm using a kernel in debug mode, so it's pretty big and that's why I 
was using a compressed image. The compressed image is about 8 MB.

The initrd shouldn't matter, the issue is seen during kernel 
decompression, before the init ram is used.

I can share my binaries if you'd like. Especially a recent version of 
skiboot showing the problem.

   Fred





