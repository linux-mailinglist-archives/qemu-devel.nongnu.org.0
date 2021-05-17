Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A973833BE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:04:01 +0200 (CEST)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liemm-0000m2-DD
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1liehK-0000y4-AO
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:58:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1liehH-00011K-09
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621263498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2hPWSTs6oVhYvAgPiwnzZ3LXyFA9S/Mek/I2w5Idf4=;
 b=TCPQSR3w+rjCFW3KnvXPnu59AoC6P7nUzdcxsK/nuCHORxSgwWkLRArxjRpRYBlF7n2JhQ
 ZAx4UUt08ghNxNB3fviBrPzv84iqQfBmTGBhWBFo6mxyAoOVYtfkvHJVS7+fXp3y9opuWH
 /johwq/NnAL4rLFm3rCsRlavRK8avBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-fw7jdUDCPKOPaFgBbT4lkw-1; Mon, 17 May 2021 10:58:16 -0400
X-MC-Unique: fw7jdUDCPKOPaFgBbT4lkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A279A40C1;
 Mon, 17 May 2021 14:58:15 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B93B1F055;
 Mon, 17 May 2021 14:58:13 +0000 (UTC)
Date: Mon, 17 May 2021 16:58:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 14/14] machine: add smp compound property
Message-ID: <20210517165811.20ca1411@redhat.com>
In-Reply-To: <20210513162901.1310239-15-pbonzini@redhat.com>
References: <20210513162901.1310239-1-pbonzini@redhat.com>
 <20210513162901.1310239-15-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yang.zhong@intel.com, armbru@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 12:29:01 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Make -smp syntactic sugar for a compound property "-machine
