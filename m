Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E71F810F
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Jun 2020 07:20:36 +0200 (CEST)
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjyao-0005V8-J8
	for lists+qemu-devel@lfdr.de; Sat, 13 Jun 2020 01:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1jjyZ8-00052b-HV
 for qemu-devel@nongnu.org; Sat, 13 Jun 2020 01:18:50 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33576)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1jjyZ6-00083j-6d
 for qemu-devel@nongnu.org; Sat, 13 Jun 2020 01:18:50 -0400
Received: by mail-wr1-x443.google.com with SMTP id l11so11930283wru.0
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 22:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oeRIDBY8VlAc6IKF4KqrTzJbZRmQYOfA3/MezwVeN1o=;
 b=BfiIJ4ZljLopem4dGDGd+I3nJ/ynMf7G2OnTa4qSDQbddghNipsC9uNJ+TB0cHe0+3
 BJAInaTMxC+4yl2KYbOAI9JcIvgjFTvQ8ihlQdh5NGxHf0o2BIV1+u+K/84dtOtmaA8f
 iVBnAkz1ad+xiqR8qDyZu4hzJqd6JeTjvn9Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oeRIDBY8VlAc6IKF4KqrTzJbZRmQYOfA3/MezwVeN1o=;
 b=KSmuOJptYCaV3alXidVz8cMm7nOl91DpApXN3uro8M3R4mIsaRovJ1PTpDuCAXTr59
 VYkpfsmvTEBPRo7GgC4hUmjf+IRUFv4J4f7scHc6sQ77bes6ROwrHQdDK3eui8hqeUZj
 OpEycbxH/xdSrP16PdLbYUPpuQXM09TFZRW8CxGg5l527ugjxchAOHJAldnm601K7cin
 1w4JlskUygRZ/v+FLa4aMy7oI1ERDFw2sPvZKbSbXT4fcuvITFD0HqMOo/+ecR/vTngk
 QEsiIQDwpzj5lIHAHxpKvwsLbYJ/KztfWHB0y56IX6x4LQVlySLh8kGuumk1PTTwI12a
 ictw==
X-Gm-Message-State: AOAM530KwET+xTl0Y/BW/1U6uJgBYS05XmBqTFt7W1sKDaO47XYJxwBx
 /D7yzugnDLwNMS3c4fZor5fhTIrnCt8iRaI8+Yet
X-Google-Smtp-Source: ABdhPJygBZjtvCKOX9JjC8swVu4g8C0ifOf5J5uw2fVEqaqM6nHJjYSeTHZBaNOo094sxcfJ4ocF7/M9Vd0YeLjbEC4=
X-Received: by 2002:adf:edc8:: with SMTP id v8mr17609964wro.176.1592025520212; 
 Fri, 12 Jun 2020 22:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200529114641.121332-1-anup.patel@wdc.com>
 <20200529114641.121332-4-anup.patel@wdc.com>
In-Reply-To: <20200529114641.121332-4-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 12 Jun 2020 22:18:28 -0700
Message-ID: <CAOnJCUKmb42OH152vdF2P2h=yj5_wfrGmRWmmJP6HknkMC5KmA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] hw/riscv: Add helpers for RISC-V multi-socket NUMA
 machines
