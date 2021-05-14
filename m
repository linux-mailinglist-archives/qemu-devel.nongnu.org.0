Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBD3809EF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:55:10 +0200 (CEST)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhXLR-0005yh-H6
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lhXFD-0000zp-IM
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:48:43 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lhXFA-0007JK-Lr
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:48:43 -0400
Received: from [192.168.2.107] (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9C83220771;
 Fri, 14 May 2021 12:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620996515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ys/amGZzD7t2kZ3kaJEl/33RrdytjycvTdtsvtX078=;
 b=RLO3pkKHIpvyVQvbQDiqTQBZ40vUwV8nABDz2Q4vqEmWYADBJ+PyXky7LhqCC2O+8SrfSk
 E8AXMncutWm5XGVnnSPrlZ7ul/g1CycnAR8mFNAI5/BUsVVTl1JneofBx7lbfkGYlx9oQR
 +HbfqY4cgoJssRyRSBJ7BcDcEA30wbE=
Subject: Re: [RFC PATCH 0/9] Initial support for machine creation via QMP
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
From: Mirela Grujic <mirela.grujic@greensocs.com>
Message-ID: <5210646b-c661-882d-6c8d-0fd1772342d2@greensocs.com>
Date: Fri, 14 May 2021 14:48:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mirela.grujic@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 mark.burton@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,


Thanks for the feedback!


On 5/13/21 7:52 PM, Paolo Bonzini wrote:
> Hi Mirela, this is very interesting!
>
> It's unfortunate that I completely missed the discussions in 
> January/February.  You might have noticed that in the 5.2/6.0 
> timeframe I worked on cleaning up the machine initialization phases 
> and qemu_init.  The idea behind the cleanup was to identify clearly 
> the steps from one phase to the next.  I am very happy that you are 
> already benefitting from that work in this series and you were able to 
> make a prototype with so little code.


I was really happy to see your changes in 6.0, they simplified the 
implementation a lot. It looked like you're up to something bigger, and 
I'm glad that we can sync up now.


>
> My plan was a bit more ambitious though :) and it is laid out at 
> https://wiki.qemu.org/User:Paolo_Bonzini/Machine_init_sequence.
>
> My plan was to have completely different binaries than the current 
> qemu-system-*.  These would only have a handful of command line 
> options (such as -name, -sandbox, -trace, -L) and would open a QMP 
> connection on stdio.
>
> All other command line option would be either considered legacy or 
> adjusted to be part of two new QMP commands, machine-set and 
> accel-set, which would advance through the phases like this:
>
> PHASE_NO_MACHINE
>    -> machine-set -> PHASE_MACHINE_CREATED ->
>    -> accel-set -> PHASE_ACCEL_CREATED -> PHASE_MACHINE_INITIALIZED ->
>    -> finish-machine-init -> PHASE_MACHINE_READY
>    -> cont
>
> I think this idea would work well with your plan below, because the 
> preconfiguration that you need to do happens mostly at 
> PHASE_MACHINE_INITIALIZED.
>
> Of course, the disadvantage of my approach is that, in the initial 
> version, a lot of capabilities of QEMU are not available (especially 
> with respect to the UI, since there's no "display-add" command). 
> However, the basic implementation of machine-set and accel-set should 
> not really be *that* much more work, and it should be doable in 
> parallel with the conversion efforts for those options.  For example, 
> today I posted a series that maps -smp to -M (and then, SMP 
> configuration would automatically become available in machine-set).


With our approach, transitioning to the QMP configuration suppose to 
happen gradually, i.e. we still specify some configuration options via 
command line. For your approach to be applicable to our use case we 
would at least need a QMP equivalent for the following:

qemu-system-riscv64 \
     -M sifive_dt \
     -cpu 
rv64,i=true,g=false,m=true,a=true,f=true,d=true,c=true,s=false,u=false,x-b=true,pmp=true,mmu=false,num-pmp-regions=8 
\
     -smp 1 \
     -device ...

AFAIU from the materials you shared, we would need to add -cpu and 
-device, but I don't see any reason why we wouldn't do this.


>
> I have placed the skeleton of the work I was doing at 
> https://gitlab.com/bonzini/qemu/ in the branch qemu-qmp-targets. You 
> can see a sample execution at 
> https://asciinema.org/a/TXMX8EZh8Md0fZnuE7uhfv6cO.  I have not touched 
> some of the patches in a long time, but I plan to give them a quick 
> test tomorrow.  Starting from the code in that branch, it should not 
> be hard to implement the machine-set and accel-set commands in the 
> same fashion as QEMU 5.2's implementation of object-add.
>

Ok, please let me know once you test, then I would run your code and 
play with it to better understand what needs to be done. Then I might 
come back with a couple of questions, so that we align on the TODOs. Is 
that ok with you?

Btw, when (in which version) did you plan to integrate the qemu-qmp-* 
support? I guess once machine-set/accel-set is implemented, but maybe 
I'm wrong...


> Thanks for posting these patches, I have started a light review of them.
>

If we would add the support for our use case to your approach, then this 
series would likely be split into a couple of patches that are 
applicable and the rest that is obsolete.


In summary, we believe it would be great to join efforts, please let us 
know how can we help.


Thanks,

Mirela


> Paolo
>
> On 13/05/21 10:25, Mirela Grujic wrote:
>> The direction for this work has been set in the discussion thread:
>> "About creating machines on the command line" in January/February 2021:
>> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01839.html
>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg01070.html
>>
>> To customize a machine via QMP we need the ability to stop QEMU at a 
>> specific
>> machine initialization phase.
>>
>> Currently, machine initialization phases are:
>> 1) no-machine: machine does not exist yet (current_machine == NULL)
>> 2) machine-created: machine exists, but its accelerator does not
>>     (current_machine->accelerator == NULL)
>> 3) accel-created: machine's accelerator is configured
>>     (current_machine->accelerator != NULL), but machine class's 
>> init() has not
>>     been called (no properties validated, machine_init_done notifiers 
>> not
>>     registered, no sysbus, etc.)
>> 4) initialized: machine class's init() has been called, thus machine 
>> properties
>>     are validated, machine_init_done notifiers registered, sysbus 
>> realized, etc.
>>     Devices added at this phase are considered to be cold-plugged.
>> 5) ready: machine_init_done notifiers are called, then QEMU is ready 
>> to start
>>     CPUs. Devices added at this phase are considered to be hot-plugged.
>>
>> QEMU can be stopped today using the -preconfig CLI option at phase 3
>> (accel-created). This option was introduced to enable the QMP 
>> configuration of
>> parameters that affect the machine initialization. We cannot add 
>> devices at
>> this point because the machine class's init() has not been called, 
>> thus sysbus
>> does not exist yet (a device cannot be added because there is no bus 
>> to attach
>> it to).
>>
>> QEMU can be also stopped using the -S CLI option at the machine ready 
>> phase.
>> However, it is too late to add devices at this phase because the 
>> machine is
>> already configured, and any devices added at this point are 
>> considered to be
>> hot-plugged.
>>
>> Since the existing -preconfig CLI option stops QEMU too early, and 
>> the -S option
>> stops too late, we need a way to stop QEMU in between (after the 
>> machine is
>> initialized and before it becomes ready).
>

