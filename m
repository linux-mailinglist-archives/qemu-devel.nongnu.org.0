Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5519217E2B7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 15:51:03 +0100 (CET)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBJkE-00067Y-9t
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 10:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jBJip-0004mk-Cw
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 10:49:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jBJio-0000WR-83
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 10:49:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24195
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jBJin-0000Vx-Oe
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 10:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583765372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Coag7loe7MKyu/U1oRnqX/i2YbWQ7DqPnQrk8TDAXmg=;
 b=Pgbuy4Tb5Mo/zXz8HrvxC2SBAdKj52nE1FF1n/gveUJgQCDZpRiM706CIMPulFKL8yE3Lt
 Yj3H01vj8FYCGEMHi6QiWtTTQBtn+1a1bo+Q3f75g9GLZJDVchb/WUIn7KS6KxvnY8Js4E
 7Spu9sVMyWoQxD0QIbS25KWfaSSVzeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-J0zVGTsUOmu1pEZ0SASOSA-1; Mon, 09 Mar 2020 10:49:31 -0400
X-MC-Unique: J0zVGTsUOmu1pEZ0SASOSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D843F10509AB;
 Mon,  9 Mar 2020 14:49:29 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-206-77.brq.redhat.com [10.40.206.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6112C271A1;
 Mon,  9 Mar 2020 14:49:25 +0000 (UTC)
Date: Mon, 9 Mar 2020 15:49:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v5 11/16] target/i386: Load apicid model specific
 handlers from X86CPUDefinition
Message-ID: <20200309154922.6a523245@Igors-MacBook-Pro>
In-Reply-To: <158326548299.40452.4030040738160407065.stgit@naples-babu.amd.com>
References: <158326531474.40452.11433722850425537745.stgit@naples-babu.amd.com>
 <158326548299.40452.4030040738160407065.stgit@naples-babu.amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Tue, 03 Mar 2020 13:58:03 -0600
Babu Moger <babu.moger@amd.com> wrote:

> Load the model specific handlers if available or else default handlers
> will be loaded. Add the model specific handlers if apicid decoding
> differs from the standard sequential numbering.
> 

this is still the old version of the patch and hadn't addressed feedback from v4

> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
>  target/i386/cpu.c |   34 ++++++++++++++++++++++++++++++++++
>  target/i386/cpu.h |    1 +
>  2 files changed, 35 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index c75cf744ab..f33d8b77f5 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -51,6 +51,7 @@
>  #include "sysemu/sysemu.h"
>  #include "sysemu/tcg.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/i386/x86.h"
this dependency shouldn't be here, see below

>  #include "hw/i386/topology.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "exec/address-spaces.h"
[...]
> +void cpu_x86_init_apicid_fns(MachineState *machine)
it should be something like:
  x86_use_epyc_apic_id_encoding(char *cpu_type)
try to avoid pulling in unnecessary dependency on Machine into cpu.c

> +{
> +    X86CPUClass *xcc = X86_CPU_CLASS(object_class_by_name(machine->cpu_type));
> +    X86CPUModel *model = xcc->model;
> +    X86CPUDefinition *def = model->cpudef;
> +    X86MachineState *x86ms = X86_MACHINE(machine);
> +
> +    if (def) {
> +        if (def->apicid_from_cpu_idx) {
> +            x86ms->apicid_from_cpu_idx = def->apicid_from_cpu_idx;
> +        }
> +        if (def->topo_ids_from_apicid) {
> +            x86ms->topo_ids_from_apicid = def->topo_ids_from_apicid;
> +        }
> +        if (def->apicid_from_topo_ids) {
> +            x86ms->apicid_from_topo_ids = def->apicid_from_topo_ids;
> +        }
> +        if (def->apicid_pkg_offset) {
> +            x86ms->apicid_pkg_offset = def->apicid_pkg_offset;
> +        }
> +    }
> +}

It was suggested to move defaults initialization to x86_machine_class_init()

as was suggested at 
[PATCH v4 12/16] hw/i386: Use the apicid handlers from X86MachineState
and acked by Eduardo

> +
>  static CPUCaches epyc_cache_info = {
>      .l1d_cache = &(CPUCacheInfo) {
>          .type = DATA_CACHE,
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 20abbda647..34f0d994ef 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1895,6 +1895,7 @@ void cpu_clear_apic_feature(CPUX86State *env);
>  void host_cpuid(uint32_t function, uint32_t count,
>                  uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx);
>  void host_vendor_fms(char *vendor, int *family, int *model, int *stepping);
> +void cpu_x86_init_apicid_fns(MachineState *machine);
>  
>  /* helper.c */
>  bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> 


