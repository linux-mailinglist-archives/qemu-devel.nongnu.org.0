Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE76533884F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:10:59 +0100 (CET)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdow-0001Tk-Sa
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKdks-0006EU-Mz
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:06:46 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:56508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKdkp-00030U-Dw
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:06:46 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0749151|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.141725-0.00462387-0.853651;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=3; RT=3; SR=0; TI=SMTPD_---.Jk--KkG_1615539991; 
Received: from 30.225.208.86(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Jk--KkG_1615539991)
 by smtp.aliyun-inc.com(10.147.42.241);
 Fri, 12 Mar 2021 17:06:31 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: Re: Question about edge-triggered interrupt
To: Alistair Francis <alistair23@gmail.com>
References: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
 <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
 <3edf7903-94a7-c16e-2b9e-644e1a41a77d@c-sky.com>
 <CAFEAcA8UqE65Qxy=c53CCPdYnVrwvBZGxU9SH9qk7Q6vGKDgyg@mail.gmail.com>
 <50fb9541-095d-18e8-1145-662f594600b6@c-sky.com>
 <CAKmqyKPXRLWWZnv51ApKwQurn-etQqLxW3or2pFgFH+zONpHjw@mail.gmail.com>
Message-ID: <0bad00aa-f3c3-73f7-e276-cfd9629db969@c-sky.com>
Date: Fri, 12 Mar 2021 17:06:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPXRLWWZnv51ApKwQurn-etQqLxW3or2pFgFH+zONpHjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/3/12 4:45, Alistair Francis wrote:
> On Thu, Mar 11, 2021 at 11:21 AM LIU Zhiwei<zhiwei_liu@c-sky.com>  wrote:
>> On 2021/3/11 21:17, Peter Maydell wrote:
>>> On Thu, 11 Mar 2021 at 12:59, LIU Zhiwei<zhiwei_liu@c-sky.com>  wrote:
>>>>   From the specification, I find that software will not clean the pending bit on interrupt controller via a register write.
>>>>
>>>> "When a vectored interrupt is selected and serviced, the hardware will automatically clear the
>>>>
>>>> corresponding pending bit in edge-triggered mode. In this case, software does not need to clear
>>>>
>>>> pending bit at all in the service routine."
>>>>
>>>> Hardware can always select a pending interrupt as it is cycle-driven. But QEMU is event-driven.
>>>> I don't know if there is a chance to select other pending interrupts after serving the selected interrupt.
>>> Something must change that the hardware (and thus the model) can use to
>>> determine that it needs to do something else. The interrupt controller
>>> must be able to tell when the interrupt is "selected and serviced"
>>> somehow.
>> That's a case I can't understand.
>>
>> 1.  An device causes an edge-triggered interrupt A.
>> 2.  The interrupt controller sample the interrupt A, and setting pending
>> bit for A.
>> 3.  The interrupt controller select the interrupt  A to CPU and clean
>> the pending bit for A(according to the specification).

> I'm not a CLIC expert but from what I can tell I think the interrupt
> is only cleared after being read.
>
> The key lines in the spec are:
>
> "When a vectored interrupt is selected and serviced, the hardware will
> automatically clear the corresponding pending bit in edge-triggered
> mode."
>
> and
>
> "The xnxti CSR can be used by software to service the next horizontal
> interrupt..."
>
> The C-ABI code (https://github.com/riscv/riscv-fast-interrupt/blob/master/clic.adoc#81-c-abi-trampoline-code)
> seems to say something similar
>
>
>      csrrsi a0, mnxti, MIE   # Get highest current interrupt and enable
> interrupts.
>                              # Will return original interrupt if no
> others appear. (6)
Hi Alistair,

Thanks for your reply.

It is right if the interrupt routine really takes the C-ABI code. 
However, there may
be many other implementations for interrupt routine.

As the pending bit has been automatically cleaned by hardware, it will 
be unnecessary to
read xnxti in interrupt routine or access other registers to clean it, 
e.g. my RTOS case
never reads xnxti.

Zhiwei
> Does that sound right?
>
> Alistair
>
>
>> 4.  CPU start to execute the A's service routine.
>> 5.  Another device causes interrupt B.
>> 6.  The interrupt controller sample the interrupt B, and setting pending
>> bit for B.
>> 7.  As B's priority is lower than A, it can't preempt  A's service routine.
>> 8.  A's service routine return.
>> 9. No other interrupt comes after B.
>>
>> After the sequence, B is pending in interrupt controller, and has no
>> chance to be selected by interrupt controller.
>> A's service routine will neither write interrupt controller's register
>> nor device's register.
>>
>> In my RTOS case, the interrupt A here is really a software interrupt.
>> Just for clarity here.
>>
>> Thanks for sharing your ideas.
>>
>> Zhiwei
>>> thanks
>>> -- PMM


