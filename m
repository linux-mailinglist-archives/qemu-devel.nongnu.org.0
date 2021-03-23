Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EEC346DAD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:02:39 +0100 (CET)
Received: from localhost ([::1]:43132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOq2p-0003k3-1e
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lOq1U-0002xj-SP
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 19:01:16 -0400
Received: from 9.mo52.mail-out.ovh.net ([87.98.180.222]:51366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lOq1O-0007Mk-P1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 19:01:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 1CFF924AAE9;
 Wed, 24 Mar 2021 00:00:57 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 24 Mar
 2021 00:00:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0050bda1666-b517-474e-99bd-585d116782ff,
 A3683C8426EAFB0D53556ADBC9F5B6912A1CF25D) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 24 Mar 2021 00:00:56 +0100
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Crashes with qemu-system-ppc64
Message-ID: <20210324000056.349b6782@bahia.lan>
In-Reply-To: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
References: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c2d91622-43dd-4d1b-9a20-81fc4719105a
X-Ovh-Tracer-Id: 8298163790669584864
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudegjedgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=groug@kaod.org;
 helo=9.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing David

On Tue, 23 Mar 2021 17:48:36 +0100
Thomas Huth <thuth@redhat.com> wrote:

> 
> In case anyone is interested in fixing those, there are two regressions with 
> qemu-system-ppc64 in the current master branch:
> 
> $ ./qemu-system-ppc64 -M ppce500 -device macio-oldworld
> qemu-system-ppc64: ../../devel/qemu/softmmu/memory.c:2443: 
> memory_region_add_subregion_common: Assertion `!subregion->container' failed.
> 
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> /home/thuth/devel/qemu/include/hw/boards.h:24:MACHINE: Object 0x5635bd53af10 
> is not an instance of type machine
> Aborted (core dumped)
> 

I've bisected this one to:

3df261b6676b5850e93d6fab3f7a98f8ee8f19c5 is the first bad commit
commit 3df261b6676b5850e93d6fab3f7a98f8ee8f19c5
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Fri Mar 13 17:24:47 2020 +0000

    softmmu/vl.c: Handle '-cpu help' and '-device help' before 'no default machine'
    
    Currently if you try to ask for the list of CPUs for a target
    architecture which does not specify a default machine type
    you just get an error:
    
      $ qemu-system-arm -cpu help
      qemu-system-arm: No machine specified, and there is no default
      Use -machine help to list supported machines
    
    Since the list of CPUs doesn't depend on the machine, this is
    unnecessarily unhelpful. "-device help" has a similar problem.
    
    Move the checks for "did the user ask for -cpu help or -device help"
    up so they precede the select_machine() call which checks that the
    user specified a valid machine type.
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

 softmmu/vl.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)
bisect run success

This change is fine but it unveils a bad assumption.

0  0x00007ffff64a3708 in raise () at /lib64/power9/libc.so.6
#1  0x00007ffff6483bcc in abort () at /lib64/power9/libc.so.6
#2  0x00000001008db940 in object_dynamic_cast_assert
    (obj=0x10126f670, typename=0x100c20380 "machine", file=0x100b34878 "/home/greg/Work/qemu/qemu-ppc/include/hw/boards.h", line=<optimized out>, func=0x100bcd320 <__func__.30338> "MACHINE") at ../../qom/object.c:883
#3  0x0000000100456e00 in MACHINE (obj=<optimized out>) at /home/greg/Work/qemu/qemu-ppc/include/hw/boards.h:24
#4  0x0000000100456e00 in cpu_core_instance_init (obj=0x10118e2c0) at ../../hw/cpu/core.c:69
#5  0x00000001008d9f44 in object_init_with_type (obj=obj@entry=0x10118e2c0, ti=0x1011fd470) at ../../qom/object.c:375
#6  0x00000001008d9f24 in object_init_with_type (obj=obj@entry=0x10118e2c0, ti=0x101211ad0) at ../../qom/object.c:371
#7  0x00000001008d9f24 in object_init_with_type (obj=obj@entry=0x10118e2c0, ti=ti@entry=0x101212760) at ../../qom/object.c:371
#8  0x00000001008dc474 in object_initialize_with_type (obj=obj@entry=0x10118e2c0, size=size@entry=160, type=type@entry=0x101212760) at ../../qom/object.c:517
#9  0x00000001008dc678 in object_new_with_type (type=0x101212760) at ../../qom/object.c:732
#10 0x00000001009fbad8 in qmp_device_list_properties (typename=<optimized out>, errp=<optimized out>) at ../../qom/qom-qmp-cmds.c:146
#11 0x00000001005a4bf0 in qdev_device_help (opts=0x10126c200) at ../../softmmu/qdev-monitor.c:285
#12 0x0000000100760afc in device_help_func (opaque=<optimized out>, opts=<optimized out>, errp=<optimized out>) at ../../softmmu/vl.c:1204
#13 0x0000000100ad1050 in qemu_opts_foreach (list=<optimized out>, func=0x100760ae0 <device_help_func>, opaque=0x0, errp=0x0) at ../../util/qemu-option.c:1167
#14 0x00000001007653cc in qemu_process_help_options () at ../../softmmu/vl.c:2451
#15 0x00000001007653cc in qemu_init (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../../softmmu/vl.c:3521
#16 0x00000001002f4f88 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../../softmmu/main.c:49

Basically, "-device power8_v2.0-spapr-cpu-core,help" ends up
instantiating an object of the "power8_v2.0-spapr-cpu-core" type,
which derives from "cpu-core". The "cpu-core" type has an instance
init function that assumes that qdev_get_machine() returns an object
of type "machine"...

static void cpu_core_instance_init(Object *obj)
{
    MachineState *ms = MACHINE(qdev_get_machine());
                         ^^
                     ...here.

qdev_get_machine() cannot return a valid machine type since
select_machine() hasn't been called yet... an instance init
function is probably not the best place to use qdev_get_machine()
if any.

    CPUCore *core = CPU_CORE(obj);

    core->nr_threads = ms->smp.threads;
}

It seems that this should rather sit in a device realize function,
when the machine type is known.

>   Thomas
> 
> 


