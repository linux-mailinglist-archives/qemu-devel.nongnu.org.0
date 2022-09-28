Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5575EE3BC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:59:56 +0200 (CEST)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odbLf-0000ic-9k
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1odauE-0000ue-W1
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:31:36 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:46199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1odau9-0001JY-AO
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:31:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.108])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7D9A322B44;
 Wed, 28 Sep 2022 17:31:23 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 28 Sep
 2022 19:31:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0013b7d6039-1a6d-4b81-b0a5-eee9eed9e758,
 C75DA7A61898C88B8DB19AE4E08673D8991D436D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9b310cf0-6140-a397-0f7d-a752b1ba4072@kaod.org>
Date: Wed, 28 Sep 2022 19:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH v2 00/29] PowerPC interrupt rework
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: <danielhb413@gmail.com>, <david@gibson.dropbear.id.au>, <groug@kaod.org>, 
 <fbarrat@linux.ibm.com>, <alex.bennee@linaro.org>, <farosas@linux.ibm.com>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 26ed4106-61c8-4dae-9934-c48ac9c0e6e2
X-Ovh-Tracer-Id: 9576060184297966383
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegkedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptddthffgtdevveefuedtiedvgfeufeeitddujeeflefhgfefueegudeuudffhedvnecuffhomhgrihhnpehgnhhurdhorhhgpdhgihhthhhusgdrtghomhdpfhhrvggvsghsugdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello Matheus,

On 9/27/22 22:15, Matheus Ferst wrote:
> Link to v1: https://lists.gnu.org/archive/html/qemu-ppc/2022-08/msg00370.html
> This series is also available as a git branch: https://github.com/PPC64/qemu/tree/ferst-interrupt-fix-v2

This is impressive work on QEMU PPC.

> This version addresses Fabiano's feedback and fixes some issues found
> with the tests suggested by Cédric. While working on it, I found two
> intermittent problems on master:
> 
>   i) ~10% of boots with pSeries and 970/970mp/POWER5+ hard lockup after

These CPUs never got real attention with KVM. The FW was even broken
before 7.0.

>      either SCSI or network initialization when using -smp 4. With
>      -smp 2, the problem is harder to reproduce but still happens, and I
>      couldn't reproduce with thread=single.
> ii) ~52% of KVM guest initializations on PowerNV hang in different parts
>      of the boot process when using more than one CPU.

Do you mean when the guest is SMP or the host ?

> With the complete series applied, I couldn't reproduce (i) anymore, 

Super ! Models are getting better. This is nice for the 970.

> and (ii) became a little more frequent (~58%).

Have you checked 'info pic' ? XIVE is in charge of vCPU scheduling.
Could you please check with powersave=off in the host kernel also ?

> I've tested each patch of this series with [1], modified to use -smp for
> machines that support more than one CPU. The machines I can currently
> boot with FreeBSD (970/970,p/POWER5+/POWER7/POWER8/POWER9 pSeries,
> POWER8/POWER9 PowerNV, and mpc8544ds) were tested with the images from
> [2] and still boot after applying the patch series. Booting nested
> guests inside a TCG pSeries machine also seems to be working fine.
> 
> Using command lines like:
> 
> ./qemu-system-ppc64 -M powernv9 -cpu POWER9 -accel tcg,thread=multi \
>                  -m 8G -smp $SMP -vga none -nographic -kernel zImage \
>                  -append 'console=hvc0' -initrdootfs.cpio.xz \
>                  -serial pipe:pipe -monitor unix:mon,server,nowait
> 
> and
> 
> ./qemu-system-ppc64 -M pseries -cpu POWER9 -accel tcg,thread=multi \
>                  -m 8G -smp $SMP -vga none -nographic -kernel zImage \
>                  -append 'console=hvc0' -initrd rootfs.cpio.xz \
>                  -serial pipe:pipe -monitor unix:mon,server,nowait
> 
> to measure the time to boot, login, and shut down a compressed kernel
> with a buildroot initramfs, with 100 iteration we get:
> 
> +-----+------------------------------+-----------------------------+
> |     |            PowerNV           |           pSeries           |
> |-smp |------------------------------+-----------------------------+
> |     |     master    | patch series |    master    | patch series |
> +-----+------------------------------+-----------------------------+
> |  1  |  45,84 ± 0,92 | 38,08 ± 0,66 | 23,56 ± 1,16 | 23,76 ± 1,04 |
> |  2  |  80,21 ± 8,03 | 40,81 ± 0,45 | 26,59 ± 0,92 | 26,88 ± 0,99 |
> |  4  | 115,98 ± 9,85 | 38,80 ± 0,44 | 28,83 ± 0,84 | 28,46 ± 0,94 |
> |  6  | 199,14 ± 6,36 | 39,32 ± 0,50 | 29,22 ± 0,78 | 29,45 ± 0,86 |
> |  8  | 47,85 ± 27,50 | 38,98 ± 0,49 | 29,63 ± 0,80 | 29,60 ± 0,78 |
> +-----+------------------------------+-----------------------------+
> 
> This results shows that the problem reported in [3] is solved, while