To: Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=atishp@atishpatra.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 qemu-devel@nongnu.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 29, 2020 at 4:48 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add common helper routines which can be shared by RISC-V
> multi-socket NUMA machines.
>
> We have two types of helpers:
> 1. riscv_socket_xyz() - These helper assist managing multiple
>    sockets irrespective whether QEMU NUMA is enabled/disabled
> 2. riscv_numa_xyz() - These helpers assist in providing
>    necessary QEMU machine callbacks for QEMU NUMA emulation
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  hw/riscv/Makefile.objs  |   1 +
>  hw/riscv/numa.c         | 242 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/riscv/numa.h |  51 +++++++++
>  3 files changed, 294 insertions(+)
>  create mode 100644 hw/riscv/numa.c
>  create mode 100644 include/hw/riscv/numa.h
>
> diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
> index fc3c6dd7c8..4483e61879 100644
> --- a/hw/riscv/Makefile.objs
> +++ b/hw/riscv/Makefile.objs
> @@ -1,4 +1,5 @@
>  obj-y += boot.o
> +obj-y += numa.o
>  obj-$(CONFIG_SPIKE) += riscv_htif.o
>  obj-$(CONFIG_HART) += riscv_hart.o
>  obj-$(CONFIG_SIFIVE_E) += sifive_e.o
> diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
> new file mode 100644
> index 0000000000..4f92307102
> --- /dev/null
> +++ b/hw/riscv/numa.c
> @@ -0,0 +1,242 @@
> +/*
> + * QEMU RISC-V NUMA Helper
> + *
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/riscv/numa.h"
> +#include "sysemu/device_tree.h"
> +
> +static bool numa_enabled(const MachineState *ms)
> +{
> +    return (ms->numa_state && ms->numa_state->num_nodes) ? true : false;
> +}
> +
> +int riscv_socket_count(const MachineState *ms)
> +{
> +    return (numa_enabled(ms)) ? ms->numa_state->num_nodes : 1;
> +}
> +
> +int riscv_socket_first_hartid(const MachineState *ms, int socket_id)
> +{
> +    int i, first_hartid = ms->smp.cpus;
> +
> +    if (!numa_enabled(ms)) {
> +        return (!socket_id) ? 0 : -1;
> +    }
> +
> +    for (i = 0; i < ms->smp.cpus; i++) {
> +        if (ms->possible_cpus->cpus[i].props.node_id != socket_id) {
> +            continue;
> +        }
> +        if (i < first_hartid) {
> +            first_hartid = i;
> +        }
> +    }
> +
> +    return (first_hartid < ms->smp.cpus) ? first_hartid : -1;
> +}
> +
> +int riscv_socket_last_hartid(const MachineState *ms, int socket_id)
> +{
> +    int i, last_hartid = -1;
> +
> +    if (!numa_enabled(ms)) {
> +        return (!socket_id) ? ms->smp.cpus - 1 : -1;
> +    }
> +
> +    for (i = 0; i < ms->smp.cpus; i++) {
> +        if (ms->possible_cpus->cpus[i].props.node_id != socket_id) {
> +            continue;
> +        }
> +        if (i > last_hartid) {
> +            last_hartid = i;
> +        }
> +    }
> +
> +    return (last_hartid < ms->smp.cpus) ? last_hartid : -1;
> +}
> +
> +int riscv_socket_hart_count(const MachineState *ms, int socket_id)
> +{
> +    int first_hartid, last_hartid;
> +
> +    if (!numa_enabled(ms)) {
> +        return (!socket_id) ? ms->smp.cpus : -1;
> +    }
> +
> +    first_hartid = riscv_socket_first_hartid(ms, socket_id);
> +    if (first_hartid < 0) {
> +        return -1;
> +    }
> +
> +    last_hartid = riscv_socket_last_hartid(ms, socket_id);
> +    if (last_hartid < 0) {
> +        return -1;
> +    }
> +
> +    if (first_hartid > last_hartid) {
> +        return -1;
> +    }
> +
> +    return last_hartid - first_hartid + 1;
> +}
> +
> +bool riscv_socket_check_hartids(const MachineState *ms, int socket_id)
> +{
> +    int i, first_hartid, last_hartid;
> +
> +    if (!numa_enabled(ms)) {
> +        return (!socket_id) ? true : false;
> +    }
> +
> +    first_hartid = riscv_socket_first_hartid(ms, socket_id);
> +    if (first_hartid < 0) {
> +        return false;
> +    }
> +
> +    last_hartid = riscv_socket_last_hartid(ms, socket_id);
> +    if (last_hartid < 0) {
> +        return false;
> +    }
> +
> +    for (i = first_hartid; i <= last_hartid; i++) {
> +        if (ms->possible_cpus->cpus[i].props.node_id != socket_id) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +uint64_t riscv_socket_mem_offset(const MachineState *ms, int socket_id)
> +{
> +    int i;
> +    uint64_t mem_offset = 0;
> +
> +    if (!numa_enabled(ms)) {
> +        return 0;
> +    }
> +
> +    for (i = 0; i < ms->numa_state->num_nodes; i++) {
> +        if (i == socket_id) {
> +            break;
> +        }
> +        mem_offset += ms->numa_state->nodes[i].node_mem;
> +    }
> +
> +    return (i == socket_id) ? mem_offset : 0;
> +}
> +
> +uint64_t riscv_socket_mem_size(const MachineState *ms, int socket_id)
> +{
> +    if (!numa_enabled(ms)) {
> +        return (!socket_id) ? ms->ram_size : 0;
> +    }
> +
> +    return (socket_id < ms->numa_state->num_nodes) ?
> +            ms->numa_state->nodes[socket_id].node_mem : 0;
> +}
> +
> +void riscv_socket_fdt_write_id(const MachineState *ms, void *fdt,
> +                               const char *node_name, int socket_id)
> +{
> +    if (numa_enabled(ms)) {
> +        qemu_fdt_setprop_cell(fdt, node_name, "numa-node-id", socket_id);
> +    }
> +}
> +
> +void riscv_socket_fdt_write_distance_matrix(const MachineState *ms, void *fdt)
> +{
> +    int i, j, idx;
> +    uint32_t *dist_matrix, dist_matrix_size;
> +
> +    if (numa_enabled(ms) && ms->numa_state->have_numa_distance) {
> +        dist_matrix_size = riscv_socket_count(ms) * riscv_socket_count(ms);
> +        dist_matrix_size *= (3 * sizeof(uint32_t));
> +        dist_matrix = g_malloc0(dist_matrix_size);
> +
> +        for (i = 0; i < riscv_socket_count(ms); i++) {
> +            for (j = 0; j < riscv_socket_count(ms); j++) {
> +                idx = (i * riscv_socket_count(ms) + j) * 3;
> +                dist_matrix[idx + 0] = cpu_to_be32(i);
> +                dist_matrix[idx + 1] = cpu_to_be32(j);
> +                dist_matrix[idx + 2] =
> +                    cpu_to_be32(ms->numa_state->nodes[i].distance[j]);
> +            }
> +        }
> +
> +        qemu_fdt_add_subnode(fdt, "/distance-map");
> +        qemu_fdt_setprop_string(fdt, "/distance-map", "compatible",
> +                                "numa-distance-map-v1");
> +        qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
> +                         dist_matrix, dist_matrix_size);
> +        g_free(dist_matrix);
> +    }
> +}
> +
> +CpuInstanceProperties
> +riscv_numa_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
> +
> +    assert(cpu_index < possible_cpus->len);
> +    return possible_cpus->cpus[cpu_index].props;
> +}
> +
> +int64_t riscv_numa_get_default_cpu_node_id(const MachineState *ms, int idx)
> +{
> +    int64_t nidx = 0;
> +
> +    if (ms->numa_state->num_nodes) {
> +        nidx = idx / (ms->smp.cpus / ms->numa_state->num_nodes);
> +        if (ms->numa_state->num_nodes <= nidx) {
> +            nidx = ms->numa_state->num_nodes - 1;
> +        }
> +    }
> +
> +    return nidx;
> +}
> +
> +const CPUArchIdList *riscv_numa_possible_cpu_arch_ids(MachineState *ms)
> +{
> +    int n;
> +    unsigned int max_cpus = ms->smp.max_cpus;
> +
> +    if (ms->possible_cpus) {
> +        assert(ms->possible_cpus->len == max_cpus);
> +        return ms->possible_cpus;
> +    }
> +
> +    ms->possible_cpus = g_malloc0(sizeof(CPUArchIdList) +
> +                                  sizeof(CPUArchId) * max_cpus);
> +    ms->possible_cpus->len = max_cpus;
> +    for (n = 0; n < ms->possible_cpus->len; n++) {
> +        ms->possible_cpus->cpus[n].type = ms->cpu_type;
> +        ms->possible_cpus->cpus[n].arch_id = n;
> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> +        ms->possible_cpus->cpus[n].props.core_id = n;
> +    }
> +
> +    return ms->possible_cpus;
> +}
> diff --git a/include/hw/riscv/numa.h b/include/hw/riscv/numa.h
> new file mode 100644
> index 0000000000..fd9517a315
> --- /dev/null
> +++ b/include/hw/riscv/numa.h
> @@ -0,0 +1,51 @@
> +/*
> + * QEMU RISC-V NUMA Helper
> + *
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef RISCV_NUMA_H
> +#define RISCV_NUMA_H
> +
> +#include "hw/sysbus.h"
> +#include "sysemu/numa.h"
> +
> +int riscv_socket_count(const MachineState *ms);
> +
> +int riscv_socket_first_hartid(const MachineState *ms, int socket_id);
> +
> +int riscv_socket_last_hartid(const MachineState *ms, int socket_id);
> +
> +int riscv_socket_hart_count(const MachineState *ms, int socket_id);
> +
> +uint64_t riscv_socket_mem_offset(const MachineState *ms, int socket_id);
> +
> +uint64_t riscv_socket_mem_size(const MachineState *ms, int socket_id);
> +
> +bool riscv_socket_check_hartids(const MachineState *ms, int socket_id);
> +
> +void riscv_socket_fdt_write_id(const MachineState *ms, void *fdt,
> +                               const char *node_name, int socket_id);
> +
> +void riscv_socket_fdt_write_distance_matrix(const MachineState *ms, void *fdt);
> +
> +CpuInstanceProperties
> +riscv_numa_cpu_index_to_props(MachineState *ms, unsigned cpu_index);
> +
> +int64_t riscv_numa_get_default_cpu_node_id(const MachineState *ms, int idx);
> +
> +const CPUArchIdList *riscv_numa_possible_cpu_arch_ids(MachineState *ms);
> +
> +#endif /* RISCV_NUMA_H */
> --
> 2.25.1
>
>

LGTM.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

