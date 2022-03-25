Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062A24E7432
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 14:28:10 +0100 (CET)
Received: from localhost ([::1]:40018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXjz6-0008Gu-RV
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 09:28:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXjwU-0005vd-Kk
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXjwR-00047G-Vm
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648214723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GfKBGOEQBA2Txhn6QZ/ZHqP0pM/ldEA4/cud1eQo11I=;
 b=LN+DYFbFrLjZrKIqT0gywdRXTrDCDKfXEA2SEtILZcsxIOORbVtQtGYwSXag+OchIAQ1la
 FEJtbGpaaqpbhrz/H0Ecar9tE+CmSsnqDNdk0iwwXgyGY678gAkWGOX3+ehkr1ejGOPBxj
 9ZfmGa5HEU0f7/0T3MvICw5/WK44Reo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-0VbkNqS0MDC8CeTaF62yAQ-1; Fri, 25 Mar 2022 09:25:21 -0400
X-MC-Unique: 0VbkNqS0MDC8CeTaF62yAQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 my15-20020a1709065a4f00b006dfd2b16e6cso4126346ejc.1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 06:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GfKBGOEQBA2Txhn6QZ/ZHqP0pM/ldEA4/cud1eQo11I=;
 b=nd00onG7z/jt4AdiS7k+Tan35jJRYm33GU0fS8pdchDNJtv36qrrmsMJ3OSaNa/zvO
 iezMhiEJ97/GoWiSh8rae153sCFFOTZZTiraWy7VNlHKqPhEX94ZoPYl9WtqN4FaAT0c
 1afQ+kcz/tMz6C7YLg4OwL0up10NVeLZW5O98QNMpkn64GFTlZ8Rl8n7v3OPMyTdFhbE
 ExrghWhvQNyK58E1crKthsgvGHbQF3Ixq09SkzgDv4pihGWhpIWwC7wqEKLU3OkNly3o
 /C7HyZf5KhgsWcZwK6gx41zzb5RoWrF69wIojNGXHfVFq2RWQRKyGo2cZgAVnHSpNF3S
 hIvA==
X-Gm-Message-State: AOAM531jYK08rFdFqbWkKF+gAgmlkTqevqM8+ULBTgDqQxHBG0XX1Cve
 sAj1/WZaWcpeGnAgAHmDZeNhUIcXcizQQGxPpA4yytDyBTq7prAjFUO5p69V56kup7xLkvCnZ9z
 2V9T4jFBluP3haNc=
X-Received: by 2002:a05:6402:3712:b0:416:13bf:4fc5 with SMTP id
 ek18-20020a056402371200b0041613bf4fc5mr13108543edb.115.1648214720369; 
 Fri, 25 Mar 2022 06:25:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy4aHz+TZr9uVJ7TGctSZ0SzdO44iie46c+4DeflSI8yJKvFILcEQN6lY4RGJQeEyllBj1ug==
X-Received: by 2002:a05:6402:3712:b0:416:13bf:4fc5 with SMTP id
 ek18-20020a056402371200b0041613bf4fc5mr13108496edb.115.1648214719991; 
 Fri, 25 Mar 2022 06:25:19 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 hr38-20020a1709073fa600b006e0280f3bbdsm2353225ejc.110.2022.03.25.06.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 06:25:19 -0700 (PDT)
Date: Fri, 25 Mar 2022 14:25:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 2/4] hw/arm/virt: Fix CPU's default NUMA node ID
Message-ID: <20220325142517.04aecd93@redhat.com>
In-Reply-To: <20220323072438.71815-3-gshan@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-3-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 15:24:36 +0800
Gavin Shan <gshan@redhat.com> wrote:

> When CPU-to-NUMA association isn't explicitly provided by users,
> the default on is given by mc->get_default_cpu_node_id(). However,
> the CPU topology isn't fully considered in the default association
> and this causes CPU topology broken warnings on booting Linux guest.
> 
> For example, the following warning messages are observed when the
> Linux guest is booted with the following command lines.
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>   -accel kvm -machine virt,gic-version=host               \
>   -cpu host                                               \
>   -smp 6,sockets=2,cores=3,threads=1                      \
>   -m 1024M,slots=16,maxmem=64G                            \
>   -object memory-backend-ram,id=mem0,size=128M            \
>   -object memory-backend-ram,id=mem1,size=128M            \
>   -object memory-backend-ram,id=mem2,size=128M            \
>   -object memory-backend-ram,id=mem3,size=128M            \
>   -object memory-backend-ram,id=mem4,size=128M            \
>   -object memory-backend-ram,id=mem4,size=384M            \
>   -numa node,nodeid=0,memdev=mem0                         \
>   -numa node,nodeid=1,memdev=mem1                         \
>   -numa node,nodeid=2,memdev=mem2                         \
>   -numa node,nodeid=3,memdev=mem3                         \
>   -numa node,nodeid=4,memdev=mem4                         \
>   -numa node,nodeid=5,memdev=mem5
>          :
>   alternatives: patching kernel code
>   BUG: arch topology borken
>   the CLS domain not a subset of the MC domain
>   <the above error log repeats>
>   BUG: arch topology borken
>   the DIE domain not a subset of the NODE domain
> 
> With current implementation of mc->get_default_cpu_node_id(),
> CPU#0 to CPU#5 are associated with NODE#0 to NODE#5 separately.
> That's incorrect because CPU#0/1/2 should be associated with same
> NUMA node because they're seated in same socket.
> 
> This fixes the issue by considering the socket ID when the default
> CPU-to-NUMA association is provided in virt_possible_cpu_arch_ids().
> With this applied, no more CPU topology broken warnings are seen
> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but
> there are no CPUs associated with NODE#2/3/4/5.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 064eac42f7..3286915229 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2497,7 +2497,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>  
>  static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>  {
> -    return idx % ms->numa_state->num_nodes;
> +    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
> +
> +    return socket_id % ms->numa_state->num_nodes;
>  }
>  
>  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)


