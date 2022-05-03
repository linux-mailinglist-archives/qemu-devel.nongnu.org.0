Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAEA51808A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:03:40 +0200 (CEST)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nloRX-0005Vj-BL
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nloKJ-00054R-Bx
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:56:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nloKF-00069w-8j
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651568164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjnYj/ZOOUL49hkzCRaPKG5onLfJkEFAiy5bl3UjpMM=;
 b=bNnv7XDJhtFBJ5OSJUAnabOzJ9IkhSaYGik3XNoctq8nhC8ARgvh3QRJAyIZe+urt2ycCQ
 3oKDmPmK7wFx1QE8UosRUCQItT62rlKHE5KMvCYhHxOksOgSO0ZtfItjGAqj9cGE3VlzwD
 a9+Sh1HP7fRuHX8vPAwkZMyTnoa0NTg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-hcvhoKT7MqKoGNyO09JPzA-1; Tue, 03 May 2022 04:56:03 -0400
X-MC-Unique: hcvhoKT7MqKoGNyO09JPzA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h65-20020a1c2144000000b0038e9ce3b29cso1064116wmh.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 01:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GjnYj/ZOOUL49hkzCRaPKG5onLfJkEFAiy5bl3UjpMM=;
 b=SIkN8Bum2k0x6fC0+3P1ugL6dc9jcgVXIXvxE067ceEWF+bMz3DxS2vFt5L1PT9Yzb
 NFsuE7/ZcuMCbEwc1A7QdWwbI6NlHRDZ5FAb2Iy+dXfgQKF6nr1TNVslo93THjSSkohb
 jAEPbPfqtxAI2ejJpKRbPfTPmoE+8A3d4db1hY10bkGENdQaNBqYSz7+Da0ytBJ3p4ki
 +rYAlQpKO1hwAdb8SvJ6yJr1ILEnycMGk1+9jG8l6sIGcTrhzKmL4TY13ni0BrsLcqGX
 IaqLy1sRs7mS/mkrGAqyBmhWfWbnh/Jnj3xn0TmHNXr/IDgTZpHSXkEHOR8tLPPoQMSh
 ySPQ==
X-Gm-Message-State: AOAM5338z3SEkoAVTiau1sFXvfV/E+dDdh72ZnAPqtU3t217uMilpGi1
 f9VBXuBNOAPrFOI7EGiAMfDPcmles+EAJ4kKhnlFBatNh3falDw3m52ipPXIorsnQIWR6M2ogE9
 MuDBGGXma7SDzo+o=
X-Received: by 2002:a7b:cd82:0:b0:389:77ef:66d7 with SMTP id
 y2-20020a7bcd82000000b0038977ef66d7mr2314989wmj.171.1651568162599; 
 Tue, 03 May 2022 01:56:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmLEsUAGkttB85noL4GlyCtYGEOTdheBLf952tWbZsZzEZA2cjV9iDWaK90Gr/Qqe88FMcRw==
X-Received: by 2002:a7b:cd82:0:b0:389:77ef:66d7 with SMTP id
 y2-20020a7bcd82000000b0038977ef66d7mr2314972wmj.171.1651568162382; 
 Tue, 03 May 2022 01:56:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600c4e0e00b003942a244ec0sm1360264wmq.5.2022.05.03.01.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 01:56:01 -0700 (PDT)
Date: Tue, 3 May 2022 10:56:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, lvivier@redhat.com,
 eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 shan.gavin@gmail.com, peter.maydell@linaro.org,
 Jonathan.Cameron@Huawei.com, zhenyzha@redhat.com, mst@redhat.com,
 armbru@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 drjones@redhat.com, eblake@redhat.com, f4bug@amsat.org,
 wangyanan55@huawei.com
Subject: Re: [PATCH v8 3/5] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220503105600.112234e2@redhat.com>
In-Reply-To: <20220425032802.365061-4-gshan@redhat.com>
References: <20220425032802.365061-1-gshan@redhat.com>
 <20220425032802.365061-4-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 25 Apr 2022 11:28:00 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Currently, the SMP configuration isn't considered when the CPU
> topology is populated. In this case, it's impossible to provide
> the default CPU-to-NUMA mapping or association based on the socket
> ID of the given CPU.
> 
> This takes account of SMP configuration when the CPU topology
> is populated. The die ID for the given CPU isn't assigned since
> it's not supported on arm/virt machine. Besides, the used SMP
> configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
> to avoid testing failure
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>


Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 5bdd98e4a1..0fd7f9a6a1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2560,6 +2560,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>      int n;
>      unsigned int max_cpus = ms->smp.max_cpus;
>      VirtMachineState *vms = VIRT_MACHINE(ms);
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>  
>      if (ms->possible_cpus) {
>          assert(ms->possible_cpus->len == max_cpus);
> @@ -2573,8 +2574,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>          ms->possible_cpus->cpus[n].type = ms->cpu_type;
>          ms->possible_cpus->cpus[n].arch_id =
>              virt_cpu_mp_affinity(vms, n);
> +
> +        assert(!mc->smp_props.dies_supported);
> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> +        ms->possible_cpus->cpus[n].props.socket_id =
> +            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
> +        ms->possible_cpus->cpus[n].props.cluster_id =
> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> +        ms->possible_cpus->cpus[n].props.core_id =
> +            (n / ms->smp.threads) % ms->smp.cores;
>          ms->possible_cpus->cpus[n].props.has_thread_id = true;
> -        ms->possible_cpus->cpus[n].props.thread_id = n;
> +        ms->possible_cpus->cpus[n].props.thread_id =
> +            n % ms->smp.threads;
>      }
>      return ms->possible_cpus;
>  }


