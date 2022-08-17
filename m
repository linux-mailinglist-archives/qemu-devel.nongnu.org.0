Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75165967DE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 05:54:38 +0200 (CEST)
Received: from localhost ([::1]:36278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOA8b-0002kj-Fi
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 23:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1oOA73-0001Pp-AV
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 23:53:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45420 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1oOA70-0006oZ-Bc
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 23:53:01 -0400
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx72sQZvxiVA8DAA--.12865S3; 
 Wed, 17 Aug 2022 11:52:48 +0800 (CST)
Message-ID: <71c432d3-e9bd-08a3-4264-7f8644497ba6@loongson.cn>
Date: Wed, 17 Aug 2022 11:52:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH for-7.1 3/4] target/loongarch: rename the TCG CPU "la464"
 to "qemu64-v1.00"
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 WANG Xuerui <git@xen0n.name>
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-4-i.qemu@xen0n.name>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <20220814145522.1474927-4-i.qemu@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx72sQZvxiVA8DAA--.12865S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWF1xJr13tw17ZFyUZFy8uFg_yoWrZw15pF
 W3ZF1xKF4xJrZrJas5Jas8WF1DAr4xGay2vF13tr1Ska98uryDWw48t3yv9FWj9aykXr40
 vFs5J3W3Z3WUX3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
 6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07
 beAp5UUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

QEMU64 cpu model can be added, however la464 cpu model should be kept here
still. Actually there is no formal micro-achitecture name for loongarch, I
prefer to la464 still :)

Also host cpu model can be added later, which has the same features with
host processor. What is meaning for QEMU64/KVM64 cpu model? Does it mean
that minimum required CPU features for current popular OSV?

regards
bibo,mao


在 2022/8/14 22:55, WANG Xuerui 写道:
> From: WANG Xuerui <git@xen0n.name>
> 
> The only LoongArch CPU implemented is modeled after the Loongson 3A5000,
> but it is not the real thing, and at least one feature [1] is missing
> that actually made the model incompatible with the real 3A5000. What's
> more, the model is currently named "la464", while none of the
> micro-architecture-specific things are currently present, further making
> things needlessly complex.
> 
> In general, high-fidelity models can and should be named after the real
> hardware model, while generic emulation-oriented models should be named
> after ISA levels. For now, the best reference for LoongArch ISA levels
> is the revision number of the LoongArch ISA Manual, of which v1.00 is
> still the latest. (v1.01 and v1.02 are minor revisions without
> substantive change.)
> 
> As defined by various specs, the vendor and model names are also
> reflected in respective CSRs, and are 8 bytes long. So, rename "la464"
> to "qemu64-v1.00", with "QEMU64" as vendor name and "v1.00" as model
> name.
> 
> As the QEMU 7.1 hasn't been officially released, no downstream is
> expected to depend on the old name, so this change should be safe for
> 7.1.
> 
> [1]: https://lore.kernel.org/loongarch/20220726094049.7200-2-maobibo@loongson.cn/
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  hw/loongarch/virt.c    | 14 ++------------
>  target/loongarch/cpu.c |  6 +++---
>  2 files changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 5cc0b05538..35e2174a17 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -626,7 +626,6 @@ static void loongarch_direct_kernel_boot(LoongArchMachineState *lams)
>  static void loongarch_init(MachineState *machine)
>  {
>      LoongArchCPU *lacpu;
> -    const char *cpu_model = machine->cpu_type;
>      ram_addr_t offset = 0;
>      ram_addr_t ram_size = machine->ram_size;
>      uint64_t highram_size = 0;
> @@ -634,15 +633,6 @@ static void loongarch_init(MachineState *machine)
>      LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
>      int i;
>  
> -    if (!cpu_model) {
> -        cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
> -    }
> -
> -    if (!strstr(cpu_model, "la464")) {
> -        error_report("LoongArch/TCG needs cpu type la464");
> -        exit(1);
> -    }
> -
>      if (ram_size < 1 * GiB) {
>          error_report("ram_size must be greater than 1G.");
>          exit(1);
> @@ -749,10 +739,10 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
>  
> -    mc->desc = "Loongson-3A5000 LS7A1000 machine";
> +    mc->desc = "LoongArch64 v1.00-compatible LS7A1000 machine";
>      mc->init = loongarch_init;
>      mc->default_ram_size = 1 * GiB;
> -    mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("la464");
> +    mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("qemu64-v1.00");
>      mc->default_ram_id = "loongarch.ram";
>      mc->max_cpus = LOONGARCH_MAX_VCPUS;
>      mc->is_default = 1;
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 4663539443..0a41509a0c 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -527,9 +527,9 @@ static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
>          return 1ULL << IOCSRF_MSI | 1ULL << IOCSRF_EXTIOI |
>                 1ULL << IOCSRF_CSRIPI;
>      case VENDOR_REG:
> -        return 0x6e6f73676e6f6f4cULL; /* "Loongson" */
> +        return 0x3436554d4551ULL; /* "QEMU64" */
>      case CPUNAME_REG:
> -        return 0x303030354133ULL;     /* "3A5000" */
> +        return 0x30302e3176ULL;   /* "v1.00" */
>      case MISC_FUNC_REG:
>          return 1ULL << IOCSRM_EXTIOI_EN;
>      }
> @@ -715,7 +715,7 @@ static const TypeInfo loongarch_cpu_type_infos[] = {
>          .class_size = sizeof(LoongArchCPUClass),
>          .class_init = loongarch_cpu_class_init,
>      },
> -    DEFINE_LOONGARCH_CPU_TYPE("la464", loongarch_la464_initfn),
> +    DEFINE_LOONGARCH_CPU_TYPE("qemu64-v1.00", loongarch_la464_initfn),
>  };
>  
>  DEFINE_TYPES(loongarch_cpu_type_infos)


