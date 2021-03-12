Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A8133887B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:21:57 +0100 (CET)
Received: from localhost ([::1]:52826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdzY-000799-5S
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKdxf-0004wt-GV
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:20:00 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:50137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKdxY-000280-Dl
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:19:59 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07831848|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.272087-0.00506523-0.722848;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.Jk-FZq8_1615540784; 
Received: from 30.225.208.86(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Jk-FZq8_1615540784)
 by smtp.aliyun-inc.com(10.147.41.187);
 Fri, 12 Mar 2021 17:19:44 +0800
Subject: Re: Question about edge-triggered interrupt
To: Peter Maydell <peter.maydell@linaro.org>
References: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
 <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
 <3edf7903-94a7-c16e-2b9e-644e1a41a77d@c-sky.com>
 <CAFEAcA8UqE65Qxy=c53CCPdYnVrwvBZGxU9SH9qk7Q6vGKDgyg@mail.gmail.com>
 <50fb9541-095d-18e8-1145-662f594600b6@c-sky.com>
 <CAFEAcA-zRB8t4h7eLsw5FbFtyBp6Ow16P4vvk2eA9t7Jcr42TQ@mail.gmail.com>
 <854d74fd-ef10-af51-93c0-2d66792e604c@c-sky.com>
 <CAFEAcA9i+9=a7DvQW+4W3jLzocLvKU3+8RioMDJyvLGLaemr=g@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <fbb65e1c-c4a7-1367-6648-5fdc09750169@c-sky.com>
Date: Fri, 12 Mar 2021 17:19:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9i+9=a7DvQW+4W3jLzocLvKU3+8RioMDJyvLGLaemr=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/3/12 0:50, Peter Maydell wrote:
> On Thu, 11 Mar 2021 at 16:40, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>>
>> On 2021/3/12 0:07, Peter Maydell wrote:
>>> On Thu, 11 Mar 2021 at 16:01, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>> I'm pretty sure that there is some interaction between the CPU and the
>>> interrupt controller on a return-from-interrupt that you are
>>> missing.
>> I have asked my CPU design workmates. They said, "you have to pull a
>> pending interrupt at the interrupt return instruction".
>>
>> But I don't want to do this way, because it influences the interrupt
>> return instruction's behavior. The specification doesn't
>> point that explicitly. It's just our CPU implementation.
> If the hardware does it like that, your model of the hardware
> should do it like that. Don't invent QEMU-specific weirdness
> if you can avoid it.
>
> More generally, if the specification says that something has to
> happen when the CPU does an interrupt-return instruction, then the
> obvious implementation is to put suitable code in the helper function
> for the interrupt return instruction.
Good principle. Get it, thanks.
>> If I lock the iothread in interrupt return instruction helper function,
>> and pull a pending interrupt. It really works, but I don't think
>> it will be appropriate for other CPU implementation.
>>> There are several ways to do it in principle;
>> I am curious about the ways. If you like, a simple list please.
> So for instance:
> You can have an interrupt controller which holds a signal line
> to the CPU high while it has any pending interrupt. When the
> CPU executes return-from-interrupt this involves unblocking interrupts,
> and so if there's still another pending interrupt the CPU will just
> immediately take it, because the signal line is still high. Arm FIQ/IRQ
> with a GICv2 works like this. (It's also how QEMU handles the GICv3,
> which is not exactly the same as the typical h/w implementation.)
>
> You can have a more complicated scheme where the interrupt
> controller and the CPU are very tightly integrated, and so
> 'return from interrupt' executed by the CPU means "look at whatever
> is next up as the next highest priority interrupt and do that,
> possibly avoiding a bunch of stack frame unstack/stack actions".
> The Arm M-profile NVIC is like that.
Both work for me.  I think the CLIC is more similar to NVIC and the 
solution in GICv2
is more general. I will firstly add an implementation according to the 
NVIC solution.

Thanks very much. By the way, in my opinion, the signal line in GICv2 
solution is
something like "QEMU-specific weirdness" 😁.

Zhiwei
>
> thanks
> -- PMM