Yes. Nice work ! The PowerNV results with -smp 8 on master are unexpected.
Did you do some profiling also ?
  
> pSeries boot time is essentially unchanged.
>
> 
> With a non-compressed kernel, the difference with PowerNV is smaller,
> and pSeries stills the same:
> 
> +-----+------------------------------+-----------------------------+
> |     |            PowerNV           |           pSeries           |
> |-smp |------------------------------+-----------------------------+
> |     |     master    | patch series |    master    | patch series |
> +-----+------------------------------+-----------------------------+
> |  1  |  42,17 ± 0,92 | 38,13 ± 0,59 | 23,15 ± 1,02 | 23,46 ± 1,02 |
> |  2  |  55,72 ± 3,54 | 40,30 ± 0,56 | 26,26 ± 0,82 | 26,38 ± 0,80 |
> |  4  |  67,09 ± 3,02 | 38,26 ± 0,47 | 28,36 ± 0,77 | 28,19 ± 0,78 |
> |  6  |  98,96 ± 2,49 | 39,01 ± 0,38 | 28,68 ± 0,75 | 29,02 ± 0,88 |
> |  8  |  39,68 ± 0,42 | 38,44 ± 0,41 | 29,24 ± 0,81 | 29,44 ± 0,75 |
> +-----+------------------------------+-----------------------------+
> 
> Finally, using command lines like
> 
> ./qemu-system-ppc64 -M powernv9 -cpu POWER9 -accel tcg,thread=multi \
>      -m 8G -smp 4 -device virtio-scsi-pci -boot c -vga none -nographic \
>      -device nvme,bus=pcie.2,addr=0x0,drive=drive0,serial=1234 \
>      -drive file=rootfs.ext2,if=none,id=drive0,format=raw,cache=none \
>      -snapshot -serial pipe:pipe -monitor unix:mon,server,nowait \
>      -kernel zImage -append 'console=hvc0 rootwait root=/dev/nvme0n1' \
>      -device virtio-net-pci,netdev=br0,mac=52:54:00:12:34:57,bus=pcie.0 \
>      -netdev bridge,id=br0
> 
> and
> 
> ./qemu-system-ppc64 -M pseries -cpu POWER9 -accel tcg,thread=multi \
>      -m 8G -smp 4 -device virtio-scsi-pci -boot c -vga none -nographic \
>      -drive file=rootfs.ext2,if=scsi,index=0,format=raw -snapshot \
>      -kernel zImage -append 'console=hvc0 rootwait root=/dev/sda' \
>      -serial pipe:pipe -monitor unix:mon,server,nowait \
>      -device virtio-net-pci,netdev=br0,mac=52:54:00:12:34:57 \
>      -netdev bridge,id=br0
> 
> to tests IO performance, with iperf to test network and a 4Gb scp
> transfer to test disk+network, in 100 iterations we saw:
> 
> +---------------------+---------------+-----------------+
> |                     |    scp (s)    |   iperf (MB/s)  |
> +---------------------+---------------+-----------------+
> |PowerNV master       | 166,91 ± 8,37 | 918,06 ± 114,78 |
> |PowerNV patch series | 166,25 ± 8,85 | 916,91 ± 107,56 |
> |pSeries master       | 175,70 ± 8,22 | 958,73 ± 115,09 |
> |pSeries patch series | 173,62 ± 8,13 | 893,42 ±  87,77 |
> +---------------------+---------------+-----------------+

