Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBF8324FE1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 13:35:03 +0100 (CET)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFFrB-0002FI-Ho
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 07:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lFFpr-0001hW-Gb
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:33:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lFFpn-0000dn-4v
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614256414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5hluzPxKhGLHndHrRnkg80xKmozAJm9iqCk0W6N/SHE=;
 b=U0o+NSgwgXewQnHvU7jPYXl0W22CJfzDNj8rkvSjgDzg/PGoMEsMn7RUNx+KKLMLqwOTXy
 VKbNaU+jtNP5a89Ep5ZZ1tWetRL2dAEShIbQwb82R+Sn1d6WzLHpSMOpNpgCpSh4iF/x62
 wNjcFiMQ/0amvjqOWJjh2+/sfLscj6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-RmIvxRjcM96j_6dfc6aWRA-1; Thu, 25 Feb 2021 07:33:32 -0500
X-MC-Unique: RmIvxRjcM96j_6dfc6aWRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38924107ACE4;
 Thu, 25 Feb 2021 12:33:30 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2741189C7;
 Thu, 25 Feb 2021 12:32:58 +0000 (UTC)
Subject: Re: [PATCH 06/14] machine: remove 'query-cpus' QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-7-berrange@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <8415113b-a705-aa11-5bcc-d11e26efbc31@redhat.com>
Date: Thu, 25 Feb 2021 09:32:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224131142.1952027-7-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/24/21 10:11 AM, Daniel P. Berrangé wrote:
> The newer 'query-cpus-fast' command avoids side effects on the guest
> execution. Note that some of the field names are different in the
> 'query-cpus-fast' command.
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   docs/system/deprecated.rst                 |   5 -
>   docs/system/removed-features.rst           |   5 +
>   hw/core/machine-hmp-cmds.c                 |   8 +-
>   hw/core/machine-qmp-cmds.c                 |  79 ----------
>   qapi/machine.json                          | 161 +--------------------
>   tests/acceptance/pc_cpu_hotplug_props.py   |   2 +-
>   tests/acceptance/x86_cpu_model_versions.py |   2 +-
>   tests/migration/guestperf/engine.py        |   2 +-
>   tests/qtest/numa-test.c                    |   6 +-
>   tests/qtest/qmp-test.c                     |   6 +-
>   tests/qtest/test-x86-cpuid-compat.c        |   4 +-
>   11 files changed, 22 insertions(+), 258 deletions(-)
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index e214f0a9cf..484f017119 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -192,11 +192,6 @@ Since the ``dirty-bitmaps`` field is optionally present in both the old and
>   new locations, clients must use introspection to learn where to anticipate
>   the field if/when it does appear in command output.
>   
> -``query-cpus`` (since 2.12.0)
> -'''''''''''''''''''''''''''''
> -
> -The ``query-cpus`` command is replaced by the ``query-cpus-fast`` command.
> -
>   ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
>   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index 2c5513dcc7..ad146daf9b 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -95,6 +95,11 @@ Use ``migrate_set_parameter`` and ``info migrate_parameters`` instead.
>   
>   Use ``migrate_set_parameter`` instead.
>   
> +``query-cpus`` (removed in 6.0)
> +'''''''''''''''''''''''''''''''
> +
> +The ``query-cpus`` command is replaced by the ``query-cpus-fast`` command.
> +
>   Human Monitor Protocol (HMP) commands
>   -------------------------------------
>   
> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
> index 6357be9c6b..58248cffa3 100644
> --- a/hw/core/machine-hmp-cmds.c
> +++ b/hw/core/machine-hmp-cmds.c
> @@ -130,7 +130,7 @@ void hmp_info_numa(Monitor *mon, const QDict *qdict)
>   {
>       int i, nb_numa_nodes;
>       NumaNodeMem *node_mem;
> -    CpuInfoList *cpu_list, *cpu;
> +    CpuInfoFastList *cpu_list, *cpu;
>       MachineState *ms = MACHINE(qdev_get_machine());
>   
>       nb_numa_nodes = ms->numa_state ? ms->numa_state->num_nodes : 0;
> @@ -139,7 +139,7 @@ void hmp_info_numa(Monitor *mon, const QDict *qdict)
>           return;
>       }
>   
> -    cpu_list = qmp_query_cpus(&error_abort);
> +    cpu_list = qmp_query_cpus_fast(&error_abort);
>       node_mem = g_new0(NumaNodeMem, nb_numa_nodes);
>   
>       query_numa_node_mem(node_mem, ms);
> @@ -148,7 +148,7 @@ void hmp_info_numa(Monitor *mon, const QDict *qdict)
>           for (cpu = cpu_list; cpu; cpu = cpu->next) {
>               if (cpu->value->has_props && cpu->value->props->has_node_id &&
>                   cpu->value->props->node_id == i) {
> -                monitor_printf(mon, " %" PRIi64, cpu->value->CPU);
> +                monitor_printf(mon, " %" PRIi64, cpu->value->cpu_index);
>               }
>           }
>           monitor_printf(mon, "\n");
> @@ -157,6 +157,6 @@ void hmp_info_numa(Monitor *mon, const QDict *qdict)
>           monitor_printf(mon, "node %d plugged: %" PRId64 " MB\n", i,
>                          node_mem[i].node_plugged_mem >> 20);
>       }
> -    qapi_free_CpuInfoList(cpu_list);
> +    qapi_free_CpuInfoFastList(cpu_list);
>       g_free(node_mem);
>   }
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 44e979e503..af60cd969d 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -24,85 +24,6 @@
>   #include "sysemu/runstate.h"
>   #include "sysemu/sysemu.h"
>   
> -CpuInfoList *qmp_query_cpus(Error **errp)
> -{
> -    MachineState *ms = MACHINE(qdev_get_machine());
> -    MachineClass *mc = MACHINE_GET_CLASS(ms);
> -    CpuInfoList *head = NULL, **tail = &head;
> -    CPUState *cpu;
> -
> -    CPU_FOREACH(cpu) {
> -        CpuInfo *value;
> -#if defined(TARGET_I386)
> -        X86CPU *x86_cpu = X86_CPU(cpu);
> -        CPUX86State *env = &x86_cpu->env;
> -#elif defined(TARGET_PPC)
> -        PowerPCCPU *ppc_cpu = POWERPC_CPU(cpu);
> -        CPUPPCState *env = &ppc_cpu->env;
> -#elif defined(TARGET_SPARC)
> -        SPARCCPU *sparc_cpu = SPARC_CPU(cpu);
> -        CPUSPARCState *env = &sparc_cpu->env;
> -#elif defined(TARGET_RISCV)
> -        RISCVCPU *riscv_cpu = RISCV_CPU(cpu);
> -        CPURISCVState *env = &riscv_cpu->env;
> -#elif defined(TARGET_MIPS)
> -        MIPSCPU *mips_cpu = MIPS_CPU(cpu);
> -        CPUMIPSState *env = &mips_cpu->env;
> -#elif defined(TARGET_TRICORE)
> -        TriCoreCPU *tricore_cpu = TRICORE_CPU(cpu);
> -        CPUTriCoreState *env = &tricore_cpu->env;
> -#elif defined(TARGET_S390X)
> -        S390CPU *s390_cpu = S390_CPU(cpu);
> -        CPUS390XState *env = &s390_cpu->env;
> -#endif
> -
> -        cpu_synchronize_state(cpu);
> -
> -        value = g_malloc0(sizeof(*value));
> -        value->CPU = cpu->cpu_index;
> -        value->current = (cpu == first_cpu);
> -        value->halted = cpu->halted;
> -        value->qom_path = object_get_canonical_path(OBJECT(cpu));
> -        value->thread_id = cpu->thread_id;
> -#if defined(TARGET_I386)
> -        value->arch = CPU_INFO_ARCH_X86;
> -        value->u.x86.pc = env->eip + env->segs[R_CS].base;
> -#elif defined(TARGET_PPC)
> -        value->arch = CPU_INFO_ARCH_PPC;
> -        value->u.ppc.nip = env->nip;
> -#elif defined(TARGET_SPARC)
> -        value->arch = CPU_INFO_ARCH_SPARC;
> -        value->u.q_sparc.pc = env->pc;
> -        value->u.q_sparc.npc = env->npc;
> -#elif defined(TARGET_MIPS)
> -        value->arch = CPU_INFO_ARCH_MIPS;
> -        value->u.q_mips.PC = env->active_tc.PC;
> -#elif defined(TARGET_TRICORE)
> -        value->arch = CPU_INFO_ARCH_TRICORE;
> -        value->u.tricore.PC = env->PC;
> -#elif defined(TARGET_S390X)
> -        value->arch = CPU_INFO_ARCH_S390;
> -        value->u.s390.cpu_state = env->cpu_state;
> -#elif defined(TARGET_RISCV)
> -        value->arch = CPU_INFO_ARCH_RISCV;
> -        value->u.riscv.pc = env->pc;
> -#else
> -        value->arch = CPU_INFO_ARCH_OTHER;
> -#endif
> -        value->has_props = !!mc->cpu_index_to_instance_props;
> -        if (value->has_props) {
> -            CpuInstanceProperties *props;
> -            props = g_malloc0(sizeof(*props));
> -            *props = mc->cpu_index_to_instance_props(ms, cpu->cpu_index);
> -            value->props = props;
> -        }
> -
> -        QAPI_LIST_APPEND(tail, value);
> -    }
> -
> -    return head;
> -}
> -
>   static CpuInfoArch sysemu_target_to_cpuinfo_arch(SysEmuTarget target)
>   {
>       /*
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 330189efe3..9811927504 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -38,7 +38,7 @@
>   # @CpuInfoArch:
>   #
>   # An enumeration of cpu types that enable additional information during
> -# @query-cpus and @query-cpus-fast.
> +# @query-cpus-fast.
>   #
>   # @s390: since 2.12
>   #
> @@ -49,114 +49,6 @@
>   { 'enum': 'CpuInfoArch',
>     'data': ['x86', 'sparc', 'ppc', 'mips', 'tricore', 's390', 'riscv', 'other' ] }
>   
> -##
> -# @CpuInfo:
> -#
> -# Information about a virtual CPU
> -#
> -# @CPU: the index of the virtual CPU
> -#
> -# @current: this only exists for backwards compatibility and should be ignored
> -#
> -# @halted: true if the virtual CPU is in the halt state.  Halt usually refers
> -#          to a processor specific low power mode.
> -#
> -# @qom_path: path to the CPU object in the QOM tree (since 2.4)
> -#
> -# @thread_id: ID of the underlying host thread
> -#
> -# @props: properties describing to which node/socket/core/thread
> -#         virtual CPU belongs to, provided if supported by board (since 2.10)
> -#
> -# @arch: architecture of the cpu, which determines which additional fields
> -#        will be listed (since 2.6)
> -#
> -# Since: 0.14
> -#
> -# Notes: @halted is a transient state that changes frequently.  By the time the
> -#        data is sent to the client, the guest may no longer be halted.
> -##
> -{ 'union': 'CpuInfo',
> -  'base': {'CPU': 'int', 'current': 'bool', 'halted': 'bool',
> -           'qom_path': 'str', 'thread_id': 'int',
> -           '*props': 'CpuInstanceProperties', 'arch': 'CpuInfoArch' },
> -  'discriminator': 'arch',
> -  'data': { 'x86': 'CpuInfoX86',
> -            'sparc': 'CpuInfoSPARC',
> -            'ppc': 'CpuInfoPPC',
> -            'mips': 'CpuInfoMIPS',
> -            'tricore': 'CpuInfoTricore',
> -            's390': 'CpuInfoS390',
> -            'riscv': 'CpuInfoRISCV' } }
> -
> -##
> -# @CpuInfoX86:
> -#
> -# Additional information about a virtual i386 or x86_64 CPU
> -#
> -# @pc: the 64-bit instruction pointer
> -#
> -# Since: 2.6
> -##
> -{ 'struct': 'CpuInfoX86', 'data': { 'pc': 'int' } }
> -
> -##
> -# @CpuInfoSPARC:
> -#
> -# Additional information about a virtual SPARC CPU
> -#
> -# @pc: the PC component of the instruction pointer
> -#
> -# @npc: the NPC component of the instruction pointer
> -#
> -# Since: 2.6
> -##
> -{ 'struct': 'CpuInfoSPARC', 'data': { 'pc': 'int', 'npc': 'int' } }
> -
> -##
> -# @CpuInfoPPC:
> -#
> -# Additional information about a virtual PPC CPU
> -#
> -# @nip: the instruction pointer
> -#
> -# Since: 2.6
> -##
> -{ 'struct': 'CpuInfoPPC', 'data': { 'nip': 'int' } }
> -
> -##
> -# @CpuInfoMIPS:
> -#
> -# Additional information about a virtual MIPS CPU
> -#
> -# @PC: the instruction pointer
> -#
> -# Since: 2.6
> -##
> -{ 'struct': 'CpuInfoMIPS', 'data': { 'PC': 'int' } }
> -
> -##
> -# @CpuInfoTricore:
> -#
> -# Additional information about a virtual Tricore CPU
> -#
> -# @PC: the instruction pointer
> -#
> -# Since: 2.6
> -##
> -{ 'struct': 'CpuInfoTricore', 'data': { 'PC': 'int' } }
> -
> -##
> -# @CpuInfoRISCV:
> -#
> -# Additional information about a virtual RISCV CPU
> -#
> -# @pc: the instruction pointer
> -#
> -# Since 2.12
> -##
> -{ 'struct': 'CpuInfoRISCV', 'data': { 'pc': 'int' } }
> -
>   ##
>   # @CpuS390State:
>   #
> @@ -180,53 +72,6 @@
>   ##
>   { 'struct': 'CpuInfoS390', 'data': { 'cpu-state': 'CpuS390State' } }
>   
> -##
> -# @query-cpus:
> -#
> -# Returns a list of information about each virtual CPU.
> -#
> -# This command causes vCPU threads to exit to userspace, which causes
> -# a small interruption to guest CPU execution. This will have a negative
> -# impact on realtime guests and other latency sensitive guest workloads.
> -#
> -# Features:
> -# @deprecated: This command is deprecated, because it interferes with
> -#              the guest.  Use 'query-cpus-fast' instead to avoid the vCPU
> -#              interruption.
> -#
> -# Returns: a list of @CpuInfo for each virtual CPU
> -#
> -# Since: 0.14
> -#
> -# Example:
> -#
> -# -> { "execute": "query-cpus" }
> -# <- { "return": [
> -#          {
> -#             "CPU":0,
> -#             "current":true,
> -#             "halted":false,
> -#             "qom_path":"/machine/unattached/device[0]",
> -#             "arch":"x86",
> -#             "pc":3227107138,
> -#             "thread_id":3134
> -#          },
> -#          {
> -#             "CPU":1,
> -#             "current":false,
> -#             "halted":true,
> -#             "qom_path":"/machine/unattached/device[2]",
> -#             "arch":"x86",
> -#             "pc":7108165,
> -#             "thread_id":3135
> -#          }
> -#       ]
> -#    }
> -#
> -##
> -{ 'command': 'query-cpus', 'returns': ['CpuInfo'],
> -  'features': [ 'deprecated' ] }
> -
>   ##
>   # @CpuInfoFast:
>   #
> @@ -266,9 +111,7 @@
>   ##
>   # @query-cpus-fast:
>   #
> -# Returns information about all virtual CPUs. This command does not
> -# incur a performance penalty and should be used in production
> -# instead of query-cpus.
> +# Returns information about all virtual CPUs.
>   #
>   # Returns: list of @CpuInfoFast
>   #
> diff --git a/tests/acceptance/pc_cpu_hotplug_props.py b/tests/acceptance/pc_cpu_hotplug_props.py
> index e49bf33fc5..f48f68fc6b 100644
> --- a/tests/acceptance/pc_cpu_hotplug_props.py
> +++ b/tests/acceptance/pc_cpu_hotplug_props.py
> @@ -32,4 +32,4 @@ def test_no_die_id(self):
>           self.vm.add_args('-cpu', 'qemu64')
>           self.vm.add_args('-device', 'qemu64-x86_64-cpu,socket-id=1,core-id=0,thread-id=0')
>           self.vm.launch()
> -        self.assertEquals(len(self.vm.command('query-cpus')), 2)
> +        self.assertEquals(len(self.vm.command('query-cpus-fast')), 2)
> diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/acceptance/x86_cpu_model_versions.py
> index 2b7461bb41..77ed8597a4 100644
> --- a/tests/acceptance/x86_cpu_model_versions.py
> +++ b/tests/acceptance/x86_cpu_model_versions.py
> @@ -246,7 +246,7 @@ class CascadelakeArchCapabilities(avocado_qemu.Test):
>       :avocado: tags=arch:x86_64
>       """
>       def get_cpu_prop(self, prop):
> -        cpu_path = self.vm.command('query-cpus')[0].get('qom_path')
> +        cpu_path = self.vm.command('query-cpus-fast')[0].get('qom-path')
>           return self.vm.command('qom-get', path=cpu_path, property=prop)


The changes for the two functional tests look good to me. Also I ran 
them locally and passed. So:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

- Wainer

>   
>       def test_4_1(self):
> diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
> index 5161e4ff81..5c965140f8 100644
> --- a/tests/migration/guestperf/engine.py
> +++ b/tests/migration/guestperf/engine.py
> @@ -110,7 +110,7 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
>           src_vcpu_time = []
>           src_pid = src.get_pid()
>   
> -        vcpus = src.command("query-cpus")
> +        vcpus = src.command("query-cpus-fast")
>           src_threads = []
>           for vcpu in vcpus:
>               src_threads.append(vcpu["thread_id"])
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index b25ebf97d8..dc0ec571ca 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -72,7 +72,7 @@ static void test_mon_partial(const void *data)
>   
>   static QList *get_cpus(QTestState *qts, QDict **resp)
>   {
> -    *resp = qtest_qmp(qts, "{ 'execute': 'query-cpus' }");
> +    *resp = qtest_qmp(qts, "{ 'execute': 'query-cpus-fast' }");
>       g_assert(*resp);
>       g_assert(qdict_haskey(*resp, "return"));
>       return qdict_get_qlist(*resp, "return");
> @@ -97,10 +97,10 @@ static void test_query_cpus(const void *data)
>           int64_t cpu_idx, node;
>   
>           cpu = qobject_to(QDict, e);
> -        g_assert(qdict_haskey(cpu, "CPU"));
> +        g_assert(qdict_haskey(cpu, "cpu-index"));
>           g_assert(qdict_haskey(cpu, "props"));
>   
> -        cpu_idx = qdict_get_int(cpu, "CPU");
> +        cpu_idx = qdict_get_int(cpu, "cpu-index");
>           props = qdict_get_qdict(cpu, "props");
>           g_assert(qdict_haskey(props, "node-id"));
>           node = qdict_get_int(props, "node-id");
> diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
> index 11614bf63f..cd27fae3de 100644
> --- a/tests/qtest/qmp-test.c
> +++ b/tests/qtest/qmp-test.c
> @@ -252,7 +252,7 @@ static void test_qmp_oob(void)
>        * Try any command that does not support OOB but with OOB flag. We
>        * should get failure.
>        */
> -    resp = qtest_qmp(qts, "{ 'exec-oob': 'query-cpus' }");
> +    resp = qtest_qmp(qts, "{ 'exec-oob': 'query-cpus-fast' }");
>       g_assert(qdict_haskey(resp, "error"));
>       qobject_unref(resp);
>   
> @@ -289,7 +289,7 @@ static void test_qmp_preconfig(void)
>       g_assert(!qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'query-commands' }")));
>   
>       /* forbidden commands, expected error */
> -    g_assert(qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'query-cpus' }")));
> +    g_assert(qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'query-cpus-fast' }")));
>   
>       /* check that query-status returns preconfig state */
>       rsp = qtest_qmp(qs, "{ 'execute': 'query-status' }");
> @@ -313,7 +313,7 @@ static void test_qmp_preconfig(void)
>       g_assert(qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'x-exit-preconfig' }")));
>   
>       /* enabled commands, no error expected  */
> -    g_assert(!qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'query-cpus' }")));
> +    g_assert(!qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'query-cpus-fast' }")));
>   
>       qtest_quit(qs);
>   }
> diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-cpuid-compat.c
> index 7ca1883a29..2ac169faf0 100644
> --- a/tests/qtest/test-x86-cpuid-compat.c
> +++ b/tests/qtest/test-x86-cpuid-compat.c
> @@ -13,12 +13,12 @@ static char *get_cpu0_qom_path(void)
>       QDict *cpu0;
>       char *path;
>   
> -    resp = qmp("{'execute': 'query-cpus', 'arguments': {}}");
> +    resp = qmp("{'execute': 'query-cpus-fast', 'arguments': {}}");
>       g_assert(qdict_haskey(resp, "return"));
>       ret = qdict_get_qlist(resp, "return");
>   
>       cpu0 = qobject_to(QDict, qlist_peek(ret));
> -    path = g_strdup(qdict_get_str(cpu0, "qom_path"));
> +    path = g_strdup(qdict_get_str(cpu0, "qom-path"));
>       qobject_unref(resp);
>       return path;
>   }