> smp.{cores,threads,cpu,...}".  machine_smp_parse is replaced by the
> setter for the property.
> 
> numa-test will now cover the new syntax, while other tests
> still use -smp.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/core/machine.c       | 108 +++++++++++++++++++++-------------------
>  softmmu/vl.c            |  33 +++++++++---
>  tests/qtest/numa-test.c |  22 ++++----
>  3 files changed, 95 insertions(+), 68 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 55e878fc3e..f33c9ce78c 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -19,6 +19,7 @@
>  #include "hw/loader.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-common.h"
> +#include "qapi/qapi-visit-machine.h"
>  #include "qapi/visitor.h"
>  #include "hw/sysbus.h"
>  #include "sysemu/cpus.h"
> @@ -797,6 +798,57 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      ms->smp.sockets = sockets;
>  }
>  
> +static void machine_get_smp(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +    SMPConfiguration *config = &(SMPConfiguration){
> +        .has_cores = true, .cores = ms->smp.cores,
> +        .has_sockets = true, .sockets = ms->smp.sockets,
> +        .has_dies = true, .dies = ms->smp.dies,
> +        .has_threads = true, .threads = ms->smp.threads,
> +        .has_cpus = true, .cpus = ms->smp.cpus,
> +        .has_maxcpus = true, .maxcpus = ms->smp.max_cpus,
> +    };

why did you choose to set all has_foo to true?

> +    if (!visit_type_SMPConfiguration(v, name, &config, &error_abort)) {
> +        return;
> +    }
> +}
> +
> +static void machine_set_smp(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(obj);
> +    MachineState *ms = MACHINE(obj);
> +    SMPConfiguration *config;
> +    ERRP_GUARD();
> +
> +    if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
> +        return;
> +    }
> +
> +    mc->smp_parse(ms, config, errp);
> +    if (errp) {
> +        goto out_free;
> +    }
> +
> +    /* sanity-check smp_cpus and max_cpus against mc */
> +    if (ms->smp.cpus < mc->min_cpus) {
> +        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
> +                   "supported by machine '%s' is %d",
> +                   ms->smp.cpus,
> +                   mc->name, mc->min_cpus);
> +    } else if (ms->smp.max_cpus > mc->max_cpus) {
> +        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
> +                   "supported by machine '%s' is %d",
> +                   current_machine->smp.max_cpus,
> +                   mc->name, mc->max_cpus);
> +    }
> +
> +out_free:
> +    qapi_free_SMPConfiguration(config);
> +}
> +
>  static void machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -836,6 +888,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_set_description(oc, "dumpdtb",
>          "Dump current dtb to a file and quit");
>  
> +    object_class_property_add(oc, "smp", "SMPConfiguration",
> +        machine_get_smp, machine_set_smp,
> +        NULL, NULL);
> +    object_class_property_set_description(oc, "smp",
> +        "CPU topology");
> +
>      object_class_property_add(oc, "phandle-start", "int",
>          machine_get_phandle_start, machine_set_phandle_start,
>          NULL, NULL);
> @@ -1124,56 +1182,6 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
>      return ret;
>  }
>  
> -bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
> -{
> -    MachineClass *mc = MACHINE_GET_CLASS(ms);
> -    ERRP_GUARD();
> -
> -    if (opts) {
> -        SMPConfiguration config = {
> -            .has_cpus = !!qemu_opt_get(opts, "cpus"),
> -            .cpus = qemu_opt_get_number(opts, "cpus", 0),
> -            .has_sockets = !!qemu_opt_get(opts, "sockets"),
> -            .sockets = qemu_opt_get_number(opts, "sockets", 0),
> -            .has_dies = !!qemu_opt_get(opts, "dies"),
> -            .dies = qemu_opt_get_number(opts, "dies", 0),
> -            .has_cores = !!qemu_opt_get(opts, "cores"),
> -            .cores = qemu_opt_get_number(opts, "cores", 0),
> -            .has_threads = !!qemu_opt_get(opts, "threads"),
> -            .threads = qemu_opt_get_number(opts, "threads", 0),
> -            .has_maxcpus = !!qemu_opt_get(opts, "maxcpus"),
> -            .maxcpus = qemu_opt_get_number(opts, "maxcpus", 0),
> -        };
> -
> -        mc->smp_parse(ms, &config, errp);
> -        if (*errp) {
> -            return false;
> -        }
> -    }
> -
> -    /* sanity-check smp_cpus and max_cpus against mc */
> -    if (ms->smp.cpus < mc->min_cpus) {
> -        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
> -                   "supported by machine '%s' is %d",
> -                   ms->smp.cpus,
> -                   mc->name, mc->min_cpus);
> -        return false;
> -    } else if (ms->smp.max_cpus > mc->max_cpus) {
> -        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
> -                   "supported by machine '%s' is %d",
> -                   current_machine->smp.max_cpus,
> -                   mc->name, mc->max_cpus);
> -        return false;
> -    }
> -
> -    if (ms->smp.cpus > 1) {
> -        Error *blocker = NULL;
> -        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
> -        replay_add_blocker(blocker);
> -    }
> -    return true;
> -}
> -
>  void machine_run_board_init(MachineState *machine)
>  {
>      MachineClass *machine_class = MACHINE_GET_CLASS(machine);
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index de844f08d7..555385e64d 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1504,6 +1504,25 @@ static void machine_help_func(const QDict *qdict)
>      }
>  }
>  
> +static void
> +machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
> +                           const char *arg, Error **errp)
> +{
> +    QDict *opts, *prop;
> +    bool help = false;
> +    ERRP_GUARD();
> +
> +    prop = keyval_parse(arg, opts_list->implied_opt_name, &help, errp);
> +    if (help) {
> +        qemu_opts_print_help(opts_list, true);
> +        return;
> +    }
> +    opts = qdict_new();
> +    qdict_put(opts, propname, prop);
> +    keyval_merge(machine_opts_dict, opts, errp);
> +    qobject_unref(opts);
> +}
> +
>  static const char *pid_file;
>  static Notifier qemu_unlink_pidfile_notifier;
>  
> @@ -1796,6 +1815,12 @@ static void qemu_apply_machine_options(QDict *qdict)
>          /* fall back to the -kernel/-append */
>          semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
>      }
> +
> +    if (current_machine->smp.cpus > 1) {
> +        Error *blocker = NULL;
> +        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
> +        replay_add_blocker(blocker);
> +    }
>  }
>  
>  static void qemu_create_early_backends(void)
> @@ -2039,9 +2064,6 @@ static void qemu_create_machine(QDict *qdict)
>          qemu_set_hw_version(machine_class->hw_version);
>      }
>  
> -    machine_smp_parse(current_machine,
> -        qemu_opts_find(qemu_find_opts("smp-opts"), NULL), &error_fatal);
> -
>      /*
>       * Get the default machine options from the machine if it is not already
>       * specified either by the configuration file or by the command line.
> @@ -3325,10 +3347,7 @@ void qemu_init(int argc, char **argv, char **envp)
>                  }
>                  break;
>              case QEMU_OPTION_smp:
> -                if (!qemu_opts_parse_noisily(qemu_find_opts("smp-opts"),
> -                                             optarg, true)) {
> -                    exit(1);
> -                }
> +                machine_parse_property_opt(qemu_find_opts("smp-opts"), "smp", optarg, &error_fatal);
>                  break;
>              case QEMU_OPTION_vnc:
>                  vnc_parse(optarg);
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index dc0ec571ca..c677cd63c4 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -25,7 +25,7 @@ static void test_mon_explicit(const void *data)
>      g_autofree char *s = NULL;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-smp 8 -numa node,nodeid=0,memdev=ram,cpus=0-3 "
> +    cli = make_cli(data, "-machine smp.cpus=8 -numa node,nodeid=0,memdev=ram,cpus=0-3 "
>                           "-numa node,nodeid=1,cpus=4-7");
>      qts = qtest_init(cli);
>  
> @@ -42,7 +42,7 @@ static void test_def_cpu_split(const void *data)
>      g_autofree char *s = NULL;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-smp 8 -numa node,memdev=ram -numa node");
> +    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram -numa node");
>      qts = qtest_init(cli);
>  
>      s = qtest_hmp(qts, "info numa");
> @@ -58,7 +58,7 @@ static void test_mon_partial(const void *data)
>      g_autofree char *s = NULL;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-smp 8 "
> +    cli = make_cli(data, "-machine smp.cpus=8 "
>                     "-numa node,nodeid=0,memdev=ram,cpus=0-1 "
>                     "-numa node,nodeid=1,cpus=4-5 ");
>      qts = qtest_init(cli);
> @@ -86,7 +86,7 @@ static void test_query_cpus(const void *data)
>      QTestState *qts;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-smp 8 -numa node,memdev=ram,cpus=0-3 "
> +    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram,cpus=0-3 "
>                           "-numa node,cpus=4-7");
>      qts = qtest_init(cli);
>      cpus = get_cpus(qts, &resp);
> @@ -124,7 +124,7 @@ static void pc_numa_cpu(const void *data)
>      QTestState *qts;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-cpu pentium -smp 8,sockets=2,cores=2,threads=2 "
> +    cli = make_cli(data, "-cpu pentium -machine smp.cpus=8,smp.sockets=2,smp.cores=2,smp.threads=2 "
>          "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
>          "-numa cpu,node-id=1,socket-id=0 "
>          "-numa cpu,node-id=0,socket-id=1,core-id=0 "
> @@ -177,7 +177,7 @@ static void spapr_numa_cpu(const void *data)
>      QTestState *qts;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-smp 4,cores=4 "
> +    cli = make_cli(data, "-machine smp.cpus=4,smp.cores=4 "
>          "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
>          "-numa cpu,node-id=0,core-id=0 "
>          "-numa cpu,node-id=0,core-id=1 "
> @@ -222,7 +222,7 @@ static void aarch64_numa_cpu(const void *data)
>      QTestState *qts;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-smp 2 "
> +    cli = make_cli(data, "-machine smp.cpus=2 "
>          "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
>          "-numa cpu,node-id=1,thread-id=0 "
>          "-numa cpu,node-id=0,thread-id=1");
> @@ -265,7 +265,7 @@ static void pc_dynamic_cpu_cfg(const void *data)
>      QTestState *qs;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-nodefaults --preconfig -smp 2");
> +    cli = make_cli(data, "-nodefaults --preconfig -machine smp.cpus=2");
>      qs = qtest_init(cli);
>  
>      /* create 2 numa nodes */
> @@ -324,7 +324,7 @@ static void pc_hmat_build_cfg(const void *data)
>      g_autofree char *cli = NULL;
>  
>      cli = make_cli(data, "-nodefaults --preconfig -machine hmat=on "
> -                         "-smp 2,sockets=2 "
> +                         "-machine smp.cpus=2,smp.sockets=2 "
>                           "-m 128M,slots=2,maxmem=1G "
>                           "-object memory-backend-ram,size=64M,id=m0 "
>                           "-object memory-backend-ram,size=64M,id=m1 "
> @@ -453,7 +453,7 @@ static void pc_hmat_off_cfg(const void *data)
>      g_autofree char *cli = NULL;
>  
>      cli = make_cli(data, "-nodefaults --preconfig "
> -                         "-smp 2,sockets=2 "
> +                         "-machine smp.cpus=2,smp.sockets=2 "
>                           "-m 128M,slots=2,maxmem=1G "
>                           "-object memory-backend-ram,size=64M,id=m0,prealloc=y "
>                           "-object memory-backend-ram,size=64M,id=m1 "
> @@ -492,7 +492,7 @@ static void pc_hmat_erange_cfg(const void *data)
>      g_autofree char *cli = NULL;
>  
>      cli = make_cli(data, "-nodefaults --preconfig -machine hmat=on "
> -                         "-smp 2,sockets=2 "
> +                         "-machine smp.cpus=2,smp.sockets=2 "
>                           "-m 128M,slots=2,maxmem=1G "
>                           "-object memory-backend-ram,size=64M,id=m0 "
>                           "-object memory-backend-ram,size=64M,id=m1 "