These are SMP machines under high IO load using MTTCG. It means
that the models are quite robust now.

> The scp data shows little difference, while testing just network shows
> that it's a bit slower with the patch series applied (although, with
> this variation, we'd probably need to repeat this test more times to
> have a more robust result...)

You could try with powersave=off.

Thanks,

C.



> [1] https://github.com/legoater/qemu-ppc-boot
> [2] https://artifact.ci.freebsd.org/snapshot/14.0-CURRENT/latest_vm/powerpc
> [3] https://lists.gnu.org/archive/html/qemu-ppc/2022-06/msg00336.html
> 
> Matheus Ferst (29):
>    target/ppc: define PPC_INTERRUPT_* values directly
>    target/ppc: always use ppc_set_irq to set env->pending_interrupts
>    target/ppc: split interrupt masking and delivery from ppc_hw_interrupt
>    target/ppc: prepare to split interrupt masking and delivery by excp_model
>    target/ppc: create an interrupt masking method for POWER9/POWER10
>    target/ppc: remove unused interrupts from p9_pending_interrupt
>    target/ppc: create an interrupt deliver method for POWER9/POWER10
>    target/ppc: remove unused interrupts from p9_deliver_interrupt
>    target/ppc: remove generic architecture checks from p9_deliver_interrupt
>    target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER9
>    target/ppc: add power-saving interrupt masking logic to p9_next_unmasked_interrupt
>    target/ppc: create an interrupt masking method for POWER8
>    target/ppc: remove unused interrupts from p8_pending_interrupt
>    target/ppc: create an interrupt deliver method for POWER8
>    target/ppc: remove unused interrupts from p8_deliver_interrupt
>    target/ppc: remove generic architecture checks from p8_deliver_interrupt
>    target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER8
>    target/ppc: add power-saving interrupt masking logic to p8_next_unmasked_interrupt
>    target/ppc: create an interrupt masking method for POWER7
>    target/ppc: remove unused interrupts from p7_pending_interrupt
>    target/ppc: create an interrupt deliver method for POWER7
>    target/ppc: remove unused interrupts from p7_deliver_interrupt
>    target/ppc: remove generic architecture checks from p7_deliver_interrupt
>    target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER7
>    target/ppc: add power-saving interrupt masking logic to p7_next_unmasked_interrupt
>    target/ppc: remove ppc_store_lpcr from CONFIG_USER_ONLY builds
>    target/ppc: introduce ppc_maybe_interrupt
>    target/ppc: unify cpu->has_work based on cs->interrupt_request
>    target/ppc: move the p*_interrupt_powersave methods to excp_helper.c
> 
>   hw/ppc/pnv_core.c        |   1 +
>   hw/ppc/ppc.c             |  17 +-
>   hw/ppc/spapr_hcall.c     |   6 +
>   hw/ppc/spapr_rtas.c      |   2 +-
>   hw/ppc/trace-events      |   2 +-
>   target/ppc/cpu.c         |   4 +
>   target/ppc/cpu.h         |  43 +-
>   target/ppc/cpu_init.c    | 212 +---------
>   target/ppc/excp_helper.c | 857 ++++++++++++++++++++++++++++++++++-----
>   target/ppc/helper.h      |   1 +
>   target/ppc/helper_regs.c |   2 +
>   target/ppc/misc_helper.c |  11 +-
>   target/ppc/translate.c   |   2 +
>   13 files changed, 803 insertions(+), 357 deletions(-)
> 


