Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A417E301
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 16:03:39 +0100 (CET)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBJwQ-0001SF-WD
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 11:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jBJuz-0000Hg-Mx
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:02:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jBJuy-0002NH-Em
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:02:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50203
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jBJuy-0002Mh-9S
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583766128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XZpVToFgqXpigakyZ/q6rzA3/XD8Po7eL31LUq4ndg=;
 b=f+xkMY+WjJX8mHz8rE2solqQDK+LzrCu/IGuKtFn1rfIdNnHRY7sSZGQhYRYN0rydUOd4j
 FyNkYi5Iu0I6OUgyxLYM5qIBHLVsmA8ws7ty/5SbidhfrKBPmQ6CEGV3oZK4srq+WewH9l
 Unr2Em6HUVRPt81xHwf6TEcPXSBXw5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-i1QD9wH5NXiicmpWDaEdUg-1; Mon, 09 Mar 2020 11:02:05 -0400
X-MC-Unique: i1QD9wH5NXiicmpWDaEdUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 732148017CC;
 Mon,  9 Mar 2020 15:02:04 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-206-77.brq.redhat.com [10.40.206.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3176C8D553;
 Mon,  9 Mar 2020 15:01:59 +0000 (UTC)
Date: Mon, 9 Mar 2020 16:01:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v5 12/16] hw/i386: Use the apicid handlers from
 X86MachineState
Message-ID: <20200309160157.0509fa8d@Igors-MacBook-Pro>
In-Reply-To: <158326548999.40452.9247570542382737462.stgit@naples-babu.amd.com>
References: <158326531474.40452.11433722850425537745.stgit@naples-babu.amd.com>
 <158326548999.40452.9247570542382737462.stgit@naples-babu.amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 03 Mar 2020 13:58:10 -0600
Babu Moger <babu.moger@amd.com> wrote:

> Check and Load the apicid handlers from X86CPUDefinition if available.
> Update the calling convention for the apicid handlers.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>


> ---
>  hw/i386/pc.c  |    6 +++---
>  hw/i386/x86.c |   11 +++++++----
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 17cce3f074..c600ba0432 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1581,14 +1581,14 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
>          topo_ids.die_id = cpu->die_id;
>          topo_ids.core_id = cpu->core_id;
>          topo_ids.smt_id = cpu->thread_id;
> -        cpu->apic_id = x86_apicid_from_topo_ids(&topo_info, &topo_ids);
> +        cpu->apic_id = x86ms->apicid_from_topo_ids(&topo_info, &topo_ids);
>      }
>  
>      cpu_slot = pc_find_cpu_slot(MACHINE(pcms), cpu->apic_id, &idx);
>      if (!cpu_slot) {
>          MachineState *ms = MACHINE(pcms);
>  
> -        x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
> +        x86ms->topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
this (including other similar) change(s) to callbacks should go to 11/16

>          error_setg(errp,
>              "Invalid CPU [socket: %u, die: %u, core: %u, thread: %u] with"
>              " APIC ID %" PRIu32 ", valid index range 0:%d",
> @@ -1609,7 +1609,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
>      /* TODO: move socket_id/core_id/thread_id checks into x86_cpu_realizefn()
>       * once -smp refactoring is complete and there will be CPU private
>       * CPUState::nr_cores and CPUState::nr_threads fields instead of globals */
> -    x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
> +    x86ms->topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
>      if (cpu->socket_id != -1 && cpu->socket_id != topo_ids.pkg_id) {
>          error_setg(errp, "property socket-id: %u doesn't match set apic-id:"
>              " 0x%x (socket-id: %u)", cpu->socket_id, cpu->apic_id,
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 15b7815bb0..d46dd4ad9e 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -86,7 +86,7 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
>  
>      init_topo_info(&topo_info, x86ms);
>  
> -    correct_id = x86_apicid_from_cpu_idx(&topo_info, cpu_index);
> +    correct_id = x86ms->apicid_from_cpu_idx(&topo_info, cpu_index);
>      if (x86mc->compat_apic_id_mode) {
>          if (cpu_index != correct_id && !warned && !qtest_enabled()) {
>              error_report("APIC IDs set in compatibility mode, "
> @@ -158,8 +158,8 @@ int64_t x86_get_default_cpu_node_id(const MachineState *ms, int idx)
>     init_topo_info(&topo_info, x86ms);
>  
>     assert(idx < ms->possible_cpus->len);
> -   x86_topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
> -                            &topo_info, &topo_ids);
> +   x86ms->topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
> +                               &topo_info, &topo_ids);
>     return topo_ids.pkg_id % ms->numa_state->num_nodes;
>  }
>  
> @@ -179,6 +179,9 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
>          return ms->possible_cpus;
>      }
>  
> +    /* Initialize apicid handlers */
> +    cpu_x86_init_apicid_fns(ms);
> +
>      ms->possible_cpus = g_malloc0(sizeof(CPUArchIdList) +
>                                    sizeof(CPUArchId) * max_cpus);
>      ms->possible_cpus->len = max_cpus;
> @@ -192,7 +195,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
>          ms->possible_cpus->cpus[i].vcpus_count = 1;
>          ms->possible_cpus->cpus[i].arch_id =
>              x86_cpu_apic_id_from_index(x86ms, i);
> -        x86_topo_ids_from_apicid(ms->possible_cpus->cpus[i].arch_id,
> +        x86ms->topo_ids_from_apicid(ms->possible_cpus->cpus[i].arch_id,
>                                   &topo_info, &topo_ids);

not aligned properly

>          ms->possible_cpus->cpus[i].props.has_socket_id = true;
>          ms->possible_cpus->cpus[i].props.socket_id = topo_ids.pkg_id;
> 


